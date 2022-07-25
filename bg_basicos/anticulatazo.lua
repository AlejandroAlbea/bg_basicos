local sleep = 2000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(sleep)
        bl4ck = false
        DisableControlAction(1, 140, true)
        if IsPlayerFreeAiming(PlayerId()) then
			bl4ck = true
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
		if bl4ck then
            sleep = 7
        elseif not bl4ck then
            sleep = 2000
        end	
    end
end)