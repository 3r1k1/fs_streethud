local display = true
local directions = { [0] = 'N', [1] = 'NW', [2] = 'W', [3] = 'SW', [4] = 'S', [5] = 'SE', [6] = 'E', [7] = 'NE', [8] = 'N' } 
local zones = { ['AIRP'] = 'Los Santos International Airport', ['ALAMO'] = 'Alamo Sea', ['ALTA'] = 'Alta', ['ARMYB'] = 'Fort Zancudo', ['BANHAMC'] = 'Banham Canyon Dr', ['BANNING'] = 'Banning', ['BEACH'] = 'Vespucci Beach', ['BHAMCA'] = 'Banham Canyon', ['BRADP'] = 'Braddock Pass', ['BRADT'] = 'Braddock Tunnel', ['BURTON'] = 'Burton', ['CALAFB'] = 'Calafia Bridge', ['CANNY'] = 'Raton Canyon', ['CCREAK'] = 'Cassidy Creek', ['CHAMH'] = 'Chamberlain Hills', ['CHIL'] = 'Vinewood Hills', ['CHU'] = 'Chumash', ['CMSW'] = 'Chiliad Mountain State Wilderness', ['CYPRE'] = 'Cypress Flats', ['DAVIS'] = 'Davis', ['DELBE'] = 'Del Perro Beach', ['DELPE'] = 'Del Perro', ['DELSOL'] = 'La Puerta', ['DESRT'] = 'Grand Senora Desert', ['DOWNT'] = 'Downtown', ['DTVINE'] = 'Downtown Vinewood', ['EAST_V'] = 'East Vinewood', ['EBURO'] = 'El Burro Heights', ['ELGORL'] = 'El Gordo Lighthouse', ['ELYSIAN'] = 'Elysian Island', ['GALFISH'] = 'Galilee', ['GOLF'] = 'GWC and Golfing Society', ['GRAPES'] = 'Grapeseed', ['GREATC'] = 'Great Chaparral', ['HARMO'] = 'Harmony', ['HAWICK'] = 'Hawick', ['HORS'] = 'Vinewood Racetrack', ['HUMLAB'] = 'Humane Labs and Research', ['JAIL'] = 'Bolingbroke Penitentiary', ['KOREAT'] = 'Little Seoul', ['LACT'] = 'Land Act Reservoir', ['LAGO'] = 'Lago Zancudo', ['LDAM'] = 'Land Act Dam', ['LEGSQU'] = 'Legion Square', ['LMESA'] = 'La Mesa', ['LOSPUER'] = 'La Puerta', ['MIRR'] = 'Mirror Park', ['MORN'] = 'Morningwood', ['MOVIE'] = 'Richards Majestic', ['MTCHIL'] = 'Mount Chiliad', ['MTGORDO'] = 'Mount Gordo', ['MTJOSE'] = 'Mount Josiah', ['MURRI'] = 'Murrieta Heights', ['NCHU'] = 'North Chumash', ['NOOSE'] = 'N.O.O.S.E', ['OCEANA'] = 'Pacific Ocean', ['PALCOV'] = 'Paleto Cove', ['PALETO'] = 'Paleto Bay', ['PALFOR'] = 'Paleto Forest', ['PALHIGH'] = 'Palomino Highlands', ['PALMPOW'] = 'Palmer-Taylor Power Station', ['PBLUFF'] = 'Pacific Bluffs', ['PBOX'] = 'Pillbox Hill', ['PROCOB'] = 'Procopio Beach', ['RANCHO'] = 'Rancho', ['RGLEN'] = 'Richman Glen', ['RICHM'] = 'Richman', ['ROCKF'] = 'Rockford Hills', ['RTRAK'] = 'Redwood Lights Track', ['SANAND'] = 'San Andreas', ['SANCHIA'] = 'San Chianski Mountain Range', ['SANDY'] = 'Sandy Shores', ['SKID'] = 'Mission Row', ['SLAB'] = 'Stab City', ['STAD'] = 'Maze Bank Arena', ['STRAW'] = 'Strawberry', ['TATAMO'] = 'Tataviam Mountains', ['TERMINA'] = 'Terminal', ['TEXTI'] = 'Textile City', ['TONGVAH'] = 'Tongva Hills', ['TONGVAV'] = 'Tongva Valley', ['VCANA'] = 'Vespucci Canals', ['VESP'] = 'Vespucci', ['VINE'] = 'Vinewood', ['WINDF'] = 'Ron Alternates Wind Farm', ['WVINE'] = 'West Vinewood', ['ZANCUDO'] = 'Zancudo River', ['ZP_ORT'] = 'Port of South Los Santos', ['ZQ_UAR'] = 'Davis Quartz' }
local locationText = ''

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
            -- print(street)
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