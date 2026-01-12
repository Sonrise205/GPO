local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local l_createElement_0 = v5.createElement;
local v7 = require(l_Parent_0.App.Input.Hyperlink.HyperlinkButton);
local v8 = require(l_Parent_0.App.Input.Button.ButtonStack);
local l_Parent_2 = script.Parent;
local v10 = require(l_Parent_2.Window);
local v11 = v5.PureComponent:extend(script.Name);
v11.defaultProps = {
    AutomaticSize = Enum.AutomaticSize.Y, 
    Position = UDim2.fromScale(0.5, 0.5), 
    Size = UDim2.fromOffset(540, 0), 
    TitleBarProps = {}, 
    WindowProps = {}
};
v11.validateProps = v4.strictInterface({
    AnchorPoint = v4.optional(v4.Vector2), 
    AutomaticSize = v4.optional(v4.EnumItem), 
    Buttons = v4.optional(v4.table), 
    Position = v4.optional(v4.UDim2), 
    RichText = v4.optional(v4.boolean), 
    Size = v4.optional(v4.UDim2), 
    DetailTitle = v4.optional(v4.string), 
    DetailBody = v4.optional(v4.string), 
    DetailContents = v4.optional(v4.table), 
    BodyText = v4.optional(v4.string), 
    TitleText = v4.optional(v4.string), 
    TitleBarProps = v4.optional(v4.table), 
    WindowProps = v4.optional(v4.table), 
    [v5.Children] = v4.optional(v4.table), 
    ButtonStackProps = v4.optional(v4.table), 
    Native = v4.optional(v4.table)
});
v11.render = function(v12) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v7 (copy), v8 (copy), v3 (copy), v10 (copy)
    local l_props_0 = v12.props;
    local l_state_0 = v12.state;
    return l_WithTheme_0(function(v15) --[[ Line: 85 ]]
        -- upvalues: l_props_0 (copy), l_createElement_0 (ref), v7 (ref), l_state_0 (copy), v8 (ref), v3 (ref), v10 (ref)
        local v16 = v15["fonts/Subtitle"];
        local v17 = v15["colors/Fill_Color/Text/Primary"];
        local v18 = l_props_0.TitleText and l_createElement_0("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            FontFace = v16.Font, 
            LayoutOrder = 1, 
            LineHeight = v16.LineHeight, 
            Size = UDim2.fromScale(1, 0), 
            Text = l_props_0.TitleText, 
            TextSize = v16.Size, 
            TextColor3 = v17.Color, 
            TextTransparency = v17.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        });
        local v19 = v15["fonts/Body"];
        local v20 = v15["colors/Fill_Color/Text/Primary"];
        local v21 = l_props_0.BodyText and l_createElement_0("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            FontFace = v19.Font, 
            LayoutOrder = 2, 
            LineHeight = v19.LineHeight, 
            RichText = l_props_0.RichText, 
            Size = UDim2.fromScale(1, 0), 
            Text = l_props_0.BodyText, 
            TextSize = v19.Size, 
            TextColor3 = v20.Color, 
            TextTransparency = v20.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        });
        local v22 = (l_props_0.DetailTitle or l_props_0.DetailBody or l_props_0.DetailContents) and l_createElement_0(v7, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = l_state_0.DetailShown and 4 or 3, 
            Size = UDim2.fromScale(0, 0), 
            Text = l_props_0.DetailButtonText, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
        local v23 = l_props_0.Buttons and l_createElement_0(v8, v3.Dictionary.join({
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Buttons = l_props_0.Buttons, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            PaddingLeft = UDim.new(0, v15["styles/Padding/Default/Outer/Left"]), 
            PaddingRight = UDim.new(0, v15["styles/Padding/Default/Outer/Right"])
        }, l_props_0.ButtonStackProps));
        return l_createElement_0(v10, v3.Dictionary.join({
            AnchorPoint = l_props_0.AnchorPoint, 
            AutomaticSize = l_props_0.AutomaticSize, 
            ContentBackgroundColor = "colors/Background/Fill_Color/Layer/Alt", 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            Native = l_props_0.Native, 
            FooterHeight = v23 and 80 or 0, 
            FooterContents = v23, 
            TitleBarProps = v3.Dictionary.join({
                BackgroundColor = "colors/Background/Fill_Color/Layer/Alt"
            }, l_props_0.TitleBarProps)
        }, l_props_0.WindowProps), {
            Title = v18, 
            Body = v21, 
            DetailHyperlink = v22, 
            Layout = l_createElement_0("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            Padding = l_createElement_0("UIPadding", {
                PaddingBottom = UDim.new(0, v15["styles/Padding/Content/Outer/Bottom"]), 
                PaddingLeft = UDim.new(0, v15["styles/Padding/Content/Outer/Left"]), 
                PaddingRight = UDim.new(0, v15["styles/Padding/Content/Outer/Right"]), 
                PaddingTop = UDim.new(0, v15["styles/Padding/Content/Outer/Top"])
            })
        });
    end);
end;
return v11;