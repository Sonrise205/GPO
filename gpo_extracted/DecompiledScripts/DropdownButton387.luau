local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Theme);
local l_WithTheme_0 = v2.WithTheme;
local l_ApplyDescription_0 = v2.ApplyDescription;
local l_RegisterStateAction_0 = v2.RegisterStateAction;
local v6 = require(l_Parent_1.Sift);
local v7 = require(l_Parent_1.t);
local v8 = require(l_Parent_1.Roact);
local l_createElement_0 = v8.createElement;
local v10 = require(l_Parent_0.App.Effect.UIStroke);
local l_Parent_2 = script.Parent;
local v12 = require(l_Parent_2.Descriptions.DropdownButtonDescriptions);
local v13 = v8.PureComponent:extend(script.Name);
v13.Descriptions = v12;
v13.StyleBindings = {
    "Stroke", 
    "Fill", 
    "Text"
};
v13.defaultProps = {
    Size = UDim2.fromOffset(120, 32)
};
v13.validateProps = v7.strictInterface({
    Text = v7.optional(v7.string), 
    AnchorPoint = v7.optional(v7.Vector2), 
    Disabled = v7.optional(v7.boolean), 
    LayoutOrder = v7.optional(v7.number), 
    Position = v7.optional(v7.UDim2), 
    Size = v7.optional(v7.UDim2), 
    Native = v7.optional(v7.table), 
    [v8.Children] = v7.optional(v7.table), 
    [v8.Event.Activated] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Down] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Up] = v7.optional(v7.callback), 
    [v8.Event.MouseEnter] = v7.optional(v7.callback), 
    [v8.Event.MouseLeave] = v7.optional(v7.callback)
});
v13.init = function(v14) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_RegisterStateAction_0 (copy)
    for _, v16 in pairs(v14.StyleBindings) do
        local v17 = "Set" .. v16;
        local v18, v19 = v8.createBinding({});
        v14[v16] = v18;
        v14[v17] = v19;
    end;
    l_RegisterStateAction_0(v14, v8.Event.Activated, nil);
    l_RegisterStateAction_0(v14, v8.Event.MouseButton1Down, "Pressed");
    l_RegisterStateAction_0(v14, v8.Event.MouseButton1Up, "Hover");
    l_RegisterStateAction_0(v14, v8.Event.MouseEnter, "Hover");
    l_RegisterStateAction_0(v14, v8.Event.MouseLeave, "Rest");
    v14:setState({
        State = "Rest"
    });
end;
v13.ApplyDescription = function(v20, v21, v22) --[[ Line: 104 ]] --[[ Name: ApplyDescription ]]
    -- upvalues: l_ApplyDescription_0 (copy)
    l_ApplyDescription_0(v20, v21, v22, v22["styles/AnimationSpringParams/Control/Input/Button/Color"], v22["styles/AnimationSpringParams/Control/Input/Button/Transparency"]);
end;
v13.render = function(v23) --[[ Line: 108 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v10 (copy), v6 (copy), v8 (copy)
    local l_props_0 = v23.props;
    local l_state_0 = v23.state;
    return l_WithTheme_0(function(v26) --[[ Line: 112 ]]
        -- upvalues: l_props_0 (copy), v23 (copy), l_state_0 (copy), l_createElement_0 (ref), v10 (ref), v6 (ref), v8 (ref)
        if l_props_0.Disabled then
            v23:ApplyDescription(v23.Descriptions.Disabled, v26);
        elseif l_state_0.State == "Rest" then
            v23:ApplyDescription(v23.Descriptions.Rest, v26);
        elseif l_state_0.State == "Hover" then
            v23:ApplyDescription(v23.Descriptions.Hover, v26);
        elseif l_state_0.State == "Pressed" then
            v23:ApplyDescription(v23.Descriptions.Pressed, v26);
        end;
        local v27 = v26["images/Fluent/ChevronDownMed/12px"];
        local v30 = l_createElement_0("ImageButton", {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Image = v27.Image, 
            ImageRectOffset = v27.ImageRectOffset, 
            ImageRectSize = v27.ImageRectSize, 
            Position = UDim2.new(1, -11, 0.5, 0), 
            Size = UDim2.fromOffset(v27.ImageRectSize.X, v27.ImageRectSize.Y), 
            ImageColor3 = v23.Text:map(function(v28) --[[ Line: 138 ]]
                return v28.Color;
            end), 
            ImageTransparency = v23.Text:map(function(v29) --[[ Line: 141 ]]
                return v29.Transparency;
            end)
        });
        local v31 = v26["fonts/Body"];
        local v34 = l_createElement_0("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            FontFace = v31.Font, 
            LineHeight = v31.LineHeight, 
            Position = UDim2.new(0, 11, 0.5, 0), 
            Size = UDim2.new(0, 0), 
            Text = l_props_0.Text, 
            TextSize = v31.Size, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = v23.Text:map(function(v32) --[[ Line: 161 ]]
                return v32.Color;
            end), 
            TextTransparency = v23.Text:map(function(v33) --[[ Line: 164 ]]
                return v33.Transparency;
            end)
        });
        local v39 = l_createElement_0("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -2, 1, -2), 
            BackgroundColor3 = v23.Fill:map(function(v35) --[[ Line: 176 ]]
                return v35.Color;
            end), 
            BackgroundTransparency = v23.Fill:map(function(v36) --[[ Line: 179 ]]
                return v36.Transparency;
            end)
        }, {
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, v26["styles/CornerRadius/Default/Inner"])
            }), 
            Stroke = l_createElement_0(v10, {
                BorderMode = Enum.BorderMode.Outline
            }, {
                Gradient = l_createElement_0("UIGradient", {
                    Rotation = 90, 
                    Color = v23.Stroke:map(function(v37) --[[ Line: 194 ]]
                        return v37.ColorSequence or ColorSequence.new(v37.Color);
                    end), 
                    Transparency = v23.Stroke:map(function(v38) --[[ Line: 197 ]]
                        return v38.TransparencySequence or NumberSequence.new(v38.Transparency);
                    end)
                })
            })
        });
        return l_createElement_0("ImageButton", v6.Dictionary.join({
            AnchorPoint = l_props_0.AnchorPoint, 
            BackgroundTransparency = 1, 
            Size = l_props_0.Size, 
            Position = l_props_0.Position, 
            LayoutOrder = l_props_0.LayoutOrder, 
            [v8.Event.Activated] = v23[v8.Event.Activated], 
            [v8.Event.MouseButton1Down] = v23[v8.Event.MouseButton1Down], 
            [v8.Event.MouseButton1Up] = v23[v8.Event.MouseButton1Up], 
            [v8.Event.MouseEnter] = v23[v8.Event.MouseEnter], 
            [v8.Event.MouseLeave] = v23[v8.Event.MouseLeave]
        }, l_props_0.Native), {
            Label = v34, 
            Chevron = v30, 
            Fill = v39, 
            ChildWrapper = l_props_0[v8.Children] and l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, l_props_0[v8.Children])
        });
    end);
end;
return v13;