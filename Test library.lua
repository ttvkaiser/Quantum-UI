local QuantumUI = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

function QuantumUI:CreateWindow(config)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "QuantumUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    local window = Instance.new("Frame")
    window.Size = config.Size or UDim2.fromOffset(600, 600)
    window.AnchorPoint = Vector2.new(0.5, 0.5)
    window.Position = UDim2.new(0.5, 0, 0.5, 0)
    window.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    window.BorderSizePixel = 0
    window.ZIndex = 10
    window.BackgroundTransparency = 0.15
    window.Parent = screenGui

    -- Glass effect
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 18)
    uICorner.Parent = window

    local uIStroke = Instance.new("UIStroke", window)
    uIStroke.Color = Color3.fromRGB(120, 120, 180)
    uIStroke.Thickness = 1
    uIStroke.Transparency = 0.4

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = window

    Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -100, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Title or "Quantum UI"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    local subLabel = Instance.new("TextLabel")
    subLabel.Size = UDim2.new(1, -100, 1, 0)
    subLabel.Position = UDim2.new(0, 10, 20, 0)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = config.SubTitle or "SubTitle"
    subLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextSize = 12
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = titleBar

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -70, 0, 5)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    minimizeButton.Text = "_"
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.TextSize = 20
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Parent = titleBar
    Instance.new("UICorner", minimizeButton).CornerRadius = UDim.new(1, 0)

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(65, 45, 45)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 20
    closeButton.BorderSizePixel = 0
    closeButton.Parent = titleBar
    Instance.new("UICorner", closeButton).CornerRadius = UDim.new(1, 0)

    -- Close button destroys UI and blur
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Minimize button hides window and shows tiny button on left-middle
    minimizeButton.MouseButton1Click:Connect(function()
        window.Visible = false

        -- Create tiny button on left-middle
        local tinyButton = Instance.new("ImageButton")
        tinyButton.Size = UDim2.new(0, 30, 0, 30)
        tinyButton.Position = UDim2.new(0, 10, 0.5, -15) -- left side, vertically centered
        tinyButton.AnchorPoint = Vector2.new(0, 0)
        tinyButton.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
        tinyButton.BorderSizePixel = 0
        tinyButton.ZIndex = 20
        tinyButton.Parent = screenGui
        tinyButton.Image = "rbxassetid://6023426915" -- Example icon, change if you want

        local uICornerTiny = Instance.new("UICorner")
        uICornerTiny.CornerRadius = UDim.new(1, 0)
        uICornerTiny.Parent = tinyButton

        tinyButton.MouseButton1Click:Connect(function()
            window.Visible = true
            tinyButton:Destroy()
        end)
    end)

-- Draggable
local dragging = false
local dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = window.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        window.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

    return window
end

return QuantumUI
