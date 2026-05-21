local Washing_cip = require( "washing_cip" )
local Common_functions = require( "common_functions" )
local Aggregate = require( "aggregate" )

--Функциональность технологического агрегата - Almix.
basic_almix = {}
basic_almix = Aggregate:new()
basic_almix.washing_cip = Washing_cip:new()
basic_almix.functions = Common_functions:new()
-- -----------------------------------------------------------------------------
-- Almix
-- -----------------------------------------------------------------------------
function basic_almix:init()
    self.WASHING_CIP = self.WASHING_CIP or {}
    self.WORK = self.WORK or {}

    self.operations =
        {
        WASHING_CIP = 1,
        WORK = 2,
        BLOWDOWN = 3,
        }

    self.steps =
        {
        WASHING_CIP =
            {
            RUN =
                {
                MEDIUM_CHANGE = 10,
                OBJECT_EMPTY = 11,
                DRAINAGE = 12,
                FILTER1 = 13,
                FILTER2 = 14,
                },
            },
        WORK =
            {
            RUN =
                {
                CREATING_VACUUM = 1,
                BYPASS = 2,
                FILLING = 3,
                WORK = 4,
                EMPTYING = 5,
                PUSHING = 6,
                FILTER1 = 7,
                FILTER2 = 8,
                },
            },
        BLOWDOWN =
            {
            RUN =
                {
                WORK = 1,
                },
            },
        }

    self.reset_before_wash =
        {
        self.PAR_FLOAT.V21_COUNTER,
        self.PAR_FLOAT.V22_COUNTER,
        self.PAR_FLOAT.V23_COUNTER,
        }

    self.washstate = 0               --Флаг состояния мойки.
    self.LS_down_activated_time = get_millisec()
    self.WASHING_CIP.MEDIUM_CHANGE_REQUEST = DI( 'MCA4LINE4DI4' )
    self.WASHING_CIP.DI_CIP_FREE = DI( 'MCA4LINE4DI1' )
    self.WASHING_CIP.CIP_WASH_END = DI( 'MCA4LINE4DI3' )

    self.LS_down                 = LS( 'ALMIX'..self.n..'LS1' )     --НУ
    self.LS2                     = LS( 'ALMIX'..self.n..'LS2' )     --НУ вакуум бачка
    self.hatch1             = GS( 'ALMIX' .. self.n .. 'GS1' )      --Люк
    self.HL1                = HL( 'ALMIX' .. self.n .. 'HL1' )      --Лампа
    self.PT                 = PT( 'ALMIX' .. self.n .. 'PT1' )      --Давление в Almix
    self.VC1                = VC( 'ALMIX' .. self.n .. 'VC1' )      --Регулирующий подачи в Almix
    self.WT1                = WT( 'ALMIX' .. self.n .. 'WT1' )      --Весы
    self.W_TE               = TE( 'ALMIX' .. self.n .. 'TE1' )      --Темп. воды вакуум системы
    self.FS1                = FS( 'ALMIX' .. self.n .. 'FS1' )      --Поток воды для миксера
    self.PS1                = DI( 'WATER' .. self.n .. 'DI1' )      --Реле давления воды для миксера
    self.PC                 = C( 'ALMIX' .. self.n .. 'PC1' )
    self.M1                 = M( 'ALMIX' .. self.n .. 'M1' )        --Мешалка Almix
    self.M2                 = M( 'ALMIX' .. self.n .. 'M2' )        --Насос вакуума
    self.out_pump                 = M( 'ALMIX' .. self.n .. 'M3' )        --Насос откачки
    self.V20 = V( 'ALMIX'..self.n..'V20' )                          --Клапан сброса давления в Almix
    --Клапана подачи рабочей воды для вакуума и уплотнений
    self.V101 = V( 'ALMIX'..self.n..'V101' )                        --Вода на вакуум
    self.V103 = V( 'ALMIX'..self.n..'V103' )                        --Вода на миксер
    self.V104 = V( 'ALMIX'..self.n..'V104' )                        --Вода для насоса

    self.DI_FILTER1 = DI( 'ALMIX'..self.n..'DI1' )                       --Фильтр №1 готов
    self.DI_FILTER2 = DI( 'ALMIX'..self.n..'DI2' )                       --Фильтр №2 готов

    if self.n == 1 then
        self.signal_column = CAB1HLA1
    else
        self.signal_column = CAB8HLA1
    end

    --{ № шага, клапан подачи порошка, Вибро мотор }
    self.WORK.ADD_POWDER =
        {
            { step = 10 },  --NOT USED
            {
            step = 11,
            valve = V( 'ALMIX' .. self.n .. 'V22' ),
            M = M( 'ALMIX' .. self.n .. 'M4' ),
            COUNTER = self.PAR_FLOAT.V22_COUNTER,
            },
            { step = 12 },  --NOT USED
        }

    self.out_timer  = 0
    self.vacum_timer    = 0

    self.LS_was_active = false

    self.PT_err         = false
    self.PT_err_time    = 0

    self.start_low_level_wait_time = 0

    Aggregate.init( self )
end
-- ----------------------------------------------------------------------------
--Функция включения опорожнения при выборе проталкивания в линии RA.
--Выключаются шаги добавления компонентов [1];
--Включается шаг опорожнения, задаётся давление при опорожнении и задаётся
--таймер для опорожнения.
function basic_almix:go_to_emptying( m )
    local oper = self:get_modes_manager()[ m ]

    if self:get_operation_state( m ) == operation.RUN and
        self.line_circ:get_operation_state( m ) == operation.RUN then
        self.line_circ.prev_src = -1
        self.line_circ:to_next_tank( 0 )

        for _, powder in pairs( self.WORK.ADD_POWDER ) do
            --отключаем шаг и устройства
            if oper:is_active_extra_step( powder.step ) then
                oper:off_extra_step( powder.step )
            end
            if powder.M then
                powder.M:off()
            end
            if powder.valve then
                powder.valve:instant_off()
            end
        end

        oper:to_step( self.steps.WORK.RUN.EMPTYING )
        self.par[ self.PAR_FLOAT.PT_TASK ] = self.par[ self.PAR_FLOAT.PT_EMPTYING_TASK ]
        self.out_timer = get_millisec()
    end
end
-------------------------------------------------------------------------------

function basic_almix:check_on_mode( m )
    if m == self.operations.BLOWDOWN then

    elseif not self.line_circ.line_mode_request then
        self:set_err_msg( "не включена операция линии RA"..self.line_circ.n,
                m, constants.NONE, tech_object.ERR_CANT_ON )
        return 1
    end

    if m == self.operations.WASHING_CIP then
        if self:get_mode( self.operations.WORK ) == operation.RUN then
            self:set_err_msg( "",
                m, self.operations.WORK, tech_object.ERR_CANT_ON_2_OPER )
            return 1
        end
    elseif m == self.operations.WORK then
        if self:get_mode( self.operations.WASHING_CIP ) == operation.RUN then
            self:set_err_msg( "",
                m, self.operations.WASHING_CIP, tech_object.ERR_CANT_ON_2_OPER )
            return 1
        end

        if self.WT1:get_value() > self.par[ self.PAR_FLOAT.MAX_START_WT ] or
            self.WT1:get_value() < - self.par[ self.PAR_FLOAT.MAX_START_WT ] then
            self:set_err_msg( "текущая масса " ..self.WT1:get_value() .." кг",
                m, constants.NONE, tech_object.ERR_CANT_ON )
            return 1
        end
    end

    if not self.hatch1:is_active() then
        self:set_err_msg( "открыт люк",
            m, constants.NONE, tech_object.ERR_CANT_ON )
        return 1
    end

    return 0
end
-------------------------------------------------------------------------------

function basic_almix:init_mode( m )
    self.prev_op_state = 1

    if m == self.operations.WASHING_CIP then
        self.washing_cip.init_wash( self, m )

    elseif m == self.operations.WORK then
        --self.DI_go_to_emptying:set_state( 0 )
        self.vacum_timer = get_millisec()
        self.out_timer = 0
        self.is_start_M2 = true

        for _, powder in pairs( self.WORK.ADD_POWDER ) do
            --сбрасываем таймеры
            if powder.timer then
                powder.timer = nil
            end
            powder.is_begin = true
        end

        self.par[ self.PAR_FLOAT.PT_TASK ] = self.par[ self.PAR_FLOAT.PT_WORK_TASK ]
        self.PT_err = false
        self.PT_err_time = 0
        self.PT_relief = false
        self.powder_err_PT = false

        self.LS_was_active  = false
        self.water_err      = nil
        self.LS_err         = nil
        self.WT_err         = nil
        self.FQT_err        = nil
        self.start_low_level_wait_time = 0
    elseif m == self.operations.BLOWDOWN then
        self.vacum_timer = get_millisec()
        self.par[ self.PAR_FLOAT.PT_TASK ] = self.par[ self.PAR_FLOAT.PT_BLOWDOWN ]
        self.blowdown_counter = 0
    end
end
-- ----------------------------------------------------------------------------

--Описание операции "Мойка"
function basic_almix:evaluate_wash( m )
    if self:get_operation_state( m ) == operation.RUN then
        -- Проверка превышения допустимой массы
        if self.WT1:get_value() > self.par[ self.PAR_FLOAT.MAX_WT ] then
            self:set_err_msg( "превышена максимально допустимая масса", m,
                constants.NONE, tech_object.ERR_DURING_WORK )
            self:set_mode( m, operation.PAUSE )
        end
    end

    if self.washstate == 0 then
        self.M1:off()
    end
end
-- ----------------------------------------------------------------------------

--Реализация добавления порошка
function basic_almix:evaluate_addition_of_powder( m )
    local par = self.par_float
    local PAR = self.PAR_FLOAT
    local m_mngr = self:get_modes_manager()
    local oper = m_mngr[ m ]
    local err_pt = 1000
    local PT_powder_add

    for i, powder in pairs( self.WORK.ADD_POWDER ) do
        if oper:is_active_extra_step( powder.step ) then
            if powder.M then
                powder.M:on()
            end
            if powder.valve then
                local offset_par = 3
                local valve_st = powder.valve:get_state()

                if powder.is_begin then
                    if self.PT:get_value() >= par[ PAR.PT_NO_POWDER ] then
                        oper:off_extra_step( powder.step )
                        self:set_err_msg( "не включено добавление компонентов, высокое давление",
                            m, constants.NONE, tech_object.ERR_ALARM )
                    else
                        powder.valve:on()
                        powder.timer = get_millisec()
                        powder.is_begin = false
                    end
                elseif valve_st == 1 or valve_st == 11 then
                    powder.valve:on()
                    PT_powder_add = self.PT:get_value()
                    if not powder.timer then
                        powder.timer = get_millisec()
                        par[ powder.COUNTER ] = par[ powder.COUNTER ] + 1
                    elseif get_delta_millisec( powder.timer ) >= par[ PAR.V21_OPEN_TIME + (offset_par * (i - 1)) ] then
                        powder.valve:instant_off()
                        powder.timer = nil
                    end
                    --Во время внесения не сбрасываем давление
                    self.PT_relief = false
                elseif valve_st == 0 or valve_st == 10 then
                    powder.valve:instant_off()
                    if not powder.timer then
                        powder.timer = get_millisec()
                    elseif get_delta_millisec( powder.timer ) >= par[ PAR.V21_CLOSE_TIME + (offset_par * (i - 1)) ] then
                        powder.valve:on()
                        powder.timer = nil
                    end
                end
            end
        else
            if not powder.is_begin then
                powder.is_begin = true
            end
            if powder.M then
                powder.M:off()
            end
            if powder.valve then
                powder.valve:instant_off()
            end
        end
    end

    --Описание аварий
    --Если нижний уровень неактивен заданное время, операция в паузу или отключаем добавление ингредиентов?
    if not self.LS_down:is_active() then
        if not self.LS_err then
            self.LS_err = get_millisec()
        elseif get_delta_millisec( self.LS_err ) >=
            par[ PAR.LS1_OFF_TIME ] * constants.SEC_TO_MSEC then
            self:set_err_msg( "отсутствует нижний уровень! Время ожидания сброса аварии вышло",
                m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
            self.LS_err = nil
            self:set_mode( m, operation.PAUSE )
        end
    elseif self.LS_err then
        self.LS_err = nil
    end

    --Если масса выходит за диапазон допустимых значений определённое время.
    --MAX_DOP_WT1 <---> WT_TASK
    if self.WT1:get_value() < par[ PAR.MIN_DOP_WT1 ] or
        self.WT1:get_value() > par[ PAR.MAX_DOP_WT1 ] then
        if not self.WT_err then
            self.WT_err = get_millisec()
        elseif get_delta_millisec( self.WT_err ) >=
            par[ PAR.WT1_OFF_TIME ] * constants.SEC_TO_MSEC then
            self:set_err_msg( "недопустимая масса масса в чане! Время ожидания сброса аварии вышло",
                m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
            self.WT_err = nil
            self:set_mode( m, operation.PAUSE )
        end
    elseif self.WT_err then
        self.WT_err = nil
    end

    --Если поток основы ниже минимального заданное время
    if self.line_circ.product_CTR:get_flow() < par[ PAR.MIN_ADDING_FLOW ] then
        if not self.FQT_err then
            self.FQT_err = get_millisec()
        elseif get_delta_millisec( self.FQT_err ) >= par[ PAR.FQT1_OFF_TIME ] * constants.SEC_TO_MSEC then
            self:set_err_msg( "низкий расход основы! Время ожидания сброса аварии вышло",
                m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
            self.FQT_err = nil
            self:set_mode( m, operation.PAUSE )
        end
    elseif self.FQT_err then
        self.FQT_err = nil
    end

    if PT_powder_add then
        if PT_powder_add >= par[ PAR.PT_NO_POWDER ] then
            if not self.powder_err_PT then
                self.powder_err_PT = get_millisec()
            elseif get_delta_millisec( self.powder_err_PT ) > err_pt then
                self:set_err_msg( "отключено добавление компонентов, превышено давление во время внесения",
                    m, constants.NONE, tech_object.ERR_DURING_WORK )
                self.powder_err_PT = false
                for _, powder in pairs( self.WORK.ADD_POWDER ) do
                    --сбрасываем таймер и отключаем шаг
                    if powder.timer then
                        powder.timer = nil
                    end
                    if oper:is_active_extra_step( powder.step ) then
                        oper:off_extra_step( powder.step )
                    end
                    if powder.M then
                        powder.M:off()
                    end
                    if powder.valve then
                        powder.valve:instant_off()
                    end
                end
            end
        elseif self.powder_err_PT then
            self.powder_err_PT = false
        end
    end
end
------------------------------------------------------------------------------

--Описание операции "Растворение"
function basic_almix:evaluate_work( m )
    local par = self.par_float
    local PAR = self.PAR_FLOAT
    local m_mngr = self:get_modes_manager()
    local oper = m_mngr[ m ]
    local step = oper:active_step()
    local delta_te = 10

    --Если давление выходит за диапазон допустимых значений.
    --MAX_DOP_PT <---> MIN_DOP_PT
    --Выключаем клапан V20 (для сброса) и отсчитываем время до включения паузы.
    if self.PT:get_value() <= par[ PAR.MAX_DOP_PT ] and
        self.PT:get_value() >= par[ PAR.MIN_DOP_PT ] then
        if self.PT_err then
            self.PT_err = false
        end
    else
        if not self.PT_err then
            self.PT_err = true
            self.PT_err_time = get_millisec()
        end
    end

    if self:get_operation_state( m ) == operation.RUN then
        if self.PT:get_value() < par[ PAR.PT_TASK ] - par[ PAR.D_PT_RELIEF ] then
            self.PT_relief = true
        elseif self.PT_relief then
            if self.PT:get_value() > par[ PAR.PT_TASK ] then
                self.PT_relief = false
            end
        end

        -- Создание вакуума
        if step == self.steps.WORK.RUN.CREATING_VACUUM then                         --Создание вакуума
            --Если нет уровня воды - не включаем насос
            if self.is_start_M2 then
                if not self.LS2:is_active()then
                    self.PC:off()
                    self.M2:off()
                else
                    self.is_start_M2 = false
                end
            end

            if self.PT:get_value() <= par[ PAR.PT_TASK ] then
                if self.line_circ.is_in_drainage then
                    oper:to_step( self.steps.WORK.RUN.BYPASS )
                else
                    oper:to_step( self.steps.WORK.RUN.FILLING )
                end
                --Линия в шаге ожидания
                --Инициализируем работу линии в нужные шаги
                self.line_circ:to_next_tank()

            elseif get_delta_millisec( self.vacum_timer ) >= par[ PAR.MAX_VACUM_TIME ] * constants.SEC_TO_MSEC then
                self:set_err_msg( "превышено время ожидания создания вакуума",
                    m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
                self:set_mode( m, operation.PAUSE )
            end
        elseif step == self.steps.WORK.RUN.BYPASS then                              --Заполнение в байпас
            if not self.line_circ.is_in_drainage then
                oper:to_step( self.steps.WORK.RUN.FILLING )
            end
        elseif step == self.steps.WORK.RUN.FILLING then                             --Заполнение Almix
            --Ожидаем заполнения Almix до нужной массы START_DOP_WT1.
            --Не включаем насос откачки пока не появится НУ.
            if self.LS_down:is_active() then
                if self.WT1:get_value() >= par[ PAR.START_DOP_WT1 ] then
                    oper:to_step( self.steps.WORK.RUN.WORK )
                end
                self.LS_was_active = true
            end
            --Если появился НУ, начинаем откачивать
            if not self.LS_was_active then
                self.out_pump:off()
            end
        elseif step == self.steps.WORK.RUN.WORK then                                --Растворение
            self:evaluate_addition_of_powder( m )

        elseif step == self.steps.WORK.RUN.EMPTYING then                            --Опорожнение
            -- Условие перехода в вытеснение(проталкивание линии)
            if self.WT1:get_value() <= par[ PAR.WT1_EMPTYING_OFF ] or
                basic_tank.check_low_level( self ) or
                get_delta_millisec( self.out_timer ) >= par[ PAR.MAX_OUT_TIME ] * constants.SEC_TO_MSEC then
                oper:to_step( self.steps.WORK.RUN.PUSHING )
                self.line_circ:to_next_tank( -1 )
            end
            self.VC1:set_value( 100 )
        elseif step == self.steps.WORK.RUN.PUSHING then                             --Вытеснение
            --Ожидаем завершения работы, после завершения вытеснения линия отключит работу.
        end

        if self.PT_err then
            if self.PT:get_value() > par[ PAR.MAX_DOP_PT ] then
                if get_delta_millisec( self.PT_err_time ) >= par[ PAR.MAX_PT_LOW_TIME ] * constants.SEC_TO_MSEC then
                    self:set_err_msg( "превышено давление! Время ожидания сброса аварии вышло",
                        m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
                    self.PT_err = false
                    self:set_mode( m, operation.PAUSE )
                end
            elseif self.PT:get_value() < par[ PAR.MIN_DOP_PT ] then
                if get_delta_millisec( self.PT_err_time ) >= par[ PAR.MAX_PT_UP_TIME ] * constants.SEC_TO_MSEC then
                    self:set_err_msg( "слишком низкое давление! Время ожидания сброса аварии вышло",
                        m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
                    self.PT_err = false
                    self:set_mode( m, operation.PAUSE )
                end
            end
        end

        if not self.hatch1:is_active() then
            self.hatch_err = true
            self:set_err_msg( "открыт люк",
                    m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
            self:set_mode( m, operation.PAUSE )
        end

        -- Проверка превышения допустимой массы
        if self.WT1:get_value() > par[ PAR.MAX_WT ] then
            self:set_err_msg( "превышена максимально допустимая масса", m,
                constants.NONE, tech_object.ERR_TO_FAIL_STATE )
            self:set_mode( m, operation.PAUSE )
        end

        if not self.LS2:is_active() or self.W_TE:get_value() > par[ PAR.W_TE_MAX] then
            self.V101:on()
        elseif self.LS2:is_active() and self.W_TE:get_value() < par[ PAR.W_TE_MAX] - delta_te then
            self.V101:off()
        end

        if self.PT_err or self.PT_relief then
            self.V20:instant_off()
        end

        if not self.FS1:is_active() and not self.PS1:is_active() then
            if not self.water_err then
                self.water_err = get_millisec()
            elseif get_delta_millisec( self.water_err ) > par[ PAR.W_ERR ] * constants.SEC_TO_MSEC then
                self:set_err_msg( "Возможно отсутствует вода для работы системы", m,
                    constants.NONE, tech_object.ERR_DURING_WORK )
                self.water_err = nil
            end
        else
            self.water_err = nil
        end
    elseif self:get_operation_state( m ) == operation.PAUSE then
        --Если пауза и активна авария по предельному давлению - открываем клапан сброса давления.
        if self.PT_err then
            self.V20:instant_off()
        end
    end
end

--Описание операции продувка линии порошка
function basic_almix:evaluate_blowdown( m )
    local par = self.par_float
    local PAR = self.PAR_FLOAT
    local abs_pt = 0.9
    local delta_te = 10
    local err_pt = 5000
    local valve = self.WORK.ADD_POWDER[ 2 ].valve

    if self:get_operation_state( m ) == operation.RUN then
        local m_mngr = self:get_modes_manager()
        local oper = m_mngr[ m ]
        local step = oper:active_step()
        local valve_st = valve:get_state()

        if step == self.steps.BLOWDOWN.RUN.WORK then
            if self.PT:get_value() < par[ PAR.PT_TASK ] then
                if valve_st == 0 or valve_st == 10 then
                    self.blowdown_counter = self.blowdown_counter + 1
                    self.timer_relief = get_millisec()
                    valve:on()
                end
            elseif self.PT:get_value() >= abs_pt then
                if valve_st == 1 or valve_st == 11 then
                    valve:instant_off()
                    self.vacum_timer = get_millisec()
                end

                if self.blowdown_counter >= par[ PAR.COUNT_BLOWDOWN ] then
                    self:set_err_msg( "переход к шагу дренажа", m, constants.NONE,
                        tech_object.ERR_DURING_WORK )
                    oper:to_next_step()
                end
            end

            if valve_st == 1 or valve_st == 11 then
                if self.timer_relief and get_delta_millisec( self.timer_relief ) > err_pt then
                    self:set_err_msg( "отсутствует приток воздуха при продувании",
                        m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
                    self:set_mode( m, operation.PAUSE )
                end
            elseif valve_st == 0 or valve_st == 10 then
                if get_delta_millisec( self.vacum_timer ) > par[ PAR.MAX_VACUM_TIME ] * constants.SEC_TO_MSEC then
                    self:set_err_msg( "превышено время ожидания создания вакуума",
                        m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
                    self:set_mode( m, operation.PAUSE )
                end
            end
        end

        if not self.hatch1:is_active() then
            self.hatch_err = true
            self:set_err_msg( "открыт люк",
                    m, constants.NONE, tech_object.ERR_TO_FAIL_STATE )
            self:set_mode( m, operation.PAUSE )
        end

        if not self.LS2:is_active() or self.W_TE:get_value() > par[ PAR.W_TE_MAX] then
            self.V101:on()
        elseif self.LS2:is_active() or self.W_TE:get_value() < par[ PAR.W_TE_MAX] - delta_te then
            self.V101:off()
        end

        if self.PT:get_value() < par[ PAR.MIN_DOP_PT ] then
            self.PT_relief = true
        elseif self.PT_relief then
            if self.PT:get_value() > par[ PAR.PT_TASK ] then
                self.PT_relief = false
            end
        end

        if self.PT_err or self.PT_relief then
            self.V20:instant_off()
        end
    end
end
------------------------------------------------------------------------------

function basic_almix:evaluate()
    local par = self.par_float
    local PAR = self.PAR_FLOAT

    for m = 1, self:get_modes_count() do
        if self:get_mode( m ) == operation.RUN then
            --Ограничение на задание давления из монитора
            if par[ PAR.PT_TASK ] < par[ PAR.PT_TASK_MIN ] then
                par[ PAR.PT_TASK ] = par[ PAR.PT_TASK_MIN ]
            elseif par[ PAR.PT_TASK ] > par[ PAR.PT_TASK_MAX ] then
                par[ PAR.PT_TASK ] = par[ PAR.PT_TASK_MAX ]
            end

            if m == self.operations.BLOWDOWN then
                self:evaluate_blowdown( m )
                break
            end

            --Синхронизация состояний операций линии и Almix
            local op_state = self:get_operation_state( m )
            if op_state ~= self.prev_op_state then
                self.prev_op_state = op_state

                self.line_circ:set_mode( m, op_state )
                return
            end
            local l_op_state = self.line_circ:get_operation_state( m )
            if l_op_state ~= self:get_operation_state( m ) then
                self:set_mode( m, l_op_state )
                self.prev_op_state = l_op_state
                return
            end

            if m == self.operations.WASHING_CIP then
                self:evaluate_wash( m )
                self.washing_cip.evaluate_wash( self, m, self.WASHING_CIP )
                break
            elseif m == self.operations.WORK then
                self:evaluate_work( m )
                break
            end
        end
    end

    --Вода для уплотнений при работе мешалки M1
    if self.M1:get_state() == 1 then
        self.V103:on()
    else
        self.V103:off()
    end

    --Вода для уплотнений при работе насоса M3
    if self.out_pump:get_state() == 1 then
        self.V104:on()
    else
        self.V104:off()
    end

    if not self.hatch1:is_active() and not self.hatch_err then
        self.hatch_err = true
        self.HL1:on()
        self:set_err_msg( "Открыт люк", constants.NONE,
            constants.NONE, tech_object.ERR_DURING_WORK )
    elseif self.hatch1:is_active() then
        if self.hatch_err then
            self.HL1:off()
        end
        self.hatch_err = false
    end

    Aggregate.evaluate( self )
end
------------------------------------------------------------------------------

function basic_almix:on_start( m )
    if m == self.operations.WORK then
        self.vacum_timer = get_millisec()
        self.PT_err_time = get_millisec()
        --сбрасываем таймеры
        self.LS_err         = nil
        self.WT_err         = nil
        self.FQT_err        = nil
        self.water_err      = nil
    elseif m == self.operations.BLOWDOWN then
        self.vacum_timer = get_millisec()
    end
end
------------------------------------------------------------------------------

function basic_almix:on_pause( m )
    if m == self.operations.WORK then
        local m_mngr = self:get_modes_manager()
        local oper = m_mngr[ m ]

        for _, powder in pairs( self.WORK.ADD_POWDER ) do
            --сбрасываем таймер и отключаем шаг
            if powder.timer then
                powder.timer = nil
            end
            if oper:is_active_extra_step( powder.step ) then
                oper:off_extra_step( powder.step )
            end
            if powder.M then
                powder.M:off()
            end
            if powder.valve then
                powder.valve:instant_off()
            end
        end
    end
    self.V101:off()
    self.VC1:set_value( 0 )
end
------------------------------------------------------------------------------

function basic_almix:on_stop( m )
    if self.line_circ:get_operation_state( m ) ~= operation.STOP then
        self.line_circ:set_mode( m, operation.STOP )
    end

    if m == self.operations.WORK then
        for _, powder in pairs( self.WORK.ADD_POWDER ) do
            if powder.M then
                powder.M:off()
            end
            if powder.valve then
                powder.valve:instant_off()
            end
        end
    end
end
------------------------------------------------------------------------------

function basic_almix:final_mode( m )
    if self.line_circ:get_mode( m ) == operation.RUN then
        self.line_circ:set_mode( m, operation.IDLE )
    end

    for _, powder in pairs( self.WORK.ADD_POWDER ) do
        if powder.M then
            powder.M:off()
        end
        if powder.valve then
            powder.valve:instant_off()
        end
    end
    self.V101:off()
    self.VC1:set_value( 0 )
    self.HL1:off()
end