-- Cataihub Script Hub

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Cataihub GUI V1", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Hey!",
	Content = "you are is welcome!",
	Image = "rbxassetid://4483345998",
	Time = 1
})

OrionLib:MakeNotification({
	Name = "Subscribe!",
	Content = "you is check Youtube Channel: Cataihub!",
	Image = "rbxassetid://4483345998",
	Time = 3
})

OrionLib:MakeNotification({
	Name = "Credit",
	Content = "By: Cataihub",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- player tab 

local Tab = Window:MakeTab({
	Name = "Player",
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
	ValueName = "WS",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Walkspeed = Value
	end    
})

OrionLib:Init()
