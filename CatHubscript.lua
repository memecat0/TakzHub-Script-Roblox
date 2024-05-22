local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()
Window = Library.Main("Cat Hub v2","LeftAlt") -- change "LeftAlt" to key that you want will hide gui

local StarterGui = game:GetService("StarterGui")
local assetID = "your_rbx_asset_id"

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

