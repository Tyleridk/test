local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientjoint', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local streetweed = Ply.Functions.GetItemByName("streetweed")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if streetweed ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientbong', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("glass")
    local plastic = Ply.Functions.GetItemByName("plastic")
    if glass ~= nil and plastic ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientdream', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local dream = Ply.Functions.GetItemByName("dream-weed")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if dream ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredienthazy', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local hazy = Ply.Functions.GetItemByName("hazy-weed")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if hazy ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientcrush', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local crush = Ply.Functions.GetItemByName("crush-weed")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if crush ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientbloomer', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bloomer = Ply.Functions.GetItemByName("bloomer-weed")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if bloomer ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientweed-drink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local can = Ply.Functions.GetItemByName("aluminumcan")
    local drinkmix = Ply.Functions.GetItemByName("drink-mix")
    local streetweed = Ply.Functions.GetItemByName("streetweed")
    if can ~= nil and drinkmix ~= nil and streetweed ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientgiftset', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local joint = Ply.Functions.GetItemByName("joint")
    local gift = Ply.Functions.GetItemByName("gift-box")
    local dream = Ply.Functions.GetItemByName("dream-joint")
    local hazy = Ply.Functions.GetItemByName("hazy-joint")
    local crush = Ply.Functions.GetItemByName("crush-joint")
    local bloomer = Ply.Functions.GetItemByName("bloomer-joint")
    if joint ~= nil and gift ~= nil and dream ~= nil and hazy ~= nil and crush ~= nil and bloomer ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientweedbrownie', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local brownie = Ply.Functions.GetItemByName("brownie-mix")
    local streetweed = Ply.Functions.GetItemByName("streetweed")
    if brownie ~= nil and streetweed ~= nil then
        cb(true)
    else
        cb(false)
    end
end)