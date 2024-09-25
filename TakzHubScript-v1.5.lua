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
        ImageButton.Size = UDim2.new(0, 45, 0, 45)
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

local userAgent = fetchUserAgent()

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Welcome!",
        Content = "Enjoy its Execute!",
        SubContent = "SubContent", -- Optional
        Duration = 2 -- Set to nil to make the notification not disappear
    })

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
    Home = Window:AddTab({ Title = "Home", Icon = "rbxassetid://18675218518" }),
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://18675218518" })
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

    Tabs.Home:AddParagraph({
        Title = "Executor:",
        Content = "Executor Your: .. userAgent,"
    })
    
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
