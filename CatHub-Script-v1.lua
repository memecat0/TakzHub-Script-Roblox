local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Players = game:GetService("Players")
local ESP_ENABLED = false
local ESP_CONNECTIONS = {}

local HIGHLIGHT_COLOR = Color3.new(1, 0, 0)  -- Default red color

-- Create a Highlight function
local function createHighlight(character)
    for i = 1, 3 do
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.Adornee = character
        highlight.FillColor = HIGHLIGHT_COLOR  -- Use selected color
        highlight.OutlineColor = Color3.new(1, 1, 1)  -- Default white outline
        highlight.OutlineTransparency = 0  -- Fully visible outline
        highlight.Name = "Highlight" .. i
    end
end

-- Function to setup ESP for each player
local function setupESP(player)
    local function onCharacterAdded(character)
        character:WaitForChild("HumanoidRootPart")
        if ESP_ENABLED then
            createHighlight(character)
        end
    end

    local charAddedConn = player.CharacterAdded:Connect(onCharacterAdded)

    if player.Character then
        onCharacterAdded(player.Character)
    end

    ESP_CONNECTIONS[player] = charAddedConn
end

-- Function to remove ESP for each player
local function removeESP(player)
    if ESP_CONNECTIONS[player] then
        ESP_CONNECTIONS[player]:Disconnect()
        ESP_CONNECTIONS[player] = nil
    end

    if player.Character then
        for _, obj in pairs(player.Character:GetChildren()) do
            if obj:IsA("Highlight") then
                obj:Destroy()
            end
        end
    end
end

-- Function to toggle ESP
local function toggleESP(state)
    ESP_ENABLED = state
    if state then
        for _, player in pairs(Players:GetPlayers()) do
            setupESP(player)
        end
        Players.PlayerAdded:Connect(setupESP)
        Players.PlayerRemoving:Connect(removeESP)
    else
        for _, player in pairs(Players:GetPlayers()) do
            removeESP(player)
        end
    end
end

-- Function for Anti Lag
local function activateAntiLag()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj:IsDescendantOf(workspace) then
            obj.Material = Enum.Material.SmoothPlastic
            obj.CastShadow = false
            if obj:IsA("MeshPart") or obj:IsA("UnionOperation") then
                obj.RenderFidelity = Enum.RenderFidelity.Performance
            end
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Enabled = false
        end
    end
end

-- Orion GUI setup
local Window = OrionLib:MakeWindow({
    Name = "CataiHub | Script Hub v1",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroIcon = "rbxassetid://18674254677",
    IntroText = "CataiHub | Loading..."
})

OrionLib:MakeNotification({
	Name = "Welcome!",
	Content = "CataiHub | Thank its you execute!",
	Image = "rbxassetid://18674254677",
	Time = 2
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://18676059123",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

CreditsTab:AddLabel("Owner - memecat0 On Roblox Soidjdjc")

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://18675218518",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "Test Button",
    Callback = function()
        print("Test Button clicked")
    end
})

-- Settings Tab
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://18674553734",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

SettingsTab:AddToggle({
    Name = "Enable ESP",
    Default = false,
    Callback = function(state)
        toggleESP(state)
    end
})

SettingsTab:AddColorpicker({
    Name = "Highlight Color",
    Default = HIGHLIGHT_COLOR,
    Callback = function(color)
        HIGHLIGHT_COLOR = color
        if ESP_ENABLED then
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then
                    for _, obj in pairs(player.Character:GetChildren()) do
                        if obj:IsA("Highlight") then
                            obj.FillColor = HIGHLIGHT_COLOR
                        end
                    end
                end
            end
        end
    end
})

-- Script Tab
local ScriptTab = Window:MakeTab({
    Name = "Script",
    Icon = "rbxassetid://18675246284",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

ScriptTab:AddButton({
    Name = "Test Script",
    Callback = function()
        print("Test Script button clicked")
        -- Place any script code you want to execute here
    end
})

-- Update Log Tab
local UpdateLogTab = Window:MakeTab({
    Name = "Update Log",
    Icon = "rbxassetid://18675242942",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

UpdateLogTab:AddLabel("Added - Credits")

UpdateLogTab:AddLabel("Added - Scripts")

UpdateLogTab:AddLabel("Added - Fixed Esp highlight")

UpdateLogTab:AddLabel("Added - Game Supported all.")

UpdateLogTab:AddLabel("Added - Anti Lag")

OrionLib:Init()
