-- Enhanced server-side script for Food Preparation Minigame

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Event for successful stage completion
RegisterServerEvent('foodPreparation:stageComplete')
AddEventHandler('foodPreparation:stageComplete', function(stage)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nextStage = stage + 1
    local difficulty = math.min(stage + 1, 5) -- Cap difficulty at 5

    if nextStage <= 3 then -- Assuming 3 stages
        TriggerClientEvent('foodPreparation:startMinigame', source, nextStage, difficulty)
    else
        -- All stages completed
        local reward = 100 + (difficulty * 20) -- Base reward + bonus for difficulty
        xPlayer.addMoney(reward)
        TriggerClientEvent('esx:showNotification', source, 'You successfully prepared the food! Earned: ~g~$' .. reward)
    end
end)

-- Event for failed minigame
RegisterServerEvent('foodPreparation:failure')
AddEventHandler('foodPreparation:failure', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx:showNotification', source, 'You failed to prepare the food.')
end)

-- Command to start minigame for testing
TriggerEvent('es:addCommand', 'startminigame', function(source, args, user)
    TriggerClientEvent('foodPreparation:startMinigame', source, 1, 1)
end, {help = 'Start the food preparation minigame'})
