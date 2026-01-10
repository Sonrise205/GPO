local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local l_createElement_0 = v5.createElement;
local v7 = require(l_Parent_0.App.Surface.Acrylic);
local v8 = v5.PureComponent:extend(script.Name);
v8.defaultProps = {
    Size = UDim2.fromOffset(320, 72), 
    FitContents = true
};
v8.validateProps = v4.strictInterface({
    AnchorPoint = v4.optional(v4.Vector2), 
    Position = v4.optional(v4.UDim2), 
    Size = v4.optional(v4.UDim2), 
    RichText = v4.optional(v4.boolean), 
    Text = v4.optional(v4.string), 
    FitContents = v4.optional(v4.boolean), 
    Native = v4.optional(v4.table), 
    [v5.Children] = v4.optional(v4.table)
});
v8.init = function(v9) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    local v10, v11 = v5.createBinding(v9.props.Size);
    v9.ContentSize = v10;
    v9.SetContentSize = v11;
end;
v8.render = function(v12) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v7 (copy), v5 (copy), v3 (copy)
    local l_props_0 = v12.props;
    return l_WithTheme_0(function(v14) --[[ Line: 64 ]]
        -- upvalues: l_createElement_0 (ref), v7 (ref), v12 (copy), l_props_0 (copy), v5 (ref), v3 (ref)
        local v15 = v14["colors/Background/Fill_Color/Acrylic_Background/Base"];
        local v16 = v14["colors/Stroke_Color/Surface_Stroke/Flyout"];
        local v17 = l_createElement_0(v7, {
            BackgroundColor3 = v15.Color, 
            BackgroundTransparency = v15.Transparency, 
            BorderSizePixel = 0, 
            Size = v12.ContentSize
        }, {
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, v14["styles/CornerRadius/Default/Outer"] - 1)
            }), 
            Stroke = l_createElement_0("UIStroke", {
                Color = v16.Color, 
                Transparency = v16.Transparency, 
                Thickness = 1
            })
        });
        local v18 = v14["colors/Fill_Color/Text/Primary"];
        local v19 = v14["fonts/Body"];
        local v21 = l_createElement_0("Frame", {
            AutomaticSize = l_props_0.FitContents and "Y" or "None", 
            BackgroundTransparency = 1, 
            Size = v12.ContentSize
        }, {
            Layout = l_createElement_0("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Content = l_createElement_0("Frame", {
                AutomaticSize = l_props_0.FitContents and "Y" or "None", 
                BackgroundTransparency = 1, 
                Size = v12.ContentSize, 
                [v5.Change.AbsoluteSize] = function(v20) --[[ Line: 107 ]]
                    -- upvalues: l_props_0 (ref), v12 (ref)
                    if l_props_0.FitContents then
                        v12.SetContentSize(UDim2.fromOffset(v20.AbsoluteSize.X, v20.AbsoluteSize.Y));
                    end;
                end
            }, {
                Contents = v5.createFragment(l_props_0[v5.Children] or {}), 
                _Padding = l_createElement_0("UIPadding", {
                    PaddingBottom = UDim.new(0, 16), 
                    PaddingLeft = UDim.new(0, 16), 
                    PaddingRight = UDim.new(0, 16), 
                    PaddingTop = UDim.new(0, 16)
                }), 
                _Layout = l_createElement_0("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 16), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                _Text = l_props_0.Text and l_createElement_0("TextLabel", {
                    LayoutOrder = -1, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = l_props_0.FitContents and "Y" or "None", 
                    FontFace = v19.Font, 
                    Size = UDim2.fromScale(1, l_props_0.FitContents and 0 or 1), 
                    LineHeight = v19.LineHeight, 
                    RichText = l_props_0.RichText, 
                    Text = l_props_0.Text, 
                    TextColor3 = v18.Color, 
                    TextSize = v19.Size, 
                    TextTransparency = v18.Transparency, 
                    TextWrapped = true, 
                    TextXAlignment = "Left", 
                    TextYAlignment = "Top"
                })
            })
        });
        return l_createElement_0("Frame", v3.Dictionary.join({
            AnchorPoint = l_props_0.AnchorPoint, 
            AutomaticSize = l_props_0.FitContents and "Y" or "None", 
            BackgroundTransparency = 1, 
            Position = l_props_0.Position, 
            Size = v12.ContentSize, 
            [v5.Change.AbsoluteSize] = function(v22) --[[ Line: 154 ]]
                -- upvalues: v12 (ref)
                v12.SetContentSize(UDim2.fromOffset(v22.AbsoluteSize.X, v22.AbsoluteSize.Y));
            end
        }, l_props_0.Native), {
            Base = v17, 
            Container = v21
        });
    end);
end;
return v8;