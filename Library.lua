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
    window.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- dark gray
    window.BorderSizePixel = 0
    window.ZIndex = 0
    window.BackgroundTransparency = 0.05
    window.Parent = screenGui

    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 18)
    uICorner.Parent = window

    local uIStroke = Instance.new("UIStroke", window)
    uIStroke.Color = Color3.fromRGB(200, 200, 200) -- light gray stroke
    uIStroke.Thickness = 1
    uIStroke.Transparency = 0.4

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- slightly darker
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
    subLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextSize = 12
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = titleBar

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -70, 0, 5)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
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
    closeButton.BackgroundColor3 = Color3.fromRGB(120, 20, 20)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 20
    closeButton.BorderSizePixel = 0
    closeButton.Parent = titleBar
    Instance.new("UICorner", closeButton).CornerRadius = UDim.new(1, 0)

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -150, 1, -40)
    contentFrame.Position = UDim2.new(0, 150, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Name = "ContentFrame"
    contentFrame.Parent = window

    local tabList = Instance.new("Frame")
    tabList.Size = UDim2.new(0, 150, 1, -40)
    tabList.Position = UDim2.new(0, 0, 0, 40)
    tabList.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
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
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
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

        if #contentFrame:GetChildren() == 1 then
            tabPage.Visible = true
        end

        return tabPage
    end

    function QuantumUI:AddButton(tabPage, text, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -10, 0, 36)
        button.Position = UDim2.new(0, 5, 0, 0)
        button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
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

function QuantumUI:AddInput(tabPage, labelText, placeholder, callback)
	local inputContainer = Instance.new("Frame")
	inputContainer.Size = UDim2.new(1, -10, 0, 48)
	inputContainer.Position = UDim2.new(0, 5, 0, 0)
	inputContainer.BackgroundTransparency = 1
	inputContainer.Parent = tabPage

	-- Label (top text)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 14)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = labelText
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Font = Enum.Font.Gotham
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = inputContainer

	-- TextBox background (invisible for borderless feel)
	local textBox = Instance.new("TextBox")
	textBox.Size = UDim2.new(1, 0, 0, 24)
	textBox.Position = UDim2.new(0, 0, 0, 18)
	textBox.BackgroundTransparency = 1
	textBox.Text = ""
	textBox.PlaceholderText = placeholder
	textBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
	textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	textBox.Font = Enum.Font.Gotham
	textBox.TextSize = 14
	textBox.TextXAlignment = Enum.TextXAlignment.Left
	textBox.ClearTextOnFocus = false
	textBox.Parent = inputContainer

	-- Underline
	local underline = Instance.new("Frame")
	underline.Size = UDim2.new(1, 0, 0, 1)
	underline.Position = UDim2.new(0, 0, 1, -2)
	underline.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	underline.BorderSizePixel = 0
	underline.Parent = textBox

	-- On focus: highlight line
	textBox.Focused:Connect(function()
		underline.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	end)

	textBox.FocusLost:Connect(function(enterPressed)
		underline.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		if enterPressed and callback then
			pcall(callback, textBox.Text)
		end
	end)
end

function QuantumUI:AddToggle(tabPage, text, default, callback)
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")

    local toggleContainer = Instance.new("Frame")
    toggleContainer.Size = UDim2.new(1, -10, 0, 36)
    toggleContainer.Position = UDim2.new(0, 5, 0, 0)
    toggleContainer.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggleContainer.BorderSizePixel = 0
    toggleContainer.Active = true
    toggleContainer.Selectable = true
    toggleContainer.Parent = tabPage
    Instance.new("UICorner", toggleContainer)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleContainer

    local slider = Instance.new("Frame")
    slider.Size = UDim2.fromOffset(36, 18)
    slider.Position = UDim2.new(1, -46, 0.5, 0)
    slider.AnchorPoint = Vector2.new(0, 0.5)
    slider.BackgroundColor3 = default and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(60, 60, 60)
    slider.BorderSizePixel = 0
    slider.Parent = toggleContainer
    Instance.new("UICorner", slider).CornerRadius = UDim.new(1, 0)

    local circle = Instance.new("Frame")
    circle.Size = UDim2.fromOffset(14, 14)
    circle.Position = default and UDim2.new(0, 20, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
    circle.AnchorPoint = Vector2.new(0, 0.5)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.BorderSizePixel = 0
    circle.Parent = slider
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

    local state = default or false

    local function updateToggle(animated)
        local targetColor = state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(60, 60, 60)
        local targetPos = state and UDim2.new(0, 20, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)

        if animated then
            TweenService:Create(slider, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
                BackgroundColor3 = targetColor
            }):Play()

            TweenService:Create(circle, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
                Position = targetPos
            }):Play()
        else
            slider.BackgroundColor3 = targetColor
            circle.Position = targetPos
        end

        if callback then
            pcall(callback, state)
        end
    end

    -- Use MouseButton1Click on a transparent button for better reliability
    local clickDetector = Instance.new("TextButton")
    clickDetector.BackgroundTransparency = 1
    clickDetector.Size = UDim2.new(1, 0, 1, 0)
    clickDetector.Text = ""
    clickDetector.Parent = toggleContainer

    clickDetector.MouseButton1Click:Connect(function()
        state = not state
        updateToggle(true)
    end)

    updateToggle(false)
end

function QuantumUI:AddDropdown(tabPage, text, options, default, callback)
	local TweenService = game:GetService("TweenService")

	-- Container
	local dropdownContainer = Instance.new("Frame")
	dropdownContainer.Size = UDim2.new(1, -10, 0, 36)
	dropdownContainer.Position = UDim2.new(0, 5, 0, 0)
	dropdownContainer.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	dropdownContainer.BorderSizePixel = 0
	dropdownContainer.ClipsDescendants = true
	dropdownContainer.Parent = tabPage
	Instance.new("UICorner", dropdownContainer)

	-- Label
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -40, 1, 0)
	label.Position = UDim2.new(0, 10, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = text .. ": " .. (default or "Select")
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Font = Enum.Font.Gotham
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = dropdownContainer

	-- Arrow
	local arrow = Instance.new("TextLabel")
	arrow.Size = UDim2.new(0, 20, 1, 0)
	arrow.Position = UDim2.new(1, -25, 0, 0)
	arrow.BackgroundTransparency = 1
	arrow.Text = "▼"
	arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
	arrow.Font = Enum.Font.GothamBold
	arrow.TextSize = 14
	arrow.Parent = dropdownContainer

	-- Clickable area
	local toggleButton = Instance.new("TextButton")
	toggleButton.Size = UDim2.new(1, 0, 1, 0)
	toggleButton.BackgroundTransparency = 1
	toggleButton.Text = ""
	toggleButton.Parent = dropdownContainer

	-- Dropdown area
	local optionHolder = Instance.new("Frame")
	optionHolder.Position = UDim2.new(0, 0, 1, 0)
	optionHolder.Size = UDim2.new(1, 0, 0, 0)
	optionHolder.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	optionHolder.BorderSizePixel = 0
	optionHolder.ClipsDescendants = true
	optionHolder.Parent = dropdownContainer
	Instance.new("UICorner", optionHolder)

	local layout = Instance.new("UIListLayout", optionHolder)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, 4)

	-- Create Options
	local selected = default or "Select"
	local expanded = false

	local function toggleDropdown()
		expanded = not expanded
		local height = expanded and (#options * 32 + 4) or 0

		TweenService:Create(optionHolder, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
			Size = UDim2.new(1, 0, 0, height)
		}):Play()

		arrow.Text = expanded and "▲" or "▼"
	end

	toggleButton.MouseButton1Click:Connect(toggleDropdown)

	for _, option in ipairs(options) do
		local optionButton = Instance.new("TextButton")
		optionButton.Size = UDim2.new(1, -10, 0, 30)
		optionButton.Position = UDim2.new(0, 5, 0, 0)
		optionButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		optionButton.Text = option
		optionButton.Font = Enum.Font.Gotham
		optionButton.TextSize = 14
		optionButton.BorderSizePixel = 0
		optionButton.AutoButtonColor = true
		optionButton.Parent = optionHolder

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 4)
		corner.Parent = optionButton

		optionButton.MouseButton1Click:Connect(function()
			selected = option
			label.Text = text .. ": " .. selected
			toggleDropdown()
			if callback then
				pcall(callback, selected)
			end
		end)
	end
end

    function QuantumUI:AddParagraph(tabPage, text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 0, 48)
        label.Position = UDim2.new(0, 5, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextWrapped = true
        label.TextColor3 = Color3.fromRGB(220, 220, 220)
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
        section.TextColor3 = Color3.fromRGB(200, 200, 200)
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
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, 0, 0, 14)
        sliderFrame.Position = UDim2.new(0, 0, 0, 24)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        sliderFrame.BorderSizePixel = 0
        sliderFrame.Parent = container
        Instance.new("UICorner", sliderFrame)

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    minimizeButton.MouseButton1Click:Connect(function()
        window.Visible = false

        local tinyButton = Instance.new("ImageButton")
        tinyButton.Size = UDim2.new(0, 30, 0, 30)
        tinyButton.Position = UDim2.new(0, 10, 0.5, -15)
        tinyButton.AnchorPoint = Vector2.new(0, 0)
        tinyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
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

    -- Draggable support
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
