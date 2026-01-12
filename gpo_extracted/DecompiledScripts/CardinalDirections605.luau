local l_Objects_0 = script.Parent.Objects;
local v1 = require(l_Objects_0.Default);
local v2 = {};
v2.__index = v2;
v2.SetUp = function(v3, v4) --[[ Line: 6 ]] --[[ Name: SetUp ]]
    -- upvalues: v1 (copy)
    v3.Cardinals = {
        N = -3.141592653589793, 
        NE = -2.356194490192345, 
        E = -1.5707963267948966, 
        SE = -0.7853981633974483, 
        S = 0, 
        SW = 0.7853981633974483, 
        W = 1.5707963267948966, 
        NW = 2.356194490192345
    };
    for v5, v6 in pairs(v3.Cardinals) do
        local v7 = script.Marker:Clone();
        v7.Name = "Cardinal Direction " .. v5;
        v7.Text = v5;
        v7.Parent = v4.CompassUI;
        v4.Cardinals[v7.Name] = v1.new({
            Icon = v7, 
            Handler = v4, 
            Guider = v6, 
            DefaultTransparency = 0
        });
    end;
end;
return v2;