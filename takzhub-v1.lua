loadstring(game:HttpGet(("https://pastebin.com/raw/qFq47UT3")))()
local Players = game:GetService("Players")
local ESP_ENABLED = false
local ESP_CONNECTIONS = {}

local HIGHLIGHT_COLOR = Color3.new(1, 1, 1)

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

MakeWindow({
  Hub = {
    Title = "TakzHub",
    Animation = "TakzHub Script V1.5"
  },
  Key = {
    KeySystem = false,
    Title = "Key System - TakzHub",
    Description = "this its loggin key system!",
    KeyLink = "1234",
    Keys = {"1234"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Running the Script...",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})

MinimizeButton({
  Image = "rbxassetid://72444682975876",
  Size = {40, 40},
  Color = Color3.fromRGB(10, 10, 10),
  Corner = true,
  Stroke = false,
  StrokeColor = Color3.fromRGB(255, 0, 0)
})

MakeNotifi({
  Title = "Welcome!",
  Text = "TakzHub | you its enjoy!",
  Time = 5
})

local Main = MakeTab({Name = "Main"})
local Script = MakeTab({Name = "Script"})
local OurScript = MakeTab({Name = "Our Script"})
local Credits = MakeTab({Name = "Credits"})
local UpdateLog = MakeTab({Name = "UpdateLog"})
local Discord = MakeTab({Name = "Discord"})
local Settings = MakeTab({Name = "Settings"})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

AddButton(Main, {
  Name = "Golden Apple | Only Game:Break in 2",
  Callback = function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local GiveToolEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("GiveTool")
        
        if GiveToolEvent then
            pcall(function()
                GiveToolEvent:FireServer("GoldenApple")
MakeNotifi({
  Title = "Golden Apple",
  Text = "You Have received a Golden Apple! (Here Join server: https://discord.gg/j8Kdtnz6CA) ❤",
  Time = 2
})
end)
        else
MakeNotifi({
  Title = "Error",
  Text = "Failed to find GiveTool event. (Here Join server: https://discord.gg/j8Kdtnz6CA) ❤",
  Time = 2
})
  end
end
})

AddButton(Main, {
  Name = "inf yield",
  Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  end
})

AddButton(Main, {
  Name = "Performance Stats GUI (FIXED)",
  Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/memecat0/TakzHub-Script-Roblox/refs/heads/main/PERFORMANCE-STAT.lua'))()
  end
})

AddButton(Main, {
  Name = "Player Info",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/memecat0/TakzHub-Script-Roblox/refs/heads/main/PlayerInfo.lua"))()
  end
})

AddButton(Script, {
  Name = "RedzHub | Blox fruits",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
  end
})

AddButton(Script, {
  Name = "Rise Hub | Blox fruits",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrashLua/BloxFruits/main/FreeScripts.lua"))()
  end
})

ScriptTab:AddButton({
    Name = "ARC HUB | King Legacy",
    Callback = function()
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

local Label = AddTextLabel(Credits, "Owner: i like its see think this user memecat0 on Discord")

local Label = AddTextLabel(UpdateLog, "Update Log:")

local Label = AddTextLabel(UpdateLog, "v1.5: nothing lol and Added Button player info")



AddButton(Discord, {
  Name = "Copy Discord Link",
  Callback = function()
    setclipboard("https://discord.gg/j8Kdtnz6CA")
MakeNotifi({
  Title = "Discord Server Clipboard!",
  Text = "Well enjoy clipboard now join discord server!",
  Time = 5
})
  end
})

AddButton(Settings, {
  Name = "anti lag",
  Callback = function()
    activateAntiLag()
  end
})

local Toggle = AddToggle(Settings, {
  Name = "Enable ESP",
  Default = false,
  Callback = function(Value)
    toggleESP(state)
  end
})
