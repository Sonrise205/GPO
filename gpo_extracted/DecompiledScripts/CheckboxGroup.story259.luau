local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_createElement_0 = v1.createElement;
local l_Parent_1 = script.Parent;
local v4 = require(l_Parent_1.CheckboxGroup);
local _ = require(l_Parent_1["Checkbox.story"]).storyElement;
local v6 = v1.PureComponent:extend(script.Name);
v6.GetCheckboxes = function(v7) --[[ Line: 12 ]] --[[ Name: GetCheckboxes ]]
    local v8 = {};
    for v9 = 1, v7.props.Amount do
        v8[v9] = {
            Label = tostring(v9)
        };
    end;
    return v8;
end;
v6.render = function(v10) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v4 (copy)
    return l_createElement_0(v4, {
        HeaderText = v10.props.HeaderText, 
        Checkboxes = v10:GetCheckboxes()
    });
end;
return {
    controls = {
        HeaderText = "Header text", 
        Amount = 10, 
        Disabled = false
    }, 
    stories = {
        CheckboxGroup = function(v11) --[[ Line: 39 ]] --[[ Name: CheckboxGroup ]]
            -- upvalues: l_createElement_0 (copy), v6 (copy)
            return l_createElement_0(v6, v11.controls);
        end
    }
};