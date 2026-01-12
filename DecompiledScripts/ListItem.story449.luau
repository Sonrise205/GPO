local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_0.Utility.FrameVisualizer);
local v4 = require(l_Parent_1.Sift);
local v5 = require(l_Parent_1.Roact);
local l_createElement_0 = v5.createElement;
local l_Parent_2 = script.Parent;
local v8 = require(l_Parent_2.ListItem);
local v9 = UDim.new(0, 8);
local v10 = v5.PureComponent:extend(script.Name);
v10.render = function(v11) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v9 (copy), v8 (copy), v5 (copy), v3 (copy)
    local l_props_0 = v11.props;
    return l_WithTheme_0(function(v13) --[[ Line: 23 ]]
        -- upvalues: l_createElement_0 (ref), l_props_0 (copy), v9 (ref), v8 (ref), v11 (copy), v5 (ref), v3 (ref)
        local v14 = l_createElement_0("Frame", {
            BackgroundTransparency = l_props_0.BackgroundTransparency, 
            BackgroundColor3 = v13["colors/Background/Fill_Color/Solid_Background/Base"].Color, 
            AutomaticSize = "XY", 
            Size = UDim2.fromOffset(176, 56)
        }, {
            Padding = l_createElement_0("UIPadding", {
                PaddingBottom = v9, 
                PaddingLeft = v9, 
                PaddingRight = v9, 
                PaddingTop = v9
            }), 
            ListItem = l_createElement_0(v8, {
                Icon = l_props_0.Icon and "images/roblox/icons/logo/studiologo_small/1x" or nil, 
                AnchorPoint = Vector2.new(0, 0), 
                Disabled = l_props_0.Disabled, 
                Position = UDim2.fromScale(0, 0), 
                Selected = v11.state.Selected, 
                [v5.Event.Activated] = function(...) --[[ Line: 42 ]]
                    -- upvalues: v11 (ref)
                    print(...);
                    v11:setState({
                        Selected = not v11.state.Selected
                    });
                end
            })
        });
        if l_props_0.FrameVisualizer then
            return l_createElement_0(v3, {}, v14);
        else
            return v14;
        end;
    end);
end;
return {
    controls = {
        Disabled = false, 
        FrameVisualizer = false, 
        Icon = true
    }, 
    stories = {
        Button = function(v15) --[[ Line: 66 ]] --[[ Name: Button ]]
            -- upvalues: v5 (copy), l_createElement_0 (copy), v10 (copy), v4 (copy)
            return v5.createFragment({
                OnBackground = l_createElement_0(v10, v4.Dictionary.join({
                    BackgroundTransparency = 0
                }, v15.controls)), 
                NoBackground = l_createElement_0(v10, v4.Dictionary.join({
                    BackgroundTransparency = 1
                }, v15.controls))
            });
        end
    }
};