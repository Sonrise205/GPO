local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Theme);
local l_WithTheme_0 = v2.WithTheme;
local l_RegisterStateAction_0 = v2.RegisterStateAction;
local l_ApplyDescription_0 = v2.ApplyDescription;
local v6 = require(l_Parent_1.Sift);
local v7 = require(l_Parent_1.t);
local v8 = require(l_Parent_1.Roact);
local l_createElement_0 = v8.createElement;
local l_Parent_2 = script.Parent;
local v11 = require(l_Parent_2.Descriptions);
local v12 = v8.PureComponent:extend(script.Name);
v12.StyleBindings = {
    "Text"
};
v12.defaultProps = {
    Size = UDim2.fromScale(1, 1), 
    Text = "Hyperlink"
};
v12.validateProps = v7.strictInterface({
    AutomaticSize = v7.optional(v7.enum(Enum.AutomaticSize)), 
    Disabled = v7.optional(v7.boolean), 
    Text = v7.optional(v7.string), 
    TextXAlignment = v7.optional(v7.enum(Enum.TextXAlignment)), 
    TextYAlignment = v7.optional(v7.enum(Enum.TextYAlignment)), 
    Size = v7.optional(v7.UDim2), 
    AnchorPoint = v7.optional(v7.Vector2), 
    Position = v7.optional(v7.UDim2), 
    LayoutOrder = v7.optional(v7.number), 
    Native = v7.optional(v7.table), 
    [v8.Event.Activated] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Down] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Up] = v7.optional(v7.callback), 
    [v8.Event.MouseEnter] = v7.optional(v7.callback), 
    [v8.Event.MouseLeave] = v7.optional(v7.callback)
});
v12.init = function(v13) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_RegisterStateAction_0 (copy)
    for _, v15 in pairs(v13.StyleBindings) do
        local v16 = "Set" .. v15;
        local v17, v18 = v8.createBinding({});
        v13[v15] = v17;
        v13[v16] = v18;
    end;
    l_RegisterStateAction_0(v13, v8.Event.Activated, nil);
    l_RegisterStateAction_0(v13, v8.Event.MouseButton1Down, "Pressed");
    l_RegisterStateAction_0(v13, v8.Event.MouseButton1Up, "Hover");
    l_RegisterStateAction_0(v13, v8.Event.MouseEnter, "Hover");
    l_RegisterStateAction_0(v13, v8.Event.MouseLeave, "Rest");
    v13:setState({
        State = "Rest"
    });
end;
v12.willUnmount = function(v19) --[[ Line: 101 ]] --[[ Name: willUnmount ]]
    for _, v21 in pairs(v19.StyleBindings) do
        local v22 = v19[v21 .. "Motor"];
        if v22 then
            pcall(v22.destroy, v22);
            v19[v21 .. "Motor"] = nil;
        end;
    end;
end;
v12.ApplyDescription = function(v23, v24, v25) --[[ Line: 117 ]] --[[ Name: ApplyDescription ]]
    -- upvalues: l_ApplyDescription_0 (copy)
    l_ApplyDescription_0(v23, v24, v25, v25["styles/AnimationSpringParams/Control/Input/Button/Transparency"], v25["styles/AnimationSpringParams/Control/Input/Button/Color"]);
end;
v12.render = function(v26) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), v11 (copy), l_createElement_0 (copy), v6 (copy), v8 (copy)
    local l_props_0 = v26.props;
    local l_state_0 = v26.state;
    return l_WithTheme_0(function(v29) --[[ Line: 125 ]]
        -- upvalues: l_props_0 (copy), v26 (copy), v11 (ref), l_state_0 (copy), l_createElement_0 (ref), v6 (ref), v8 (ref)
        if l_props_0.Disabled then
            v26:ApplyDescription(v11.Disabled, v29);
        elseif l_state_0.State == "Rest" then
            v26:ApplyDescription(v11.Rest, v29);
        elseif l_state_0.State == "Hover" then
            v26:ApplyDescription(v11.Hover, v29);
        elseif l_state_0.State == "Pressed" then
            v26:ApplyDescription(v11.Pressed, v29);
        end;
        local v30 = v29["fonts/Body"];
        return l_createElement_0("TextButton", v6.Dictionary.join({
            AutomaticSize = l_props_0.AutomaticSize, 
            AnchorPoint = l_props_0.AnchorPoint, 
            BackgroundTransparency = 1, 
            FontFace = v30.Font, 
            LayoutOrder = l_props_0.LayoutOrder, 
            LineHeight = v30.LineHeight, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            Text = l_props_0.Text, 
            TextSize = v30.Size, 
            TextXAlignment = l_props_0.TextXAlignment, 
            TextYalignment = l_props_0.TextYAlignment, 
            [v8.Event.Activated] = v26[v8.Event.Activated], 
            [v8.Event.MouseButton1Down] = v26[v8.Event.MouseButton1Down], 
            [v8.Event.MouseButton1Up] = v26[v8.Event.MouseButton1Up], 
            [v8.Event.MouseEnter] = v26[v8.Event.MouseEnter], 
            [v8.Event.MouseLeave] = v26[v8.Event.MouseLeave], 
            TextColor3 = v26.Text:map(function(v31) --[[ Line: 162 ]]
                return v31.Color;
            end), 
            TextTransparency = v26.Text:map(function(v32) --[[ Line: 165 ]]
                return v32.Transparency;
            end)
        }, l_props_0.Native));
    end);
end;
return v12;