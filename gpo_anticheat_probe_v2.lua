-- GPO Anti-Cheat Probe v2 - Deep Analysis
-- Intercepts all possible detection methods and message systems

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

-- === CONFIG ===
local config = {
    logToConsole = true,
    interceptMessages = true,
    monitorPosition = true,
    autoStartMonitor = true,
}

-- === DATA COLLECTION ===
local collectedData = {
    positionSamples = {},
    velocitySamples = {},
    detectedEvents = {},
    serverMessages = {},
    strikes = {},
    yAxisData = {
        maxObservedLimit = 16,  -- From user's screenshot
        groundedLimit = 24,     -- From user's screenshot
        samples = {}
    }
}

-- === LOGGING ===
local function log(level, msg, data)
    local timestamp = string.format("%.2f", os.clock())
    local entry = {
        time = timestamp,
        level = level,
        msg = msg,
        data = data
    }
    
    if config.logToConsole then
        local dataStr = ""
        if data then
            for k, v in pairs(data) do
                dataStr = dataStr .. string.format(" %s=%s", tostring(k), tostring(v))
            end
        end
        
        local prefix = level == "STRIKE" and "⚠️" or
                       level == "DETECT" and "🔴" or
                       level == "WARN" and "🟡" or
                       level == "INFO" and "🔵" or "⚪"
        
        print(string.format("[%s][%s] %s %s%s", timestamp, level, prefix, msg, dataStr))
    end
    
    return entry
end

-- === GUI ===
local gui = Instance.new("ScreenGui")
gui.Name = "ACProbeV2"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 500)
main.Position = UDim2.new(1, -410, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
main.BorderSizePixel = 0
main.Parent = gui
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(80, 30, 30)
header.BorderSizePixel = 0
header.Parent = main
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "🔬 GPO Anti-Cheat Deep Probe v2"
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = header

-- Content area
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -10, 1, -50)
content.Position = UDim2.new(0, 5, 0, 45)
content.BackgroundTransparency = 1
content.Parent = main

-- === REAL-TIME MONITOR PANEL ===
local monitorPanel = Instance.new("Frame")
monitorPanel.Size = UDim2.new(1, 0, 0, 140)
monitorPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
monitorPanel.Parent = content
Instance.new("UICorner", monitorPanel).CornerRadius = UDim.new(0, 8)

local monitorTitle = Instance.new("TextLabel")
monitorTitle.Size = UDim2.new(1, 0, 0, 20)
monitorTitle.BackgroundTransparency = 1
monitorTitle.Text = "📊 Real-Time Monitor"
monitorTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
monitorTitle.TextSize = 12
monitorTitle.Font = Enum.Font.GothamBold
monitorTitle.Parent = monitorPanel

-- Monitor labels
local monitorLabels = {}
local labelDefs = {
    {id = "pos", name = "Position"},
    {id = "vel", name = "Velocity"},
    {id = "yDelta", name = "Y Delta (this frame)"},
    {id = "yDeltaSec", name = "Y Delta/sec"},
    {id = "ground", name = "Ground State"},
    {id = "strikes", name = "Strikes Detected"},
}

for i, def in ipairs(labelDefs) do
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -10, 0, 16)
    lbl.Position = UDim2.new(0, 5, 0, 20 + (i-1) * 18)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(140, 140, 150)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Code
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = def.name .. ": --"
    lbl.Parent = monitorPanel
    monitorLabels[def.id] = lbl
end

-- === TEST PANEL ===
local testPanel = Instance.new("Frame")
testPanel.Size = UDim2.new(1, 0, 0, 130)
testPanel.Position = UDim2.new(0, 0, 0, 145)
testPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
testPanel.Parent = content
Instance.new("UICorner", testPanel).CornerRadius = UDim.new(0, 8)

local testTitle = Instance.new("TextLabel")
testTitle.Size = UDim2.new(1, 0, 0, 20)
testTitle.BackgroundTransparency = 1
testTitle.Text = "🧪 Movement Tests"
testTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
testTitle.TextSize = 12
testTitle.Font = Enum.Font.GothamBold
testTitle.Parent = testPanel

-- Y-axis tests
local yTests = {
    {size = 5, safe = true},
    {size = 10, safe = true},
    {size = 14, safe = true},
    {size = 16, safe = false},  -- Exact limit
    {size = 20, safe = false},
    {size = 25, safe = false},
    {size = 35, safe = false},
    {size = 50, safe = false},
}

local btnW = 45
for i, test in ipairs(yTests) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, btnW, 0, 24)
    btn.Position = UDim2.new(0, 5 + ((i-1) % 8) * (btnW + 3), 0, 22 + math.floor((i-1) / 8) * 28)
    btn.BackgroundColor3 = test.safe and Color3.fromRGB(40, 70, 40) or Color3.fromRGB(70, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = "Y+" .. test.size
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = testPanel
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    btn.MouseButton1Click:Connect(function()
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        if not hrp or not hum then return end
        
        local beforeY = hrp.Position.Y
        local grounded = hum.FloorMaterial ~= Enum.Material.Air
        local beforeStrikes = #collectedData.strikes
        
        log("TEST", "Testing Y+" .. test.size, {grounded = grounded, beforeY = beforeY})
        
        -- Do the move
        hrp.CFrame = hrp.CFrame + Vector3.new(0, test.size, 0)
        
        -- Wait a moment to see if we get flagged
        task.wait(0.15)
        
        local afterY = hrp.Position.Y
        local afterStrikes = #collectedData.strikes
        local newStrikes = afterStrikes - beforeStrikes
        
        -- Record sample
        table.insert(collectedData.yAxisData.samples, {
            step = test.size,
            grounded = grounded,
            flagged = newStrikes > 0,
            actualDelta = afterY - beforeY,
            timestamp = tick()
        })
        
        log(newStrikes > 0 and "STRIKE" or "INFO", "Test complete", {
            requestedY = test.size,
            actualDelta = string.format("%.1f", afterY - beforeY),
            newStrikes = newStrikes
        })
    end)
end

-- Special test buttons row
local specialTests = {
    {name = "Rapid 10x", action = function()
        task.spawn(function()
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            log("TEST", "Rapid test: 10 x 14Y @ 0.05s")
            for i = 1, 10 do
                hrp.CFrame = hrp.CFrame + Vector3.new(0, 14, 0)
                task.wait(0.05)
            end
            log("TEST", "Rapid test complete")
        end)
    end},
    {name = "Slow 10x", action = function()
        task.spawn(function()
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            log("TEST", "Slow test: 10 x 14Y @ 0.2s")
            for i = 1, 10 do
                hrp.CFrame = hrp.CFrame + Vector3.new(0, 14, 0)
                task.wait(0.2)
            end
            log("TEST", "Slow test complete")
        end)
    end},
    {name = "H+100", action = function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        log("TEST", "Horizontal test: +100 forward")
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 100
    end},
    {name = "Reset Pos", action = function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        hrp.CFrame = CFrame.new(hrp.Position.X, 100, hrp.Position.Z)
        log("INFO", "Reset to Y=100")
    end},
}

for i, test in ipairs(specialTests) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 90, 0, 24)
    btn.Position = UDim2.new(0, 5 + (i-1) * 93, 0, 78)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.Text = test.name
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = testPanel
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    btn.MouseButton1Click:Connect(test.action)
end

-- Find limit button
local findLimitBtn = Instance.new("TextButton")
findLimitBtn.Size = UDim2.new(1, -10, 0, 24)
findLimitBtn.Position = UDim2.new(0, 5, 0, 105)
findLimitBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 100)
findLimitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
findLimitBtn.Text = "🔍 Auto-Find Y Limit (tests 1-30 studs)"
findLimitBtn.TextSize = 11
findLimitBtn.Font = Enum.Font.GothamBold
findLimitBtn.Parent = testPanel
Instance.new("UICorner", findLimitBtn).CornerRadius = UDim.new(0, 4)

findLimitBtn.MouseButton1Click:Connect(function()
    task.spawn(function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        log("TEST", "Starting Y-limit finder...")
        
        local foundLimit = nil
        
        for testY = 1, 30, 1 do
            local beforeStrikes = #collectedData.strikes
            
            -- Reset position
            hrp.CFrame = CFrame.new(hrp.Position.X, 100, hrp.Position.Z)
            task.wait(0.3)
            
            -- Test move
            hrp.CFrame = hrp.CFrame + Vector3.new(0, testY, 0)
            task.wait(0.2)
            
            local afterStrikes = #collectedData.strikes
            if afterStrikes > beforeStrikes then
                foundLimit = testY
                log("DETECT", "Found Y-limit!", {limit = testY})
                break
            else
                log("INFO", "Y=" .. testY .. " - OK")
            end
        end
        
        if foundLimit then
            collectedData.yAxisData.maxObservedLimit = foundLimit
            log("DETECT", "Y-Axis limit confirmed: " .. foundLimit .. " studs")
        else
            log("INFO", "No limit found in range 1-30")
        end
    end)
end)

-- === LOG PANEL ===
local logPanel = Instance.new("Frame")
logPanel.Size = UDim2.new(1, 0, 0, 165)
logPanel.Position = UDim2.new(0, 0, 0, 280)
logPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
logPanel.Parent = content
Instance.new("UICorner", logPanel).CornerRadius = UDim.new(0, 8)

local logTitle = Instance.new("TextLabel")
logTitle.Size = UDim2.new(1, 0, 0, 20)
logTitle.BackgroundTransparency = 1
logTitle.Text = "📋 Detection Log"
logTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
logTitle.TextSize = 12
logTitle.Font = Enum.Font.GothamBold
logTitle.Parent = logPanel

local logScroll = Instance.new("ScrollingFrame")
logScroll.Size = UDim2.new(1, -10, 1, -25)
logScroll.Position = UDim2.new(0, 5, 0, 22)
logScroll.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
logScroll.BorderSizePixel = 0
logScroll.ScrollBarThickness = 3
logScroll.Parent = logPanel
Instance.new("UICorner", logScroll).CornerRadius = UDim.new(0, 4)

local logLayout = Instance.new("UIListLayout")
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = logScroll

local logEntries = {}
local logOrder = 0

local function addLogEntry(entry)
    logOrder = logOrder + 1
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -5, 0, 14)
    lbl.BackgroundTransparency = 1
    lbl.TextSize = 9
    lbl.Font = Enum.Font.Code
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    lbl.LayoutOrder = -logOrder  -- Newest at top
    
    local color = entry.level == "STRIKE" and Color3.fromRGB(255, 80, 80) or
                  entry.level == "DETECT" and Color3.fromRGB(255, 150, 80) or
                  entry.level == "WARN" and Color3.fromRGB(255, 220, 100) or
                  entry.level == "TEST" and Color3.fromRGB(100, 180, 255) or
                  Color3.fromRGB(130, 130, 140)
    
    lbl.TextColor3 = color
    lbl.Text = string.format("[%s] %s", entry.time, entry.msg)
    lbl.Parent = logScroll
    
    table.insert(logEntries, 1, lbl)
    if #logEntries > 50 then
        local old = table.remove(logEntries)
        old:Destroy()
    end
    
    logScroll.CanvasSize = UDim2.new(0, 0, 0, logLayout.AbsoluteContentSize.Y)
end

-- Override log to also update GUI
local originalLog = log
log = function(level, msg, data)
    local entry = originalLog(level, msg, data)
    addLogEntry(entry)
    return entry
end

-- === MESSAGE INTERCEPTION ===

-- Hook _G.displayMessage
local function hookDisplayMessage()
    if _G.displayMessage then
        local original = _G.displayMessage
        _G.displayMessage = function(msg, ...)
            local msgStr = tostring(msg)
            log("MSG", msgStr)
            
            -- Check for strike/anti-cheat messages
            local lower = msgStr:lower()
            if lower:find("strike") or lower:find("axis") or lower:find("fast") or
               lower:find("exploit") or lower:find("speed") or lower:find("teleport") then
                table.insert(collectedData.strikes, {
                    message = msgStr,
                    time = tick()
                })
                log("STRIKE", "Anti-cheat detected: " .. msgStr)
            end
            
            return original(msg, ...)
        end
        log("HOOK", "Hooked _G.displayMessage")
    end
end

-- Hook StarterGui:SetCore for system messages
local function hookSetCore()
    local mt = getmetatable(StarterGui)
    if mt and mt.__namecall then
        local original = mt.__namecall
        local newMt = setmetatable({}, {__index = mt})
        newMt.__namecall = function(self, ...)
            local args = {...}
            local method = getnamecallmethod and getnamecallmethod() or ""
            
            if method == "SetCore" and args[1] == "ChatMakeSystemMessage" then
                local msgData = args[2]
                if msgData and msgData.Text then
                    log("CHAT", "System message: " .. tostring(msgData.Text))
                end
            end
            
            return original(self, ...)
        end
        -- Note: This may not work in all executors
    end
end

-- Monitor all RemoteEvents
local function hookRemoteEvents()
    local events = ReplicatedStorage:FindFirstChild("Events")
    if not events then return end
    
    for _, child in pairs(events:GetChildren()) do
        if child:IsA("RemoteEvent") then
            pcall(function()
                child.OnClientEvent:Connect(function(...)
                    local args = {...}
                    for _, arg in ipairs(args) do
                        local argStr = tostring(arg):lower()
                        if argStr:find("strike") or argStr:find("axis") or argStr:find("fast") or
                           argStr:find("speed") or argStr:find("cheat") or argStr:find("exploit") then
                            log("REMOTE", child.Name .. " -> " .. tostring(arg))
                            table.insert(collectedData.strikes, {
                                source = "RemoteEvent:" .. child.Name,
                                data = arg,
                                time = tick()
                            })
                        end
                    end
                end)
            end)
        end
    end
    log("HOOK", "Monitoring RemoteEvents")
end

-- Monitor BillboardGuis being created (strike messages might use these)
local function monitorBillboardGuis()
    workspace.DescendantAdded:Connect(function(desc)
        if desc:IsA("BillboardGui") then
            task.wait()  -- Let it populate
            local textLabel = desc:FindFirstChildOfClass("TextLabel")
            if textLabel then
                local text = textLabel.Text:lower()
                if text:find("strike") or text:find("axis") or text:find("fast") then
                    log("BILLBOARD", "Strike billboard: " .. textLabel.Text)
                    table.insert(collectedData.strikes, {
                        source = "BillboardGui",
                        text = textLabel.Text,
                        time = tick()
                    })
                end
            end
        end
    end)
    log("HOOK", "Monitoring BillboardGuis")
end

-- Monitor PlayerGui for new messages
local function monitorPlayerGui()
    local playerGui = player:WaitForChild("PlayerGui")
    playerGui.DescendantAdded:Connect(function(desc)
        if desc:IsA("TextLabel") and desc.Visible then
            task.wait()
            local text = desc.Text:lower()
            if text:find("strike") or text:find("axis") or text:find("fast") or text:find("ground") then
                log("GUI", "UI message: " .. desc.Text)
                table.insert(collectedData.strikes, {
                    source = "PlayerGui:" .. desc:GetFullName(),
                    text = desc.Text,
                    time = tick()
                })
            end
        end
    end)
    log("HOOK", "Monitoring PlayerGui")
end

-- === POSITION MONITORING ===
local lastPos = nil
local lastTime = 0

RunService.Heartbeat:Connect(function()
    local char = player.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    
    local pos = hrp.Position
    local vel = hrp.AssemblyLinearVelocity
    local now = tick()
    local grounded = hum.FloorMaterial ~= Enum.Material.Air
    
    -- Calculate deltas
    local yDelta = 0
    local yDeltaSec = 0
    if lastPos and (now - lastTime) > 0 then
        yDelta = math.abs(pos.Y - lastPos.Y)
        yDeltaSec = yDelta / (now - lastTime)
    end
    
    -- Update monitor
    monitorLabels.pos.Text = string.format("Position: %.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z)
    monitorLabels.vel.Text = string.format("Velocity: %.1f, %.1f, %.1f (mag: %.1f)", vel.X, vel.Y, vel.Z, vel.Magnitude)
    monitorLabels.yDelta.Text = string.format("Y Delta (frame): %.2f studs", yDelta)
    monitorLabels.yDeltaSec.Text = string.format("Y Delta/sec: %.1f studs/s", yDeltaSec)
    monitorLabels.ground.Text = "Ground: " .. (grounded and "✓ GROUNDED" or "✗ AIRBORNE") .. 
                                 " (material: " .. tostring(hum.FloorMaterial.Name) .. ")"
    monitorLabels.strikes.Text = "Strikes: " .. #collectedData.strikes
    
    -- Color coding
    monitorLabels.yDelta.TextColor3 = yDelta > 16 and Color3.fromRGB(255, 100, 100) or
                                       yDelta > 10 and Color3.fromRGB(255, 200, 100) or
                                       Color3.fromRGB(140, 140, 150)
    
    monitorLabels.ground.TextColor3 = grounded and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(200, 100, 100)
    
    lastPos = pos
    lastTime = now
end)

-- === INITIALIZE ===
pcall(hookDisplayMessage)
pcall(hookRemoteEvents)
pcall(monitorBillboardGuis)
pcall(monitorPlayerGui)

log("INIT", "GPO Anti-Cheat Probe v2 initialized")
log("INFO", "Use test buttons to probe Y-axis limits")
log("INFO", "Watch for STRIKE entries when testing")

print("=== GPO ANTI-CHEAT PROBE V2 ===")
print("• Monitors all message systems for strike warnings")
print("• Tests Y-axis movement at various step sizes")
print("• Auto-find limit feature to discover exact threshold")
print("• Real-time position and velocity tracking")
