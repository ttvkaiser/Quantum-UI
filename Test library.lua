local QuantumUI = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Define 10 themes with color sets
local Themes = {
    Cyber = {
        Accent = Color3.fromRGB(0, 255, 200),
        Background = Color3.fromRGB(10, 10, 15),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(0, 255, 255),
        TitleBar = Color3.fromRGB(20, 20, 30),
        TitleText = Color3.fromRGB(0, 255, 255),
        SubTitleText = Color3.fromRGB(100, 255, 255),
        Button = Color3.fromRGB(0, 180, 180),
        ButtonText = Color3.fromRGB(0, 255, 255),
        TabBackground = Color3.fromRGB(20, 20, 30),
        TabButton = Color3.fromRGB(0, 180, 180),
        TabButtonText = Color3.fromRGB(0, 255, 255),
        ToggleOff = Color3.fromRGB(50, 50, 60),
        ToggleOn = Color3.fromRGB(0, 200, 200),
        ParagraphText = Color3.fromRGB(150, 255, 255),
        SectionText = Color3.fromRGB(0, 200, 200),
        SliderBackground = Color3.fromRGB(50, 50, 60),
        SliderFill = Color3.fromRGB(0, 255, 255),
        MinimizeButton = Color3.fromRGB(0, 100, 100),
        CloseButton = Color3.fromRGB(0, 150, 150)
    },

    Blood = {
        Accent = Color3.fromRGB(180, 20, 20),
        Background = Color3.fromRGB(40, 10, 10),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(180, 80, 80),
        TitleBar = Color3.fromRGB(60, 15, 15),
        TitleText = Color3.fromRGB(255, 180, 180),
        SubTitleText = Color3.fromRGB(160, 90, 90),
        Button = Color3.fromRGB(100, 30, 30),
        ButtonText = Color3.fromRGB(255, 180, 180),
        TabBackground = Color3.fromRGB(70, 15, 15),
        TabButton = Color3.fromRGB(90, 20, 20),
        TabButtonText = Color3.fromRGB(255, 180, 180),
        ToggleOff = Color3.fromRGB(90, 20, 20),
        ToggleOn = Color3.fromRGB(180, 70, 70),
        ParagraphText = Color3.fromRGB(255, 150, 150),
        SectionText = Color3.fromRGB(200, 100, 100),
        SliderBackground = Color3.fromRGB(90, 20, 20),
        SliderFill = Color3.fromRGB(180, 70, 70),
        MinimizeButton = Color3.fromRGB(75, 15, 15),
        CloseButton = Color3.fromRGB(120, 20, 20)
    },

    NeonGreen = {
        Accent = Color3.fromRGB(50, 255, 50),
        Background = Color3.fromRGB(10, 40, 10),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(80, 255, 80),
        TitleBar = Color3.fromRGB(20, 60, 20),
        TitleText = Color3.fromRGB(150, 255, 150),
        SubTitleText = Color3.fromRGB(100, 200, 100),
        Button = Color3.fromRGB(60, 180, 60),
        ButtonText = Color3.fromRGB(220, 255, 220),
        TabBackground = Color3.fromRGB(20, 60, 20),
        TabButton = Color3.fromRGB(40, 120, 40),
        TabButtonText = Color3.fromRGB(180, 255, 180),
        ToggleOff = Color3.fromRGB(50, 70, 50),
        ToggleOn = Color3.fromRGB(80, 255, 80),
        ParagraphText = Color3.fromRGB(180, 255, 180),
        SectionText = Color3.fromRGB(100, 255, 100),
        SliderBackground = Color3.fromRGB(50, 70, 50),
        SliderFill = Color3.fromRGB(80, 255, 80),
        MinimizeButton = Color3.fromRGB(40, 100, 40),
        CloseButton = Color3.fromRGB(70, 150, 70)
    },

    PurpleHaze = {
        Accent = Color3.fromRGB(150, 0, 255),
        Background = Color3.fromRGB(30, 10, 40),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(180, 70, 255),
        TitleBar = Color3.fromRGB(60, 20, 80),
        TitleText = Color3.fromRGB(220, 180, 255),
        SubTitleText = Color3.fromRGB(160, 130, 200),
        Button = Color3.fromRGB(100, 40, 180),
        ButtonText = Color3.fromRGB(255, 180, 255),
        TabBackground = Color3.fromRGB(70, 20, 90),
        TabButton = Color3.fromRGB(90, 40, 190),
        TabButtonText = Color3.fromRGB(230, 180, 255),
        ToggleOff = Color3.fromRGB(80, 30, 130),
        ToggleOn = Color3.fromRGB(150, 100, 255),
        ParagraphText = Color3.fromRGB(200, 150, 255),
        SectionText = Color3.fromRGB(150, 100, 255),
        SliderBackground = Color3.fromRGB(80, 30, 130),
        SliderFill = Color3.fromRGB(180, 100, 255),
        MinimizeButton = Color3.fromRGB(60, 20, 90),
        CloseButton = Color3.fromRGB(90, 40, 180)
    },

    SolarFlare = {
        Accent = Color3.fromRGB(255, 100, 0),
        Background = Color3.fromRGB(40, 20, 5),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(255, 130, 20),
        TitleBar = Color3.fromRGB(70, 35, 10),
        TitleText = Color3.fromRGB(255, 180, 100),
        SubTitleText = Color3.fromRGB(200, 130, 70),
        Button = Color3.fromRGB(150, 80, 0),
        ButtonText = Color3.fromRGB(255, 200, 150),
        TabBackground = Color3.fromRGB(90, 45, 10),
        TabButton = Color3.fromRGB(130, 70, 20),
        TabButtonText = Color3.fromRGB(255, 180, 100),
        ToggleOff = Color3.fromRGB(100, 50, 10),
        ToggleOn = Color3.fromRGB(255, 130, 50),
        ParagraphText = Color3.fromRGB(255, 150, 80),
        SectionText = Color3.fromRGB(255, 180, 120),
        SliderBackground = Color3.fromRGB(100, 50, 10),
        SliderFill = Color3.fromRGB(255, 140, 40),
        MinimizeButton = Color3.fromRGB(120, 50, 10),
        CloseButton = Color3.fromRGB(180, 60, 20)
    },

    OceanBlue = {
        Accent = Color3.fromRGB(0, 130, 255),
        Background = Color3.fromRGB(10, 20, 40),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(80, 150, 255),
        TitleBar = Color3.fromRGB(20, 40, 70),
        TitleText = Color3.fromRGB(180, 210, 255),
        SubTitleText = Color3.fromRGB(140, 170, 220),
        Button = Color3.fromRGB(30, 80, 150),
        ButtonText = Color3.fromRGB(220, 240, 255),
        TabBackground = Color3.fromRGB(20, 40, 70),
        TabButton = Color3.fromRGB(50, 100, 180),
        TabButtonText = Color3.fromRGB(200, 220, 255),
        ToggleOff = Color3.fromRGB(30, 40, 60),
        ToggleOn = Color3.fromRGB(0, 130, 255),
        ParagraphText = Color3.fromRGB(150, 190, 255),
        SectionText = Color3.fromRGB(100, 140, 220),
        SliderBackground = Color3.fromRGB(30, 40, 60),
        SliderFill = Color3.fromRGB(0, 130, 255),
        MinimizeButton = Color3.fromRGB(30, 80, 150),
        CloseButton = Color3.fromRGB(70, 120, 200)
    },

    DarkMode = {
        Accent = Color3.fromRGB(100, 100, 100),
        Background = Color3.fromRGB(15, 15, 15),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(130, 130, 130),
        TitleBar = Color3.fromRGB(25, 25, 25),
        TitleText = Color3.fromRGB(200, 200, 200),
        SubTitleText = Color3.fromRGB(150, 150, 150),
        Button = Color3.fromRGB(60, 60, 60),
        ButtonText = Color3.fromRGB(220, 220, 220),
        TabBackground = Color3.fromRGB(30, 30, 30),
        TabButton = Color3.fromRGB(50, 50, 50),
        TabButtonText = Color3.fromRGB(200, 200, 200),
        ToggleOff = Color3.fromRGB(50, 50, 50),
        ToggleOn = Color3.fromRGB(100, 100, 100),
        ParagraphText = Color3.fromRGB(180, 180, 180),
        SectionText = Color3.fromRGB(130, 130, 130),
        SliderBackground = Color3.fromRGB(50, 50, 50),
        SliderFill = Color3.fromRGB(100, 100, 100),
        MinimizeButton = Color3.fromRGB(60, 60, 60),
        CloseButton = Color3.fromRGB(90, 90, 90)
    },

    Sunset = {
        Accent = Color3.fromRGB(255, 120, 70),
        Background = Color3.fromRGB(40, 20, 15),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(255, 150, 90),
        TitleBar = Color3.fromRGB(80, 40, 30),
        TitleText = Color3.fromRGB(255, 180, 150),
        SubTitleText = Color3.fromRGB(220, 160, 120),
        Button = Color3.fromRGB(130, 70, 50),
        ButtonText = Color3.fromRGB(255, 210, 180),
        TabBackground = Color3.fromRGB(90, 50, 40),
        TabButton = Color3.fromRGB(130, 70, 60),
        TabButtonText = Color3.fromRGB(255, 180, 150),
        ToggleOff = Color3.fromRGB(80, 50, 40),
        ToggleOn = Color3.fromRGB(255, 130, 60),
        ParagraphText = Color3.fromRGB(255, 180, 150),
        SectionText = Color3.fromRGB(255, 130, 70),
        SliderBackground = Color3.fromRGB(80, 50, 40),
        SliderFill = Color3.fromRGB(255, 140, 90),
        MinimizeButton = Color3.fromRGB(130, 60, 40),
        CloseButton = Color3.fromRGB(180, 90, 60)
    },

    Mint = {
        Accent = Color3.fromRGB(120, 255, 180),
        Background = Color3.fromRGB(20, 40, 30),
        BackgroundTransparency = 0.15,
        Stroke = Color3.fromRGB(140, 255, 200),
        TitleBar = Color3.fromRGB(50, 100, 80),
        TitleText = Color3.fromRGB(180, 255, 220),
        SubTitleText = Color3.fromRGB(140, 220, 180),
        Button = Color3.fromRGB(70, 180, 120),
        ButtonText = Color3.fromRGB(210, 255, 230),
        TabBackground = Color3.fromRGB(50, 100, 80),
        TabButton = Color3.fromRGB(90, 180, 140),
        TabButtonText = Color3.fromRGB(200, 255, 220),
        ToggleOff = Color3.fromRGB(70, 100, 80),
        ToggleOn = Color3.fromRGB(120, 255, 180),
        ParagraphText = Color3.fromRGB(180, 255, 220),
        SectionText = Color3.fromRGB(120, 255, 180),
        SliderBackground = Color3.fromRGB(70, 100, 80),
        SliderFill = Color3.fromRGB(120, 255, 180),
        MinimizeButton = Color3.fromRGB(70, 150, 100),
        CloseButton = Color3.fromRGB(110, 200, 140)
    },
}

-- Choose your theme here:
local chosenTheme = Themes.Cyber -- Change this to any key like Themes.Blood, Themes.PurpleHaze, etc

function QuantumUI:CreateWindow(config)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "QuantumUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    local window = Instance.new("Frame")
    window.Size = config.Size or UDim2.fromOffset(600, 600)
    window.AnchorPoint = Vector2.new(0.5, 0.5)
    window.Position = UDim2.new(0.5, 0, 0.5, 0)
    window.BackgroundColor3 = Color3.fromRGB(40, 10, 10) -- Dark red base
    window.BorderSizePixel = 0
    window.ZIndex = 10
    window.BackgroundTransparency = 0.15
    window.Parent = screenGui

    -- Glass effect
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 18)
    uICorner.Parent = window

    local uIStroke = Instance.new("UIStroke", window)
    uIStroke.Color = Color3.fromRGB(180, 80, 80) -- red stroke
    uIStroke.Thickness = 1
    uIStroke.Transparency = 0.4

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(60, 15, 15) -- darker red
    titleBar.BorderSizePixel = 0
    titleBar.Parent = window

    Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -100, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Title or "Quantum UI"
    titleLabel.TextColor3 = Color3.fromRGB(255, 180, 180) -- light red text
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    local subLabel = Instance.new("TextLabel")
    subLabel.Size = UDim2.new(1, -100, 1, 0)
    subLabel.Position = UDim2.new(0, 10, 20, 0)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = config.SubTitle or "SubTitle"
    subLabel.TextColor3 = Color3.fromRGB(160, 90, 90) -- muted red
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextSize = 12
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = titleBar

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -70, 0, 5)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(75, 15, 15)
    minimizeButton.Text = "_"
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.TextColor3 = Color3.fromRGB(255, 180, 180)
    minimizeButton.TextSize = 20
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Parent = titleBar
    Instance.new("UICorner", minimizeButton).CornerRadius = UDim.new(1, 0)

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(120, 20, 20)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextColor3 = Color3.fromRGB(255, 180, 180)
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
    tabList.BackgroundColor3 = Color3.fromRGB(70, 15, 15) -- tab background red
    tabList.BorderSizePixel = 0
    tabList.Parent = window

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 6)
    tabLayout.Parent = tabList

    function QuantumUI:CreateTab(title)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.new(0, 5, 0, 0)
        button.BackgroundColor3 = Color3.fromRGB(90, 20, 20)
        button.BorderSizePixel = 0
        button.Text = title
        button.TextColor3 = Color3.fromRGB(255, 180, 180)
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
        button.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
        button.BorderSizePixel = 0
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 180, 180)
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
        toggle.BackgroundColor3 = Color3.fromRGB(90, 20, 20)
        toggle.BorderSizePixel = 0
        toggle.Text = "[OFF] " .. text
        toggle.TextColor3 = Color3.fromRGB(255, 180, 180)
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
        label.TextColor3 = Color3.fromRGB(255, 150, 150)
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
        section.TextColor3 = Color3.fromRGB(200, 100, 100)
        section.Font = Enum.Font.GothamBold
        section.TextSize = 25
        section.TextXAlignment = Enum.TextXAlignment.Left
        section.Parent = tabPage
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
        label.TextColor3 = Color3.fromRGB(255, 150, 150)
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, 0, 0, 14)
        sliderFrame.Position = UDim2.new(0, 0, 0, 24)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(90, 20, 20)
        sliderFrame.BorderSizePixel = 0
        sliderFrame.Parent = container
        Instance.new("UICorner", sliderFrame)

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
        fill.BorderSizePixel = 0
        fill.Parent = sliderFrame
        Instance.new("UICorner", fill)

        local dragging = false

        local function update(input)
            local rel = input.Position.X - sliderFrame.AbsolutePosition.X
            local pct = math.clamp(rel / sliderFrame.AbsoluteSize.X, 0, 1)
            fill.Size = UDim2.new(pct, 0, 1, 0)
            local value = math.floor(min + (max - min) * pct)
            label.Text = text .. ": " .. tostring(value)
            if callback then callback(value) end
        end

        local function inputStart(input)
            dragging = true
            update(input)
        end

        local function inputEnd(input)
            dragging = false
        end

        local function inputMove(input)
            if dragging then
                update(input)
            end
        end

        sliderFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                inputStart(input)
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                inputMove(input)
            end
        end)

        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                inputEnd(input)
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
        tinyButton.BackgroundColor3 = Color3.fromRGB(75, 15, 15)
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
