local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}
local Target = {}
local onDuty = true



-- target

CreateThread(function()
    for k,v in pairs(Config.MLOLocations) do
        if v.Enabled then
            if v.Blip then
                for d,j in pairs(v.Blip) do
                    if j.ShowBlip then
                        blip = AddBlipForCoord(j.Location)
                        SetBlipAsShortRange(blip, true)
                        SetBlipSprite(blip, j.Sprite)
                        SetBlipColour(blip, j.Colour)
                        SetBlipScale(blip, 0.5)
                        SetBlipDisplay(blip, 6)
                        BeginTextCommandSetBlipName('STRING')
                        if j.Label then AddTextComponentString(j.Label)
                        else AddTextComponentString("WeedShop") end
                        EndTextCommandSetBlipName(blip)
                    end
                end
            end
            if v.Duty then
                for d,j in pairs(v.Duty) do
                    Target["weedshopDuty"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopDuty"..k..d, j.coords, j.L, j.W, {name = "weedshopDuty"..k..d,heading = j.H,debugPoly = Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                	options = {{  event = "crp-pharm:DutyB",icon = "far fa-clipboard",label = "Clock On/Off",job = v.Job,},},
	                	distance = j.D
	                })
                end
            end
            if v.Counter then
                for d,j in pairs(v.Counter) do
                    Target["weedshopCounter"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopCounter"..k..d, j.coords, j.L, j.W, {name = "weedshopCounter"..k..d,heading = j.H,debugPoly = Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                	options = {{action = function() OpenWeedshopCounter(j.ID) end,icon = "fas fa-cannabis",label = "Access Counter",},},
	                	distance = j.D
	                })
                end
            end
            if v.DryPlot then
                for d,j in pairs(v.DryPlot) do
                    Target["weedshopDryPlot"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopDryPlot"..k..d, j.coords, j.L, j.W, {name="weedshopDryPlot"..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                	options = {{event = "qb-menu:MakePillBase",icon = "fas fa-cannabis",label = "Weed Drying Station",job = v.Job,},},
	                	distance = j.D
	                })
                end
            end
            if v.GrindPlot then
                for d,j in pairs(v.GrindPlot) do
                    Target["weedshopGrindPlot"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopGrindPlot"..k..d, j.coords, j.L, j.W, {name="weedshopGrindPlot"..k..d,heading=j.H,debugPoly= Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                    options = {{event = "qb-menu:GrindWeed",icon = "fas fa-cannabis",label = "Grind Weed",job = v.Job,},},
	                    distance = j.D
	                })
                end
            end
            if v.Crafting then
                for d,j in pairs(v.Crafting) do
                    Target["weedshopCrafting"..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopCrafting"..k..d, j.coords, j.L, j.W, {name="weedshopCrafting"..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{event = "qb-menu:Weed",icon = "fas fa-cannabis",label = "Weed Craft Station",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.Register then
                for d,j in pairs(v.Register) do
                    Target["weedshopRegister"..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopRegister"..k..d, j.coords, j.L, j.W, {name="weedshopRegister"..k..d,debugPoly=Config.DebugWeedPoly,heading=j.H,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{event = "crp-pharm:bill",parms = "1",icon = "fas fa-credit-card",label = "Charge Customer",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.ShopMenu then
                for d,j in pairs(v.ShopMenu) do
                    Target["weedshopShopMenu"..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopShopMenu"..k..d, j.coords, j.L, j.W, {name="weedshopShopMenu"..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{event = "qb-menu:WeedMenu",icon = "fas fa-cannabis",label = "Access Business!",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.Storage then
                for d,j in pairs(v.Storage) do
                    Target["weedshopStorage "..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopStorage "..k..d, j.coords.xyz, j.L, j.W, {name="weedshopStorage "..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{action = function() OpenWeedshopStorage(j.ID) end,icon = "fas fa-cannabis",label = "Storage",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.Garage then
                for d,j in pairs(v.Garage) do
                    TriggerServerEvent("jim-jobgarage:server:syncAddLocations", {
                    job = v.Job,
                    garage = {
                            spawn = j.SpawnVehicle,
                            out = j.PedPosition,
                            ped = {
                                model = j.PedModel,
                                scenario = "WORLD_HUMAN_CLIPBOARD"
                            },
                            list = j.Vehicle
                        },
                    })
                end
            end
        end
    end
end)


-- QB-MENU --    - need changes based on new items added to make pills

RegisterNetEvent('qb-menu:Weed', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Available Products |",isMenuHeader = true, },
        {header = "• Weed Brownie",txt = "Brownie Mix , streetweed",params = {event = "crp-pharm:weedbrownie"}},
        {header = "• Stoned Energy Drink",txt = "Aluminum Can , Drink-mix , Streetweed",params = {event = "crp-pharm:weed-drink"}},  
        {header = "• Joint",txt = "Rolling Paper , Street Weed",params = {event = "crp-pharm:joint"}},
        {header = "• Bong",txt = "Glass , Plastic",params = {event = "crp-pharm:bong"}},
        {header = "• Dream Joint",txt = "Rolling Paper , Dream Weed",params = {event = "crp-pharm:CreateDream"}},
        {header = "• Hazy Joint",txt = "Rolling Paper , Hazy Weed",params = {event = "crp-pharm:CreateHazy"}},
        {header = "• Crush Joint",txt = "Rolling Paper , Crush Weed",params = {event = "crp-pharm:CreateCrush"}},
        {header = "• Bloomer Joint",txt = "Rolling Paper , Bloomer Weed",params = {event = "crp-pharm:CreateBloomer"}},
        {header = "• Weed Gift Set",txt = "1 of each joint ",params = {event = "crp-pharm:creategiftset"}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('qb-menu:GrindWeed', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Grind Weed |",isMenuHeader = true, },
        {header = "• Street Weed",  txt = "Weed Bud",   params = {event = "crp-pharm:GrindWeed", args = {taken = "weedbud",     given = "streetweed"}}},
        {header = "• Dream Weed",   txt = "Dream Bud",  params = {event = "crp-pharm:GrindWeed", args = {taken = "dream-bud",   given = "dream-weed"}}},
        {header = "• Hazy Weed",    txt = "Hazy Bud",   params = {event = "crp-pharm:GrindWeed", args = {taken = "hazy-bud",    given = "hazy-weed"}}},
        {header = "• Crush Weed",   txt = "Crush Bud",  params = {event = "crp-pharm:GrindWeed", args = {taken = "crush-bud",   given = "crush-weed"}}},
        {header = "• Bloomer Weed", txt = "Bloomer Bud",params = {event = "crp-pharm:GrindWeed", args = {taken = "bloomer-bud", given = "bloomer-weed"}}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('crp-pharm:BottleMenu', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Roll Joints |",isMenuHeader = true, },
        {header = "• Street Joint",  txt = "Requires Street Weed",  params = {event = "crp-pharm:RollJoint", args = {taken = "streetweed",     given = "joint"}}},
        {header = "• Dream Joint",   txt = "Requires Dream Weed",  params = {event = "crp-pharm:RollJoint", args = {taken = "dream-weed",   given = "dream-joint"}}},
        {header = "• Hazy Joint",    txt = "Requires Hazy Weed",  params = {event = "crp-pharm:RollJoint", args = {taken = "hazy-weed",    given = "hazy-joint"}}},
        {header = "• Crush Joint",   txt = "Requires Crush Weed",  params = {event = "crp-pharm:RollJoint", args = {taken = "crush-weed",   given = "crush-joint"}}},
        {header = "• Bloomer Joint", txt = "Requires Bloomer Weed",  params = {event = "crp-pharm:RollJoint", args = {taken = "bloomer-weed", given = "bloomer-joint"}}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('qb-menu:MakePillBase', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Dry Weed |",isMenuHeader = true, },
        {header = "• Street Bud",   txt = "Wet Weed",   params = {event = "crp-pharm:MakePillBase", args = "weedbud"}},
        {header = "• Dream Bud",    txt = "Wet Dream",  params = {event = "crp-pharm:MakePillBase", args = "dream-bud"}},
        {header = "• Hazy Bud",     txt = "Wet Hazy",   params = {event = "crp-pharm:MakePillBase", args = "hazy-bud"}},  
        {header = "• Crush Bud",    txt = "Wet Crush",  params = {event = "crp-pharm:MakePillBase", args = "crush-bud"}},
        {header = "• Bloomer Bud",  txt = "Wet Bloomer",params = {event = "crp-pharm:MakePillBase", args = "bloomer-bud"}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('qb-menu:WeedMenu', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Products |",isMenuHeader = true, },
        {header = "• Duty",             txt = "Clock In/Out",params = {event = "crp-pharm:DutyB"}},
        {header = "• Order Items",      txt = "Order New Ingredients!",params = {event = "crp-pharm:shop"}},
        {header = "• Order supplies",   txt = "Current Price is $"..Config.shopsuppliescost.." Per...",params = {event = "crp-pharm:deliveries:PickUpMenu"}},
        {header = "• Accept Delivery",  txt = "Send delivery to personal email",params = {event = "crp-pharm:DeliveryMenu"}},
        {header = "• Cancel Delivery",  txt = "Cancel Your Current Deliveries",params = {event = "crp-pharm:DeliveryCancel"}},
        {header = "• File Invoice",     txt = "Complete to get paid for each Receipt",params = {event = "crp-pharm:deliveries:ReceivePayment"}},
        {header = "• Manage Business",  txt = "Access the business menu",params = {event = "qb-bossmenu:client:OpenMenu"}},
        {header = "Close (ESC)",isMenuHeader = true, },
    })
end)


-- Till Stuff --
RegisterNetEvent("crp-pharm:bill")
AddEventHandler("crp-pharm:bill", function()
    if Config.JimPayments then
        TriggerEvent('jim-payments:client:Charge', source, false)
    else
        local bill = exports['qb-input']:ShowInput({
            header = "Create Receipt",
	    	submitText = "Bill",
            inputs = {
                {text = "Server ID(#)",name = "citizenid", type = "text", isRequired = true },
                {text = "Bill Price ($)", name = "billprice", type = "number", isRequired = false}	
            }
        })
        if bill ~= nil then
            if bill.citizenid == nil or bill.billprice == nil then 
                return 
            end
            TriggerServerEvent("crp-pharm:bill:player", bill.citizenid, bill.billprice)
        end
    end
end)