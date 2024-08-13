local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("CataiHub v2", "Default")

local tab = DrRayLibrary.newTab("My Tab", "ImageIdHere")

tab.newButton("click to button", "test!", function()
    print('test!')
end)
