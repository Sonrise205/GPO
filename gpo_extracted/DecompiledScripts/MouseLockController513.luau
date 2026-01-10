local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local v8 = l_FlagUtil_0.getUserFlag("UserPreferredInputPlayerScripts2");
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_GameSettings_0 (copy), l_Players_0 (copy), v8 (copy), l_UserInputService_0 (copy)
    local v10 = setmetatable({}, v9);
    v10.isMouseLocked = false;
    v10.savedMouseCursor = nil;
    v10.boundKeys = {
        Enum.KeyCode.LeftShift, 
        Enum.KeyCode.RightShift
    };
    v10.mouseLockToggledEvent = Instance.new("BindableEvent");
    local l_BoundKeys_0 = script:FindFirstChild("BoundKeys");
    if not l_BoundKeys_0 or not l_BoundKeys_0:IsA("StringValue") then
        if l_BoundKeys_0 then
            l_BoundKeys_0:Destroy();
        end;
        l_BoundKeys_0 = Instance.new("StringValue");
        assert(l_BoundKeys_0, "");
        l_BoundKeys_0.Name = "BoundKeys";
        l_BoundKeys_0.Value = "LeftShift,RightShift";
        l_BoundKeys_0.Parent = script;
    end;
    if l_BoundKeys_0 then
        l_BoundKeys_0.Changed:Connect(function(v12) --[[ Line: 59 ]]
            -- upvalues: v10 (copy)
            v10:OnBoundKeysObjectChanged(v12);
        end);
        v10:OnBoundKeysObjectChanged(l_BoundKeys_0.Value);
    end;
    l_GameSettings_0.Changed:Connect(function(v13) --[[ Line: 66 ]]
        -- upvalues: v10 (copy)
        if v13 == "ControlMode" or v13 == "ComputerMovementMode" then
            v10:UpdateMouseLockAvailability();
        end;
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() --[[ Line: 73 ]]
        -- upvalues: v10 (copy)
        v10:UpdateMouseLockAvailability();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 78 ]]
        -- upvalues: v10 (copy)
        v10:UpdateMouseLockAvailability();
    end);
    if v8 then
        l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 83 ]]
            -- upvalues: v10 (copy)
            v10:UpdateMouseLockAvailability();
        end);
    end;
    v10:UpdateMouseLockAvailability();
    return v10;
end;
v9.GetIsMouseLocked = function(v14) --[[ Line: 93 ]] --[[ Name: GetIsMouseLocked ]]
    return v14.isMouseLocked;
end;
v9.GetBindableToggleEvent = function(v15) --[[ Line: 97 ]] --[[ Name: GetBindableToggleEvent ]]
    return v15.mouseLockToggledEvent.Event;
end;
v9.GetMouseLockOffset = function(_) --[[ Line: 101 ]] --[[ Name: GetMouseLockOffset ]]
    return (Vector3.new(1.75, 0, 0, 0));
end;
v9.UpdateMouseLockAvailability = function(v17) --[[ Line: 105 ]] --[[ Name: UpdateMouseLockAvailability ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy), l_UserInputService_0 (copy), v8 (copy)
    local l_DevEnableMouseLock_0 = l_Players_0.LocalPlayer.DevEnableMouseLock;
    local v19 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
    local v20 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
    local v21 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    local v22 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.KeyboardAndMouse;
    local v23 = (not v8 or v22) and l_DevEnableMouseLock_0 and v20 and not v21 and not v19;
    if v23 ~= v17.enabled then
        v17:EnableMouseLock(v23);
    end;
end;
v9.OnBoundKeysObjectChanged = function(v24, v25) --[[ Line: 118 ]] --[[ Name: OnBoundKeysObjectChanged ]]
    v24.boundKeys = {};
    for v26 in string.gmatch(v25, "[^%s,]+") do
        for _, v28 in pairs(Enum.KeyCode:GetEnumItems()) do
            if v26 == v28.Name then
                v24.boundKeys[#v24.boundKeys + 1] = v28;
                break;
            end;
        end;
    end;
    v24:UnbindContextActions();
    v24:BindContextActions();
end;
v9.OnMouseLockToggled = function(v29) --[[ Line: 133 ]] --[[ Name: OnMouseLockToggled ]]
    -- upvalues: l_CameraUtils_0 (copy)
    v29.isMouseLocked = not v29.isMouseLocked;
    if v29.isMouseLocked then
        local l_CursorImage_0 = script:FindFirstChild("CursorImage");
        if l_CursorImage_0 and l_CursorImage_0:IsA("StringValue") and l_CursorImage_0.Value then
            l_CameraUtils_0.setMouseIconOverride(l_CursorImage_0.Value);
        else
            if l_CursorImage_0 then
                l_CursorImage_0:Destroy();
            end;
            l_CursorImage_0 = Instance.new("StringValue");
            assert(l_CursorImage_0, "");
            l_CursorImage_0.Name = "CursorImage";
            l_CursorImage_0.Value = "rbxasset://textures/MouseLockedCursor.png";
            l_CursorImage_0.Parent = script;
            l_CameraUtils_0.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png");
        end;
    else
        l_CameraUtils_0.restoreMouseIcon();
    end;
    v29.mouseLockToggledEvent:Fire();
end;
v9.DoMouseLockSwitch = function(v31, _, v33, _) --[[ Line: 158 ]] --[[ Name: DoMouseLockSwitch ]]
    if v33 == Enum.UserInputState.Begin then
        v31:OnMouseLockToggled();
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
v9.BindContextActions = function(v35) --[[ Line: 166 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_Value_0 (copy)
    l_ContextActionService_0:BindActionAtPriority("MouseLockSwitchAction", function(v36, v37, v38) --[[ Line: 167 ]]
        -- upvalues: v35 (copy)
        return v35:DoMouseLockSwitch(v36, v37, v38);
    end, false, l_Value_0, unpack(v35.boundKeys));
end;
v9.UnbindContextActions = function(_) --[[ Line: 172 ]] --[[ Name: UnbindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("MouseLockSwitchAction");
end;
v9.IsMouseLocked = function(v40) --[[ Line: 176 ]] --[[ Name: IsMouseLocked ]]
    return v40.enabled and v40.isMouseLocked;
end;
v9.EnableMouseLock = function(v41, v42) --[[ Line: 180 ]] --[[ Name: EnableMouseLock ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v42 ~= v41.enabled then
        v41.enabled = v42;
        if v41.enabled then
            v41:BindContextActions();
            return;
        else
            l_CameraUtils_0.restoreMouseIcon();
            v41:UnbindContextActions();
            if v41.isMouseLocked then
                v41.mouseLockToggledEvent:Fire();
            end;
            v41.isMouseLocked = false;
        end;
    end;
end;
return v9;