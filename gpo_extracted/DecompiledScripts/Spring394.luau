local v0 = {};
v0.__index = v0;
local l_exp_0 = math.exp;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_sqrt_0 = math.sqrt;
v0.new = function(v5, v6, v7) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(type(v5) == "number");
    assert(type(v6) == "number");
    assert(v5 * v6 >= 0, "Spring does not converge");
    return (setmetatable({
        d = v5, 
        f = v6, 
        g = v7, 
        p = v7, 
        v = v7 * 0
    }, v0));
end;
v0.SetGoal = function(v8, v9) --[[ Line: 31 ]] --[[ Name: SetGoal ]]
    v8.g = v9;
end;
v0.GetPosition = function(v10) --[[ Line: 35 ]] --[[ Name: GetPosition ]]
    return v10.p;
end;
v0.GetVelocity = function(v11) --[[ Line: 39 ]] --[[ Name: GetVelocity ]]
    return v11.v;
end;
v0.Update = function(v12, v13) --[[ Line: 43 ]] --[[ Name: Update ]]
    -- upvalues: l_exp_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    local l_d_0 = v12.d;
    local v15 = v12.f * 2 * 3.141592653589793;
    local l_g_0 = v12.g;
    local l_p_0 = v12.p;
    local l_v_0 = v12.v;
    local v19 = l_p_0 - l_g_0;
    local v20 = l_exp_0(-l_d_0 * v15 * v13);
    local v21 = nil;
    local v22 = nil;
    if l_d_0 == 1 then
        v21 = (v19 * (1 + v15 * v13) + l_v_0 * v13) * v20 + l_g_0;
        v22 = (l_v_0 * (1 - v15 * v13) - v19 * (v15 * v15 * v13)) * v20;
    elseif l_d_0 < 1 then
        local v23 = l_sqrt_0(1 - l_d_0 * l_d_0);
        local v24 = l_cos_0(v15 * v23 * v13);
        local v25 = l_sin_0(v15 * v23 * v13);
        local v26 = nil;
        if v23 > 1.0E-4 then
            v26 = v25 / v23;
        else
            local v27 = v13 * v15;
            v26 = v27 + (v27 * v27 * (v23 * v23) * (v23 * v23) / 20 - v23 * v23) * (v27 * v27 * v27) / 6;
        end;
        local v28 = nil;
        if v15 * v23 > 1.0E-4 then
            v28 = v25 / (v15 * v23);
        else
            local v29 = v15 * v23;
            v28 = v13 + (v13 * v13 * (v29 * v29) * (v29 * v29) / 20 - v29 * v29) * (v13 * v13 * v13) / 6;
        end;
        v21 = (v19 * (v24 + l_d_0 * v26) + l_v_0 * v28) * v20 + l_g_0;
        v22 = (l_v_0 * (v24 - v26 * l_d_0) - v19 * (v26 * v15)) * v20;
    else
        local v30 = l_sqrt_0(l_d_0 * l_d_0 - 1);
        local v31 = -v15 * (l_d_0 - v30);
        local v32 = -v15 * (l_d_0 + v30);
        local v33 = (l_v_0 - v19 * v31) / (2 * v15 * v30);
        local v34 = (v19 - v33) * l_exp_0(v31 * v13);
        local v35 = v33 * l_exp_0(v32 * v13);
        v21 = v34 + v35 + l_g_0;
        v22 = v34 * v31 + v35 * v32;
    end;
    v12.p = v21;
    v12.v = v22;
    return v21;
end;
return v0;