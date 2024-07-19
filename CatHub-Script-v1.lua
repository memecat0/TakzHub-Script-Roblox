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



local Tab = Window:MakeTab({
	Name = "Blox Fruit Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Blox Fruit its this Script!"
})

Tab:AddButton({
	Name = "RedzHub Script",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
  	end    
})

Tab:AddButton({
	Name = "RedzHub Script",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
  	end    
})

Tab:AddButton({
	Name = "RedzHub Script",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
  	end    
})

Tab:AddButton({
	Name = "RedzHub Script",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
  	end    
})

Tab:AddButton({
	Name = "RedzHub Script",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
  	end    
})



local Tab = Window:MakeTab({
	Name = "King legacy Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "King legacy its this Script!"
})

Tab:AddButton({
	Name = "Zee Hub Script",
	Callback = function()
      		loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))()
  	end    
})



local Tab = Window:MakeTab({
	Name = "Blade ball Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Blade ball its this Script!"
})

Tab:AddButton({
	Name = "AUTO PARRY | BLADE BALL Script",
	Callback = function()
      		loadstring(game:HttpGet(“https://paste.gg/p/anonymous/1734a4ee207844b994df2f36157afacd/files/1e79ac12fc8a47ef8263d5e9d43b7137/raw”))()
  	end    
})

Tab:AddButton({
	Name = "Close combat | BLADE BALL Script",
	Callback = function()
      		loadstring(game:HttpGet(“https://raw.githubusercontent.com/kidshop4/scriptbladeballk/main/bladeball.lua”))()
  	end    
})

Tab:AddButton({
	Name = "Bedol | BLADE BALL Script",
	Callback = function()
      		_G.UI_Size = 200
loadstring(game:HttpGet(“https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua”))()
  	end    
})

OrionLib:Init()
