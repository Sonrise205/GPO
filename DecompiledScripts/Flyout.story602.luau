local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Sift);
local v3 = require(l_Parent_1.Roact);
local l_createElement_0 = v3.createElement;
local v5 = require(script.Parent.Flyout);
local v6 = require(l_Parent_0.App.Input.Button.Button);
local v7 = v3.PureComponent:extend(script.Name);
v7.render = function(v8) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v5 (copy), v2 (copy), v3 (copy), v6 (copy)
    return l_createElement_0(v5, v2.Dictionary.join({
        Size = UDim2.new(1, 0, 0, 0), 
        FitContents = true, 
        Text = "This is the flyout component\nThe flyout component should not be used as a dialog but instead to show quick actions or notification alerts.", 
        [v3.Children] = v8.props.IncludeContents and l_createElement_0(v6, {
            Size = UDim2.new(0, 150, 0, 30), 
            Text = "Contents"
        })
    }, v8.props.controls));
end;
return {
    controls = {
        IncludeContents = true
    }, 
    stories = {
        Flyout = function(v9) --[[ Line: 30 ]] --[[ Name: Flyout ]]
            -- upvalues: l_createElement_0 (copy), v7 (copy)
            return l_createElement_0(v7, v9.controls);
        end
    }
};