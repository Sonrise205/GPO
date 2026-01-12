local v0 = {};
v0.__index = v0;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local l_CommonUtils_0 = script.Parent:WaitForChild("CommonUtils");
local l_Keyboard_0 = require(script:WaitForChild("Keyboard"));
local l_Gamepad_0 = require(script:WaitForChild("Gamepad"));
local l_DynamicThumbstick_0 = require(script:WaitForChild("DynamicThumbstick"));
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v13 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate");
end);
v13 = l_status_0 and l_result_0;
l_status_0 = l_FlagUtil_0.getUserFlag("UserPreferredInputPlayerScripts2");
l_result_0 = l_FlagUtil_0.getUserFlag("UserPSRemoveTouchEnabled");
local l_TouchThumbstick_0 = require(script:WaitForChild("TouchThumbstick"));
local l_ClickToMoveController_0 = require(script:WaitForChild("ClickToMoveController"));
local l_TouchJump_0 = require(script:WaitForChild("TouchJump"));
local l_VehicleController_0 = require(script:WaitForChild("VehicleController"));
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local v21 = {
    [Enum.TouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbstick] = l_TouchThumbstick_0, 
    [Enum.DevTouchMovementMode.Thumbstick] = l_TouchThumbstick_0, 
    [Enum.TouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.ClickToMove] = l_ClickToMoveController_0, 
    [Enum.DevTouchMovementMode.ClickToMove] = l_ClickToMoveController_0, 
    [Enum.TouchMovementMode.Default] = l_DynamicThumbstick_0, 
    [Enum.ComputerMovementMode.Default] = l_Keyboard_0, 
    [Enum.ComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.Scriptable] = nil, 
    [Enum.ComputerMovementMode.ClickToMove] = l_ClickToMoveController_0, 
    [Enum.DevComputerMovementMode.ClickToMove] = l_ClickToMoveController_0
};
local v22 = {
    [Enum.UserInputType.Keyboard] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton1] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton2] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton3] = l_Keyboard_0, 
    [Enum.UserInputType.MouseWheel] = l_Keyboard_0, 
    [Enum.UserInputType.MouseMovement] = l_Keyboard_0, 
    [Enum.UserInputType.Gamepad1] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad2] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad3] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad4] = l_Gamepad_0
};
local v23 = nil;
v0.new = function() --[[ Line: 106 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), l_status_0 (copy), l_VehicleController_0 (copy), l_Value_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), l_GuiService_0 (copy)
    local v24 = setmetatable({}, v0);
    v24.controllers = {};
    v24.activeControlModule = nil;
    v24.activeController = nil;
    v24.touchJumpController = nil;
    v24.moveFunction = l_Players_0.LocalPlayer.Move;
    v24.humanoid = nil;
    if not l_status_0 then
        v24.lastInputType = Enum.UserInputType.None;
    end;
    v24.controlsEnabled = true;
    v24.humanoidSeatedConn = nil;
    v24.vehicleController = nil;
    v24.touchControlFrame = nil;
    v24.currentTorsoAngle = 0;
    v24.inputMoveVector = Vector3.new(0, 0, 0, 0);
    v24.vehicleController = l_VehicleController_0.new(l_Value_0);
    l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v25) --[[ Line: 134 ]]
        -- upvalues: v24 (copy)
        v24:OnCharacterAdded(v25);
    end);
    l_Players_0.LocalPlayer.CharacterRemoving:Connect(function(v26) --[[ Line: 135 ]]
        -- upvalues: v24 (copy)
        v24:OnCharacterRemoving(v26);
    end);
    if l_Players_0.LocalPlayer.Character then
        v24:OnCharacterAdded(l_Players_0.LocalPlayer.Character);
    end;
    l_RunService_0:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(v27) --[[ Line: 140 ]]
        -- upvalues: v24 (copy)
        v24:OnRenderStepped(v27);
    end);
    if not l_status_0 then
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v28) --[[ Line: 145 ]]
            -- upvalues: v24 (copy)
            v24:OnLastInputTypeChanged(v28);
        end);
    end;
    l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 150 ]]
        -- upvalues: l_status_0 (ref), v24 (copy)
        if l_status_0 then
            v24:UpdateMovementMode();
            return;
        else
            v24:OnTouchMovementModeChange();
            return;
        end;
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 157 ]]
        -- upvalues: l_status_0 (ref), v24 (copy)
        if l_status_0 then
            v24:UpdateMovementMode();
            return;
        else
            v24:OnTouchMovementModeChange();
            return;
        end;
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 165 ]]
        -- upvalues: l_status_0 (ref), v24 (copy)
        if l_status_0 then
            v24:UpdateMovementMode();
            return;
        else
            v24:OnComputerMovementModeChange();
            return;
        end;
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 172 ]]
        -- upvalues: l_status_0 (ref), v24 (copy)
        if l_status_0 then
            v24:UpdateMovementMode();
            return;
        else
            v24:OnComputerMovementModeChange();
            return;
        end;
    end);
    v24.playerGui = nil;
    v24.touchGui = nil;
    v24.playerGuiAddedConn = nil;
    l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 185 ]]
        -- upvalues: l_status_0 (ref), v24 (copy)
        if l_status_0 then
            v24:UpdateMovementMode();
        else
            v24:UpdateTouchGuiVisibility();
        end;
        v24:UpdateActiveControlModuleEnabled();
    end);
    if l_status_0 then
        l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 195 ]]
            -- upvalues: v24 (copy)
            v24:UpdateMovementMode();
        end);
        v24.playerGui = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if not v24.playerGui then
            v24.playerGuiAddedConn = l_Players_0.LocalPlayer.ChildAdded:Connect(function(v29) --[[ Line: 201 ]]
                -- upvalues: v24 (copy)
                if v29:IsA("PlayerGui") then
                    v24.playerGui = v29;
                    v24.playerGuiAddedConn:Disconnect();
                    v24.playerGuiAddedConn = nil;
                    v24:UpdateMovementMode();
                end;
            end);
        end;
        v24:UpdateMovementMode();
        return v24;
    elseif l_UserInputService_0.TouchEnabled then
        v24.playerGui = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if v24.playerGui then
            v24:CreateTouchGuiContainer();
            v24:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
            return v24;
        else
            v24.playerGuiAddedConn = l_Players_0.LocalPlayer.ChildAdded:Connect(function(v30) --[[ Line: 219 ]]
                -- upvalues: v24 (copy), l_UserInputService_0 (ref)
                if v30:IsA("PlayerGui") then
                    v24.playerGui = v30;
                    v24:CreateTouchGuiContainer();
                    v24.playerGuiAddedConn:Disconnect();
                    v24.playerGuiAddedConn = nil;
                    v24:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
                end;
            end);
            return v24;
        end;
    else
        v24:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
        return v24;
    end;
end;
v0.GetMoveVector = function(v31) --[[ Line: 240 ]] --[[ Name: GetMoveVector ]]
    if v31.activeController then
        return v31.activeController:GetMoveVector();
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
local function _(v32) --[[ Line: 247 ]] --[[ Name: NormalizeAngle ]]
    v32 = (v32 + 12.566370614359172) % 6.283185307179586;
    if v32 > 3.141592653589793 then
        v32 = v32 - 6.283185307179586;
    end;
    return v32;
end;
local function _(v34, v35) --[[ Line: 255 ]] --[[ Name: AverageAngle ]]
    local v36 = (v35 - v34 + 12.566370614359172) % 6.283185307179586;
    if v36 > 3.141592653589793 then
        v36 = v36 - 6.283185307179586;
    end;
    local v37 = (v34 + v36 / 2 + 12.566370614359172) % 6.283185307179586;
    if v37 > 3.141592653589793 then
        v37 = v37 - 6.283185307179586;
    end;
    return v37;
end;
v0.GetEstimatedVRTorsoFrame = function(v39) --[[ Line: 260 ]] --[[ Name: GetEstimatedVRTorsoFrame ]]
    -- upvalues: l_VRService_0 (copy)
    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local _, v42, _ = l_l_VRService_0_UserCFrame_0:ToEulerAnglesYXZ();
    v42 = -v42;
    if not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v39.currentTorsoAngle = v42;
    else
        local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local l_l_VRService_0_UserCFrame_2 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
        local v46 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_1.Position;
        local v47 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_2.Position;
        local v48 = -math.atan2(v46.X, v46.Z);
        local v49 = (-math.atan2(v47.X, v47.Z) - v48 + 12.566370614359172) % 6.283185307179586;
        if v49 > 3.141592653589793 then
            v49 = v49 - 6.283185307179586;
        end;
        v49 = (v48 + v49 / 2 + 12.566370614359172) % 6.283185307179586;
        if v49 > 3.141592653589793 then
            v49 = v49 - 6.283185307179586;
        end;
        local l_v49_0 = v49;
        v49 = (v42 - v39.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v49 > 3.141592653589793 then
            v49 = v49 - 6.283185307179586;
        end;
        local l_v49_1 = v49;
        local v52 = (l_v49_0 - v39.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v52 > 3.141592653589793 then
            v52 = v52 - 6.283185307179586;
        end;
        v49 = v52;
        v52 = false;
        if v49 > -1.5707963267948966 then
            v52 = v49 < 1.5707963267948966;
        end;
        if not v52 then
            v49 = l_v49_1;
        end;
        local v53 = math.min(v49, l_v49_1);
        local v54 = math.max(v49, l_v49_1);
        local v55 = 0;
        if v53 > 0 then
            v55 = v53;
        elseif v54 < 0 then
            v55 = v54;
        end;
        v39.currentTorsoAngle = v55 + v39.currentTorsoAngle;
    end;
    return CFrame.new(l_l_VRService_0_UserCFrame_0.Position) * CFrame.fromEulerAnglesYXZ(0, -v39.currentTorsoAngle, 0);
end;
v0.GetActiveController = function(v56) --[[ Line: 304 ]] --[[ Name: GetActiveController ]]
    return v56.activeController;
end;
v0.UpdateActiveControlModuleEnabled = function(v57) --[[ Line: 309 ]] --[[ Name: UpdateActiveControlModuleEnabled ]]
    -- upvalues: l_Players_0 (copy), l_status_0 (copy), l_UserInputService_0 (copy), l_ClickToMoveController_0 (copy), l_TouchThumbstick_0 (copy), l_DynamicThumbstick_0 (copy), l_TouchJump_0 (copy), l_GuiService_0 (copy)
    local function _() --[[ Line: 311 ]]
        -- upvalues: v57 (copy), l_Players_0 (ref)
        v57.activeController:Enable(false);
        if v57.touchJumpController then
            v57.touchJumpController:Enable(false);
        end;
        if v57.moveFunction then
            v57.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
    end;
    local function v59() --[[ Line: 322 ]]
        -- upvalues: v57 (copy), l_status_0 (ref), l_UserInputService_0 (ref), l_ClickToMoveController_0 (ref), l_TouchThumbstick_0 (ref), l_DynamicThumbstick_0 (ref), l_TouchJump_0 (ref), l_Players_0 (ref)
        if v57.touchControlFrame and (not l_status_0 or l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) and (v57.activeControlModule == l_ClickToMoveController_0 or v57.activeControlModule == l_TouchThumbstick_0 or v57.activeControlModule == l_DynamicThumbstick_0) then
            if not v57.controllers[l_TouchJump_0] then
                v57.controllers[l_TouchJump_0] = l_TouchJump_0.new();
            end;
            v57.touchJumpController = v57.controllers[l_TouchJump_0];
            v57.touchJumpController:Enable(true, v57.touchControlFrame);
        elseif v57.touchJumpController then
            v57.touchJumpController:Enable(false);
        end;
        if v57.activeControlModule == l_ClickToMoveController_0 then
            v57.activeController:Enable(true, l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, v57.touchJumpController);
            return;
        elseif v57.touchControlFrame then
            v57.activeController:Enable(true, v57.touchControlFrame);
            return;
        else
            v57.activeController:Enable(true);
            return;
        end;
    end;
    if not v57.activeController then
        return;
    elseif not v57.controlsEnabled then
        v57.activeController:Enable(false);
        if v57.touchJumpController then
            v57.touchJumpController:Enable(false);
        end;
        if v57.moveFunction then
            v57.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    else
        local v60 = nil;
        v60 = if l_status_0 then l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch else l_UserInputService_0.TouchEnabled;
        if not l_GuiService_0.TouchControlsEnabled and v60 and (v57.activeControlModule == l_ClickToMoveController_0 or v57.activeControlModule == l_TouchThumbstick_0 or v57.activeControlModule == l_DynamicThumbstick_0) then
            v57.activeController:Enable(false);
            if v57.touchJumpController then
                v57.touchJumpController:Enable(false);
            end;
            if v57.moveFunction then
                v57.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
            end;
            return;
        else
            v59();
            return;
        end;
    end;
end;
v0.Enable = function(v61, v62) --[[ Line: 388 ]] --[[ Name: Enable ]]
    if v62 == nil then
        v62 = true;
    end;
    if v61.controlsEnabled == v62 then
        return;
    else
        v61.controlsEnabled = v62;
        if not v61.activeController then
            return;
        else
            v61:UpdateActiveControlModuleEnabled();
            return;
        end;
    end;
end;
v0.Disable = function(v63) --[[ Line: 403 ]] --[[ Name: Disable ]]
    v63:Enable(false);
end;
v0.SelectComputerMovementModule = function(_) --[[ Line: 409 ]] --[[ Name: SelectComputerMovementModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), l_status_0 (copy), l_Gamepad_0 (copy), l_Keyboard_0 (copy), v22 (copy), v23 (ref), l_UserGameSettings_0 (copy), l_ClickToMoveController_0 (copy), v21 (copy)
    if not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.GamepadEnabled then
        return nil, false;
    else
        local v65 = nil;
        local l_DevComputerMovementMode_0 = l_Players_0.LocalPlayer.DevComputerMovementMode;
        if l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.UserChoice then
            if l_status_0 then
                if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad then
                    v65 = l_Gamepad_0;
                elseif l_UserInputService_0.PreferredInput == Enum.PreferredInput.KeyboardAndMouse then
                    v65 = l_Keyboard_0;
                end;
            else
                v65 = v22[v23];
            end;
            if l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v65 == l_Keyboard_0 then
                v65 = l_ClickToMoveController_0;
            end;
        else
            v65 = v21[l_DevComputerMovementMode_0];
            if not v65 and l_DevComputerMovementMode_0 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", l_DevComputerMovementMode_0);
            end;
        end;
        if v65 then
            return v65, true;
        elseif l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true;
        else
            return nil, false;
        end;
    end;
end;
v0.SelectTouchModule = function(_) --[[ Line: 456 ]] --[[ Name: SelectTouchModule ]]
    -- upvalues: l_result_0 (copy), l_UserInputService_0 (copy), l_Players_0 (copy), v21 (copy), l_UserGameSettings_0 (copy)
    if not l_result_0 and not l_UserInputService_0.TouchEnabled then
        return nil, false;
    else
        local v68 = nil;
        local l_DevTouchMovementMode_0 = l_Players_0.LocalPlayer.DevTouchMovementMode;
        if l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.UserChoice then
            v68 = v21[l_UserGameSettings_0.TouchMovementMode];
        elseif l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true;
        else
            v68 = v21[l_DevTouchMovementMode_0];
        end;
        return v68, true;
    end;
end;
local function v73() --[[ Line: 474 ]] --[[ Name: getGamepadRightThumbstickPosition ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1);
    for _, v72 in pairs(l_l_UserInputService_0_GamepadState_0) do
        if v72.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v72.Position;
        end;
    end;
    return (Vector3.new(0, 0, 0, 0));
end;
v0.calculateRawMoveVector = function(v74, v75, v76) --[[ Line: 484 ]] --[[ Name: calculateRawMoveVector ]]
    -- upvalues: l_Workspace_0 (copy), l_VRService_0 (copy), v73 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v76;
    else
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        if l_VRService_0.VREnabled and v75.RootPart then
            local l_l_VRService_0_UserCFrame_3 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            l_l_VRService_0_UserCFrame_3 = v74:GetEstimatedVRTorsoFrame();
            l_CFrame_0 = if (l_CurrentCamera_0.Focus.Position - l_CFrame_0.Position).Magnitude < 3 then l_CFrame_0 * l_l_VRService_0_UserCFrame_3 else l_CurrentCamera_0.CFrame * (l_l_VRService_0_UserCFrame_3.Rotation + l_l_VRService_0_UserCFrame_3.Position * l_CurrentCamera_0.HeadScale);
        end;
        if v75:GetState() == Enum.HumanoidStateType.Swimming then
            if l_VRService_0.VREnabled then
                v76 = Vector3.new(v76.X, 0, v76.Z);
                if v76.Magnitude < 0.01 then
                    return (Vector3.new(0, 0, 0, 0));
                else
                    local v80 = -v73().Y * 1.3962634015954636;
                    local v81 = math.atan2(-v76.X, -v76.Z);
                    local _, v83, _ = l_CFrame_0:ToEulerAnglesYXZ();
                    v81 = v81 + v83;
                    return CFrame.fromEulerAnglesYXZ(v80, v81, 0).LookVector;
                end;
            else
                return l_CFrame_0:VectorToWorldSpace(v76);
            end;
        else
            local v85 = nil;
            local v86 = nil;
            local _, _, _, v90, v91, v92, _, _, v95, _, _, v98 = l_CFrame_0:GetComponents();
            if v95 < 1 and v95 > -1 then
                v85 = v98;
                v86 = v92;
            else
                v85 = v90;
                v86 = -v91 * math.sign(v95);
            end;
            local v99 = math.sqrt(v85 * v85 + v86 * v86);
            return (Vector3.new((v85 * v76.X + v86 * v76.Z) / v99, 0, (v85 * v76.Z - v86 * v76.X) / v99));
        end;
    end;
end;
v0.OnRenderStepped = function(v100, v101) --[[ Line: 543 ]] --[[ Name: OnRenderStepped ]]
    -- upvalues: l_Gamepad_0 (copy), l_VRService_0 (copy), l_Players_0 (copy)
    if v100.activeController and v100.activeController.enabled and v100.humanoid then
        local l_MoveVector_0 = v100.activeController:GetMoveVector();
        local v103 = v100.activeController:IsMoveVectorCameraRelative();
        local l_v100_ClickToMoveController_0 = v100:GetClickToMoveController();
        if v100.activeController == l_v100_ClickToMoveController_0 then
            l_v100_ClickToMoveController_0:OnRenderStepped(v101);
        elseif l_MoveVector_0.magnitude > 0 then
            l_v100_ClickToMoveController_0:CleanupPath();
        else
            l_v100_ClickToMoveController_0:OnRenderStepped(v101);
            l_MoveVector_0 = l_v100_ClickToMoveController_0:GetMoveVector();
            v103 = l_v100_ClickToMoveController_0:IsMoveVectorCameraRelative();
        end;
        local v105 = false;
        if v100.vehicleController then
            local v106, v107 = v100.vehicleController:Update(l_MoveVector_0, v103, v100.activeControlModule == l_Gamepad_0);
            l_MoveVector_0 = v106;
            v105 = v107;
        end;
        if v103 then
            l_MoveVector_0 = v100:calculateRawMoveVector(v100.humanoid, l_MoveVector_0);
        end;
        v100.inputMoveVector = l_MoveVector_0;
        if l_VRService_0.VREnabled then
            l_MoveVector_0 = v100:updateVRMoveVector(l_MoveVector_0);
        end;
        v100.moveFunction(l_Players_0.LocalPlayer, l_MoveVector_0, false);
        v100.humanoid.Jump = v100.activeController:GetIsJumping() or v100.touchJumpController and v100.touchJumpController:GetIsJumping();
    end;
end;
v0.updateVRMoveVector = function(v108, v109) --[[ Line: 592 ]] --[[ Name: updateVRMoveVector ]]
    -- upvalues: l_VRService_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v111 = l_CurrentCamera_1.Focus.Position - l_CurrentCamera_1.CFrame.Position;
    local v112 = false;
    if v111.Magnitude < 5 then
        v112 = true;
    end;
    if v109.Magnitude == 0 and v112 and l_VRService_0.AvatarGestures and v108.humanoid and not v108.humanoid.Sit then
        local l_l_VRService_0_UserCFrame_4 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        l_l_VRService_0_UserCFrame_4 = l_l_VRService_0_UserCFrame_4.Rotation + l_l_VRService_0_UserCFrame_4.Position * l_CurrentCamera_1.HeadScale;
        local v114 = -0.7 * v108.humanoid.RootPart.Size.Y / 2;
        local v115 = (l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_4 * CFrame.new(0, v114, 0)).Position - v108.humanoid.RootPart.CFrame.Position;
        return (Vector3.new(v115.x, 0, v115.z));
    else
        return v109;
    end;
end;
v0.OnHumanoidSeated = function(v116, v117, v118) --[[ Line: 617 ]] --[[ Name: OnHumanoidSeated ]]
    -- upvalues: l_Value_0 (copy)
    if v117 then
        if v118 and v118:IsA("VehicleSeat") then
            if not v116.vehicleController then
                v116.vehicleController = v116.vehicleController.new(l_Value_0);
            end;
            v116.vehicleController:Enable(true, v118);
            return;
        end;
    elseif v116.vehicleController then
        v116.vehicleController:Enable(false, v118);
    end;
end;
v0.OnCharacterAdded = function(v119, v120) --[[ Line: 632 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_status_0 (copy)
    v119.humanoid = v120:FindFirstChildOfClass("Humanoid");
    while not v119.humanoid do
        v120.ChildAdded:wait();
        v119.humanoid = v120:FindFirstChildOfClass("Humanoid");
    end;
    if not l_status_0 then
        v119:UpdateTouchGuiVisibility();
    end;
    if v119.humanoidSeatedConn then
        v119.humanoidSeatedConn:Disconnect();
        v119.humanoidSeatedConn = nil;
    end;
    v119.humanoidSeatedConn = v119.humanoid.Seated:Connect(function(v121, v122) --[[ Line: 647 ]]
        -- upvalues: v119 (copy)
        v119:OnHumanoidSeated(v121, v122);
    end);
    if l_status_0 then
        v119:UpdateMovementMode();
    end;
end;
v0.OnCharacterRemoving = function(v123, _) --[[ Line: 656 ]] --[[ Name: OnCharacterRemoving ]]
    -- upvalues: l_status_0 (copy)
    v123.humanoid = nil;
    if l_status_0 then
        v123:UpdateMovementMode();
        return;
    else
        v123:UpdateTouchGuiVisibility();
        return;
    end;
end;
v0.UpdateTouchGuiVisibility = function(v125) --[[ Line: 666 ]] --[[ Name: UpdateTouchGuiVisibility ]]
    -- upvalues: l_status_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local v126 = nil;
    if l_status_0 then
        v126 = v125.humanoid and l_GuiService_0.TouchControlsEnabled and l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
        if v126 and not v125.touchGui then
            v125:CreateTouchGuiContainer();
        end;
    else
        v126 = v125.humanoid and l_GuiService_0.TouchControlsEnabled;
    end;
    if v125.touchGui then
        v125.touchGui.Enabled = not not v126;
    end;
end;
v0.SwitchToController = function(v127, v128) --[[ Line: 690 ]] --[[ Name: SwitchToController ]]
    -- upvalues: l_Value_0 (copy)
    if not v128 then
        if v127.activeController then
            v127.activeController:Enable(false);
        end;
        v127.activeController = nil;
        v127.activeControlModule = nil;
        return;
    else
        if not v127.controllers[v128] then
            v127.controllers[v128] = v128.new(l_Value_0);
        end;
        if v127.activeController ~= v127.controllers[v128] then
            if v127.activeController then
                v127.activeController:Enable(false);
            end;
            v127.activeController = v127.controllers[v128];
            v127.activeControlModule = v128;
            v127:UpdateActiveControlModuleEnabled();
        end;
        return;
    end;
end;
v0.UpdateMovementMode = function(v129) --[[ Line: 729 ]] --[[ Name: UpdateMovementMode ]]
    -- upvalues: l_UserInputService_0 (copy)
    v129:UpdateTouchGuiVisibility();
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        local v130, v131 = v129:SelectTouchModule();
        if v131 and v129.touchControlFrame then
            v129:SwitchToController(v130);
            return;
        end;
    else
        v129:SwitchToController((v129:SelectComputerMovementModule()));
    end;
end;
v0.OnLastInputTypeChanged = function(v132, v133) --[[ Line: 746 ]] --[[ Name: OnLastInputTypeChanged ]]
    -- upvalues: v23 (ref), v22 (copy)
    if v23 == v133 then
        warn("LastInputType Change listener called with current type.");
    end;
    v23 = v133;
    if v23 == Enum.UserInputType.Touch then
        local v134, v135 = v132:SelectTouchModule();
        if v135 then
            while not v132.touchControlFrame do
                wait();
            end;
            v132:SwitchToController(v134);
        end;
    elseif v22[v23] ~= nil then
        local v136 = v132:SelectComputerMovementModule();
        if v136 then
            v132:SwitchToController(v136);
        end;
    end;
    v132:UpdateTouchGuiVisibility();
end;
v0.OnComputerMovementModeChange = function(v137) --[[ Line: 774 ]] --[[ Name: OnComputerMovementModeChange ]]
    local v138, v139 = v137:SelectComputerMovementModule();
    if v139 then
        v137:SwitchToController(v138);
    end;
end;
v0.OnTouchMovementModeChange = function(v140) --[[ Line: 782 ]] --[[ Name: OnTouchMovementModeChange ]]
    local v141, v142 = v140:SelectTouchModule();
    if v142 then
        while not v140.touchControlFrame do
            wait();
        end;
        v140:SwitchToController(v141);
    end;
end;
v0.CreateTouchGuiContainer = function(v143) --[[ Line: 792 ]] --[[ Name: CreateTouchGuiContainer ]]
    -- upvalues: l_status_0 (copy), v13 (ref)
    if l_status_0 and not v143.playerGui then
        return;
    else
        if v143.touchGui then
            v143.touchGui:Destroy();
        end;
        v143.touchGui = Instance.new("ScreenGui");
        v143.touchGui.Name = "TouchGui";
        v143.touchGui.ResetOnSpawn = false;
        v143.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        if not l_status_0 then
            v143:UpdateTouchGuiVisibility();
        end;
        if v13 then
            v143.touchGui.ClipToDeviceSafeArea = false;
        end;
        v143.touchControlFrame = Instance.new("Frame");
        v143.touchControlFrame.Name = "TouchControlFrame";
        v143.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
        v143.touchControlFrame.BackgroundTransparency = 1;
        v143.touchControlFrame.Parent = v143.touchGui;
        v143.touchGui.Parent = v143.playerGui;
        return;
    end;
end;
v0.GetClickToMoveController = function(v144) --[[ Line: 823 ]] --[[ Name: GetClickToMoveController ]]
    -- upvalues: l_ClickToMoveController_0 (copy), l_Value_0 (copy)
    if not v144.controllers[l_ClickToMoveController_0] then
        v144.controllers[l_ClickToMoveController_0] = l_ClickToMoveController_0.new(l_Value_0);
    end;
    return v144.controllers[l_ClickToMoveController_0];
end;
return v0.new();