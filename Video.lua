local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "Legends of Speed",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

-- Check user access
local allowedUsers = {
    ["Soidjdjc"] = true,
    ["I_LostDoge"] = true,
    ["Soidjdjc_Sister"] = true,
    ["Cat_okea"] = true,
    ["Catai170"] = true
}

local playerName = game.Players.LocalPlayer.Name
local isUserAllowed = allowedUsers[playerName] or false

-- Auto Farm Tab
local AutoFarm = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AutoRebirth = false
local AutoFarmOrbs = false
local AutoFarmGems = false
local AutoFarmHoops = false

AutoFarm:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        AutoRebirth = Value
        if AutoRebirth then
            while AutoRebirth do
                wait(5)
                local args = {"rebirthRequest"}
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
            end
        end
    end
})

AutoFarm:AddToggle({
    Name = "Orb Farm",
    Default = false,
    Callback = function(Value)
        AutoFarmOrbs = Value
        if AutoFarmOrbs then
            while AutoFarmOrbs do
                wait(0.1)
                for _, orb in pairs(game.Workspace.orbFolder.City:GetChildren()) do
                    if orb.Name ~= "Gem" then
                        orb.outerOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end
})

AutoFarm:AddToggle({
    Name = "Gem Farm",
    Default = false,
    Callback = function(Value)
        AutoFarmGems = Value
        if AutoFarmGems then
            while AutoFarmGems do
                wait(0.1)
                for _, gem in pairs(game.Workspace.orbFolder.City:GetChildren()) do
                    if gem.Name == "Gem" then
                        gem.outerGem.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end
})

AutoFarm:AddToggle({
    Name = "Hoop Farm",
    Default = false,
    Callback = function(Value)
        AutoFarmHoops = Value
        if AutoFarmHoops then
            while AutoFarmHoops do
                wait(0.1)
                local player = game.Players.LocalPlayer
                local humanoidRootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                local hoopsFolder = game.Workspace:FindFirstChild("Hoops")

                if humanoidRootPart and hoopsFolder then
                    for _, hoop in pairs(hoopsFolder:GetChildren()) do
                        if hoop:IsA("BasePart") then
                            hoop.CFrame = humanoidRootPart.CFrame
                        end
                    end
                else
                    warn("Player's HumanoidRootPart or Hoops folder not found.")
                end
                wait(0.1)  -- Prevents possible infinite loop strain
            end
        end
    end
})

AutoFarm:AddButton({
    Name = "Collect All Orbs and Rebirth",
    Callback = function()
        for _ = 1, 500 do
            wait(0.01)
            local orbTypes = {"Red Orb", "Yellow Orb", "Gem", "Orange Orb"}
            for _, orbType in pairs(orbTypes) do
                local args = {"collectOrb", orbType, "City"}
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
            end

            local rebirthArgs = {"rebirthRequest"}
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(rebirthArgs))
        end
    end    
})

-- Ultra OP Auto Farm Tab (Only for allowed users)
local UltraOP_AutoFarm = Window:MakeTab({
    Name = "Ultra OP Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

if isUserAllowed then
    local OP_AutoRebirth = false
    local OP_AutoOrbs = false
    local OP_AutoGems = false
    local OP_AutoHoops = false

    UltraOP_AutoFarm:AddToggle({
        Name = "Ultra OP Rebirth",
        Default = false,
        Callback = function(Value)
            OP_AutoRebirth = Value
            if OP_AutoRebirth then
                while OP_AutoRebirth do
                    wait(5)
                    local args = {"rebirthRequest"}
                    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
                end
            end
        end
    })

    UltraOP_AutoFarm:AddToggle({
        Name = "Ultra OP Orb Farm",
        Default = false,
        Callback = function(Value)
            OP_AutoOrbs = Value
            if OP_AutoOrbs then
                while OP_AutoOrbs do
                    wait(0.1)
                    for _, orb in pairs(game.Workspace.orbFolder.City:GetChildren()) do
                        if orb.Name ~= "Gem" then
                            orb.outerOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    })

    UltraOP_AutoFarm:AddToggle({
        Name = "Ultra OP Gem Farm",
        Default = false,
        Callback = function(Value)
            OP_AutoGems = Value
            if OP_AutoGems then
                while OP_AutoGems do
                    wait(0.1)
                    for _, gem in pairs(game.Workspace.orbFolder.City:GetChildren()) do
                        if gem.Name == "Gem" then
                            gem.outerGem.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    })

    UltraOP_AutoFarm:AddToggle({
        Name = "Ultra OP Hoop Farm",
        Default = false,
        Callback = function(Value)
            OP_AutoHoops = Value
            if OP_AutoHoops then
                while OP_AutoHoops do
                    wait(0.1)
                    local player = game.Players.LocalPlayer
                    local humanoidRootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    local hoopsFolder = game.Workspace:FindFirstChild("Hoops")

                    if humanoidRootPart and hoopsFolder then
                        for _, hoop in pairs(hoopsFolder:GetChildren()) do
                            if hoop:IsA("BasePart") then
                                hoop.CFrame = humanoidRootPart.CFrame
                            end
                        end
                    else
                        warn("Player's HumanoidRootPart or Hoops folder not found.")
                    end
                    wait(0.1)  -- Prevents possible infinite loop strain
                end
            end
        end
    })
else
    UltraOP_AutoFarm:AddLabel({
        Name = "Access Denied",
        Text = "You do not have permission to access this tab.",
        TextColor3 = Color3.fromRGB(255, 0, 0)
    })
end

-- Credits Tab
local Credits = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Credits:AddLabel("memecat0 | Owner")

-- Discord Server Tab
local DiscordServer = Window:MakeTab({
    Name = "Discord Server",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

DiscordServer:AddButton({
    Name = "Clipboard Discord Server Link",
    Callback = function()
        setclipboard("https://discord.gg/your-server-link")  -- Replace with your Discord server link
    end
})
