Config = {}

Config.DebugWeedPoly = false  --true for testing/false for live server
Config.DebugCode = false

Config.Phone = 'qb' --supports qb = qb-Phone/qs = quasar Phone/gk = GK Phone  ---- do not change from qb works with LB
Config.JimShops = false   --- we are not using
Config.JimPayments = true  --- we are using

Config.PaySociety = true --uses qb-management for everything related to money (delivery receipts, ordering wet weed.) does not work for Shop items as thats a seperate script(for now)  --- add job according to job name

Config.MLOLocations = { -- NOW SUPPORTS MULTIPLE LOCATIONS AT ONCE   --- change locations to support mlo for pharmacy.. super easy just needs testing and location we gonna use
    {
        Enabled = true, --enable or disable the entire location. 
        Job = 'bestbuds', --jobcode  --- job code for base job on mlo location aka like Planb then add job grades in core
        Blip = {{ShowBlip = true,Location = vector3(377.39, -833.21, 29.29),Sprite = 469,Colour = 2,Label = "Best Buds"},
        },
        --locations
        Duty = {{coords = vector3(375.65, -824.95, 29.3),       L = 0.3, W = 1.2, H = 177.88,   Minz = 29.6, Maxz = 30.5, D = 1.5,},},
        Counter = {{ID = "BBuds_Tray_1",coords = vector3(377.26, -827.42, 29.38),   L = 0.3, W = 0.5, H = 180,      Minz = 29.3, Maxz = 29.7, D = 1.5,},},
        DryPlot = {{coords = vector3(380.5, -812.59, 28.43),    L = 2.8, W = 4.5, H = 180,      Minz = 28.0, Maxz = 30.0, D = 1.5,},},
        GrindPlot = {{coords = vector3(382.49, -817.43, 28.3),  L = 1.0, W = 1.8, H = 0,        Minz = 28.0, Maxz = 30.0, D = 1.5,},},
        Crafting = {{coords = vector3(374.23, -816.06, 29.35),  L = 1.0, W = 1.0, H = 0,        Minz = 28.0, Maxz = 29.5, D = 1.5,},},
        Register = {{coords = vector3(380.24, -827.33, 29.29),  L = 0.4, W = 0.3, H = 130,      Minz = 29.3, Maxz = 29.7, D = 1.5,},},
        ShopMenu = {{coords = vector3(375.55, -827.33, 29.29),  L = 0.4, W = 0.3, H = 180,      Minz = 29.3, Maxz = 29.7, D = 1.5,},},
        Storage = {{ID = "BBuds_Store_1",coords = vector3(383.71, -819.8, 29.29),    L = 0.5, W = 2.0, H = 90,       Minz = 28.0, Maxz = 30.0, D = 1.5,},},
        Garage = {{ --requires jim-jobgarage
            PedModel = 'g_m_importexport_01',
            Vehicle = {
                ["burrito"] = {
                    CustomName = "Burrito", --name in menu
                    colors = { 136, 137 }, -- colours -- found here https://altv.stuyk.com/docs/articles/tables/vehicle-colors.html
                    grade = 0, --job grade
                    performance = { 2, 3, 3, 2, 4, true }, 
                    trunkItems = { --items that spawn in the trunk
                        { name = "lockpick", amount = 1, info = {}, type = "item", slot = 1, }, --test
                    },
                },
            },
            PedPosition = vector4(372.18, -827.04, 29.29, 90.12),
            SpawnVehicle = vector4(368.15, -827.12, 29.29, 182.61),
        },},
    },
    {
        Enabled = true,
        Job = 'blazeit', --jobcode
        Blip = {{ShowBlip = true,Location = vector3(378.61, -1267.71, 32.47),Sprite = 469,Colour = 2,Label = "Blazeit",},
        },
        --locations
        Duty = false,
        Counter = {{ID = "Blaze_Tray_1",coords = vector3(368.13, -1268.03, 32.59),      L = 2.4, W = 0.6, H = 50,   Minz = 32.19, Maxz = 32.59, D = 1.5,},},
        DryPlot = {{coords = vector3(366.29, -1252.52, 32.59),      L = 1.0, W = 1.0, H = 324,  Minz = 32.79, Maxz = 34.19, D = 1.5,},},
        GrindPlot = {{coords = vector3(364.42, -1255.05, 32.59),    L = 1.0, W = 1.0, H = 50,   Minz = 32.19, Maxz = 32.79, D = 2.0,},},
        Crafting = {{coords = vector3(365.14, -1254.18, 32.59),     L = 1.0, W = 1.0, H = 50,   Minz = 32.19, Maxz = 32.99, D = 2.0,},},
        Register = {{coords = vector3(370.15, -1269.71, 32.59),     L = 1.0, W = 1.0, H = 36,   Minz = 32.54, Maxz = 32.94, D = 1.5,},},
        ShopMenu = {{coords = vector3(362.19, -1258.49, 32.59),     L = 2.6, W = 0.4, H = 320,  Minz = 32.39, Maxz = 33.19, D = 1.5,},},
        Storage = {{ID = "Blazeit_Store_1",coords = vector3(356.51, -1245.48, 32.59),      L = 2.8, W = 1.0, H = 50,   Minz = 31.59, Maxz = 33.79, D = 1.5,},},
        Garage = {{
            PedModel = 'g_m_importexport_01',
            Vehicle = {
                ["paradise"] = {
                    CustomName = "Paradise",
                    colors = { 4 },
                    grade = 0,
                    performance = { 2, 3, 3, 2, 4, true },
                    trunkItems = {
                        { name = "lockpick", amount = 1, info = {}, type = "item", slot = 1, }, --test
                    },
                },
            },
            PedPosition = vector4(345.26, -1252.31, 32.51, 54.83),
            SpawnVehicle = vector4(341.84, -1245.21, 32.51, 351.92),
        },},
    },
    {
        Enabled = true,
        Job = 'widow', --jobcode
        Blip = {{ShowBlip = true,Location = vector3(208.04, -237.88, 53.85),Sprite = 469,Colour = 2,Label = "White Widow",},
        },
        --locations
        Duty = false,
        Counter = {{ID = "Widow_Tray_1",coords = vector3(188.51, -242.25, 54.07),   L = 1.2, W = 0.4, H = 340,  Minz = 53.87, Maxz = 54.47, D = 1.5,},},
        DryPlot = {{coords = vector3(165.54, -245.82, 50.06),   L = 9.2, W = 5.6, H = 250,  Minz = 49.26, Maxz = 51.46, D = 1.5,},},
        GrindPlot = {{coords = vector3(165.37, -235.74, 50.06), L = 0.8, W = 2.2, H = 340,  Minz = 49.66, Maxz = 50.26, D = 2.0,},},
        Crafting = {{coords = vector3(185.45, -242.21, 54.07),  L = 0.6, W = 3.0, H = 70,   Minz = 54.07, Maxz = 54.47, D = 2.0,},},
        Register = {{coords = vector3(189.01, -241.15, 54.07),  L = 0.5, W = 0.5, H = 341,  Minz = 53.87, Maxz = 54.47, D = 1.5,},},
        ShopMenu = {
            {coords = vector3(182.92, -250.61, 54.07), L = 1.0, W = 1.8, H = 340, Minz = 53.67, Maxz = 54.67, D = 1.5,},
            {coords = vector3(180.63, -252.74, 54.07), L = 0.8, W = 1.0, H = 340, Minz = 53.67, Maxz = 54.67, D = 1.5,},
        },
        Storage = {
            {ID = "Widow_Store_1",coords = vector3(175.52, -239.82, 50.06), L = 0.8, W = 2.4, H = 340, Minz = 49.26, Maxz = 51.46, D = 1.5,},
            {ID = "Widow_Store_2",coords = vector3(193.27, -234.44, 54.07), L = 2.8, W = 1.0, H = 340, Minz = 53.67, Maxz = 54.87, D = 1.5,},
        },
        Garage = {{
            PedModel = 'g_m_importexport_01',
            Vehicle = {
                ["zentorno"] = {
                    CustomName = "Zentorno",
                    colors = { 136, 137 },
                    grade = 0,
                    performance = { 2, 3, 3, 2, 4, true },
                    trunkItems = {
                        { name = "lockpick", amount = 1, info = {}, type = "item", slot = 1, }, --test
                    },
                },
            },
            PedPosition = vector4(195.14, -271.96, 49.47, 232.06),
            SpawnVehicle = vector4(198.95, -269.02, 50.07, 244.27),
        },},
    },
}

Config.JobStorageWeight = 500 --this is multiplied by 1000 using base gta units. so 1 = 1 rather than 1000 = 1   ---- do not touch working as it should
Config.JobStorageSlots = 40 --amount of slots in job storage
Config.JobCounterWeight = 20 
Config.JobCounterSlots = 5

Config.AllowAllJointBottling = true --allows anybody to bottle pills with correct item  - done
Config.BottleItem = 'Empty_Bottle'

Config.CraftingTime = 5 --in seconds (5 = 5 seconds)   --- basic and simple should up
--Breakable Equipment
Config.GrinderCanBreak = true --whether or not grinder can break after grinding  -- default form weed  -- done
Config.GrinderBreakChance = 5 -- in % (5 = 5% chance of a break) -- default form weed  -- done
Config.InfusionCanBreak = true --whether or not infusion kit can break after drying something -- default form weed --- done
Config.InfusionBreakChance = 5 --in % (5 = 5% chance of a break) -- default form weed --- done

--Item Info
Config.EnableRandomGift = true
Config.RandomGiftChance = 5 -- in % chance of recieving an item from the gift sets. items configured below
Config.RandomGiftAmount = 1
Config.GiftBoxRewards = { --change these to whatever you want to use. 
    'lockpick',
    'weapon_pistol',
}
Config.CrimScriptPad = 5 --amount of weed brownies to get from 1 mix   -- needs to become the item brownie-mix for whatever pad we call it
Config.DoctorScriptPad = 5 --amount of weed drinks to get from 1 crafting   --- change to pad issued by doctors this si current basic af
Config.GrindingAmount = 2 --amount of ground weed to get from grinding 1  -- this changes final product in crafting can help with this if needed.
Config.supplyadd = 2 --amount of pill mix to add when supply is used  -- done  ---- this is supply to convert this was previous wet_weed so this becomes now bill base mix

--Delivery
Config.DeliveryWait = 10 --in seconds(time between accepting Delivery and recieving email)
Config.DeliveryPayment = math.random(50, 100) --amount of money to recieve when cashing receipts
Config.shopsuppliescost = 1   -- amount you pay for a single supply (cost is amount*price)  -- done
Config.shopsupplies = { -- location to pick up shop supplies with target when on a pickup  -- done
    vector3(3688.24, 4563.43, 25.18),
    vector3(808.72, -163.69, 75.88),
}   
Config.DeliveryItems = { -- you have to make this item before you deliver it   --- ingore disbale in conifg
    'dream-joint',
    'hazy-joint',
    'crush-joint',
    'bloomer-joint',
}
Config.MaxDeliveries = 10 --maximum deliveries before having to return to shop and cash receipts
--delivery locations -- you can now have as many locations as you want
Config.DropOffPoints = {
    vector3(-297.74, 379.84, 112.1),
    vector3(119.37, 564.19, 183.96),
    vector3(808.72, -163.69, 75.88),
    vector3(1060.41, -378.3, 68.23),
    vector3(850.27, -532.63, 57.93),
    vector3(281.96, -1694.96, 29.65),
    vector3(39.02, -1911.58, 21.95),
    vector3(256.43, -2023.4, 19.27),
    vector3(512.51, -1790.77, 28.92),
    vector3(1193.52, -1622.37, 45.22)
}

Config.Items = {
label = "Weedshop",
    slots = 10,
    items = {
        [1]  =  {name = "lighter",        price = 10,amount = 50,info = {},type = "item",slot = 1,},   --- lighter from smoking cna remove
        [2]  =  {name = "empty_weed_bag", price = 3,amount = 50,info = {},type = "item",slot = 2,},   --- this item is actually useless
        [3]  =  {name = "Empty_Bottle",  price = 2,amount = 50,info = {},type = "item",slot = 3,},    --- this was rolling paper change crafting accordlying
        [4]  =  {name = "weed_nutrition", price = 40,amount = 50,info = {},type = "item",slot = 4,},   --- this was for house growing can remove
        [5]  =  {name = "gift-box",       price = 45,amount = 50,info = {},type = "item",slot = 5,},   --- gift box to convert to med kit maybe?
        [6]  =  {name = "brownie-mix",    price = 8,amount = 50,info = {},type = "item",slot = 6,}, --- this becomes crim script pad
        [7]  =  {name = "aluminumcan",    price = 1,amount = 50,info = {},type = "item",slot = 7,},   -- this converts to liquid bottle for lean???
        [8]  =  {name = "drink-mix",      price = 15,amount = 50,info = {},type = "item",slot = 8,},  -- this becomes doctor script pad
        [9]  =  {name = "weed-grinder",   price = 30,amount = 20,info = {},type = "item",slot = 9,},  -- this becomes grinder
        [10] =  {name = "infusion-kit",   price = 50,amount = 50,info = {},type = "item",slot = 10,},   --- same item no need to change can easily become a differnt item just change in config
    }
}

Config.WeedEffects = {     --- can add affects of items here make sure to chnage in server/ client super simple
    ["dream-joint"] = {
        ItemName = 'dream-joint',
        Emote = 'joint',
        RemoveItem = true,
        RequireItem = 'lighter',
        RemoveRequired = false,
        WeedSmell = true,
        StressRemove = math.random(5,10),
        AddArmour = math.random(5,10),
        Effect = {
            Enable = true,
            IncreaseStamina = true,
            CanCauseRagdoll = false,
            ScreenEffect = 'acid',
            EffectDuration = 10, -- in seconds
        },
    },
    ["hazy-joint"] = {
        ItemName = 'hazy-joint',
        Emote = 'joint',
        RemoveItem = true,
        RequireItem = 'lighter',
        RemoveRequired = false,
        WeedSmell = true,
        StressRemove = math.random(5,10),
        AddArmour = math.random(5,10),
        Effect = {
            Enable = true,
            IncreaseStamina = false,
            CanCauseRagdoll = true,
            ScreenEffect = 'mild-blue',
            EffectDuration = 10, 
        },
    },
    ["crush-joint"] = {
        ItemName = 'crush-joint',
        Emote = 'joint',
        RemoveItem = true,
        RequireItem = 'lighter',
        RemoveRequired = false,
        WeedSmell = true,
        StressRemove = math.random(5,10),
        AddArmour = math.random(5,10),
        Effect = {
            Enable = true,
            IncreaseStamina = true,
            CanCauseRagdoll = false,
            ScreenEffect = 'short-green',
            EffectDuration = 10, 
        },
    },
    ["bloomer-joint"] = {
        ItemName = 'bloomer-joint',
        Emote = 'joint',
        RemoveItem = true,
        RequireItem = 'lighter',
        RemoveRequired = false,
        WeedSmell = true,
        StressRemove = math.random(5,10),
        AddArmour = false,
        Effect = {
            Enable = true,
            IncreaseStamina = true,
            CanCauseRagdoll = false,
            ScreenEffect = 'noir',
            EffectDuration = 10, 
        },
    },
    ["bong"] = {
        ItemName = 'bong',
        Emote = 'bong',
        RemoveItem = false,
        RequireItem = 'lighter',
        RemoveRequired = false,
        WeedSmell = true,
        StressRemove = math.random(10,20),
        Effect = {
            Enable = true,
            IncreaseStamina = false,
            CanCauseRagdoll = false,
            ScreenEffect = 'trevor',
            EffectDuration = 10, 
        },
    },
    ["weed-drink"] = {
        ItemName = 'weed-drink',
        Emote = 'soda',
        RemoveItem = true,
        WeedSmell = false,
        StressRemove = math.random(2,5),
        AddThirst = math.random(10,20),
        AddHunger = false,
        Effect = {
            Enable = false,
            IncreaseStamina = false,
            CanCauseRagdoll = false,
            ScreenEffect = 'trevor',
            EffectDuration = 10, 
        },
    },
    ["weed-brownie"] = {
        ItemName = 'weed-brownie',
        Emote = 'egobar',
        RemoveItem = true,
        WeedSmell = false,
        StressRemove = math.random(2,5),
        AddThirst = false,
        AddHunger = math.random(10,20),
        Effect = {
            Enable = false,
            IncreaseStamina = false,
            CanCauseRagdoll = false,
            ScreenEffect = 'trevor',
            EffectDuration = 10, 
        },
    },
}