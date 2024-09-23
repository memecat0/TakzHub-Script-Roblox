local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local UserInputService = game:GetService("UserInputService")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

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

local function toggleFluent()
    if gethui():FindFirstChild("Fluent") then
        gethui().Fluent.Enabled = not gethui().Fluent.Enabled
    end
end

local function toggleState()
    isOn = not isOn
    if isOn then
        Toggle.Image = "rbxassetid://72444682975876"  -- Replace with actual 'on' image
    else
        Toggle.Image = "rbxassetid://72444682975876"  -- Replace with actual 'off' image
    end
    toggleFluent()
end

-- Mouse click event
Toggle.MouseButton1Click:Connect(toggleState)

-- Keybind for LeftControl
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.LeftControl and not gameProcessedEvent then
        toggleState()
    end
end)


local Window = Fluent:CreateWindow({
    Title = "TakzHub " .. Fluent.Version,
    SubTitle = "Script",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://18675218518" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
