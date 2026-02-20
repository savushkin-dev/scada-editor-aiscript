cip_alarm =
{
	was_error = false,
	error_time = get_millisec(),
	siren_time = 10000,
}

cip_alarm.Modules = {}

cip_alarm.red =
{
}

cip_alarm.siren =
{
	DO100,
}

cip_alarm.iolink =
{
}

function cip_alarm:init( mdlscount )
	-- body
	local i
	for i = 1,mdlscount do
		assert(loadstring('cip_alarm.Modules['..i..'] = OBJECT'..i))()
	end
end

function cip_alarm:evaluate( ... )
	local i, m, is_alarm = false
	for i,m in ipairs(self.Modules) do
		if m.sys_tech_object.state < -1 then
			is_alarm = true
		end
	end
	if is_alarm then
		for i,red in ipairs(self.red) do
			red:on()
		end
		for i,column in pairs(self.iolink) do
			column:normal_blink_red()
		end
		if not self.was_error then
			self.was_error = true
			self.error_time = get_millisec()
		end
		if get_delta_millisec(self.error_time) > self.siren_time then
			for i,siren in pairs(self.siren) do
				siren:off()
			end
			for i,column in pairs(self.iolink) do
				column:turn_off_siren()
			end
		else
			for i,siren in pairs(self.siren) do
				siren:on()
			end
			for i,column in pairs(self.iolink) do
				column:turn_on_siren()
			end
		end
	else
		for i,red in ipairs(self.red) do
			red:off()
		end
		for i,siren in pairs(self.siren) do
			siren:off()
		end
		for i,column in pairs(self.iolink) do
			column:turn_off_red()
			column:turn_off_siren()
		end
		self.was_error = false
	end

end
