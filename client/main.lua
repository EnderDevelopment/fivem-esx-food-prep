-- Client-side script for Food Preparation Minigame

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    -- Register NUI callback
    RegisterNUICallback('minigameComplete', function(data, cb)
        if data.success then
            TriggerServerEvent('foodPreparation:success')
        else
            TriggerServerEvent('foodPreparation:failure')
        end
        cb('ok')
    end)

    -- Register command for testing
    RegisterCommand('startminigame', function()
        StartMinigame()
    end, false)
end)

function StartMinigame()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'startMinigame'
    })
end

-- Event to start minigame from server
RegisterNetEvent('foodPreparation:startMinigame')
AddEventHandler('foodPreparation:startMinigame', function()
    StartMinigame()
end)