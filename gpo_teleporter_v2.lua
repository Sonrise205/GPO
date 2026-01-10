-- GPO Teleporter v2 - Y-Axis Anti-Cheat Bypass
-- Based on server-side detection: "Strike: +Y Axis too fast: [speed] | [limit] | Ground: [status]"
-- Max Y movement: ~16 studs/tick (not grounded), ~24 studs/tick (grounded)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- === ANTI-CHEAT SAFE LIMITS ===
local config = {
    -- Y-axis limits (from server detection)
    maxYSpeed = 14,           -- Stay under 16 limit
    maxYSpeedGrounded = 22,   -- Stay under 24 limit when grounded
    
    -- Horizontal limits (less strict but still monitored)
    maxHorizontalSpeed = 20,  -- Conservative horizontal step
    
    -- Timing
    stepDelay = 0.05,         -- Delay per step (1 physics frame ~0.033s)
    groundCheckDelay = 0.1,   -- Extra delay for ground transitions
    
    -- Behavior
    useGroundHugging = true,  -- Try to stay near ground level
    smoothMovement = true,    -- Use physics-based movement
}

-- === GUI SETUP ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GPOTeleporter"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 320)
mainFrame.Position = UDim2.new(0, 10, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "GPO Safe TP v2"
title.TextColor3 = Color3.fromRGB(100, 200, 255)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Status display
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -10, 0, 40)
statusLabel.Position = UDim2.new(0, 5, 0, 32)
statusLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
statusLabel.TextSize = 11
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextWrapped = true
statusLabel.Text = "Status: Idle"
statusLabel.Parent = mainFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 4)
statusCorner.Parent = statusLabel

-- Player list
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 0, 180)
scrollFrame.Position = UDim2.new(0, 5, 0, 78)
scrollFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 4
scrollFrame.Parent = mainFrame

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 4)
scrollCorner.Parent = scrollFrame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 2)
listLayout.Parent = scrollFrame

-- Stop button
local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, -10, 0, 28)
stopBtn.Position = UDim2.new(0, 5, 1, -33)
stopBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stopBtn.Text = "STOP"
stopBtn.TextSize = 14
stopBtn.Font = Enum.Font.GothamBold
stopBtn.Parent = mainFrame

local stopCorner = Instance.new("UICorner")
stopCorner.CornerRadius = UDim.new(0, 4)
stopCorner.Parent = stopBtn

screenGui.Parent = player:WaitForChild("PlayerGui")

-- === CORE TELEPORT LOGIC ===
local isTeleporting = false
local shouldStop = false

local function updateStatus(text, color)
    statusLabel.Text = text
    statusLabel.TextColor3 = color or Color3.fromRGB(150, 150, 150)
end

local function isGrounded(character)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        return humanoid.FloorMaterial ~= Enum.Material.Air
    end
    return false
end

local function getGroundHeight(position)
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.FilterDescendantsInstances = {player.Character}
    
    local result = workspace:Raycast(position + Vector3.new(0, 5, 0), Vector3.new(0, -500, 0), rayParams)
    if result then
        return result.Position.Y
    end
    return position.Y
end

local function safeMoveStep(hrp, targetPos)
    local currentPos = hrp.Position
    local delta = targetPos - currentPos
    
    -- Check if grounded for Y limit
    local grounded = isGrounded(player.Character)
    local maxY = grounded and config.maxYSpeedGrounded or config.maxYSpeed
    
    -- Clamp movement to safe limits
    local safeX = math.clamp(delta.X, -config.maxHorizontalSpeed, config.maxHorizontalSpeed)
    local safeY = math.clamp(delta.Y, -maxY, maxY)
    local safeZ = math.clamp(delta.Z, -config.maxHorizontalSpeed, config.maxHorizontalSpeed)
    
    local safeDelta = Vector3.new(safeX, safeY, safeZ)
    local newPos = currentPos + safeDelta
    
    -- Apply movement
    if config.smoothMovement then
        -- Use CFrame with immediate velocity clear
        hrp.CFrame = CFrame.new(newPos) * CFrame.Angles(0, math.rad(hrp.Orientation.Y), 0)
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    else
        hrp.CFrame = CFrame.new(newPos)
    end
    
    return safeDelta.Magnitude
end

local function teleportToPlayer(targetPlayer)
    if isTeleporting then
        updateStatus("Already teleporting!", Color3.fromRGB(255, 150, 50))
        return
    end
    
    local character = player.Character
    if not character then
        updateStatus("No character!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        updateStatus("No HRP!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    local targetChar = targetPlayer.Character
    if not targetChar then
        updateStatus("Target has no character!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then
        updateStatus("Target has no HRP!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    isTeleporting = true
    shouldStop = false
    
    local startTime = tick()
    local steps = 0
    
    updateStatus("Teleporting to " .. targetPlayer.Name .. "...", Color3.fromRGB(100, 200, 100))
    
    while not shouldStop do
        -- Re-check target position (they might move)
        targetChar = targetPlayer.Character
        if not targetChar then
            updateStatus("Target disconnected!", Color3.fromRGB(255, 80, 80))
            break
        end
        
        targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetHRP then
            updateStatus("Target lost HRP!", Color3.fromRGB(255, 80, 80))
            break
        end
        
        -- Check our character
        character = player.Character
        if not character then
            updateStatus("Character lost!", Color3.fromRGB(255, 80, 80))
            break
        end
        
        hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            updateStatus("HRP lost!", Color3.fromRGB(255, 80, 80))
            break
        end
        
        local targetPos = targetHRP.Position
        local currentPos = hrp.Position
        local distance = (targetPos - currentPos).Magnitude
        
        -- Ground hugging: try to follow terrain height
        if config.useGroundHugging then
            local groundY = getGroundHeight(currentPos)
            -- Only apply if we're close to ground and target is roughly same height
            if math.abs(currentPos.Y - groundY) < 10 then
                local targetGroundY = getGroundHeight(targetPos)
                -- Move towards target but stay at ground level
                targetPos = Vector3.new(targetPos.X, groundY + 3, targetPos.Z)
            end
        end
        
        -- Check if close enough
        if distance < 5 then
            updateStatus("Arrived! (" .. string.format("%.1f", tick() - startTime) .. "s, " .. steps .. " steps)", Color3.fromRGB(100, 255, 100))
            break
        end
        
        -- Move one safe step
        local moved = safeMoveStep(hrp, targetPos)
        steps = steps + 1
        
        -- Update status periodically
        if steps % 10 == 0 then
            updateStatus("Moving: " .. string.format("%.0f", distance) .. " studs left", Color3.fromRGB(100, 200, 100))
        end
        
        -- Wait appropriate delay
        task.wait(config.stepDelay)
        
        -- Safety timeout (5 minutes max)
        if tick() - startTime > 300 then
            updateStatus("Timeout!", Color3.fromRGB(255, 80, 80))
            break
        end
    end
    
    if shouldStop then
        updateStatus("Stopped by user", Color3.fromRGB(255, 200, 100))
    end
    
    isTeleporting = false
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
            btn.Size = UDim2.new(1, -4, 0, 24)
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            btn.Text = plr.Name
            btn.TextSize = 12
            btn.Font = Enum.Font.Gotham
            btn.Parent = scrollFrame
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = btn
            
            btn.MouseButton1Click:Connect(function()
                task.spawn(function()
                    teleportToPlayer(plr)
                end)
            end)
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end

-- === EVENTS ===
stopBtn.MouseButton1Click:Connect(function()
    shouldStop = true
    updateStatus("Stopping...", Color3.fromRGB(255, 200, 100))
end)

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)
refreshPlayerList()

updateStatus("Ready - Select a player", Color3.fromRGB(100, 200, 100))
print("[GPO TP v2] Loaded - Max Y speed: " .. config.maxYSpeed .. " studs/tick")
