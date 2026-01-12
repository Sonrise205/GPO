local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_MobileButtonScale_0 = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name):WaitForChild("Settings"):WaitForChild("MobileButtonScale");
local v7 = TweenInfo.new(0.25, Enum.EasingStyle.Quart);
local v8 = require(l_Modules_0.Shared.Signals.Signal);
local v9 = {
    Buttons = {}, 
    JumpButtonSize = Vector2.new(70, 70), 
    ButtonAdded = v8.new()
};
_G.mobileButtonScale = l_MobileButtonScale_0.Value;
l_MobileButtonScale_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 29 ]]
    -- upvalues: l_MobileButtonScale_0 (copy), l_PlayerGui_0 (copy)
    _G.mobileButtonScale = l_MobileButtonScale_0.Value;
    local l_JumpButton_0 = l_PlayerGui_0:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton");
    local l_Size_0 = l_JumpButton_0.Size;
    if l_JumpButton_0:GetAttribute("OriginalSize") == nil then
        l_JumpButton_0:SetAttribute("OriginalSize", l_Size_0);
    end;
    local _ = l_JumpButton_0:GetAttribute("OriginalSize");
end);
v9._isSmallScreenDevice = function(_) --[[ Line: 45 ]] --[[ Name: _isSmallScreenDevice ]]
    local l_AbsoluteSize_0 = script.ContextActionGui.AbsoluteSize;
    return math.min(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y) <= 500;
end;
v9.GetPositionAndSize = function(v15) --[[ Line: 55 ]] --[[ Name: GetPositionAndSize ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local l_TouchGui_0 = l_PlayerGui_0:WaitForChild("TouchGui");
    local l_JumpButton_1 = l_TouchGui_0:WaitForChild("TouchControlFrame"):WaitForChild("JumpButton");
    if not l_TouchGui_0 then
        if v15:_isSmallScreenDevice() then
            return UDim2.new(0, 35, 0, 35), UDim2.fromScale(0.75, 0.75);
        else
            return UDim2.new(0, 45, 0, 45), UDim2.fromScale(0.75, 0.75);
        end;
    else
        local l_JumpButtonSize_0 = v15.JumpButtonSize;
        local l_X_0 = l_JumpButtonSize_0.X;
        local l_Y_0 = l_JumpButtonSize_0.Y;
        local l_AbsolutePosition_0 = l_JumpButton_1.AbsolutePosition;
        local v22 = UDim2.fromOffset(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y);
        return UDim2.new(0, l_X_0, 0, l_Y_0), v22 - UDim2.new(0, l_X_0 * 1, 0, 0);
    end;
end;
v9._createButtonData = function(v23, v24) --[[ Line: 81 ]] --[[ Name: _createButtonData ]]
    -- upvalues: l_TweenService_0 (copy), v7 (copy), v9 (copy)
    local l_Button_0 = v24.Button;
    local l_Frame_0 = v24.Frame;
    local l_Name_0 = v24.Name;
    local _ = v24.Callback;
    local v29 = {
        Name = l_Name_0, 
        Frame = l_Frame_0, 
        Button = l_Button_0, 
        Properties = {}, 
        Callbacks = {}, 
        Animatable = v24.Animatable == nil or v24.Animatable or true, 
        SizeRatio = v24.SizeRatio, 
        Connections = {}
    };
    local function v33() --[[ Line: 98 ]] --[[ Name: Pressed ]]
        -- upvalues: l_Frame_0 (copy), v29 (copy), l_TweenService_0 (ref), v7 (ref)
        local l_AbsoluteSize_1 = l_Frame_0.AbsoluteSize;
        local l_Children_0 = script.Sounds:GetChildren();
        local v32 = l_Children_0[math.random(#l_Children_0)];
        v32.PlaybackSpeed = math.random(90, 110) / 100;
        v32:Play();
        if v29.Animatable then
            l_TweenService_0:Create(l_Frame_0, v7, {
                Size = v29.Properties.Size - UDim2.fromOffset(l_AbsoluteSize_1.X * 0.1, l_AbsoluteSize_1.Y * 0.1)
            }):Play();
        end;
        if v29.Callbacks.InputBegan then
            v29.Callbacks.InputBegan();
        end;
    end;
    local function v34() --[[ Line: 115 ]] --[[ Name: LetGo ]]
        -- upvalues: v29 (copy), l_TweenService_0 (ref), l_Frame_0 (copy), v7 (ref)
        if v29.Animatable then
            l_TweenService_0:Create(l_Frame_0, v7, {
                Size = v29.Properties.Size
            }):Play();
        end;
        if v29.Callbacks.InputEnded then
            v29.Callbacks.InputEnded();
        end;
    end;
    v29.Connections.InputBegan = l_Button_0.MouseButton1Down:Connect(v33);
    v29.Connections.InputEnded = l_Button_0.InputEnded:Connect(v34);
    v9.Buttons[l_Name_0] = v29;
    v23:_updateProperties(v24);
    if v24.AutoScaling then
        v23:_autoScaleButton(v29);
    end;
    v9.ButtonAdded:Fire(l_Name_0, v29);
    return v29.Button;
end;
v9._updateProperties = function(v35, v36) --[[ Line: 138 ]] --[[ Name: _updateProperties ]]
    local l_Name_1 = v36.Name;
    for _, v39 in ipairs({
        "Size", 
        "Position", 
        "Title", 
        "Callbacks", 
        "Texture"
    }) do
        local v40 = v36[v39];
        if v40 then
            local v41 = {
                [v39] = v40, 
                ButtonName = l_Name_1
            };
            v35["Update" .. v39](v35, v41);
        end;
    end;
end;
v9.GetButtonData = function(v42, v43) --[[ Line: 154 ]] --[[ Name: GetButtonData ]]
    return v42.Buttons[v43];
end;
v9.GetButton = function(v44, v45) --[[ Line: 158 ]] --[[ Name: GetButton ]]
    local v46 = v44.Buttons[v45];
    return v46 and v46.Button;
end;
v9.GetButtonParent = function(v47, v48) --[[ Line: 163 ]] --[[ Name: GetButtonParent ]]
    local v49 = v47.Buttons[v48];
    return v49 and v49.Button.Parent or nil;
end;
v9._autoScaleButton = function(v50, v51) --[[ Line: 168 ]] --[[ Name: _autoScaleButton ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local l_JumpButton_2 = l_PlayerGui_0:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton");
    local l_Button_1 = v51.Button;
    local l_JumpButtonSize_1 = v50.JumpButtonSize;
    local _ = v51.Properties.Size;
    v51.SizeRatio = v51.SizeRatio or l_Button_1.AbsoluteSize / l_JumpButtonSize_1;
    local function v57() --[[ Line: 180 ]] --[[ Name: UpdateSize ]]
        -- upvalues: v51 (copy), v50 (copy), l_JumpButton_2 (copy)
        local l_SizeRatio_0 = v51.SizeRatio;
        v50:UpdateSize({
            ButtonName = v51.Name, 
            Size = UDim2.fromOffset(l_JumpButton_2.AbsoluteSize.X * l_SizeRatio_0.X, l_JumpButton_2.AbsoluteSize.Y * l_SizeRatio_0.Y)
        });
    end;
    v57();
    l_JumpButton_2:GetPropertyChangedSignal("AbsoluteSize"):Connect(v57);
end;
v9.UpdateTexture = function(v58, v59) --[[ Line: 195 ]] --[[ Name: UpdateTexture ]]
    local l_v58_ButtonData_0 = v58:GetButtonData(v59.ButtonName);
    if not l_v58_ButtonData_0 then
        return;
    else
        l_v58_ButtonData_0.Button.ActionIcon.Image = v59.Texture or "";
        return;
    end;
end;
v9.UpdateCallbacks = function(v61, v62) --[[ Line: 202 ]] --[[ Name: UpdateCallbacks ]]
    local l_v61_ButtonData_0 = v61:GetButtonData(v62.ButtonName);
    if not l_v61_ButtonData_0 then
        return;
    else
        l_v61_ButtonData_0.Callbacks = v62.Callbacks;
        return;
    end;
end;
v9.UpdatePosition = function(v64, v65) --[[ Line: 209 ]] --[[ Name: UpdatePosition ]]
    local l_v64_ButtonData_0 = v64:GetButtonData(v65.ButtonName);
    if not l_v64_ButtonData_0 then
        return;
    else
        l_v64_ButtonData_0.Properties.Position = v65.Position;
        l_v64_ButtonData_0.Frame.Position = v65.Position;
        return;
    end;
end;
v9.UpdateTitle = function(v67, v68) --[[ Line: 217 ]] --[[ Name: UpdateTitle ]]
    local l_v67_ButtonData_0 = v67:GetButtonData(v68.ButtonName);
    if not l_v67_ButtonData_0 then
        return;
    else
        local l_ActionTitle_0 = l_v67_ButtonData_0.Button:FindFirstChild("ActionTitle");
        if not l_ActionTitle_0 then
            return;
        else
            l_ActionTitle_0.Text = v68.Title;
            return;
        end;
    end;
end;
v9.UpdateSize = function(v71, v72) --[[ Line: 227 ]] --[[ Name: UpdateSize ]]
    local l_v71_ButtonData_0 = v71:GetButtonData(v72.ButtonName);
    if not l_v71_ButtonData_0 then
        return;
    else
        l_v71_ButtonData_0.Properties.Size = v72.Size;
        l_v71_ButtonData_0.Frame.Size = v72.Size;
        return;
    end;
end;
v9.GetMobileUI = function(_) --[[ Line: 235 ]] --[[ Name: GetMobileUI ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local l_TouchGui_1 = l_PlayerGui_0:WaitForChild("TouchGui");
    local l_TouchControlFrame_0 = l_TouchGui_1:WaitForChild("TouchControlFrame");
    return l_TouchGui_1, l_TouchControlFrame_0, (l_TouchControlFrame_0:WaitForChild("JumpButton"));
end;
v9.CreateButton = function(v77, v78) --[[ Line: 245 ]] --[[ Name: CreateButton ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local l_TouchControlFrame_1 = l_PlayerGui_0:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame");
    local _ = l_TouchControlFrame_1:WaitForChild("JumpButton");
    if not v78.Button then
        v78.Button = script.ContextActionButton:Clone();
        v78.Button.Name = ("%*"):format(v78.Name);
        v78.Button.Parent = l_TouchControlFrame_1;
        v78.Frame = v78.Button;
    end;
    if not v78.Button:IsA("GuiButton") then
        v78.Frame = v78.Button;
        v78.Frame.Parent = l_TouchControlFrame_1;
        v78.Button = v78.Button:FindFirstChildWhichIsA("GuiButton", true);
    end;
    v78.Size = v78.Size or v78.Frame.Size;
    v78.Position = v78.Position or v78.Button.Position;
    return v77:_createButtonData(v78);
end;
return v9;