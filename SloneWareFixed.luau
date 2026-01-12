-- SloneWare Player Teleport Script with Host Mode (Fixed Movement)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

-- Settings
local settings = {
    tpDelay = 0.5,
    platformHeight = 3,
    checkpointDistance = 34,
    stopDistance = 34,
    tracerSubdivisions = 5,
    useWalking = false,
    walkSpeed = 16,
    hostMode = false,
    -- New movement settings
    stuckThreshold = 1.0,        -- How long before considered stuck (seconds)
    stuckMoveThreshold = 0.5,    -- Minimum movement to not be considered stuck
    jumpCooldown = 0.5,          -- Minimum time between jumps
    maxJumpHeight = 7,           -- Max height difference that can be jumped
    waypointReachDist = 4,       -- Distance to consider waypoint reached
    obstacleCheckDist = 2.5,     -- Distance to check for obstacles ahead
}

-- Variables
local selectedPlayer = nil
local autoRefresh = true
local isTeleporting = false
local currentPlatform = nil
local tracerLines = {}
local currentSmoothPoints = nil
local slaveAccounts = {} -- Tracks which players are marked as slaves

-- Raycast params for obstacle detection
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.FilterDescendantsInstances = {}

-- Cleanup functions
local function clearTracers()
    for _, data in pairs(tracerLines) do
        if data and data.line then
            data.line:Remove()
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

-- Update raycast filter to exclude current character
local function updateRaycastFilter()
    local char = getCharacter()
    raycastParams.FilterDescendantsInstances = char and {char} or {}
end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SloneWareGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame - Exact colors from reference
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 560, 0, 490)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -245)
MainFrame.BackgroundColor3 = Color3.fromRGB(36, 43, 52)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(52, 62, 74)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 28)
TopBar.BackgroundColor3 = Color3.fromRGB(44, 53, 64)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 150, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SloneWare-beta"
Title.TextColor3 = Color3.fromRGB(220, 225, 230)
Title.TextSize = 13
Title.Font = Enum.Font.SourceSans
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Tab Bar
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 28)
TabBar.Position = UDim2.new(0, 0, 0, 28)
TabBar.BackgroundColor3 = Color3.fromRGB(32, 38, 46)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local PlayersTab = Instance.new("TextLabel")
PlayersTab.Size = UDim2.new(0, 100, 1, 0)
PlayersTab.Position = UDim2.new(0.5, -50, 0, 0)
PlayersTab.BackgroundTransparency = 1
PlayersTab.Text = "Players"
PlayersTab.TextColor3 = Color3.fromRGB(200, 205, 210)
PlayersTab.TextSize = 13
PlayersTab.Font = Enum.Font.SourceSans
PlayersTab.Parent = TabBar

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -76)
ContentFrame.Position = UDim2.new(0, 10, 0, 66)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Left Panel
local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 260, 1, 0)
LeftPanel.BackgroundColor3 = Color3.fromRGB(28, 34, 41)
LeftPanel.BorderSizePixel = 1
LeftPanel.BorderColor3 = Color3.fromRGB(48, 58, 68)
LeftPanel.Parent = ContentFrame

local MainLabel = Instance.new("TextLabel")
MainLabel.Size = UDim2.new(1, 0, 0, 24)
MainLabel.BackgroundColor3 = Color3.fromRGB(32, 38, 46)
MainLabel.BorderSizePixel = 0
MainLabel.Text = "  Main"
MainLabel.TextColor3 = Color3.fromRGB(200, 205, 210)
MainLabel.TextSize = 12
MainLabel.Font = Enum.Font.SourceSans
MainLabel.TextXAlignment = Enum.TextXAlignment.Left
MainLabel.Parent = LeftPanel

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -10, 0, 24)
SearchBox.Position = UDim2.new(0, 5, 0, 29)
SearchBox.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
SearchBox.BorderSizePixel = 1
SearchBox.BorderColor3 = Color3.fromRGB(52, 62, 74)
SearchBox.PlaceholderText = "Search"
SearchBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 140)
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(220, 225, 230)
SearchBox.TextSize = 12
SearchBox.Font = Enum.Font.SourceSans
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = LeftPanel

local SearchPadding = Instance.new("UIPadding")
SearchPadding.PaddingLeft = UDim.new(0, 6)
SearchPadding.Parent = SearchBox

local PlayersLabel = Instance.new("TextLabel")
PlayersLabel.Size = UDim2.new(1, 0, 0, 20)
PlayersLabel.Position = UDim2.new(0, 0, 0, 58)
PlayersLabel.BackgroundTransparency = 1
PlayersLabel.Text = "  Players"
PlayersLabel.TextColor3 = Color3.fromRGB(160, 170, 180)
PlayersLabel.TextSize = 11
PlayersLabel.Font = Enum.Font.SourceSans
PlayersLabel.TextXAlignment = Enum.TextXAlignment.Left
PlayersLabel.Parent = LeftPanel

-- Player List
local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Size = UDim2.new(1, -10, 1, -158)
PlayerList.Position = UDim2.new(0, 5, 0, 83)
PlayerList.BackgroundColor3 = Color3.fromRGB(24, 29, 35)
PlayerList.BorderSizePixel = 1
PlayerList.BorderColor3 = Color3.fromRGB(44, 52, 62)
PlayerList.ScrollBarThickness = 4
PlayerList.ScrollBarImageColor3 = Color3.fromRGB(80, 90, 100)
PlayerList.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerList.Parent = LeftPanel

local ListLayout = Instance.new("UIListLayout")
ListLayout.SortOrder = Enum.SortOrder.Name
ListLayout.Padding = UDim.new(0, 2)
ListLayout.Parent = PlayerList

local RefreshBtn = Instance.new("TextButton")
RefreshBtn.Size = UDim2.new(1, -10, 0, 26)
RefreshBtn.Position = UDim2.new(0, 5, 1, -31)
RefreshBtn.BackgroundColor3 = Color3.fromRGB(44, 52, 62)
RefreshBtn.BorderSizePixel = 1
RefreshBtn.BorderColor3 = Color3.fromRGB(56, 66, 78)
RefreshBtn.Text = "Refresh"
RefreshBtn.TextColor3 = Color3.fromRGB(200, 205, 210)
RefreshBtn.TextSize = 12
RefreshBtn.Font = Enum.Font.SourceSans
RefreshBtn.Parent = LeftPanel

-- Right Panel
local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(0, 260, 1, 0)
RightPanel.Position = UDim2.new(0, 270, 0, 0)
RightPanel.BackgroundColor3 = Color3.fromRGB(28, 34, 41)
RightPanel.BorderSizePixel = 1
RightPanel.BorderColor3 = Color3.fromRGB(48, 58, 68)
RightPanel.Parent = ContentFrame

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 0, 24)
InfoLabel.BackgroundColor3 = Color3.fromRGB(32, 38, 46)
InfoLabel.BorderSizePixel = 0
InfoLabel.Text = "  Info"
InfoLabel.TextColor3 = Color3.fromRGB(200, 205, 210)
InfoLabel.TextSize = 12
InfoLabel.Font = Enum.Font.SourceSans
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Parent = RightPanel

-- Info fields
local infoY = 29
local infoLabels = {}
local infoFields = {"Player Name", "UserID", "Account Age", "Team", "Status"}

for i, field in ipairs(infoFields) do
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 18)
    label.Position = UDim2.new(0, 5, 0, infoY)
    label.BackgroundTransparency = 1
    label.Text = "  " .. field .. " -"
    label.TextColor3 = Color3.fromRGB(160, 170, 180)
    label.TextSize = 11
    label.Font = Enum.Font.SourceSans
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = RightPanel
    infoLabels[field] = label
    infoY = infoY + 20
end

-- Settings section
local SettingsLabel = Instance.new("TextLabel")
SettingsLabel.Size = UDim2.new(1, 0, 0, 20)
SettingsLabel.Position = UDim2.new(0, 0, 0, 140)
SettingsLabel.BackgroundTransparency = 1
SettingsLabel.Text = "  Settings"
SettingsLabel.TextColor3 = Color3.fromRGB(160, 170, 180)
SettingsLabel.TextSize = 11
SettingsLabel.Font = Enum.Font.SourceSans
SettingsLabel.TextXAlignment = Enum.TextXAlignment.Left
SettingsLabel.Parent = RightPanel

-- Host Mode Toggle
local HostModeToggle = Instance.new("TextButton")
HostModeToggle.Size = UDim2.new(1, -10, 0, 24)
HostModeToggle.Position = UDim2.new(0, 5, 0, 165)
HostModeToggle.BackgroundColor3 = Color3.fromRGB(80, 60, 60)
HostModeToggle.BorderSizePixel = 1
HostModeToggle.BorderColor3 = Color3.fromRGB(52, 62, 74)
HostModeToggle.Text = "  Host Mode: OFF"
HostModeToggle.TextColor3 = Color3.fromRGB(220, 225, 230)
HostModeToggle.TextSize = 11
HostModeToggle.Font = Enum.Font.SourceSans
HostModeToggle.TextXAlignment = Enum.TextXAlignment.Left
HostModeToggle.Parent = RightPanel

-- Movement Mode Toggle
local ModeToggle = Instance.new("TextButton")
ModeToggle.Size = UDim2.new(1, -10, 0, 24)
ModeToggle.Position = UDim2.new(0, 5, 0, 194)
ModeToggle.BackgroundColor3 = Color3.fromRGB(60, 80, 120)
ModeToggle.BorderSizePixel = 1
ModeToggle.BorderColor3 = Color3.fromRGB(52, 62, 74)
ModeToggle.Text = "  Mode: Teleport"
ModeToggle.TextColor3 = Color3.fromRGB(220, 225, 230)
ModeToggle.TextSize = 11
ModeToggle.Font = Enum.Font.SourceSans
ModeToggle.TextXAlignment = Enum.TextXAlignment.Left
ModeToggle.Parent = RightPanel

-- Host Command Buttons (Hidden by default)
local CommandFrame = Instance.new("Frame")
CommandFrame.Size = UDim2.new(1, -10, 0, 58)
CommandFrame.Position = UDim2.new(0, 5, 0, 223)
CommandFrame.BackgroundColor3 = Color3.fromRGB(32, 38, 46)
CommandFrame.BorderSizePixel = 1
CommandFrame.BorderColor3 = Color3.fromRGB(52, 62, 74)
CommandFrame.Visible = false
CommandFrame.Parent = RightPanel

local TPSelectedBtn = Instance.new("TextButton")
TPSelectedBtn.Size = UDim2.new(1, -6, 0, 24)
TPSelectedBtn.Position = UDim2.new(0, 3, 0, 3)
TPSelectedBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 140)
TPSelectedBtn.BorderSizePixel = 0
TPSelectedBtn.Text = "TP Selected to Target"
TPSelectedBtn.TextColor3 = Color3.fromRGB(220, 225, 230)
TPSelectedBtn.TextSize = 11
TPSelectedBtn.Font = Enum.Font.SourceSans
TPSelectedBtn.Parent = CommandFrame

local WalkSelectedBtn = Instance.new("TextButton")
WalkSelectedBtn.Size = UDim2.new(1, -6, 0, 24)
WalkSelectedBtn.Position = UDim2.new(0, 3, 0, 30)
WalkSelectedBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 80)
WalkSelectedBtn.BorderSizePixel = 0
WalkSelectedBtn.Text = "Walk Selected to Target"
WalkSelectedBtn.TextColor3 = Color3.fromRGB(220, 225, 230)
WalkSelectedBtn.TextSize = 11
WalkSelectedBtn.Font = Enum.Font.SourceSans
WalkSelectedBtn.Parent = CommandFrame

-- Delay control
local DelayLabel = Instance.new("TextLabel")
DelayLabel.Size = UDim2.new(0.6, 0, 0, 24)
DelayLabel.Position = UDim2.new(0, 5, 0, 286)
DelayLabel.BackgroundTransparency = 1
DelayLabel.Text = "  TP Delay: " .. settings.tpDelay .. "s"
DelayLabel.TextColor3 = Color3.fromRGB(180, 190, 200)
DelayLabel.TextSize = 11
DelayLabel.Font = Enum.Font.SourceSans
DelayLabel.TextXAlignment = Enum.TextXAlignment.Left
DelayLabel.Parent = RightPanel

local DelayBox = Instance.new("TextBox")
DelayBox.Size = UDim2.new(0.35, 0, 0, 24)
DelayBox.Position = UDim2.new(0.6, 5, 0, 286)
DelayBox.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
DelayBox.BorderSizePixel = 1
DelayBox.BorderColor3 = Color3.fromRGB(52, 62, 74)
DelayBox.Text = tostring(settings.tpDelay)
DelayBox.TextColor3 = Color3.fromRGB(220, 225, 230)
DelayBox.TextSize = 11
DelayBox.Font = Enum.Font.SourceSans
DelayBox.Parent = RightPanel

-- Status area
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -10, 0, 24)
StatusLabel.Position = UDim2.new(0, 5, 0, 315)
StatusLabel.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
StatusLabel.BorderSizePixel = 1
StatusLabel.BorderColor3 = Color3.fromRGB(52, 62, 74)
StatusLabel.Text = "  Status"
StatusLabel.TextColor3 = Color3.fromRGB(160, 170, 180)
StatusLabel.TextSize = 11
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = RightPanel

local StatusDisplay = Instance.new("TextLabel")
StatusDisplay.Size = UDim2.new(1, -10, 1, -349)
StatusDisplay.Position = UDim2.new(0, 5, 0, 344)
StatusDisplay.BackgroundColor3 = Color3.fromRGB(24, 29, 35)
StatusDisplay.BorderSizePixel = 1
StatusDisplay.BorderColor3 = Color3.fromRGB(44, 52, 62)
StatusDisplay.Text = "  None"
StatusDisplay.TextColor3 = Color3.fromRGB(140, 150, 160)
StatusDisplay.TextSize = 11
StatusDisplay.Font = Enum.Font.SourceSans
StatusDisplay.TextXAlignment = Enum.TextXAlignment.Left
StatusDisplay.TextYAlignment = Enum.TextYAlignment.Top
StatusDisplay.TextWrapped = true
StatusDisplay.Parent = RightPanel

-- Catmull-Rom spline interpolation for smooth curves
local function catmullRom(p0, p1, p2, p3, t)
    local t2 = t * t
    local t3 = t2 * t
    return 0.5 * (
        (2 * p1) +
        (-p0 + p2) * t +
        (2 * p0 - 5 * p1 + 4 * p2 - p3) * t2 +
        (-p0 + 3 * p1 - 3 * p2 + p3) * t3
    )
end

local function catmullRomPoint(p0, p1, p2, p3, t)
    return Vector3.new(
        catmullRom(p0.X, p1.X, p2.X, p3.X, t),
        catmullRom(p0.Y, p1.Y, p2.Y, p3.Y, t),
        catmullRom(p0.Z, p1.Z, p2.Z, p3.Z, t)
    )
end

-- Generate smooth points from waypoints using Catmull-Rom spline
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
        local p0 = positions[i - 1]
        local p1 = positions[i]
        local p2 = positions[i + 1]
        local p3 = positions[i + 2]
        
        for j = 0, settings.tracerSubdivisions - 1 do
            local t = j / settings.tracerSubdivisions
            table.insert(smoothPoints, catmullRomPoint(p0, p1, p2, p3, t))
        end
    end
    
    table.insert(smoothPoints, positions[#positions - 1])
    
    return smoothPoints
end

local function worldToScreen(pos)
    local screenPos, onScreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen
end

-- Create tracers once and store them
local function createTracerLines(smoothPoints)
    clearTracers()
    
    for i = 1, #smoothPoints - 1 do
        -- Outline
        local outline = Drawing.new("Line")
        outline.Visible = false
        outline.Color = Color3.fromRGB(180, 100, 140)
        outline.Thickness = 5
        outline.Transparency = 0.6
        table.insert(tracerLines, {line = outline, index = i})
        
        -- Main line
        local line = Drawing.new("Line")
        line.Visible = false
        line.Color = Color3.fromRGB(255, 182, 213)
        line.Thickness = 2
        line.Transparency = 0.9
        table.insert(tracerLines, {line = line, index = i})
    end
end

-- Update tracer positions without recreating them
local function updateTracers()
    if not currentSmoothPoints then return end
    
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

-- Create platform above ground (invisible)
local function createPlatform(position)
    clearPlatform()
    
    updateRaycastFilter()
    local rayOrigin = position + Vector3.new(0, 50, 0)
    local rayDirection = Vector3.new(0, -100, 0)
    
    local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
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

-- Check if there's an obstacle in front (wall/fence) vs stairs
local function checkObstacleType(humanoid, rootPart)
    updateRaycastFilter()
    
    local moveDir = rootPart.CFrame.LookVector
    local hipHeight = humanoid.HipHeight or 2
    
    -- Cast ray forward at feet level
    local feetPos = rootPart.Position - Vector3.new(0, hipHeight, 0)
    local feetRay = workspace:Raycast(feetPos, moveDir * settings.obstacleCheckDist, raycastParams)
    
    -- Cast ray forward at waist level
    local waistRay = workspace:Raycast(rootPart.Position, moveDir * settings.obstacleCheckDist, raycastParams)
    
    -- Cast ray forward at head level
    local headPos = rootPart.Position + Vector3.new(0, hipHeight, 0)
    local headRay = workspace:Raycast(headPos, moveDir * settings.obstacleCheckDist, raycastParams)
    
    -- Check for stairs: obstacle at feet but not at waist/head
    if feetRay and not waistRay and not headRay then
        -- Check the height of the obstacle
        local obstacleTop = feetRay.Position.Y + 0.5
        local stepHeight = obstacleTop - feetPos.Y
        
        if stepHeight > 0 and stepHeight <= settings.maxJumpHeight then
            return "stairs", stepHeight
        end
    end
    
    -- Check for wall: obstacle at multiple heights
    if feetRay and waistRay then
        return "wall", 0
    end
    
    -- Check for low obstacle that can be stepped over
    if feetRay and not waistRay then
        local obstacleHeight = feetRay.Instance and feetRay.Instance.Size.Y or 0
        if obstacleHeight <= 2 then
            return "step", obstacleHeight
        end
    end
    
    return "none", 0
end

-- Check if humanoid can naturally walk up (stairs detection using floor ahead)
local function canWalkUpNaturally(humanoid, rootPart, targetPos)
    updateRaycastFilter()
    
    local direction = (targetPos - rootPart.Position)
    direction = Vector3.new(direction.X, 0, direction.Z).Unit
    
    -- Cast ray down from a position slightly ahead and above
    local checkPos = rootPart.Position + direction * 2 + Vector3.new(0, 3, 0)
    local groundCheck = workspace:Raycast(checkPos, Vector3.new(0, -5, 0), raycastParams)
    
    if groundCheck then
        local heightDiff = groundCheck.Position.Y - (rootPart.Position.Y - humanoid.HipHeight)
        -- If the ground ahead is only slightly higher (stairs), humanoid can walk naturally
        if heightDiff > 0.1 and heightDiff <= 2.5 then
            return true, heightDiff
        end
    end
    
    return false, 0
end

-- Check if humanoid is currently in a jump/fall state
local function isAirborne(humanoid)
    local state = humanoid:GetState()
    return state == Enum.HumanoidStateType.Jumping 
        or state == Enum.HumanoidStateType.Freefall 
        or state == Enum.HumanoidStateType.FallingDown
end

-- Improved walk to player function with smart obstacle handling
local function walkToPlayer(targetPlayer, waypoints)
    local humanoid = getHumanoid()
    local myRoot = getRootPart()
    
    if not humanoid or not myRoot then
        StatusDisplay.Text = "  Missing humanoid"
        return false
    end
    
    StatusDisplay.Text = "  Walking to player..."
    
    -- Movement state tracking
    local lastJumpTime = 0
    local stuckStartTime = nil
    local lastPosition = myRoot.Position
    local consecutiveStuckChecks = 0
    
    for i, waypoint in ipairs(waypoints) do
        if not isTeleporting then break end
        
        local targetPos = waypoint.Position
        local waypointReached = false
        local timeout = 0
        local maxWaypointTime = 20 -- Max time per waypoint
        
        -- Initial move command
        humanoid:MoveTo(targetPos)
        
        while not waypointReached and timeout < maxWaypointTime and isTeleporting do
            task.wait(0.1)
            timeout = timeout + 0.1
            
            local currentPos = myRoot.Position
            local distance = (Vector3.new(currentPos.X, 0, currentPos.Z) - Vector3.new(targetPos.X, 0, targetPos.Z)).Magnitude
            local moved = (currentPos - lastPosition).Magnitude
            
            -- Check if waypoint reached (using horizontal distance)
            if distance < settings.waypointReachDist then
                waypointReached = true
                stuckStartTime = nil
                consecutiveStuckChecks = 0
                break
            end
            
            -- Stuck detection with proper timing
            if moved < settings.stuckMoveThreshold then
                if stuckStartTime == nil then
                    stuckStartTime = tick()
                else
                    local stuckDuration = tick() - stuckStartTime
                    
                    -- Only try to unstick after threshold
                    if stuckDuration > settings.stuckThreshold then
                        consecutiveStuckChecks = consecutiveStuckChecks + 1
                        
                        -- Check what's blocking us
                        local obstacleType, obstacleHeight = checkObstacleType(humanoid, myRoot)
                        local canWalkUp, walkUpHeight = canWalkUpNaturally(humanoid, myRoot, targetPos)
                        
                        -- Don't jump if airborne or on cooldown
                        local canJump = not isAirborne(humanoid) and (tick() - lastJumpTime) > settings.jumpCooldown
                        
                        if canJump then
                            -- Only jump for actual traversable obstacles, not walls
                            if obstacleType == "stairs" or obstacleType == "step" or canWalkUp then
                                -- Small hop for stairs/steps
                                humanoid.Jump = true
                                lastJumpTime = tick()
                                stuckStartTime = nil
                                task.wait(0.3) -- Short wait after jump
                            elseif obstacleType == "none" and waypoint.Action == Enum.PathWaypointAction.Jump then
                                -- Pathfinding says to jump
                                humanoid.Jump = true
                                lastJumpTime = tick()
                                stuckStartTime = nil
                                task.wait(0.3)
                            elseif consecutiveStuckChecks >= 3 then
                                -- Really stuck, try a jump as last resort
                                humanoid.Jump = true
                                lastJumpTime = tick()
                                stuckStartTime = nil
                                consecutiveStuckChecks = 0
                                task.wait(0.5)
                            end
                        end
                        
                        -- Re-issue move command
                        humanoid:MoveTo(targetPos)
                    end
                end
            else
                -- Moving, reset stuck detection
                stuckStartTime = nil
                consecutiveStuckChecks = 0
            end
            
            -- Handle explicit jump waypoints (from pathfinding)
            if waypoint.Action == Enum.PathWaypointAction.Jump then
                local heightDiff = targetPos.Y - currentPos.Y
                if heightDiff > 1 and not isAirborne(humanoid) and (tick() - lastJumpTime) > settings.jumpCooldown then
                    humanoid.Jump = true
                    lastJumpTime = tick()
                    task.wait(0.2)
                end
            end
            
            lastPosition = currentPos
        end
        
        if not waypointReached and isTeleporting then
            StatusDisplay.Text = "  Waypoint " .. i .. " taking long..."
            -- Continue to next waypoint anyway
        end
    end
    
    return true
end

-- Teleport function (combined TP and Walk modes)
local function teleportToPlayer(targetPlayer)
    if isTeleporting then
        StatusDisplay.Text = "  Already in progress..."
        return
    end
    
    if not targetPlayer.Character then
        StatusDisplay.Text = "  Target has no character"
        return
    end
    
    local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    local myRoot = getRootPart()
    
    if not targetRoot or not myRoot then
        StatusDisplay.Text = "  Missing character parts"
        return
    end
    
    isTeleporting = true
    StatusDisplay.Text = "  Computing path..."
    
    updateRaycastFilter()
    
    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentCanClimb = false,
        WaypointSpacing = 6  -- Increased for smoother movement
    })
    
    local success = pcall(function()
        path:ComputeAsync(myRoot.Position, targetRoot.Position)
    end)
    
    if not success or path.Status ~= Enum.PathStatus.Success then
        StatusDisplay.Text = "  Path failed: " .. tostring(path.Status)
        isTeleporting = false
        return
    end
    
    local waypoints = path:GetWaypoints()
    StatusDisplay.Text = "  Moving... (" .. #waypoints .. " waypoints)"
    
    -- Generate smooth points and create lines ONCE
    currentSmoothPoints = generateSmoothPoints(waypoints)
    createTracerLines(currentSmoothPoints)
    
    -- Update line positions every frame
    local tracerConnection = RunService.RenderStepped:Connect(function()
        updateTracers()
    end)
    
    if settings.useWalking then
        -- Walking mode with improved obstacle handling
        local walkSuccess = walkToPlayer(targetPlayer, waypoints)
        
        if walkSuccess then
            StatusDisplay.Text = "  Arrived!"
        end
    else
        -- Teleport mode
        local totalDist = 0
        
        for i, waypoint in ipairs(waypoints) do
            if not isTeleporting then break end
            
            if i > 1 then
                totalDist = totalDist + (waypoint.Position - waypoints[i-1].Position).Magnitude
            end
            
            if totalDist >= settings.checkpointDistance or i == #waypoints then
                createPlatform(waypoint.Position)
                
                local platformTop = currentPlatform.Position + Vector3.new(0, currentPlatform.Size.Y/2 + 3, 0)
                myRoot.CFrame = CFrame.new(platformTop)
                
                totalDist = 0
                task.wait(settings.tpDelay)
            end
        end
        
        -- Final position
        local direction = (myRoot.Position - targetRoot.Position).Unit
        local finalPos = targetRoot.Position + (direction * settings.stopDistance)
        finalPos = Vector3.new(finalPos.X, targetRoot.Position.Y, finalPos.Z)
        myRoot.CFrame = CFrame.new(finalPos)
    end
    
    StatusDisplay.Text = "  Complete!"
    
    task.wait(2)
    tracerConnection:Disconnect()
    clearTracers()
    clearPlatform()
    currentSmoothPoints = nil
    
    isTeleporting = false
    StatusDisplay.Text = "  Ready"
end

-- Function to send chat command
local function sendChatCommand(message)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        -- New TextChatService
        local textChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if textChannel then
            textChannel:SendAsync(message)
        end
    else
        -- Legacy chat
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end
end

-- Get selected slaves
local function getSelectedSlaves()
    local selected = {}
    for playerName, isSelected in pairs(slaveAccounts) do
        if isSelected then
            table.insert(selected, playerName)
        end
    end
    return selected
end

-- Host mode toggle handler
HostModeToggle.MouseButton1Click:Connect(function()
    settings.hostMode = not settings.hostMode
    if settings.hostMode then
        HostModeToggle.Text = "  Host Mode: ON"
        HostModeToggle.BackgroundColor3 = Color3.fromRGB(100, 60, 60)
        CommandFrame.Visible = true
        StatusDisplay.Text = "  Host mode enabled\n  Select slaves with checkboxes"
    else
        HostModeToggle.Text = "  Host Mode: OFF"
        HostModeToggle.BackgroundColor3 = Color3.fromRGB(80, 60, 60)
        CommandFrame.Visible = false
        StatusDisplay.Text = "  Ready"
    end
end)

-- TP Selected command
TPSelectedBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then
        StatusDisplay.Text = "  Select a target player first!"
        return
    end
    
    local slaves = getSelectedSlaves()
    if #slaves == 0 then
        StatusDisplay.Text = "  No slaves selected!"
        return
    end
    
    local slaveList = table.concat(slaves, ", ")
    local command = "/tpall " .. slaveList .. " TO " .. selectedPlayer.Name
    sendChatCommand(command)
    StatusDisplay.Text = "  Sent: " .. command
end)

-- Walk Selected command
WalkSelectedBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then
        StatusDisplay.Text = "  Select a target player first!"
        return
    end
    
    local slaves = getSelectedSlaves()
    if #slaves == 0 then
        StatusDisplay.Text = "  No slaves selected!"
        return
    end
    
    local slaveList = table.concat(slaves, ", ")
    local command = "/walkall " .. slaveList .. " TO " .. selectedPlayer.Name
    sendChatCommand(command)
    StatusDisplay.Text = "  Sent: " .. command
end)
ModeToggle.MouseButton1Click:Connect(function()
    settings.useWalking = not settings.useWalking
    if settings.useWalking then
        ModeToggle.Text = "  Mode: Walking"
        ModeToggle.BackgroundColor3 = Color3.fromRGB(80, 120, 80)
        DelayLabel.Text = "  Walk Speed: " .. settings.walkSpeed
    else
        ModeToggle.Text = "  Mode: Teleport"
        ModeToggle.BackgroundColor3 = Color3.fromRGB(60, 80, 120)
        DelayLabel.Text = "  TP Delay: " .. settings.tpDelay .. "s"
    end
end)

-- Update info panel
local function updateInfo(player)
    if not player then
        for _, label in pairs(infoLabels) do
            local field = label.Text:match("  (.+) %-")
            label.Text = "  " .. field .. " -"
        end
        return
    end
    
    infoLabels["Player Name"].Text = "  Player Name - " .. player.Name
    infoLabels["UserID"].Text = "  UserID - " .. tostring(player.UserId)
    infoLabels["Account Age"].Text = "  Account Age - " .. tostring(player.AccountAge)
    infoLabels["Team"].Text = "  Team - " .. (player.Team and player.Team.Name or "None")
    infoLabels["Status"].Text = "  Status - " .. (player.Character and "In Game" or "Loading")
end

-- Create player button with image and checkbox
local function createPlayerButton(player)
    if player == LocalPlayer then return end
    
    local Button = Instance.new("TextButton")
    Button.Name = player.Name
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(32, 38, 46)
    Button.BorderSizePixel = 0
    Button.AutoButtonColor = false
    Button.Text = ""
    Button.Parent = PlayerList
    
    -- Checkbox (only visible in host mode)
    local Checkbox = Instance.new("TextButton")
    Checkbox.Size = UDim2.new(0, 20, 0, 20)
    Checkbox.Position = UDim2.new(0, 5, 0.5, -10)
    Checkbox.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
    Checkbox.BorderSizePixel = 1
    Checkbox.BorderColor3 = Color3.fromRGB(60, 70, 80)
    Checkbox.Text = ""
    Checkbox.Visible = settings.hostMode
    Checkbox.Parent = Button
    
    local CheckMark = Instance.new("TextLabel")
    CheckMark.Size = UDim2.new(1, 0, 1, 0)
    CheckMark.BackgroundTransparency = 1
    CheckMark.Text = "✓"
    CheckMark.TextColor3 = Color3.fromRGB(100, 200, 100)
    CheckMark.TextSize = 16
    CheckMark.Font = Enum.Font.SourceSansBold
    CheckMark.Visible = false
    CheckMark.Parent = Checkbox
    
    local Thumbnail = Instance.new("ImageLabel")
    Thumbnail.Size = UDim2.new(0, 40, 0, 40)
    Thumbnail.Position = UDim2.new(0, 30, 0, 5)
    Thumbnail.BackgroundTransparency = 1
    Thumbnail.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
    Thumbnail.Parent = Button
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(1, 0)
    Corner.Parent = Thumbnail
    
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -80, 1, 0)
    NameLabel.Position = UDim2.new(0, 75, 0, 0)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = " " .. player.Name
    NameLabel.TextColor3 = Color3.fromRGB(200, 205, 210)
    NameLabel.TextSize = 12
    NameLabel.Font = Enum.Font.SourceSans
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = Button
    
    -- Checkbox click handler
    Checkbox.MouseButton1Click:Connect(function()
        slaveAccounts[player.Name] = not slaveAccounts[player.Name]
        CheckMark.Visible = slaveAccounts[player.Name]
        
        if slaveAccounts[player.Name] then
            Checkbox.BackgroundColor3 = Color3.fromRGB(60, 100, 60)
        else
            Checkbox.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
        end
    end)
    
    Button.MouseEnter:Connect(function()
        if selectedPlayer ~= player then
            Button.BackgroundColor3 = Color3.fromRGB(40, 48, 58)
        end
    end)
    
    Button.MouseLeave:Connect(function()
        if selectedPlayer ~= player then
            Button.BackgroundColor3 = Color3.fromRGB(32, 38, 46)
        end
    end)
    
    Button.MouseButton1Click:Connect(function()
        for _, child in pairs(PlayerList:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(32, 38, 46)
            end
        end
        
        Button.BackgroundColor3 = Color3.fromRGB(52, 62, 74)
        selectedPlayer = player
        updateInfo(player)
        
        if not settings.hostMode then
            teleportToPlayer(player)
        end
    end)
    
    return Button
end

-- Refresh list
local function refreshList()
    local search = SearchBox.Text:lower()
    
    for _, child in pairs(PlayerList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if search == "" or player.Name:lower():find(search) then
                local button = createPlayerButton(player)
                -- Update checkbox visibility
                if button then
                    local checkbox = button:FindFirstChildWhichIsA("TextButton")
                    if checkbox then
                        checkbox.Visible = settings.hostMode
                    end
                end
            end
        end
    end
    
    PlayerList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y)
end

-- Update checkboxes when host mode changes
local function updateCheckboxVisibility()
    for _, button in pairs(PlayerList:GetChildren()) do
        if button:IsA("TextButton") then
            local checkbox = button:FindFirstChildWhichIsA("TextButton")
            if checkbox then
                checkbox.Visible = settings.hostMode
            end
        end
    end
end

-- Events
SearchBox:GetPropertyChangedSignal("Text"):Connect(refreshList)

RefreshBtn.MouseButton1Click:Connect(function()
    refreshList()
end)

DelayBox.FocusLost:Connect(function()
    local num = tonumber(DelayBox.Text)
    if settings.useWalking then
        if num and num >= 1 and num <= 100 then
            settings.walkSpeed = num
            DelayLabel.Text = "  Walk Speed: " .. settings.walkSpeed
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = settings.walkSpeed
            end
        else
            DelayBox.Text = tostring(settings.walkSpeed)
        end
    else
        if num and num >= 0.05 and num <= 5 then
            settings.tpDelay = num
            DelayLabel.Text = "  TP Delay: " .. settings.tpDelay .. "s"
        else
            DelayBox.Text = tostring(settings.tpDelay)
        end
    end
end)

Players.PlayerAdded:Connect(function()
    task.wait(1)
    if autoRefresh then refreshList() end
end)

Players.PlayerRemoving:Connect(function(player)
    if selectedPlayer == player then
        selectedPlayer = nil
        updateInfo(nil)
    end
    if autoRefresh then refreshList() end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    isTeleporting = false
    clearTracers()
    clearPlatform()
    currentSmoothPoints = nil
end)

-- Auto refresh
task.spawn(function()
    while task.wait(5) do
        if autoRefresh and not isTeleporting then
            refreshList()
        end
    end
end)

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    PlayerList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y)
end)

-- Initial load
refreshList()
updateInfo(nil)
StatusDisplay.Text = "  Ready"

print("SloneWare loaded (Fixed Movement)")
