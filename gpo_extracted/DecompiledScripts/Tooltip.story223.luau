local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Sift);
local v2 = require(l_Parent_0.Roact);
local l_createElement_0 = v2.createElement;
local v4 = require(script.Parent.Tooltip);
local v5 = v2.PureComponent:extend(script.Name);
v5.render = function(v6) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v4 (copy), v1 (copy)
    local l_props_0 = v6.props;
    return l_createElement_0(v4, v1.Dictionary.join({
        Text = l_props_0.Text .. (l_props_0.Wrapped and "\nThat is wrapped" or ""), 
        Icon = l_props_0.Icon and "images/roblox/icons/logo/studiologo_small/1x" or nil
    }, l_props_0.Props));
end;
return {
    controls = {
        Text = "Tooltip Text", 
        Icon = false, 
        Wrapped = false
    }, 
    stories = {
        Tooltip = function(v8) --[[ Line: 27 ]] --[[ Name: Tooltip ]]
            -- upvalues: l_createElement_0 (copy), v5 (copy)
            return l_createElement_0(v5, v8.controls);
        end
    }
};