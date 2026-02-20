--version  = 1
-- ----------------------------------------------------------------------------
local function GetDeviceState( state )
    if state < 0 then
        return 2
    else
        return state
    end

    return state
end
-- ----------------------------------------------------------------------------
local function GetValveState( state )

    if state == 0 or state == 10 or state == 20 or state == 30 then
        return 0
    end

    if state == 1 or state == 11 or state == 21 or state == 31 then
        return 1
    end

    if state == -3 or state == -1 or state == -13 then
        return 2
    end

    if state == -2 or state == -12 then
        return 3
    end

    return state
end
-- ----------------------------------------------------------------------------
local function GetMixValveState( state )

    if state == 0 or state == 10 or state == 20 or state == 30 then
        return 0
    end

    if state == 1 or state == 11 or state == 21 or state == 31 then
        return 1
    end

    if state == 2 or state == 22 or state == 32 then
        return 2
    end

    if state == 3 or state == 23 or state == 33  then
        return 3
    end

    if state == -3 or state == -1 or state == -13 then
        return 5
    end

    if state == -2 or state == -12 then
        return 6
    end

    return state
end



-- ----------------------------------------------------------------------------
function read_coils( n, start_idx, count )
    local res = {}

   if n == 201 then
        for coil_n = start_idx, start_idx + count, 1 do

            --  По 1000 адресов на объект начиная с гребенки
            local obj_idx   = ( ( coil_n - ( coil_n % 1000 ) )/ 1000 )
            local elem_idx  = coil_n % 1000

            res[ #res + 1 ] = 0 --Добавляем новый элемент.
            --  Режимы  --
            if elem_idx >= 1 and elem_idx <= 30 then
            	if obj_idx < #objs then
                	if elem_idx <= objs[obj_idx]:get_modes_count() then
                    	res[ #res ] = objs[obj_idx]:get_mode( elem_idx )
                	end
                end
            end
        end     --  for coil_n ...
    end     --  if n >= 1 and n <= 16 then

    return res
end

function read_holding_registers( n, start_idx, count )
    local res = {}

--  res[ #res - 1 ] = тип переменной
--      1 - int     1x2b = 2b
--      2 - float   2x2b = 4b
--      3 - date    4x2b = 8b
--      4 - string  nx2b = mb
--      5 - int     2x2b = 4b

    -- Обмен с панелью
    if n == 201 or n == 202 then --Режимы
        for coil_n = start_idx, start_idx + count, 1 do

            --  По 1000 адресов на объект начиная с гребенки
            local obj_idx   = ( ( coil_n - ( coil_n % 1000 ) )/ 1000 )
            local elem_idx  = coil_n % 1000

            res[ #res + 1 ] = 0 --Добавляем новый элемент.
            res[ #res + 1 ] = 0

            if elem_idx >= 1 and elem_idx <= 30 then
                if obj_idx < #objs then
                    if elem_idx <= objs[obj_idx]:get_modes_count() then
                        res[ #res - 1] = 1
                        res[ #res ] = objs[obj_idx]:get_operation_state( elem_idx )
                    end
                end
            end
        end
        return res
    elseif n == 203 then --par_float
        for coil_n = start_idx, start_idx + count, 1 do

            local obj_idx   = ( ( coil_n - ( coil_n % 1000 ) )/ 1000 )
            local elem_idx  = coil_n % 1000

            res[ #res + 1 ] = 0 --Добавляем новый элемент.
            res[ #res + 1 ] = 0

            if elem_idx % 2 == 0 then
                if obj_idx < #objs then
                    local par_number = elem_idx / 2
                    if objs[obj_idx].params_float_count >= par_number then
                        res[ #res - 1] = 2
                        res[ #res ] = objs[obj_idx].par_float[par_number]
                    end
                end
            end
        end
        return res        
    elseif n == 205 then --дискретные устройства
       for coil_n = start_idx, start_idx + count, 1 do
            res[ #res + 1 ] = 0 --Добавляем новый элемент.
            res[ #res + 1 ] = 0
            if dev_discrete[coil_n] ~= nil then
                res[ #res - 1] = 1
                res[ #res ] = GetValveState(dev_discrete[coil_n]:get_state())
            end
        end
        return res
    elseif n == 206 then --аналоговые устройства
       for coil_n = start_idx, start_idx + count, 1 do
            res[ #res + 1 ] = 0 --Добавляем новый элемент.
            res[ #res + 1 ] = 0
            if dev_analog[coil_n] ~= nil then
                res[ #res - 1] = 2
                res[ #res ] = dev_analog[coil_n]:get_value()
            end
        end
        return res
    elseif n == 207 then --расход
       for coil_n = start_idx, start_idx + count, 1 do
            res[ #res + 1 ] = 0 --Добавляем новый элемент.
            res[ #res + 1 ] = 0
            if dev_flow[coil_n] ~= nil then
                res[ #res - 1] = 2
                res[ #res ] = dev_flow[coil_n]:get_flow()
            end
        end
        return res
    elseif n == 208 then --счетчики
       for coil_n = start_idx, start_idx + count, 1 do
            res[ #res + 1 ] = 0 --Добавляем новый элемент.
            res[ #res + 1 ] = 0
            if dev_counter[coil_n] ~= nil then
                res[ #res - 1] = 5
                res[ #res ] = dev_counter[coil_n]:get_quantity()
            end
        end
        return res
	elseif n >= 220 then
		return read_hr2(n, start_idx, count)
	end
end


function write_coils( n, coil_n, value )

    if n >= 201 and n <= 201 then

        --  По 1000 адресов на объект
        local obj_idx   = ( ( coil_n - ( coil_n % 1000 ) )/ 1000 )
        local elem_idx  = coil_n % 1000
        --  Режимы  --
        if elem_idx >= 1 and elem_idx <= 30 then
        	if obj_idx < #objs then
            	if elem_idx <= objs[obj_idx]:get_modes_count() then
                	objs[obj_idx]:set_mode( elem_idx, value )
            	end
            end
        end
    end
end


function write_holding_registers( n, start_idx, count, buff )
	if n == 201 then --режимы с условной записью
		local obj_idx   = ( ( start_idx - ( start_idx % 1000 ) )/ 1000 )
		local elem_idx  = start_idx % 1000
        if elem_idx >= 1 and elem_idx <= 30 then
            if obj_idx < #objs then
                if elem_idx <= objs[obj_idx]:get_modes_count() then
                    local mode_to_set = ModbusServ:UnpackInt16(buff, 0)
                    local my_mode_to_set = mode_to_set
                    if mode_to_set ~= 1 then
                        my_mode_to_set = 0
                    end
                    objs[obj_idx]:set_mode( elem_idx, my_mode_to_set )
                end
            end
        end
    elseif n == 202 then --режимы с прямой записью
        local obj_idx   = ( ( start_idx - ( start_idx % 1000 ) )/ 1000 )
        local elem_idx  = start_idx % 1000
        if elem_idx >= 1 and elem_idx <= 30 then
            if obj_idx < #objs then
                if elem_idx <= objs[obj_idx]:get_modes_count() then
                    local mode_to_set = ModbusServ:UnpackInt16(buff, 0)
                    objs[obj_idx]:set_mode( elem_idx, mode_to_set )
                end
            end
        end
    elseif n == 203 then --par_float
        local obj_idx   = ( ( start_idx - ( start_idx % 1000 ) )/ 1000 )
        local elem_idx  = start_idx % 1000
        if elem_idx % 2 == 0 then
            if obj_idx < #objs then
                local par_number = elem_idx / 2
                if objs[obj_idx].params_float_count >= par_number then
                    objs[obj_idx].par_float[par_number] = ModbusServ:UnpackFloat(buff, 0)
                end
            end
        end
    elseif n == 205 then --дискретные устройства
        if dev_discrete[start_idx] ~= nil then
            local state_to_set = ModbusServ:UnpackInt16(buff, 0)
            if state_to_set > 1 then
                state_to_set = 0
            end
            dev_discrete[start_idx]:set_state(state_to_set)
        end
    elseif n == 206 then --аналоговые устройства
        if dev_analog[start_idx] ~= nil then
            local value_to_set = ModbusServ:UnpackFloat(buff, 0)
            dev_analog[start_idx]:set_value(value_to_set)
        end
    elseif n == 208 then --сброс счетчика
        if dev_counter[start_idx] ~= nil then
            dev_counter[start_idx]:reset()
        end
	elseif n >= 220 then --межконтроллерное
    	write_hr2( n, start_idx, count, buff)
    end    
end
