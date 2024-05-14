-- Cataihub Script Hub

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Cat Hub Gui script",
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

Tab:AddLabel("Cataihub Gui | Update v1.4.5")

Tab:AddLabel("New Cataihub Yield FE")

Tab:AddLabel("New Headless Korblox")



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
      		loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cataihub/Headless-Korblox/main/Headless%20korblox%20Fe')))()
  	end    
})

Tab:AddButton({
	Name = "Cat Hub Yield FE",
	Callback = function()
      		loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cataihub/Cataihub-yield/main/Cataihub%20yield%20FE')))()
  	end    
})

Tab:AddButton({
	Name = "Fly Gui v3.2",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/Cataihub/Fly-gui-v3/main/Fly%20gui%20v3'))()
  	end    
})

Tab:AddButton({
	Name = "Script Football Funsion 2",
	Callback = function()
      		loadstring(game:HttpGet"https://raw.githubusercontent.com/LOLking123456/fnieoi/main/dwqfewg")()
  	end    
})

OrionLib:Init()
