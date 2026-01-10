-- GPO Teleporter v3 - Anti-Cheat Bypass with Speed Modes
-- Server Detection Format: "Strike: +Y Axis too fast: [speed] | [limit] | Ground: [status]"
-- The limit appears to be ~16 studs/second for Y-axis when not grounded

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- === SPEED MODES ===
-- Server measures velocity, not displacement per frame
-- Mode 1: Ultra Safe - 10 studs/sec Y, 30 studs/sec horizontal
-- Mode 2: Safe - 14 studs/sec Y (under 16 limit)
-- Mode 3: Risky - 20 studs/sec Y (may get strikes)

local speedModes = {
    {name = "Ultra Safe", ySpeed = 8, hSpeed = 25, desc = "Slow but safe"},
    {name = "Safe", ySpeed = 12, hSpeed = 35, desc = "Balanced"},
    {name = "Medium", ySpeed = 15, hSpeed = 50, desc = "Faster, some risk"},
    {name = "Fast", ySpeed = 22, hSpeed = 80, desc = "Risky - grounded only"},
}

local currentMode = 1  -- Start with ultra safe
local isTeleporting = false
local shouldStop = false

-- === GUI ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GPOTeleporterV3"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 380)
mainFrame.Position = UDim2.new(0, 10, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 32)
title.BackgroundTransparency = 1
title.Text = "🛡️ GPO Safe TP v3"
title.TextColor3 = Color3.fromRGB(80, 180, 255)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Mode selector
local modeFrame = Instance.new("Frame")
modeFrame.Size = UDim2.new(1, -10, 0, 50)
modeFrame.Position = UDim2.new(0, 5, 0, 35)
modeFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
modeFrame.Parent = mainFrame
Instance.new("UICorner", modeFrame).CornerRadius = UDim.new(0, 6)

local modeLabel = Instance.new("TextLabel")
modeLabel.Size = UDim2.new(1, 0, 0, 20)
modeLabel.BackgroundTransparency = 1
modeLabel.Text = "Mode: Ultra Safe"
modeLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
modeLabel.TextSize = 13
modeLabel.Font = Enum.Font.GothamBold
modeLabel.Parent = modeFrame

local modeDesc = Instance.new("TextLabel")
modeDesc.Size = UDim2.new(1, 0, 0, 14)
modeDesc.Position = UDim2.new(0, 0, 0, 18)
modeDesc.BackgroundTransparency = 1
modeDesc.Text = "Y: 8 studs/s | H: 25 studs/s"
modeDesc.TextColor3 = Color3.fromRGB(120, 120, 130)
modeDesc.TextSize = 10
modeDesc.Font = Enum.Font.Gotham
modeDesc.Parent = modeFrame

local modeBtn = Instance.new("TextButton")
modeBtn.Size = UDim2.new(1, -8, 0, 18)
modeBtn.Position = UDim2.new(0, 4, 0, 32)
modeBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 120)
modeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
modeBtn.Text = "Cycle Mode →"
modeBtn.TextSize = 11
modeBtn.Font = Enum.Font.Gotham
modeBtn.Parent = modeFrame
Instance.new("UICorner", modeBtn).CornerRadius = UDim.new(0, 4)

-- Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -10, 0, 45)
statusLabel.Position = UDim2.new(0, 5, 0, 90)
statusLabel.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
statusLabel.TextSize = 11
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextWrapped = true
statusLabel.Text = "Status: Ready"
statusLabel.Parent = mainFrame
Instance.new("UICorner", statusLabel).CornerRadius = UDim.new(0, 6)

-- Ground indicator
local groundLabel = Instance.new("TextLabel")
groundLabel.Size = UDim2.new(1, -10, 0, 20)
groundLabel.Position = UDim2.new(0, 5, 0, 138)
groundLabel.BackgroundColor3 = Color3.fromRGB(40, 60, 40)
groundLabel.TextColor3 = Color3.fromRGB(100, 200, 100)
groundLabel.TextSize = 11
groundLabel.Font = Enum.Font.Gotham
groundLabel.Text = "Ground: Unknown"
groundLabel.Parent = mainFrame
Instance.new("UICorner", groundLabel).CornerRadius = UDim.new(0, 4)

-- Player list
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 0, 150)
scrollFrame.Position = UDim2.new(0, 5, 0, 162)
scrollFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 4
scrollFrame.Parent = mainFrame
Instance.new("UICorner", scrollFrame).CornerRadius = UDim.new(0, 6)

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 2)
listLayout.Parent = scrollFrame

-- Stop button
local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, -10, 0, 32)
stopBtn.Position = UDim2.new(0, 5, 1, -40)
stopBtn.BackgroundColor3 = Color3.fromRGB(160, 50, 50)
stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stopBtn.Text = "⏹ STOP TELEPORT"
stopBtn.TextSize = 13
stopBtn.Font = Enum.Font.GothamBold
stopBtn.Parent = mainFrame
Instance.new("UICorner", stopBtn).CornerRadius = UDim.new(0, 6)

-- === FUNCTIONS ===
local function updateMode()
    local mode = speedModes[currentMode]
    modeLabel.Text = "Mode: " .. mode.name
    modeDesc.Text = "Y: " .. mode.ySpeed .. " studs/s | H: " .. mode.hSpeed .. " studs/s"
    
    -- Color based on risk
    if currentMode == 1 then
        modeLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif currentMode == 2 then
        modeLabel.TextColor3 = Color3.fromRGB(180, 255, 100)
    elseif currentMode == 3 then
        modeLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        modeLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end

local function updateStatus(text, color)
    statusLabel.Text = "Status: " .. text
    statusLabel.TextColor3 = color or Color3.fromRGB(150, 150, 150)
end

local function isGrounded()
    local char = player.Character
    if not char then return false end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return false end
    return hum.FloorMaterial ~= Enum.Material.Air
end

local function updateGroundStatus()
    local grounded = isGrounded()
    if grounded then
        groundLabel.Text = "Ground: ✓ Grounded"
        groundLabel.BackgroundColor3 = Color3.fromRGB(40, 70, 40)
        groundLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    else
        groundLabel.Text = "Ground: ✗ Airborne"
        groundLabel.BackgroundColor3 = Color3.fromRGB(70, 40, 40)
        groundLabel.TextColor3 = Color3.fromRGB(220, 100, 100)
    end
    return grounded
end

-- Core movement - respects studs/second limits
local function moveTowardTarget(hrp, targetPos, deltaTime)
    local mode = speedModes[currentMode]
    local currentPos = hrp.Position
    local delta = targetPos - currentPos
    
    -- Calculate max movement this frame based on studs/second
    local maxYMove = mode.ySpeed * deltaTime
    local maxHMove = mode.hSpeed * deltaTime
    
    -- If grounded, allow more Y movement
    if isGrounded() then
        maxYMove = maxYMove * 1.5  -- 50% bonus when grounded
    end
    
    -- Clamp each axis
    local moveX = math.clamp(delta.X, -maxHMove, maxHMove)
    local moveY = math.clamp(delta.Y, -maxYMove, maxYMove)
    local moveZ = math.clamp(delta.Z, -maxHMove, maxHMove)
    
    local newPos = currentPos + Vector3.new(moveX, moveY, moveZ)
    
    -- Apply movement - preserve orientation
    local lookAngle = hrp.CFrame - hrp.CFrame.Position
    hrp.CFrame = CFrame.new(newPos) * lookAngle
    
    -- Clear physics
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
    
    return (targetPos - newPos).Magnitude
end

local function teleportToPlayer(targetPlayer)
    if isTeleporting then
        updateStatus("Already teleporting!", Color3.fromRGB(255, 180, 80))
        return
    end
    
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        updateStatus("No character!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    local targetChar = targetPlayer.Character
    local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then
        updateStatus("Target not available!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    isTeleporting = true
    shouldStop = false
    
    local startTime = tick()
    local lastUpdate = startTime
    local mode = speedModes[currentMode]
    
    updateStatus("Moving to " .. targetPlayer.Name, Color3.fromRGB(100, 200, 255))
    
    -- Use RenderStepped for smooth frame-by-frame movement
    local connection
    connection = RunService.RenderStepped:Connect(function(deltaTime)
        if shouldStop then
            connection:Disconnect()
            isTeleporting = false
            updateStatus("Stopped", Color3.fromRGB(255, 180, 80))
            return
        end
        
        -- Re-validate
        character = player.Character
        hrp = character and character:FindFirstChild("HumanoidRootPart")
        targetChar = targetPlayer.Character
        targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        if not hrp or not targetHRP then
            connection:Disconnect()
            isTeleporting = false
            updateStatus("Lost target/character", Color3.fromRGB(255, 80, 80))
            return
        end
        
        -- Update ground status
        updateGroundStatus()
        
        -- Move toward target
        local targetPos = targetHRP.Position
        local remaining = moveTowardTarget(hrp, targetPos, deltaTime)
        
        -- Update status every 0.5s
        if tick() - lastUpdate > 0.5 then
            updateStatus(string.format("%.0f studs remaining", remaining), Color3.fromRGB(100, 200, 255))
            lastUpdate = tick()
        end
        
        -- Check if arrived
        if remaining < 5 then
            connection:Disconnect()
            isTeleporting = false
            local elapsed = tick() - startTime
            updateStatus(string.format("Arrived! (%.1fs)", elapsed), Color3.fromRGB(100, 255, 100))
            return
        end
        
        -- Timeout after 10 minutes
        if tick() - startTime > 600 then
            connection:Disconnect()
            isTeleporting = false
            updateStatus("Timeout!", Color3.fromRGB(255, 80, 80))
            return
        end
    end)
end

-- === PLAYER LIST ===
local function refreshPlayerList()
    for _, child in pairs(scrollFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -4, 0, 26)
            btn.BackgroundColor3 = Color3.fromRGB(45, 50, 60)
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
            btn.Text = plr.Name
            btn.TextSize = 12
            btn.Font = Enum.Font.Gotham
            btn.Parent = scrollFrame
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
            
            btn.MouseButton1Click:Connect(function()
                teleportToPlayer(plr)
            end)
            
            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(60, 70, 85)
            end)
            btn.MouseLeave:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(45, 50, 60)
            end)
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end

-- === EVENTS ===
modeBtn.MouseButton1Click:Connect(function()
    currentMode = (currentMode % #speedModes) + 1
    updateMode()
end)

stopBtn.MouseButton1Click:Connect(function()
    shouldStop = true
end)

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

-- Ground status updater
task.spawn(function()
    while true do
        updateGroundStatus()
        task.wait(0.2)
    end
end)

-- Initialize
updateMode()
refreshPlayerList()
updateStatus("Ready - Select player", Color3.fromRGB(100, 200, 100))

print("[GPO TP v3] Loaded")
print("  Mode 1 (Ultra Safe): 8 Y / 25 H studs per second")
print("  Mode 2 (Safe): 12 Y / 35 H studs per second")
print("  Mode 3 (Medium): 15 Y / 50 H studs per second")
print("  Mode 4 (Fast): 22 Y / 80 H studs per second - grounded recommended")
