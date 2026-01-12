local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.FrameVisualizer);
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.Roact);
local l_createElement_0 = v4.createElement;
local v6 = require(script.Parent.TitleBar);
local v7 = v4.PureComponent:extend(script.Name);
v7.render = function(v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v6 (copy), v3 (copy), v2 (copy)
    local v9 = l_createElement_0(v6, v3.Dictionary.join({
        Icon = v8.props.Icon and "images/roblox/icons/logo/studiologo_small/1x" or nil, 
        ReleaseText = "Story", 
        AlwaysShowClose = v8.props.AlwaysShowClose, 
        BackgroundColor = "colors/Background/Fill_Color/Solid_Background/Base", 
        Height = v8.props.Size == "Standard" and 32 or v8.props.Size == "Large" and 48 or 29, 
        OnClose = print, 
        CaptionButtonWidth = v8.props.Size == "Small" and 29 or 32
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
        AlwaysShowClose = false, 
        Wireframe = false, 
        Icon = false, 
        Size = {
            "Standard", 
            "Large", 
            "Small"
        }
    }, 
    stories = {
        TitleBar = function(v10) --[[ Line: 45 ]] --[[ Name: TitleBar ]]
            -- upvalues: l_createElement_0 (copy), v7 (copy)
            return l_createElement_0(v7, v10.controls);
        end
    }
};