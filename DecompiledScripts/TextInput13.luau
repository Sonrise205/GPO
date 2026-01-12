local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Theme);
local l_WithTheme_0 = v2.WithTheme;
local l_ApplyDescription_0 = v2.ApplyDescription;
local l_RegisterStateAction_0 = v2.RegisterStateAction;
local _ = require(l_Parent_1.Sift);
local v7 = require(l_Parent_1.t);
local v8 = require(l_Parent_1.Roact);
local _ = v8.createElement;
local l_Parent_2 = script.Parent;
local _ = require(l_Parent_2.Descriptions.TextInputDescriptions);
local v12 = v8.PureComponent:extend(script.Name);
v12.StyleBindings = {
    "Button", 
    "Highlight", 
    "Stroke", 
    "Text"
};
v12.defaultProps = {
    Text = v7.optional(v7.string), 
    Native = v7.optional(v7.table), 
    [v8.Children] = v7.optional(v7.table), 
    [v8.Event.Activated] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Down] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Up] = v7.optional(v7.callback), 
    [v8.Event.MouseEnter] = v7.optional(v7.callback), 
    [v8.Event.MouseLeave] = v7.optional(v7.callback)
};
v12.validateProps = v7.strictInterface({});
v12.init = function(v13) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_RegisterStateAction_0 (copy)
    local l_props_0 = v13.props;
    local v15, v16 = v8.createBinding(l_props_0.Text);
    v13.Text = v15;
    v13.SetText = v16;
    for _, v18 in pairs(v13.StyleBindings) do
        local v19 = "Set" .. v18;
        local v20, v21 = v8.createBinding({});
        v13[v18] = v20;
        v13[v19] = v21;
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
v12.willUnmount = function(v22) --[[ Line: 86 ]] --[[ Name: willUnmount ]]
    for _, v24 in pairs(v22.StyleBindings) do
        local v25 = v22[v24 .. "Motor"];
        if v25 then
            pcall(v25.destroy, v25);
            v22[v24 .. "Motor"] = nil;
        end;
    end;
end;
v12.ApplyDescription = function(v26, v27, v28) --[[ Line: 102 ]] --[[ Name: ApplyDescription ]]
    -- upvalues: l_ApplyDescription_0 (copy)
    return l_ApplyDescription_0(v26, v27, v28, v28["styles/AnimationSpringParams/Control/Input/Button/Color"], v28["styles/AnimationSpringParams/Control/Input/Button/Transparency"]);
end;
v12.render = function(v29) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy)
    local _ = v29.props;
    local l_state_0 = v29.state;
    return l_WithTheme_0(function(_) --[[ Line: 110 ]]
        -- upvalues: l_state_0 (copy)
        if l_state_0.State == "Focused" then

        end;
    end);
end;
return v12;