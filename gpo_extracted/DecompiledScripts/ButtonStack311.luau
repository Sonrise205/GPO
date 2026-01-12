local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local l_createElement_0 = v5.createElement;
local l_Parent_2 = script.Parent;
local v8 = require(l_Parent_2.Button);
local v9 = v5.PureComponent:extend(script.Name);
v9.defaultProps = {
    ButtonHeight = UDim.new(0, 30), 
    Padding = UDim.new(0, 8), 
    ButtonAlignment = Enum.HorizontalAlignment.Left, 
    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
    VerticalAlignment = Enum.VerticalAlignment.Center, 
    MinSlack = 50, 
    StackWidth = UDim.new(1, 0), 
    PaddingLeft = UDim.new(), 
    PaddingRight = UDim.new(), 
    PaddingTop = UDim.new()
};
v9.validateProps = v4.strictInterface({
    AnchorPoint = v4.optional(v4.Vector2), 
    LayoutOrder = v4.optional(v4.number), 
    Position = v4.optional(v4.UDim2), 
    FillWidth = v4.optional(v4.boolean), 
    Padding = v4.optional(v4.UDim), 
    PaddingLeft = v4.optional(v4.UDim), 
    PaddingRight = v4.optional(v4.UDim), 
    PaddingTop = v4.optional(v4.UDim), 
    PaddingBottom = v4.optional(v4.UDim), 
    Size = v4.optional(v4.UDim2), 
    StackWidth = v4.optional(v4.UDim), 
    Buttons = v4.table, 
    ButtonHeight = v4.optional(v4.UDim), 
    ButtonAlignment = v4.optional(v4.enum(Enum.HorizontalAlignment)), 
    HorizontalAlignment = v4.optional(v4.enum(Enum.HorizontalAlignment)), 
    VerticalAlignment = v4.optional(v4.enum(Enum.VerticalAlignment)), 
    MinSlack = v4.optional(v4.number), 
    [v5.Children] = v4.optional(v4.table), 
    Native = v4.optional(v4.table)
});
v9.init = function(v10) --[[ Line: 92 ]] --[[ Name: init ]]
    v10:setState({
        Width = 0
    });
end;
v9.render = function(v11) --[[ Line: 100 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v8 (copy), v3 (copy), v5 (copy)
    local l_props_0 = v11.props;
    local _ = v11.state;
    return l_WithTheme_0(function(_) --[[ Line: 104 ]]
        -- upvalues: l_props_0 (copy), l_createElement_0 (ref), v8 (ref), v3 (ref), v5 (ref), v11 (copy)
        local v15 = {};
        local v16 = UDim2.new(1 / #l_props_0.Buttons);
        local v17 = true;
        for v18, v19 in pairs(l_props_0.Buttons) do
            v15["Button" .. v18] = l_createElement_0(v8, v3.Dictionary.join(v19, {
                LayoutOrder = l_props_0.ButtonAlignment == Enum.HorizontalAlignment.Right and -v18 or v18, 
                Size = UDim2.new(v16.X.Scale, v16.X.Offset - (v17 and 0 or l_props_0.Padding.Offset), l_props_0.ButtonHeight.Scale, l_props_0.ButtonHeight.Offset)
            }));
            v17 = false;
        end;
        local v20 = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(l_props_0.StackWidth.Scale, l_props_0.StackWidth.Offset, 1, 0)
        }, {
            Buttons = v5.createFragment(v15), 
            Layout = l_createElement_0("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = l_props_0.HorizontalAlignment, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = l_props_0.VerticalAlignment, 
                Padding = l_props_0.Padding
            })
        });
        return l_createElement_0("Frame", v3.Dictionary.join({
            AnchorPoint = l_props_0.AnchorPoint, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            [v5.Change.AbsoluteSize] = function(v21) --[[ Line: 149 ]]
                -- upvalues: v11 (ref)
                v11:setState({
                    Width = v21.AbsoluteSize.X
                });
            end
        }, l_props_0.Native), {
            ButtonContainer = v20, 
            PropChildren = v5.createFragment(l_props_0[v5.Children] or {}), 
            Layout = l_createElement_0("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = l_props_0.HorizontalAlignment, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = l_props_0.VerticalAlignment
            }), 
            Padding = l_createElement_0("UIPadding", {
                PaddingLeft = l_props_0.PaddingLeft, 
                PaddingRight = l_props_0.PaddingRight
            })
        });
    end);
end;
return v9;