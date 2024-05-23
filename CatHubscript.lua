local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()
Window = Library.Main("Cat Hub v2","LeftAlt") -- change "LeftAlt" to key that you want will hide gui

local StarterGui = game:GetService("StarterGui")
local assetID = "rbxasstid://11401835408"

wait(4)
StarterGui:SetCore("SendNotification", {
    Title = "Cat Hub | Script",
    Text = "Update to 5/22/2024"
    Duration = 4
})


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
