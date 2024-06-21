-- Create the Script Hub GUI
local gui = Instance.new("ScreenGui")
gui.Name = "Cat Hub"

-- Create the title label
local title = Instance.new("TextLabel")
title.Text = "Cat Hub"
title.FontSize = 24
title.Font = "SourceSans"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Size = UDim2.new(0, 200, 0, 30)
title.Position = UDim2.new(0, 10, 0, 10)
gui:AddItem(title)

-- Create the tab button
local tabButton = Instance.new("TextButton")
tabButton.Text = "Test"
tabButton.FontSize = 18
tabButton.Font = "SourceSans"
tabButton.TextColor3 = Color3.new(1, 1, 1)
tabButton.BackgroundColor3 = Color3.new(0, 0, 0)
tabButton.Size = UDim2.new(0, 100, 0, 30)
tabButton.Position = UDim2.new(0, 10, 0, 50)
gui:AddItem(tabButton)

-- Create the button
local button = Instance.new("TextButton")
button.Text = "Click me!"
button.FontSize = 18
button.Font = "SourceSans"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.Size = UDim2.new(0, 150, 0, 30)
button.Position = UDim2.new(0, 10, 0, 90)
gui:AddItem(button)

-- Create the H1 element
local h1 = Instance.new("TextLabel")
h1.Text = "Scroll down to see more!"
h1.FontSize = 24
h1.Font = "SourceSans"
h1.TextColor3 = Color3.new(1, 1, 1)
h1.BackgroundColor3 = Color3.new(0, 0, 0)
h1.Size = UDim2.new(0, 200, 0, 30)
h1.Position = UDim2.new(0, 10, 0, 130)
gui:AddItem(h1)

-- Script to make the H1 element scroll down when clicked
h1.Activated:Connect(function()
h1.Position = UDim2.new(0, 10, 0, 200)
wait(0.5)
h1.Position = UDim2.new(0, 10, 0, 130)
end)

-- Script to make the GUI draggable
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
local delta = input.Position - dragStart
title.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
tabButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y + 40)
button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y + 80)
h1.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y + 120)
end

title.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = title.Position

input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
else
update(input)
end
end)
end
end)
