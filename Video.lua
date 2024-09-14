local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local roles
local Murder, Sheriff, Hero
local highlightEnabled = true

local Window = OrionLib:MakeWindow({Name = "Player Highlights", HidePremium = true, IntroText = "Highlight System", SaveConfig = true, ConfigFolder = "OrionTest"})
local HighlightTab = Window:MakeTab({Name = "Highlights", Icon = "rbxassetid://1234567890", PremiumOnly = false})
local SettingsTab = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://1234567890", PremiumOnly = false})

function CreateHighlight()
    for _, v in pairs(Players:GetChildren()) do
        if v ~= LP and v.Character then
            local highlight = v.Character:FindFirstChild("Highlight")
            if highlightEnabled and not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "Highlight"
                highlight.Parent = v.Character
            elseif not highlightEnabled and highlight then
                highlight:Destroy()
            end
        end
    end
end

function UpdateHighlights()
    for _, v in pairs(Players:GetChildren()) do
        if v ~= LP and v.Character then
            local highlight = v.Character:FindFirstChild("Highlight")
            if highlight and highlightEnabled then
                if v.Name == Sheriff and IsAlive(v) then
                    highlight.FillColor = Color3.fromRGB(0, 0, 225)
                elseif v.Name == Murder and IsAlive(v) then
                    highlight.FillColor = Color3.fromRGB(225, 0, 0)
                elseif v.Name == Hero and IsAlive(v) and not IsAlive(Players:FindFirstChild(Sheriff)) then
                    highlight.FillColor = Color3.fromRGB(255, 250, 0)
                else
                    highlight.FillColor = Color3.fromRGB(0, 225, 0)
                end
            end
        end
    end
end

function IsAlive(Player)
    for i, v in pairs(roles) do
        if Player.Name == i then
            return not v.Killed and not v.Dead
        end
    end
    return false
end

SettingsTab:AddToggle({
    Name = "Enable Highlights",
    Default = highlightEnabled,
    Callback = function(value)
        highlightEnabled = value
        CreateHighlight()
        UpdateHighlights()
    end
})

HighlightTab:AddButton({
    Name = "Update Highlights",
    Callback = function()
        if highlightEnabled then
            CreateHighlight()
            UpdateHighlights()
        end
    end
})

-- Auto-update highlights on RenderStepped
RunService.RenderStepped:Connect(function()
    roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
    for i, v in pairs(roles) do
        if v.Role == "Murderer" then
            Murder = i
        elseif v.Role == 'Sheriff' then
            Sheriff = i
        elseif v.Role == 'Hero' then
            Hero = i
        end
    end
    CreateHighlight()
    UpdateHighlights()
end)
