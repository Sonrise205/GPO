local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.FrameVisualizer);
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.Roact);
local l_createElement_0 = v4.createElement;
local v6 = require(l_Parent_0.App.Flyout.Flyout);
local v7 = require(script.Parent.Window);
local v8 = v4.PureComponent:extend(script.Name);
v8.render = function(v9) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v7 (copy), v3 (copy), v6 (copy), v2 (copy)
    local l_props_0 = v9.props;
    local v11 = l_createElement_0(v7, v3.Dictionary.join({
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.fromOffset(400, 200), 
        ContentBackgroundColor = "colors/Background/Fill_Color/Layer/Default", 
        FooterHeight = l_props_0.FooterHeight, 
        TitleBarProps = {
            Icon = "images/roblox/icons/logo/studiologo_small/1x", 
            Text = "Window", 
            ReleaseText = "Story", 
            OnClose = l_props_0.CanClose and print or nil
        }, 
        FooterContents = {
            Label = l_createElement_0("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Text = "`FooterContents` goes here", 
                TextColor3 = Color3.new(1, 1, 1), 
                TextStrokeTransparency = 0
            })
        }
    }, v9.props.Props), {
        Label = l_createElement_0("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Text = "\n\n\n\n\n\n\n\n\n`[Roact.Children]` goes here", 
            TextColor3 = Color3.new(1, 1, 1), 
            TextStrokeTransparency = 0, 
            ZIndex = 2
        }), 
        Flyout = l_createElement_0(v6, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 25), 
            RichText = true, 
            Text = "<b>Note:</b>\nWindow dragging will not work while inside a plugin widget window."
        })
    });
    if v9.props.Wireframe then
        return l_createElement_0(v2, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v11);
    else
        return v11;
    end;
end;
return {
    controls = {
        Wireframe = false, 
        CanClose = true, 
        FooterHeight = 80
    }, 
    stories = {
        Window = function(v12) --[[ Line: 74 ]] --[[ Name: Window ]]
            -- upvalues: l_createElement_0 (copy), v8 (copy)
            return l_createElement_0(v8, v12.controls);
        end
    }
};