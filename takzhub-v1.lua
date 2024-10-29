local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Players = game:GetService("Players")
local ESP_ENABLED = false
local ESP_CONNECTIONS = {}

local HIGHLIGHT_COLOR = Color3.new(1, 0, 0)

local function createHighlight(character)
    for i = 1, 3 do
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.Adornee = character
        highlight.FillColor = HIGHLIGHT_COLOR
        highlight.OutlineColor = Color3.new(255, 255, 255)
        highlight.OutlineTransparency = 0
        highlight.Name = "Highlight" .. i
    end
end

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

local function activateAntiLag()
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

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = true

local Toggle = Instance.new("ImageButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundTransparency = 1
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 45, 0, 45)
Toggle.Image = "rbxassetid://72444682975876"
Toggle.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0.2, 0)
Corner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Toggle
UIStroke.Thickness = 2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local isOn = false

local function setRainbowStroke()
    while true do
        for i = 0, 1, 0.01 do
            UIStroke.Color = Color3.fromHSV(i, 1, 1)
            wait(0.1)
        end
    end
end

coroutine.wrap(setRainbowStroke)()

local function toggleOrion()
    if gethui():FindFirstChild("Orion") then
        gethui().Orion.Enabled = not gethui().Orion.Enabled
    end
end

Toggle.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        Toggle.Image = "rbxassetid://72444682975876"
    else
        Toggle.Image = "rbxassetid://72444682975876"
    end
    toggleOrion()
end)

local Window = OrionLib:MakeWindow({
    Name = "🎃 TakzHub [Halloween] 🍬 | v1.5",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "TakzHub",
    IntroIcon = "rbxassetid://72444682975876",
    IntroText = "TakzHub | Loading..."
})

OrionLib:MakeNotification({
    Name = "Welcome!",
    Content = "TakzHub | you its enjoy!",
    Image = "rbxassetid://72444682975876",
    Time = 5
})

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://18675218518",
    PremiumOnly = false
})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

MainTab:AddButton({
    Name = "GET GOLDEN APPLE | ONLY GAME: BREAK IN 2",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local GiveToolEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("GiveTool")
        
        if GiveToolEvent then
            pcall(function()
                GiveToolEvent:FireServer("GoldenApple")
                OrionLib:MakeNotification({
Name = "Golden Apple",
Content = "You Have received a Golden Apple! (Here Join server: https://discord.gg/j8Kdtnz6CA) ❤",
Image = "rbxassetid://4483345998",
Time = 2.5
})
            end)
        else
            OrionLib:MakeNotification({
Name = "Error",
Content = "Failed to find GiveTool event. (Here Join server: https://discord.gg/j8Kdtnz6CA) ❤",
Image = "rbxassetid://4483345998",
Time = 2.5
})
        end
    end
})

MainTab:AddButton({
    Name = "inf yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

local ScriptTab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://18675246284",
    PremiumOnly = false
})

ScriptTab:AddLabel("Blox Fruits | Script")

ScriptTab:AddButton({
    Name = "RedzHub | Blox Fruits",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
    end
})

ScriptTab:AddButton({
    Name = "Rise Hub | Blox Fruits",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrashLua/BloxFruits/main/FreeScripts.lua"))()
    end
})

ScriptTab:AddLabel("King Legacy | Script")

ScriptTab:AddButton({
    Name = "ARC HUB | King Legacy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()
    end
})

ScriptTab:AddLabel("Dusty Trip | Script")

ScriptTab:AddButton({
    Name = "Connect Hub | a dusty trip",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip",true))()
    end
})

ScriptTab:AddLabel("Universal Script | Script")

ScriptTab:AddButton({
    Name = "OMG HUB | Universal Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
    end
})

ScriptTab:AddButton({
    Name = "ZENONHUB | Universal Script",
    Callback = function()
        loadstring(game:HttpGet("https://voidy.lol/ZenonUniversal.lua",true))()
    end
})

ScriptTab:AddButton({
    Name = "YARHM | Universal Script",
    Callback = function()
        loadstring(game:HttpGet("https://yarhm.goteamst.com/scr", false))()
    end
})

ScriptTab:AddLabel("Break in Story 1-2 | Script")

ScriptTab:AddButton({
    Name = "Starry Op | Break in 2",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Break-In-2-(Story)-Starry-OP-Script-Hub-160-Features-17869"))()
    end
})

ScriptTab:AddLabel("Doors 👁 | Script")

ScriptTab:AddButton({
    Name = "FFJ HUB V2 | Doors",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sNvekgeL"))()
    end
})

ScriptTab:AddLabel("Money Clicker Incremental | Script")

ScriptTab:AddButton({
    Name = "Money Clicker Incremental Script | Money Clicker Incremental",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/MoneyClicker"))()
    end
})

ScriptTab:AddLabel("Flags Battles Simulator | Script")

ScriptTab:AddButton({
    Name = "Flags Battles Simulator Script | Flags Battles Simulator",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/Utilities/main/FlagBattlesSim.lua"))()
    end
})

ScriptTab:AddLabel("Script name | Script")

ScriptTab:AddButton({
    Name = "Script name | Game name",
    Callback = function()
        loadstring(game:HttpGet(""))()
    end
})

ScriptTab:AddLabel("Script mame | Script")

ScriptTab:AddButton({
    Name = "Script name | Game name",
    Callback = function()
        loadstring(game:HttpGet(""))()
    end
})

local OurScriptTab = Window:MakeTab({
    Name = "Our Scripts",
    Icon = "rbxassetid://18675246284",
    PremiumOnly = false
})

OurScriptTab:AddButton({
    Name = "Legend of speed TakzHub | Legend of speed",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memecat0/TakzHub-Script-Roblox/refs/heads/main/Legend-of-speed-Script.lua"))()
    end
})

OurScriptTab:AddButton({
    Name = "Fps unlocker TakzHub | Universal Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memecat0/TakzHub-Script-Roblox/refs/heads/main/fps-cap-unlocker.lua"))()
    end
})

OurScriptTab:AddButton({
    Name = "PlayerInfo TakzHub | Universal Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memecat0/TakzHub-Script-Roblox/refs/heads/main/PlayerInfo.lua"))()
    end
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://18676059123",
    PremiumOnly = false
})

CreditsTab:AddParagraph("Owner","i like its see think this user memecat0 on Discord")

local UpdateLogTab = Window:MakeTab({
    Name = "Update Log",
    Icon = "rbxassetid://18675242942",
    PremiumOnly = false
})

UpdateLogTab:AddLabel("Update log:")

UpdateLogTab:AddParagraph("v1.5","Its nothing :)")


local DiscordTab = Window:MakeTab({
    Name = "Discord Server",
    Icon = "rbxassetid://18678198914",
    PremiumOnly = false
})

DiscordTab:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/j8Kdtnz6CA")
	OrionLib:MakeNotification({
Name = "Discord Server Clipboard!",
Content = "see a like now SERVER DISCORD Copied! ❤",
Image = "rbxassetid://4483345998",
Time = 1.5
})
    end
})

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://18674553734",
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
