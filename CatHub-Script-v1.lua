local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()
Window = Library.Main("Cat Hub v1","LeftAlt") -- change "LeftAlt" to key that you want will hide gui


--//tab
local Tab = Window.NewTab("Credit")


--//section
local Section = Tab.NewSection("first its can credits!")


--// Button
local Button = Section.NewButton("Owner: Cat Hub",function()
end)



--//tab
local Tab = Window.NewTab("Your Tab Text")


--//section
local Section = Tab.NewSection("Section Text")


--// Button
local Button = Section.NewButton("Button Text",function()
-- code here
end)
