-- Cataihub Script Hub

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Cataihub Gui v1.2", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

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
	Time = 3.2
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

Tab:AddButton({
	Name = "Fly Gui v3.2",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/Cataihub/Fly-gui-v3/main/Fly%20gui%20v3'))()
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
	Name = "Script Prison Life Cataihub GUI",
	Callback = function()
      		loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cataihub/Prison-life-Script-Gui-Cataihub/main/Prison%20life%20Cataihub%20script')))()
  	end    
})

Tab:AddButton({
	Name = "Script Football Funsion 2",
	Callback = function()
      		loadstring(game:HttpGet"https://raw.githubusercontent.com/LOLking123456/fnieoi/main/dwqfewg")()
  	end    
})

OrionLib:Init()
