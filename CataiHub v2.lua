local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("CataiHub v2", "Default")

local tab = DrRayLibrary.newTab("Main", "ImageIdHere")

tab.newToggle("Test", "hi", true, function(toggleState)
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)

local tab = DrRayLibrary.newTab("Script", "ImageIdHere")

tab.newButton("click to button", "test!", function()
    print('test!')
end)

tab.newButton("click to button", "test!", function()
    print('test!')
end)

tab.newButton("click to button", "test!", function()
    print('test!')
end)

tab.newButton("click to button", "test!", function()
    print('test!')
end)

tab.newButton("click to button", "test!", function()
    print('test!')
end)

tab.newButton("click to button", "test!", function()
    print('test!')
end)

tab.newButton("click to button", "test!", function()
    print('test!')
end)

tab.newButton("click to button", "test!", function()
    print('test!')
end)
