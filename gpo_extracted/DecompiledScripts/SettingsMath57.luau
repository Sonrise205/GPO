local function _(v0, v1) --[[ Line: 1 ]] --[[ Name: Clamp ]]
    return function(v2) --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        return (math.clamp(v2, v0, v1));
    end;
end;
local function v5(v4) --[[ Line: 7 ]] --[[ Name: Floor ]]
    return (math.floor(v4));
end;
local function _(v6) --[[ Line: 11 ]] --[[ Name: Offset ]]
    return function(v7) --[[ Line: 12 ]]
        -- upvalues: v6 (copy)
        return v7 + v6;
    end;
end;
local v9 = {};
local v10 = 0;
local v11 = 1;
local l_v10_0 = v10 --[[ copy: 5 -> 7 ]];
local l_v11_0 = v11 --[[ copy: 6 -> 8 ]];
v9.Damping = function(v14) --[[ Line: 2 ]]
    -- upvalues: l_v10_0 (copy), l_v11_0 (copy)
    return (math.clamp(v14, l_v10_0, l_v11_0));
end;
v9.AnchorDepth = v5;
v10 = 0;
v11 = 1;
local l_v10_1 = v10 --[[ copy: 5 -> 9 ]];
local l_v11_1 = v11 --[[ copy: 6 -> 10 ]];
v9.Stiffness = function(v17) --[[ Line: 2 ]]
    -- upvalues: l_v10_1 (copy), l_v11_1 (copy)
    return (math.clamp(v17, l_v10_1, l_v11_1));
end;
v10 = 0;
v11 = 1;
local l_v10_2 = v10 --[[ copy: 5 -> 11 ]];
local l_v11_2 = v11 --[[ copy: 6 -> 12 ]];
v9.Inertia = function(v20) --[[ Line: 2 ]]
    -- upvalues: l_v10_2 (copy), l_v11_2 (copy)
    return (math.clamp(v20, l_v10_2, l_v11_2));
end;
v10 = 0;
v11 = 1;
local l_v10_3 = v10 --[[ copy: 5 -> 13 ]];
local l_v11_3 = v11 --[[ copy: 6 -> 14 ]];
v9.Elasticity = function(v23) --[[ Line: 2 ]]
    -- upvalues: l_v10_3 (copy), l_v11_3 (copy)
    return (math.clamp(v23, l_v10_3, l_v11_3));
end;
v10 = 0;
v11 = 1;
local l_v10_4 = v10 --[[ copy: 5 -> 15 ]];
local l_v11_4 = v11 --[[ copy: 6 -> 16 ]];
v9.BlendWeight = function(v26) --[[ Line: 2 ]]
    -- upvalues: l_v10_4 (copy), l_v11_4 (copy)
    return (math.clamp(v26, l_v10_4, l_v11_4));
end;
v10 = 0;
v11 = 165;
local l_v10_5 = v10 --[[ copy: 5 -> 17 ]];
local l_v11_5 = v11 --[[ copy: 6 -> 18 ]];
v9.UpdateRate = function(v29) --[[ Line: 2 ]]
    -- upvalues: l_v10_5 (copy), l_v11_5 (copy)
    return (math.clamp(v29, l_v10_5, l_v11_5));
end;
v10 = 0;
v11 = 10;
local l_v10_6 = v10 --[[ copy: 5 -> 19 ]];
v9.WindStrength = function(v31) --[[ Line: 2 ]]
    -- upvalues: l_v10_6 (copy), v11 (copy)
    return (math.clamp(v31, l_v10_6, v11));
end;
v10 = Vector3.new(0, -0.009999999776482582, 0, 0);
v9.Gravity = function(v32) --[[ Line: 12 ]]
    -- upvalues: v10 (copy)
    return v32 + v10;
end;
return v9;