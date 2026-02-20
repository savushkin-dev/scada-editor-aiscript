local gate = {}

--MG1
gate.alpma1 =
{
    mc = nil,
    modbusstep = 0,
    modbusdelay = get_millisec(),
    modbuscycle = 200,
    increment = 0,
}

gate.alpma2 =
{
    mc = nil,
    modbusstep = 0,
    modbusdelay = get_millisec(),
    modbuscycle = 200,
    increment = 0,
}


function gate:Init()
    if G_PAC_INFO():is_emulator() then
        self.alpma1.mc = modbus_client( 151, '127.0.0.1', 502, 300 )
        self.alpma2.mc = modbus_client( 152, '127.0.0.1', 502, 300 )
    else
        self.alpma1.mc = modbus_client( 151, '10.216.99.166', 502, 300 )
        self.alpma2.mc = modbus_client( 152, '10.216.99.166', 502, 300 )
    end
end

function gate:get_float(MC, addr)
	MC:set_byte(100, MC:reverse(MC:get_byte(addr + 2)))
	MC:set_byte(101, MC:reverse(MC:get_byte(addr + 3)))
	MC:set_byte(102, MC:reverse(MC:get_byte(addr)))
	MC:set_byte(103, MC:reverse(MC:get_byte(addr + 1)))
	return MC:get_float(52)
end

function gate:set_float(MC, addr, toset)
	MC:set_float(48, toset)
    MC:set_byte(addr, MC:reverse(MC:get_byte(102)))
	MC:set_byte(addr + 1, MC:reverse(MC:get_byte(103)))
    MC:set_byte(addr + 2, MC:reverse(MC:get_byte(100)))
    MC:set_byte(addr + 3, MC:reverse(MC:get_byte(101)))
end

function gate:get_int4(MC, addr)
	MC:set_byte(100, MC:reverse(MC:get_byte(addr + 2)))
	MC:set_byte(101, MC:reverse(MC:get_byte(addr + 3)))
	MC:set_byte(102, MC:reverse(MC:get_byte(addr)))
	MC:set_byte(103, MC:reverse(MC:get_byte(addr + 1)))
	return MC:get_int4(52)
end

function gate:set_int4(MC, addr, toset)
	MC:set_int4(48, toset)
    MC:set_byte(addr, MC:reverse(MC:get_byte(102)))
	MC:set_byte(addr + 1, MC:reverse(MC:get_byte(103)))
    MC:set_byte(addr + 2, MC:reverse(MC:get_byte(100)))
    MC:set_byte(addr + 3, MC:reverse(MC:get_byte(101)))
end

function gate:set_int2(MC, addr, toset)
	MC:set_int2(48, toset)
    MC:set_byte(addr, MC:reverse(MC:get_byte(100)))
    MC:set_byte(addr + 1, MC:reverse(MC:get_byte(101)))
end

function gate:get_int2(MC, addr)
	MC:set_byte(100, MC:reverse(MC:get_byte(addr)))
	MC:set_byte(101, MC:reverse(MC:get_byte(addr + 1)))
	return MC:get_int2(52)
end

function gate:get_bit(MC, addrbyte, addrbit)
	return MC:get_bit(addrbyte * 8 + 7 - addrbit)
end

function gate:set_bit(MC, addrbyte, addrbit, toset)
	MC:set_bit(addrbyte * 8 + 7 - addrbit, toset)
end

function gate:Evaluate()
    if G_PAC_INFO():is_emulator() == false then
        self:Exchange1(self.alpma1.mc, self.alpma1)
        self:Exchange2(self.alpma2.mc, self.alpma2)
    end
end


function gate:Exchange1( MC, obj )
    if obj.modbusstep == 0 then
        MC:set_station(1)
        obj.modbusstep = 1
    elseif obj.modbusstep == 1 then
        --Чтение значений
        if 1 == MC:async_read_coils( 1500, 128 ) then      --читаем 128 бит адреса A3100.0-A3115.7
        	__ALPMAGW5DI1:set_state(self:get_bit(MC, 0, 0))

        	__ALPMAGW5DI480511:set_state(self:get_bit(MC, 0, 3))

            __ALPMAGW5DI482011:set_state(self:get_bit(MC, 1, 0))
            __ALPMAGW5DI482012:set_state(self:get_bit(MC, 1, 1))
            __ALPMAGW5DI482013:set_state(self:get_bit(MC, 1, 2))

            __ALPMAGW5DI483511:set_state(self:get_bit(MC, 1, 5))

			__ALPMAGW5DI484015:set_state(self:get_bit(MC, 1, 7))
            __ALPMAGW5DI484011:set_state(self:get_bit(MC, 2, 0))
            __ALPMAGW5DI484012:set_state(self:get_bit(MC, 2, 1))

            __ALPMAGW5DI487011:set_state(self:get_bit(MC, 2, 4))
            __ALPMAGW5DI487012:set_state(self:get_bit(MC, 2, 5))
            __ALPMAGW5DI487511:set_state(self:get_bit(MC, 2, 6))
            __ALPMAGW5DI487512:set_state(self:get_bit(MC, 2, 7))
            __ALPMAGW5DI488511:set_state(self:get_bit(MC, 3, 0))
            __ALPMAGW5DI488512:set_state(self:get_bit(MC, 3, 1))
            __ALPMAGW5DI488513:set_state(self:get_bit(MC, 3, 2))
            __ALPMAGW5DI487014:set_state(self:get_bit(MC, 3, 3))
            __ALPMAGW5DI487514:set_state(self:get_bit(MC, 3, 4))
            __ALPMAGW5DI488514:set_state(self:get_bit(MC, 3, 5))


            __ALPMAGW5DI480510:set_state(self:get_bit(MC, 4, 0))
            __ALPMAGW5DI482010:set_state(self:get_bit(MC, 4, 1))
            __ALPMAGW5DI483510:set_state(self:get_bit(MC, 4, 2))
            __ALPMAGW5DI484010:set_state(self:get_bit(MC, 4, 3))
            __ALPMAGW5DI485010:set_state(self:get_bit(MC, 4, 4))
            __ALPMAGW5DI487010:set_state(self:get_bit(MC, 4, 5))
            __ALPMAGW5DI487510:set_state(self:get_bit(MC, 4, 6))
            __ALPMAGW5DI488510:set_state(self:get_bit(MC, 4, 7))


            __ALPMAGW5DI482014:set_state(self:get_bit(MC, 5, 2))
            __ALPMAGW5DI483514:set_state(self:get_bit(MC, 5, 3))
            __ALPMAGW5DI484014:set_state(self:get_bit(MC, 5, 4))
            __ALPMAGW5DI485014:set_state(self:get_bit(MC, 5, 5))

            __ALPMAGW5DI479012:set_state(self:get_bit(MC, 5, 7))
            __ALPMAGW5DI479011:set_state(self:get_bit(MC, 6, 0))
            __ALPMAGW5DI479111:set_state(self:get_bit(MC, 6, 1))
            __ALPMAGW5DI485011:set_state(self:get_bit(MC, 6, 2))

            __ALPMAGW5DI488516:set_state(self:get_bit(MC, 7, 7))
            __ALPMAGW5AI484011:set_value(self:get_float(MC, 8))
            __ALPMAGW5AI488513:set_value(self:get_float(MC, 12))

            obj.modbusstep = 2
        end
    elseif obj.modbusstep == 2 then
        if 1 == MC:async_read_coils( 1700, 96 ) then      --читаем 96 бит адреса A3116.0-A3127.7
           __ALPMAGW5AI487011:set_value(self:get_float(MC, 0))
           __ALPMAGW5AI487511:set_value(self:get_float(MC, 4))
           __ALPMAGW5AI488511:set_value(self:get_float(MC, 8))

           obj.modbusstep = 3
       end
    elseif obj.modbusstep == 3 then
        if 1 == MC:async_read_coils( 1900, 128 ) then      --читаем 128 бит адреса A3132.0-A3146.7
           __ALPMAGW5AI480512:set_value(self:get_int2(MC, 0))
           __ALPMAGW5AI482012:set_value(self:get_int2(MC, 2))
           __ALPMAGW5AI483512:set_value(self:get_int2(MC, 4))
           __ALPMAGW5AI484012:set_value(self:get_int2(MC, 6))
           __ALPMAGW5AI485012:set_value(self:get_int2(MC, 8))
           __ALPMAGW5AI487012:set_value(self:get_int2(MC, 10))
           __ALPMAGW5AI487512:set_value(self:get_int2(MC, 12))
           __ALPMAGW5AI488512:set_value(self:get_int2(MC, 14))
 		   --Подготовка буфера для записи.
           MC:zero_output_buff()
           self:set_bit(MC, 0, 0, ALPMAGW5DO1:get_state())

           self:set_bit(MC, 0, 3, ALPMAGW5DO480511:get_state())

           self:set_bit(MC, 1, 0, ALPMAGW5DO482011:get_state())
           self:set_bit(MC, 1, 1, ALPMAGW5DO482012:get_state())
           self:set_bit(MC, 1, 2, ALPMAGW5DO482013:get_state())

           self:set_bit(MC, 1, 5, ALPMAGW5DO483511:get_state())

           self:set_bit(MC, 2, 0, ALPMAGW5DO484011:get_state())
           self:set_bit(MC, 2, 1, ALPMAGW5DO484012:get_state())
           self:set_bit(MC, 2, 2, ALPMAGW5DO487010:get_state())
           self:set_bit(MC, 2, 3, ALPMAGW5DO487510:get_state())
           self:set_bit(MC, 2, 4, ALPMAGW5DO487011:get_state())
           self:set_bit(MC, 2, 5, ALPMAGW5DO487012:get_state())
           self:set_bit(MC, 2, 6, ALPMAGW5DO487511:get_state())
           self:set_bit(MC, 2, 7, ALPMAGW5DO487512:get_state())
           self:set_bit(MC, 3, 0, ALPMAGW5DO488511:get_state())
           self:set_bit(MC, 3, 1, ALPMAGW5DO488512:get_state())
           self:set_bit(MC, 3, 2, ALPMAGW5DO488513:get_state())
           self:set_bit(MC, 3, 3, ALPMAGW5DO487014:get_state())
           self:set_bit(MC, 3, 4, ALPMAGW5DO487514:get_state())
           self:set_bit(MC, 3, 5, ALPMAGW5DO488514:get_state())

           self:set_bit(MC, 4, 0, ALPMAGW5DO482014:get_state())
           self:set_bit(MC, 4, 1, ALPMAGW5DO483514:get_state())
           self:set_bit(MC, 4, 2, ALPMAGW5DO484014:get_state())
           self:set_bit(MC, 4, 3, ALPMAGW5DO485014:get_state())

           self:set_bit(MC, 4, 5, ALPMAGW5DO479012:get_state())
           self:set_bit(MC, 4, 6, ALPMAGW5DO479011:get_state())
           self:set_bit(MC, 4, 7, ALPMAGW5DO479111:get_state())
           self:set_bit(MC, 5, 0, ALPMAGW5DO485011:get_state())



           self:set_float(MC, 8, ALPMAGW5AO484011:get_value())

            obj.modbusstep = 4
        end
    elseif obj.modbusstep == 4 then
        if 1 == MC:async_force_multiply_coils( 100, 96 ) then      --пишем 96 бит адреса E3100.0-E3111.0
           obj.modbusstep = 5
           --Подготовка буфера для записи.
           MC:zero_output_buff()
           self:set_float(MC, 0, ALPMAGW5AO488511:get_value())
           self:set_float(MC, 4, ALPMAGW5AO487011:get_value())
           self:set_float(MC, 8, ALPMAGW5AO487511:get_value())

        end
    elseif obj.modbusstep == 5 then
        if 1 == MC:async_force_multiply_coils( 300, 96) then  --пишем 96 бит адреса E3116.0-E3127.7
            obj.modbusstep = 10
        end
    elseif obj.modbusstep == 10 then
        if get_delta_millisec(obj.modbusdelay) > obj.modbuscycle then
            obj.modbusstep = 0
            obj.modbusdelay = get_millisec()
             obj.increment = obj.increment + 1
            if obj.increment > 10000 then
              obj.increment = 0
            end
        end
    end
end

function gate:Exchange2( MC, obj )
    if obj.modbusstep == 0 then
        MC:set_station(1)
        obj.modbusstep = 1
    elseif obj.modbusstep == 1 then
        --Чтение значений
        if 1 == MC:async_read_coils( 2116, 64 ) then      --читаем 64 бит адреса A3150.0-A3157.7
        	__ALPMAGW5DI479001:set_state(self:get_bit(MC, 0, 1))
        	__ALPMAGW5DI479002:set_state(self:get_bit(MC, 0, 2))
        	__ALPMAGW5DI479003:set_state(self:get_bit(MC, 0, 3))


           	__ALPMAGW5DI480501:set_state(self:get_bit(MC, 1, 5))
           	__ALPMAGW5DI480502:set_state(self:get_bit(MC, 1, 6))
           	__ALPMAGW5DI480503:set_state(self:get_bit(MC, 1, 7))

           	__ALPMAGW5DI482001:set_state(self:get_bit(MC, 2, 3))
           	__ALPMAGW5DI482002:set_state(self:get_bit(MC, 2, 4))
           	__ALPMAGW5DI482003:set_state(self:get_bit(MC, 2, 5))

           	__ALPMAGW5DI483501:set_state(self:get_bit(MC, 3, 1))
           	__ALPMAGW5DI483502:set_state(self:get_bit(MC, 3, 2))
           	__ALPMAGW5DI483503:set_state(self:get_bit(MC, 3, 3))

            __ALPMAGW5DI484001:set_state(self:get_bit(MC, 3, 7))
            __ALPMAGW5DI484002:set_state(self:get_bit(MC, 4, 0))
            __ALPMAGW5DI484003:set_state(self:get_bit(MC, 4, 1))

            __ALPMAGW5DI485001:set_state(self:get_bit(MC, 4, 5))
            __ALPMAGW5DI485002:set_state(self:get_bit(MC, 4, 6))
            __ALPMAGW5DI485003:set_state(self:get_bit(MC, 4, 7))

            __ALPMAGW5DI487001:set_state(self:get_bit(MC, 5, 3))
            __ALPMAGW5DI487002:set_state(self:get_bit(MC, 5, 4))
            __ALPMAGW5DI487003:set_state(self:get_bit(MC, 5, 5))

            __ALPMAGW5DI487501:set_state(self:get_bit(MC, 6, 1))
            __ALPMAGW5DI487502:set_state(self:get_bit(MC, 6, 2))
            __ALPMAGW5DI487503:set_state(self:get_bit(MC, 6, 3))

            __ALPMAGW5DI488501:set_state(self:get_bit(MC, 6, 7))
            __ALPMAGW5DI488502:set_state(self:get_bit(MC, 7, 0))
            __ALPMAGW5DI488503:set_state(self:get_bit(MC, 7, 1))
            __ALPMAGW5DI488506:set_state(self:get_bit(MC, 7, 2))
            __ALPMAGW5DI488507:set_state(self:get_bit(MC, 7, 3))

            obj.modbusstep = 2
            --Подготовка буфера для записи.
           	MC:zero_output_buff()

    		self:set_bit(MC, 0, 1, ALPMAGW5DO479001:get_state())
    		self:set_bit(MC, 0, 2, ALPMAGW5DO479002:get_state())
    		self:set_bit(MC, 0, 3, ALPMAGW5DO479003:get_state())
    		self:set_bit(MC, 0, 4, ALPMAGW5DO479004:get_state())
    		self:set_bit(MC, 0, 5, ALPMAGW5DO479005:get_state())


            self:set_bit(MC, 1, 1, ALPMAGW5DO480501:get_state())
            self:set_bit(MC, 1, 2, ALPMAGW5DO480502:get_state())
            self:set_bit(MC, 1, 3, ALPMAGW5DO480503:get_state())
            self:set_bit(MC, 1, 4, ALPMAGW5DO480504:get_state())
            self:set_bit(MC, 1, 5, ALPMAGW5DO480505:get_state())

            self:set_bit(MC, 2, 1, ALPMAGW5DO482001:get_state())
            self:set_bit(MC, 2, 2, ALPMAGW5DO482002:get_state())
            self:set_bit(MC, 2, 3, ALPMAGW5DO482003:get_state())
            self:set_bit(MC, 2, 4, ALPMAGW5DO482004:get_state())
            self:set_bit(MC, 2, 5, ALPMAGW5DO482005:get_state())

            self:set_bit(MC, 3, 1, ALPMAGW5DO483501:get_state())
            self:set_bit(MC, 3, 2, ALPMAGW5DO483502:get_state())
            self:set_bit(MC, 3, 3, ALPMAGW5DO483503:get_state())
            self:set_bit(MC, 3, 4, ALPMAGW5DO483504:get_state())
            self:set_bit(MC, 3, 5, ALPMAGW5DO483505:get_state())

            self:set_bit(MC, 4, 1, ALPMAGW5DO484001:get_state())
            self:set_bit(MC, 4, 2, ALPMAGW5DO484002:get_state())
            self:set_bit(MC, 4, 3, ALPMAGW5DO484003:get_state())
            self:set_bit(MC, 4, 4, ALPMAGW5DO484004:get_state())
            self:set_bit(MC, 4, 5, ALPMAGW5DO484005:get_state())
            self:set_bit(MC, 4, 6, ALPMAGW5DO484006:get_state())

            self:set_bit(MC, 5, 1, ALPMAGW5DO485001:get_state())
            self:set_bit(MC, 5, 2, ALPMAGW5DO485002:get_state())
            self:set_bit(MC, 5, 3, ALPMAGW5DO485003:get_state())
            self:set_bit(MC, 5, 4, ALPMAGW5DO485004:get_state())
            self:set_bit(MC, 5, 5, ALPMAGW5DO485005:get_state())

            self:set_bit(MC, 6, 1, ALPMAGW5DO487001:get_state())
            self:set_bit(MC, 6, 2, ALPMAGW5DO487002:get_state())
            self:set_bit(MC, 6, 3, ALPMAGW5DO487003:get_state())
            self:set_bit(MC, 6, 4, ALPMAGW5DO487004:get_state())
            self:set_bit(MC, 6, 5, ALPMAGW5DO487005:get_state())
            self:set_bit(MC, 6, 6, ALPMAGW5DO487006:get_state())

            self:set_bit(MC, 7, 1, ALPMAGW5DO487501:get_state())
            self:set_bit(MC, 7, 2, ALPMAGW5DO487502:get_state())
            self:set_bit(MC, 7, 3, ALPMAGW5DO487503:get_state())
            self:set_bit(MC, 7, 4, ALPMAGW5DO487504:get_state())
            self:set_bit(MC, 7, 5, ALPMAGW5DO487505:get_state())
            self:set_bit(MC, 7, 6, ALPMAGW5DO487506:get_state())

            self:set_bit(MC, 8, 1, ALPMAGW5DO488501:get_state())
            self:set_bit(MC, 8, 2, ALPMAGW5DO488502:get_state())
            self:set_bit(MC, 8, 3, ALPMAGW5DO488503:get_state())
            self:set_bit(MC, 8, 4, ALPMAGW5DO488504:get_state())
            self:set_bit(MC, 8, 5, ALPMAGW5DO488505:get_state())
            self:set_bit(MC, 8, 6, ALPMAGW5DO488506:get_state())
            self:set_bit(MC, 8, 7, ALPMAGW5DO488507:get_state())

        end
    elseif obj.modbusstep == 2 then
        if 1 == MC:async_force_multiply_coils( 716, 80 ) then      --пишем 80 бит адреса A3150.0-A3159.7
           obj.modbusstep = 10
        end
    elseif obj.modbusstep == 10 then
        if get_delta_millisec(obj.modbusdelay) > obj.modbuscycle then
            obj.modbusstep = 0
            obj.modbusdelay = get_millisec()
            obj.increment = obj.increment + 1
            if obj.increment > 10000 then
              obj.increment = 0
            end
        end
    end
end

return gate