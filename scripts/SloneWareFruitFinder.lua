--[[
    SloneWare Fruit Finder v2.1
    - Finds and teleports to fruits in GPO-style games
    - Features: Fruit images, auto-grab, walkspeed adjuster
    
    DISCLAIMER: Use at your own risk. This is for educational purposes.
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

-- Settings
local settings = {
    tpDelay = 0.3,
    platformHeight = 3,
    checkpointDistance = 50,
    stopDistance = 5,
    tracerSubdivisions = 5,
    useWalking = false,
    walkSpeed = 16,
    originalWalkSpeed = 16,
    autoPickup = true,
    scanInterval = 2,
    pickupRange = 15,
    pulseSpeed = 2,
    circleMinRadius = 15,
    circleMaxRadius = 25,
    circleColor = Color3.fromRGB(255, 200, 100),
    circleOutlineColor = Color3.fromRGB(200, 150, 50)
}

-- Variables
local selectedFruit = nil
local isTeleporting = false
local currentPlatform = nil
local tracerLines = {}
local currentSmoothPoints = nil
local destinationCircle = nil
local destinationCircleOutline = nil
local destinationPosition = nil
local pulseStartTime = 0
local fruitCache = {}
local speedModified = false

-- Default fruit image
local defaultFruitImage = "rbxassetid://6031075938"

-- Utility functions
local function clearTracers()
    for _, data in pairs(tracerLines) do
        if data and data.line then
            pcall(function() data.line:Remove() end)
        end
    end
    tracerLines = {}
end

local function clearPlatform()
    if currentPlatform and currentPlatform.Parent then
        currentPlatform:Destroy()
    end
    currentPlatform = nil
end

local function getCharacter()
    return LocalPlayer.Character
end

local function getRootPart()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChild("Humanoid")
end

-- Get fruit image from Tool
local function getFruitImage(fruitTool)
    if fruitTool:IsA("Tool") and fruitTool.TextureId and fruitTool.TextureId ~= "" then
        return fruitTool.TextureId
    end
    
    for _, desc in ipairs(fruitTool:GetDescendants()) do
        if desc:IsA("Decal") and desc.Texture and desc.Texture ~= "" then
            return desc.Texture
        elseif desc:IsA("ImageLabel") and desc.Image and desc.Image ~= "" then
            return desc.Image
        end
    end
    
    return defaultFruitImage
end

-- Fruit Detection
local function isFruit(obj)
    if obj:IsA("Tool") and obj:FindFirstChild("FruitEater") then
        return true
    end
    return false
end

local function getFruitName(fruitTool)
    return fruitTool.Name or "Unknown Fruit"
end

local function getFruitPosition(fruitTool)
    if fruitTool.PrimaryPart then
        return fruitTool.PrimaryPart.Position
    end
    
    local fruitModel = fruitTool:FindFirstChild("FruitModel")
    if fruitModel and fruitModel:IsA("Model") and fruitModel.PrimaryPart then
        return fruitModel.PrimaryPart.Position
    end
    
    for _, part in ipairs(fruitTool:GetDescendants()) do
        if part:IsA("BasePart") then
            return part.Position
        end
    end
    
    return nil
end

local function scanForFruits()
    local fruits = {}
    
    for _, obj in ipairs(workspace:GetChildren()) do
        if isFruit(obj) then
            local pos = getFruitPosition(obj)
            if pos then
                table.insert(fruits, {
                    tool = obj,
                    name = getFruitName(obj),
                    position = pos,
                    image = getFruitImage(obj)
                })
            end
        end
    end
    
    local envSettings = workspace:FindFirstChild("Env")
    if envSettings then
        local settingsFolder = envSettings:FindFirstChild("Settings")
        if settingsFolder then
            for _, obj in ipairs(settingsFolder:GetDescendants()) do
                if obj:IsA("Model") and obj:GetAttribute("fruitModel") == true then
                    local pos = obj.PrimaryPart and obj.PrimaryPart.Position
                    if pos then
                        table.insert(fruits, {
                            tool = obj,
                            name = obj.Name or "Unknown Fruit",
                            position = pos,
                            isEnvFruit = true,
                            image = defaultFruitImage
                        })
                    end
                end
            end
        end
    end
    
    return fruits
end

local function getDistanceToFruit(fruit)
    local myRoot = getRootPart()
    if not myRoot or not fruit.position then
        return math.huge
    end
    return (myRoot.Position - fruit.position).Magnitude
end

-- Proximity Prompt Handling
local function findProximityPrompt(fruitTool)
    for _, desc in ipairs(fruitTool:GetDescendants()) do
        if desc:IsA("ProximityPrompt") then
            return desc
        end
    end
    
    if fruitTool.PrimaryPart then
        local prompt = fruitTool.PrimaryPart:FindFirstChildWhichIsA("ProximityPrompt", true)
        if prompt then return prompt end
    end
    
    local fruitModel = fruitTool:FindFirstChild("FruitModel")
    if fruitModel then
        for _, desc in ipairs(fruitModel:GetDescendants()) do
            if desc:IsA("ProximityPrompt") then
                return desc
            end
        end
    end
    
    return nil
end

local function triggerProximityPrompt(prompt)
    if not prompt or not prompt.Parent then
        return false
    end
    
    local success = false
    
    -- Method 1: fireproximityprompt (executor function)
    if fireproximityprompt then
        pcall(function()
            fireproximityprompt(prompt, 1)
            success = true
        end)
        if success then return true end
    end
    
    -- Method 2: Direct input simulation
    pcall(function()
        prompt:InputHoldBegin()
        local holdTime = prompt.HoldDuration or 0
        if holdTime > 0 then
            task.wait(holdTime + 0.1)
        else
            task.wait(0.1)
        end
        prompt:InputHoldEnd()
        success = true
    end)
    
    return success
end

local function tryAutoPickup(fruitTool)
    if not settings.autoPickup then return false, "Disabled" end
    if not fruitTool or not fruitTool.Parent then return false, "Fruit gone" end
    
    local prompt = findProximityPrompt(fruitTool)
    
    if not prompt then
        local clickDetector = fruitTool:FindFirstChildWhichIsA("ClickDetector", true)
        if clickDetector and fireclickdetector then
            pcall(function() fireclickdetector(clickDetector) end)
            return true, "ClickDetector used"
        end
        return false, "No prompt"
    end
    
    local myRoot = getRootPart()
    local fruitPos = getFruitPosition(fruitTool)
    
    if not myRoot or not fruitPos then
        return false, "Position unknown"
    end
    
    local distance = (myRoot.Position - fruitPos).Magnitude
    local maxDist = prompt.MaxActivationDistance or 10
    
    if distance > maxDist + 2 then
        return false, string.format("Too far (%.0f)", distance)
    end
    
    if not prompt.Enabled then
        return false, "Prompt disabled"
    end
    
    local triggered = triggerProximityPrompt(prompt)
    return triggered, triggered and "Success!" or "Failed"
end

local function attemptPickupLoop(fruitTool, maxAttempts)
    maxAttempts = maxAttempts or 5
    
    for i = 1, maxAttempts do
        if not fruitTool or not fruitTool.Parent then
            return true, "Fruit collected!"
        end
        
        local success, message = tryAutoPickup(fruitTool)
        if success then
            return true, message
        end
        
        local myRoot = getRootPart()
        local fruitPos = getFruitPosition(fruitTool)
        if myRoot and fruitPos then
            local direction = (fruitPos - myRoot.Position).Unit
            myRoot.CFrame = myRoot.CFrame + (direction * 1)
        end
        
        task.wait(0.3)
    end
    
    return false, "Pickup failed"
end

-- UI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SloneWareFruitGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 440, 0, 520)
MainFrame.Position = UDim2.new(0.5, -220, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 42)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 70, 85)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 10)
TopFix.Position = UDim2.new(0, 0, 1, -10)
TopFix.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
TopFix.BorderSizePixel = 0
TopFix.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 250, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🍎 SloneWare Fruit Finder"
Title.TextColor3 = Color3.fromRGB(255, 200, 100)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -70, 0, 2.5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 70, 85)
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeBtn.TextSize = 20
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Parent = TopBar

Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 6)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 2.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TopBar

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -45)
ContentFrame.Position = UDim2.new(0, 10, 0, 40)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Fruit Count Label
local FruitCountLabel = Instance.new("TextLabel")
FruitCountLabel.Size = UDim2.new(1, 0, 0, 28)
FruitCountLabel.BackgroundColor3 = Color3.fromRGB(45, 55, 65)
FruitCountLabel.BorderSizePixel = 0
FruitCountLabel.Text = "  🔍 Fruits Found: 0"
FruitCountLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
FruitCountLabel.TextSize = 13
FruitCountLabel.Font = Enum.Font.GothamBold
FruitCountLabel.TextXAlignment = Enum.TextXAlignment.Left
FruitCountLabel.Parent = ContentFrame

Instance.new("UICorner", FruitCountLabel).CornerRadius = UDim.new(0, 6)

-- Fruit List
local FruitList = Instance.new("ScrollingFrame")
FruitList.Size = UDim2.new(1, 0, 0, 200)
FruitList.Position = UDim2.new(0, 0, 0, 33)
FruitList.BackgroundColor3 = Color3.fromRGB(25, 30, 38)
FruitList.BorderSizePixel = 0
FruitList.ScrollBarThickness = 5
FruitList.ScrollBarImageColor3 = Color3.fromRGB(100, 110, 125)
FruitList.CanvasSize = UDim2.new(0, 0, 0, 0)
FruitList.Parent = ContentFrame

Instance.new("UICorner", FruitList).CornerRadius = UDim.new(0, 6)

local ListPadding = Instance.new("UIPadding")
ListPadding.PaddingTop = UDim.new(0, 5)
ListPadding.PaddingBottom = UDim.new(0, 5)
ListPadding.PaddingLeft = UDim.new(0, 5)
ListPadding.PaddingRight = UDim.new(0, 5)
ListPadding.Parent = FruitList

local ListLayout = Instance.new("UIListLayout")
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 5)
ListLayout.Parent = FruitList

-- Settings Panel
local SettingsPanel = Instance.new("Frame")
SettingsPanel.Size = UDim2.new(1, 0, 0, 170)
SettingsPanel.Position = UDim2.new(0, 0, 0, 238)
SettingsPanel.BackgroundColor3 = Color3.fromRGB(35, 42, 52)
SettingsPanel.BorderSizePixel = 0
SettingsPanel.Parent = ContentFrame

Instance.new("UICorner", SettingsPanel).CornerRadius = UDim.new(0, 6)

local SettingsLabel = Instance.new("TextLabel")
SettingsLabel.Size = UDim2.new(1, 0, 0, 28)
SettingsLabel.BackgroundColor3 = Color3.fromRGB(45, 55, 65)
SettingsLabel.BorderSizePixel = 0
SettingsLabel.Text = "  ⚙️ Settings"
SettingsLabel.TextColor3 = Color3.fromRGB(200, 210, 220)
SettingsLabel.TextSize = 12
SettingsLabel.Font = Enum.Font.GothamBold
SettingsLabel.TextXAlignment = Enum.TextXAlignment.Left
SettingsLabel.Parent = SettingsPanel

Instance.new("UICorner", SettingsLabel).CornerRadius = UDim.new(0, 6)

-- Mode Toggle Row
local ModeRow = Instance.new("Frame")
ModeRow.Size = UDim2.new(1, -10, 0, 30)
ModeRow.Position = UDim2.new(0, 5, 0, 33)
ModeRow.BackgroundTransparency = 1
ModeRow.Parent = SettingsPanel

local ModeToggle = Instance.new("TextButton")
ModeToggle.Size = UDim2.new(0.48, 0, 1, 0)
ModeToggle.BackgroundColor3 = Color3.fromRGB(60, 90, 140)
ModeToggle.BorderSizePixel = 0
ModeToggle.Text = "🚀 Teleport Mode"
ModeToggle.TextColor3 = Color3.fromRGB(220, 230, 240)
ModeToggle.TextSize = 11
ModeToggle.Font = Enum.Font.GothamSemibold
ModeToggle.Parent = ModeRow

Instance.new("UICorner", ModeToggle).CornerRadius = UDim.new(0, 6)

local AutoPickupToggle = Instance.new("TextButton")
AutoPickupToggle.Size = UDim2.new(0.48, 0, 1, 0)
AutoPickupToggle.Position = UDim2.new(0.52, 0, 0, 0)
AutoPickupToggle.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
AutoPickupToggle.BorderSizePixel = 0
AutoPickupToggle.Text = "✅ Auto Pickup: ON"
AutoPickupToggle.TextColor3 = Color3.fromRGB(220, 240, 220)
AutoPickupToggle.TextSize = 11
AutoPickupToggle.Font = Enum.Font.GothamSemibold
AutoPickupToggle.Parent = ModeRow

Instance.new("UICorner", AutoPickupToggle).CornerRadius = UDim.new(0, 6)

-- WalkSpeed Row
local SpeedRow = Instance.new("Frame")
SpeedRow.Size = UDim2.new(1, -10, 0, 35)
SpeedRow.Position = UDim2.new(0, 5, 0, 68)
SpeedRow.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
SpeedRow.BorderSizePixel = 0
SpeedRow.Parent = SettingsPanel

Instance.new("UICorner", SpeedRow).CornerRadius = UDim.new(0, 6)

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 100, 1, 0)
SpeedLabel.Position = UDim2.new(0, 8, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "🏃 WalkSpeed:"
SpeedLabel.TextColor3 = Color3.fromRGB(180, 190, 200)
SpeedLabel.TextSize = 11
SpeedLabel.Font = Enum.Font.GothamSemibold
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = SpeedRow

local SpeedValue = Instance.new("TextLabel")
SpeedValue.Size = UDim2.new(0, 40, 1, 0)
SpeedValue.Position = UDim2.new(0, 105, 0, 0)
SpeedValue.BackgroundTransparency = 1
SpeedValue.Text = tostring(settings.walkSpeed)
SpeedValue.TextColor3 = Color3.fromRGB(255, 200, 100)
SpeedValue.TextSize = 12
SpeedValue.Font = Enum.Font.GothamBold
SpeedValue.TextXAlignment = Enum.TextXAlignment.Left
SpeedValue.Parent = SpeedRow

local SpeedSliderBG = Instance.new("Frame")
SpeedSliderBG.Size = UDim2.new(0, 150, 0, 8)
SpeedSliderBG.Position = UDim2.new(0, 150, 0.5, -4)
SpeedSliderBG.BackgroundColor3 = Color3.fromRGB(30, 35, 42)
SpeedSliderBG.BorderSizePixel = 0
SpeedSliderBG.Parent = SpeedRow

Instance.new("UICorner", SpeedSliderBG).CornerRadius = UDim.new(1, 0)

local SpeedSliderFill = Instance.new("Frame")
SpeedSliderFill.Size = UDim2.new(0.16, 0, 1, 0)
SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
SpeedSliderFill.BorderSizePixel = 0
SpeedSliderFill.Parent = SpeedSliderBG

Instance.new("UICorner", SpeedSliderFill).CornerRadius = UDim.new(1, 0)

local SpeedSliderBtn = Instance.new("TextButton")
SpeedSliderBtn.Size = UDim2.new(0, 18, 0, 18)
SpeedSliderBtn.Position = UDim2.new(0.16, -9, 0.5, -9)
SpeedSliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedSliderBtn.BorderSizePixel = 0
SpeedSliderBtn.Text = ""
SpeedSliderBtn.Parent = SpeedSliderBG

Instance.new("UICorner", SpeedSliderBtn).CornerRadius = UDim.new(1, 0)

local ResetSpeedBtn = Instance.new("TextButton")
ResetSpeedBtn.Size = UDim2.new(0, 60, 0, 25)
ResetSpeedBtn.Position = UDim2.new(1, -68, 0.5, -12.5)
ResetSpeedBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
ResetSpeedBtn.BorderSizePixel = 0
ResetSpeedBtn.Text = "Reset"
ResetSpeedBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
ResetSpeedBtn.TextSize = 10
ResetSpeedBtn.Font = Enum.Font.GothamSemibold
ResetSpeedBtn.Parent = SpeedRow

Instance.new("UICorner", ResetSpeedBtn).CornerRadius = UDim.new(0, 4)

-- Button Row
local ButtonRow = Instance.new("Frame")
ButtonRow.Size = UDim2.new(1, -10, 0, 30)
ButtonRow.Position = UDim2.new(0, 5, 0, 108)
ButtonRow.BackgroundTransparency = 1
ButtonRow.Parent = SettingsPanel

local RefreshBtn = Instance.new("TextButton")
RefreshBtn.Size = UDim2.new(0.48, 0, 1, 0)
RefreshBtn.BackgroundColor3 = Color3.fromRGB(120, 100, 50)
RefreshBtn.BorderSizePixel = 0
RefreshBtn.Text = "🔄 Refresh List"
RefreshBtn.TextColor3 = Color3.fromRGB(255, 230, 180)
RefreshBtn.TextSize = 11
RefreshBtn.Font = Enum.Font.GothamSemibold
RefreshBtn.Parent = ButtonRow

Instance.new("UICorner", RefreshBtn).CornerRadius = UDim.new(0, 6)

local StopBtn = Instance.new("TextButton")
StopBtn.Size = UDim2.new(0.48, 0, 1, 0)
StopBtn.Position = UDim2.new(0.52, 0, 0, 0)
StopBtn.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
StopBtn.BorderSizePixel = 0
StopBtn.Text = "⛔ Stop Movement"
StopBtn.TextColor3 = Color3.fromRGB(255, 200, 200)
StopBtn.TextSize = 11
StopBtn.Font = Enum.Font.GothamSemibold
StopBtn.Parent = ButtonRow

Instance.new("UICorner", StopBtn).CornerRadius = UDim.new(0, 6)

-- TP Delay Row
local DelayRow = Instance.new("Frame")
DelayRow.Size = UDim2.new(1, -10, 0, 25)
DelayRow.Position = UDim2.new(0, 5, 0, 142)
DelayRow.BackgroundTransparency = 1
DelayRow.Parent = SettingsPanel

local DelayLabel = Instance.new("TextLabel")
DelayLabel.Size = UDim2.new(0.6, 0, 1, 0)
DelayLabel.BackgroundTransparency = 1
DelayLabel.Text = "  ⏱️ TP Delay: " .. settings.tpDelay .. "s"
DelayLabel.TextColor3 = Color3.fromRGB(160, 170, 180)
DelayLabel.TextSize = 11
DelayLabel.Font = Enum.Font.Gotham
DelayLabel.TextXAlignment = Enum.TextXAlignment.Left
DelayLabel.Parent = DelayRow

local DelayBox = Instance.new("TextBox")
DelayBox.Size = UDim2.new(0.35, 0, 1, 0)
DelayBox.Position = UDim2.new(0.65, 0, 0, 0)
DelayBox.BackgroundColor3 = Color3.fromRGB(45, 55, 65)
DelayBox.BorderSizePixel = 0
DelayBox.Text = tostring(settings.tpDelay)
DelayBox.TextColor3 = Color3.fromRGB(220, 225, 230)
DelayBox.TextSize = 11
DelayBox.Font = Enum.Font.Gotham
DelayBox.Parent = DelayRow

Instance.new("UICorner", DelayBox).CornerRadius = UDim.new(0, 4)

-- Status Display
local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, 0, 0, 55)
StatusFrame.Position = UDim2.new(0, 0, 0, 413)
StatusFrame.BackgroundColor3 = Color3.fromRGB(25, 30, 38)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = ContentFrame

Instance.new("UICorner", StatusFrame).CornerRadius = UDim.new(0, 6)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 22)
StatusLabel.BackgroundColor3 = Color3.fromRGB(45, 55, 65)
StatusLabel.BorderSizePixel = 0
StatusLabel.Text = "  📊 Status"
StatusLabel.TextColor3 = Color3.fromRGB(180, 190, 200)
StatusLabel.TextSize = 11
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = StatusFrame

Instance.new("UICorner", StatusLabel).CornerRadius = UDim.new(0, 6)

local StatusDisplay = Instance.new("TextLabel")
StatusDisplay.Size = UDim2.new(1, -10, 0, 28)
StatusDisplay.Position = UDim2.new(0, 5, 0, 25)
StatusDisplay.BackgroundTransparency = 1
StatusDisplay.Text = "Ready - Click a fruit to teleport"
StatusDisplay.TextColor3 = Color3.fromRGB(140, 200, 140)
StatusDisplay.TextSize = 11
StatusDisplay.Font = Enum.Font.Gotham
StatusDisplay.TextXAlignment = Enum.TextXAlignment.Left
StatusDisplay.TextYAlignment = Enum.TextYAlignment.Top
StatusDisplay.TextWrapped = true
StatusDisplay.Parent = StatusFrame

-- WalkSpeed Slider Logic
local draggingSlider = false

local function updateWalkSpeed(value)
    value = math.clamp(value, 0, 200)
    settings.walkSpeed = value
    SpeedValue.Text = tostring(math.floor(value))
    
    local fillPercent = value / 200
    SpeedSliderFill.Size = UDim2.new(fillPercent, 0, 1, 0)
    SpeedSliderBtn.Position = UDim2.new(fillPercent, -9, 0.5, -9)
    
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = value
        speedModified = (value ~= settings.originalWalkSpeed)
    end
    
    if value > 50 then
        SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(200, 100, 100)
    elseif value > 30 then
        SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(200, 180, 80)
    else
        SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
    end
end

SpeedSliderBG.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSlider = true
        local relativeX = math.clamp((input.Position.X - SpeedSliderBG.AbsolutePosition.X) / SpeedSliderBG.AbsoluteSize.X, 0, 1)
        updateWalkSpeed(relativeX * 200)
    end
end)

SpeedSliderBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSlider = true
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local relativeX = math.clamp((input.Position.X - SpeedSliderBG.AbsolutePosition.X) / SpeedSliderBG.AbsoluteSize.X, 0, 1)
        updateWalkSpeed(relativeX * 200)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSlider = false
    end
end)

ResetSpeedBtn.MouseButton1Click:Connect(function()
    updateWalkSpeed(16)
    settings.originalWalkSpeed = 16
end)

-- Path Drawing Functions
local function catmullRom(p0, p1, p2, p3, t)
    local t2 = t * t
    local t3 = t2 * t
    return 0.5 * ((2 * p1) + (-p0 + p2) * t + (2 * p0 - 5 * p1 + 4 * p2 - p3) * t2 + (-p0 + 3 * p1 - 3 * p2 + p3) * t3)
end

local function catmullRomPoint(p0, p1, p2, p3, t)
    return Vector3.new(
        catmullRom(p0.X, p1.X, p2.X, p3.X, t),
        catmullRom(p0.Y, p1.Y, p2.Y, p3.Y, t),
        catmullRom(p0.Z, p1.Z, p2.Z, p3.Z, t)
    )
end

local function generateSmoothPoints(waypoints)
    local smoothPoints = {}
    local positions = {}
    
    for _, wp in ipairs(waypoints) do
        table.insert(positions, wp.Position)
    end
    
    if #positions < 2 then return positions end
    
    table.insert(positions, 1, positions[1] + (positions[1] - positions[2]))
    table.insert(positions, positions[#positions] + (positions[#positions] - positions[#positions - 1]))
    
    for i = 2, #positions - 2 do
        for j = 0, settings.tracerSubdivisions - 1 do
            local t = j / settings.tracerSubdivisions
            table.insert(smoothPoints, catmullRomPoint(positions[i-1], positions[i], positions[i+1], positions[i+2], t))
        end
    end
    
    table.insert(smoothPoints, positions[#positions - 1])
    return smoothPoints
end

local function worldToScreen(pos)
    local screenPos, onScreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen
end

local function createTracerLines(smoothPoints)
    clearTracers()
    for i = 1, #smoothPoints - 1 do
        local outline = Drawing.new("Line")
        outline.Visible = false
        outline.Color = settings.circleOutlineColor
        outline.Thickness = 4
        outline.Transparency = 0.6
        table.insert(tracerLines, {line = outline, index = i})
        
        local line = Drawing.new("Line")
        line.Visible = false
        line.Color = settings.circleColor
        line.Thickness = 2
        line.Transparency = 0.9
        table.insert(tracerLines, {line = line, index = i})
    end
end

local function clearDestinationCircle()
    if destinationCircle then pcall(function() destinationCircle:Remove() end) destinationCircle = nil end
    if destinationCircleOutline then pcall(function() destinationCircleOutline:Remove() end) destinationCircleOutline = nil end
    destinationPosition = nil
end

local function createDestinationCircle(position)
    clearDestinationCircle()
    destinationPosition = position
    pulseStartTime = tick()
    
    destinationCircleOutline = Drawing.new("Circle")
    destinationCircleOutline.Visible = false
    destinationCircleOutline.Color = settings.circleOutlineColor
    destinationCircleOutline.Thickness = 3
    destinationCircleOutline.Filled = false
    
    destinationCircle = Drawing.new("Circle")
    destinationCircle.Visible = false
    destinationCircle.Color = settings.circleColor
    destinationCircle.Thickness = 2
    destinationCircle.Filled = false
end

local function updateTracers()
    if currentSmoothPoints then
        for _, data in pairs(tracerLines) do
            local i = data.index
            if currentSmoothPoints[i] and currentSmoothPoints[i + 1] then
                local from, fromVisible = worldToScreen(currentSmoothPoints[i])
                local to, toVisible = worldToScreen(currentSmoothPoints[i + 1])
                if fromVisible and toVisible then
                    data.line.From = from
                    data.line.To = to
                    data.line.Visible = true
                else
                    data.line.Visible = false
                end
            end
        end
    end
    
    if destinationPosition and destinationCircle then
        local screenPos, onScreen = worldToScreen(destinationPosition)
        if onScreen then
            local elapsed = tick() - pulseStartTime
            local pulseT = (math.sin(elapsed * settings.pulseSpeed * math.pi * 2) + 1) / 2
            local radius = settings.circleMinRadius + (settings.circleMaxRadius - settings.circleMinRadius) * pulseT
            
            destinationCircle.Position = screenPos
            destinationCircle.Radius = radius
            destinationCircle.Transparency = 0.6 + 0.4 * pulseT
            destinationCircle.Visible = true
            
            destinationCircleOutline.Position = screenPos
            destinationCircleOutline.Radius = radius + 3
            destinationCircleOutline.Transparency = 0.4 + 0.4 * pulseT
            destinationCircleOutline.Visible = true
        else
            destinationCircle.Visible = false
            destinationCircleOutline.Visible = false
        end
    end
end

local function createPlatform(position)
    clearPlatform()
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.FilterDescendantsInstances = {getCharacter()}
    
    local result = workspace:Raycast(position + Vector3.new(0, 50, 0), Vector3.new(0, -100, 0), rayParams)
    local groundY = result and result.Position.Y or position.Y
    
    local platform = Instance.new("Part")
    platform.Size = Vector3.new(10, 1, 10)
    platform.Position = Vector3.new(position.X, groundY + settings.platformHeight, position.Z)
    platform.Anchored = true
    platform.CanCollide = true
    platform.Transparency = 1
    platform.Parent = workspace
    
    currentPlatform = platform
    return platform
end

-- Walk Function
local function walkToFruit(fruitData, waypoints)
    local humanoid = getHumanoid()
    local myRoot = getRootPart()
    
    if not humanoid or not myRoot then
        StatusDisplay.Text = "Missing humanoid"
        return false
    end
    
    StatusDisplay.Text = "Walking to " .. fruitData.name .. "..."
    
    local currentWaypoint = 2
    local reachedEnd = false
    local walkFailed = false
    
    local function tryJump()
        if not humanoid or humanoid.Health <= 0 then return end
        local state = humanoid:GetState()
        if state ~= Enum.HumanoidStateType.Jumping and state ~= Enum.HumanoidStateType.Freefall then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
    
    local moveConnection
    moveConnection = humanoid.MoveToFinished:Connect(function(reached)
        if not isTeleporting then moveConnection:Disconnect() return end
        if reached then
            currentWaypoint = currentWaypoint + 1
            if currentWaypoint <= #waypoints then
                if waypoints[currentWaypoint].Action == Enum.PathWaypointAction.Jump then tryJump() end
                humanoid:MoveTo(waypoints[currentWaypoint].Position)
            else
                reachedEnd = true
            end
        else
            walkFailed = true
        end
    end)
    
    if waypoints[currentWaypoint] and waypoints[currentWaypoint].Action == Enum.PathWaypointAction.Jump then tryJump() end
    humanoid:MoveTo(waypoints[currentWaypoint].Position)
    
    local timeout = 0
    while not reachedEnd and not walkFailed and isTeleporting and timeout < #waypoints * 8 do
        task.wait(0.1)
        timeout = timeout + 0.1
    end
    
    if moveConnection then moveConnection:Disconnect() end
    return reachedEnd
end

-- Main Teleport Function
local function teleportToFruit(fruitData)
    if isTeleporting then
        StatusDisplay.Text = "Already moving..."
        return
    end
    
    if not fruitData.tool or not fruitData.tool.Parent then
        StatusDisplay.Text = "Fruit no longer exists!"
        return
    end
    
    local fruitPos = getFruitPosition(fruitData.tool)
    local myRoot = getRootPart()
    
    if not fruitPos or not myRoot then
        StatusDisplay.Text = "Cannot locate fruit"
        return
    end
    
    isTeleporting = true
    selectedFruit = fruitData
    StatusDisplay.Text = "Computing path to " .. fruitData.name .. "..."
    StatusDisplay.TextColor3 = Color3.fromRGB(200, 200, 140)
    
    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentCanClimb = false,
        WaypointSpacing = 4
    })
    
    local success = pcall(function()
        path:ComputeAsync(myRoot.Position, fruitPos)
    end)
    
    if not success or path.Status ~= Enum.PathStatus.Success then
        StatusDisplay.Text = "Path failed, direct teleport..."
        if not settings.useWalking then
            myRoot.CFrame = CFrame.new(fruitPos + Vector3.new(0, 3, 0))
            task.wait(0.5)
            if settings.autoPickup and fruitData.tool and fruitData.tool.Parent then
                local pickupSuccess, msg = attemptPickupLoop(fruitData.tool, 3)
                StatusDisplay.Text = msg
                StatusDisplay.TextColor3 = pickupSuccess and Color3.fromRGB(140, 200, 140) or Color3.fromRGB(200, 140, 140)
            end
        end
        isTeleporting = false
        return
    end
    
    local waypoints = path:GetWaypoints()
    StatusDisplay.Text = "Moving... (" .. #waypoints .. " waypoints)"
    
    currentSmoothPoints = generateSmoothPoints(waypoints)
    createTracerLines(currentSmoothPoints)
    createDestinationCircle(fruitPos)
    
    local tracerConnection = RunService.RenderStepped:Connect(updateTracers)
    
    if settings.useWalking then
        walkToFruit(fruitData, waypoints)
    else
        local totalDist = 0
        for i, waypoint in ipairs(waypoints) do
            if not isTeleporting then break end
            if not fruitData.tool or not fruitData.tool.Parent then
                StatusDisplay.Text = "Fruit disappeared!"
                break
            end
            
            if i > 1 then
                totalDist = totalDist + (waypoint.Position - waypoints[i-1].Position).Magnitude
            end
            
            if totalDist >= settings.checkpointDistance or i == #waypoints then
                createPlatform(waypoint.Position)
                myRoot.CFrame = CFrame.new(currentPlatform.Position + Vector3.new(0, 3, 0))
                totalDist = 0
                task.wait(settings.tpDelay)
            end
        end
        
        if fruitData.tool and fruitData.tool.Parent then
            local finalPos = getFruitPosition(fruitData.tool)
            if finalPos then
                local direction = (myRoot.Position - finalPos).Unit
                myRoot.CFrame = CFrame.new(finalPos + direction * 3 + Vector3.new(0, 2, 0))
            end
        end
    end
    
    StatusDisplay.Text = "Arrived! Attempting pickup..."
    StatusDisplay.TextColor3 = Color3.fromRGB(200, 200, 140)
    
    task.wait(0.3)
    
    if settings.autoPickup and fruitData.tool and fruitData.tool.Parent then
        local pickupSuccess, msg = attemptPickupLoop(fruitData.tool, 5)
        if pickupSuccess then
            StatusDisplay.Text = "🎉 " .. msg
            StatusDisplay.TextColor3 = Color3.fromRGB(140, 220, 140)
        else
            StatusDisplay.Text = "⚠️ " .. msg
            StatusDisplay.TextColor3 = Color3.fromRGB(220, 180, 100)
        end
    else
        StatusDisplay.Text = "✅ Arrived at fruit"
        StatusDisplay.TextColor3 = Color3.fromRGB(140, 200, 140)
    end
    
    task.wait(2)
    tracerConnection:Disconnect()
    clearTracers()
    clearDestinationCircle()
    clearPlatform()
    currentSmoothPoints = nil
    isTeleporting = false
    selectedFruit = nil
end

-- Create Fruit Button
local function createFruitButton(fruitData, index)
    local Button = Instance.new("Frame")
    Button.Name = fruitData.name
    Button.Size = UDim2.new(1, -10, 0, 55)
    Button.BackgroundColor3 = Color3.fromRGB(40, 50, 40)
    Button.BorderSizePixel = 0
    Button.LayoutOrder = index
    Button.Parent = FruitList
    
    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = Color3.fromRGB(80, 110, 80)
    BtnStroke.Thickness = 1
    BtnStroke.Parent = Button
    
    local ImageFrame = Instance.new("Frame")
    ImageFrame.Size = UDim2.new(0, 45, 0, 45)
    ImageFrame.Position = UDim2.new(0, 5, 0, 5)
    ImageFrame.BackgroundColor3 = Color3.fromRGB(30, 38, 30)
    ImageFrame.BorderSizePixel = 0
    ImageFrame.Parent = Button
    
    Instance.new("UICorner", ImageFrame).CornerRadius = UDim.new(0, 8)
    
    local FruitImage = Instance.new("ImageLabel")
    FruitImage.Size = UDim2.new(1, -6, 1, -6)
    FruitImage.Position = UDim2.new(0, 3, 0, 3)
    FruitImage.BackgroundTransparency = 1
    FruitImage.Image = fruitData.image or defaultFruitImage
    FruitImage.ScaleType = Enum.ScaleType.Fit
    FruitImage.Parent = ImageFrame
    
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -130, 0, 22)
    NameLabel.Position = UDim2.new(0, 55, 0, 5)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = fruitData.name
    NameLabel.TextColor3 = Color3.fromRGB(255, 220, 150)
    NameLabel.TextSize = 13
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    NameLabel.Parent = Button
    
    local DistLabel = Instance.new("TextLabel")
    DistLabel.Name = "DistLabel"
    DistLabel.Size = UDim2.new(1, -130, 0, 18)
    DistLabel.Position = UDim2.new(0, 55, 0, 28)
    DistLabel.BackgroundTransparency = 1
    DistLabel.Text = "📍 Calculating..."
    DistLabel.TextColor3 = Color3.fromRGB(150, 180, 150)
    DistLabel.TextSize = 11
    DistLabel.Font = Enum.Font.Gotham
    DistLabel.TextXAlignment = Enum.TextXAlignment.Left
    DistLabel.Parent = Button
    
    local GoBtn = Instance.new("TextButton")
    GoBtn.Size = UDim2.new(0, 55, 0, 45)
    GoBtn.Position = UDim2.new(1, -60, 0, 5)
    GoBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 70)
    GoBtn.BorderSizePixel = 0
    GoBtn.Text = "GO"
    GoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GoBtn.TextSize = 14
    GoBtn.Font = Enum.Font.GothamBold
    GoBtn.Parent = Button
    
    Instance.new("UICorner", GoBtn).CornerRadius = UDim.new(0, 6)
    
    GoBtn.MouseEnter:Connect(function()
        GoBtn.BackgroundColor3 = Color3.fromRGB(90, 170, 90)
    end)
    GoBtn.MouseLeave:Connect(function()
        GoBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 70)
    end)
    
    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            BtnStroke.Color = Color3.fromRGB(120, 160, 120)
        end
    end)
    Button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            BtnStroke.Color = Color3.fromRGB(80, 110, 80)
        end
    end)
    
    local function goToFruit()
        local currentFruits = scanForFruits()
        for _, f in ipairs(currentFruits) do
            if f.tool == fruitData.tool then
                teleportToFruit(f)
                return
            end
        end
        StatusDisplay.Text = "Fruit no longer available!"
        StatusDisplay.TextColor3 = Color3.fromRGB(200, 140, 140)
    end
    
    GoBtn.MouseButton1Click:Connect(goToFruit)
    
    return Button, DistLabel, fruitData
end

-- Refresh List
local function refreshFruitList()
    for _, child in pairs(FruitList:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    fruitCache = {}
    local fruits = scanForFruits()
    
    FruitCountLabel.Text = "  🔍 Fruits Found: " .. #fruits
    
    if #fruits == 0 then
        local noFruit = Instance.new("TextLabel")
        noFruit.Name = "NoFruit"
        noFruit.Size = UDim2.new(1, -10, 0, 60)
        noFruit.BackgroundTransparency = 1
        noFruit.Text = "No fruits found\n\nFruits appear as Tools with FruitEater"
        noFruit.TextColor3 = Color3.fromRGB(120, 130, 140)
        noFruit.TextSize = 12
        noFruit.Font = Enum.Font.Gotham
        noFruit.TextWrapped = true
        noFruit.Parent = FruitList
    else
        table.sort(fruits, function(a, b)
            return getDistanceToFruit(a) < getDistanceToFruit(b)
        end)
        
        for i, fruitData in ipairs(fruits) do
            local button, distLabel, data = createFruitButton(fruitData, i)
            table.insert(fruitCache, {button = button, distLabel = distLabel, data = data})
        end
    end
    
    FruitList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 10)
end

local function updateDistances()
    for _, cache in ipairs(fruitCache) do
        if cache.data and cache.data.tool and cache.data.tool.Parent then
            local dist = getDistanceToFruit(cache.data)
            if dist < math.huge then
                cache.distLabel.Text = string.format("📍 %.0f studs", dist)
                if dist < 20 then
                    cache.distLabel.TextColor3 = Color3.fromRGB(140, 220, 140)
                elseif dist < 100 then
                    cache.distLabel.TextColor3 = Color3.fromRGB(200, 200, 140)
                else
                    cache.distLabel.TextColor3 = Color3.fromRGB(150, 180, 150)
                end
            else
                cache.distLabel.Text = "📍 Unknown"
            end
        else
            cache.distLabel.Text = "❌ Gone!"
            cache.distLabel.TextColor3 = Color3.fromRGB(200, 100, 100)
        end
    end
end

-- Button Connections
local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        ContentFrame.Visible = false
        MainFrame.Size = UDim2.new(0, 440, 0, 35)
        MinimizeBtn.Text = "+"
    else
        ContentFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 440, 0, 520)
        MinimizeBtn.Text = "−"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

ModeToggle.MouseButton1Click:Connect(function()
    settings.useWalking = not settings.useWalking
    if settings.useWalking then
        ModeToggle.Text = "🚶 Walking Mode"
        ModeToggle.BackgroundColor3 = Color3.fromRGB(80, 130, 80)
    else
        ModeToggle.Text = "🚀 Teleport Mode"
        ModeToggle.BackgroundColor3 = Color3.fromRGB(60, 90, 140)
    end
end)

AutoPickupToggle.MouseButton1Click:Connect(function()
    settings.autoPickup = not settings.autoPickup
    if settings.autoPickup then
        AutoPickupToggle.Text = "✅ Auto Pickup: ON"
        AutoPickupToggle.BackgroundColor3 = Color3.fromRGB(70, 130, 70)
    else
        AutoPickupToggle.Text = "❌ Auto Pickup: OFF"
        AutoPickupToggle.BackgroundColor3 = Color3.fromRGB(130, 70, 70)
    end
end)

RefreshBtn.MouseButton1Click:Connect(function()
    refreshFruitList()
    StatusDisplay.Text = "🔄 Refreshed"
    StatusDisplay.TextColor3 = Color3.fromRGB(140, 200, 200)
end)

StopBtn.MouseButton1Click:Connect(function()
    isTeleporting = false
    clearTracers()
    clearDestinationCircle()
    clearPlatform()
    currentSmoothPoints = nil
    
    local humanoid = getHumanoid()
    local myRoot = getRootPart()
    if humanoid and myRoot then
        humanoid:MoveTo(myRoot.Position)
    end
    
    StatusDisplay.Text = "⛔ Stopped"
    StatusDisplay.TextColor3 = Color3.fromRGB(200, 140, 140)
end)

DelayBox.FocusLost:Connect(function()
    local num = tonumber(DelayBox.Text)
    if num and num >= 0.05 and num <= 5 then
        settings.tpDelay = num
        DelayLabel.Text = "  ⏱️ TP Delay: " .. settings.tpDelay .. "s"
    else
        DelayBox.Text = tostring(settings.tpDelay)
    end
end)

-- Background Loops
task.spawn(function()
    while ScreenGui.Parent do
        task.wait(settings.scanInterval)
        if not isTeleporting then
            refreshFruitList()
        end
    end
end)

task.spawn(function()
    while ScreenGui.Parent do
        task.wait(0.5)
        updateDistances()
    end
end)

task.spawn(function()
    while ScreenGui.Parent do
        task.wait(1)
        if speedModified then
            local humanoid = getHumanoid()
            if humanoid and humanoid.WalkSpeed ~= settings.walkSpeed then
                humanoid.WalkSpeed = settings.walkSpeed
            end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    isTeleporting = false
    clearTracers()
    clearDestinationCircle()
    clearPlatform()
    currentSmoothPoints = nil
    selectedFruit = nil
    
    if speedModified then
        task.wait(0.5)
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.WalkSpeed = settings.walkSpeed
        end
    end
end)

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    FruitList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 10)
end)

-- Initial Load
task.spawn(function()
    task.wait(1)
    local humanoid = getHumanoid()
    if humanoid then
        settings.originalWalkSpeed = humanoid.WalkSpeed
        settings.walkSpeed = humanoid.WalkSpeed
        updateWalkSpeed(humanoid.WalkSpeed)
    end
end)

refreshFruitList()
StatusDisplay.Text = "Ready - Click a fruit to teleport"
StatusDisplay.TextColor3 = Color3.fromRGB(140, 200, 140)
