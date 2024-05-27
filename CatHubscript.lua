local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TITLE", "DarkTheme")

local Tab = Window:NewTab("Test")
local Section = Tab:NewSection("TEST LOL")

Section:NewButton("test", "test", function()
    print("hello world")
end)
