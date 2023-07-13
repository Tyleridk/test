local QBCore = exports['qb-core']:GetCoreObject()
local ReceiptItem = {["customer-receipt"]  =  Config.DeliveryPayment ,}
local delitem = ''
local wwamount = 0

----------DELIVERY STUFF----------------

RegisterNetEvent('crp-pharm:server:DeliveryItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, amount)
end)

RegisterNetEvent('crp-pharm:server:pickupordered', function(wwamount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = wwamount
    local price = Config.shopsuppliescost
    local result = amount*price
    local society = Player.PlayerData.job.name

    if Config.PaySociety then
        local balance = exports['qb-management']:GetAccount(society)
        if Config.DebugCode then print(balance) end
        if balance >= result then
            exports['qb-management']:RemoveMoney(society, result)
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have $"..result.." in your business account")
        end
    else
        local balance = Player.Functions.GetMoney('cash', result)
        if balance >= result then
            Player.Functions.RemoveMoney('cash', result)
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have $"..result.." in your pockets")
        end
    end
end)

RegisterNetEvent('crp-pharm:server:PickupFinished', function(wwamount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('supply', wwamount)
    TriggerClientEvent('QBCore:Notify', src, "You Picked up "..wwamount.." Wet Weed")
end)

RegisterNetEvent('crp-pharm:server:KnockDoor', function(delitem, delitemamount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item2 = 'customer-receipt'

    Player.Functions.RemoveItem(delitem, delitemamount)
    Player.Functions.AddItem(item2, delitemamount)
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ReceiptChecker', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local wreceipt = Ply.Functions.GetItemByName("customer-receipt")
    if wreceipt ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('crp-pharm:server:ReceivePayment', function(job)
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    local society = job
    
    local xItem = Player.Functions.GetItemsByName(ReceiptItem)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ReceiptItem[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ReceiptItem[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

                    if Config.PaySociety then
                        exports['qb-management']:AddMoney(society, price)
                        TriggerClientEvent('QBCore:Notify', src, "You filed all receipts for $"..price.." Cash is in Society Fund")
                    else
                        Player.Functions.AddMoney("cash", price)
                        TriggerClientEvent('QBCore:Notify', src, "You filed all receipts for $"..price)
                    end
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no Receipts..")
    end
end)
