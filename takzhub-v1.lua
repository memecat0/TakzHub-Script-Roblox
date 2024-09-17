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
        highlight.OutlineColor = Color3.new(1, 1, 1)
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

local Window = OrionLib:MakeWindow({
    Name = "TakzHub | v1.1",
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

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://18675218518",
    PremiumOnly = false
})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

MainTab:AddLabel("Username: " .. localPlayer.Name)

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

MainTab:AddButton({
    Name = "Performance Stats GUI",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/CataiHub/TakzHub-Script-Roblox/main/Performance-Stat.lua'))()
    end
})

local ScriptTab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://18675246284",
    PremiumOnly = false
})

ScriptTab:AddButton({
    Name = "RedzHub | Blox Fruits",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
    end
})

ScriptTab:AddButton({
    Name = "Speed Hub X | Blox Fruits",
    Callback = function()
        loadstring(game:HttpGet(“https://gitlab.com/littlekiller2927/deltacore/-/raw/main/deltabf.lua”))()
    end
})

ScriptTab:AddButton({
    Name = "Rise Hub | Blox Fruits",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrashLua/BloxFruits/main/FreeScripts.lua"))()
    end
})

ScriptTab:AddButton({
    Name = "ARC HUB | King Legacy",
    Callback = function()
        getgenv().CustomDistance = 1
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()
    end
})

ScriptTab:AddButton({
    Name = "Connect Hub | a dusty trip",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip",true))()
    end
})

ScriptTab:AddButton({
    Name = "OMG HUB | Universal Script",
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


local OurScriptTab = Window:MakeTab({
    Name = "Our Scripts",
    Icon = "rbxassetid://18675246284",
    PremiumOnly = false
})

OurScriptTab:AddButton({
    Name = "Legend of speed TakzHub | Legend of speed",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CataiHub/TakzHub-Script-Roblox/main/Legend-of-speed-script.lua"))()
    end
})

OurScriptTab:AddButton({
    Name = "ESP MM2 TakzHub | Murder Mystery 2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CataiHub/TakzHub-Script-Roblox/main/MM2-ESP-HIGHLIGHTS.lua"))()
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

UpdateLogTab:AddParagraph("v1.1","MM2 ESP HIGHLIGHTS see script it this our scripts!")

UpdateLogTab:AddParagraph("v1.0","fix golden apple this notification.")


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
Content = "see a like now SERVER DISCORD Copied!",
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
