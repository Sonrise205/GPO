local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.Roact);
local l_createElement_0 = v4.createElement;
local l_Parent_2 = script.Parent;
local v7 = require(l_Parent_2.Button);
local v8 = UDim.new(0, 8);
local v9 = v4.PureComponent:extend(script.Name);
v9.render = function(v10) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v8 (copy), v7 (copy), v4 (copy)
    local l_props_0 = v10.props;
    return l_WithTheme_0(function(v12) --[[ Line: 21 ]]
        -- upvalues: l_createElement_0 (ref), l_props_0 (copy), v8 (ref), v7 (ref), v4 (ref)
        return l_createElement_0("Frame", {
            BackgroundTransparency = l_props_0.BackgroundTransparency, 
            BackgroundColor3 = v12["colors/Background/Fill_Color/Solid_Background/Base"].Color, 
            AutomaticSize = "XY"
        }, {
            Padding = l_createElement_0("UIPadding", {
                PaddingBottom = v8, 
                PaddingLeft = v8, 
                PaddingRight = v8, 
                PaddingTop = v8
            }), 
            Button = l_createElement_0(v7, {
                AnchorPoint = Vector2.new(0, 0), 
                Disabled = l_props_0.Disabled, 
                Position = UDim2.fromScale(0, 0), 
                Style = l_props_0.Style, 
                [v4.Event.Activated] = print
            })
        });
    end);
end;
return {
    controls = {
        Disabled = false, 
        Style = {
            "Accent", 
            "Primary", 
            "Secondary", 
            "Standard", 
            "Default"
        }
    }, 
    stories = {
        Button = function(v13) --[[ Line: 56 ]] --[[ Name: Button ]]
            -- upvalues: v4 (copy), l_createElement_0 (copy), v9 (copy), v3 (copy)
            return v4.createFragment({
                OnBackground = l_createElement_0(v9, v3.Dictionary.join({
                    BackgroundTransparency = 0
                }, v13.controls)), 
                NoBackground = l_createElement_0(v9, v3.Dictionary.join({
                    BackgroundTransparency = 1
                }, v13.controls))
            });
        end
    }
};