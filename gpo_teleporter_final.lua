-- GPO Teleporter FINAL - Anti-Cheat Bypass
-- Based on actual server detection: "Strike: +Y Axis too fast: [speed] | 16 | Ground: [status]"
-- 
-- KEY FINDINGS FROM ANTI-CHEAT:
-- 1. Y-axis movement limited to 16 studs per check when NOT grounded
-- 2. Y-axis movement limited to ~24 studs when grounded
-- 3. Server tracks ground state via FloorMaterial or raycast
-- 4. WalkSpeed is also monitored (separate from position)
--
-- BYPASS STRATEGY:
-- - Keep Y changes under 15 studs per step
-- - Move horizontally first, then vertically (2-phase approach)
-- - Add sufficient delays between movements
-- - Use small, consistent steps

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- === SAFE LIMITS (based on server anti-cheat) ===
local SAFE_Y_STEP = 14          -- Under 16 limit when airborne
local SAFE_Y_STEP_GROUNDED = 22 -- Under 24 limit when grounded
local SAFE_H_STEP = 40          -- Horizontal seems less restricted
local STEP_DELAY = 0.06         -- ~16 steps per second
local GROUND_PRIORITY = true    -- Move horizontally first, then Y

local isTeleporting = false
local shouldStop = false

-- === GUI ===
local gui = Instance.new("ScreenGui")
gui.Name = "GPOFinalTP"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 220, 0, 340)
main.Position = UDim2.new(0, 10, 0.5, -170)
main.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
main.BorderSizePixel = 0
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- Title
local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1, 0, 0, 30)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "⚡ GPO TP (Y-Axis Safe)"
titleLbl.TextColor3 = Color3.fromRGB(255, 200, 80)
titleLbl.TextSize = 14
titleLbl.Font = Enum.Font.GothamBold
titleLbl.Parent = main

-- Info panel
local infoPanel = Instance.new("Frame")
infoPanel.Size = UDim2.new(1, -10, 0, 55)
infoPanel.Position = UDim2.new(0, 5, 0, 32)
infoPanel.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
infoPanel.Parent = main
Instance.new("UICorner", infoPanel).CornerRadius = UDim.new(0, 6)

local groundLbl = Instance.new("TextLabel")
groundLbl.Size = UDim2.new(1, 0, 0, 16)
groundLbl.Position = UDim2.new(0, 0, 0, 3)
groundLbl.BackgroundTransparency = 1
groundLbl.Text = "Ground: ?"
groundLbl.TextColor3 = Color3.fromRGB(150, 150, 150)
groundLbl.TextSize = 11
groundLbl.Font = Enum.Font.Gotham
groundLbl.Parent = infoPanel

local yLimitLbl = Instance.new("TextLabel")
yLimitLbl.Size = UDim2.new(1, 0, 0, 16)
yLimitLbl.Position = UDim2.new(0, 0, 0, 18)
yLimitLbl.BackgroundTransparency = 1
yLimitLbl.Text = "Y Limit: 14 studs/step"
yLimitLbl.TextColor3 = Color3.fromRGB(120, 120, 130)
yLimitLbl.TextSize = 10
yLimitLbl.Font = Enum.Font.Gotham
yLimitLbl.Parent = infoPanel

local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(1, 0, 0, 16)
statusLbl.Position = UDim2.new(0, 0, 0, 36)
statusLbl.BackgroundTransparency = 1
statusLbl.Text = "Status: Ready"
statusLbl.TextColor3 = Color3.fromRGB(100, 200, 100)
statusLbl.TextSize = 11
statusLbl.Font = Enum.Font.Gotham
statusLbl.Parent = infoPanel

-- Phase indicator
local phaseLbl = Instance.new("TextLabel")
phaseLbl.Size = UDim2.new(1, -10, 0, 20)
phaseLbl.Position = UDim2.new(0, 5, 0, 90)
phaseLbl.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
phaseLbl.TextColor3 = Color3.fromRGB(150, 150, 150)
phaseLbl.TextSize = 10
phaseLbl.Font = Enum.Font.Gotham
phaseLbl.Text = "Phase: Idle"
phaseLbl.Parent = main
Instance.new("UICorner", phaseLbl).CornerRadius = UDim.new(0, 4)

-- Player list
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 0, 160)
scroll.Position = UDim2.new(0, 5, 0, 114)
scroll.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.Parent = main
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.Name
layout.Padding = UDim.new(0, 2)
layout.Parent = scroll

-- Stop button
local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, -10, 0, 30)
stopBtn.Position = UDim2.new(0, 5, 1, -38)
stopBtn.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stopBtn.Text = "⏹ STOP"
stopBtn.TextSize = 14
stopBtn.Font = Enum.Font.GothamBold
stopBtn.Parent = main
Instance.new("UICorner", stopBtn).CornerRadius = UDim.new(0, 6)

-- === CORE LOGIC ===
local function isGrounded()
    local char = player.Character
    local hum = char and char:FindFirstChild("Humanoid")
    return hum and hum.FloorMaterial ~= Enum.Material.Air
end

local function updateDisplay()
    local grounded = isGrounded()
    if grounded then
        groundLbl.Text = "Ground: ✓ GROUNDED"
        groundLbl.TextColor3 = Color3.fromRGB(100, 220, 100)
        yLimitLbl.Text = "Y Limit: " .. SAFE_Y_STEP_GROUNDED .. " studs/step"
    else
        groundLbl.Text = "Ground: ✗ AIRBORNE"
        groundLbl.TextColor3 = Color3.fromRGB(220, 100, 100)
        yLimitLbl.Text = "Y Limit: " .. SAFE_Y_STEP .. " studs/step"
    end
    return grounded
end

local function setStatus(text, color)
    statusLbl.Text = "Status: " .. text
    statusLbl.TextColor3 = color or Color3.fromRGB(150, 150, 150)
end

local function setPhase(text)
    phaseLbl.Text = "Phase: " .. text
end

-- Safe single step movement
local function safeStep(hrp, targetPos)
    local currentPos = hrp.Position
    local grounded = isGrounded()
    
    local maxY = grounded and SAFE_Y_STEP_GROUNDED or SAFE_Y_STEP
    local maxH = SAFE_H_STEP
    
    local dx = targetPos.X - currentPos.X
    local dy = targetPos.Y - currentPos.Y
    local dz = targetPos.Z - currentPos.Z
    
    -- Clamp to safe values
    local safeX = math.clamp(dx, -maxH, maxH)
    local safeY = math.clamp(dy, -maxY, maxY)
    local safeZ = math.clamp(dz, -maxH, maxH)
    
    local newPos = currentPos + Vector3.new(safeX, safeY, safeZ)
    
    -- Preserve rotation
    local rotation = hrp.CFrame - hrp.CFrame.Position
    hrp.CFrame = CFrame.new(newPos) * rotation
    
    -- Kill velocity
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
    
    return (targetPos - newPos).Magnitude
end

-- Two-phase teleport: horizontal first, then vertical (safer)
local function twoPhaseMove(hrp, targetPos)
    local currentPos = hrp.Position
    
    -- Phase 1: Move horizontally to X,Z position
    local horizontalTarget = Vector3.new(targetPos.X, currentPos.Y, targetPos.Z)
    local hDist = (Vector2.new(targetPos.X, targetPos.Z) - Vector2.new(currentPos.X, currentPos.Z)).Magnitude
    
    if hDist > 3 then
        setPhase("Horizontal (" .. math.floor(hDist) .. " studs)")
        return safeStep(hrp, horizontalTarget), false
    end
    
    -- Phase 2: Move vertically to final Y
    local vDist = math.abs(targetPos.Y - currentPos.Y)
    if vDist > 3 then
        setPhase("Vertical (" .. math.floor(vDist) .. " studs)")
        return safeStep(hrp, targetPos), false
    end
    
    setPhase("Arrived")
    return 0, true
end

-- Main teleport function
local function teleportTo(targetPlayer)
    if isTeleporting then
        setStatus("Already teleporting!", Color3.fromRGB(255, 150, 50))
        return
    end
    
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        setStatus("No character!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    local tChar = targetPlayer.Character
    local tHrp = tChar and tChar:FindFirstChild("HumanoidRootPart")
    if not tHrp then
        setStatus("Target unavailable!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    isTeleporting = true
    shouldStop = false
    
    local startTime = tick()
    local steps = 0
    
    setStatus("Moving to " .. targetPlayer.Name, Color3.fromRGB(100, 180, 255))
    
    while not shouldStop do
        -- Re-validate all references
        char = player.Character
        hrp = char and char:FindFirstChild("HumanoidRootPart")
        tChar = targetPlayer.Character
        tHrp = tChar and tChar:FindFirstChild("HumanoidRootPart")
        
        if not hrp or not tHrp then
            setStatus("Lost reference!", Color3.fromRGB(255, 80, 80))
            break
        end
        
        -- Update display
        updateDisplay()
        
        -- Get target position (add small offset to not be inside them)
        local targetPos = tHrp.Position + Vector3.new(3, 0, 0)
        
        -- Move using two-phase approach
        local remaining, arrived
        if GROUND_PRIORITY then
            remaining, arrived = twoPhaseMove(hrp, targetPos)
        else
            remaining = safeStep(hrp, targetPos)
            arrived = remaining < 5
        end
        
        steps = steps + 1
        
        -- Update status every few steps
        if steps % 5 == 0 then
            local dist = (targetPos - hrp.Position).Magnitude
            setStatus(string.format("%.0f studs left", dist), Color3.fromRGB(100, 180, 255))
        end
        
        if arrived then
            local elapsed = tick() - startTime
            setStatus(string.format("Done! %.1fs, %d steps", elapsed, steps), Color3.fromRGB(100, 255, 100))
            break
        end
        
        -- Wait between steps
        task.wait(STEP_DELAY)
        
        -- Timeout
        if tick() - startTime > 300 then
            setStatus("Timeout!", Color3.fromRGB(255, 80, 80))
            break
        end
    end
    
    if shouldStop then
        setStatus("Cancelled", Color3.fromRGB(255, 180, 80))
        setPhase("Stopped")
    end
    
    isTeleporting = false
end

-- === PLAYER LIST ===
local function refreshList()
    for _, c in pairs(scroll:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -4, 0, 24)
            btn.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
            btn.Text = plr.Name
            btn.TextSize = 11
            btn.Font = Enum.Font.Gotham
            btn.Parent = scroll
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
            
            btn.MouseButton1Click:Connect(function()
                task.spawn(function() teleportTo(plr) end)
            end)
            
            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(55, 60, 75)
            end)
            btn.MouseLeave:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
            end)
        end
    end
    
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 5)
end

-- === EVENTS ===
stopBtn.MouseButton1Click:Connect(function()
    shouldStop = true
end)

Players.PlayerAdded:Connect(refreshList)
Players.PlayerRemoving:Connect(refreshList)

-- Continuous ground status update
task.spawn(function()
    while task.wait(0.15) do
        if not isTeleporting then
            updateDisplay()
        end
    end
end)

-- Init
refreshList()
updateDisplay()
setStatus("Ready", Color3.fromRGB(100, 200, 100))
setPhase("Idle")

print("=== GPO FINAL TELEPORTER ===")
print("Y-Axis Safe Mode: Max " .. SAFE_Y_STEP .. " studs when airborne")
print("Two-phase movement: Horizontal first, then vertical")
print("Step delay: " .. STEP_DELAY .. "s between moves")
