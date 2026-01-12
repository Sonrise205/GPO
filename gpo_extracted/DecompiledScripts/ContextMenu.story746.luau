local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Sift);
local v3 = require(l_Parent_1.Roact);
local l_createElement_0 = v3.createElement;
local v5 = require(l_Parent_0.Utility.FrameVisualizer);
local v6 = require(script.Parent.ContextMenu);
local v7 = v3.PureComponent:extend(script.Name);
v7.render = function(v8) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v6 (copy), v2 (copy), v5 (copy)
    local v9 = l_createElement_0(v6, v2.Dictionary.join({
        Size = UDim2.new(0, 200, 0, 0), 
        FitContents = true, 
        UseIcon = v8.props.Icon, 
        Options = {
            {
                Selected = true, 
                Text = "Selected", 
                Icon = "images/roblox/icons/actions/randomize/1x", 
                OnClicked = print
            }, 
            {
                Selected = false, 
                Text = "Deselected", 
                Icon = "images/roblox/icons/controls/keys/command/1x", 
                OnClicked = print
            }, 
            {
                IsDivider = true
            }, 
            {
                Disabled = true, 
                Text = "Disabled", 
                Icon = "images/roblox/icons/controls/keys/alt/1x", 
                OnClicked = print
            }, 
            {
                Selected = true, 
                Disabled = true, 
                Text = "DisabledSelected", 
                Icon = "images/roblox/icons/graphic/blocktheft_2xl/1x", 
                OnClicked = print
            }, 
            {
                Selected = false, 
                Text = "No icon", 
                OnClicked = print
            }, 
            {
                IsDivider = true
            }, 
            {
                Selected = true, 
                Text = "No icon selected", 
                OnClicked = print
            }
        }
    }, v8.props.Props));
    if v8.props.Wireframe then
        return l_createElement_0(v5, {}, v9);
    else
        return v9;
    end;
end;
return {
    controls = {
        Wireframe = false, 
        Icon = true
    }, 
    stories = {
        ContextMenu = function(v10) --[[ Line: 72 ]] --[[ Name: ContextMenu ]]
            -- upvalues: l_createElement_0 (copy), v7 (copy)
            return l_createElement_0(v7, v10.controls);
        end
    }
};