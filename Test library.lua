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

    -- Tab layout setup
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -150, 1, -40)
    contentFrame.Position = UDim2.new(0, 150, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Name = "ContentFrame"
    contentFrame.Parent = window

    local tabList = Instance.new("Frame")
    tabList.Size = UDim2.new(0, 150, 1, -40)
    tabList.Position = UDim2.new(0, 0, 0, 40)
    tabList.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    tabList.BorderSizePixel = 0
    tabList.Parent = window

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.Parent = tabList

    -- Tab Creation Function
    function QuantumUI:CreateTab(title)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.new(0, 5, 0, 0)
        button.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        button.BorderSizePixel = 0
        button.Text = title
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 16
        button.AutoButtonColor = true
        button.Parent = tabList

        local tabPage = Instance.new("ScrollingFrame")
        tabPage.Size = UDim2.new(1, 0, 1, 0)
        tabPage.Position = UDim2.new(0, 0, 0, 0)
        tabPage.BackgroundTransparency = 1
        tabPage.BorderSizePixel = 0
        tabPage.Visible = false
        tabPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
        tabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabPage.ScrollBarThickness = 6
        tabPage.Name = "Tab_" .. title:gsub("%s+", "")
        tabPage.Parent = contentFrame

        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 8)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = tabPage

        button.MouseButton1Click:Connect(function()
            for _, child in pairs(contentFrame:GetChildren()) do
                if child:IsA("Frame") or child:IsA("ScrollingFrame") then
                    child.Visible = false
                end
            end
            tabPage.Visible = true
        end)

        -- Auto select first tab
        if #contentFrame:GetChildren() == 1 then
            tabPage.Visible = true
        end

        return tabPage
    end

    -- Close button destroys UI
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Minimize button hides UI and shows a tiny icon
    minimizeButton.MouseButton1Click:Connect(function()
        window.Visible = false

        local tinyButton = Instance.new("ImageButton")
        tinyButton.Size = UDim2.new(0, 30, 0, 30)
        tinyButton.Position = UDim2.new(0, 10, 0.5, -15)
        tinyButton.AnchorPoint = Vector2.new(0, 0)
        tinyButton.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
        tinyButton.BorderSizePixel = 0
        tinyButton.ZIndex = 20
        tinyButton.Image = "rbxassetid://6023426915"
        tinyButton.Parent = screenGui

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
