local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

repeat task.wait(0.25) until game:IsLoaded()

repeat task.wait(0.25) until game:IsLoaded()

getgenv().Image = "rbxassetid://72444682975876" -- Asset ID for the button image
getgenv().ToggleUI = "LeftControl" -- Key to toggle the Fluent UI library

task.spawn(function()
    if not getgenv().LoadedMobileUI then
        getgenv().LoadedMobileUI = true

        -- Create the ScreenGui
        local OpenUI = Instance.new("ScreenGui")
        OpenUI.Name = "OpenUI"
        OpenUI.Parent = game:GetService("CoreGui")
        OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        -- Create the ImageButton
        local ImageButton = Instance.new("ImageButton")
        ImageButton.Parent = OpenUI
        ImageButton.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
        ImageButton.BackgroundTransparency = 0.8
        ImageButton.Position = UDim2.new(0.9, 0, 0.1, 0)
        ImageButton.Size = UDim2.new(0, 50, 0, 50)
        ImageButton.Image = getgenv().Image
        ImageButton.Draggable = true

        -- Create rounded corners
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 10) -- Adjust this value for more or less rounding
        UICorner.Parent = ImageButton

        -- Create the UIStroke for the rainbow effect
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Parent = ImageButton
        UIStroke.Thickness = 2
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        -- Rainbow stroke effect
        task.spawn(function()
            while true do
                for i = 0, 1, 0.01 do
                    UIStroke.Color = Color3.fromHSV(i, 1, 1)
                    task.wait(0.1)
                end
            end
        end)

        -- Button click event to toggle the Fluent UI
        ImageButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true, getgenv().ToggleUI, false, game)
        end)
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
