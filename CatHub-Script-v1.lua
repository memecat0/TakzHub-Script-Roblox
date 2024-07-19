local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Cat Hub Script v1", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "Cat Hub Script v1"})

OrionLib:MakeNotification({
	Name = "welcome to cat hub!",
	Content = "thanks its execute script cat hub!",
	Image = "rbxassetid://4483345998",
	Time = 4
})

OrionLib:MakeNotification({
	Name = "Discord Server",
	Content = "discord server here: https://discord.gg/M4RSUWA5pp",
	Image = "rbxassetid://4483345998",
	Time = 3
})
