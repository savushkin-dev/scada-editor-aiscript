Modules = {}
ModuleCount = 1
cip_module = cip_module or {}

function cip_module:init_line_free()
	self.MSAReady = {}
    for num, eldev in ipairs(devices) do
        local s = string.lower(eldev.descr)
        local i = string.find(s, 'линия свободна')
        if i then
            local line, signal = eldev.name:match("LINE(%d+)DO(%d+)")
            local lineno = tonumber( line )
            local idx = 1
            if Module.MSAReady[lineno] == nil then
                Module.MSAReady[lineno] = {}
            end
            while Module.MSAReady[lineno][idx] ~= nil do
                idx = idx + 1
            end
            Module.MSAReady[lineno][idx] = DO('LINE'..line..'DO'..signal)
        end
    end
end

function  cip_module:floor( x )
    return x - x%1
end

function cip_module:init()
	self.sys_tech_object:initline()
	self.nmr = self.sys_tech_object.nmr
	self.V00 = self.sys_tech_object.V00
	self.LH = self.sys_tech_object.LH;
	self.is_selfclean = false
	self.CPPOBJ = self.sys_tech_object
	self.par = self.rt_par_float
	self.PAR = self.RT_PAR_FLOAT
	self.T = self.CPPOBJ.T
	self.V15 = loadstring('return LINE'..self.nmr..'V15')()
	Modules[self.nmr] = self
	if ModuleCount < self.nmr then
		ModuleCount = self.nmr
	end


	self.was_high_time_error = false
	self.was_low_time_error = false
	self.is_dozing = false

	if self.final_init then
		self:final_init()
	end
end

function cip_module:cip_FromObject(what, where)
    local curstep = self.sys_tech_object.curstep
    local ret = self.sys_tech_object:_FromObject(what, where)
    if ret == -12 and curstep == 7 then --если выдает ошибку "нет расхода на возврате" на 7 операции, значит V2 прошел и можно заканчивать операцию
        ret = 1
    end
    return ret
end

function cip_module:evaluate()
	if self.LH:is_active() then
		self.V00:instant_off()
	end

	local object_is_ready = false
	local idx

	if self.OBJECTReady and self.OBJECTReady[self.nmr] ~= nil then
		idx = 1
		while self.OBJECTReady[self.nmr][idx] ~= nil do
			if self.OBJECTReady[self.nmr][idx]:get_state() ~= 0 then
				object_is_ready = true
				break
			end
			idx = idx + 1
		end
	end

	if self.MSAReady[self.nmr] ~= nil then
		idx = 1
		while self.MSAReady[self.nmr][idx] ~= nil do
			if self.sys_tech_object.state == 0 and not object_is_ready then
				self.MSAReady[self.nmr][idx]:on()
			else
				self.MSAReady[self.nmr][idx]:off()
			end
			idx = idx + 1
		end
	end

	if self.sys_tech_object.state ~= 0 and self.rt_par_float[self.RT_PAR_FLOAT.P_PROGRAM] == 2048 then
		self.is_selfclean = true
	else
		self.is_selfclean = false
	end

	--Управление нейтрализацией по сигналу
	if NTRZDI1 and NTRZDI1:get_state() == 0 then
		self.sys_tech_object.no_neutro = 1
	else
		self.sys_tech_object.no_neutro = 0
	end

	if DI1 and DI1:get_state() == 1 then
		self.sys_tech_object.dont_use_water_tank = 1
	else
		self.sys_tech_object.dont_use_water_tank = 0
	end

	if self.user_evaluate then
        self:user_evaluate()
    end

end


function cip_module:cip_InitDoseRR( what, step_to_init, not_first_call )
	if not_first_call == 0 then
		Dozer.Counter:reset()
		Dozer.Counter:start()
		self.was_high_time_error = false
		self.was_low_time_error = false
		self.op76maxtime = Dozer.MaxDozeTime
	end
	Dozer.Volume = self.par[self.PAR.PTM_SANITIZER_INJECT]
	local dozespeed = self.par[self.PAR.P117_RESERV]
	if dozespeed == 0 then
		dozespeed = 50
	end
	Dozer.Pump:set_value(dozespeed)
	if Dozer.is_active == false then
		Dozer.is_active = true
	end
	local ret = self.CPPOBJ:_InitDoseRR(what, step_to_init, not_first_call)
	if self.V15 then
		self.V15:on()
	end
	if self.was_high_time_error then
		self.op76maxtime = self.op76maxtime + Dozer.MaxDozeTime / 2
		self.was_high_time_error = false
	end
	self.par[self.PAR.P_MAX_OPER_TM] = self.op76maxtime
	self.T[0]:set_countdown_time(self.par[self.PAR.P_MAX_OPER_TM] * 1000)
	self.T[0]:start()
	return ret
end

function cip_module:cip_DoseRR(what)
	local ret = self.sys_tech_object:_DoseRR(what)
	-- if not Dozer.LL:is_active() then
	-- 	return -71
	-- end
	if self.V15 then
		self.V15:on()
	end
	if self.T[0]:is_time_up() then
		self.was_high_time_error = true
		return -72
	end
	if self.was_low_time_error then
		return 1
	end
	if Dozer.Counter:get_quantity() >= self.par[self.PAR.PTM_SANITIZER_INJECT] then
		if self.T[0]:get_work_time() < Dozer.MinDozeTime * 1000 then
			self.was_low_time_error = true
			return - 73
		end
		return 1
	end


	return 0
end

function cip_module:cip_GoToStep( cur, param )
	local i, is_another_wash
	if cur == 75 or cur == 505 then 
		is_another_wash = false
		for i=1,ModuleCount do
			if Modules[i].CPPOBJ.curstep == 76 then
				is_another_wash = true
			end
		end
		if is_another_wash then
			return 505
		else
			return 76
		end 
	end
	if cur == 76 and Dozer and Dozer.Pump then
		Dozer.Pump:set_value(0)
	end
	if self.user_GoToStep then
		return self:user_GoToStep( cur, param)
	else
		return self.CPPOBJ:_GoToStep(cur, param)
	end
end

function  cip_module:cip_InitStep( step_to_init, not_first_call )
	if step_to_init == 505 then
		self.CPPOBJ:_StopDev()
		self.T[0]:reset()
		self.T[0]:start()
		return 0
	end
	if step_to_init == 77 then
		if self.V15 then
			self.V15:off()
		end
	end
	if self.user_InitStep then
		return self:user_InitStep(step_to_init, not_first_call)
	else
		local ret = self.CPPOBJ:_InitStep(step_to_init, not_first_call)
		return ret
	end
end

function  cip_module:cip_DoStep( step_to_do )
	local i
	local is_another_wash = false
	if step_to_do == 505 then
		for i=1,ModuleCount do
			if Modules[i].CPPOBJ.curstep == 76 then
				is_another_wash = true
			end	
		end
		self.par[self.PAR.P_OP_TIME_LEFT] = self:floor(self.T[0]:get_work_time() / 1000)
		if not is_another_wash then 
			return 1 
		end
		return 0
	end
	if self.user_DoStep then
		return self:user_DoStep(step_to_do)
	else
		local ret = self.CPPOBJ:_DoStep( step_to_do )
		return ret
	end
end

function  cip_module:cip_CheckErr()
	if self.CPPOBJ.curstep == 555 then
		return 0
	end
	local erret = 0
	if self.user_CheckErr then
		errret = self:user_CheckErr()
		if erret ~= 0 then
			return errret
		end
	end
	errret = self.CPPOBJ:_CheckErr()
	return errret
end

function cip_module:cip_StopDev()
	self.CPPOBJ:_StopDev()
	if self.V15 then
		self.V15:off()
	end
	if self.user_StopDev then
		self:user_StopDev()
	end
end

function cip_module:cip_ResetLinesDevicesBeforeReset()
	self.was_high_time_error = false
	self.was_low_time_error = false
	if self.user_ResetLinesDevicesBeforeReset then
        self:user_ResetLinesDevicesBeforeReset()
    end
end

function cip_module:init_params()
	if self.nmr == 1 then
		G_PAC_INFO().par[ PAC_info.P_MIX_FLIP_PERIOD ] = 180
	    G_PAC_INFO().par[ PAC_info.P_MIX_FLIP_UPPER_TIME   ] = 1000
	    G_PAC_INFO().par[ PAC_info.P_MIX_FLIP_LOWER_TIME   ] = 1000
	    G_PAC_INFO().par[PAC_info.P_V_OFF_DELAY_TIME    ] = 1500
	    G_PAC_INFO().par[ PAC_info.P_AUTO_PAUSE_OPER_ON_DEV_ERR ] = 1
	    G_PAC_INFO().par:save_all()

	    OBJECT1.sys_tech_object:set_station_par( 1, OBJECT1.system_parameters.CONCENTRATION_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par( 2, OBJECT1.system_parameters.MIN_CONC_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par( 3, OBJECT1.system_parameters.MAX_CONCENTRATION_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par( 4, OBJECT1.system_parameters.CONCENTRATION_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par( 5, OBJECT1.system_parameters.MIN_CONCENTRATION_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par( 6, OBJECT1.system_parameters.MAX_CONCENTRATION_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par( 7, OBJECT1.system_parameters.CONCENTRATION_OVERSHOOT.value)
	    OBJECT1.sys_tech_object:set_station_par( 8, OBJECT1.system_parameters.ALLOWANCE_CONCENTRATION.value)
	    OBJECT1.sys_tech_object:set_station_par( 9, OBJECT1.system_parameters.RESERVE.value)
	    OBJECT1.sys_tech_object:set_station_par(10, OBJECT1.system_parameters.FLAG_ACTIVITY.value)
	    OBJECT1.sys_tech_object:set_station_par(11, OBJECT1.system_parameters.FACTOR_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par(12, OBJECT1.system_parameters.FACTOR_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par(13, OBJECT1.system_parameters.CONCENTATION_WORK_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par(14, OBJECT1.system_parameters.CONCENTATION_WORK_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par(15, OBJECT1.system_parameters.DENSITY_WORK_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par(16, OBJECT1.system_parameters.DENSITY_WORK_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par(17, OBJECT1.system_parameters.CONCENTATION_WORK_ALKALI_POINT.value)
	    OBJECT1.sys_tech_object:set_station_par(18, OBJECT1.system_parameters.CONDUCTION_WORK_ALKALI_POINT.value)
	    OBJECT1.sys_tech_object:set_station_par(19, OBJECT1.system_parameters.CONCENTATION_WORK_ACID_POINT.value)
	    OBJECT1.sys_tech_object:set_station_par(20, OBJECT1.system_parameters.CONDUCTION_WORK_ACID_POINT.value)
	    OBJECT1.sys_tech_object:set_station_par(21, OBJECT1.system_parameters.CONDUCTION_WATER_POINT.value)
	    OBJECT1.sys_tech_object:set_station_par(22, OBJECT1.system_parameters.CONCENTRATION_MEASUREMENT_TIME.value)
	    OBJECT1.sys_tech_object:set_station_par(23, OBJECT1.system_parameters.CIRCULATION_TIME.value)
	    OBJECT1.sys_tech_object:set_station_par(24, OBJECT1.system_parameters.SOLUTION_TEMPERATURE.value)
	    OBJECT1.sys_tech_object:set_station_par(25, OBJECT1.system_parameters.VALUE_ALKALI_TANK.value)
	    OBJECT1.sys_tech_object:set_station_par(26, OBJECT1.system_parameters.VALUE_ACID_TANK.value)
	    OBJECT1.sys_tech_object:set_station_par(27, OBJECT1.system_parameters.VALUE_WATER_TANK.value)
	    OBJECT1.sys_tech_object:set_station_par(28, OBJECT1.system_parameters.PRODUCTIVITY_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par(29, OBJECT1.system_parameters.PRODUCTIVITY_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par(30, OBJECT1.system_parameters.PRODUCTIVITY_SOLUTION.value)
	    OBJECT1.sys_tech_object:set_station_par(31, OBJECT1.system_parameters.MAX_LEVEL_ALKALI.value)
	    OBJECT1.sys_tech_object:set_station_par(32, OBJECT1.system_parameters.MAX_LEVEL_ACID.value)
	    OBJECT1.sys_tech_object:set_station_par(33, OBJECT1.system_parameters.ALKALINE_SOLUTION_TYPE.value)
	    OBJECT1.sys_tech_object:set_station_par(34, OBJECT1.system_parameters.ACID_SOLUTION_TYPE.value)
	    OBJECT1.sys_tech_object:set_station_par(35, OBJECT1.system_parameters.DISINFECTION_SOLUTION_TYPE.value)

	end
end
