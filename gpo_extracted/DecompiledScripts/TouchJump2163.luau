local _ = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local l_CharacterUtil_0 = require(l_CommonUtils_0:WaitForChild("CharacterUtil"));
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v6 = {
    HUMANOID_STATE_ENABLED_CHANGED = "HUMANOID_STATE_ENABLED_CHANGED", 
    HUMANOID_JUMP_POWER = "HUMANOID_JUMP_POWER", 
    HUMANOID_JUMP_HEIGHT = "HUMANOID_JUMP_HEIGHT", 
    HUMANOID = "HUMANOID", 
    JUMP_INPUT_ENDED = "JUMP_INPUT_ENDED", 
    MENU_OPENED = "MENU_OPENED"
};
local v7 = l_FlagUtil_0.getUserFlag("UserTouchJumpHeightDisable");
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v9 = setmetatable({}, l_BaseCharacterController_0);
v9.__index = v9;
v9.new = function() --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v9 (copy), l_ConnectionUtil_0 (copy)
    local v10 = setmetatable(l_BaseCharacterController_0.new(), v9);
    v10.parentUIFrame = nil;
    v10.jumpButton = nil;
    v10.externallyEnabled = false;
    v10.isJumping = false;
    v10._active = false;
    v10._connectionUtil = l_ConnectionUtil_0.new();
    return v10;
end;
v9._reset = function(v11) --[[ Line: 68 ]] --[[ Name: _reset ]]
    v11.isJumping = false;
    v11.touchObject = nil;
    if v11.jumpButton then
        v11.jumpButton.ImageRectOffset = Vector2.new(1, 146);
    end;
end;
v9.EnableButton = function(v12, v13) --[[ Line: 79 ]] --[[ Name: EnableButton ]]
    -- upvalues: v7 (copy), v6 (copy), l_GuiService_0 (copy)
    if v13 == v12._active then
        if not v7 then
            v12:_reset();
        end;
        return;
    else
        if v13 then
            if not v12.jumpButton then
                v12:Create();
            end;
            v12.jumpButton.Visible = true;
            v12._connectionUtil:trackConnection(v6.JUMP_INPUT_ENDED, v12.jumpButton.InputEnded:Connect(function(v14) --[[ Line: 97 ]]
                -- upvalues: v12 (copy)
                if v14 == v12.touchObject then
                    v12:_reset();
                end;
            end));
            v12._connectionUtil:trackConnection(v6.MENU_OPENED, l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 107 ]]
                -- upvalues: v12 (copy)
                if v12.touchObject then
                    v12:_reset();
                end;
            end));
        else
            v12._connectionUtil:disconnect(v6.JUMP_INPUT_ENDED);
            v12._connectionUtil:disconnect(v6.MENU_OPENED);
        end;
        v12:_reset();
        v12._active = v13;
        return;
    end;
end;
v9.UpdateEnabled = function(v15) --[[ Line: 124 ]] --[[ Name: UpdateEnabled ]]
    -- upvalues: l_CharacterUtil_0 (copy), v7 (copy)
    local v16 = l_CharacterUtil_0.getChild("Humanoid", "Humanoid");
    if v7 then
        if v16 and v15.externallyEnabled and (v16.UseJumpPower and v16.JumpPower > 0 or not v16.UseJumpPower and v16.JumpHeight > 0) then
            v15:EnableButton(true);
            return;
        else
            v15:EnableButton(false);
            return;
        end;
    elseif v16 and v15.externallyEnabled and v16.JumpPower > 0 then
        v15:EnableButton(true);
        return;
    else
        v15:EnableButton(false);
        return;
    end;
end;
v9._setupConfigurations = function(v17) --[[ Line: 141 ]] --[[ Name: _setupConfigurations ]]
    -- upvalues: l_CharacterUtil_0 (copy), v7 (copy), v6 (copy)
    local function v18() --[[ Line: 142 ]] --[[ Name: update ]]
        -- upvalues: v17 (copy)
        v17:UpdateEnabled();
    end;
    local v22 = l_CharacterUtil_0.onChild("Humanoid", "Humanoid", function(v19) --[[ Line: 147 ]]
        -- upvalues: v17 (copy), v7 (ref), v6 (ref), v18 (copy)
        v17:UpdateEnabled();
        if v7 then
            v17:_reset();
        end;
        v17._connectionUtil:trackConnection(v6.HUMANOID_JUMP_POWER, v19:GetPropertyChangedSignal("JumpPower"):Connect(v18));
        if v7 then
            v17._connectionUtil:trackConnection(v6.HUMANOID_JUMP_HEIGHT, v19:GetPropertyChangedSignal("JumpHeight"):Connect(v18));
        end;
        v17._connectionUtil:trackConnection(v6.HUMANOID_STATE_ENABLED_CHANGED, v19.StateEnabledChanged:Connect(function(v20, v21) --[[ Line: 164 ]]
            -- upvalues: v17 (ref)
            if v20 == Enum.HumanoidStateType.Jumping and v21 ~= v17._active then
                v17:UpdateEnabled();
            end;
        end));
    end);
    v17._connectionUtil:trackConnection(v6.HUMANOID, v22);
end;
v9.Enable = function(v23, v24, v25) --[[ Line: 176 ]] --[[ Name: Enable ]]
    if v25 then
        v23.parentUIFrame = v25;
    end;
    if v23.externallyEnabled == v24 then
        return;
    else
        v23.externallyEnabled = v24;
        v23:UpdateEnabled();
        if v24 then
            v23:_setupConfigurations();
            return;
        else
            v23._connectionUtil:disconnectAll();
            return;
        end;
    end;
end;
v9.Create = function(v26) --[[ Line: 193 ]] --[[ Name: Create ]]
    if not v26.parentUIFrame then
        return;
    else
        if v26.jumpButton then
            v26.jumpButton:Destroy();
            v26.jumpButton = nil;
        end;
        if v26.absoluteSizeChangedConn then
            v26.absoluteSizeChangedConn:Disconnect();
            v26.absoluteSizeChangedConn = nil;
        end;
        v26.jumpButton = Instance.new("ImageButton");
        v26.jumpButton.Name = "JumpButton";
        v26.jumpButton.Visible = false;
        v26.jumpButton.BackgroundTransparency = 1;
        v26.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
        v26.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        v26.jumpButton.ImageRectSize = Vector2.new(144, 144);
        v26.jumpButton.ZIndex = 5000;
        local function v29() --[[ Line: 217 ]] --[[ Name: ResizeJumpButton ]]
            -- upvalues: v26 (copy)
            local v27 = math.min(v26.parentUIFrame.AbsoluteSize.x, v26.parentUIFrame.AbsoluteSize.y) <= 500;
            local v28 = v27 and 70 or 120;
            v26.jumpButton.Size = UDim2.new(0, v28, 0, v28);
            v26.jumpButton.Position = v27 and UDim2.new(1, -(v28 * 1.5 - 10), 1, -v28 - 20) or UDim2.new(1, -(v28 * 1.5 - 10), 1, -v28 * 1.75);
        end;
        v29();
        v26.absoluteSizeChangedConn = v26.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(v29);
        v26.touchObject = nil;
        v26.jumpButton.InputBegan:connect(function(v30) --[[ Line: 231 ]]
            -- upvalues: v26 (copy)
            if v26.touchObject or v30.UserInputType ~= Enum.UserInputType.Touch or v30.UserInputState ~= Enum.UserInputState.Begin then
                return;
            else
                v26.touchObject = v30;
                v26.jumpButton.ImageRectOffset = Vector2.new(146, 146);
                v26.isJumping = true;
                return;
            end;
        end);
        v26.parentUIFrame:FindFirstAncestorWhichIsA("ScreenGui").DisplayOrder = 100000000000;
        v26.jumpButton.Parent = v26.parentUIFrame;
        return;
    end;
end;
return v9;