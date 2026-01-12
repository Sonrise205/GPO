local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local l_Validators_0 = l_Parent_0.Validators;
local v4 = require(l_Validators_0.StyleValidator);
local v5 = require(l_Parent_1.t);
local v6 = require(l_Parent_1.Roact);
local l_createElement_0 = v6.createElement;
local v8 = require(l_Parent_0.App.List.ListDivider);
local v9 = require(l_Parent_0.App.List.ListItem);
local v10 = require(l_Parent_0.App.Surface.Acrylic);
local v11 = v6.PureComponent:extend(script.Name);
v11.defaultProps = {
    AnchorPoint = Vector2.new(), 
    Position = UDim2.new(), 
    Size = UDim2.fromOffset(150, 150), 
    FitContents = true
};
v11.validateProps = v5.strictInterface({
    AnchorPoint = v5.optional(v5.Vector2), 
    BackgroundTransparency = v5.optional(v5.number), 
    Position = v5.optional(v5.UDim2), 
    Size = v5.optional(v5.UDim2), 
    UseIcon = v5.optional(v5.boolean), 
    FitContents = v5.optional(v5.boolean), 
    Options = v5.array(v5.strictInterface({
        Disabled = v5.optional(v5.boolean), 
        IsDivider = v5.optional(v5.boolean), 
        LayoutOrder = v5.optional(v5.numberPositive), 
        OnClicked = v5.optional(v5.callback), 
        Selected = v5.optional(v5.boolean), 
        Text = v5.optional(v5.string), 
        Icon = v5.optional(v4)
    }))
});
v11.init = function(v12) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy)
    local v13, v14 = v6.createBinding(v12.props.Size);
    v12.ContentSize = v13;
    v12.SetContentSize = v14;
end;
v11.GetOptions = function(v15) --[[ Line: 71 ]] --[[ Name: GetOptions ]]
    -- upvalues: l_createElement_0 (copy), v8 (copy), v9 (copy), v6 (copy)
    local l_props_0 = v15.props;
    local v17 = {};
    for v18, v19 in pairs(l_props_0.Options) do
        if v19.IsDivider then
            v17[v18] = l_createElement_0(v8, {
                LayoutOrder = v19.LayoutOrder or v18, 
                Size = UDim2.fromScale(1, 0)
            });
        else
            v17[v18] = l_createElement_0(v9, {
                ShowIndicator = v19.Selected, 
                Disabled = v19.Disabled, 
                LayoutOrder = v19.LayoutOrder or v18, 
                [v6.Event.Activated] = v19.OnClicked, 
                Selected = v19.Selected, 
                Width = UDim.new(1, 0), 
                Text = v19.Text, 
                Icon = l_props_0.UseIcon and (v19.Icon or {
                    Image = "", 
                    ImageRectSize = Vector2.new(), 
                    ImageRectOffset = Vector2.new()
                }) or nil
            });
        end;
    end;
    return v6.createFragment(v17);
end;
v11.render = function(v20) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v6 (copy), v10 (copy)
    local l_props_1 = v20.props;
    return l_WithTheme_0(function(v22) --[[ Line: 112 ]]
        -- upvalues: l_createElement_0 (ref), l_props_1 (copy), v6 (ref), v20 (copy), v10 (ref)
        local v24 = l_createElement_0("Frame", {
            AutomaticSize = l_props_1.FitContents and "Y" or "None", 
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, 2), 
            Size = UDim2.fromScale(1, l_props_1.FitContents and 0 or 1), 
            [v6.Change.AbsoluteSize] = function(v23) --[[ Line: 121 ]]
                -- upvalues: l_props_1 (ref), v20 (ref)
                if l_props_1.FitContents then
                    v20.SetContentSize(UDim2.fromOffset(v23.AbsoluteSize.X, v23.AbsoluteSize.Y + 4));
                end;
            end
        }, {
            Layout = l_createElement_0("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            Contents = v20:GetOptions()
        });
        local v25 = v22["colors/Background/Fill_Color/Acrylic_Background/Default"];
        local v26 = v22["colors/Stroke_Color/Surface_Stroke/Flyout"];
        local v27 = l_createElement_0(v10, {
            BackgroundColor3 = v25.Color, 
            BackgroundTransparency = l_props_1.BackgroundTransparency or v25.Transparency, 
            BorderSizePixel = 0, 
            Size = v20.ContentSize
        }, {
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, v22["styles/CornerRadius/Default/Outer"] - 1)
            }), 
            Stroke = l_createElement_0("UIStroke", {
                Color = v26.Color, 
                Transparency = v26.Transparency, 
                Thickness = 1
            })
        });
        return l_createElement_0("Frame", {
            AutomaticSize = l_props_1.FitContents and "Y" or "None", 
            AnchorPoint = l_props_1.AnchorPoint, 
            BackgroundTransparency = 1, 
            Position = l_props_1.Position, 
            Size = v20.ContentSize
        }, {
            Container = v24, 
            Base = v27
        });
    end);
end;
return v11;