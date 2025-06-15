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

    function QuantumUI:AddButton(tabPage, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 36)
    button.Position = UDim2.new(0, 5, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Parent = tabPage

    Instance.new("UICorner", button)

    button.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
end

function QuantumUI:AddToggle(tabPage, text, default, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -10, 0, 36)
    toggle.Position = UDim2.new(0, 5, 0, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    toggle.BorderSizePixel = 0
    toggle.Text = "[OFF] " .. text
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Font = Enum.Font.Gotham
    toggle.TextSize = 14
    toggle.Parent = tabPage

    Instance.new("UICorner", toggle)

    local state = default or false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = (state and "[ON] " or "[OFF] ") .. text
        if callback then callback(state) end
    end)
end

function QuantumUI:AddParagraph(tabPage, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 48)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextWrapped = true
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.Parent = tabPage
end

function QuantumUI:AddSection(tabPage, text)
    local section = Instance.new("TextLabel")
    section.Size = UDim2.new(1, -10, 0, 30)
    section.Position = UDim2.new(0, 5, 0, 0)
    section.BackgroundTransparency = 1
    section.Text = "— " .. text
    section.TextColor3 = Color3.fromRGB(150, 150, 220)
    section.Font = Enum.Font.GothamBold
    section.TextSize = 16
    section.TextXAlignment = Enum.TextXAlignment.Left
    section.Parent = tabPage
end

function QuantumUI:AddDropdown(tabPage, title, values, callback)
    local dropdown = Instance.new("TextButton")
    dropdown.Size = UDim2.new(1, -10, 0, 36)
    dropdown.Position = UDim2.new(0, 5, 0, 0)
    dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    dropdown.Text = "[Select] " .. title
    dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdown.Font = Enum.Font.Gotham
    dropdown.TextSize = 14
    dropdown.Parent = tabPage
    Instance.new("UICorner", dropdown)

    local selected = nil
    local open = false

    dropdown.MouseButton1Click:Connect(function()
        if open then return end
        open = true

        for _, v in pairs(values) do
            local opt = Instance.new("TextButton")
            opt.Size = UDim2.new(1, -10, 0, 30)
            opt.Position = UDim2.new(0, 5, 0, 0)
            opt.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
            opt.Text = v
            opt.TextColor3 = Color3.fromRGB(255, 255, 255)
            opt.Font = Enum.Font.Gotham
            opt.TextSize = 13
            opt.Parent = tabPage
            Instance.new("UICorner", opt)

            opt.MouseButton1Click:Connect(function()
                selected = v
                dropdown.Text = "[Selected] " .. v
                open = false
                if callback then callback(v) end

                for _, c in pairs(tabPage:GetChildren()) do
                    if c ~= dropdown and c ~= opt and c:IsA("TextButton") and c.Text ~= dropdown.Text then
                        c.Visible = true
                    elseif c ~= dropdown then
                        c:Destroy()
                    end
                end
            end)
        end
    end)
    end

    function QuantumUI:AddSlider(tabPage, text, min, max, default, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -10, 0, 40)
    container.Position = UDim2.new(0, 5, 0, 0)
    container.BackgroundTransparency = 1
    container.Parent = tabPage

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. tostring(default)
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, 0, 0, 14)
    sliderFrame.Position = UDim2.new(0, 0, 0, 24)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = container
    Instance.new("UICorner", sliderFrame)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(120, 120, 255)
    fill.BorderSizePixel = 0
    fill.Parent = sliderFrame
    Instance.new("UICorner", fill)

    local dragging = false
    local UIS = game:GetService("UserInputService")

    local function update(input)
        local rel = input.Position.X - sliderFrame.AbsolutePosition.X
        local pct = math.clamp(rel / sliderFrame.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        local value = math.floor(min + (max - min) * pct)
        label.Text = text .. ": " .. tostring(value)
        if callback then callback(value) end
    end

    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            update(input)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
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
