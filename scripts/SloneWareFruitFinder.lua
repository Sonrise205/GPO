--[[
    SloneWare Fruit Finder v2.2 (Safe Edition)
    - No print/warn statements
    - No server communication
    - Optional risky features (disabled by default)
    - Walking mode by default (safer)
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

-- Settings (Safe defaults)
local settings = {
    tpDelay = 0.5,
    platformHeight = 3,
    checkpointDistance = 30,
    stopDistance = 8,
    tracerSubdivisions = 5,
    useWalking = true,  -- Walking is safer, enabled by default
    walkSpeed = 16,
    originalWalkSpeed = 16,
    autoPickup = true,
    scanInterval = 3,
    pickupRange = 15,
    enableSpeedMod = false,  -- Speed modification disabled by default
    pulseSpeed = 2,
    circleMinRadius = 15,
    circleMaxRadius = 25,
    circleColor = Color3.fromRGB(255, 200, 100),
    circleOutlineColor = Color3.fromRGB(200, 150, 50)
}

-- State
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

local defaultFruitImage = "rbxassetid://6031075938"

-- Safe utility functions
local function safeDestroy(obj)
    if obj and typeof(obj) == "Instance" and obj.Parent then
        pcall(function() obj:Destroy() end)
    end
end

local function safeRemove(drawing)
    if drawing then
        pcall(function() drawing:Remove() end)
    end
end

local function clearTracers()
    for _, data in pairs(tracerLines) do
        safeRemove(data.line)
    end
    tracerLines = {}
end

local function clearPlatform()
    safeDestroy(currentPlatform)
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

local function getFruitImage(fruitTool)
    if fruitTool:IsA("Tool") and fruitTool.TextureId and fruitTool.TextureId ~= "" then
        return fruitTool.TextureId
    end
    for _, desc in ipairs(fruitTool:GetDescendants()) do
        if desc:IsA("Decal") and desc.Texture and desc.Texture ~= "" then
            return desc.Texture
        end
    end
    return defaultFruitImage
end

local function isFruit(obj)
    return obj:IsA("Tool") and obj:FindFirstChild("FruitEater") ~= nil
end

local function getFruitName(fruitTool)
    return fruitTool.Name or "Unknown"
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
    return fruits
end

local function getDistanceToFruit(fruit)
    local myRoot = getRootPart()
    if not myRoot or not fruit.position then
        return math.huge
    end
    return (myRoot.Position - fruit.position).Magnitude
end

-- Pickup functions
local function findProximityPrompt(fruitTool)
    for _, desc in ipairs(fruitTool:GetDescendants()) do
        if desc:IsA("ProximityPrompt") then
            return desc
        end
    end
    if fruitTool.PrimaryPart then
        return fruitTool.PrimaryPart:FindFirstChildWhichIsA("ProximityPrompt", true)
    end
    return nil
end

local function triggerPrompt(prompt)
    if not prompt or not prompt.Parent then return false end
    
    local success = false
    
    if fireproximityprompt then
        pcall(function()
            fireproximityprompt(prompt, 1)
            success = true
        end)
    end
    
    if not success then
        pcall(function()
            prompt:InputHoldBegin()
            task.wait((prompt.HoldDuration or 0) + 0.1)
            prompt:InputHoldEnd()
            success = true
        end)
    end
    
    return success
end

local function tryPickup(fruitTool)
    if not settings.autoPickup or not fruitTool or not fruitTool.Parent then
        return false, "N/A"
    end
    
    local prompt = findProximityPrompt(fruitTool)
    if not prompt then
        if fireclickdetector then
            local cd = fruitTool:FindFirstChildWhichIsA("ClickDetector", true)
            if cd then
                pcall(function() fireclickdetector(cd) end)
                return true, "Click"
            end
        end
        return false, "No prompt"
    end
    
    local myRoot = getRootPart()
    local fruitPos = getFruitPosition(fruitTool)
    if not myRoot or not fruitPos then return false, "No pos" end
    
    local dist = (myRoot.Position - fruitPos).Magnitude
    if dist > (prompt.MaxActivationDistance or 10) + 3 then
        return false, "Far"
    end
    
    if not prompt.Enabled then return false, "Disabled" end
    
    return triggerPrompt(prompt), "Triggered"
end

local function pickupLoop(fruitTool, attempts)
    for i = 1, (attempts or 5) do
        if not fruitTool or not fruitTool.Parent then
            return true, "Got it!"
        end
        local ok, msg = tryPickup(fruitTool)
        if ok then return true, msg end
        
        local myRoot = getRootPart()
        local pos = getFruitPosition(fruitTool)
        if myRoot and pos then
            local dir = (pos - myRoot.Position).Unit
            myRoot.CFrame = myRoot.CFrame + dir * 1
        end
        task.wait(0.25)
    end
    return false, "Failed"
end

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FruitFinderUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 480)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 42)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 250, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🍎 Fruit Finder"
Title.TextColor3 = Color3.fromRGB(255, 200, 100)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -32, 0, 2)
CloseBtn.BackgroundColor3 = Color3.fromRGB(160, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TopBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -16, 1, -40)
Content.Position = UDim2.new(0, 8, 0, 36)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local CountLabel = Instance.new("TextLabel")
CountLabel.Size = UDim2.new(1, 0, 0, 24)
CountLabel.BackgroundColor3 = Color3.fromRGB(45, 55, 65)
CountLabel.Text = "  Fruits: 0"
CountLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
CountLabel.TextSize = 12
CountLabel.Font = Enum.Font.GothamBold
CountLabel.TextXAlignment = Enum.TextXAlignment.Left
CountLabel.BorderSizePixel = 0
CountLabel.Parent = Content
Instance.new("UICorner", CountLabel).CornerRadius = UDim.new(0, 6)

local FruitList = Instance.new("ScrollingFrame")
FruitList.Size = UDim2.new(1, 0, 0, 180)
FruitList.Position = UDim2.new(0, 0, 0, 28)
FruitList.BackgroundColor3 = Color3.fromRGB(25, 30, 38)
FruitList.ScrollBarThickness = 4
FruitList.CanvasSize = UDim2.new(0, 0, 0, 0)
FruitList.BorderSizePixel = 0
FruitList.Parent = Content
Instance.new("UICorner", FruitList).CornerRadius = UDim.new(0, 6)

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 4)
ListLayout.Parent = FruitList

local ListPad = Instance.new("UIPadding")
ListPad.PaddingTop = UDim.new(0, 4)
ListPad.PaddingLeft = UDim.new(0, 4)
ListPad.PaddingRight = UDim.new(0, 4)
ListPad.Parent = FruitList

-- Settings Panel
local SettingsFrame = Instance.new("Frame")
SettingsFrame.Size = UDim2.new(1, 0, 0, 150)
SettingsFrame.Position = UDim2.new(0, 0, 0, 212)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(35, 42, 52)
SettingsFrame.BorderSizePixel = 0
SettingsFrame.Parent = Content
Instance.new("UICorner", SettingsFrame).CornerRadius = UDim.new(0, 6)

-- Mode buttons
local ModeBtn = Instance.new("TextButton")
ModeBtn.Size = UDim2.new(0.48, 0, 0, 28)
ModeBtn.Position = UDim2.new(0, 4, 0, 4)
ModeBtn.BackgroundColor3 = Color3.fromRGB(70, 120, 70)
ModeBtn.Text = "🚶 Walk Mode"
ModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeBtn.TextSize = 11
ModeBtn.Font = Enum.Font.GothamSemibold
ModeBtn.BorderSizePixel = 0
ModeBtn.Parent = SettingsFrame
Instance.new("UICorner", ModeBtn).CornerRadius = UDim.new(0, 6)

local AutoBtn = Instance.new("TextButton")
AutoBtn.Size = UDim2.new(0.48, 0, 0, 28)
AutoBtn.Position = UDim2.new(0.52, 0, 0, 4)
AutoBtn.BackgroundColor3 = Color3.fromRGB(70, 120, 70)
AutoBtn.Text = "✓ Auto Pickup"
AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBtn.TextSize = 11
AutoBtn.Font = Enum.Font.GothamSemibold
AutoBtn.BorderSizePixel = 0
AutoBtn.Parent = SettingsFrame
Instance.new("UICorner", AutoBtn).CornerRadius = UDim.new(0, 6)

-- Speed toggle (risky - disabled by default)
local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Size = UDim2.new(1, -8, 0, 28)
SpeedToggle.Position = UDim2.new(0, 4, 0, 36)
SpeedToggle.BackgroundColor3 = Color3.fromRGB(80, 60, 60)
SpeedToggle.Text = "⚠️ Speed Mod: OFF (Risky)"
SpeedToggle.TextColor3 = Color3.fromRGB(200, 180, 180)
SpeedToggle.TextSize = 11
SpeedToggle.Font = Enum.Font.GothamSemibold
SpeedToggle.BorderSizePixel = 0
SpeedToggle.Parent = SettingsFrame
Instance.new("UICorner", SpeedToggle).CornerRadius = UDim.new(0, 6)

-- Speed slider (hidden by default)
local SpeedSliderFrame = Instance.new("Frame")
SpeedSliderFrame.Size = UDim2.new(1, -8, 0, 30)
SpeedSliderFrame.Position = UDim2.new(0, 4, 0, 68)
SpeedSliderFrame.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
SpeedSliderFrame.Visible = false
SpeedSliderFrame.BorderSizePixel = 0
SpeedSliderFrame.Parent = SettingsFrame
Instance.new("UICorner", SpeedSliderFrame).CornerRadius = UDim.new(0, 6)

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 80, 1, 0)
SpeedLabel.Position = UDim2.new(0, 8, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Speed: 16"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.TextSize = 11
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = SpeedSliderFrame

local SpeedSliderBG = Instance.new("Frame")
SpeedSliderBG.Size = UDim2.new(0, 200, 0, 6)
SpeedSliderBG.Position = UDim2.new(0, 90, 0.5, -3)
SpeedSliderBG.BackgroundColor3 = Color3.fromRGB(30, 35, 42)
SpeedSliderBG.BorderSizePixel = 0
SpeedSliderBG.Parent = SpeedSliderFrame
Instance.new("UICorner", SpeedSliderBG).CornerRadius = UDim.new(1, 0)

local SpeedSliderFill = Instance.new("Frame")
SpeedSliderFill.Size = UDim2.new(0.08, 0, 1, 0)
SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(100, 160, 100)
SpeedSliderFill.BorderSizePixel = 0
SpeedSliderFill.Parent = SpeedSliderBG
Instance.new("UICorner", SpeedSliderFill).CornerRadius = UDim.new(1, 0)

local SpeedSliderKnob = Instance.new("TextButton")
SpeedSliderKnob.Size = UDim2.new(0, 14, 0, 14)
SpeedSliderKnob.Position = UDim2.new(0.08, -7, 0.5, -7)
SpeedSliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedSliderKnob.Text = ""
SpeedSliderKnob.BorderSizePixel = 0
SpeedSliderKnob.Parent = SpeedSliderBG
Instance.new("UICorner", SpeedSliderKnob).CornerRadius = UDim.new(1, 0)

-- Control buttons
local RefreshBtn = Instance.new("TextButton")
RefreshBtn.Size = UDim2.new(0.48, 0, 0, 26)
RefreshBtn.Position = UDim2.new(0, 4, 0, 102)
RefreshBtn.BackgroundColor3 = Color3.fromRGB(100, 90, 50)
RefreshBtn.Text = "🔄 Refresh"
RefreshBtn.TextColor3 = Color3.fromRGB(255, 240, 200)
RefreshBtn.TextSize = 11
RefreshBtn.Font = Enum.Font.GothamSemibold
RefreshBtn.BorderSizePixel = 0
RefreshBtn.Parent = SettingsFrame
Instance.new("UICorner", RefreshBtn).CornerRadius = UDim.new(0, 6)

local StopBtn = Instance.new("TextButton")
StopBtn.Size = UDim2.new(0.48, 0, 0, 26)
StopBtn.Position = UDim2.new(0.52, 0, 0, 102)
StopBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
StopBtn.Text = "⛔ Stop"
StopBtn.TextColor3 = Color3.fromRGB(255, 200, 200)
StopBtn.TextSize = 11
StopBtn.Font = Enum.Font.GothamSemibold
StopBtn.BorderSizePixel = 0
StopBtn.Parent = SettingsFrame
Instance.new("UICorner", StopBtn).CornerRadius = UDim.new(0, 6)

-- Status
local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, 0, 0, 45)
StatusFrame.Position = UDim2.new(0, 0, 0, 366)
StatusFrame.BackgroundColor3 = Color3.fromRGB(25, 30, 38)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = Content
Instance.new("UICorner", StatusFrame).CornerRadius = UDim.new(0, 6)

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -10, 1, 0)
StatusText.Position = UDim2.new(0, 5, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Ready"
StatusText.TextColor3 = Color3.fromRGB(140, 200, 140)
StatusText.TextSize = 11
StatusText.Font = Enum.Font.Gotham
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.TextWrapped = true
StatusText.Parent = StatusFrame

-- Speed slider logic
local dragging = false

local function setSpeed(val)
    if not settings.enableSpeedMod then return end
    val = math.clamp(math.floor(val), 0, 200)
    settings.walkSpeed = val
    SpeedLabel.Text = "Speed: " .. val
    local pct = val / 200
    SpeedSliderFill.Size = UDim2.new(pct, 0, 1, 0)
    SpeedSliderKnob.Position = UDim2.new(pct, -7, 0.5, -7)
    
    local hum = getHumanoid()
    if hum then hum.WalkSpeed = val end
    
    if val > 50 then
        SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(200, 100, 100)
    elseif val > 25 then
        SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(200, 180, 80)
    else
        SpeedSliderFill.BackgroundColor3 = Color3.fromRGB(100, 160, 100)
    end
end

SpeedSliderBG.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        local rel = math.clamp((input.Position.X - SpeedSliderBG.AbsolutePosition.X) / SpeedSliderBG.AbsoluteSize.X, 0, 1)
        setSpeed(rel * 200)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local rel = math.clamp((input.Position.X - SpeedSliderBG.AbsolutePosition.X) / SpeedSliderBG.AbsoluteSize.X, 0, 1)
        setSpeed(rel * 200)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Path functions
local function clearDestCircle()
    safeRemove(destinationCircle)
    safeRemove(destinationCircleOutline)
    destinationCircle = nil
    destinationCircleOutline = nil
    destinationPosition = nil
end

local function worldToScreen(pos)
    local sp, vis = Camera:WorldToViewportPoint(pos)
    return Vector2.new(sp.X, sp.Y), vis
end

local function updateTracers()
    if destinationPosition and destinationCircle then
        local sp, vis = worldToScreen(destinationPosition)
        if vis then
            local t = (math.sin(tick() * settings.pulseSpeed * math.pi * 2) + 1) / 2
            local r = settings.circleMinRadius + (settings.circleMaxRadius - settings.circleMinRadius) * t
            destinationCircle.Position = sp
            destinationCircle.Radius = r
            destinationCircle.Visible = true
            destinationCircleOutline.Position = sp
            destinationCircleOutline.Radius = r + 2
            destinationCircleOutline.Visible = true
        else
            destinationCircle.Visible = false
            destinationCircleOutline.Visible = false
        end
    end
end

local function createDestCircle(pos)
    clearDestCircle()
    destinationPosition = pos
    
    destinationCircleOutline = Drawing.new("Circle")
    destinationCircleOutline.Color = settings.circleOutlineColor
    destinationCircleOutline.Thickness = 2
    destinationCircleOutline.Filled = false
    destinationCircleOutline.Visible = false
    
    destinationCircle = Drawing.new("Circle")
    destinationCircle.Color = settings.circleColor
    destinationCircle.Thickness = 1
    destinationCircle.Filled = false
    destinationCircle.Visible = false
end

local function createPlatform(pos)
    clearPlatform()
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {getCharacter()}
    
    local hit = workspace:Raycast(pos + Vector3.new(0, 50, 0), Vector3.new(0, -100, 0), params)
    local y = hit and hit.Position.Y or pos.Y
    
    local p = Instance.new("Part")
    p.Size = Vector3.new(8, 1, 8)
    p.Position = Vector3.new(pos.X, y + settings.platformHeight, pos.Z)
    p.Anchored = true
    p.CanCollide = true
    p.Transparency = 1
    p.Parent = workspace
    currentPlatform = p
    return p
end

-- Movement functions
local function walkTo(fruitData, waypoints)
    local hum = getHumanoid()
    if not hum then return false end
    
    StatusText.Text = "Walking..."
    StatusText.TextColor3 = Color3.fromRGB(200, 200, 140)
    
    local idx = 2
    local done = false
    local fail = false
    
    local conn
    conn = hum.MoveToFinished:Connect(function(reached)
        if not isTeleporting then conn:Disconnect() return end
        if reached then
            idx = idx + 1
            if idx <= #waypoints then
                if waypoints[idx].Action == Enum.PathWaypointAction.Jump then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                hum:MoveTo(waypoints[idx].Position)
            else
                done = true
            end
        else
            fail = true
        end
    end)
    
    if waypoints[idx] then
        if waypoints[idx].Action == Enum.PathWaypointAction.Jump then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        hum:MoveTo(waypoints[idx].Position)
    end
    
    local t = 0
    while not done and not fail and isTeleporting and t < #waypoints * 10 do
        task.wait(0.1)
        t = t + 0.1
    end
    
    conn:Disconnect()
    return done
end

local function goToFruit(fruitData)
    if isTeleporting then return end
    if not fruitData.tool or not fruitData.tool.Parent then
        StatusText.Text = "Fruit gone!"
        StatusText.TextColor3 = Color3.fromRGB(200, 100, 100)
        return
    end
    
    local pos = getFruitPosition(fruitData.tool)
    local root = getRootPart()
    if not pos or not root then return end
    
    isTeleporting = true
    StatusText.Text = "Pathfinding..."
    StatusText.TextColor3 = Color3.fromRGB(200, 200, 140)
    
    local path = PathfindingService:CreatePath({
        AgentRadius = 2, AgentHeight = 5, AgentCanJump = true
    })
    
    local ok = pcall(function() path:ComputeAsync(root.Position, pos) end)
    
    if not ok or path.Status ~= Enum.PathStatus.Success then
        if not settings.useWalking then
            root.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
            task.wait(0.3)
            if settings.autoPickup then
                pickupLoop(fruitData.tool, 3)
            end
        end
        isTeleporting = false
        StatusText.Text = "Path failed"
        return
    end
    
    local wps = path:GetWaypoints()
    createDestCircle(pos)
    
    local tracerConn = RunService.RenderStepped:Connect(updateTracers)
    
    if settings.useWalking then
        walkTo(fruitData, wps)
    else
        local dist = 0
        for i, wp in ipairs(wps) do
            if not isTeleporting then break end
            if not fruitData.tool or not fruitData.tool.Parent then break end
            
            if i > 1 then
                dist = dist + (wp.Position - wps[i-1].Position).Magnitude
            end
            
            if dist >= settings.checkpointDistance or i == #wps then
                createPlatform(wp.Position)
                root.CFrame = CFrame.new(currentPlatform.Position + Vector3.new(0, 2, 0))
                dist = 0
                task.wait(settings.tpDelay)
            end
        end
        
        if fruitData.tool and fruitData.tool.Parent then
            local fp = getFruitPosition(fruitData.tool)
            if fp then
                root.CFrame = CFrame.new(fp + Vector3.new(0, 2, 0) + (root.Position - fp).Unit * settings.stopDistance)
            end
        end
    end
    
    StatusText.Text = "Picking up..."
    task.wait(0.2)
    
    if settings.autoPickup and fruitData.tool and fruitData.tool.Parent then
        local ok2, msg = pickupLoop(fruitData.tool, 5)
        StatusText.Text = ok2 and "✓ " .. msg or "⚠ " .. msg
        StatusText.TextColor3 = ok2 and Color3.fromRGB(140, 200, 140) or Color3.fromRGB(200, 180, 100)
    else
        StatusText.Text = "✓ Arrived"
        StatusText.TextColor3 = Color3.fromRGB(140, 200, 140)
    end
    
    task.wait(1.5)
    tracerConn:Disconnect()
    clearDestCircle()
    clearPlatform()
    isTeleporting = false
end

-- Fruit button
local function createFruitBtn(data, idx)
    local btn = Instance.new("Frame")
    btn.Size = UDim2.new(1, -8, 0, 50)
    btn.BackgroundColor3 = Color3.fromRGB(40, 48, 40)
    btn.LayoutOrder = idx
    btn.BorderSizePixel = 0
    btn.Parent = FruitList
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(0, 40, 0, 40)
    img.Position = UDim2.new(0, 5, 0, 5)
    img.BackgroundColor3 = Color3.fromRGB(30, 35, 30)
    img.Image = data.image
    img.ScaleType = Enum.ScaleType.Fit
    img.BorderSizePixel = 0
    img.Parent = btn
    Instance.new("UICorner", img).CornerRadius = UDim.new(0, 6)
    
    local name = Instance.new("TextLabel")
    name.Size = UDim2.new(1, -110, 0, 20)
    name.Position = UDim2.new(0, 50, 0, 5)
    name.BackgroundTransparency = 1
    name.Text = data.name
    name.TextColor3 = Color3.fromRGB(255, 220, 150)
    name.TextSize = 12
    name.Font = Enum.Font.GothamBold
    name.TextXAlignment = Enum.TextXAlignment.Left
    name.TextTruncate = Enum.TextTruncate.AtEnd
    name.Parent = btn
    
    local dist = Instance.new("TextLabel")
    dist.Name = "Dist"
    dist.Size = UDim2.new(1, -110, 0, 16)
    dist.Position = UDim2.new(0, 50, 0, 26)
    dist.BackgroundTransparency = 1
    dist.Text = "..."
    dist.TextColor3 = Color3.fromRGB(150, 180, 150)
    dist.TextSize = 10
    dist.Font = Enum.Font.Gotham
    dist.TextXAlignment = Enum.TextXAlignment.Left
    dist.Parent = btn
    
    local go = Instance.new("TextButton")
    go.Size = UDim2.new(0, 45, 0, 40)
    go.Position = UDim2.new(1, -50, 0, 5)
    go.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
    go.Text = "GO"
    go.TextColor3 = Color3.fromRGB(255, 255, 255)
    go.TextSize = 12
    go.Font = Enum.Font.GothamBold
    go.BorderSizePixel = 0
    go.Parent = btn
    Instance.new("UICorner", go).CornerRadius = UDim.new(0, 6)
    
    go.MouseButton1Click:Connect(function()
        local fruits = scanForFruits()
        for _, f in ipairs(fruits) do
            if f.tool == data.tool then
                goToFruit(f)
                return
            end
        end
        StatusText.Text = "Fruit gone!"
    end)
    
    return btn, dist, data
end

-- Refresh list
local function refreshList()
    for _, c in pairs(FruitList:GetChildren()) do
        if c:IsA("Frame") then c:Destroy() end
    end
    fruitCache = {}
    
    local fruits = scanForFruits()
    CountLabel.Text = "  Fruits: " .. #fruits
    
    if #fruits == 0 then
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 0, 50)
        lbl.BackgroundTransparency = 1
        lbl.Text = "No fruits found"
        lbl.TextColor3 = Color3.fromRGB(120, 130, 140)
        lbl.TextSize = 11
        lbl.Parent = FruitList
    else
        table.sort(fruits, function(a, b)
            return getDistanceToFruit(a) < getDistanceToFruit(b)
        end)
        for i, f in ipairs(fruits) do
            local b, d, data = createFruitBtn(f, i)
            table.insert(fruitCache, {btn = b, dist = d, data = data})
        end
    end
    
    FruitList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 8)
end

local function updateDists()
    for _, c in ipairs(fruitCache) do
        if c.data.tool and c.data.tool.Parent then
            local d = getDistanceToFruit(c.data)
            c.dist.Text = string.format("%.0f studs", d)
            c.dist.TextColor3 = d < 30 and Color3.fromRGB(140, 200, 140) or Color3.fromRGB(150, 180, 150)
        else
            c.dist.Text = "Gone"
            c.dist.TextColor3 = Color3.fromRGB(200, 100, 100)
        end
    end
end

-- Button handlers
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

ModeBtn.MouseButton1Click:Connect(function()
    settings.useWalking = not settings.useWalking
    if settings.useWalking then
        ModeBtn.Text = "🚶 Walk Mode"
        ModeBtn.BackgroundColor3 = Color3.fromRGB(70, 120, 70)
    else
        ModeBtn.Text = "🚀 TP Mode"
        ModeBtn.BackgroundColor3 = Color3.fromRGB(70, 90, 140)
    end
end)

AutoBtn.MouseButton1Click:Connect(function()
    settings.autoPickup = not settings.autoPickup
    AutoBtn.Text = settings.autoPickup and "✓ Auto Pickup" or "✗ Auto Pickup"
    AutoBtn.BackgroundColor3 = settings.autoPickup and Color3.fromRGB(70, 120, 70) or Color3.fromRGB(120, 70, 70)
end)

SpeedToggle.MouseButton1Click:Connect(function()
    settings.enableSpeedMod = not settings.enableSpeedMod
    SpeedSliderFrame.Visible = settings.enableSpeedMod
    
    if settings.enableSpeedMod then
        SpeedToggle.Text = "⚠️ Speed Mod: ON"
        SpeedToggle.BackgroundColor3 = Color3.fromRGB(120, 80, 50)
        SpeedToggle.TextColor3 = Color3.fromRGB(255, 200, 150)
        
        local hum = getHumanoid()
        if hum then
            settings.originalWalkSpeed = hum.WalkSpeed
            setSpeed(hum.WalkSpeed)
        end
    else
        SpeedToggle.Text = "⚠️ Speed Mod: OFF (Risky)"
        SpeedToggle.BackgroundColor3 = Color3.fromRGB(80, 60, 60)
        SpeedToggle.TextColor3 = Color3.fromRGB(200, 180, 180)
        
        local hum = getHumanoid()
        if hum then
            hum.WalkSpeed = settings.originalWalkSpeed
        end
    end
end)

RefreshBtn.MouseButton1Click:Connect(function()
    refreshList()
    StatusText.Text = "Refreshed"
end)

StopBtn.MouseButton1Click:Connect(function()
    isTeleporting = false
    clearDestCircle()
    clearPlatform()
    local hum = getHumanoid()
    local root = getRootPart()
    if hum and root then hum:MoveTo(root.Position) end
    StatusText.Text = "Stopped"
    StatusText.TextColor3 = Color3.fromRGB(200, 140, 140)
end)

-- Background loops
task.spawn(function()
    while ScreenGui.Parent do
        task.wait(settings.scanInterval)
        if not isTeleporting then refreshList() end
    end
end)

task.spawn(function()
    while ScreenGui.Parent do
        task.wait(0.5)
        updateDists()
    end
end)

task.spawn(function()
    while ScreenGui.Parent do
        task.wait(1)
        if settings.enableSpeedMod then
            local hum = getHumanoid()
            if hum and hum.WalkSpeed ~= settings.walkSpeed then
                hum.WalkSpeed = settings.walkSpeed
            end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    isTeleporting = false
    clearDestCircle()
    clearPlatform()
    
    if settings.enableSpeedMod then
        task.wait(0.3)
        local hum = getHumanoid()
        if hum then hum.WalkSpeed = settings.walkSpeed end
    end
end)

-- Init
task.spawn(function()
    task.wait(0.5)
    local hum = getHumanoid()
    if hum then
        settings.originalWalkSpeed = hum.WalkSpeed
        settings.walkSpeed = hum.WalkSpeed
    end
end)

refreshList()
