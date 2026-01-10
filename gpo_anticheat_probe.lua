-- GPO Anti-Cheat Probe & Diagnostics
-- This script will probe the anti-cheat system to discover its parameters
-- Run controlled tests and log all responses

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- === LOGGING SYSTEM ===
local logs = {}
local maxLogs = 100

local function log(category, message, data)
    local entry = {
        time = os.clock(),
        tick = tick(),
        category = category,
        message = message,
        data = data or {}
    }
    table.insert(logs, 1, entry)
    if #logs > maxLogs then
        table.remove(logs)
    end
    
    -- Print to console
    local dataStr = ""
    if data then
        for k, v in pairs(data) do
            dataStr = dataStr .. string.format(" [%s=%s]", tostring(k), tostring(v))
        end
    end
    print(string.format("[PROBE][%s] %s%s", category, message, dataStr))
end

-- === STATE TRACKING ===
local state = {
    lastPosition = nil,
    lastVelocity = nil,
    lastTime = 0,
    frameCount = 0,
    groundedFrames = 0,
    airborneFrames = 0,
    strikes = 0,
    detectedMessages = {},
}

-- === GUI ===
local gui = Instance.new("ScreenGui")
gui.Name = "ACProbe"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 350, 0, 450)
main.Position = UDim2.new(1, -360, 0.5, -225)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
main.BorderSizePixel = 0
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "🔍 GPO Anti-Cheat Probe"
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = main

-- Real-time stats
local statsFrame = Instance.new("Frame")
statsFrame.Size = UDim2.new(1, -10, 0, 120)
statsFrame.Position = UDim2.new(0, 5, 0, 35)
statsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
statsFrame.Parent = main
Instance.new("UICorner", statsFrame).CornerRadius = UDim.new(0, 6)

local statsLabels = {}
local statNames = {"Position", "Velocity", "Y Delta/s", "Ground", "Strikes", "Last Msg"}
for i, name in ipairs(statNames) do
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -10, 0, 18)
    lbl.Position = UDim2.new(0, 5, 0, (i-1) * 19 + 3)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(180, 180, 180)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Code
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = name .. ": --"
    lbl.Parent = statsFrame
    statsLabels[name] = lbl
end

-- Test buttons frame
local testFrame = Instance.new("Frame")
testFrame.Size = UDim2.new(1, -10, 0, 100)
testFrame.Position = UDim2.new(0, 5, 0, 160)
testFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
testFrame.Parent = main
Instance.new("UICorner", testFrame).CornerRadius = UDim.new(0, 6)

local testLabel = Instance.new("TextLabel")
testLabel.Size = UDim2.new(1, 0, 0, 18)
testLabel.BackgroundTransparency = 1
testLabel.Text = "Movement Tests (Y-Axis)"
testLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
testLabel.TextSize = 11
testLabel.Font = Enum.Font.GothamBold
testLabel.Parent = testFrame

-- Test buttons
local testSizes = {5, 10, 15, 16, 20, 25, 30, 50}
local btnWidth = (350 - 20) / 4 - 4

for i, size in ipairs(testSizes) do
    local row = math.floor((i-1) / 4)
    local col = (i-1) % 4
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, btnWidth, 0, 22)
    btn.Position = UDim2.new(0, 5 + col * (btnWidth + 4), 0, 22 + row * 26)
    btn.BackgroundColor3 = size <= 15 and Color3.fromRGB(40, 80, 40) or 
                           size <= 20 and Color3.fromRGB(80, 80, 40) or
                           Color3.fromRGB(80, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = "+" .. size .. " Y"
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = testFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    btn.MouseButton1Click:Connect(function()
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local beforePos = hrp.Position
            local grounded = char.Humanoid.FloorMaterial ~= Enum.Material.Air
            
            log("TEST", "Y-axis test: +" .. size .. " studs", {
                grounded = grounded,
                beforeY = beforePos.Y
            })
            
            hrp.CFrame = hrp.CFrame + Vector3.new(0, size, 0)
            
            task.wait(0.1)
            local afterPos = hrp.Position
            log("TEST", "After move", {
                actualDelta = afterPos.Y - beforePos.Y,
                newY = afterPos.Y
            })
        end
    end)
end

-- Horizontal test buttons
local hTestFrame = Instance.new("Frame")
hTestFrame.Size = UDim2.new(1, -10, 0, 50)
hTestFrame.Position = UDim2.new(0, 5, 0, 265)
hTestFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
hTestFrame.Parent = main
Instance.new("UICorner", hTestFrame).CornerRadius = UDim.new(0, 6)

local hLabel = Instance.new("TextLabel")
hLabel.Size = UDim2.new(1, 0, 0, 18)
hLabel.BackgroundTransparency = 1
hLabel.Text = "Horizontal Tests"
hLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
hLabel.TextSize = 11
hLabel.Font = Enum.Font.GothamBold
hLabel.Parent = hTestFrame

local hSizes = {20, 50, 100, 200}
for i, size in ipairs(hSizes) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, btnWidth, 0, 22)
    btn.Position = UDim2.new(0, 5 + (i-1) * (btnWidth + 4), 0, 22)
    btn.BackgroundColor3 = Color3.fromRGB(40, 60, 80)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = "+" .. size .. " XZ"
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = hTestFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    btn.MouseButton1Click:Connect(function()
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local beforePos = hrp.Position
            log("TEST", "Horizontal test: +" .. size .. " studs (forward)", {beforePos = beforePos})
            
            hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * size
            
            task.wait(0.1)
            local afterPos = hrp.Position
            log("TEST", "After horizontal move", {
                actualDelta = (afterPos - beforePos).Magnitude,
                newPos = afterPos
            })
        end
    end)
end

-- Log display
local logFrame = Instance.new("ScrollingFrame")
logFrame.Size = UDim2.new(1, -10, 0, 120)
logFrame.Position = UDim2.new(0, 5, 0, 320)
logFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
logFrame.BorderSizePixel = 0
logFrame.ScrollBarThickness = 4
logFrame.Parent = main
Instance.new("UICorner", logFrame).CornerRadius = UDim.new(0, 6)

local logLayout = Instance.new("UIListLayout")
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = logFrame

local logLabels = {}
for i = 1, 8 do
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -5, 0, 14)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(120, 120, 120)
    lbl.TextSize = 9
    lbl.Font = Enum.Font.Code
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    lbl.Text = ""
    lbl.LayoutOrder = i
    lbl.Parent = logFrame
    table.insert(logLabels, lbl)
end

-- === HOOK INTO GAME EVENTS ===

-- Hook displayMessage if available
local originalDisplayMessage = _G.displayMessage
if originalDisplayMessage then
    _G.displayMessage = function(msg, ...)
        log("MSG", "displayMessage: " .. tostring(msg))
        
        -- Check for anti-cheat related messages
        local msgLower = string.lower(tostring(msg))
        if string.find(msgLower, "strike") or string.find(msgLower, "fast") or 
           string.find(msgLower, "exploit") or string.find(msgLower, "cheat") or
           string.find(msgLower, "teleport") or string.find(msgLower, "speed") then
            state.strikes = state.strikes + 1
            state.detectedMessages[#state.detectedMessages + 1] = msg
            log("DETECT", "⚠️ ANTI-CHEAT MESSAGE: " .. tostring(msg))
        end
        
        return originalDisplayMessage(msg, ...)
    end
    log("HOOK", "Hooked _G.displayMessage")
end

-- Monitor RemoteEvents in ReplicatedStorage.Events
local function hookRemoteEvents()
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events then
        for _, child in pairs(events:GetChildren()) do
            if child:IsA("RemoteEvent") then
                pcall(function()
                    child.OnClientEvent:Connect(function(...)
                        local args = {...}
                        local argStr = ""
                        for i, v in ipairs(args) do
                            argStr = argStr .. tostring(v) .. ", "
                        end
                        
                        -- Check if this looks like an anti-cheat message
                        for _, arg in ipairs(args) do
                            local argLower = string.lower(tostring(arg))
                            if string.find(argLower, "strike") or string.find(argLower, "fast") or
                               string.find(argLower, "axis") or string.find(argLower, "speed") or
                               string.find(argLower, "ground") then
                                log("DETECT", "RemoteEvent " .. child.Name .. ": " .. argStr)
                                state.strikes = state.strikes + 1
                            end
                        end
                    end)
                end)
            end
        end
        log("HOOK", "Hooked RemoteEvents in Events folder")
    end
end

pcall(hookRemoteEvents)

-- Monitor character for changes that might indicate detection
local function monitorCharacter()
    local char = player.Character
    if not char then return end
    
    char.ChildAdded:Connect(function(child)
        if string.lower(child.Name):find("stun") or string.lower(child.Name):find("freeze") then
            log("DETECT", "Child added: " .. child.Name .. " (possible punishment)")
        end
    end)
    
    char.DescendantAdded:Connect(function(desc)
        if desc:IsA("BodyMover") and desc.Parent == char:FindFirstChild("HumanoidRootPart") then
            log("PHYSICS", "BodyMover added: " .. desc.ClassName)
        end
    end)
end

player.CharacterAdded:Connect(monitorCharacter)
if player.Character then
    monitorCharacter()
end

-- === REAL-TIME MONITORING ===
local lastPos = nil
local lastTime = tick()
local yDeltaHistory = {}

RunService.Heartbeat:Connect(function()
    local char = player.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    
    local currentPos = hrp.Position
    local currentVel = hrp.AssemblyLinearVelocity
    local currentTime = tick()
    local grounded = hum.FloorMaterial ~= Enum.Material.Air
    
    state.frameCount = state.frameCount + 1
    
    if grounded then
        state.groundedFrames = state.groundedFrames + 1
    else
        state.airborneFrames = state.airborneFrames + 1
    end
    
    -- Calculate Y delta per second
    if lastPos then
        local dt = currentTime - lastTime
        if dt > 0 then
            local yDelta = math.abs(currentPos.Y - lastPos.Y)
            local yDeltaPerSec = yDelta / dt
            
            -- Track history for averaging
            table.insert(yDeltaHistory, yDeltaPerSec)
            if #yDeltaHistory > 10 then
                table.remove(yDeltaHistory, 1)
            end
            
            -- Calculate average
            local avgYDelta = 0
            for _, v in ipairs(yDeltaHistory) do
                avgYDelta = avgYDelta + v
            end
            avgYDelta = avgYDelta / #yDeltaHistory
            
            -- Update UI
            statsLabels["Position"].Text = string.format("Position: %.1f, %.1f, %.1f", currentPos.X, currentPos.Y, currentPos.Z)
            statsLabels["Velocity"].Text = string.format("Velocity: %.1f, %.1f, %.1f", currentVel.X, currentVel.Y, currentVel.Z)
            statsLabels["Y Delta/s"].Text = string.format("Y Delta/s: %.1f (avg: %.1f)", yDeltaPerSec, avgYDelta)
            statsLabels["Ground"].Text = "Ground: " .. (grounded and "✓ GROUNDED" or "✗ AIRBORNE") .. 
                                          string.format(" (%d/%d)", state.groundedFrames, state.airborneFrames)
            statsLabels["Strikes"].Text = "Strikes: " .. state.strikes
            
            -- Detect suspicious Y movement
            if yDelta > 16 and not grounded then
                log("WARN", "Large Y delta while airborne: " .. string.format("%.1f", yDelta))
            end
        end
    end
    
    lastPos = currentPos
    lastTime = currentTime
end)

-- Update log display
task.spawn(function()
    while true do
        for i, lbl in ipairs(logLabels) do
            local entry = logs[i]
            if entry then
                local timeStr = string.format("%.2f", entry.time)
                local color = entry.category == "DETECT" and "255, 100, 100" or
                              entry.category == "WARN" and "255, 200, 100" or
                              entry.category == "TEST" and "100, 200, 255" or
                              "150, 150, 150"
                lbl.Text = string.format("[%s][%s] %s", timeStr, entry.category, entry.message)
                lbl.TextColor3 = entry.category == "DETECT" and Color3.fromRGB(255, 100, 100) or
                                 entry.category == "WARN" and Color3.fromRGB(255, 200, 100) or
                                 entry.category == "TEST" and Color3.fromRGB(100, 200, 255) or
                                 Color3.fromRGB(150, 150, 150)
            else
                lbl.Text = ""
            end
        end
        
        logFrame.CanvasSize = UDim2.new(0, 0, 0, logLayout.AbsoluteContentSize.Y)
        
        -- Update last message
        if #state.detectedMessages > 0 then
            local lastMsg = state.detectedMessages[#state.detectedMessages]
            statsLabels["Last Msg"].Text = "Last Msg: " .. string.sub(tostring(lastMsg), 1, 40)
            statsLabels["Last Msg"].TextColor3 = Color3.fromRGB(255, 100, 100)
        end
        
        task.wait(0.1)
    end
end)

-- === ADVANCED PROBING ===

-- Create sequential Y movement test
local function runSequentialYTest(stepSize, numSteps, delay)
    log("TEST", string.format("Sequential Y test: %d steps of %d studs, %.2fs delay", numSteps, stepSize, delay))
    
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local startPos = hrp.Position
    local startStrikes = state.strikes
    
    for i = 1, numSteps do
        if not hrp or not hrp.Parent then break end
        
        hrp.CFrame = hrp.CFrame + Vector3.new(0, stepSize, 0)
        task.wait(delay)
    end
    
    local endPos = hrp.Position
    local endStrikes = state.strikes
    
    log("TEST", string.format("Test complete: moved %.1f Y, %d new strikes", 
        endPos.Y - startPos.Y, endStrikes - startStrikes))
end

-- Add automated test button
local autoTestBtn = Instance.new("TextButton")
autoTestBtn.Size = UDim2.new(1, -10, 0, 25)
autoTestBtn.Position = UDim2.new(0, 5, 1, -30)
autoTestBtn.BackgroundColor3 = Color3.fromRGB(80, 40, 80)
autoTestBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoTestBtn.Text = "🔬 Run Full Diagnostic (10 steps of 14Y @ 0.1s)"
autoTestBtn.TextSize = 11
autoTestBtn.Font = Enum.Font.GothamBold
autoTestBtn.Parent = main
Instance.new("UICorner", autoTestBtn).CornerRadius = UDim.new(0, 6)

autoTestBtn.MouseButton1Click:Connect(function()
    task.spawn(function()
        runSequentialYTest(14, 10, 0.1)
    end)
end)

log("INIT", "Anti-Cheat Probe initialized")
log("INIT", "Use buttons to test different movement amounts")
log("INIT", "Watch for 'DETECT' entries in the log")

print("=== GPO ANTI-CHEAT PROBE ===")
print("This tool will help discover anti-cheat parameters")
print("- Test Y-axis movements with different step sizes")
print("- Monitor for server responses and strikes")
print("- Track position, velocity, and ground state")
