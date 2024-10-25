local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "TakzHub Script V2", HidePremium = false, SaveConfig = true, ConfigFolder = "TakzHub"})

OrionLib:MakeNotification({
	Name = "Welcome!",
	Content = "enjoy.",
	Image = "rbxassetid://4483345998",
	Time = 3
})

local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Button!",
	Callback = function()
      		print("button pressed")
  	end    
})
