local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Sift);
local v2 = require(l_Parent_0.Roact);
local l_createElement_0 = v2.createElement;
local v4 = require(script.Parent.RadialProgressBar);
local v5 = v2.PureComponent:extend(script.Name);
v5.render = function(v6) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v4 (copy), v1 (copy)
    local l_props_0 = v6.props;
    return l_createElement_0(v4, v1.Dictionary.join({
        Clockwise = l_props_0.Clockwise, 
        Value = l_props_0.End
    }, l_props_0.Props));
end;
return {
    controls = {
        Clockwise = false, 
        End = 0.5
    }, 
    stories = {
        ClockwiseRadialProgressBar = function(v8) --[[ Line: 27 ]] --[[ Name: ClockwiseRadialProgressBar ]]
            -- upvalues: l_createElement_0 (copy), v5 (copy)
            v8.controls.Clockwise = true;
            return l_createElement_0(v5, v8.controls);
        end, 
        ConterClockwiseRadialProgressBar = function(v9) --[[ Line: 31 ]] --[[ Name: ConterClockwiseRadialProgressBar ]]
            -- upvalues: l_createElement_0 (copy), v5 (copy)
            v9.controls.Clockwise = false;
            return l_createElement_0(v5, v9.controls);
        end
    }
};