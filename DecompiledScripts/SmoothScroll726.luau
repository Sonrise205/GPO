local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
if not l_RunService_0:IsClient() then
    error("SmoothScroll can only be used on the client");
end;
local l_PlayerGui_0 = game.Players.LocalPlayer:WaitForChild("PlayerGui");
local l_Mouse_0 = game.Players.LocalPlayer:GetMouse();
local _ = ipairs;
local _ = pairs;
task.wait();
local v7 = l_Mouse_0.ViewSizeY / 27;
local _ = 0.78;
local v9 = {};
local v10 = nil;
local v11 = false;
if not l_UserInputService_0.TouchEnabled then
    v10 = Instance.new("ScreenGui");
    v10.Name = "SmoothScroll";
    v10.Parent = l_PlayerGui_0;
    l_RunService_0.Heartbeat:Connect(function() --[[ Line: 33 ]]
        -- upvalues: v9 (copy)
        for v12, v13 in v9 do
            if v13.Velocity > 0.05 or v13.Velocity < -0.05 then
                v13.Velocity = v13.Velocity * v13.Frict;
                if v13.Axis == "X" then
                    v12.CanvasPosition = Vector2.new(v12.CanvasPosition.X + v13.Velocity, v12.CanvasPosition.Y);
                    if math.abs(v13.LastPos - v12.CanvasPosition.X) == 0 then
                        v13.Velocity = 0;
                    end;
                    v13.LastPos = v12.CanvasPosition.X;
                else
                    v12.CanvasPosition = Vector2.new(v12.CanvasPosition.X, v12.CanvasPosition.Y + v13.Velocity);
                    if math.abs(v13.LastPos - v12.CanvasPosition.Y) == 0 then
                        v13.Velocity = 0;
                    end;
                    v13.LastPos = v12.CanvasPosition.Y;
                end;
            end;
        end;
    end);
    l_UserInputService_0.PointerAction:Connect(function(_, v15, _, _) --[[ Line: 59 ]]
        -- upvalues: v11 (ref), l_PlayerGui_0 (copy), l_Mouse_0 (copy), v9 (copy)
        if not v11 then
            for _, v19 in (l_PlayerGui_0:GetGuiObjectsAtPosition(l_Mouse_0.X, l_Mouse_0.Y)) do
                local v20 = v9[v19];
                if v20 and v20.Visibility.Visible == true then
                    v20.Velocity = v20.Velocity - v20.Sens * v15.Y * (v20.Inverted and -1 or 1);
                    return;
                end;
            end;
        end;
    end);
    l_ContextActionService_0:BindActionAtPriority("SmoothScroll", function(_, _, v23) --[[ Line: 74 ]]
        -- upvalues: v11 (ref), l_PlayerGui_0 (copy), l_Mouse_0 (copy), v9 (copy)
        if v11 then
            return Enum.ContextActionResult.Pass;
        else
            local v24 = false;
            for _, v26 in (l_PlayerGui_0:GetGuiObjectsAtPosition(l_Mouse_0.X, l_Mouse_0.Y)) do
                local v27 = v9[v26];
                if v27 and v27.Visibility.Visible == true then
                    v27.Velocity = v27.Velocity - v27.Sens * v23.Position.Z * (v27.Inverted and -1 or 1);
                    v24 = true;
                    break;
                end;
            end;
            return v24 and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass;
        end;
    end, false, 8000, Enum.UserInputType.MouseWheel);
end;
local v28 = {};
v28.__index = v28;
v28.new = function(v29) --[[ Line: 102 ]] --[[ Name: new ]]
    -- upvalues: v28 (copy)
    local v30 = false;
    if typeof(v29) == "Instance" then
        v30 = v29:IsA("GuiObject");
    end;
    assert(v30, "Argument #1 expected GuiObject");
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v30 = setmetatable({
        GuiObject = v29, 
        Visible = nil, 
        Changed = l_BindableEvent_0.Event, 
        _path = {}, 
        _conn = {}, 
        _root = nil, 
        _visibleChanged = l_BindableEvent_0
    }, v28);
    local function v35() --[[ Line: 117 ]] --[[ Name: CheckVisible ]]
        -- upvalues: v30 (copy), l_BindableEvent_0 (copy)
        local v32 = v30._root and v30._root.Enabled or false;
        if v32 then
            for _, v34 in v30._path do
                if not v34.Visible then
                    v32 = false;
                    break;
                end;
            end;
        end;
        if v32 ~= v30.Visible then
            v30.Visible = v32;
            l_BindableEvent_0:Fire(v32);
        end;
    end;
    local function v42() --[[ Line: 134 ]] --[[ Name: BuildAncestryPath ]]
        -- upvalues: v30 (copy), v29 (copy), v35 (copy)
        for _, v37 in v30._conn do
            v37:Disconnect();
        end;
        local v38 = {};
        local v39 = {};
        local v40 = nil;
        local l_v29_0 = v29;
        while l_v29_0 and (l_v29_0:IsA("GuiObject") or l_v29_0:IsA("Folder")) do
            if l_v29_0:IsA("GuiObject") then
                v39[#v39 + 1] = l_v29_0:GetPropertyChangedSignal("Visible"):Connect(v35);
                v38[#v38 + 1] = l_v29_0;
            end;
            l_v29_0 = l_v29_0.Parent;
        end;
        if l_v29_0 and l_v29_0:IsA("LayerCollector") then
            v39[#v39 + 1] = l_v29_0:GetPropertyChangedSignal("Enabled"):Connect(v35);
            v40 = l_v29_0;
        end;
        v30._path = v38;
        v30._conn = v39;
        v30._root = v40;
        v35();
    end;
    v30._ancestry = v29.AncestryChanged:Connect(function(_, _) --[[ Line: 157 ]]
        -- upvalues: v42 (copy)
        v42();
    end);
    v42();
    return v30;
end;
v28.Destroy = function(v45) --[[ Line: 166 ]] --[[ Name: Destroy ]]
    v45._visibleChanged:Fire(false);
    v45._visibleChanged:Destroy();
    v45._ancestry:Disconnect();
    for _, v47 in v45._conn do
        v47:Disconnect();
    end;
end;
local function v71(v48, v49) --[[ Line: 174 ]] --[[ Name: CreateBar ]]
    -- upvalues: v9 (copy), v11 (ref), l_Mouse_0 (copy), l_UserInputService_0 (copy), v10 (ref)
    v49 = v49 or "Y";
    if not v48 or typeof(v48) ~= "Instance" or v48.ClassName ~= "ScrollingFrame" then
        warn("Invalid frame to create custom bar");
        return;
    else
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.Name = v48.Name .. "_Scroller_" .. v49;
        l_TextButton_0.Text = "";
        l_TextButton_0.BackgroundTransparency = 1;
        l_TextButton_0.Visible = v9[v48].Visibility.Visible;
        local l_AbsoluteSize_0 = v48.AbsoluteSize;
        local l_AbsolutePosition_0 = v48.AbsolutePosition;
        local l_ScrollBarThickness_0 = v48.ScrollBarThickness;
        local v54 = nil;
        l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 194 ]]
            -- upvalues: v11 (ref), v54 (ref), l_Mouse_0 (ref), l_UserInputService_0 (ref), v49 (ref), v48 (copy)
            if not v11 and not v54 then
                v11 = true;
                local v55 = Vector2.new(l_Mouse_0.X, l_Mouse_0.Y);
                do
                    local l_v55_0 = v55;
                    v54 = l_UserInputService_0.InputChanged:Connect(function(v57) --[[ Line: 199 ]]
                        -- upvalues: l_v55_0 (ref), v49 (ref), v48 (ref)
                        if v57.UserInputType == Enum.UserInputType.MouseMovement then
                            local v58 = Vector2.new(v57.Position.X, v57.Position.Y);
                            local v59 = v58 - l_v55_0;
                            local v60 = (v49 == "Y" and v59.Y or v59.X) / (v49 == "Y" and v48.AbsoluteWindowSize.Y or v48.AbsoluteWindowSize.X);
                            local l_v48_FirstAncestorWhichIsA_0 = v48:FindFirstAncestorWhichIsA("GuiBase2d");
                            local v62 = Vector2.new(v48.CanvasSize.X.Scale * l_v48_FirstAncestorWhichIsA_0.AbsoluteSize.X + v48.CanvasSize.X.Offset, v48.CanvasSize.Y.Scale * l_v48_FirstAncestorWhichIsA_0.AbsoluteSize.Y + v48.CanvasSize.Y.Offset);
                            v48.CanvasPosition = Vector2.new(v48.CanvasPosition.X + (v49 == "X" and v62.X * v60 or 0), v48.CanvasPosition.Y + (v49 == "Y" and v62.Y * v60 or 0));
                            l_v55_0 = v58;
                        end;
                    end);
                end;
            end;
        end);
        local v64 = l_UserInputService_0.InputEnded:Connect(function(v63) --[[ Line: 220 ]]
            -- upvalues: v54 (ref), v11 (ref)
            if v63.UserInputType == Enum.UserInputType.MouseButton1 and v54 then
                v11 = false;
                v54:Disconnect();
                v54 = nil;
            end;
        end);
        v9[v48].Visibility.Changed:Connect(function(v65) --[[ Line: 228 ]]
            -- upvalues: l_TextButton_0 (copy), v54 (ref), v11 (ref)
            l_TextButton_0.Visible = v65;
            if not v65 and v54 then
                v11 = false;
                v54:Disconnect();
                v54 = nil;
            end;
        end);
        if v49 == "X" then
            l_TextButton_0.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_ScrollBarThickness_0);
            l_TextButton_0.Position = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y - l_ScrollBarThickness_0);
        else
            l_TextButton_0.Size = UDim2.new(0, l_ScrollBarThickness_0, 0, l_AbsoluteSize_0.Y);
            l_TextButton_0.Position = UDim2.new(0, v48.VerticalScrollBarPosition == Enum.VerticalScrollBarPosition.Right and l_AbsolutePosition_0.X + l_AbsoluteSize_0.X - l_ScrollBarThickness_0 or l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y);
        end;
        local v66 = nil;
        v66 = v48.Changed:Connect(function(v67) --[[ Line: 255 ]]
            -- upvalues: v9 (ref), v48 (copy), l_AbsoluteSize_0 (ref), l_AbsolutePosition_0 (ref), l_ScrollBarThickness_0 (ref), v49 (ref), l_TextButton_0 (copy), v66 (ref), v64 (copy), v54 (ref)
            if v9[v48] then
                if v48:FindFirstAncestorWhichIsA("GuiBase2d") and (v67 == "AbsoluteSize" or v67 == "AbsolutePosition" or v67 == "AbsolutePosition" or v67 == "CanvasSize" or v67 == "ScrollBarThickness") then
                    local l_AbsoluteSize_1 = v48.AbsoluteSize;
                    local l_AbsolutePosition_1 = v48.AbsolutePosition;
                    local l_ScrollBarThickness_1 = v48.ScrollBarThickness;
                    l_AbsoluteSize_0 = l_AbsoluteSize_1;
                    l_AbsolutePosition_0 = l_AbsolutePosition_1;
                    l_ScrollBarThickness_0 = l_ScrollBarThickness_1;
                    if v49 == "X" then
                        l_TextButton_0.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_ScrollBarThickness_0);
                        l_TextButton_0.Position = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y - l_ScrollBarThickness_0);
                        return;
                    else
                        l_TextButton_0.Size = UDim2.new(0, l_ScrollBarThickness_0, 0, l_AbsoluteSize_0.Y);
                        l_TextButton_0.Position = UDim2.new(0, v48.VerticalScrollBarPosition == Enum.VerticalScrollBarPosition.Right and l_AbsolutePosition_0.X + l_AbsoluteSize_0.X - l_ScrollBarThickness_0 or l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y);
                        return;
                    end;
                end;
            else
                l_TextButton_0:Destroy();
                v66:Disconnect();
                v64:Disconnect();
                if v54 then
                    v54:Disconnect();
                    v54 = nil;
                end;
            end;
        end);
        l_TextButton_0.Parent = v10;
        return;
    end;
end;
return {
    Enable = function(v72, v73, v74, v75, v76) --[[ Line: 309 ]] --[[ Name: Enable ]]
        -- upvalues: l_UserInputService_0 (copy), v9 (copy), v28 (copy), v7 (copy), v71 (copy)
        if not l_UserInputService_0.TouchEnabled then
            if not v72 or typeof(v72) ~= "Instance" or v72.ClassName ~= "ScrollingFrame" then
                warn("Invalid frame to smooth");
                return;
            elseif not v9[v72] then
                v72.ScrollingEnabled = false;
                local v77 = {};
                local v78 = {};
                for _, v80 in (v72:GetDescendants()) do
                    if v80:IsA("GuiObject") then
                        v77[v80] = v80.Active;
                        v80.Active = false;
                        v78[#v78 + 1] = v80:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 327 ]]
                            -- upvalues: v80 (copy)
                            v80.Active = false;
                        end);
                    end;
                end;
                local l_v72_0 = v72;
                while l_v72_0 and (l_v72_0:IsA("GuiObject") or l_v72_0:IsA("Folder")) do
                    if l_v72_0:IsA("GuiObject") then
                        local l_Active_0 = l_v72_0.Active;
                        v77[l_v72_0] = l_Active_0;
                        l_v72_0.Active = false;
                        v78[#v78 + 1] = l_v72_0:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 338 ]]
                            -- upvalues: l_v72_0 (ref)
                            l_v72_0.Active = false;
                        end);
                    end;
                    l_v72_0 = l_v72_0.Parent;
                end;
                v78[#v78 + 1] = v72.DescendantAdded:Connect(function(v83) --[[ Line: 345 ]]
                    -- upvalues: v9 (ref), v72 (copy)
                    if v83:IsA("GuiObject") then
                        v9[v72].Actives[v83] = v83.Active;
                        v83.Active = false;
                        v9[v72].Connections[#v9[v72].Connections + 1] = v83:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 349 ]]
                            -- upvalues: v83 (copy)
                            v83.Active = false;
                        end);
                    end;
                end);
                if not v76 or v76 ~= "X" and v76 ~= "Y" then
                    v76 = "Y";
                    if v72.CanvasSize.Y.Offset > 0 or v72.CanvasSize.Y.Scale > 0 then
                        v76 = "Y";
                    elseif v72.CanvasSize.X.Offset > 0 or v72.CanvasSize.X.Scale > 0 then
                        v76 = "X";
                    end;
                end;
                v9[v72] = {
                    Connections = v78, 
                    Actives = v77, 
                    Velocity = 0, 
                    LastPos = 0, 
                    Visibility = v28.new(v72), 
                    Inverted = v75, 
                    Axis = v76, 
                    Frict = math.clamp(type(v74) == "number" and v74 or 0.78, 0.2, 0.99), 
                    Sens = math.clamp(type(v73) == "number" and v73 or v7, 0.01, 1.0E17)
                };
                v71(v72, "X");
                v71(v72, "Y");
                return;
            else
                v9[v72].Sens = math.clamp(type(v73) == "number" and v73 or v7, 0.01, 1.0E17);
                v9[v72].Frict = math.clamp(type(v74) == "number" and v74 or 0.78, 0.2, 0.99);
                v9[v72].Inverted = v75;
                return;
            end;
        else
            warn("SmoothScroll only works for PC");
            return;
        end;
    end, 
    Disable = function(v84) --[[ Line: 402 ]] --[[ Name: Disable ]]
        -- upvalues: v9 (copy)
        if v9[v84] then
            v84.ScrollingEnabled = true;
            for _, v86 in v9[v84].Connections do
                v86:Disconnect();
            end;
            v9[v84].Visibility:Destroy();
            for v87, v88 in v9[v84].Actives do
                v87.Active = v88;
            end;
            v9[v84] = nil;
        end;
    end
};