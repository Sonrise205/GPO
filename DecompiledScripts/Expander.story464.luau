local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Sift);
local v2 = require(l_Parent_0.Roact);
local l_createElement_0 = v2.createElement;
local v4 = require(script.Parent.Expander);
local v5 = v2.PureComponent:extend(script.Name);
v5.render = function(v6) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v4 (copy), v1 (copy), v2 (copy)
    local l_props_0 = v6.props;
    local l_state_0 = v6.state;
    return l_createElement_0(v4, v1.Dictionary.join({
        Expanded = l_state_0.Expanded, 
        Heading = l_props_0.Heading and "Power button functionality" or nil, 
        Caption = l_props_0.Caption and "Adjust what your power buttons control" or nil, 
        Icon = l_props_0.Icon and "images/roblox/icons/logo/studiologo/1x", 
        [v2.Event.Activated] = function(...) --[[ Line: 22 ]]
            -- upvalues: v6 (copy), l_state_0 (copy)
            print(...);
            v6:setState({
                Expanded = not l_state_0.Expanded
            });
        end
    }, l_props_0.Props));
end;
return {
    controls = {
        Icon = true, 
        Heading = true, 
        Caption = true
    }, 
    stories = {
        Expander = function(v9) --[[ Line: 39 ]] --[[ Name: Expander ]]
            -- upvalues: l_createElement_0 (copy), v5 (copy)
            return l_createElement_0(v5, v9.controls);
        end
    }
};