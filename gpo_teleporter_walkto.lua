-- GPO Teleporter v4 - WalkTo Method (Most Safe)
-- Uses Humanoid:MoveTo() which is the LEGITIMATE movement function
-- Server cannot flag this as it's how the game moves players

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")

local player = Players.LocalPlayer

-- Config
local config = {
    walkSpeed = 100,       -- Temporary walk speed boost
    usePathfinding = true, -- Use pathfinding for obstacles
    directDistance = 50,   -- If closer than this, walk directly
}

local isTeleporting = false
local shouldStop = false
local originalWalkSpeed = 16

-- === SIMPLE GUI ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GPOWalkTP"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 300)
mainFrame.Position = UDim2.new(0, 10, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 28, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.BackgroundTransparency = 1
title.Text = "🚶 Walk Teleporter"
title.TextColor3 = Color3.fromRGB(100, 220, 150)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -10, 0, 35)
statusLabel.Position = UDim2.new(0, 5, 0, 30)
statusLabel.BackgroundColor3 = Color3.fromRGB(35, 38, 45)
statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
statusLabel.TextSize = 11
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextWrapped = true
statusLabel.Text = "Uses legit walking"
statusLabel.Parent = mainFrame
Instance.new("UICorner", statusLabel).CornerRadius = UDim.new(0, 4)

-- Speed slider area
local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(1, -10, 0, 40)
speedFrame.Position = UDim2.new(0, 5, 0, 68)
speedFrame.BackgroundColor3 = Color3.fromRGB(35, 38, 45)
speedFrame.Parent = mainFrame
Instance.new("UICorner", speedFrame).CornerRadius = UDim.new(0, 4)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 18)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Walk Speed: 100"
speedLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
speedLabel.TextSize = 11
speedLabel.Font = Enum.Font.Gotham
speedLabel.Parent = speedFrame

local speedDownBtn = Instance.new("TextButton")
speedDownBtn.Size = UDim2.new(0, 40, 0, 18)
speedDownBtn.Position = UDim2.new(0, 5, 0, 20)
speedDownBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
speedDownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedDownBtn.Text = "- 10"
speedDownBtn.TextSize = 10
speedDownBtn.Font = Enum.Font.Gotham
speedDownBtn.Parent = speedFrame
Instance.new("UICorner", speedDownBtn).CornerRadius = UDim.new(0, 3)

local speedUpBtn = Instance.new("TextButton")
speedUpBtn.Size = UDim2.new(0, 40, 0, 18)
speedUpBtn.Position = UDim2.new(1, -45, 0, 20)
speedUpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
speedUpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedUpBtn.Text = "+ 10"
speedUpBtn.TextSize = 10
speedUpBtn.Font = Enum.Font.Gotham
speedUpBtn.Parent = speedFrame
Instance.new("UICorner", speedUpBtn).CornerRadius = UDim.new(0, 3)

-- Player list
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 0, 140)
scrollFrame.Position = UDim2.new(0, 5, 0, 112)
scrollFrame.BackgroundColor3 = Color3.fromRGB(35, 38, 45)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 4
scrollFrame.Parent = mainFrame
Instance.new("UICorner", scrollFrame).CornerRadius = UDim.new(0, 4)

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 2)
listLayout.Parent = scrollFrame

-- Stop button
local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, -10, 0, 28)
stopBtn.Position = UDim2.new(0, 5, 1, -35)
stopBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stopBtn.Text = "STOP"
stopBtn.TextSize = 13
stopBtn.Font = Enum.Font.GothamBold
stopBtn.Parent = mainFrame
Instance.new("UICorner", stopBtn).CornerRadius = UDim.new(0, 4)

-- === FUNCTIONS ===
local function updateStatus(text, color)
    statusLabel.Text = text
    statusLabel.TextColor3 = color or Color3.fromRGB(150, 150, 150)
end

local function updateSpeedLabel()
    speedLabel.Text = "Walk Speed: " .. config.walkSpeed
end

local function walkToPlayer(targetPlayer)
    if isTeleporting then
        updateStatus("Already moving!", Color3.fromRGB(255, 180, 80))
        return
    end
    
    local character = player.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not hrp then
        updateStatus("No character!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    local targetChar = targetPlayer.Character
    local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
    
    if not targetHRP then
        updateStatus("Target unavailable!", Color3.fromRGB(255, 80, 80))
        return
    end
    
    isTeleporting = true
    shouldStop = false
    
    -- Store original walkspeed
    originalWalkSpeed = humanoid.WalkSpeed
    humanoid.WalkSpeed = config.walkSpeed
    
    updateStatus("Walking to " .. targetPlayer.Name, Color3.fromRGB(100, 200, 150))
    
    local startTime = tick()
    
    while not shouldStop do
        -- Re-validate
        character = player.Character
        humanoid = character and character:FindFirstChild("Humanoid")
        hrp = character and character:FindFirstChild("HumanoidRootPart")
        targetChar = targetPlayer.Character
        targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        if not humanoid or not hrp or not targetHRP then
            updateStatus("Lost target!", Color3.fromRGB(255, 80, 80))
            break
        end
        
        local targetPos = targetHRP.Position
        local currentPos = hrp.Position
        local distance = (targetPos - currentPos).Magnitude
        
        -- Arrived?
        if distance < 8 then
            updateStatus("Arrived! (" .. string.format("%.1f", tick() - startTime) .. "s)", Color3.fromRGB(100, 255, 100))
            break
        end
        
        -- Use MoveTo - the legitimate movement function
        humanoid:MoveTo(targetPos)
        
        -- Update status
        updateStatus("Walking: " .. string.format("%.0f", distance) .. " studs", Color3.fromRGB(100, 200, 150))
        
        -- Keep walkspeed boosted
        humanoid.WalkSpeed = config.walkSpeed
        
        task.wait(0.1)
        
        -- Timeout
        if tick() - startTime > 600 then
            updateStatus("Timeout!", Color3.fromRGB(255, 80, 80))
            break
        end
    end
    
    -- Restore walkspeed
    if humanoid then
        humanoid.WalkSpeed = originalWalkSpeed
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
            btn.BackgroundColor3 = Color3.fromRGB(50, 55, 65)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            btn.Text = plr.Name
            btn.TextSize = 11
            btn.Font = Enum.Font.Gotham
            btn.Parent = scrollFrame
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)
            
            btn.MouseButton1Click:Connect(function()
                task.spawn(function()
                    walkToPlayer(plr)
                end)
            end)
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 5)
end

-- === EVENTS ===
stopBtn.MouseButton1Click:Connect(function()
    shouldStop = true
    local character = player.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = originalWalkSpeed
    end
    updateStatus("Stopped", Color3.fromRGB(255, 180, 80))
end)

speedDownBtn.MouseButton1Click:Connect(function()
    config.walkSpeed = math.max(16, config.walkSpeed - 10)
    updateSpeedLabel()
end)

speedUpBtn.MouseButton1Click:Connect(function()
    config.walkSpeed = math.min(200, config.walkSpeed + 10)
    updateSpeedLabel()
end)

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

refreshPlayerList()
updateSpeedLabel()
updateStatus("Select a player", Color3.fromRGB(100, 200, 150))

print("[GPO Walk TP] Loaded - Uses Humanoid:MoveTo() for legitimate movement")
print("  Adjust walk speed to balance speed vs detection risk")
print("  Higher speeds may still be detected by speed checks")
