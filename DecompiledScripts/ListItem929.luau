local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Theme);
local l_WithTheme_0 = v2.WithTheme;
local l_ApplyDescription_0 = v2.ApplyDescription;
local l_RegisterStateAction_0 = v2.RegisterStateAction;
local l_Validators_0 = l_Parent_0.Validators;
local v7 = require(l_Validators_0.StyleValidator);
local v8 = require(l_Parent_1.Flipper);
local v9 = require(l_Parent_1.Sift);
local v10 = require(l_Parent_1.t);
local v11 = require(l_Parent_1.Roact);
local l_createElement_0 = v11.createElement;
local l_Parent_2 = script.Parent;
local v14 = require(l_Parent_2.Descriptions.ListItemDescriptions);
local v15 = v11.PureComponent:extend(script.Name);
v15.StyleBindings = {
    "Fill", 
    "Indicator", 
    "Stroke", 
    "Text"
};
v15.defaultProps = {
    Width = UDim.new(0, 160), 
    Height = UDim.new(0, 40), 
    ShowIndicator = true, 
    Font = "fonts/Body"
};
v15.validateProps = v10.strictInterface({
    Selected = v10.optional(v10.boolean), 
    Size = v10.optional(v10.UDim2), 
    ShowIndicator = v10.optional(v10.boolean), 
    Font = v10.optional(v7), 
    AnchorPoint = v10.optional(v10.Vector2), 
    Disabled = v10.optional(v10.boolean), 
    LayoutOrder = v10.optional(v10.number), 
    Position = v10.optional(v10.UDim2), 
    Width = v10.optional(v10.UDim), 
    Height = v10.optional(v10.UDim), 
    Text = v10.optional(v10.string), 
    Icon = v10.optional(v7), 
    Native = v10.optional(v10.table), 
    [v11.Event.Activated] = v10.optional(v10.callback), 
    [v11.Event.MouseButton1Down] = v10.optional(v10.callback), 
    [v11.Event.MouseButton1Up] = v10.optional(v10.callback), 
    [v11.Event.MouseEnter] = v10.optional(v10.callback), 
    [v11.Event.MouseLeave] = v10.optional(v10.callback)
});
v15.init = function(v16) --[[ Line: 101 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_RegisterStateAction_0 (copy)
    local v17, v18 = v11.createBinding(0);
    v16.IndicatorHeight = v17;
    v16.SetIndicatorHeight = v18;
    for _, v20 in pairs(v16.StyleBindings) do
        local v21 = "Set" .. v20;
        local v22, v23 = v11.createBinding({});
        v16[v20] = v22;
        v16[v21] = v23;
    end;
    l_RegisterStateAction_0(v16, v11.Event.Activated, nil);
    l_RegisterStateAction_0(v16, v11.Event.MouseButton1Down, "Pressed");
    l_RegisterStateAction_0(v16, v11.Event.MouseButton1Up, "Hover");
    l_RegisterStateAction_0(v16, v11.Event.MouseEnter, "Hover");
    l_RegisterStateAction_0(v16, v11.Event.MouseLeave, "Rest");
    v16:setState({
        State = "Rest"
    });
end;
v15.willUnmount = function(v24) --[[ Line: 124 ]] --[[ Name: willUnmount ]]
    for _, v26 in pairs(v24.StyleBindings) do
        local v27 = v24[v26 .. "Motor"];
        if v27 then
            pcall(v27.Destroy, v27);
            v24[v26 .. "Motor"] = nil;
        end;
    end;
end;
v15.ApplyDescription = function(v28, v29, v30) --[[ Line: 140 ]] --[[ Name: ApplyDescription ]]
    -- upvalues: v9 (copy), v8 (copy), l_ApplyDescription_0 (copy)
    local l_props_0 = v28.props;
    v29 = v9.Dictionary.copy(v29);
    local l_BackgroundColor_0 = l_props_0.BackgroundColor;
    local l_TextColor_0 = l_props_0.TextColor;
    if l_BackgroundColor_0 then
        v29.Fill = l_BackgroundColor_0;
    end;
    if l_TextColor_0 then
        v29.Text = l_TextColor_0;
    end;
    local v34 = v28.IndicatorHeight:getValue();
    if v34 then
        local l_IndicatorHeightMotor_0 = v28.IndicatorHeightMotor;
        if l_IndicatorHeightMotor_0 then
            pcall(l_IndicatorHeightMotor_0.destroy, l_IndicatorHeightMotor_0);
        end;
        local v36 = v8.SingleMotor.new(v34);
        v28.IndicatorHeightMotor = v36;
        v36:onStep(v28.SetIndicatorHeight);
        v36:onComplete(function() --[[ Line: 175 ]]
            -- upvalues: v36 (copy), v28 (copy)
            v36:destroy();
            v28.IndicatorHeightMotor = nil;
        end);
        v36:setGoal(v8.Spring.new(v29.IndicatorHeight, v30["styles/AnimationSpringParams/Control/List/ListItem/Indicator"]));
    else
        v28.SetIndicatorHeight(v29.IndicatorHeight);
    end;
    l_ApplyDescription_0(v28, v29, v30, "styles/AnimationSpringParams/Control/List/ListItem/Color", "styles/AnimationSpringParams/Control/List/ListItem/Transparency");
end;
v15.render = function(v37) --[[ Line: 191 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), v14 (copy), l_createElement_0 (copy), v11 (copy), v9 (copy)
    local l_props_1 = v37.props;
    local l_state_0 = v37.state;
    return l_WithTheme_0(function(v40) --[[ Line: 195 ]]
        -- upvalues: l_props_1 (copy), v37 (copy), v14 (ref), l_state_0 (copy), l_createElement_0 (ref), v11 (ref), v9 (ref)
        if not l_props_1.Selected then
            if l_props_1.Disabled then
                v37:ApplyDescription(v14.NoFill.Disabled, v40);
            elseif l_state_0.State == "Rest" then
                v37:ApplyDescription(v14.NoFill.Rest, v40);
            elseif l_state_0.State == "Hover" then
                v37:ApplyDescription(v14.NoFill.Hover, v40);
            else
                v37:ApplyDescription(v14.NoFill.Pressed, v40);
            end;
        elseif l_props_1.Disabled then
            v37:ApplyDescription(v14.Fill.Disabled, v40);
        elseif l_state_0.State == "Rest" then
            v37:ApplyDescription(v14.Fill.Rest, v40);
        elseif l_state_0.State == "Hover" then
            v37:ApplyDescription(v14.Fill.Hover, v40);
        else
            v37:ApplyDescription(v14.Fill.Pressed, v40);
        end;
        local v41 = v40[l_props_1.Font];
        local v44 = l_createElement_0("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            FontFace = v41.Font, 
            Position = UDim2.new(0, 16 + (l_props_1.Icon and 28 or 0), 0.5, 0), 
            Size = UDim2.new(0, 10, 1, 0), 
            Text = l_props_1.Text, 
            TextSize = v41.Size, 
            TextXAlignment = "Left", 
            TextColor3 = v37.Text:map(function(v42) --[[ Line: 234 ]]
                return v42.Color;
            end), 
            TextTransparency = v37.Text:map(function(v43) --[[ Line: 237 ]]
                return v43.Transparency;
            end)
        });
        local v48 = l_createElement_0("Frame", {
            Visible = l_props_1.ShowIndicator, 
            AnchorPoint = Vector2.new(0, 0.5), 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 5, 0.5, 0), 
            BackgroundColor3 = v37.Indicator:map(function(v45) --[[ Line: 250 ]]
                return v45.Color;
            end), 
            BackgroundTransparency = v37.Indicator:map(function(v46) --[[ Line: 253 ]]
                return v46.Transparency;
            end), 
            Size = v37.IndicatorHeight:map(function(v47) --[[ Line: 256 ]]
                return UDim2.fromOffset(3, v47);
            end)
        }, {
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        });
        local v53 = l_createElement_0("ImageButton", {
            AnchorPoint = Vector2.new(0, 0.5), 
            AutoButtonColor = false, 
            Size = UDim2.new(1, -8, 1, -4) - UDim2.fromOffset(2, 2), 
            Position = UDim2.new(0, 4, 0.5, 0) + UDim2.fromOffset(1, 0), 
            BackgroundColor3 = v37.Fill:map(function(v49) --[[ Line: 274 ]]
                return v49.Color;
            end), 
            BackgroundTransparency = v37.Fill:map(function(v50) --[[ Line: 277 ]]
                return v50.Transparency;
            end), 
            [v11.Event.Activated] = v37[v11.Event.Activated], 
            [v11.Event.MouseButton1Down] = v37[v11.Event.MouseButton1Down], 
            [v11.Event.MouseButton1Up] = v37[v11.Event.MouseButton1Up], 
            [v11.Event.MouseEnter] = v37[v11.Event.MouseEnter], 
            [v11.Event.MouseLeave] = v37[v11.Event.MouseLeave]
        }, {
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, v40["styles/CornerRadius/Default/Inner"] - 1)
            }), 
            Stroke = l_createElement_0("UIStroke", {
                Thickness = 1, 
                Color = v37.Stroke:map(function(v51) --[[ Line: 293 ]]
                    return v51.Color;
                end), 
                Transparency = v37.Stroke:map(function(v52) --[[ Line: 296 ]]
                    return v52.Transparency;
                end)
            })
        });
        local v54 = l_props_1.Icon and v40[l_props_1.Icon];
        local v55 = nil;
        if v54 then
            local v56 = v54.ImageRectSize == Vector2.new() and Vector2.new(16, 16) or v54.ImageRectSize;
            v55 = UDim2.fromOffset(math.clamp(v56.X, 0, 36), (math.clamp(v56.Y, 0, 36)));
        else
            v55 = UDim2.fromOffset(16, 16);
        end;
        local v59 = v54 and l_createElement_0("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v54.Image, 
            ImageRectOffset = v54.ImageRectOffset, 
            ImageRectSize = v54.ImageRectSize, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ResampleMode = v54.ResampleMode, 
            Size = v55, 
            ImageColor3 = v37.Text:map(function(v57) --[[ Line: 327 ]]
                return v57.Color;
            end), 
            ImageTransparency = v37.Text:map(function(v58) --[[ Line: 330 ]]
                return v58.Transparency;
            end)
        });
        local v60 = l_createElement_0("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 24, 0.5, 0), 
            Size = UDim2.new(0, 0, 1, 0)
        }, v59);
        return l_createElement_0("Frame", v9.Dictionary.join({
            AnchorPoint = l_props_1.AnchorPoint, 
            BackgroundTransparency = 1, 
            Position = l_props_1.Position, 
            Size = l_props_1.Size or UDim2.new(l_props_1.Width.Scale, l_props_1.Width.Offset, l_props_1.Height.Scale, l_props_1.Height.Offset), 
            LayoutOrder = l_props_1.LayoutOrder
        }), {
            Text = v44, 
            Indicator = v48, 
            Base = v53, 
            Icon = v60
        });
    end);
end;
return v15;