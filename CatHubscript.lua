local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Cat Hub v0.5", "Ocean")


local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("first to credit!")

Section:NewLabel("Owner to memecat0")
Section:NewLabel("Helper to alexhub")



local Tab = Window:NewTab("main")
local Section = Tab:NewSection("main")

Section:NewSlider("WalkSpeed", "too faster!", 350, 0, function(s) -- 350 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewButton("infinite yield", "cool infyield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
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
