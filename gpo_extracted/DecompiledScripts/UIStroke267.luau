local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Sift);
local v2 = require(l_Parent_0.Roact);
local l_createElement_0 = v2.createElement;
local v4 = v2.PureComponent:extend(script.Name);
v4.defaultProps = {
    Thickness = 1, 
    BorderMode = Enum.BorderMode.Inset
};
v4.ClearConnections = function(v5) --[[ Line: 17 ]] --[[ Name: ClearConnections ]]
    if v5.SizeChangedConnection then
        v5.SizeChangedConnection = v5.SizeChangedConnection:Disconnect();
    end;
    if v5.CornerChangedConnection then
        v5.CornerChangedConnection = v5.CornerChangedConnection:Disconnect();
    end;
    if v5.ChildAddedConnection then
        v5.ChildAddedConnection = v5.ChildAddedConnection:Disconnect();
    end;
end;
v4.willUnmount = function(v6) --[[ Line: 32 ]] --[[ Name: willUnmount ]]
    v6:ClearConnections();
end;
v4.ApplyChanges = function(v7, v8) --[[ Line: 36 ]] --[[ Name: ApplyChanges ]]
    local l_props_0 = v7.props;
    local v10 = v8 and v8.Parent;
    if v8 and v10 and v10:IsA("GuiObject") then
        local l_AbsoluteSize_0 = v10.AbsoluteSize;
        v8.Size = UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y) - (l_props_0.BorderMode == Enum.BorderMode.Inset and UDim2.fromOffset(l_props_0.Thickness * 2, l_props_0.Thickness * 2) or UDim2.new());
        local l_UICorner_0 = v10:FindFirstChildOfClass("UICorner");
        if l_UICorner_0 then
            if not v7.CornerChangedConnection then
                v7.CornerChangedConnection = l_UICorner_0:GetPropertyChangedSignal("CornerRadius"):Connect(function() --[[ Line: 52 ]]
                    -- upvalues: v7 (copy), v8 (copy)
                    v7:ApplyChanges(v8);
                end);
            end;
            v8.Corner.CornerRadius = l_UICorner_0.CornerRadius - (l_props_0.BorderMode == Enum.BorderMode.Inset and UDim.new(0, l_props_0.Thickness) or UDim.new());
        end;
    end;
end;
v4.render = function(v13) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_createElement_0 (copy), v2 (copy)
    local l_props_1 = v13.props;
    local v15 = v1.Dictionary.copy(l_props_1);
    v15.BorderMode = nil;
    return l_createElement_0("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0.5), 
        [v2.Ref] = function(v16) --[[ Line: 74 ]]
            -- upvalues: v13 (copy)
            if v16 and v16.Parent and v16.Parent:IsA("GuiObject") then
                v13:ClearConnections();
                v13:ApplyChanges(v16);
                v13.ChildAddedConnection = v16.Parent.ChildAdded:Connect(function() --[[ Line: 83 ]]
                    -- upvalues: v13 (ref), v16 (copy)
                    v13:ApplyChanges(v16);
                end);
                v13.SizeChangedConnection = v16.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 88 ]]
                    -- upvalues: v13 (ref), v16 (copy)
                    v13:ApplyChanges(v16);
                end);
            end;
        end
    }, {
        Stroke = l_createElement_0("UIStroke", v15), 
        Corner = l_createElement_0("UICorner", {
            CornerRadius = UDim.new(0, 0)
        })
    });
end;
return v4;