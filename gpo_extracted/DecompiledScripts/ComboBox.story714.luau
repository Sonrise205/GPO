local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_1.Roact);
local l_createElement_0 = v4.createElement;
local l_Parent_2 = script.Parent;
local v7 = require(l_Parent_2.ComboBox);
local v8 = UDim.new(0, 8);
local v9 = v4.PureComponent:extend(script.Name);
v9.render = function(v10) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v8 (copy), v7 (copy)
    local l_props_0 = v10.props;
    return l_WithTheme_0(function(v12) --[[ Line: 21 ]]
        -- upvalues: l_createElement_0 (ref), v8 (ref), l_props_0 (copy), v7 (ref), v10 (copy)
        return l_createElement_0("Frame", {
            Size = UDim2.fromOffset(120, 32) + UDim2.fromOffset(v8.Offset * 2, v8.Offset * 2), 
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
            ComboBox = l_createElement_0(v7, {
                DropdownButtonProps = {
                    Disabled = l_props_0.Disabled
                }, 
                SelectedOption = v10.state.SelectedOption, 
                OnOptionSelected = function(v13, ...) --[[ Line: 39 ]] --[[ Name: OnOptionSelected ]]
                    -- upvalues: v10 (ref)
                    print(v13, ...);
                    v10:setState({
                        SelectedOption = v13
                    });
                end, 
                Options = {
                    "Option A", 
                    "Option B", 
                    "Option C", 
                    "Option D", 
                    "Really really long option text"
                }
            })
        });
    end);
end;
return {
    controls = {
        Disabled = false
    }, 
    stories = {
        DropdownButton = function(v14) --[[ Line: 62 ]] --[[ Name: DropdownButton ]]
            -- upvalues: l_createElement_0 (copy), v9 (copy), v3 (copy)
            return l_createElement_0(v9, v3.Dictionary.join({
                BackgroundTransparency = 0
            }, v14.controls));
        end, 
        NoBackground = function(v15) --[[ Line: 67 ]] --[[ Name: NoBackground ]]
            -- upvalues: l_createElement_0 (copy), v9 (copy), v3 (copy)
            return l_createElement_0(v9, v3.Dictionary.join({
                BackgroundTransparency = 1
            }, v15.controls));
        end
    }
};