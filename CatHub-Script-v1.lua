local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Cat Hub Script v1", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "Cat Hub Script v1"})

OrionLib:MakeNotification({
	Name = "welcome to cat hub!",
	Content = "thanks its execute script cat hub!",
	Image = "rbxassetid://4483345998",
	Time = 4
})

OrionLib:MakeNotification({
	Name = "Discord Seever",
	Content = "discord server here: https://discord.gg/M4RSUWA5pp",
	Image = "rbxassetid://4483345998",
	Time = 3
})

local Tab = Window:MakeTab({
	Name = "Credit",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Credit first."
})

Tab:AddLabel("Owner to Discord on memecat0")

Tab:AddLabel("???")



local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Main"
})


Tab:AddButton({
	Name = "infinite yield",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})


Tab:AddSlider({
	Name = "Walkspeed",
	Min = 200, -- The minimum walkspeed value
	Max = 16, -- The maximum walkspeed value
	Default = 0, -- The default walkspeed value
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "WS",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
			player.Character.Humanoid.WalkSpeed = Value
		end
	end    
})



local Tab = Window:MakeTab({
	Name = "Blox Fruit",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "First its Script."
})

Tab:AddLabel("Who its change flag")

Tab1:AddToggle({
    Name = "Marines",
    Default = true,
    Save = true,
    Flag = "Marines"
})

print(OrionLib.Flags["Marines"].Value) -- prints the value of the toggle.


Tab1:AddToggle({
    Name = "Pirates",
    Default = true,
    Save = true,
    Flag = "Pirates"
})

print(OrionLib.Flags["Pirates"].Value) -- prints the value of the toggle.

OrionLib:Init()
