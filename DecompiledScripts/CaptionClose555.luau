local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Theme);
local l_WithTheme_0 = v2.WithTheme;
local l_RegisterStateAction_0 = v2.RegisterStateAction;
local l_Validators_0 = l_Parent_0.Validators;
local v6 = require(l_Validators_0.StyleValidator);
local v7 = require(l_Parent_1.t);
local v8 = require(l_Parent_1.Roact);
local l_createElement_0 = v8.createElement;
local v10 = require(l_Parent_0.App.Surface.RoundedSurface);
local v11 = v8.PureComponent:extend(script.Name);
v11.defaultProps = {
    Width = 48
};
v11.validateProps = v7.strictInterface({
    TextColor = v7.optional(v6), 
    AlwaysShow = v7.optional(v7.boolean), 
    Width = v7.optional(v7.numberPositive), 
    [v8.Event.Activated] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Down] = v7.optional(v7.callback), 
    [v8.Event.MouseButton1Up] = v7.optional(v7.callback), 
    [v8.Event.MouseEnter] = v7.optional(v7.callback), 
    [v8.Event.MouseLeave] = v7.optional(v7.callback)
});
v11.init = function(v12) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: l_RegisterStateAction_0 (copy), v8 (copy)
    l_RegisterStateAction_0(v12, v8.Event.Activated, nil);
    l_RegisterStateAction_0(v12, v8.Event.MouseButton1Down, "Pressed");
    l_RegisterStateAction_0(v12, v8.Event.MouseButton1Up, "Hover");
    l_RegisterStateAction_0(v12, v8.Event.MouseEnter, "Hover");
    l_RegisterStateAction_0(v12, v8.Event.MouseLeave, "Rest");
    v12:setState({
        State = "Rest"
    });
end;
v11.render = function(v13) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v10 (copy), v8 (copy)
    local l_props_0 = v13.props;
    local l_state_0 = v13.state;
    return l_WithTheme_0(function(v16) --[[ Line: 79 ]]
        -- upvalues: l_state_0 (copy), l_props_0 (copy), l_createElement_0 (ref), v10 (ref), v8 (ref), v13 (copy)
        local v17 = nil;
        local v18 = nil;
        if l_state_0.State == "Rest" then
            if l_props_0.AlwaysShow then
                v18 = v16["colors/Shell/Fill_Color/Caption_Close_Text/Primary"];
                v17 = v16["colors/Shell/Fill_Color/Caption_Control_Close_Fill/Primary"];
            else
                v18 = v16[l_props_0.TextColor or "colors/Fill_Color/Text/Primary"];
                v17 = v16["colors/Fill_Color/Subtle/Transparent"];
            end;
        elseif l_state_0.State == "Hover" then
            v18 = v16["colors/Shell/Fill_Color/Caption_Close_Text/Primary"];
            v17 = v16["colors/Shell/Fill_Color/Caption_Control_Close_Fill/Primary"];
        else
            v18 = v16["colors/Shell/Fill_Color/Caption_Close_Text/Secondary"];
            v17 = v16["colors/Shell/Fill_Color/Caption_Control_Close_Fill/Secondary"];
        end;
        return l_createElement_0(v10, {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundColor = v17, 
            CornerRadius = UDim.new(0, v16["styles/CornerRadius/Default/Outer"]), 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.new(0, l_props_0.Width, 1, 0), 
            ShowTopRightCorner = true
        }, {
            Button = l_createElement_0("ImageButton", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                [v8.Event.Activated] = v13[v8.Event.Activated], 
                [v8.Event.MouseButton1Down] = v13[v8.Event.MouseButton1Down], 
                [v8.Event.MouseButton1Up] = v13[v8.Event.MouseButton1Up], 
                [v8.Event.MouseEnter] = v13[v8.Event.MouseEnter], 
                [v8.Event.MouseLeave] = v13[v8.Event.MouseLeave]
            }), 
            Icon = l_createElement_0("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(18, 18), 
                ImageColor3 = v18.Color, 
                ImageTransparency = v18.Transparency, 
                Image = v16["images/roblox/icons/navigation/close/1x"].Image, 
                ImageRectSize = v16["images/roblox/icons/navigation/close/1x"].ImageRectSize, 
                ImageRectOffset = v16["images/roblox/icons/navigation/close/1x"].ImageRectOffset, 
                ScaleType = Enum.ScaleType.Fit
            })
        });
    end);
end;
return v11;