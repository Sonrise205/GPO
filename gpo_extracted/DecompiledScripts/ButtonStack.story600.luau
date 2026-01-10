local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.FrameVisualizer);
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.Roact);
local l_createElement_0 = v4.createElement;
local v6 = require(script.Parent.ButtonStack);
local v7 = v4.PureComponent:extend(script.Name);
v7.render = function(v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v6 (copy), v3 (copy), v4 (copy), v2 (copy)
    local v9 = l_createElement_0(v6, v3.Dictionary.join({
        Size = UDim2.new(1, 0, 0, 30), 
        ButtonHeight = UDim.new(0, 30), 
        Buttons = {
            [1] = {
                Text = "Primary", 
                Style = "Accent", 
                [v4.Event.Activated] = print
            }, 
            [2] = {
                Text = "Secondary", 
                Style = "Standard", 
                [v4.Event.Activated] = print
            }, 
            [3] = {
                Text = "Tertiary", 
                Style = "Standard", 
                [v4.Event.Activated] = print
            }
        }
    }, v8.props.Props));
    if v8.props.Wireframe then
        return l_createElement_0(v2, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v9);
    else
        return v9;
    end;
end;
return {
    controls = {
        Wireframe = false
    }, 
    stories = {
        ButtonStack = function(v10) --[[ Line: 54 ]] --[[ Name: ButtonStack ]]
            -- upvalues: l_createElement_0 (copy), v7 (copy)
            return l_createElement_0(v7, v10.controls);
        end
    }
};