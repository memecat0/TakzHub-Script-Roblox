local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("TITLE", "DarkTheme")

local Tab = Window:NewTab("Test")
local Section = Tab:NewSection("TEST LOL")

Section:NewButton("test", "test", function()
    print("hello world")
end)
