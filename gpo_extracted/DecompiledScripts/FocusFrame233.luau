local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Sift);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Roact);
local l_createElement_0 = v3.createElement;
local v5 = v3.PureComponent:extend(script.Name);
v5.defaultProps = {
    Priority = 1, 
    RelativeToParent = false, 
    ConsumeInput = true, 
    BackgroundTransparency = 1, 
    Size = UDim2.fromScale(1, 1)
};
v5.validateProps = v2.interface({
    Priority = v2.optional(v2.number), 
    Reason = v2.string, 
    RelativeToParent = v2.optional(v2.boolean), 
    ConsumeInput = v2.optional(v2.boolean), 
    [v3.Event.FocusLost] = v2.optional(v2.callback)
});
v5.init = function(v6) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_props_0 = v6.props;
    v6.Connections = {};
    local v8 = v1.Dictionary.copy(l_props_0);
    v8.Priority = nil;
    v8.RelativeToParent = nil;
    v8.Reason = nil;
    v8.ConsumeInput = nil;
    v8[v3.Event.FocusLost] = nil;
    v6.SafeProps = v8;
    v6.rbx = l_props_0[v3.Ref] or v3.createRef();
end;
v5.didMount = function(v9) --[[ Line: 65 ]] --[[ Name: didMount ]]
    local l_SafeProps_0 = v9.SafeProps;
    local l_Frame_0 = Instance.new("Frame");
    for v12, v13 in pairs(l_SafeProps_0) do
        if typeof(v12) == "string" then
            l_Frame_0[v12] = v13;
        end;
    end;
    v9.WrapperFrame = l_Frame_0;
    v9:Update();
    local l_current_0 = v9.rbx.current;
    if not l_current_0:FindFirstAncestorWhichIsA("GuiMain") then
        local _ = l_current_0:FindFirstAncestorWhichIsA("PluginGui");
    end;
    v9.Connections.Changed = l_current_0.Changed:Connect(function() --[[ Line: 94 ]]
        -- upvalues: v9 (copy)
        v9:Update();
    end);
end;
v5.didUpdate = function(v16) --[[ Line: 99 ]] --[[ Name: didUpdate ]]
    v16:Update();
end;
v5.Update = function(v17) --[[ Line: 103 ]] --[[ Name: Update ]]
    local l_props_1 = v17.props;
    local l_current_1 = v17.rbx.current;
    local l_WrapperFrame_0 = v17.WrapperFrame;
    local v21 = l_current_1:FindFirstAncestorWhichIsA("GuiMain") or l_current_1:FindFirstAncestorWhichIsA("PluginGui");
    if not v21 then
        return;
    else
        if l_props_1.ConsumeInput and not v17.InputConsumer then
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.BackgroundTransparency = 1;
            l_ImageButton_0.Size = UDim2.fromScale(1, 1);
            v17.Connections.InputConsumerHover = l_ImageButton_0.MouseEnter:Connect(function() --[[ Line: 123 ]]

            end);
            v17.Connections.InputConsumerFocusLost = l_ImageButton_0.MouseButton1Down:Connect(function() --[[ Line: 124 ]]
                -- upvalues: v17 (copy)
                v17:ReleaseFocus();
            end);
            v17.InputConsumer = l_ImageButton_0;
            l_ImageButton_0.Parent = v21;
            local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
            l_ScrollingFrame_0.Size = UDim2.fromScale(1, 1);
            l_ScrollingFrame_0.ScrollingEnabled = true;
            l_ScrollingFrame_0.CanvasSize = UDim2.fromScale(1, 1);
            l_ScrollingFrame_0.BorderSizePixel = 1;
            l_ScrollingFrame_0.BackgroundTransparency = 1;
            l_ScrollingFrame_0.ScrollBarImageTransparency = 1;
            l_ScrollingFrame_0.ScrollBarThickness = 0;
            l_ScrollingFrame_0.Parent = l_ImageButton_0;
        end;
        local l_AbsoluteSize_0 = l_current_1.AbsoluteSize;
        local l_AbsolutePosition_0 = l_current_1.AbsolutePosition;
        local l_AbsoluteRotation_0 = l_current_1.AbsoluteRotation;
        l_WrapperFrame_0.Size = UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
        l_WrapperFrame_0.Position = UDim2.fromOffset(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y);
        l_WrapperFrame_0.Rotation = l_AbsoluteRotation_0;
        for _, v28 in pairs(l_current_1:GetChildren()) do
            v28.Parent = l_WrapperFrame_0;
        end;
        l_WrapperFrame_0.ZIndex = l_props_1.Priority;
        l_WrapperFrame_0.Parent = v21;
        return;
    end;
end;
v5.ReleaseFocus = function(v29) --[[ Line: 166 ]] --[[ Name: ReleaseFocus ]]
    -- upvalues: v3 (copy)
    if v29.props[v3.Event.FocusLost] then
        task.spawn(v29.props[v3.Event.FocusLost], v29.rbx.current);
    end;
end;
v5.Cleanup = function(v30) --[[ Line: 173 ]] --[[ Name: Cleanup ]]
    v30.WrapperFrame:Destroy();
    if v30.InputConsumer then
        v30.InputConsumer:Destroy();
    end;
    for _, v32 in pairs(v30.Connections) do
        pcall(v32.Disconnect, v32);
    end;
end;
v5.willUnmount = function(v33) --[[ Line: 185 ]] --[[ Name: willUnmount ]]
    v33:Cleanup();
end;
v5.render = function(v34) --[[ Line: 189 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy), v3 (copy)
    local l_SafeProps_1 = v34.SafeProps;
    return l_createElement_0("Frame", v1.Dictionary.join({
        [v3.Ref] = v34.rbx
    }, l_SafeProps_1));
end;
return v5;