local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()
Window = Library.Main("Cat Hub v2","LeftAlt") -- change "LeftAlt" to key that you want will hide gui


--//tab
local Tab = Window.NewTab("Main")


--//section
local Section = Tab.NewSection("Main Section")

--// Button
local Button = Section.NewButton("Fly Gui v3",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro69Yes/sussy-Script/main/SecuredFlyGuiv3.lua'))()
end)


--//tab
local Tab = Window.NewTab("Blade Ball 🔴")


--//section
local Section = Tab.NewSection("Scripts | Balde ball")

--// Button
local Button = Section.NewButton("Button Text",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FwmeAj/FwmeAj/main/Blade%20ball%20protection"))()
end)


--//tab
local Tab = Window.NewTab("Test")


--//section
local Section = Tab.NewSection("Test")

--// Button
local Button = Section.NewButton("Console check",function()
print("test")
end)
