local gate = {}

gate.bertch =
    {
    modbusstep = 0,
    modbusdelay = get_millisec(),
    modbuscycle = 200,
    increment = 0,
    lifebit = 0,
    }

function gate:Init()
    if G_PAC_INFO():is_emulator() then
        self.bertch.mc = modbus_client( 151, '10.0.16.100', 502, 300 )
    else
        self.bertch.mc = modbus_client( 151, '10.216.100.100', 502, 300 )
    end
end

function gate:Evaluate()
    if not G_PAC_INFO():is_emulator() then
        self:Exchange( self.bertch.mc, self.bertch )
    end
end

function gate:Exchange( MC, obj )
    if obj.modbusstep == 0 then
        MC:set_station( 1 )
        obj.modbusstep = 1
    elseif obj.modbusstep == 1 then
        --Чтение значений
        if MC:async_read_holding_registers( 90, 21 ) == 1 then
            __BERTSCH_MOZ_GW1DI1:set_state( MC:get_int2( 0 ) )
            __BERTSCH_MOZ_GW1DI11:set_state( MC:get_int2( 1 ) )
            __BERTSCH_MOZ_GW1DI12:set_state( MC:get_int2( 2 ) )
            __BERTSCH_MOZ_GW1DI13:set_state( MC:get_int2( 3 ) )
            __BERTSCH_MOZ_GW1DI14:set_state( MC:get_int2( 4 ) )
            __BERTSCH_MOZ_GW1DI21:set_state( MC:get_int2( 5 ) )
            __BERTSCH_MOZ_GW1DI31:set_state( MC:get_int2( 6 ) )
            __BERTSCH_MOZ_GW1DI32:set_state( MC:get_int2( 7 ) )
            __BERTSCH_MOZ_GW1DI33:set_state( MC:get_int2( 8 ) )
            __BERTSCH_MOZ_GW1DI34:set_state( MC:get_int2( 9 ) )
            __BERTSCH_MOZ_GW1DI41:set_state( MC:get_int2( 10 ) )
            __BERTSCH_MOZ_GW1DI51:set_state( MC:get_int2( 11 ) )
            __BERTSCH_MOZ_GW1DI52:set_state( MC:get_int2( 12 ) )
            __BERTSCH_MOZ_GW1DI61:set_state( MC:get_int2( 13 ) )
            __BERTSCH_MOZ_GW1DI72:set_state( MC:get_int2( 14 ) )
            __BERTSCH_MOZ_GW1AI11:set_value( MC:get_float( 15 ) )
            __BERTSCH_MOZ_GW1AI31:set_value( MC:get_float( 17 ) )
            __BERTSCH_MOZ_GW1AI51:set_value( MC:get_float( 19 ) )

            obj.modbusstep = 2
            --Подготовка буфера для записи.
            MC:zero_output_buff()
            MC:set_int2( 0, BERTSCH_MOZ_GW1DO1:get_state() )
            MC:set_int2( 1, BERTSCH_MOZ_GW1DO12:get_state() )
            MC:set_int2( 2, BERTSCH_MOZ_GW1DO13:get_state() )
            MC:set_int2( 3, BERTSCH_MOZ_GW1DO14:get_state() )
            MC:set_int2( 4, BERTSCH_MOZ_GW1DO21:get_state() )
            MC:set_int2( 5, BERTSCH_MOZ_GW1DO32:get_state() )
            MC:set_int2( 6, BERTSCH_MOZ_GW1DO33:get_state() )
            MC:set_int2( 7, BERTSCH_MOZ_GW1DO34:get_state() )
            MC:set_int2( 8, BERTSCH_MOZ_GW1DO42:get_state() )
            MC:set_int2( 9, BERTSCH_MOZ_GW1DO43:get_state() )
            MC:set_int2( 10, BERTSCH_MOZ_GW1DO44:get_state() )
            MC:set_int2( 11, BERTSCH_MOZ_GW1DO52:get_state() )
            MC:set_int2( 12, BERTSCH_MOZ_GW1DO53:get_state() )
            MC:set_int2( 13, BERTSCH_MOZ_GW1DO61:get_state() )
            MC:set_int2( 14, BERTSCH_MOZ_GW1DO71:get_state() )
            MC:set_float( 15, BERTSCH_MOZ_GW1AO11:get_value() )
            MC:set_float( 17, BERTSCH_MOZ_GW1AO12:get_value() )
            MC:set_float( 19, BERTSCH_MOZ_GW1AO31:get_value() )
            MC:set_float( 21, BERTSCH_MOZ_GW1AO32:get_value() )
            MC:set_float( 23, BERTSCH_MOZ_GW1AO52:get_value() )
            MC:set_int2( 25, BERTSCH_MOZ_GW1AO13:get_value() )
            MC:set_int2( 26, BERTSCH_MOZ_GW1AO33:get_value() )
        end
    elseif obj.modbusstep == 2 then
        if MC:async_write_multiply_registers( 32120, 28 ) == 1 then
            obj.modbusstep = 10
        end
    elseif obj.modbusstep == 10 then
        if get_delta_millisec( obj.modbusdelay ) > obj.modbuscycle then
            obj.modbusstep = 1
            obj.modbusdelay = get_millisec()
            obj.increment = obj.increment + 1
            if obj.increment > 10000 then
                obj.increment = 1
            end
        end
    end
end

return gate