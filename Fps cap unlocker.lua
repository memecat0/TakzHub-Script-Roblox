local RunService = game:GetService("RunService")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local FPSCap = 6500
local function SetFPSCap(fps)
    setfpscap(fps)
end

local function AutoAntiLag()
    if RunService:IsClient() then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end

SetFPSCap(FPSCap)
AutoAntiLag()

RunService.Heartbeat:Connect(function()
    AutoAntiLag()
end)

local Window = OrionLib:MakeWindow({Name = "Performance Settings", HidePremium = false, SaveConfig = true, ConfigFolder = "FpscapTakzHub", IntroText = "loading | Takzhub Fps unlocker", IntroIcon = "rbxassetid://72444682975876"})

local Tab = Window:MakeTab({
    Name = "FPS Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddSlider({
    Name = "FPS Cap",
    Min = 30,
    Max = 6500,
    Default = FPSCap,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 10,
    ValueName = "FPS",
    Callback = function(value)
        SetFPSCap(value)
    end    
})

Tab:AddToggle({
    Name = "Auto Anti-Lag",
    Default = true,
    Callback = function(value)
        if value then
            AutoAntiLag()
        end
    end    
})

OrionLib:Init()
