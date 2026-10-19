-- Enhanced client-side script for Food Preparation Minigame

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    -- Register NUI callbacks
    RegisterNUICallback('minigameComplete', function(data, cb)
        if data.success then
            TriggerServerEvent('foodPreparation:stageComplete', data.stage)
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
        action = 'startMinigame',
        stage = 1,
        difficulty = 1
    })
end

-- Event to start minigame from server
RegisterNetEvent('foodPreparation:startMinigame')
AddEventHandler('foodPreparation:startMinigame', function(stage, difficulty)
    StartMinigame(stage, difficulty)
end)

function StartMinigame(stage, difficulty)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'startMinigame',
        stage = stage or 1,
        difficulty = difficulty or 1
    })
end
