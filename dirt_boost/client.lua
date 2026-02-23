CreateThread(function()
    while true do
        Wait(2000) -- 2 másodpercenként frissít

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)

            if GetPedInVehicleSeat(vehicle, -1) == ped then
                local speed = GetEntitySpeed(vehicle) -- m/s
                local dirtLevel = GetVehicleDirtLevel(vehicle)

                -- Koszolódás számítás (sebesség alapján)
                local dirtIncrease = (speed * 0.5)

                -- Ha esik az eső, még jobban koszolódjon
                local rainLevel = GetRainLevel()
                if rainLevel > 0.1 then
                    dirtIncrease = dirtIncrease * 2.0
                end

                local newDirt = dirtLevel + dirtIncrease

                if newDirt > 15.0 then
                    newDirt = 15.0 -- Maximum dirt level
                end

                SetVehicleDirtLevel(vehicle, newDirt)
            end
        end
    end
end)