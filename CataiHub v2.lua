local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("CataiHub v2", "Default")

local tab = DrRayLibrary.newTab("Main", "ImageIdHere")

tab.newToggle("WALKSPEED", "FAST TOO!", true, function(toggleState)
    if toggleState then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 150
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
