local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.FrameVisualizer);
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.Roact);
local l_createElement_0 = v4.createElement;
local v6 = require(script.Parent.Dialog);
local v7 = v4.PureComponent:extend(script.Name);
v7.render = function(v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v6 (copy), v3 (copy), v4 (copy), v2 (copy)
    local l_props_0 = v8.props;
    local v10 = l_createElement_0(v6, v3.Dictionary.join({
        TitleText = "Title", 
        BodyText = l_props_0.BodyText, 
        Buttons = l_props_0.Buttons and {
            [1] = {
                Text = "Accept", 
                Style = "Accent", 
                [v4.Event.Activated] = print
            }, 
            [2] = {
                Text = "Cancel", 
                Style = "Standard", 
                [v4.Event.Activated] = print
            }, 
            [3] = {
                Disabled = true, 
                Text = "Disabled", 
                Style = "Standard", 
                [v4.Event.Activated] = print
            }
        }, 
        TitleBarProps = {
            Icon = "images/roblox/icons/logo/studiologo_small/1x", 
            Text = "App name", 
            ReleaseText = "Preview", 
            OnClose = print
        }, 
        WindowProps = {
            FooterHeight = 80
        }
    }, v8.props.Props));
    if v8.props.Wireframe then
        return l_createElement_0(v2, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v10);
    else
        return v10;
    end;
end;
return {
    controls = {
        Wireframe = false, 
        Buttons = true, 
        BodyText = "This is body text. Windows 11 marks a visual evolution of the operating system. We have evolved our design language alongside with Fluent to create a design which is human, universal and truly feels like Windows. \n\nThe design principles below have guided us throughout the journey of making Windows the best-in-class implementation of Fluent."
    }, 
    stories = {
        Dialog = function(v11) --[[ Line: 73 ]] --[[ Name: Dialog ]]
            -- upvalues: l_createElement_0 (copy), v7 (copy)
            return l_createElement_0(v7, v11.controls);
        end
    }
};