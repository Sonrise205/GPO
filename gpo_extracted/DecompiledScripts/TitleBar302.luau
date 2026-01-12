local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local l_Validators_0 = l_Parent_0.Validators;
local v4 = require(l_Validators_0.StyleValidator);
local v5 = require(l_Parent_1.t);
local v6 = require(l_Parent_1.Roact);
local l_createElement_0 = v6.createElement;
local v8 = require(l_Parent_0.Utility.GetTextSize);
local v9 = require(l_Parent_0.App.Surface.RoundedSurface);
local l_Parent_2 = script.Parent;
local v11 = require(l_Parent_2.CaptionClose);
local v12 = v6.PureComponent:extend(script.Name);
v12.defaultProps = {
    Height = 32, 
    Text = "TitleBar", 
    CaptionButtonWidth = 48, 
    BackgroundColor = {
        Color = Color3.new(), 
        Transparency = 1
    }
};
v12.validateProps = v5.strictInterface({
    AlwaysShowClose = v5.optional(v5.boolean), 
    CaptionButtonWidth = v5.optional(v5.number), 
    Text = v5.optional(v5.string), 
    LayoutOrder = v5.optional(v5.number), 
    Icon = v5.optional(v4), 
    ReleaseText = v5.optional(v5.string), 
    TextColor = v5.optional(v4), 
    BackgroundColor = v5.optional(v4), 
    Height = v5.optional(v5.numberPositive), 
    OnClose = v5.optional(v5.callback), 
    Native = v5.optional(v5.table)
});
v12.render = function(v13) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), v8 (copy), l_createElement_0 (copy), v11 (copy), v6 (copy), v9 (copy)
    local l_props_0 = v13.props;
    return l_WithTheme_0(function(v15) --[[ Line: 80 ]]
        -- upvalues: l_props_0 (copy), v8 (ref), l_createElement_0 (ref), v11 (ref), v6 (ref), v9 (ref)
        local v16 = v15["fonts/Caption"];
        local v17 = v15[l_props_0.TextColor or "colors/Fill_Color/Text/Primary"];
        local v18, v19 = v8(l_props_0.Text, v16.Font, v16.Size);
        local v20 = l_createElement_0("TextLabel", {
            AutomaticSize = not v18 and Enum.AutomaticSize.X or nil, 
            BackgroundTransparency = 1, 
            FontFace = v16.Font, 
            LayoutOrder = 1, 
            Size = UDim2.new(0, v18 and v19.X or 0, 1, 0), 
            Text = l_props_0.Text, 
            TextColor3 = v17.Color, 
            TextSize = v16.Size, 
            TextTransparency = v17.Transparency
        });
        local v21 = v15["colors/Fill_Color/Text/Secondary"];
        local v22 = nil;
        local v23 = nil;
        if l_props_0.ReleaseText then
            local v24, v25 = v8(l_props_0.ReleaseText, v16.Font, v16.Size);
            v22 = v24;
            v23 = v25;
        end;
        local v26 = l_props_0.ReleaseText and l_createElement_0("TextLabel", {
            AutomaticSize = not v22 and Enum.AutomaticSize.X or nil, 
            BackgroundTransparency = 1, 
            FontFace = v16.Font, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, v22 and v23.X or 0, 1, 0), 
            Text = l_props_0.ReleaseText, 
            TextColor3 = v21.Color, 
            TextSize = v16.Size, 
            TextTransparency = v21.Transparency
        }) or nil;
        local l_X_0 = v19.X;
        if v22 then
            l_X_0 = l_X_0 + (v23.X + 8);
        end;
        local v28 = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, l_X_0, 1, 0)
        }, {
            Label = v20, 
            ReleaseLabel = v26, 
            Layout = l_createElement_0("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8)
            })
        });
        local v29 = l_props_0.Icon and v15[l_props_0.Icon];
        local v30 = nil;
        if v29 then
            local v31 = v29.ImageRectSize == Vector2.new() and Vector2.new(16, 16) or v29.ImageRectSize;
            v30 = UDim2.fromOffset(math.clamp(v31.X, 0, 36), (math.clamp(v31.Y, 0, 36)));
        else
            v30 = UDim2.fromOffset(0, 0);
        end;
        local v32 = v29 and l_createElement_0("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v29.Image, 
            ImageRectOffset = v29.ImageRectOffset, 
            ImageRectSize = v29.ImageRectSize, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ResampleMode = v29.ResampleMode, 
            Size = v30, 
            ImageColor3 = v29.ImageColor3, 
            ImageTransparency = v29.ImageTransparency
        });
        local v33 = v32 and l_createElement_0("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 24, 0.5, 0), 
            Size = UDim2.new(0, 16, 1, 0)
        }, v32);
        local v34 = UDim2.new(0, l_X_0 + (v32 and 32 or 0) + 12, 1, 0);
        local v35 = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = v34
        }, {
            Icon = v33, 
            TextConatainer = v28, 
            Layout = l_createElement_0("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 16)
            }), 
            Padding = l_createElement_0("UIPadding", {
                PaddingLeft = UDim.new(0, 12)
            })
        });
        local v36 = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            Size = v34 + UDim2.fromOffset(4, 0)
        }, {
            IconAndTitle = v35, 
            Padding = l_createElement_0("UIPadding", {
                PaddingLeft = UDim.new(0, 4)
            })
        });
        local v37 = {};
        if l_props_0.OnClose then
            v37.Close = l_createElement_0(v11, {
                AlwaysShow = l_props_0.AlwaysShowClose, 
                Width = l_props_0.CaptionButtonWidth, 
                [v6.Event.Activated] = l_props_0.OnClose
            });
        end;
        local v38 = l_createElement_0("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.new(0, 0, 1, 0)
        }, v37);
        return l_createElement_0(v9, {
            BackgroundColor = v15[l_props_0.BackgroundColor], 
            CornerRadius = UDim.new(0, v15["styles/CornerRadius/Default/Outer"]), 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, l_props_0.Height), 
            ShowTopLeftCorner = true, 
            ShowTopRightCorner = true, 
            Native = l_props_0.Native
        }, {
            Parts = v36, 
            CaptionButtonContainer = v38
        });
    end);
end;
return v12;