local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Roact);
local l_createElement_0 = v3.createElement;
local v5 = require(script.Parent.Checkbox);
local v6 = UDim.new(0, 8);
local v7 = v3.PureComponent:extend(script.Name);
v7.init = function(v8) --[[ Line: 16 ]] --[[ Name: init ]]
    v8:setState({
        Selected = nil
    });
end;
v7.render = function(v9) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v5 (copy), v3 (copy), v6 (copy)
    local l_props_0 = v9.props;
    local l_state_0 = v9.state;
    return l_WithTheme_0(function(v12) --[[ Line: 26 ]]
        -- upvalues: l_createElement_0 (ref), v5 (ref), l_state_0 (copy), v9 (copy), v3 (ref), l_props_0 (copy), v6 (ref)
        local v13 = l_createElement_0(v5, {
            Label = l_state_0.Selected == nil and "Indeterminate" or l_state_0.Selected == true and "Selected" or "Deselected", 
            Selected = l_state_0.Selected, 
            Disabled = v9.props.Disabled, 
            [v3.Event.Activated] = function(...) --[[ Line: 32 ]]
                -- upvalues: v9 (ref), l_state_0 (ref)
                print(...);
                v9:setState({
                    Selected = not l_state_0.Selected
                });
            end
        });
        if l_props_0.OnBackground then
            return l_createElement_0("Frame", {
                BackgroundTransparency = l_props_0.BackgroundTransparency, 
                BackgroundColor3 = v12["colors/Background/Fill_Color/Solid_Background/Base"].Color, 
                AutomaticSize = "XY", 
                Size = UDim2.new(1, 0, 0, 45)
            }, {
                Padding = l_createElement_0("UIPadding", {
                    PaddingBottom = v6, 
                    PaddingLeft = v6, 
                    PaddingRight = v6, 
                    PaddingTop = v6
                }), 
                Checkbox = v13
            });
        else
            return v13;
        end;
    end);
end;
local v14 = {
    OnBackground = true, 
    Disabled = false
};
return {
    storyElement = v7, 
    roact = v3, 
    controls = v14, 
    stories = {
        Checkbox = function(v15) --[[ Line: 71 ]] --[[ Name: Checkbox ]]
            -- upvalues: v3 (copy), v7 (copy)
            local l_controls_0 = v15.controls;
            return v3.createElement(v7, l_controls_0);
        end
    }
};