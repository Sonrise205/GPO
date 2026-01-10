local _ = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = UserSettings():GetService("UserGameSettings");
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v5 = setmetatable({}, l_BaseCharacterController_0);
v5.__index = v5;
v5.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v5 (copy)
    local v6 = setmetatable(l_BaseCharacterController_0.new(), v5);
    v6.isFollowStick = false;
    v6.thumbstickFrame = nil;
    v6.moveTouchObject = nil;
    v6.onTouchMovedConn = nil;
    v6.onTouchEndedConn = nil;
    v6.screenPos = nil;
    v6.stickImage = nil;
    v6.thumbstickSize = nil;
    return v6;
end;
v5.Enable = function(v7, v8, v9) --[[ Line: 35 ]] --[[ Name: Enable ]]
    if v8 == nil then
        return false;
    else
        v8 = v8 and true or false;
        if v7.enabled == v8 then
            return true;
        else
            v7.moveVector = Vector3.new(0, 0, 0, 0);
            v7.isJumping = false;
            if v8 then
                if not v7.thumbstickFrame then
                    v7:Create(v9);
                end;
                v7.thumbstickFrame.Visible = true;
            else
                v7.thumbstickFrame.Visible = false;
                v7:OnInputEnded();
            end;
            v7.enabled = v8;
            return;
        end;
    end;
end;
v5.OnInputEnded = function(v10) --[[ Line: 56 ]] --[[ Name: OnInputEnded ]]
    v10.thumbstickFrame.Position = v10.screenPos;
    v10.stickImage.Position = UDim2.new(0, v10.thumbstickFrame.Size.X.Offset / 2 - v10.thumbstickSize / 4, 0, v10.thumbstickFrame.Size.Y.Offset / 2 - v10.thumbstickSize / 4);
    v10.moveVector = Vector3.new(0, 0, 0, 0);
    v10.isJumping = false;
    v10.thumbstickFrame.Position = v10.screenPos;
    v10.moveTouchObject = nil;
end;
v5.Create = function(v11, v12) --[[ Line: 65 ]] --[[ Name: Create ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v11.thumbstickFrame then
        v11.thumbstickFrame:Destroy();
        v11.thumbstickFrame = nil;
        if v11.onTouchMovedConn then
            v11.onTouchMovedConn:Disconnect();
            v11.onTouchMovedConn = nil;
        end;
        if v11.onTouchEndedConn then
            v11.onTouchEndedConn:Disconnect();
            v11.onTouchEndedConn = nil;
        end;
        if v11.absoluteSizeChangedConn then
            v11.absoluteSizeChangedConn:Disconnect();
            v11.absoluteSizeChangedConn = nil;
        end;
    end;
    v11.thumbstickFrame = Instance.new("Frame");
    v11.thumbstickFrame.Name = "ThumbstickFrame";
    v11.thumbstickFrame.Active = true;
    v11.thumbstickFrame.Visible = false;
    v11.thumbstickFrame.BackgroundTransparency = 1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "OuterImage";
    l_ImageLabel_0.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
    l_ImageLabel_0.ImageRectOffset = Vector2.new();
    l_ImageLabel_0.ImageRectSize = Vector2.new(220, 220);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    v11.stickImage = Instance.new("ImageLabel");
    v11.stickImage.Name = "StickImage";
    v11.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
    v11.stickImage.ImageRectOffset = Vector2.new(220, 0);
    v11.stickImage.ImageRectSize = Vector2.new(111, 111);
    v11.stickImage.BackgroundTransparency = 1;
    v11.stickImage.ZIndex = 2;
    local function v15() --[[ Line: 105 ]] --[[ Name: ResizeThumbstick ]]
        -- upvalues: v12 (copy), v11 (copy), l_ImageLabel_0 (copy)
        local v14 = math.min(v12.AbsoluteSize.X, v12.AbsoluteSize.Y) <= 500;
        v11.thumbstickSize = v14 and 70 or 120;
        v11.screenPos = v14 and UDim2.new(0, v11.thumbstickSize / 2 - 10, 1, -v11.thumbstickSize - 20) or UDim2.new(0, v11.thumbstickSize / 2, 1, -v11.thumbstickSize * 1.75);
        v11.thumbstickFrame.Size = UDim2.new(0, v11.thumbstickSize, 0, v11.thumbstickSize);
        v11.thumbstickFrame.Position = v11.screenPos;
        l_ImageLabel_0.Size = UDim2.new(0, v11.thumbstickSize, 0, v11.thumbstickSize);
        v11.stickImage.Size = UDim2.new(0, v11.thumbstickSize / 2, 0, v11.thumbstickSize / 2);
        v11.stickImage.Position = UDim2.new(0, v11.thumbstickSize / 2 - v11.thumbstickSize / 4, 0, v11.thumbstickSize / 2 - v11.thumbstickSize / 4);
    end;
    v15();
    v11.absoluteSizeChangedConn = v12:GetPropertyChangedSignal("AbsoluteSize"):Connect(v15);
    l_ImageLabel_0.Parent = v11.thumbstickFrame;
    v11.stickImage.Parent = v11.thumbstickFrame;
    local v16 = nil;
    local function _(v17) --[[ Line: 127 ]] --[[ Name: DoMove ]]
        -- upvalues: v11 (copy)
        local v18 = v17 / (v11.thumbstickSize / 2);
        local l_magnitude_0 = v18.magnitude;
        if l_magnitude_0 < 0.05 then
            v18 = Vector3.new();
        else
            v18 = v18.unit * math.min(1, (l_magnitude_0 - 0.05) / 0.95);
            v18 = Vector3.new(v18.X, 0, v18.Y);
        end;
        v11.moveVector = v18;
    end;
    local function v26(v21) --[[ Line: 145 ]] --[[ Name: MoveStick ]]
        -- upvalues: v16 (ref), v11 (copy)
        local v22 = Vector2.new(v21.X - v16.X, v21.Y - v16.Y);
        local l_magnitude_1 = v22.magnitude;
        local v24 = v11.thumbstickFrame.AbsoluteSize.X / 2;
        if v11.isFollowStick and v24 < l_magnitude_1 then
            local v25 = v22.unit * v24;
            v11.thumbstickFrame.Position = UDim2.new(0, v21.X - v11.thumbstickFrame.AbsoluteSize.X / 2 - v25.X, 0, v21.Y - v11.thumbstickFrame.AbsoluteSize.Y / 2 - v25.Y);
        else
            l_magnitude_1 = math.min(l_magnitude_1, v24);
            v22 = v22.unit * l_magnitude_1;
        end;
        v11.stickImage.Position = UDim2.new(0, v22.X + v11.stickImage.AbsoluteSize.X / 2, 0, v22.Y + v11.stickImage.AbsoluteSize.Y / 2);
    end;
    v11.thumbstickFrame.InputBegan:Connect(function(v27) --[[ Line: 162 ]]
        -- upvalues: v11 (copy), v16 (ref)
        if v11.moveTouchObject or v27.UserInputType ~= Enum.UserInputType.Touch or v27.UserInputState ~= Enum.UserInputState.Begin then
            return;
        else
            v11.moveTouchObject = v27;
            v11.thumbstickFrame.Position = UDim2.new(0, v27.Position.X - v11.thumbstickFrame.Size.X.Offset / 2, 0, v27.Position.Y - v11.thumbstickFrame.Size.Y.Offset / 2);
            v16 = Vector2.new(v11.thumbstickFrame.AbsolutePosition.X + v11.thumbstickFrame.AbsoluteSize.X / 2, v11.thumbstickFrame.AbsolutePosition.Y + v11.thumbstickFrame.AbsoluteSize.Y / 2);
            local _ = Vector2.new(v27.Position.X - v16.X, v27.Position.Y - v16.Y);
            return;
        end;
    end);
    v11.onTouchMovedConn = l_UserInputService_0.TouchMoved:Connect(function(v29, _) --[[ Line: 177 ]]
        -- upvalues: v11 (copy), v16 (ref), v26 (copy)
        if v29 == v11.moveTouchObject then
            v16 = Vector2.new(v11.thumbstickFrame.AbsolutePosition.X + v11.thumbstickFrame.AbsoluteSize.X / 2, v11.thumbstickFrame.AbsolutePosition.Y + v11.thumbstickFrame.AbsoluteSize.Y / 2);
            local v31 = Vector2.new(v29.Position.X - v16.X, v29.Position.Y - v16.Y) / (v11.thumbstickSize / 2);
            local l_magnitude_2 = v31.magnitude;
            if l_magnitude_2 < 0.05 then
                v31 = Vector3.new();
            else
                v31 = v31.unit * math.min(1, (l_magnitude_2 - 0.05) / 0.95);
                v31 = Vector3.new(v31.X, 0, v31.Y);
            end;
            v11.moveVector = v31;
            v26(v29.Position);
        end;
    end);
    v11.onTouchEndedConn = l_UserInputService_0.TouchEnded:Connect(function(v33, _) --[[ Line: 187 ]]
        -- upvalues: v11 (copy)
        if v33 == v11.moveTouchObject then
            v11:OnInputEnded();
        end;
    end);
    l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 193 ]]
        -- upvalues: v11 (copy)
        if v11.moveTouchObject then
            v11:OnInputEnded();
        end;
    end);
    v11.thumbstickFrame.Parent = v12;
end;
return v5;