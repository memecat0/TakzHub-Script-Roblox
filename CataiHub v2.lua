local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("DrRay", "Default")

local tab = DrRayLibrary.newTab("My Tab", "ImageIdHere")

tab.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)
