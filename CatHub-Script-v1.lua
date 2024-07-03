local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()
Window = Library.Main("Cat Hub v1","LeftAlt") -- change "LeftAlt" to key that you want will hide gui


local Tab = Window.NewTab("Credit")


local Section = Tab.NewSection("first its can credits!")


local Button = Section.NewButton("Owner: Cat Hub",function()
end)


local Button = Section.NewButton("Admin Respect: ???",function()
end)



local Tab = Window.NewTab("Main")


local Section = Tab.NewSection("Main")


local Button = Section.NewButton("infinite yield",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local DisabledToggle = Section.NewToggle("infinite jumped",function(bool)
-- Infinite Jump Script

-- Get the player's character
local player = game.Players.LocalPlayer
local character = player.Character

-- Create a function to make the player jump
local function jump()
    -- Make the player jump
    character.Humanoid.JumpPower = 50
    wait(0.1)
    character.Humanoid.JumpPower = 0
end

-- Create a loop to make the player jump infinitely
while true do
    -- Check if the player is on the ground
    if character.Humanoid.Floor Material == Enum.Material.Air then
        -- Make the player jump
        jump()
    end
    wait(0.1)
end
end,false) -- "false" is the default value of toggle
