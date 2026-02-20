Dozer = 
{
	Counter = FQT1,
	Pump = M11,
	LL = NULL,
	Volume = 0,
	state = 0,
	MaxDozeTime = 600,
	MinDozeTime = 30,
	is_active = false
}

function Dozer:evaluate()
	local i, is_wash, is_wash_active
	is_wash = false
	is_wash_active = false
	if self.is_active then
		for i=1,ModuleCount do
			if Modules[i].CPPOBJ.curstep == 76 or Modules[i].is_dozing == true then
				is_wash = true
			else
				Modules[i].V15:off()
			end
			if (Modules[i].CPPOBJ.curstep == 76 or Modules[i].is_dozing == true) and Modules[i].CPPOBJ.state > 0 and Modules[i].V15:get_state() == 1 then
				is_wash_active = true
			end
		end
		if is_wash_active then
			self.Pump:on()
		else
			self.Pump:off()
		end
		if not is_wash then
			if self.is_active then
				self.is_active = false
				self.Pump:off()
				self.Volume = 0
			end
		end
	end
end
