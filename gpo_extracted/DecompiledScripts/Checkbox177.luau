local l_Parent_0 = script.Parent.Parent.Parent.Parent;
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
local v14 = require(l_Parent_2.Descriptions.CheckboxStateDescriptions);
local v15 = require(l_Parent_2.Util.GetSelectedStateFromValue);
local v16 = v11.PureComponent:extend(script.Name);
v16.StyleBindings = {
    "Check", 
    "Fill", 
    "Stroke", 
    "Text"
};
v16.defaultProps = {
    Size = UDim2.fromOffset(20, 20)
};
v16.validateProps = v10.strictInterface({
    AnchorPoint = v10.optional(v10.Vector2), 
    Font = v10.optional(v7), 
    Position = v10.optional(v10.UDim2), 
    Size = v10.optional(v10.UDim2), 
    Selected = v10.optional(v10.boolean), 
    Label = v10.optional(v10.string), 
    TextWrapped = v10.optional(v10.boolean), 
    TextColor = v10.optional(v7), 
    Disabled = v10.optional(v10.boolean), 
    Native = v10.optional(v10.table), 
    [v11.Event.Activated] = v10.optional(v10.callback), 
    [v11.Event.MouseButton1Down] = v10.optional(v10.callback), 
    [v11.Event.MouseButton1Up] = v10.optional(v10.callback), 
    [v11.Event.MouseEnter] = v10.optional(v10.callback), 
    [v11.Event.MouseLeave] = v10.optional(v10.callback)
});
v16.init = function(v17) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_RegisterStateAction_0 (copy)
    for _, v19 in pairs(v17.StyleBindings) do
        local v20 = "Set" .. v19;
        local v21, v22 = v11.createBinding({});
        v17[v19] = v21;
        v17[v20] = v22;
    end;
    local v23, v24 = v11.createBinding(0);
    v17.CheckObscureWidth = v23;
    v17.SetCheckObscureWidth = v24;
    l_RegisterStateAction_0(v17, v11.Event.Activated, nil);
    l_RegisterStateAction_0(v17, v11.Event.MouseButton1Down, "Pressed");
    l_RegisterStateAction_0(v17, v11.Event.MouseButton1Up, "Hover");
    l_RegisterStateAction_0(v17, v11.Event.MouseEnter, "Hover");
    l_RegisterStateAction_0(v17, v11.Event.MouseLeave, "Rest");
    v17:setState({
        State = "Rest"
    });
end;
v16.willUnmount = function(v25) --[[ Line: 116 ]] --[[ Name: willUnmount ]]
    for _, v27 in pairs(v25.StyleBindings) do
        local v28 = v25[v27 .. "Motor"];
        if v28 then
            pcall(v28.destroy, v28);
            v25[v27 .. "Motor"] = nil;
        end;
    end;
end;
v16.ApplyDescription = function(v29, v30, v31) --[[ Line: 132 ]] --[[ Name: ApplyDescription ]]
    -- upvalues: v9 (copy), v8 (copy), l_ApplyDescription_0 (copy)
    v30 = v9.Dictionary.copy(v30);
    local v32 = v29.CheckObscureWidth:getValue();
    if v32 then
        local l_CheckObscureWidthMotor_0 = v29.CheckObscureWidthMotor;
        if l_CheckObscureWidthMotor_0 then
            pcall(l_CheckObscureWidthMotor_0.destroy, l_CheckObscureWidthMotor_0);
        end;
        local v34 = v8.SingleMotor.new(v32);
        v29.CheckObscureWidthMotor = v34;
        v34:onStep(v29.SetCheckObscureWidth);
        v34:onComplete(function() --[[ Line: 153 ]]
            -- upvalues: v34 (copy), v29 (copy)
            v34:destroy();
            v29.CheckObscureWidthMotor = nil;
        end);
        v34:setGoal(v8.Spring.new(v30.CheckObscureWidth, {
            frequency = 2.5, 
            dampingRatio = 1
        }));
    else
        v29.SetCheckObscureWidth(v30.CheckObscureWidth);
    end;
    local l_TextColor_0 = v29.props.TextColor;
    if l_TextColor_0 then
        v30.Text = l_TextColor_0;
    end;
    l_ApplyDescription_0(v29, v30, v31, v31["styles/AnimationSpringParams/Control/Input/Checkbox/Color"], v31["styles/AnimationSpringParams/Control/Input/Checkbox/Transparency"]);
end;
v16.render = function(v36) --[[ Line: 177 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), v15 (copy), v14 (copy), l_createElement_0 (copy), v11 (copy), v9 (copy)
    local l_props_0 = v36.props;
    local l_state_0 = v36.state;
    return l_WithTheme_0(function(v39) --[[ Line: 181 ]]
        -- upvalues: v15 (ref), l_props_0 (copy), v36 (copy), v14 (ref), l_state_0 (copy), l_createElement_0 (ref), v11 (ref), v9 (ref)
        local v40 = v15(l_props_0.Selected);
        if v40 == "None" then
            if l_props_0.Disabled then
                v36:ApplyDescription(v14.NoFill.Disabled, v39);
            elseif l_state_0.State == "Rest" then
                v36:ApplyDescription(v14.NoFill.Rest, v39);
            elseif l_state_0.State == "Hover" then
                v36:ApplyDescription(v14.NoFill.Hover, v39);
            else
                v36:ApplyDescription(v14.NoFill.Pressed, v39);
            end;
        elseif l_props_0.Disabled then
            v36:ApplyDescription(v14.Fill.Disabled, v39);
        elseif l_state_0.State == "Rest" then
            v36:ApplyDescription(v14.Fill.Rest, v39);
        elseif l_state_0.State == "Hover" then
            v36:ApplyDescription(v14.Fill.Hover, v39);
        else
            v36:ApplyDescription(v14.Fill.Pressed, v39);
        end;
        local v41 = v39[l_props_0.Font or "font/Body"];
        local v44 = l_props_0.Label and l_createElement_0("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            FontFace = v41.Font, 
            Position = UDim2.new(0, l_props_0.Size.X.Offset + 20 + 4, 0.5, 0), 
            Size = UDim2.new(1, -30, 1, 0), 
            Text = l_props_0.Label, 
            TextSize = v41.Size, 
            TextXAlignment = "Left", 
            TextColor3 = v36.Text:map(function(v42) --[[ Line: 221 ]]
                return v42.Color;
            end), 
            TextTransparency = v36.Text:map(function(v43) --[[ Line: 224 ]]
                return v43.Transparency;
            end)
        });
        local v46 = l_createElement_0("UIGradient", {
            Transparency = NumberSequence.new({
                [1] = NumberSequenceKeypoint.new(0, 0), 
                [2] = NumberSequenceKeypoint.new(0.001, 0), 
                [3] = NumberSequenceKeypoint.new(0.002, 1), 
                [4] = NumberSequenceKeypoint.new(1, 1)
            }), 
            Offset = v36.CheckObscureWidth:map(function(v45) --[[ Line: 238 ]]
                return Vector2.new(1 - v45, 0);
            end)
        });
        local v47 = v39[v40 == "Selected" and "images/Fluent/AcceptMedium/12px" or "images/Fluent/Dash12/12px"];
        local v50 = l_createElement_0("ImageLabel", {
            Visible = v40 ~= "None", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ResampleMode = v47.ResampleMode, 
            Image = v47.Image, 
            ImageRectOffset = v47.ImageRectOffset, 
            ImageRectSize = v47.ImageRectSize, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(v47.ImageRectSize.X, v47.ImageRectSize.Y), 
            ImageColor3 = v36.Check:map(function(v48) --[[ Line: 258 ]]
                return v48.Color;
            end), 
            ImageTransparency = v36.Check:map(function(v49) --[[ Line: 261 ]]
                return v49.Transparency;
            end)
        }, {
            ObscureGradient = v46
        });
        local v53 = l_createElement_0("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Thickness = 1, 
            Color = v36.Stroke:map(function(v51) --[[ Line: 274 ]]
                return v51.Color;
            end), 
            Transparency = v36.Stroke:map(function(v52) --[[ Line: 277 ]]
                return v52.Transparency;
            end)
        });
        local v56 = l_createElement_0("ImageButton", {
            AnchorPoint = Vector2.new(0, 0.5), 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 1 + (l_props_0.Label and 4 or 0), 0.5, 0), 
            Size = l_props_0.Size - UDim2.fromOffset(2, 2), 
            [v11.Event.Activated] = v36[v11.Event.Activated], 
            [v11.Event.MouseButton1Down] = v36[v11.Event.MouseButton1Down], 
            [v11.Event.MouseButton1Up] = v36[v11.Event.MouseButton1Up], 
            [v11.Event.MouseEnter] = v36[v11.Event.MouseEnter], 
            [v11.Event.MouseLeave] = v36[v11.Event.MouseLeave], 
            BackgroundColor3 = v36.Fill:map(function(v54) --[[ Line: 297 ]]
                return v54.Color;
            end), 
            BackgroundTransparency = v36.Fill:map(function(v55) --[[ Line: 300 ]]
                return v55.Transparency;
            end)
        }, {
            Check = v50, 
            Stroke = v53, 
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, v39["styles/CornerRadius/Default/Inner"] - 1)
            })
        });
        return l_createElement_0("Frame", v9.Dictionary.join({
            AnchorPoint = l_props_0.AnchorPoint, 
            Position = l_props_0.Position, 
            BackgroundTransparency = 1, 
            Size = l_props_0.Size
        }, l_props_0.Native), {
            Checkbox = v56, 
            Label = v44
        });
    end);
end;
return v16;