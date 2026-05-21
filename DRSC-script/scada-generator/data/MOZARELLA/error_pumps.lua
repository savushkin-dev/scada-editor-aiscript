local pumps =
    {
    state = {}
    }

function pumps:init( master )
    self.master = master
end

function pumps:add_signal( ... )
    for i = 1, select( "#", ... ) do
        local par = select( i, ... )
        self.state[ #self.state + 1 ] =
            {
            signal = par[ 1 ],
            name = par[ 2 ],
            flag = false
            }
    end
end

function pumps:evaluate()

    -- Обработка аварийных сигналов - выдача сообщений.
    for _, val in ipairs( self.state ) do
        if val.signal:get_value() == 10 then
            if not val.flag then
                val.flag = true
                local str = 'авария насоса \''..val.name..'\''
                self.master:set_err_msg( str, 0, 0, tech_object.ERR_ALARM )
            end
        else
            val.flag = false
        end
    end
end

return pumps
