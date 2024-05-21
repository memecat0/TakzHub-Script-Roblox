-- Cat Hub Script

local isOpen = false

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Cat Hub Script", HidePremium = false, SaveConfig = true, ConfigFolder = "Cat Hub", ToggleKey = Enum.KeyCode.Insert})

-- Function to toggle the window
local function toggleWindow()
    if isOpen then
        Window:Close()
    else
        Window:Open()
    end
    isOpen = not isOpen
end

-- Bind toggleWindow function to toggle key
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        toggleWindow()
    end
end)

OrionLib:MakeNotification({
    Name = "Cat Hub Script",
    Content = "New Script 5/7/2024",
    Image = "rbxassetid://4483345998",
    Time = 0.5
})

OrionLib:MakeNotification({
    Name = "Welcome!",
    Content = "You are is this welcome!",
    Image = "rbxassetid://4483345998",
    Time = 0.65
})

OrionLib:MakeNotification({
    Name = "Check Youtube Channel!",
    Content = "Youtube Channel: Cat Hub!",
    Image = "rbxassetid://4483345998",
    Time = 0.75
})

OrionLib:MakeNotification({
    Name = "Credit",
    Content = "By: Memecat0",
    Image = "rbxassetid://4483345998",
    Time = 1
})


-- Update log tab 

local Tab = Window:MakeTab({
    Name = "Update log",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Update log"
})

Tab:AddLabel("Cat Hub Script | Update v1.4.5")

-- Settings tab 

local Tab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Settings"
})

Tab:AddSlider({
    Name = "FPS Unlocker",
    Min = 30,
    Max = 240,
    Default = 60,
    Color = Color3.fromRGB(255,255,255),
    Increment = 5,
    ValueName = "fps",
    Callback = function(Value)
        game:GetService("RunService").RenderStepped:Connect(function()
            game:GetService("StarterGui").SetCore("MaxFPS", Value)
        end)
    end    
})

-- player tab 

local Tab = Window:MakeTab({
    Name = "Movement Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Movement"
})

Tab:AddSlider({
    Name = "Walkspeed",
    Min = 16,
    Max = 500,
    Default = 5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "walkspeed",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.Walkspeed = Value
    end    
})

Tab:AddSlider({
    Name = "Jump Heights",
    Min = 50,
    Max = 250,
    Default = 5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Heights",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end    
})



-- Script tab 

local Tab = Window:MakeTab({
    Name = "Script",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Script Execute"
})

Tab:AddButton({
    Name = "Cat Hub Yeet troll fe",
    Callback = function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cataihub/CatHubTrollyeet/main/CatHubTrollyeet')))()
    end    
})

Tab:AddButton({
    Name = "Headless Korblox FE",
    Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/H5yx10Jq'))()
    end    
})

Tab:AddButton({
    Name = "infinite yield FE",
    Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end    
})

Tab:AddButton({
    Name = "Fly Gui v3 FE",
    Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Cataihub/FLYGUIV3/main/Flyguiv3'))()
    end    
})

Tab:AddButton({
    Name = "Script Football Funsion 2",
    Callback = function()
            loadstring(game:HttpGet"https://raw.githubusercontent.com/LOLking123456/fnieoi/main/dwqfewg")()
    end    
})

Tab:AddButton({
    Name = "OP HUB | Blade ball",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FwmeAj/FwmeAj/main/Blade%20ball%20protection"))()
    end    
})

OrionLib:Init()
