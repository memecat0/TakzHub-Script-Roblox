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
    -- Use a coroutine to prevent blocking the main thread
    coroutine.wrap(function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            elseif obj:IsA("MeshPart") or obj:IsA("UnionOperation") then
                obj.RenderFidelity = Enum.RenderFidelity.Performance
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj.Enabled = false
            end
        end
    end)()
end

-- Orion GUI setup
local Window = OrionLib:MakeWindow({
    Name = "TakzHub | v1",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroIcon = "rbxassetid://72444682975876",
    IntroText = "TakzHub | Loading..."
})

OrionLib:MakeNotification({
    Name = "Welcome!",
    Content = "TakzHub | you its enjoy!",
    Image = "rbxassetid://72444682975876",
    Time = 5
})

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://18675218518",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "inf yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

-- Script Tab
local ScriptTab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://18675246284",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

ScriptTab:AddButton({
    Name = "RedzHub | Blox Fruits",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
    end
})

ScriptTab:AddButton({
    Name = "Connect Hub | a dusty trip",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip",true))()
    end
})

ScriptTab:AddButton({
    Name = "OMG HUB | none game",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
    end
})

ScriptTab:AddButton({
    Name = "Starry Op | Break in 2",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Break-In-2-(Story)-Starry-OP-Script-Hub-160-Features-17869"))()
    end
})

ScriptTab:AddButton({
    Name = "FFJ HUB V2 | Doors",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sNvekgeL"))()
    end
})

ScriptTab:AddButton({
    Name = "FE KICK/BAN | NONE GAME",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZhenX21/FE-Kick-Ban-Script/main/source"))()
    end
})

local OurScriptTab = Window:MakeTab({
    Name = "Our Scripts",
    Icon = "rbxassetid://18675246284",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

OurScriptTab:AddButton({
    Name = "Legend of speed TakzHub | Legend of speed",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CataiHub/TakzHub-Script-Roblox/main/Legend-of-speed-script.lua"))()
    end
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://18676059123",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

CreditsTab:AddLabel("Owner - memecat0")

-- Update Log Tab
local UpdateLogTab = Window:MakeTab({
    Name = "Update Log",
    Icon = "rbxassetid://18675242942",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

UpdateLogTab:AddLabel("Updates (7.0)")

UpdateLogTab:AddLabel("Update log:")

UpdateLogTab:AddLabel("Added - Credits")

UpdateLogTab:AddLabel("Added - Scripts")

UpdateLogTab:AddLabel("Added - Fixed Esp highlight")

UpdateLogTab:AddLabel("Added - Game Supported all.")

UpdateLogTab:AddLabel("Added - Anti Lag")

UpdateLogTab:AddLabel("FIXED - TAB SETTINGS")

UpdateLogTab:AddLabel("Added - TAB DISCORD SERVER")

UpdateLogTab:AddLabel("FIXED - FIXED ANTI-LAG PING")

local DiscordTab = Window:MakeTab({
    Name = "Discord Server",
    Icon = "rbxassetid://18678198914",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

DiscordTab:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/j8Kdtnz6CA")  -- Replace with your Discord server link
    end
})

-- Settings Tab
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://18674553734",  -- Updated Tab icon asset ID
    PremiumOnly = false
})

SettingsTab:AddButton({
    Name = "Anti Lag",
    Callback = function()
        activateAntiLag()
    end
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

OrionLib:Init()
