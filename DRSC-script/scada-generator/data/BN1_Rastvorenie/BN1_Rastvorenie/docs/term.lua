local Aggregate = require( "aggregate" )

--Функциональность технологического агрегата - Теплообменник.
term = {}
term = Aggregate:new()
-- -----------------------------------------------------------------------------
-- Term (Описание теплообменника)
-- -----------------------------------------------------------------------------
function term:init()
    self.HEATING = self.HEATING or {}
    self.COOLING = self.COOLING or {}

    self.operations =
        {
        HEATING = 1,
        COOLING = 2,
        }

    self.steps =
        {
        HEATING =
            {
            RUN =
                {
                WAITING = 1,
                WATER_ADD = 2,
                STARTING = 3,
                HEATING = 4,
                },
            },
        COOLING =
            {
            RUN =
                {
                HOT_WATER_PUSHING = 1,
                SWITCHING_OFF_SUPPLY_VALVE = 2,
                WAITING = 3,
                --Включение клапанов на возврате = 4,
                COOLING = 5,
                },
            },
        }

    self.VC1 = VC( 'HEAT_EXCR'..self.n..'VC1' )         --Регулирующий пара
    self.V1 = V( 'HEAT_EXCR'..self.n..'V1' )            --Отсекающий пара
    self.VC2 = VC( 'HEAT_EXCR'..self.n..'VC2' )         --Регулирующий лёд воды
    self.V2 = V( 'HEAT_EXCR'..self.n..'V2' )            --Отсекающий лёд воды

    self.TE1 = TE( 'HEAT_EXCR'..self.n..'TE1' )         --Температура контура гор. воды
    self.TE2 = TE( 'HEAT_EXCR'..self.n..'TE2' )         --Температура контура на выходе
    self.TE3 = TE( 'HEAT_EXCR'..self.n..'TE3' )         --Температура продукта на выходе
    self.PT1 = PT( 'HEAT_EXCR'..self.n..'PT1' )         --Давление в контуре гор. воды

    self.signal_column = HLA( 'MCC1HLA1' )

    Aggregate.init( self )
end

function term:evaluate_heating( m )
    local par = self.par_float
    local PAR = self.PAR_FLOAT
    local oper_mngr = self:get_modes_manager()
    local oper_state = self:get_operation_state( m )

    if oper_state == operation.RUN then
        local oper = oper_mngr[ m ]
        local step = oper:active_step()
        local min_PT = par[ PAR.PT_TASK_MIN ]
        local min_FE = par[ PAR.MIN_FE_HEAT ]

        if self.PT1:get_value() < min_PT then
            if not oper:is_active_extra_step( self.steps.HEATING.RUN.WATER_ADD ) then
                oper:on_extra_step( self.steps.HEATING.RUN.WATER_ADD )
                self.PT_alarm_timer = get_millisec()
            else
                if get_delta_millisec( self.PT_alarm_timer ) > par[ PAR.PT_WAITING_T ] * constants.SEC_TO_MSEC then
                self:set_mode( m, operation.PAUSE )
                self:set_err_msg( "отсутствует давление в контуре горячей воды", m,
                    constants.NONE, tech_object.ERR_ALARM )
                end
            end
        elseif oper:is_active_extra_step( self.steps.HEATING.RUN.WATER_ADD ) then
            if self.PT1:get_value() >= par[ PAR.PT_TASK ] then
                oper:off_extra_step( self.steps.HEATING.RUN.WATER_ADD )
            end
        end

        if self.line_circ.product_CTR:get_flow() < min_FE or
            self.TE1:get_value() > par[ PAR.WATER_TEMPERATURE ] or self.VC1:get_value() < 2 or
                self.PT1:get_value() < min_PT then
            self.V1:instant_off()
        end

        if step == self.steps.HEATING.RUN.WAITING then
            if self.line_circ.line_ready and
                self.line_circ.product_CTR:get_flow() > min_FE then
                oper:to_step( self.steps.HEATING.RUN.STARTING )
            end
        end
    end
end

function term:evaluate_cooling( m )
    local par = self.par_float
    local PAR = self.PAR_FLOAT
    local oper_mngr = self:get_modes_manager()
    local oper_state = self:get_operation_state( m )

    if oper_state == operation.RUN then
        local oper = oper_mngr[ m ]
        local step = oper:active_step()

        if step == self.steps.COOLING.RUN.HOT_WATER_PUSHING then
            local low = par[ PAR.FINISH_COLD_WATER_PUSHING_TE ]
            if self.TE2:get_value() < low then
                oper:to_step( self.steps.COOLING.RUN.SWITCHING_OFF_SUPPLY_VALVE )
            end

        elseif step == self.steps.COOLING.RUN.WAITING then
            if self.line_circ.line_ready and
                self.line_circ.product_CTR:get_flow() > par[ PAR.MIN_FE_HEAT ] then
                oper:to_next_step()
            end
        end
    end
end

function term:evaluate()
    Aggregate.evaluate( self )

    local alarm_temperature = 95
    if self.TE1:get_value() > alarm_temperature and self.TE1:get_state() >= 0 then
        if not self.alarm_temperature then
            self.alarm_temperature = true
            self:set_err_msg( "Высокая температура в контуре горячей воды!", constants.NONE,
                constants.NONE, tech_object.ERR_ALARM )
        end
    elseif self.alarm_temperature then
        self.alarm_temperature = false
    end

    for i = 1, self:get_modes_count() do
        if self:get_mode( i ) == operation.RUN then
            if self.alarm_temperature then
                self.V1:instant_off()
                self.VC1:set_value( 0 )
                self:set_mode( i, operation.PAUSE )
            end

            if i == self.operations.COOLING then
                self:evaluate_cooling( i )              --Охлаждение.
            elseif i == self.operations.HEATING then
                self:evaluate_heating( i )              --Нагрев.
            end

            if self.a_mode ~= i then
                self.a_mode = i
            end
            return
        end
    end
    if self.a_mode then
        self.a_mode = false
    end
end

function term:final_mode( m )
    if m == self.operations.HEATING then
        self.VC1:set_value( 0 )
    elseif m == self.operations.COOLING then
        self.VC2:set_value( 0 )
    end
end

function term:on_start( m )
    if m == self.operations.HEATING then
        self.PT_alarm_timer = get_millisec()
    end
end