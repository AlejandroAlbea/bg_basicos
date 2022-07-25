local hurt = false
local sleep = 2000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(sleep)
        bl4ck = false
        if GetEntityHealth(GetPlayerPed(-1)) <= 159 then
			bl4ck = true
            setHurt()
        elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 160 then
            setNotHurt()
        end		
		if bl4ck then
            sleep = 0
        elseif not bl4ck then
            sleep = 2000
        end	
    end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(GetPlayerPed(-1))
    ResetPedWeaponMovementClipset(GetPlayerPed(-1))
    ResetPedStrafeClipset(GetPlayerPed(-1))
end