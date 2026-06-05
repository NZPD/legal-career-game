-- MainMenuUI.lua
-- Professional main menu interface

local MainMenuUI = {}
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

function MainMenuUI.createMainMenu()
    -- Create main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MainMenuGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    
    -- Background
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
    background.BorderSizePixel = 0
    background.Parent = screenGui
    
    -- Main Container
    local mainContainer = Instance.new("Frame")
    mainContainer.Name = "MainContainer"
    mainContainer.Size = UDim2.new(0.6, 0, 0.8, 0)
    mainContainer.Position = UDim2.new(0.2, 0, 0.1, 0)
    mainContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
    mainContainer.BorderColor3 = Color3.fromRGB(100, 150, 200)
    mainContainer.BorderSizePixel = 2
    mainContainer.Parent = background
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0.15, 0)
    title.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
    title.BorderColor3 = Color3.fromRGB(100, 150, 200)
    title.BorderSizePixel = 2
    title.Text = "⚖️ LEGAL CAREER PROGRESSION"
    title.TextColor3 = Color3.fromRGB(200, 220, 255)
    title.TextSize = 32
    title.Font = Enum.Font.GothamBold
    title.Parent = mainContainer
    
    -- Subtitle
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(1, 0, 0.08, 0)
    subtitle.Position = UDim2.new(0, 0, 0.15, 0)
    subtitle.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    subtitle.BorderSizePixel = 0
    subtitle.Text = "From Intern to Supreme Court Justice"
    subtitle.TextColor3 = Color3.fromRGB(150, 180, 220)
    subtitle.TextSize = 16
    subtitle.Font = Enum.Font.Gotham
    subtitle.Parent = mainContainer
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 0.77, -20)
    contentFrame.Position = UDim2.new(0, 10, 0.23, 10)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainContainer
    
    -- Main Menu Buttons
    local buttons = {
        {name = "New Game", text = "🎮 New Game", desc = "Start your legal career journey"},
        {name = "Continue", text = "📖 Continue", desc = "Resume your current case"},
        {name = "Case Archive", text = "📚 Case Archive", desc = "Review completed cases"},
        {name = "Statistics", text = "📊 Statistics", desc = "View your career stats"},
        {name = "Settings", text = "⚙️ Settings", desc = "Game settings"},
        {name = "Quit", text = "❌ Quit", desc = "Exit the game"}
    }
    
    for i, buttonData in ipairs(buttons) do
        MainMenuUI.createButton(contentFrame, i, buttonData)
    end
    
    return screenGui
end

function MainMenuUI.createButton(parent, index, buttonData)
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Name = buttonData.name .. "Container"
    buttonContainer.Size = UDim2.new(1, 0, 0.15, 0)
    buttonContainer.Position = UDim2.new(0, 0, (index - 1) * 0.16, 0)
    buttonContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
    buttonContainer.BorderColor3 = Color3.fromRGB(80, 120, 180)
    buttonContainer.BorderSizePixel = 1
    buttonContainer.Parent = parent
    
    -- Button Label
    local button = Instance.new("TextButton")
    button.Name = buttonData.name
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = buttonData.text
    button.TextColor3 = Color3.fromRGB(180, 200, 255)
    button.TextSize = 18
    button.Font = Enum.Font.GothamBold
    button.Parent = buttonContainer
    
    -- Description
    local description = Instance.new("TextLabel")
    description.Name = "Description"
    description.Size = UDim2.new(0.7, 0, 0.4, 0)
    description.Position = UDim2.new(0, 10, 0.5, 0)
    description.BackgroundTransparency = 1
    description.Text = buttonData.desc
    description.TextColor3 = Color3.fromRGB(120, 150, 200)
    description.TextSize = 12
    description.Font = Enum.Font.Gotham
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.Parent = buttonContainer
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        buttonContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 90)
        button.TextColor3 = Color3.fromRGB(220, 240, 255)
    end)
    
    button.MouseLeave:Connect(function()
        buttonContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
        button.TextColor3 = Color3.fromRGB(180, 200, 255)
    end)
    
    button.MouseButton1Click:Connect(function()
        game:GetService("ReplicatedStorage").MenuSignal:FireServer(buttonData.name)
    end)
end

function MainMenuUI.createCaseMenu()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CaseMenuGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Background
    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
    background.BorderSizePixel = 0
    background.Parent = screenGui
    
    -- Main Container
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.8, 0, 0.9, 0)
    container.Position = UDim2.new(0.1, 0, 0.05, 0)
    container.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
    container.BorderColor3 = Color3.fromRGB(100, 150, 200)
    container.BorderSizePixel = 2
    container.Parent = background
    
    -- Header
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0.12, 0)
    header.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
    header.BorderColor3 = Color3.fromRGB(100, 150, 200)
    header.BorderSizePixel = 2
    header.Text = "📋 SELECT YOUR CASE"
    header.TextColor3 = Color3.fromRGB(200, 220, 255)
    header.TextSize = 28
    header.Font = Enum.Font.GothamBold
    header.Parent = container
    
    -- Cases ScrollFrame
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "CasesScroll"
    scrollFrame.Size = UDim2.new(1, -20, 0.88, -20)
    scrollFrame.Position = UDim2.new(0, 10, 0.12, 10)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.CanvasSize = UDim2.new(1, 0, 3, 0)
    scrollFrame.ScrollBarThickness = 10
    scrollFrame.Parent = container
    
    return screenGui, scrollFrame
end

function MainMenuUI.addCaseButton(scrollFrame, caseData, index)
    local caseButton = Instance.new("Frame")
    caseButton.Name = caseData.title
    caseButton.Size = UDim2.new(1, -20, 0.15, 0)
    caseButton.Position = UDim2.new(0, 10, (index - 1) * 0.16, 0)
    caseButton.BackgroundColor3 = Color3.fromRGB(40, 50, 80)
    caseButton.BorderColor3 = Color3.fromRGB(80, 120, 180)
    caseButton.BorderSizePixel = 1
    caseButton.Parent = scrollFrame
    
    -- Case Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.6, 0, 0.45, 0)
    title.Position = UDim2.new(0, 10, 0, 5)
    title.BackgroundTransparency = 1
    title.Text = "📁 " .. caseData.title
    title.TextColor3 = Color3.fromRGB(200, 220, 255)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = caseButton
    
    -- Case Description
    local description = Instance.new("TextLabel")
    description.Size = UDim2.new(0.6, 0, 0.45, 0)
    description.Position = UDim2.new(0, 10, 0.5, 0)
    description.BackgroundTransparency = 1
    description.Text = caseData.description
    description.TextColor3 = Color3.fromRGB(140, 160, 200)
    description.TextSize = 12
    description.Font = Enum.Font.Gotham
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.Parent = caseButton
    
    -- Difficulty Badge
    local difficulty = Instance.new("TextLabel")
    difficulty.Size = UDim2.new(0.3, 0, 0.6, 0)
    difficulty.Position = UDim2.new(0.65, 0, 0.2, 0)
    difficulty.BackgroundColor3 = MainMenuUI.getDifficultyColor(caseData.difficulty)
    difficulty.BorderSizePixel = 0
    difficulty.Text = caseData.difficulty
    difficulty.TextColor3 = Color3.fromRGB(255, 255, 255)
    difficulty.TextSize = 14
    difficulty.Font = Enum.Font.GothamBold
    difficulty.Parent = caseButton
    
    -- Select Button
    local selectBtn = Instance.new("TextButton")
    selectBtn.Name = "SelectBtn"
    selectBtn.Size = UDim2.new(0.25, 0, 0.6, 0)
    selectBtn.Position = UDim2.new(0.7, 0, 0.2, 0)
    selectBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 220)
    selectBtn.BorderSizePixel = 0
    selectBtn.Text = "SELECT"
    selectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectBtn.TextSize = 12
    selectBtn.Font = Enum.Font.GothamBold
    selectBtn.Parent = caseButton
    
    selectBtn.MouseButton1Click:Connect(function()
        game:GetService("ReplicatedStorage").CaseSignal:FireServer("SelectCase", caseData.title)
    end)
end

function MainMenuUI.getDifficultyColor(difficulty)
    local colors = {
        Easy = Color3.fromRGB(100, 200, 100),
        Medium = Color3.fromRGB(255, 200, 100),
        Hard = Color3.fromRGB(255, 100, 100),
        Expert = Color3.fromRGB(180, 100, 255)
    }
    return colors[difficulty] or Color3.fromRGB(100, 100, 100)
end

return MainMenuUI