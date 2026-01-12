local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Sift);
local v2 = require(l_Parent_0.Roact);
local l_createElement_0 = v2.createElement;
local l_Parent_1 = script.Parent;
local v5 = require(l_Parent_1.RoundedSurface);
local v6 = v2.PureComponent:extend(script.Name);
v6.render = function(v7) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v5 (copy), v1 (copy)
    return l_createElement_0(v5, v1.Dictionary.join({
        Size = UDim2.fromOffset(50, 50), 
        BackgroundColor = {
            Color = Color3.new(1, 1, 1), 
            Transparency = v7.props.Alpha or 0.5
        }, 
        CornerRadius = UDim.new(0, v7.props.Radius or 5), 
        ShowTopLeftCorner = v7.props.TLeft, 
        ShowTopRightCorner = v7.props.TRight, 
        ShowBottomLeftCorner = v7.props.BLeft, 
        ShowBottomRightCorner = v7.props.BRight
    }, v7.props.Props));
end;
return {
    controls = {
        Radius = 10, 
        Alpha = 0.5, 
        TLeft = false, 
        TRight = true, 
        BLeft = true, 
        BRight = false
    }, 
    stories = {
        RoundedSurface = function(v8) --[[ Line: 38 ]] --[[ Name: RoundedSurface ]]
            -- upvalues: l_createElement_0 (copy), v6 (copy)
            return l_createElement_0(v6, v8.controls);
        end
    }
};