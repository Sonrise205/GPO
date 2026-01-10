local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_CameraToggleStateController_0 = require(script.Parent:WaitForChild("CameraToggleStateController"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUI_0 = require(script.Parent:WaitForChild("CameraUI"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v13 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixGamepadMaxZoom");
end);
v13 = l_status_0 and l_result_0;
l_status_0 = l_FlagUtil_0.getUserFlag("UserPSRemoveTouchEnabled");
l_result_0 = Vector2.new(0, 0);
local v16 = {
    CHARACTER_ADDED = "CHARACTER_ADDED", 
    CAMERA_MODE_CHANGED = "CAMERA_MODE_CHANGED", 
    CAMERA_MIN_DISTANCE_CHANGED = "CAMERA_MIN_DISTANCE_CHANGED", 
    CAMERA_MAX_DISTANCE_CHANGED = "CAMERA_MAX_DISTANCE_CHANGED"
};
local v17 = {};
v17.__index = v17;
v17.new = function() --[[ Line: 80 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), l_ConnectionUtil_0 (copy), l_LocalPlayer_0 (copy), l_status_0 (copy), l_UserGameSettings_0 (copy)
    local v18 = setmetatable({}, v17);
    v18._connections = l_ConnectionUtil_0.new();
    v18.gamepadZoomLevels = {
        0, 
        10, 
        20
    };
    v18.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
    v18.cameraType = nil;
    v18.cameraMovementMode = nil;
    v18.lastCameraTransform = nil;
    v18.lastUserPanCamera = tick();
    v18.humanoidRootPart = nil;
    v18.humanoidCache = {};
    v18.lastSubject = nil;
    v18.lastSubjectPosition = Vector3.new(0, 5, 0, 0);
    v18.lastSubjectCFrame = CFrame.new(v18.lastSubjectPosition);
    v18.currentSubjectDistance = math.clamp(12.5, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v18.inFirstPerson = false;
    v18.inMouseLockedMode = false;
    if not l_status_0 then
        v18.portraitMode = false;
        v18.isSmallTouchScreen = false;
    end;
    v18.resetCameraAngle = true;
    v18.enabled = false;
    v18.cameraChangedConn = nil;
    if not l_status_0 then
        v18.viewportSizeChangedConn = nil;
    end;
    v18.shouldUseVRRotation = false;
    v18.VRRotationIntensityAvailable = false;
    v18.lastVRRotationIntensityCheckTime = 0;
    v18.lastVRRotationTime = 0;
    v18.vrRotateKeyCooldown = {};
    v18.cameraTranslationConstraints = Vector3.new(1, 1, 1, 0);
    v18.humanoidJumpOrigin = nil;
    v18.trackingHumanoid = nil;
    v18.cameraFrozen = false;
    v18.subjectStateChangedConn = nil;
    v18.gamepadZoomPressConnection = nil;
    v18.mouseLockOffset = Vector3.new(0, 0, 0, 0);
    l_UserGameSettings_0:SetCameraYInvertVisible();
    l_UserGameSettings_0:SetGamepadCameraSensitivityVisible();
    return v18;
end;
v17.GetModuleName = function(_) --[[ Line: 147 ]] --[[ Name: GetModuleName ]]
    return "BaseCamera";
end;
v17._setUpConfigurations = function(v20) --[[ Line: 151 ]] --[[ Name: _setUpConfigurations ]]
    -- upvalues: v16 (copy), l_LocalPlayer_0 (copy)
    v20._connections:trackConnection(v16.CHARACTER_ADDED, l_LocalPlayer_0.CharacterAdded:Connect(function(v21) --[[ Line: 152 ]]
        -- upvalues: v20 (copy)
        v20:OnCharacterAdded(v21);
    end));
    v20.humanoidRootPart = nil;
    v20._connections:trackConnection(v16.CAMERA_MODE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 157 ]]
        -- upvalues: v20 (copy)
        v20:OnPlayerCameraPropertyChange();
    end));
    v20._connections:trackConnection(v16.CAMERA_MIN_DISTANCE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 160 ]]
        -- upvalues: v20 (copy)
        v20:OnPlayerCameraPropertyChange();
    end));
    v20._connections:trackConnection(v16.CAMERA_MAX_DISTANCE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 163 ]]
        -- upvalues: v20 (copy)
        v20:OnPlayerCameraPropertyChange();
    end));
    v20:OnPlayerCameraPropertyChange();
end;
v17.OnCharacterAdded = function(v22, _) --[[ Line: 169 ]] --[[ Name: OnCharacterAdded ]]
    v22.resetCameraAngle = v22.resetCameraAngle or v22:GetEnabled();
    v22.humanoidRootPart = nil;
end;
v17.GetHumanoidRootPart = function(v24) --[[ Line: 176 ]] --[[ Name: GetHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if not v24.humanoidRootPart and l_LocalPlayer_0.Character then
        local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            v24.humanoidRootPart = l_Humanoid_0.RootPart;
        end;
    end;
    return v24.humanoidRootPart;
end;
v17.GetBodyPartToFollow = function(_, v27, _) --[[ Line: 188 ]] --[[ Name: GetBodyPartToFollow ]]
    if v27:GetState() == Enum.HumanoidStateType.Dead then
        local l_Parent_0 = v27.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return l_Parent_0:FindFirstChild("Head") or v27.RootPart;
        end;
    end;
    return v27.RootPart;
end;
v17.GetSubjectCFrame = function(v30) --[[ Line: 200 ]] --[[ Name: GetSubjectCFrame ]]
    local l_lastSubjectCFrame_0 = v30.lastSubjectCFrame;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v33 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    if not v33 then
        return l_lastSubjectCFrame_0;
    else
        if v33:IsA("Humanoid") then
            local v34 = v33:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_0 = v33.CameraOffset;
            if v30:GetIsMouseLocked() then
                l_CameraOffset_0 = Vector3.new();
            end;
            local l_RootPart_0 = v33.RootPart;
            if v34 and v33.Parent and v33.Parent:IsA("Model") then
                l_RootPart_0 = v33.Parent:FindFirstChild("Head") or l_RootPart_0;
            end;
            if l_RootPart_0 and l_RootPart_0:IsA("BasePart") then
                local v37 = nil;
                if v33.RigType == Enum.HumanoidRigType.R15 then
                    if v33.AutomaticScalingEnabled then
                        v37 = Vector3.new(0, 1.5, 0, 0);
                        local l_RootPart_1 = v33.RootPart;
                        if l_RootPart_0 == l_RootPart_1 then
                            v37 = v37 + Vector3.new(0, (l_RootPart_1.Size.Y - Vector3.new(2, 2, 1, 0).Y) / 2, 0);
                        end;
                    else
                        v37 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v37 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v34 then
                    v37 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectCFrame_0 = l_RootPart_0.CFrame * CFrame.new(v37 + l_CameraOffset_0);
            end;
        elseif v33:IsA("BasePart") then
            l_lastSubjectCFrame_0 = v33.CFrame;
        elseif v33:IsA("Model") then
            l_lastSubjectCFrame_0 = if v33.PrimaryPart then v33:GetPrimaryPartCFrame() else CFrame.new();
        end;
        if l_lastSubjectCFrame_0 then
            v30.lastSubjectCFrame = l_lastSubjectCFrame_0;
        end;
        return l_lastSubjectCFrame_0;
    end;
end;
v17.GetSubjectVelocity = function(_) --[[ Line: 274 ]] --[[ Name: GetSubjectVelocity ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v41 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if not v41 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v41:IsA("BasePart") then
        return v41.Velocity;
    else
        if v41:IsA("Humanoid") then
            local l_RootPart_2 = v41.RootPart;
            if l_RootPart_2 then
                return l_RootPart_2.Velocity;
            end;
        elseif v41:IsA("Model") then
            local l_PrimaryPart_0 = v41.PrimaryPart;
            if l_PrimaryPart_0 then
                return l_PrimaryPart_0.Velocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v17.GetSubjectRotVelocity = function(_) --[[ Line: 303 ]] --[[ Name: GetSubjectRotVelocity ]]
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v46 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if not v46 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v46:IsA("BasePart") then
        return v46.RotVelocity;
    else
        if v46:IsA("Humanoid") then
            local l_RootPart_3 = v46.RootPart;
            if l_RootPart_3 then
                return l_RootPart_3.RotVelocity;
            end;
        elseif v46:IsA("Model") then
            local l_PrimaryPart_1 = v46.PrimaryPart;
            if l_PrimaryPart_1 then
                return l_PrimaryPart_1.RotVelocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v17.StepZoom = function(v49) --[[ Line: 332 ]] --[[ Name: StepZoom ]]
    -- upvalues: l_CameraInput_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_0 = v49.currentSubjectDistance;
    local v51 = l_CameraInput_0.getZoomDelta();
    if math.abs(v51) > 0 then
        local v52 = nil;
        v52 = if v51 > 0 then math.max(l_currentSubjectDistance_0 + v51 * (l_currentSubjectDistance_0 * 0.5 + 1), v49.FIRST_PERSON_DISTANCE_THRESHOLD) else math.max((l_currentSubjectDistance_0 + v51) / (1 - v51 * 0.5), 0.5);
        if v52 < v49.FIRST_PERSON_DISTANCE_THRESHOLD then
            v52 = 0.5;
        end;
        v49:SetCameraToSubjectDistance(v52);
    end;
    return l_ZoomController_0.GetZoomRadius();
end;
v17.GetSubjectPosition = function(v53) --[[ Line: 357 ]] --[[ Name: GetSubjectPosition ]]
    local l_lastSubjectPosition_0 = v53.lastSubjectPosition;
    local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
    local v56 = l_CurrentCamera_3 and l_CurrentCamera_3.CameraSubject;
    if v56 then
        if v56:IsA("Humanoid") then
            local v57 = v56:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_1 = v56.CameraOffset;
            if v53:GetIsMouseLocked() then
                l_CameraOffset_1 = Vector3.new();
            end;
            local l_RootPart_4 = v56.RootPart;
            if v57 and v56.Parent and v56.Parent:IsA("Model") then
                l_RootPart_4 = v56.Parent:FindFirstChild("Head") or l_RootPart_4;
            end;
            if l_RootPart_4 and l_RootPart_4:IsA("BasePart") then
                local v60 = nil;
                if v56.RigType == Enum.HumanoidRigType.R15 then
                    if v56.AutomaticScalingEnabled then
                        v60 = Vector3.new(0, 1.5, 0, 0);
                        if l_RootPart_4 == v56.RootPart then
                            v60 = v60 + Vector3.new(0, v56.RootPart.Size.Y / 2 - Vector3.new(2, 2, 1, 0).Y / 2, 0);
                        end;
                    else
                        v60 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v60 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v57 then
                    v60 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectPosition_0 = l_RootPart_4.CFrame.p + l_RootPart_4.CFrame:vectorToWorldSpace(v60 + l_CameraOffset_1);
            end;
        elseif v56:IsA("VehicleSeat") then
            l_lastSubjectPosition_0 = v56.CFrame.p + v56.CFrame:vectorToWorldSpace((Vector3.new(0, 5, 0, 0)));
        elseif v56:IsA("SkateboardPlatform") then
            l_lastSubjectPosition_0 = v56.CFrame.p + Vector3.new(0, 5, 0, 0);
        elseif v56:IsA("BasePart") then
            l_lastSubjectPosition_0 = v56.CFrame.p;
        elseif v56:IsA("Model") then
            l_lastSubjectPosition_0 = if v56.PrimaryPart then v56:GetPrimaryPartCFrame().p else v56:GetModelCFrame().p;
        end;
        v53.lastSubject = v56;
        v53.lastSubjectPosition = l_lastSubjectPosition_0;
        return l_lastSubjectPosition_0;
    else
        return nil;
    end;
end;
if not l_status_0 then
    v17.OnViewportSizeChanged = function(v61) --[[ Line: 435 ]] --[[ Name: OnViewportSizeChanged ]]
        -- upvalues: l_UserInputService_0 (copy)
        local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
        v61.portraitMode = l_ViewportSize_0.X < l_ViewportSize_0.Y;
        v61.isSmallTouchScreen = l_UserInputService_0.TouchEnabled and (l_ViewportSize_0.Y < 500 or l_ViewportSize_0.X < 700);
    end;
end;
v17.OnCurrentCameraChanged = function(v63) --[[ Line: 444 ]] --[[ Name: OnCurrentCameraChanged ]]
    -- upvalues: l_status_0 (copy), l_UserInputService_0 (copy)
    if not l_status_0 and l_UserInputService_0.TouchEnabled then
        if v63.viewportSizeChangedConn then
            v63.viewportSizeChangedConn:Disconnect();
            v63.viewportSizeChangedConn = nil;
        end;
        local l_CurrentCamera_4 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_4 then
            v63:OnViewportSizeChanged();
            v63.viewportSizeChangedConn = l_CurrentCamera_4:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 456 ]]
                -- upvalues: v63 (copy)
                v63:OnViewportSizeChanged();
            end);
        end;
    end;
    if v63.cameraSubjectChangedConn then
        v63.cameraSubjectChangedConn:Disconnect();
        v63.cameraSubjectChangedConn = nil;
    end;
    local l_CurrentCamera_5 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_5 then
        v63.cameraSubjectChangedConn = l_CurrentCamera_5:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 471 ]]
            -- upvalues: v63 (copy)
            v63:OnNewCameraSubject();
        end);
        v63:OnNewCameraSubject();
    end;
end;
v17.OnPlayerCameraPropertyChange = function(v66) --[[ Line: 478 ]] --[[ Name: OnPlayerCameraPropertyChange ]]
    v66:SetCameraToSubjectDistance(v66.currentSubjectDistance);
end;
v17.InputTranslationToCameraAngleChange = function(_, v68, v69) --[[ Line: 483 ]] --[[ Name: InputTranslationToCameraAngleChange ]]
    return v68 * v69;
end;
v17.GamepadZoomPress = function(v70) --[[ Line: 489 ]] --[[ Name: GamepadZoomPress ]]
    -- upvalues: l_LocalPlayer_0 (copy), v13 (ref)
    local l_v70_CameraToSubjectDistance_0 = v70:GetCameraToSubjectDistance();
    local l_CameraMaxZoomDistance_0 = l_LocalPlayer_0.CameraMaxZoomDistance;
    for v73 = #v70.gamepadZoomLevels, 1, -1 do
        local v74 = v70.gamepadZoomLevels[v73];
        if l_CameraMaxZoomDistance_0 >= v74 then
            if v74 < l_LocalPlayer_0.CameraMinZoomDistance then
                v74 = l_LocalPlayer_0.CameraMinZoomDistance;
                if v13 and l_CameraMaxZoomDistance_0 == v74 then
                    break;
                end;
            end;
            if v13 or l_CameraMaxZoomDistance_0 ~= v74 then
                if v74 + (l_CameraMaxZoomDistance_0 - v74) / 2 < l_v70_CameraToSubjectDistance_0 then
                    v70:SetCameraToSubjectDistance(v74);
                    return;
                else
                    l_CameraMaxZoomDistance_0 = v74;
                end;
            else
                break;
            end;
        end;
    end;
    v70:SetCameraToSubjectDistance(v70.gamepadZoomLevels[#v70.gamepadZoomLevels]);
end;
v17.Enable = function(v75, v76) --[[ Line: 534 ]] --[[ Name: Enable ]]
    if v75.enabled ~= v76 then
        v75.enabled = v76;
        v75:OnEnabledChanged();
    end;
end;
v17.OnEnabledChanged = function(v77) --[[ Line: 542 ]] --[[ Name: OnEnabledChanged ]]
    -- upvalues: l_CameraInput_0 (copy), l_LocalPlayer_0 (copy)
    if v77.enabled then
        v77:_setUpConfigurations();
        l_CameraInput_0.setInputEnabled(true);
        v77.gamepadZoomPressConnection = l_CameraInput_0.gamepadZoomPress:Connect(function() --[[ Line: 548 ]]
            -- upvalues: v77 (copy)
            v77:GamepadZoomPress();
        end);
        if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
            v77.currentSubjectDistance = 0.5;
            if not v77.inFirstPerson then
                v77:EnterFirstPerson();
            end;
        end;
        if v77.cameraChangedConn then
            v77.cameraChangedConn:Disconnect();
            v77.cameraChangedConn = nil;
        end;
        v77.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 560 ]]
            -- upvalues: v77 (copy)
            v77:OnCurrentCameraChanged();
        end);
        v77:OnCurrentCameraChanged();
        return;
    else
        v77._connections:disconnectAll();
        l_CameraInput_0.setInputEnabled(false);
        if v77.gamepadZoomPressConnection then
            v77.gamepadZoomPressConnection:Disconnect();
            v77.gamepadZoomPressConnection = nil;
        end;
        v77:Cleanup();
        return;
    end;
end;
v17.GetEnabled = function(v78) --[[ Line: 578 ]] --[[ Name: GetEnabled ]]
    return v78.enabled;
end;
v17.Cleanup = function(v79) --[[ Line: 582 ]] --[[ Name: Cleanup ]]
    -- upvalues: l_status_0 (copy), l_CameraUtils_0 (copy)
    if v79.subjectStateChangedConn then
        v79.subjectStateChangedConn:Disconnect();
        v79.subjectStateChangedConn = nil;
    end;
    if not l_status_0 and v79.viewportSizeChangedConn then
        v79.viewportSizeChangedConn:Disconnect();
        v79.viewportSizeChangedConn = nil;
    end;
    if v79.cameraChangedConn then
        v79.cameraChangedConn:Disconnect();
        v79.cameraChangedConn = nil;
    end;
    v79.lastCameraTransform = nil;
    v79.lastSubjectCFrame = nil;
    l_CameraUtils_0.restoreMouseBehavior();
end;
v17.UpdateMouseBehavior = function(v80) --[[ Line: 605 ]] --[[ Name: UpdateMouseBehavior ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_CameraUI_0 (copy), l_CameraInput_0 (copy), l_CameraToggleStateController_0 (copy), l_CameraUtils_0 (copy)
    local v81 = l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    if v80.isCameraToggle and v81 == false then
        l_CameraUI_0.setCameraModeToastEnabled(true);
        l_CameraInput_0.enableCameraToggleInput();
        l_CameraToggleStateController_0(v80.inFirstPerson);
        return;
    else
        l_CameraUI_0.setCameraModeToastEnabled(false);
        l_CameraInput_0.disableCameraToggleInput();
        if v80.inFirstPerson or v80.inMouseLockedMode then
            l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.CameraRelative);
            l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
            return;
        else
            l_CameraUtils_0.restoreRotationType();
            if l_CameraInput_0.getRotationActivated() then
                l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
                return;
            else
                l_CameraUtils_0.restoreMouseBehavior();
                return;
            end;
        end;
    end;
end;
v17.UpdateForDistancePropertyChange = function(v82) --[[ Line: 633 ]] --[[ Name: UpdateForDistancePropertyChange ]]
    v82:SetCameraToSubjectDistance(v82.currentSubjectDistance);
end;
v17.SetCameraToSubjectDistance = function(v83, v84) --[[ Line: 639 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_1 = v83.currentSubjectDistance;
    if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
        v83.currentSubjectDistance = 0.5;
        if not v83.inFirstPerson then
            v83:EnterFirstPerson();
        end;
    else
        local v86 = math.clamp(v84, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
        if v86 < 1 then
            v83.currentSubjectDistance = 0.5;
            if not v83.inFirstPerson then
                v83:EnterFirstPerson();
            end;
        else
            v83.currentSubjectDistance = v86;
            if v83.inFirstPerson then
                v83:LeaveFirstPerson();
            end;
        end;
    end;
    l_ZoomController_0.SetZoomParameters(v83.currentSubjectDistance, (math.sign(v84 - l_currentSubjectDistance_1)));
    return v83.currentSubjectDistance;
end;
v17.SetCameraType = function(v87, v88) --[[ Line: 673 ]] --[[ Name: SetCameraType ]]
    v87.cameraType = v88;
end;
v17.GetCameraType = function(v89) --[[ Line: 678 ]] --[[ Name: GetCameraType ]]
    return v89.cameraType;
end;
v17.SetCameraMovementMode = function(v90, v91) --[[ Line: 683 ]] --[[ Name: SetCameraMovementMode ]]
    v90.cameraMovementMode = v91;
end;
v17.GetCameraMovementMode = function(v92) --[[ Line: 687 ]] --[[ Name: GetCameraMovementMode ]]
    return v92.cameraMovementMode;
end;
v17.SetIsMouseLocked = function(v93, v94) --[[ Line: 691 ]] --[[ Name: SetIsMouseLocked ]]
    v93.inMouseLockedMode = v94;
end;
v17.GetIsMouseLocked = function(v95) --[[ Line: 695 ]] --[[ Name: GetIsMouseLocked ]]
    return v95.inMouseLockedMode;
end;
v17.SetMouseLockOffset = function(v96, v97) --[[ Line: 699 ]] --[[ Name: SetMouseLockOffset ]]
    v96.mouseLockOffset = v97;
end;
v17.GetMouseLockOffset = function(v98) --[[ Line: 703 ]] --[[ Name: GetMouseLockOffset ]]
    return v98.mouseLockOffset;
end;
v17.InFirstPerson = function(v99) --[[ Line: 707 ]] --[[ Name: InFirstPerson ]]
    return v99.inFirstPerson;
end;
v17.EnterFirstPerson = function(v100) --[[ Line: 711 ]] --[[ Name: EnterFirstPerson ]]
    v100.inFirstPerson = true;
    v100:UpdateMouseBehavior();
end;
v17.LeaveFirstPerson = function(v101) --[[ Line: 716 ]] --[[ Name: LeaveFirstPerson ]]
    v101.inFirstPerson = false;
    v101:UpdateMouseBehavior();
end;
v17.GetCameraToSubjectDistance = function(v102) --[[ Line: 722 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v102.currentSubjectDistance;
end;
v17.GetMeasuredDistanceToFocus = function(_) --[[ Line: 729 ]] --[[ Name: GetMeasuredDistanceToFocus ]]
    local l_CurrentCamera_6 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_6 then
        return (l_CurrentCamera_6.CoordinateFrame.p - l_CurrentCamera_6.Focus.p).magnitude;
    else
        return nil;
    end;
end;
v17.GetCameraLookVector = function(_) --[[ Line: 737 ]] --[[ Name: GetCameraLookVector ]]
    return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1, 0);
end;
v17.CalculateNewLookCFrameFromArg = function(v106, v107, v108) --[[ Line: 741 ]] --[[ Name: CalculateNewLookCFrameFromArg ]]
    local v109 = v107 or v106:GetCameraLookVector();
    local v110 = math.asin(v109.Y);
    local v111 = math.clamp(v108.Y, v110 + -1.3962634015954636, v110 + 1.3962634015954636);
    local v112 = Vector2.new(v108.X, v111);
    local v113 = CFrame.new(Vector3.new(0, 0, 0, 0), v109);
    return CFrame.Angles(0, -v112.X, 0) * v113 * CFrame.Angles(-v112.Y, 0, 0);
end;
v17.CalculateNewLookVectorFromArg = function(v114, v115, v116) --[[ Line: 751 ]] --[[ Name: CalculateNewLookVectorFromArg ]]
    return v114:CalculateNewLookCFrameFromArg(v115, v116).LookVector;
end;
v17.CalculateNewLookVectorVRFromArg = function(v117, v118) --[[ Line: 756 ]] --[[ Name: CalculateNewLookVectorVRFromArg ]]
    local l_unit_0 = ((v117:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1, 0)).unit;
    local v120 = Vector2.new(v118.X, 0);
    local v121 = CFrame.new(Vector3.new(0, 0, 0, 0), l_unit_0);
    return ((CFrame.Angles(0, -v120.X, 0) * v121 * CFrame.Angles(-v120.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1, 0)).unit;
end;
v17.GetHumanoid = function(v122) --[[ Line: 766 ]] --[[ Name: GetHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v123 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    if v123 then
        local v124 = v122.humanoidCache[l_LocalPlayer_0];
        if v124 and v124.Parent == v123 then
            return v124;
        else
            v122.humanoidCache[l_LocalPlayer_0] = nil;
            local l_Humanoid_1 = v123:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_1 then
                v122.humanoidCache[l_LocalPlayer_0] = l_Humanoid_1;
            end;
            return l_Humanoid_1;
        end;
    else
        return nil;
    end;
end;
v17.GetHumanoidPartToFollow = function(_, v127, v128) --[[ Line: 784 ]] --[[ Name: GetHumanoidPartToFollow ]]
    if v128 == Enum.HumanoidStateType.Dead then
        local l_Parent_1 = v127.Parent;
        if l_Parent_1 then
            return l_Parent_1:FindFirstChild("Head") or v127.Torso;
        else
            return v127.Torso;
        end;
    else
        return v127.Torso;
    end;
end;
v17.OnNewCameraSubject = function(v130) --[[ Line: 798 ]] --[[ Name: OnNewCameraSubject ]]
    if v130.subjectStateChangedConn then
        v130.subjectStateChangedConn:Disconnect();
        v130.subjectStateChangedConn = nil;
    end;
end;
v17.IsInFirstPerson = function(v131) --[[ Line: 805 ]] --[[ Name: IsInFirstPerson ]]
    return v131.inFirstPerson;
end;
v17.Update = function(_, _) --[[ Line: 809 ]] --[[ Name: Update ]]
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
v17.GetCameraHeight = function(v134) --[[ Line: 813 ]] --[[ Name: GetCameraHeight ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled and not v134.inFirstPerson then
        return 0.25881904510252074 * v134.currentSubjectDistance;
    else
        return 0;
    end;
end;
return v17;