local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_0.Utility.GetTextSize);
local _ = require(l_Parent_1.Sift);
local _ = require(l_Parent_1.t);
local v6 = require(l_Parent_1.Roact);
local l_createElement_0 = v6.createElement;
local v8 = require(l_Parent_0.App.Surface.RoundedSurface);
local v9 = v6.PureComponent:extend(script.Name);
v9.defaultProps = {
    Size = UDim2.new(1, 0, 0, 62)
};
v9.render = function(v10) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v3 (copy), v8 (copy)
    local l_props_0 = v10.props;
    return l_WithTheme_0(function(v12) --[[ Line: 28 ]]
        -- upvalues: l_props_0 (copy), l_createElement_0 (ref), v3 (ref), v8 (ref)
        local v13 = l_props_0.Icon and v12[l_props_0.Icon];
        local v14 = v12[v13 and v13.Color or "colors/Fill_Color/Text/Primary"];
        local v15 = l_props_0.Icon and l_createElement_0("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v13.Image, 
            ImageColor3 = v14.Color, 
            ImageRectOffset = v13.ImageRectOffset, 
            ImageRectSize = v13.ImageRectSize, 
            ImageTransparency = v14.Transparency, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(v13.ImageRectSize.X, v13.ImageRectSize.Y)
        }) or nil;
        local v16 = v15 and l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(16, 16)
        }, v15);
        local v17 = v12["colors/Fill_Color/Text/Primary"];
        local v18 = v12["fonts/Body"];
        local v19, v20 = v3(l_props_0.Heading, v18.Font, v18.Size);
        local v21 = l_props_0.Heading and l_createElement_0("TextLabel", {
            AutomaticSize = not v19 and Enum.AutomaticSize.XY or Enum.AutomaticSize.None, 
            BackgroundTransparency = 1, 
            FontFace = v18.Font, 
            LayoutOrder = 1, 
            LineHeight = v18.LineHeight, 
            Size = UDim2.fromOffset(v20.X, v20.Y), 
            Text = l_props_0.Heading, 
            TextColor3 = v17.Color, 
            TextTransparency = v17.Transparency, 
            TextSize = v18.Size
        }) or nil;
        local v22 = v12["colors/Fill_Color/Text/Secondary"];
        local v23 = v12["fonts/Caption"];
        local v24, v25 = v3(l_props_0.Caption, v23.Font, v23.Size);
        local v26 = l_props_0.Caption and l_createElement_0("TextLabel", {
            AutomaticSize = not v24 and Enum.AutomaticSize.XY or Enum.AutomaticSize.None, 
            BackgroundTransparency = 1, 
            FontFace = v23.Font, 
            LayoutOrder = 2, 
            LineHeight = v23.LineHeight, 
            Size = UDim2.fromOffset(v25.X, v25.Y), 
            Text = l_props_0.Caption, 
            TextColor3 = v22.Color, 
            TextTransparency = v22.Transparency, 
            TextSize = v23.Size
        }) or nil;
        local v27 = l_createElement_0("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(0, 0), 
            LayoutOrder = 2
        }, {
            Heading = v21, 
            Caption = v26, 
            Layout = l_createElement_0("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            })
        });
        local v28 = l_createElement_0("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(0, 1)
        }, {
            Icon = v16, 
            Text = v27, 
            Layout = l_createElement_0("UIListLayout", {
                Padding = UDim.new(0, 16), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Padding = l_createElement_0("UIPadding", {
                PaddingLeft = UDim.new(0, 15), 
                PaddingTop = UDim.new(0, 13), 
                PaddingBottom = UDim.new(0, 13)
            })
        });
        local v29 = v12["colors/Fill_Color/Subtle/Tertiary"];
        return l_createElement_0(v8, {
            BackgroundColor = v29, 
            BackgroundTransparency = 0, 
            CornerRadius = UDim.new(0, 3), 
            Size = l_props_0.Size, 
            LayoutOrder = 1, 
            ShowTopLeftCorner = true, 
            ShowTopRightCorner = true, 
            ShowBottomLeftCorner = not l_props_0.Expanded, 
            ShowBottomRightCorner = not l_props_0.Expanded
        }, v28);
    end);
end;
return v9;