local supportedGames = { 
    3101667897
}

local placeId = game.PlaceId
local isSupported = false

for _, id in ipairs(supportedGames) do
    if placeId == id then
        isSupported = true
        break
    end
end

if isSupported then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Legend of Speed | Farming", HidePremium = false, SaveConfig = true, ConfigFolder = "TakzHub_legend_of_speed", IntroText = "Legend of speed TakzHub | Loading..", IntroIcon = "rbxassetid://72444682975876"})

    local farming = {
        AutoRebirth = false,
        AutoHoopsFarm = false,
        AutoOrbFarm = false,
        AutoGemsFarm = false
    }

    function AutoRebirth()
        while farming.AutoRebirth do
            local player = game.Players.LocalPlayer
            if player and player.leaderstats.Rebirths.Value < player.leaderstats.Rebirths.Max.Value then
                game:GetService("ReplicatedStorage").Events.Rebirth:FireServer()
            end
            wait(5)
        end
    end

    function AutoHoopsFarm()
        while farming.AutoHoopsFarm do
            for _,v in pairs(game.Workspace.Hoops:GetChildren()) do
                if v:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
            wait(1)
        end
    end

    function AutoOrbFarm()
        while farming.AutoOrbFarm do
            for _,v in pairs(game.Workspace.Orbs:GetChildren()) do
                if v:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
            wait(1)
        end
    end

    function AutoGemsFarm()
        while farming.AutoGemsFarm do
            for _,v in pairs(game.Workspace.Gems:GetChildren()) do
                if v:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
            wait(1)
        end
    end

    local FarmTab = Window:MakeTab({
        Name = "Farming",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    FarmTab:AddToggle({
        Name = "Auto Rebirth",
        Default = false,
        Callback = function(Value)
            farming.AutoRebirth = Value
            if Value then
                AutoRebirth()
            end
        end
    })

    FarmTab:AddToggle({
        Name = "Auto Hoops Farm",
        Default = false,
        Callback = function(Value)
            farming.AutoHoopsFarm = Value
            if Value then
                AutoHoopsFarm()
            end
        end
    })

    FarmTab:AddToggle({
        Name = "Auto Orb Farm",
        Default = false,
        Callback = function(Value)
            farming.AutoOrbFarm = Value
            if Value then
                AutoOrbFarm()
            end
        end
    })

    FarmTab:AddToggle({
        Name = "Auto Gems Farm",
        Default = false,
        Callback = function(Value)
            farming.AutoGemsFarm = Value
            if Value then
                AutoGemsFarm()
            end
        end
    })

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CreditsTab:AddLabel("memecat0 | owner")
  
    OrionLib:Init()

else
    game.Players.LocalPlayer:Kick("Unsupported game detected.")
end
