local display = true

CreateThread(function()
    while true do
        local msec = 750
        local pedcoords = GetEntityCoords(PlayerPedId())
        local inCar = IsPedSittingInAnyVehicle(PlayerPedId())
        local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(pedcoords.x, pedcoords.y, pedcoords.z))

        if IsPedInAnyVehicle(PlayerPedId()) and IsPauseMenuActive() ~= 1 and display then
            msec = 0
            SendNUIMessage({
                inCar = inCar;
                street = streetName;
            })
        end
        Wait(msec)
    end
end)

RegisterCommand('movercompass', function()
    SetNuiFocus(true, true)

    ESX.ShowNotification('Mueve las calles donde quieras.')
end)

RegisterCommand('togglecompass', function()
    display = not display

    if not display then
        display = false
        SendNUIMessage({
            action = 'display'
        })
        ESX.ShowNotification('Has ~r~ocultado~s~ las calles.')
    else
        display = true
        SendNUIMessage({
            action = 'display'
        })
        ESX.ShowNotification('Has ~g~desocultado~s~ las calles.')
    end
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)
