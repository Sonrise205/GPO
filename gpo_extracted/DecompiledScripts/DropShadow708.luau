local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local l_Validators_0 = l_Parent_0.Validators;
local v4 = require(l_Validators_0.StyleValidator);
local v5 = require(l_Parent_1.Sift);
local v6 = require(l_Parent_1.t);
local v7 = require(l_Parent_1.Roact);
local l_createElement_0 = v7.createElement;
local v9 = v7.PureComponent:extend(script.Name);
v9.defaultProps = {
    CornerRadius = UDim.new(0, 8)
};
v9.validateProps = v6.strictInterface({
    AnchorPoint = v6.optional(v6.Vector2), 
    BackgroundColor = v6.optional(v4), 
    CornerRadius = v6.optional(v6.UDim), 
    AutomaticSize = v6.optional(v6.EnumItem), 
    Position = v6.optional(v6.UDim2), 
    Size = v6.union(v6.UDim2, v6.table), 
    [v7.Children] = v6.optional(v6.table), 
    Native = v6.optional(v6.table)
});
v9.render = function(v10) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v5 (copy), v7 (copy)
    local v11 = v10.props or {};
    return l_WithTheme_0(function(_) --[[ Line: 53 ]]
        -- upvalues: l_createElement_0 (ref), v5 (ref), v11 (copy), v7 (ref)
        return l_createElement_0("ImageLabel", v5.Dictionary.join({
            BackgroundTransparency = 1, 
            AnchorPoint = v11.AnchorPoint, 
            Position = v11.Position, 
            Image = "rbxassetid://186491278", 
            ImageTransparency = 0.25, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(20, 15, 76, 71), 
            SliceScale = v11.CornerRadius.Offset / 4, 
            Size = v11.Size
        }, v11.Native), v11[v7.Children]);
    end);
end;
return v9;