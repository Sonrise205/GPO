local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Roact);
local l_createElement_0 = v3.createElement;
local v5 = v3.PureComponent:extend(script.Name);
v5.render = function(v6) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy)
    local l_props_0 = v6.props;
    return l_WithTheme_0(function(v8) --[[ Line: 15 ]]
        -- upvalues: l_createElement_0 (ref), l_props_0 (copy)
        local v9 = v8["colors/Stroke_Color/Divider_Stroke/Default"];
        return l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Position = l_props_0.Position, 
            Size = UDim2.new(l_props_0.Size.X.Scale, l_props_0.Size.X.Offset, l_props_0.Size.Y.Scale, l_props_0.Size.Y.Offset == 0 and 4 or l_props_0.Size.Y.Offset)
        }, {
            Divider = l_createElement_0("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v9.Color, 
                BackgroundTransparency = v9.Transparency, 
                Position = UDim2.new(0, 1, 0.5, 0), 
                Size = UDim2.new(1, -2, 0, 1)
            })
        });
    end);
end;
return v5;