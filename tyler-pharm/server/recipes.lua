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

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientpercs', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local dream = Ply.Functions.GetItemByName("percs")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if dream ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientfental', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local hazy = Ply.Functions.GetItemByName("fental")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if hazy ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientxan', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local crush = Ply.Functions.GetItemByName("xan")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if crush ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientoxy', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bloomer = Ply.Functions.GetItemByName("oxy")
    local bottle = Ply.Functions.GetItemByName(Config.BottleItem)
    if bloomer ~= nil and bottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientlean', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local can = Ply.Functions.GetItemByName("aluminumcan")
    local drinkmix = Ply.Functions.GetItemByName("DoctorScriptPad")
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

QBCore.Functions.CreateCallback('crp-pharm:server:get:ingredientmorhpine', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local brownie = Ply.Functions.GetItemByName("CrimScriptPad ")
    local streetweed = Ply.Functions.GetItemByName("streetweed")
    if brownie ~= nil and streetweed ~= nil then
        cb(true)
    else
        cb(false)
    end
end)