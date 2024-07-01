local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Cat Hub v0.5", "Ocean")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 90, 0, 38)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Open"
Toggle.TextColor3 = Color3.fromRGB(248, 248, 248)
Toggle.TextSize = 28.000
Toggle.Draggable = true

local isOpen = false

Toggle.MouseButton1Click:Connect(function()
Toggle.Text = "Close"
isOpen = true
end
end)

local Corner = Instance.new("UICorner")
Corner.Name = "Corner"
Corner.Parent = Toggle

local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("first to credit!")

Section:NewLabel("Owner to memecat0")
Section:NewLabel("Helper to alexhub")
Section:NewLabel("Scripts to Roblox Scripts")
Section:NewLabel("he is thank you Roblox Scripts!")



local Tab = Window:NewTab("main")
local Section = Tab:NewSection("main")

Section:NewSlider("WalkSpeed", "too faster!", 350, 0, function(s) -- 350 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewButton("infinite yield", "cool infyield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Section:NewButton("troll fling Gui", "ButtonInfo", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CatHub027/CatHubTrollyeet/main/CatHubTrollyeet'))()
end)




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
