local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("crp-pharm:bill:player")
AddEventHandler("crp-pharm:bill:player", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if billed ~= nil then
        if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
            if amount and amount > 0 then
                MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                    ['citizenid'] = billed.PlayerData.citizenid,
                    ['amount'] = amount,
                    ['society'] = biller.PlayerData.job.name,
                    ['sender'] = biller.PlayerData.charinfo.firstname
                })
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
            else
                TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
    end
end)

----//////useables/////------

for k, v in pairs(Config.WeedEffects) do
	QBCore.Functions.CreateUseableItem(k, function(source, item)
        TriggerClientEvent('crp-pharm:RequireCheck', source, v)
    end)
end 

QBCore.Functions.CreateUseableItem("weed-grinder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-menu:GrindWeed", source, item.name)
end)

QBCore.Functions.CreateUseableItem("weed-gift-set", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerEvent("crp-pharm:server:addgiftboxitems", source, item.name)
    Player.Functions.RemoveItem('weed-gift-set', 1)
end)

QBCore.Functions.CreateUseableItem(Config.BottleItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.AllowAllJointBottling then
        TriggerClientEvent("crp-pharm:BottleMenu", source, item.name)
    end
end)
