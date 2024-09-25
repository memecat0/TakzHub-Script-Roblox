local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local function fetchUserAgent()
    local response = request({
        Url = "https://httpbin.org/user-agent",
        Method = "GET",
    })

    assert(type(response) == "table", "Response must be a table")
    assert(response.StatusCode == 200, "Did not return a 200 status code")
    
    local data = game:GetService("HttpService"):JSONDecode(response.Body)
    assert(type(data) == "table" and type(data["user-agent"]) == "string", "Did not return a table with a user-agent key")
    
    return data["user-agent"]
end

local Window = OrionLib:MakeWindow({
    Name = "Player Info",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "PlayerInfo",
    IntroText = "PlayerInfo"
})

local player = game.Players.LocalPlayer
local userId = player.UserId
local playerName = player.Name

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local gameId = game.GameId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local function getPlayerCount()
    return tostring(#game.Players:GetPlayers())
end

local Tab = Window:MakeTab({
    Name = "Player Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddLabel("User ID: " .. userId)
Tab:AddLabel("Player: " .. playerName)
local playerCountLabel = Tab:AddLabel("Players in Server: " .. getPlayerCount())
Tab:AddLabel("YOUR HWID: " .. HWID)
Tab:AddLabel("Game ID: " .. gameId)
Tab:AddLabel("Game Name: " .. GameName)

local userAgent = fetchUserAgent()
Tab:AddLabel("Executor Your: " .. userAgent)

game.Players.PlayerAdded:Connect(function()
    playerCountLabel:Set("Players in Server: " .. getPlayerCount())
end)

game.Players.PlayerRemoving:Connect(function()
    playerCountLabel:Set("Players in Server: " .. getPlayerCount())
end)

OrionLib:Init()
