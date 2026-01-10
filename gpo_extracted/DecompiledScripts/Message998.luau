local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.t);
local v2 = require(l_Packages_0.Roact);
local l_createElement_0 = v2.createElement;
local v4 = v2.PureComponent:extend(script.Name);
v4.validateProps = v1.strictInterface({
    Image = v1.optional(v1.string), 
    TitleText = v1.optional(v1.string), 
    BodyText = v1.optional(v1.string)
});
v4.render = function(v5) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy)
    local l_props_0 = v5.props;
    v5.HasThumbnailAsImage = l_props_0.Image and l_props_0.Image:find("rbxthumb") and true or false;
    v5.HasAvatarThumbnailAsImage = v5.HasThumbnailAsImage and (l_props_0.Image:match("type=Avatar") or l_props_0.Image:match("type=HeadShot")) and true or false;
    return l_createElement_0("Frame", {
        AnchorPoint = l_props_0.Condensed and Vector2.new(0.5, 0) or Vector2.new(0, 0.5), 
        AutomaticSize = l_props_0.Condensed and Enum.AutomaticSize.XY or Enum.AutomaticSize.Y, 
        BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
        BackgroundTransparency = 0.2, 
        BorderSizePixel = 0, 
        Position = l_props_0.Condensed and UDim2.new(0.5, 0, 0, 150) or UDim2.fromScale(0, 0.5), 
        Size = l_props_0.Condensed and UDim2.fromScale(0.5, 0.5) or UDim2.fromScale(1, 0)
    }, {
        Layout = l_createElement_0("UIListLayout", {
            Padding = UDim.new(0, 15), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Padding = l_createElement_0("UIPadding", {
            PaddingBottom = UDim.new(0, 15), 
            PaddingTop = UDim.new(0, 15), 
            PaddingLeft = UDim.new(0, l_props_0.Condensed and 15 or 50), 
            PaddingRight = UDim.new(0, l_props_0.Condensed and 15 or 50)
        }), 
        Corners = l_props_0.Condensed and l_createElement_0("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }) or nil, 
        Text = l_createElement_0("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Layout = l_createElement_0("UIListLayout", {
                Padding = UDim.new(0, 5), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = l_props_0.Image and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            SizeConstraint = l_createElement_0("UISizeConstraint", {
                MaxSize = Vector2.new(500, 1e999)
            }), 
            Body = l_props_0.BodyText and l_createElement_0("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                FontFace = Font.fromEnum(Enum.Font.SourceSans), 
                RichText = true, 
                Text = l_props_0.BodyText, 
                TextColor3 = Color3.fromRGB(255, 255, 255), 
                TextSize = 18, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            Title = l_props_0.TitleText and l_createElement_0("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                FontFace = Font.fromEnum(Enum.Font.SourceSansBold), 
                RichText = true, 
                Text = l_props_0.TitleText, 
                TextColor3 = Color3.fromRGB(255, 255, 255), 
                TextSize = 18, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        Image = l_props_0.Image and l_createElement_0("ImageLabel", {
            BackgroundColor3 = Color3.fromRGB(45, 45, 45), 
            BackgroundTransparency = v5.HasThumbnailAsImage and 0 or 1, 
            Size = UDim2.fromOffset(48, 48), 
            Image = l_props_0.Image
        }, {
            Corner = v5.HasThumbnailAsImage and l_createElement_0("UICorner", {
                CornerRadius = UDim.new(v5.HasAvatarThumbnailAsImage and 0.5 or 0, not v5.HasAvatarThumbnailAsImage and 4 or 0)
            }) or nil
        })
    });
end;
return v4;