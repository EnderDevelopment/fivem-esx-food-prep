-- Server-side script for Food Preparation Minigame

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Event for successful minigame completion
RegisterServerEvent('foodPreparation:success')
AddEventHandler('foodPreparation:success', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    -- Add reward logic here
    TriggerClientEvent('esx:showNotification', source, 'You successfully prepared the food!')
end)

-- Event for failed minigame
RegisterServerEvent('foodPreparation:failure')
AddEventHandler('foodPreparation:failure', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    -- Add penalty logic here
    TriggerClientEvent('esx:showNotification', source, 'You failed to prepare the food.')
end)

-- Command to start minigame for testing
TriggerEvent('es:addCommand', 'startminigame', function(source, args, user)
    TriggerClientEvent('foodPreparation:startMinigame', source)
end, {help = 'Start the food preparation minigame'})