local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local l_Validators_0 = l_Parent_0.Validators;
local v4 = require(l_Validators_0.StyleValidator);
local v5 = require(l_Parent_1.t);
local v6 = require(l_Parent_1.Roact);
local l_createElement_0 = v6.createElement;
local v8 = require(l_Parent_0.Utility.GetTextSize);
local v9 = require(l_Parent_0.App.Effect.DropShadow);
local v10 = require(l_Parent_0.App.Surface.Acrylic);
local v11 = v6.PureComponent:extend(script.Name);
v11.defaultProps = {
    AutomaticSize = Enum.AutomaticSize.XY, 
    Position = UDim2.new(), 
    Size = UDim2.fromOffset(0, 28), 
    DropShadowEnabled = true
};
v11.validateProps = v5.strictInterface({
    AutomaticSize = v5.optional(v5.enum(Enum.AutomaticSize)), 
    AnchorPoint = v5.optional(v5.Vector2), 
    DropShadowEnabled = v5.optional(v5.boolean), 
    Position = v5.optional(v5.UDim2), 
    Size = v5.optional(v5.UDim2), 
    Text = v5.string, 
    Icon = v5.optional(v4), 
    Native = v5.optional(v5.table)
});
v11.init = function(v12) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy)
    local v13, v14 = v6.createBinding(UDim2.new());
    v12.Size = v13;
    v12.SetSize = v14;
end;
v11.render = function(v15) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), v8 (copy), l_createElement_0 (copy), v10 (copy), v6 (copy), v9 (copy)
    local l_props_0 = v15.props;
    return l_WithTheme_0(function(v17) --[[ Line: 65 ]]
        -- upvalues: v8 (ref), l_props_0 (copy), l_createElement_0 (ref), v10 (ref), v6 (ref), v15 (copy), v9 (ref)
        local v18 = v17["fonts/Caption"];
        local v19 = v17["colors/Fill_Color/Text/Primary"];
        local v20, v21 = v8(l_props_0.Text, v18.Font, v18.Size);
        if not v20 then
            warn("GetTextSize() Failed:", v21);
            v21 = Vector2.new(0, 100);
        end;
        local v22 = l_createElement_0("TextLabel", {
            AutomaticSize = if v20 then l_props_0.AutomaticSize else Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            FontFace = v18.Font, 
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(v21.X, v21.Y), 
            Text = l_props_0.Text, 
            TextColor3 = v19.Color, 
            TextSize = v18.Size, 
            TextTransparency = v19.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
        local v23 = l_props_0.Icon and v17[l_props_0.Icon];
        local v24 = nil;
        if v23 then
            local v25 = v23.ImageRectSize == Vector2.new() and Vector2.new(16, 16) or v23.ImageRectSize;
            v24 = UDim2.fromOffset(math.clamp(v25.X, 0, 36), (math.clamp(v25.Y, 0, 36)));
        else
            v24 = UDim2.fromOffset(16, 16);
        end;
        local v26 = v23 and l_createElement_0("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v23.Image, 
            ImageColor3 = v19.Color, 
            ImageRectOffset = v23.ImageRectOffset, 
            ImageRectSize = v23.ImageRectSize, 
            ImageTransparency = v19.Transparency, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ResampleMode = v23.ResampleMode, 
            Size = v24
        });
        local v27 = l_createElement_0("Frame", {
            AutomaticSize = l_props_0.AutomaticSize, 
            BackgroundTransparency = 1
        }, {
            Text = v22, 
            Icon = v26, 
            Layout = l_createElement_0("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8)
            })
        });
        local v28 = v17["colors/Stroke_Color/Surface_Stroke/Flyout"];
        local v29 = l_createElement_0("UIStroke", {
            Color = v28.Color, 
            Transparency = v28.Transparency
        });
        local v30 = v17["colors/Background/Fill_Color/Acrylic_Background/Default"];
        local v33 = l_createElement_0(v10, {
            AutomaticSize = l_props_0.AutomaticSize, 
            AnchorPoint = l_props_0.DropShadowEnabled and Vector2.new(0.5, 0.5) or l_props_0.AnchorPoint, 
            BackgroundColor3 = v30.Color, 
            BackgroundTransparency = v30.Transparency, 
            Position = l_props_0.DropShadowEnabled and UDim2.fromScale(0.5, 0.5) or l_props_0.Position, 
            Size = l_props_0.Size, 
            [v6.Change.AbsoluteSize] = function(v31) --[[ Line: 159 ]]
                -- upvalues: v15 (ref)
                local l_AbsoluteSize_0 = v31.AbsoluteSize;
                v15.SetSize(UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y) - UDim2.fromOffset(16, 12));
            end
        }, {
            TextAndIconWrapper = v27, 
            Stroke = v29, 
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, v17["styles/CornerRadius/Default/Inner"])
            }), 
            Layout = l_createElement_0("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            Padding = l_createElement_0("UIPadding", {
                PaddingBottom = UDim.new(0, 7), 
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 5)
            })
        });
        if l_props_0.DropShadowEnabled then
            return l_createElement_0(v9, {
                AnchorPoint = l_props_0.AnchorPoint, 
                Position = l_props_0.Position - UDim2.fromOffset(10, 10), 
                CornerRadius = UDim.new(0, v17["styles/CornerRadius/Default/Inner"]), 
                Size = v15.Size:map(function(v34) --[[ Line: 189 ]]
                    return v34 + UDim2.fromOffset(20, 20) + UDim2.fromOffset(16, 12);
                end)
            }, v33);
        else
            return v33;
        end;
    end);
end;
return v11;