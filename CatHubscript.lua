local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("TakzHub v0.5", "Ocean")

repeat task.wait(0.25) until game:IsLoaded()

getgenv().Image = "rbxassetid://72444682975876"
getgenv().ToggleUI = "L"

task.spawn(function()
    if not getgenv().LoadedMobileUI then
        getgenv().LoadedMobileUI = true

        -- Create the ScreenGui
        local OpenUI = Instance.new("ScreenGui")
        OpenUI.Name = "OpenUI"
        OpenUI.Parent = game:GetService("CoreGui")
        OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        -- Create the ImageButton
        local ImageButton = Instance.new("ImageButton")
        ImageButton.Parent = OpenUI
        ImageButton.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
        ImageButton.BackgroundTransparency = 0.8
        ImageButton.Position = UDim2.new(0.9, 0, 0.1, 0)
        ImageButton.Size = UDim2.new(0, 45, 0, 45)
        ImageButton.Image = getgenv().Image
        ImageButton.Draggable = true

        -- Create rounded corners
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 10) -- Adjust this value for more or less rounding
        UICorner.Parent = ImageButton

        -- Create the UIStroke for the rainbow effect
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Parent = ImageButton
        UIStroke.Thickness = 2
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        -- Rainbow stroke effect
        task.spawn(function()
            while true do
                for i = 0, 1, 0.01 do
                    UIStroke.Color = Color3.fromHSV(i, 1, 1)
                    task.wait(0.1)
                end
            end
        end)

        -- Button click event to toggle the Fluent UI
        ImageButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true, getgenv().ToggleUI, false, game)
        end)
    end
end)

local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("first to credit!")

Section:NewLabel("Owner to memecat0")
Section:NewLabel("Helper to alexhub")
Section:NewLabel("Scripts to Roblox Scripts")
Section:NewLabel("he is thank you Roblox Scripts!")



local Tab = Window:NewTab("main")
local Section = Tab:NewSection("main")

Section:NewSlider("WalkSpeed", "too faster!", 250, 16, function(s) -- 350 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewButton("infinite yield", "cool infyield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Section:NewButton("troll fling Gui", "Troll Gui", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/memecat0/CatHubTrollyeet/main/CatHubTrollyeet'))()
end)

local Tab = Window:NewTab("Soon")
local Section = Tab:NewSection("soon")



local Tab = Window:NewTab("Scripts")
local Section = Tab:NewSection("Game of scripts")

Section:NewLabel("Blox fruit 🍎")

Section:NewButton("Blox fruit | Redz Hub", "like its good", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
end)

Section:NewButton("Blox fruit | Master", "it cuz loading so bad too", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/onepicesenpai/onepicesenpai/main/onichanokaka'))()
end)

Section:NewButton("Blox fruit | YMIE", "its like this YMIE GUI blox fruit good.", function()
    getgenv().Team = "Pirates"
getgenv().id = "1226743840325501060"
loadstring(game:HttpGet("https://raw.githubusercontent.com/NhiYeuAnh/YMIE-HUB/main/YMIEHUBV2.txt"))()
end)

Section:NewButton("Blox fruit | AIMBOT", "AIMBOT IS THIS LIKE THAT KILL BOUNTY!", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GalaxyTeamHub/Galaxy-Hub/main/GalaxyBloxFruit.lua"))()
end)

Section:NewLabel("King legacy 🗡")

Section:NewButton("King Legacy | ZEE", "its like that good?", function()
loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))()
end)
