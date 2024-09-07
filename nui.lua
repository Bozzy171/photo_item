local display = false

--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

-- this cb is used as the main route to transfer data back 
-- and also where we hanld the data sent from js
RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    SetDisplay(false)
end)

RegisterNetEvent("photo_item:openimg")
AddEventHandler("photo_item:openimg",function(imagelink)
    SetDisplay(not display,imagelink)
end)

function SetDisplay(bool,imagelink)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        image = imagelink
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)