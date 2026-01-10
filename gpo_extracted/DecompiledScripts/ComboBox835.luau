local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Sift);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Roact);
local l_createElement_0 = v4.createElement;
local v6 = require(l_Parent_0.App.Menu.ContextMenu);
local v7 = require(l_Parent_0.App.Effect.FocusFrame);
local l_Parent_2 = script.Parent;
local v9 = require(l_Parent_2.DropdownButton);
local v10 = v4.PureComponent:extend(script.Name);
v10.defaultProps = {
    Size = UDim2.fromOffset(120, 32)
};
v10.validateProps = v3.strictInterface({
    AnchorPoint = v3.optional(v3.Vector2), 
    LayoutOrder = v3.optional(v3.number), 
    Size = v3.optional(v3.UDim2), 
    Position = v3.optional(v3.UDim2), 
    DropdownButtonProps = v3.optional(v3.table), 
    Options = v3.table, 
    SelectedOption = v3.optional(v3.string), 
    OnOptionSelected = v3.optional(v3.callback), 
    Native = v3.optional(v3.table)
});
v10.render = function(v11) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v7 (copy), v4 (copy), v6 (copy), v9 (copy), v2 (copy)
    local l_props_0 = v11.props;
    local l_state_0 = v11.state;
    local v14 = {};
    for v15, v16 in pairs(l_props_0.Options) do
        v14[v15] = {
            Text = v16, 
            Selected = v16 == l_props_0.SelectedOption, 
            OnClicked = function() --[[ Line: 65 ]] --[[ Name: OnClicked ]]
                -- upvalues: v11 (copy), l_state_0 (copy), l_props_0 (copy), v16 (copy)
                v11:setState({
                    ContextMenuVisible = not l_state_0.ContextMenuVisible
                });
                l_props_0.OnOptionSelected(v16);
            end
        };
    end;
    local v17 = l_state_0.ContextMenuVisible and l_createElement_0(v7, {
        RelativeToParent = true, 
        Reason = "COMBOBOX_DROPDOWN_CONTEXT_MENU", 
        [v4.Event.FocusLost] = function() --[[ Line: 79 ]]
            -- upvalues: v11 (copy), l_state_0 (copy)
            v11:setState({
                ContextMenuVisible = not l_state_0.ContextMenuVisible
            });
        end
    }, {
        ContextMenu = l_createElement_0(v6, {
            BackgroundTransparency = 0, 
            Options = v14, 
            Size = UDim2.new(1, 0, 0, l_props_0.Size)
        })
    });
    local v18 = l_createElement_0(v9, v2.Dictionary.join({
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        Text = l_props_0.SelectedOption or "*", 
        [v4.Event.Activated] = function() --[[ Line: 101 ]]
            -- upvalues: l_props_0 (copy), v11 (copy), l_state_0 (copy)
            if l_props_0.DropdownButtonProps and l_props_0.DropdownButtonProps.Disabled then
                return;
            else
                v11:setState({
                    ContextMenuVisible = not l_state_0.ContextMenuVisible
                });
                return;
            end;
        end
    }, l_props_0.DropdownButtonProps));
    return l_createElement_0("Frame", v2.Dictionary.join({
        AnchorPoint = l_props_0.AnchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size
    }, l_props_0.Native), {
        Button = v18, 
        ContextMenu = v17
    });
end;
return v10;