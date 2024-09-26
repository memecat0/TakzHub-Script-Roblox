local lp = game:GetService("Players").LocalPlayer
local themeColor = Color3.fromRGB(255, 254, 179)  -- Theme color

local function gplr(String)
	local Found = {}
	local strl = String:lower()
	local players = game:GetService("Players"):GetPlayers()

	if strl == "all" then
		return players
	elseif strl == "others" then
		for _, v in pairs(players) do
			if v.Name ~= lp.Name then
				table.insert(Found, v)
			end
		end
	elseif strl == "me" then
		return {lp}
	else
		for _, v in pairs(players) do
			if v.Name:lower():sub(1, #String) == strl then
				table.insert(Found, v)
			end
		end
	end
	return Found
end

local function notif(str, dur)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Fe Yeet Gui Cat",
		Text = "made by memecat0",
		Icon = "rbxassetid://107323315494969",
		Duration = dur or 5
	})
end

--// GUI Setup

local h = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

h.Name = "h"
h.Parent = game:GetService("CoreGui")
h.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = h
Main.Active = true
Main.Draggable = true
Main.BackgroundColor3 = themeColor  -- Apply theme color here
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.1745, 0, 0.4595, 0)
Main.Size = UDim2.new(0, 454, 0, 218)
Main.Image = "rbxassetid://107323315494969"

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(0, 454, 0, 44)

Title.Name = "Title"
Title.Parent = Top
Title.BackgroundColor3 = themeColor  -- Apply theme color here
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0.295, 0)
Title.Size = UDim2.new(0, 454, 0, 30)
Title.Font = Enum.Font.SourceSans
Title.Text = "FE Yeet Gui (Cat Goku Standing)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

TextBox.Parent = Main
TextBox.BackgroundColor3 = themeColor  -- Apply theme color here
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.070, 0, 0.270, 0)
TextBox.Size = UDim2.new(0, 388, 0, 62)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Username Here (User)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Dark text for contrast
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

TextButton.Parent = Main
TextButton.BackgroundColor3 = themeColor  -- Apply theme color here
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.104, 0, 0.596, 0)
TextButton.Size = UDim2.new(0, 359, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Cheese em'"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Dark text for contrast
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

TextButton.MouseButton1Click:Connect(function()
	local Target = gplr(TextBox.Text)
	if Target[1] then
		Target = Target[1]
		
		local Thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
		Thrust.Force = Vector3.new(9999,9999,9999)
		Thrust.Name = "YeetForce"
		repeat
			lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
			Thrust.Location = Target.Character.HumanoidRootPart.Position
			game:GetService("RunService").Heartbeat:wait()
		until not Target.Character:FindFirstChild("Head")
	else
		notif("player doesn't exist")
	end
end)

--// Notification on load
notif("Loaded successfully! Credits: memecat0", 5)
