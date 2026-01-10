local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v9 = l_FlagUtil_0.getUserFlag("UserCameraInputDt");
local v10 = l_FlagUtil_0.getUserFlag("UserPSSinkUnknownTouchEvents");
local v11 = l_FlagUtil_0.getUserFlag("UserPSTextboxResetCameraInput");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local v14 = Vector2.new(1, 0.77) * 0.06981317007977318;
local v15 = Vector2.new(1, 0.77) * 0.008726646259971648;
local v16 = Vector2.new(1, 0.77) * 0.12217304763960307;
local v17 = Vector2.new(1, 0.66) * 0.017453292519943295;
if v9 then
    v14 = v14 * 60;
end;
local v18 = nil;
local v19 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
v18 = l_BindableEvent_0.Event;
v19 = l_BindableEvent_1.Event;
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 20 -> 52 ]];
l_UserInputService_0.InputBegan:Connect(function(v23, v24) --[[ Line: 49 ]]
    -- upvalues: l_l_BindableEvent_0_0 (copy)
    if not v24 and v23.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_0_0:Fire();
    end;
end);
local l_l_BindableEvent_1_0 = l_BindableEvent_1 --[[ copy: 21 -> 53 ]];
l_UserInputService_0.InputEnded:Connect(function(v26, _) --[[ Line: 55 ]]
    -- upvalues: l_l_BindableEvent_1_0 (copy)
    if v26.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_1_0:Fire();
    end;
end);
l_BindableEvent_0 = nil;
l_BindableEvent_0 = function(v28) --[[ Line: 66 ]] --[[ Name: thumbstickCurve ]]
    local v29 = (math.exp((math.abs(v28) - 0.1) / 0.9 * 2) - 1) / 6.38905609893065;
    return math.sign(v28) * math.clamp(v29, 0, 1);
end;
l_BindableEvent_1 = function(v30) --[[ Line: 80 ]] --[[ Name: adjustTouchPitchSensitivity ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v30;
    else
        local v32 = l_CurrentCamera_0.CFrame:ToEulerAnglesYXZ();
        if v30.Y * v32 >= 0 then
            return v30;
        else
            local v33 = (1 - (math.abs(v32) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25;
            return Vector2.new(1, v33) * v30;
        end;
    end;
end;
local function v42(v34) --[[ Line: 106 ]] --[[ Name: isInDynamicThumbstickArea ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
    local v36 = l_PlayerGui_0 and l_PlayerGui_0:FindFirstChild("TouchGui");
    local v37 = v36 and v36:FindFirstChild("TouchControlFrame");
    local v38 = v37 and v37:FindFirstChild("DynamicThumbstickFrame");
    if not v38 then
        return false;
    elseif not v36.Enabled then
        return false;
    else
        local l_AbsolutePosition_0 = v38.AbsolutePosition;
        local v40 = l_AbsolutePosition_0 + v38.AbsoluteSize;
        local v41 = false;
        if v34.X >= l_AbsolutePosition_0.X then
            v41 = false;
            if v34.Y >= l_AbsolutePosition_0.Y then
                v41 = false;
                if v34.X <= v40.X then
                    v41 = v34.Y <= v40.Y;
                end;
            end;
        end;
        return v41;
    end;
end;
local v43 = 0.016666666666666666;
l_RunService_0.Stepped:Connect(function(_, v45) --[[ Line: 131 ]]
    -- upvalues: v43 (ref)
    v43 = v45;
end);
local v46 = {};
local v47 = {};
local v48 = 0;
do
    local l_v47_0, l_v48_0 = v47, v48;
    local function _() --[[ Line: 141 ]] --[[ Name: incPanInputCount ]]
        -- upvalues: l_v48_0 (ref)
        l_v48_0 = math.max(0, l_v48_0 + 1);
    end;
    local function _() --[[ Line: 145 ]] --[[ Name: decPanInputCount ]]
        -- upvalues: l_v48_0 (ref)
        l_v48_0 = math.max(0, l_v48_0 - 1);
    end;
    local function _() --[[ Line: 149 ]] --[[ Name: resetPanInputCount ]]
        -- upvalues: l_v48_0 (ref)
        l_v48_0 = 0;
    end;
    local v54 = {
        Thumbstick2 = Vector2.new()
    };
    local v55 = {
        Left = 0, 
        Right = 0, 
        I = 0, 
        O = 0
    };
    local v56 = {
        Movement = Vector2.new(), 
        Wheel = 0, 
        Pan = Vector2.new(), 
        Pinch = 0
    };
    local v57 = {
        Move = Vector2.new(), 
        Pinch = 0
    };
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    v46.gamepadZoomPress = l_BindableEvent_2.Event;
    local v59 = l_VRService_0.VREnabled and Instance.new("BindableEvent") or nil;
    if l_VRService_0.VREnabled then
        v46.gamepadReset = v59.Event;
    end;
    local l_v54_0 = v54 --[[ copy: 30 -> 54 ]];
    v46.getRotationActivated = function() --[[ Line: 182 ]] --[[ Name: getRotationActivated ]]
        -- upvalues: l_v48_0 (ref), l_v54_0 (copy)
        local v61 = true;
        if l_v48_0 <= 0 then
            v61 = l_v54_0.Thumbstick2.Magnitude > 0;
        end;
        return v61;
    end;
    v46.getRotation = function(v62, v63) --[[ Line: 186 ]] --[[ Name: getRotation ]]
        -- upvalues: l_UserGameSettings_0 (copy), v9 (copy), v55 (copy), v43 (ref), l_v54_0 (copy), v56 (copy), l_BindableEvent_1 (copy), v57 (copy), v14 (ref), v15 (copy), v16 (copy), v17 (copy)
        local v64 = Vector2.new(1, l_UserGameSettings_0:GetCameraYInvertValue());
        local v65 = nil;
        v65 = if v9 then Vector2.new(v55.Right - v55.Left, 0) * v62 else Vector2.new(v55.Right - v55.Left, 0) * v43;
        local v66 = l_v54_0.Thumbstick2 * l_UserGameSettings_0.GamepadCameraSensitivity;
        if v9 then
            v66 = v66 * v62;
        end;
        local l_Movement_0 = v56.Movement;
        local l_Pan_0 = v56.Pan;
        local v69 = l_BindableEvent_1(v57.Move);
        if v63 then
            v65 = Vector2.new();
        end;
        return (v65 * 2.0943951023931953 + v66 * v14 + l_Movement_0 * v15 + l_Pan_0 * v16 + v69 * v17) * v64;
    end;
    v46.getZoomDelta = function() --[[ Line: 220 ]] --[[ Name: getZoomDelta ]]
        -- upvalues: v55 (copy), v56 (copy), v57 (copy)
        local v70 = v55.O - v55.I;
        local v71 = -v56.Wheel + v56.Pinch;
        local v72 = -v57.Pinch;
        return v70 * 0.1 + v71 * 1 + v72 * 0.04;
    end;
    local function v77(_, _, v75) --[[ Line: 228 ]] --[[ Name: thumbstick ]]
        -- upvalues: l_v54_0 (copy), l_BindableEvent_0 (ref)
        local l_Position_0 = v75.Position;
        l_v54_0[v75.KeyCode.Name] = Vector2.new(l_BindableEvent_0(l_Position_0.X), -l_BindableEvent_0(l_Position_0.Y));
        return Enum.ContextActionResult.Pass;
    end;
    local function _(v78) --[[ Line: 234 ]] --[[ Name: mouseMovement ]]
        -- upvalues: v56 (copy)
        local l_Delta_0 = v78.Delta;
        v56.Movement = Vector2.new(l_Delta_0.X, l_Delta_0.Y);
    end;
    local _ = function(_, _, v83) --[[ Line: 239 ]] --[[ Name: mouseWheel ]]
        -- upvalues: v56 (copy)
        v56.Wheel = v83.Position.Z;
        return Enum.ContextActionResult.Pass;
    end;
    local function v88(_, v86, v87) --[[ Line: 244 ]] --[[ Name: keypress ]]
        -- upvalues: v55 (copy)
        v55[v87.KeyCode.Name] = v86 == Enum.UserInputState.Begin and 1 or 0;
    end;
    local function v92(_, v90, _) --[[ Line: 248 ]] --[[ Name: gamepadZoomPress ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if v90 == Enum.UserInputState.Begin then
            l_BindableEvent_2:Fire();
        end;
    end;
    local function v96(_, v94, _) --[[ Line: 254 ]] --[[ Name: gamepadReset ]]
        -- upvalues: v59 (copy)
        if v94 == Enum.UserInputState.Begin then
            v59:Fire();
        end;
    end;
    local function v101() --[[ Line: 260 ]] --[[ Name: resetInputDevices ]]
        -- upvalues: l_v54_0 (copy), v55 (copy), v56 (copy), v57 (copy), l_v48_0 (ref)
        for _, v98 in pairs({
            l_v54_0, 
            v55, 
            v56, 
            v57
        }) do
            for v99, v100 in pairs(v98) do
                if type(v100) == "boolean" then
                    v98[v99] = false;
                else
                    v98[v99] = v98[v99] * 0;
                end;
            end;
        end;
        l_v48_0 = 0;
    end;
    local v102 = nil;
    local v103 = nil;
    local v104 = nil;
    local v105 = nil;
    local v106 = {};
    local v107 = nil;
    local v108 = nil;
    do
        local l_v106_0, l_v107_0, l_v108_0 = v106, v107, v108;
        v102 = function(v112, v113) --[[ Line: 286 ]] --[[ Name: touchBegan ]]
            -- upvalues: l_v107_0 (ref), v42 (copy), l_v48_0 (ref), l_v106_0 (ref)
            assert(v112.UserInputType == Enum.UserInputType.Touch);
            assert(v112.UserInputState == Enum.UserInputState.Begin);
            if l_v107_0 == nil and v42(v112.Position) and not v113 then
                l_v107_0 = v112;
                return;
            else
                if not v113 then
                    l_v48_0 = math.max(0, l_v48_0 + 1);
                end;
                l_v106_0[v112] = v113;
                return;
            end;
        end;
        v104 = function(v114, _) --[[ Line: 306 ]] --[[ Name: touchEnded ]]
            -- upvalues: l_v107_0 (ref), l_v106_0 (ref), l_v108_0 (ref), l_v48_0 (ref)
            assert(v114.UserInputType == Enum.UserInputType.Touch);
            assert(v114.UserInputState == Enum.UserInputState.End);
            if v114 == l_v107_0 then
                l_v107_0 = nil;
            end;
            if l_v106_0[v114] == false then
                l_v108_0 = nil;
                l_v48_0 = math.max(0, l_v48_0 - 1);
            end;
            l_v106_0[v114] = nil;
        end;
        v103 = function(v116, v117) --[[ Line: 325 ]] --[[ Name: touchChanged ]]
            -- upvalues: l_v107_0 (ref), l_v106_0 (ref), v10 (copy), v57 (copy), l_v108_0 (ref)
            assert(v116.UserInputType == Enum.UserInputType.Touch);
            assert(v116.UserInputState == Enum.UserInputState.Change);
            if v116 == l_v107_0 then
                return;
            else
                if l_v106_0[v116] == nil then
                    if v10 then
                        l_v106_0[v116] = true;
                    else
                        l_v106_0[v116] = v117;
                    end;
                end;
                local v118 = {};
                for v119, v120 in pairs(l_v106_0) do
                    if not v120 then
                        table.insert(v118, v119);
                    end;
                end;
                if #v118 == 1 and l_v106_0[v116] == false then
                    local l_Delta_1 = v116.Delta;
                    local l_v57_0 = v57;
                    l_v57_0.Move = l_v57_0.Move + Vector2.new(l_Delta_1.X, l_Delta_1.Y);
                end;
                if #v118 == 2 then
                    local l_Magnitude_0 = (v118[1].Position - v118[2].Position).Magnitude;
                    if l_v108_0 then
                        local l_v57_1 = v57;
                        l_v57_1.Pinch = l_v57_1.Pinch + (l_Magnitude_0 - l_v108_0);
                    end;
                    l_v108_0 = l_Magnitude_0;
                    return;
                else
                    l_v108_0 = nil;
                    return;
                end;
            end;
        end;
        v105 = function() --[[ Line: 373 ]] --[[ Name: resetTouchState ]]
            -- upvalues: l_v106_0 (ref), l_v107_0 (ref), l_v108_0 (ref), l_v48_0 (ref)
            l_v106_0 = {};
            l_v107_0 = nil;
            l_v108_0 = nil;
            l_v48_0 = 0;
        end;
    end;
    v106 = function(v125, v126, v127, v128) --[[ Line: 381 ]] --[[ Name: pointerAction ]]
        -- upvalues: v56 (copy)
        if not v128 then
            v56.Wheel = v125;
            v56.Pan = v126;
            v56.Pinch = -v127;
        end;
    end;
    do
        local l_v102_0, l_v103_0, l_v104_0, l_v105_0 = v102, v103, v104, v105;
        v107 = function(v133, v134) --[[ Line: 389 ]] --[[ Name: inputBegan ]]
            -- upvalues: l_v102_0 (ref), l_v48_0 (ref)
            if v133.UserInputType == Enum.UserInputType.Touch then
                l_v102_0(v133, v134);
                return;
            else
                if v133.UserInputType == Enum.UserInputType.MouseButton2 and not v134 then
                    l_v48_0 = math.max(0, l_v48_0 + 1);
                end;
                return;
            end;
        end;
        v108 = function(v135, v136) --[[ Line: 398 ]] --[[ Name: inputChanged ]]
            -- upvalues: l_v103_0 (ref), v56 (copy)
            if v135.UserInputType == Enum.UserInputType.Touch then
                l_v103_0(v135, v136);
                return;
            else
                if v135.UserInputType == Enum.UserInputType.MouseMovement then
                    local l_Delta_2 = v135.Delta;
                    v56.Movement = Vector2.new(l_Delta_2.X, l_Delta_2.Y);
                end;
                return;
            end;
        end;
        local function v140(v138, v139) --[[ Line: 407 ]] --[[ Name: inputEnded ]]
            -- upvalues: l_v104_0 (ref), l_v48_0 (ref)
            if v138.UserInputType == Enum.UserInputType.Touch then
                l_v104_0(v138, v139);
                return;
            else
                if v138.UserInputType == Enum.UserInputType.MouseButton2 then
                    l_v48_0 = math.max(0, l_v48_0 - 1);
                end;
                return;
            end;
        end;
        local v141 = false;
        v46.setInputEnabled = function(v142) --[[ Line: 418 ]] --[[ Name: setInputEnabled ]]
            -- upvalues: v141 (ref), v101 (copy), l_v105_0 (ref), l_ContextActionService_0 (copy), v77 (copy), l_Value_0 (copy), v88 (copy), l_VRService_0 (copy), v96 (copy), v92 (copy), l_v47_0 (ref), l_UserInputService_0 (copy), v107 (copy), v108 (copy), v140 (copy), v106 (copy), l_GuiService_0 (copy)
            if v141 == v142 then
                return;
            else
                v141 = v142;
                v101();
                l_v105_0();
                if v141 then
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraThumbstick", v77, false, l_Value_0, Enum.KeyCode.Thumbstick2);
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraKeypress", v88, false, l_Value_0, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:BindAction("RbxCameraGamepadReset", v96, false, Enum.KeyCode.ButtonL3);
                    end;
                    l_ContextActionService_0:BindAction("RbxCameraGamepadZoom", v92, false, Enum.KeyCode.ButtonR3);
                    table.insert(l_v47_0, l_UserInputService_0.InputBegan:Connect(v107));
                    table.insert(l_v47_0, l_UserInputService_0.InputChanged:Connect(v108));
                    table.insert(l_v47_0, l_UserInputService_0.InputEnded:Connect(v140));
                    table.insert(l_v47_0, l_UserInputService_0.PointerAction:Connect(v106));
                    table.insert(l_v47_0, l_GuiService_0.MenuOpened:connect(l_v105_0));
                    return;
                else
                    l_ContextActionService_0:UnbindAction("RbxCameraThumbstick");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseMove");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseWheel");
                    l_ContextActionService_0:UnbindAction("RbxCameraKeypress");
                    l_ContextActionService_0:UnbindAction("RbxCameraGamepadZoom");
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:UnbindAction("RbxCameraGamepadReset");
                    end;
                    for _, v144 in pairs(l_v47_0) do
                        v144:Disconnect();
                    end;
                    l_v47_0 = {};
                    return;
                end;
            end;
        end;
        v46.getInputEnabled = function() --[[ Line: 487 ]] --[[ Name: getInputEnabled ]]
            -- upvalues: v141 (ref)
            return v141;
        end;
        v46.resetInputForFrameEnd = function() --[[ Line: 491 ]] --[[ Name: resetInputForFrameEnd ]]
            -- upvalues: v56 (copy), v57 (copy)
            v56.Movement = Vector2.new();
            v57.Move = Vector2.new();
            v57.Pinch = 0;
            v56.Wheel = 0;
            v56.Pan = Vector2.new();
            v56.Pinch = 0;
        end;
        l_UserInputService_0.WindowFocused:Connect(v101);
        l_UserInputService_0.WindowFocusReleased:Connect(v101);
        if v11 then
            l_UserInputService_0.TextBoxFocusReleased:Connect(v101);
        end;
    end;
end;
v47 = false;
v48 = false;
local v145 = 0;
do
    local l_v47_1, l_v48_1, l_v145_0 = v47, v48, v145;
    v46.getHoldPan = function() --[[ Line: 515 ]] --[[ Name: getHoldPan ]]
        -- upvalues: l_v47_1 (ref)
        return l_v47_1;
    end;
    v46.getTogglePan = function() --[[ Line: 519 ]] --[[ Name: getTogglePan ]]
        -- upvalues: l_v48_1 (ref)
        return l_v48_1;
    end;
    v46.getPanning = function() --[[ Line: 523 ]] --[[ Name: getPanning ]]
        -- upvalues: l_v48_1 (ref), l_v47_1 (ref)
        return l_v48_1 or l_v47_1;
    end;
    v46.setTogglePan = function(v149) --[[ Line: 527 ]] --[[ Name: setTogglePan ]]
        -- upvalues: l_v48_1 (ref)
        l_v48_1 = v149;
    end;
    local v150 = false;
    local v151 = nil;
    local v152 = nil;
    v46.enableCameraToggleInput = function() --[[ Line: 535 ]] --[[ Name: enableCameraToggleInput ]]
        -- upvalues: v150 (ref), l_v47_1 (ref), l_v48_1 (ref), v151 (ref), v152 (ref), v18 (ref), l_v145_0 (ref), v19 (ref), l_UserInputService_0 (copy)
        if v150 then
            return;
        else
            v150 = true;
            l_v47_1 = false;
            l_v48_1 = false;
            if v151 then
                v151:Disconnect();
            end;
            if v152 then
                v152:Disconnect();
            end;
            v151 = v18:Connect(function() --[[ Line: 552 ]]
                -- upvalues: l_v47_1 (ref), l_v145_0 (ref)
                l_v47_1 = true;
                l_v145_0 = tick();
            end);
            v152 = v19:Connect(function() --[[ Line: 557 ]]
                -- upvalues: l_v47_1 (ref), l_v145_0 (ref), l_v48_1 (ref), l_UserInputService_0 (ref)
                l_v47_1 = false;
                if tick() - l_v145_0 < 0.3 and (l_v48_1 or l_UserInputService_0:GetMouseDelta().Magnitude < 2) then
                    l_v48_1 = not l_v48_1;
                end;
            end);
            return;
        end;
    end;
    v46.disableCameraToggleInput = function() --[[ Line: 565 ]] --[[ Name: disableCameraToggleInput ]]
        -- upvalues: v150 (ref), v151 (ref), v152 (ref)
        if not v150 then
            return;
        else
            v150 = false;
            if v151 then
                v151:Disconnect();
                v151 = nil;
            end;
            if v152 then
                v152:Disconnect();
                v152 = nil;
            end;
            return;
        end;
    end;
end;
return v46;