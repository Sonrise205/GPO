local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Theme);
local l_WithTheme_0 = v2.WithTheme;
local l_ApplyDescription_0 = v2.ApplyDescription;
local l_RegisterStateAction_0 = v2.RegisterStateAction;
local l_Validators_0 = l_Parent_0.Validators;
local v7 = require(l_Validators_0.StyleValidator);
local v8 = require(l_Parent_1.Sift);
local v9 = require(l_Parent_1.t);
local v10 = require(l_Parent_1.Roact);
local l_createElement_0 = v10.createElement;
local l_Parent_2 = script.Parent;
local v13 = require(l_Parent_2.Validators.ButtonStyleValidator);
local v14 = require(l_Parent_2.Descriptions.ButtonStateDescriptions);
local v15 = v10.PureComponent:extend(script.Name);
v15.StyleBindings = {
    "Fill", 
    "Stroke", 
    "Text"
};
v15.defaultProps = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    BorderSizePixel = 1, 
    Font = "fonts/Body", 
    Position = UDim2.fromScale(0.5, 0.5), 
    Size = UDim2.fromOffset(240, 30), 
    Style = "Standard", 
    Text = "Text"
};
v15.validateProps = v9.strictInterface({
    AnchorPoint = v9.optional(v9.Vector2), 
    BackgroundColor = v9.optional(v7), 
    BorderColor = v9.optional(v7), 
    BorderSizePixel = v9.optional(v9.numberPositive), 
    CornerRadius = v9.optional(v9.UDim), 
    Disabled = v9.optional(v9.boolean), 
    Font = v9.optional(v7), 
    LayoutOrder = v9.optional(v9.number), 
    Position = v9.optional(v9.UDim2), 
    Size = v9.optional(v9.UDim2), 
    Style = v9.optional(v13), 
    Text = v9.optional(v9.string), 
    Native = v9.optional(v9.table), 
    [v10.Children] = v9.optional(v9.table), 
    [v10.Event.Activated] = v9.optional(v9.callback), 
    [v10.Event.MouseButton1Down] = v9.optional(v9.callback), 
    [v10.Event.MouseButton1Up] = v9.optional(v9.callback), 
    [v10.Event.MouseEnter] = v9.optional(v9.callback), 
    [v10.Event.MouseLeave] = v9.optional(v9.callback)
});
v15.init = function(v16) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), l_RegisterStateAction_0 (copy)
    for _, v18 in pairs(v16.StyleBindings) do
        local v19 = "Set" .. v18;
        local v20, v21 = v10.createBinding({});
        v16[v18] = v20;
        v16[v19] = v21;
    end;
    l_RegisterStateAction_0(v16, v10.Event.Activated, nil);
    l_RegisterStateAction_0(v16, v10.Event.MouseButton1Down, "Pressed");
    l_RegisterStateAction_0(v16, v10.Event.MouseButton1Up, "Hover");
    l_RegisterStateAction_0(v16, v10.Event.MouseEnter, "Hover");
    l_RegisterStateAction_0(v16, v10.Event.MouseLeave, "Rest");
    v16:setState({
        State = "Rest"
    });
end;
v15.willUnmount = function(v22) --[[ Line: 125 ]] --[[ Name: willUnmount ]]
    for _, v24 in pairs(v22.StyleBindings) do
        local v25 = v22[v24 .. "Motor"];
        if v25 then
            pcall(v25.destroy, v25);
            v22[v24 .. "Motor"] = nil;
        end;
    end;
end;
v15.ApplyDescription = function(v26, v27, v28) --[[ Line: 141 ]] --[[ Name: ApplyDescription ]]
    -- upvalues: v8 (copy), l_ApplyDescription_0 (copy)
    local l_props_0 = v26.props;
    v27 = v8.Dictionary.copy(v27);
    local l_BackgroundColor_0 = l_props_0.BackgroundColor;
    local l_BorderColor_0 = l_props_0.BorderColor;
    local l_TextColor_0 = l_props_0.TextColor;
    if l_BackgroundColor_0 then
        v27.Fill = l_BackgroundColor_0;
    end;
    if l_BorderColor_0 then
        v27.Stroke = l_BorderColor_0;
    end;
    if l_TextColor_0 then
        v27.Text = l_TextColor_0;
    end;
    l_ApplyDescription_0(v26, v27, v28, v28["styles/AnimationSpringParams/Control/Input/Button/Color"], v28["styles/AnimationSpringParams/Control/Input/Button/Transparency"]);
end;
v15.render = function(v33) --[[ Line: 165 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), v14 (copy), l_createElement_0 (copy), v10 (copy), v8 (copy)
    local l_props_1 = v33.props;
    local l_state_0 = v33.state;
    return l_WithTheme_0(function(v36) --[[ Line: 169 ]]
        -- upvalues: l_props_1 (copy), v33 (copy), v14 (ref), l_state_0 (copy), l_createElement_0 (ref), v10 (ref), v8 (ref)
        if l_props_1.Style == "Accent" then
            if l_props_1.Disabled then
                v33:ApplyDescription(v14.Accent.Disabled, v36);
            elseif l_state_0.State == "Rest" then
                v33:ApplyDescription(v14.Accent.Rest, v36);
            elseif l_state_0.State == "Hover" then
                v33:ApplyDescription(v14.Accent.Hover, v36);
            elseif l_state_0.State == "Pressed" then
                v33:ApplyDescription(v14.Accent.Pressed, v36);
            end;
        elseif l_props_1.Style == "Standard" or l_props_1.Style == "Default" then
            if l_props_1.Disabled then
                v33:ApplyDescription(v14.Standard.Disabled, v36);
            elseif l_state_0.State == "Rest" then
                v33:ApplyDescription(v14.Standard.Rest, v36);
            elseif l_state_0.State == "Hover" then
                v33:ApplyDescription(v14.Standard.Hover, v36);
            elseif l_state_0.State == "Pressed" then
                v33:ApplyDescription(v14.Standard.Pressed, v36);
            end;
        elseif l_props_1.Style == "Primary" then
            if l_props_1.Disabled then
                v33:ApplyDescription(v14.Primary.Disabled, v36);
            elseif l_state_0.State == "Rest" then
                v33:ApplyDescription(v14.Primary.Rest, v36);
            elseif l_state_0.State == "Hover" then
                v33:ApplyDescription(v14.Primary.Hover, v36);
            elseif l_state_0.State == "Pressed" then
                v33:ApplyDescription(v14.Primary.Pressed, v36);
            end;
        elseif l_props_1.Style == "Secondary" then
            if l_props_1.Disabled then
                v33:ApplyDescription(v14.Secondary.Disabled, v36);
            elseif l_state_0.State == "Rest" then
                v33:ApplyDescription(v14.Secondary.Rest, v36);
            elseif l_state_0.State == "Hover" then
                v33:ApplyDescription(v14.Secondary.Hover, v36);
            elseif l_state_0.State == "Pressed" then
                v33:ApplyDescription(v14.Secondary.Pressed, v36);
            end;
        end;
        local v40 = l_createElement_0("UIStroke", {
            Enabled = not l_props_1.Disabled, 
            ApplyStrokeMode = "Border", 
            Thickness = l_props_1.BorderSizePixel, 
            Color = v33.Stroke:map(function(v37) --[[ Line: 221 ]]
                return v37.Color;
            end)
        }, {
            Gradient = l_createElement_0("UIGradient", {
                Rotation = 90, 
                Color = v33.Stroke:map(function(v38) --[[ Line: 229 ]]
                    return v38.ColorSequence or ColorSequence.new(v38.Color);
                end), 
                Transparency = v33.Stroke:map(function(v39) --[[ Line: 232 ]]
                    return v39.TransparencySequence or NumberSequence.new(v39.Transparency);
                end)
            })
        });
        local v41 = v36[l_props_1.Font];
        local v46 = l_createElement_0("TextButton", {
            AutoButtonColor = false, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            FontFace = v41.Font, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(2, 2), 
            Text = l_props_1.Text, 
            TextSize = v41.Size, 
            BackgroundColor3 = v33.Fill:map(function(v42) --[[ Line: 251 ]]
                return v42.Color;
            end), 
            BackgroundTransparency = v33.Fill:map(function(v43) --[[ Line: 254 ]]
                return v43.Transparency;
            end), 
            TextColor3 = v33.Text:map(function(v44) --[[ Line: 257 ]]
                return v44.Color;
            end), 
            TextTransparency = v33.Text:map(function(v45) --[[ Line: 260 ]]
                return v45.Transparency;
            end), 
            [v10.Event.Activated] = v33[v10.Event.Activated], 
            [v10.Event.MouseButton1Down] = v33[v10.Event.MouseButton1Down], 
            [v10.Event.MouseButton1Up] = v33[v10.Event.MouseButton1Up], 
            [v10.Event.MouseEnter] = v33[v10.Event.MouseEnter], 
            [v10.Event.MouseLeave] = v33[v10.Event.MouseLeave]
        }, {
            Stroke = v40, 
            Corners = l_createElement_0("UICorner", {
                CornerRadius = l_props_1.CornerRadius or UDim.new(0, v36["styles/CornerRadius/Default/Inner"])
            })
        });
        local v47 = l_props_1[v10.Children] and l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, l_props_1[v10.Children]) or nil;
        return l_createElement_0("Frame", v8.Dictionary.join({
            AnchorPoint = l_props_1.AnchorPoint, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_1.LayoutOrder, 
            Position = l_props_1.Position, 
            Size = l_props_1.Size
        }, l_props_1.Native), {
            Button = v46, 
            ContentWrapper = v47
        });
    end);
end;
return v15;