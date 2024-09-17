local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PerformanceStatCheckGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleLabel.Text = "PERFORMANCE STAT CHECK GUI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = frame
frame.Active = true
frame.Draggable = true

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0, 30)
fpsLabel.Position = UDim2.new(0, 0, 0, 35)
fpsLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
fpsLabel.Text = "FPS: ?"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.Parent = frame

local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(1, 0, 0, 30)
pingLabel.Position = UDim2.new(0, 0, 0, 70)
pingLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
pingLabel.Text = "Ping: ?ms"
pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pingLabel.Parent = frame

local antiLagButton = Instance.new("TextButton")
antiLagButton.Size = UDim2.new(0, 100, 0, 30)
antiLagButton.Position = UDim2.new(0.5, -50, 0, 110)
antiLagButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
antiLagButton.Text = "Anti Lag"
antiLagButton.TextColor3 = Color3.fromRGB(255, 255, 255)
antiLagButton.Parent = frame

local runService = game:GetService("RunService")
local stats = game:GetService("Stats")

local lastTime = tick()
local frameCount = 0
local fps = 0

runService.RenderStepped:Connect(function(deltaTime)
    frameCount = frameCount + 1
    local currentTime = tick()
    
    if currentTime - lastTime >= 1 then
        fps = frameCount / (currentTime - lastTime)
        fpsLabel.Text = "FPS: " .. math.floor(fps)
        lastTime = currentTime
        frameCount = 0
    end

    local ping = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    pingLabel.Text = "Ping: " .. ping .. "ms"
end)

antiLagButton.MouseButton1Click:Connect(function()
    local lighting = game:GetService("Lighting")

    lighting.GlobalShadows = false
    lighting.FogEnd = 100000 
    lighting.Brightness = 1 

    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("ParticleEmitter") or object:IsA("Trail") or object:IsA("Smoke") or object:IsA("Fire") then
            object.Enabled = false
        end
    end

    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01  -- Set graphics quality to low

end)
