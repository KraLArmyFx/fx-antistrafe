local lastLeftPress = 0
local lastRightPress = 0
local strafeCount = 0
local lastStrafeTime = 0

CreateThread(function()
    while true do
        Wait(1)
        local playerPed = PlayerPedId()

        if IsPedOnFoot(playerPed) and not IsPedInAnyVehicle(playerPed, false) and not IsPedFalling(playerPed) and not IsPedRagdoll(playerPed) then
            if IsControlJustPressed(0, 34) then
                local now = GetGameTimer()
                if now - lastRightPress < Config.StrafeThreshold then
                    strafeCount = strafeCount + 1
                    lastStrafeTime = now
                end
                lastLeftPress = now
            end

            if IsControlJustPressed(0, 35) then
                local now = GetGameTimer()
                if now - lastLeftPress < Config.StrafeThreshold then
                    strafeCount = strafeCount + 1
                    lastStrafeTime = now
                end
                lastRightPress = now
            end

            if strafeCount >= Config.StrafeDetectCount and (GetGameTimer() - lastStrafeTime) <= Config.StrafeWindow then
                if Config.KickOnDetection then
                    TriggerServerEvent("fx-antistrafe:kick")
                else
                    TriggerServerEvent("fx-antistrafe:warn")
                end
                strafeCount = 0
                lastLeftPress = 0
                lastRightPress = 0
                lastStrafeTime = 0
            end
        else
            strafeCount = 0
        end
    end
end)
