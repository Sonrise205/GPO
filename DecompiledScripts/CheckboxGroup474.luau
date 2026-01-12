local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local l_createElement_0 = v5.createElement;
local l_Parent_2 = script.Parent;
local v8 = require(l_Parent_2.Checkbox);
local v9 = v5.PureComponent:extend(script.Name);
v9.defaultProps = {
    HeaderFont = "fonts/Body", 
    HeaderTextColor = "colors/Fill_Color/Text/Primary", 
    HeaderHeight = 21, 
    FitContents = false, 
    Size = UDim2.new(1, 0, 1, 0)
};
v9.validateProps = v4.strictInterface({
    HeaderText = v4.string, 
    Checkboxes = v4.table, 
    Size = v4.optional(v4.UDim2), 
    FitContents = v4.optional(v4.boolean), 
    HeaderTextColor = v4.optional(v4.string), 
    HeaderFont = v4.optional(v4.string), 
    HeaderHeight = v4.optional(v4.numberPositive), 
    Native = v4.optional(v4.table)
});
v9.init = function(v10) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    local v11, v12 = v5.createBinding(0);
    v10.ContainerHeight = v11;
    v10.SetContainerHeight = v12;
end;
v9.GetCheckboxes = function(v13) --[[ Line: 61 ]] --[[ Name: GetCheckboxes ]]
    -- upvalues: l_createElement_0 (copy), v8 (copy)
    local l_props_0 = v13.props;
    local v15 = {};
    for v16, v17 in pairs(l_props_0.Checkboxes) do
        v15[v16] = l_createElement_0(v8, v17);
    end;
    return v15;
end;
v9.render = function(v18) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v5 (copy), v3 (copy)
    local l_props_1 = v18.props;
    return l_WithTheme_0(function(v20) --[[ Line: 76 ]]
        -- upvalues: l_props_1 (copy), l_createElement_0 (ref), v5 (ref), v18 (copy), v3 (ref)
        local v21 = v20[l_props_1.HeaderTextColor];
        local v22 = v20[l_props_1.HeaderFont];
        local v23 = l_createElement_0("TextLabel", {
            BackgroundTransparency = 1, 
            FontFace = v22.Font, 
            Position = UDim2.fromOffset(3, 1), 
            Size = UDim2.new(1, -3, 1, -1), 
            Text = l_props_1.HeaderText, 
            TextColor3 = v21.Color, 
            TextSize = v22.Size, 
            TextTransparency = v21.Transparency, 
            TextXAlignment = "Left"
        });
        local v24 = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_props_1.HeaderHeight)
        }, {
            Label = v23
        });
        local v27 = l_createElement_0("Frame", {
            AutomaticSize = l_props_1.FitContents and "Y" or "None", 
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, l_props_1.HeaderHeight), 
            [v5.Change.AbsoluteSize] = function(v25) --[[ Line: 111 ]]
                -- upvalues: v18 (ref)
                v18.SetContainerHeight(v25.AbsoluteSize.Y);
            end, 
            Size = v18.ContainerHeight:map(function(v26) --[[ Line: 115 ]]
                -- upvalues: l_props_1 (ref)
                if not l_props_1.FitContents then
                    return l_props_1.Size;
                else
                    return UDim2.new(1, 0, 0, v26);
                end;
            end)
        }, {
            Checkboxes = v5.createFragment(v18:GetCheckboxes()), 
            InitialPadding = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = -1, 
                Size = UDim2.new(1, 0, 0, 8)
            }), 
            Layout = l_createElement_0("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 8), 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        });
        return l_createElement_0("Frame", v3.Dictionary.join({
            BackgroundTransparency = 1, 
            Size = v18.ContainerHeight:map(function(v28) --[[ Line: 142 ]]
                -- upvalues: l_props_1 (ref)
                if not l_props_1.FitContents then
                    return l_props_1.Size;
                else
                    return UDim2.new(l_props_1.Size.X.Scale, l_props_1.Size.X.Offset, 0, v28 + l_props_1.HeaderHeight);
                end;
            end)
        }, l_props_1.Native), {
            Header = v24, 
            CheckboxContainer = v27
        });
    end);
end;
return v9;