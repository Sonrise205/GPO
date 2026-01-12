local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Sift);
local v2 = require(l_Parent_0.Roact);
local l_createElement_0 = v2.createElement;
local v4 = require(script.Parent.HyperlinkButton);
local v5 = v2.PureComponent:extend(script.Name);
v5.render = function(v6) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v4 (copy), v1 (copy)
    local l_props_0 = v6.props;
    return l_createElement_0(v4, v1.Dictionary.join({
        Disabled = l_props_0.Disabled, 
        Text = "Hyperlink Story"
    }, l_props_0.Props));
end;
return {
    controls = {
        Disabled = false
    }, 
    stories = {
        HyperlinkButton = function(v8) --[[ Line: 25 ]] --[[ Name: HyperlinkButton ]]
            -- upvalues: l_createElement_0 (copy), v5 (copy)
            return l_createElement_0(v5, v8.controls);
        end
    }
};