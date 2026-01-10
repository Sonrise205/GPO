local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(v1, "Missing argument #1: targetValue");
    v2 = v2 or {};
    return (setmetatable({
        _targetValue = v1, 
        _frequency = v2.frequency or 4, 
        _dampingRatio = v2.dampingRatio or 1
    }, v0));
end;
v0.step = function(v3, v4, v5) --[[ Line: 20 ]] --[[ Name: step ]]
    local l__dampingRatio_0 = v3._dampingRatio;
    local v7 = v3._frequency * 2 * 3.141592653589793;
    local l__targetValue_0 = v3._targetValue;
    local l_value_0 = v4.value;
    local v10 = v4.velocity or 0;
    local v11 = l_value_0 - l__targetValue_0;
    local v12 = math.exp(-l__dampingRatio_0 * v7 * v5);
    local v13 = nil;
    local v14 = nil;
    if l__dampingRatio_0 == 1 then
        v13 = (v11 * (1 + v7 * v5) + v10 * v5) * v12 + l__targetValue_0;
        v14 = (v10 * (1 - v7 * v5) - v11 * (v7 * v7 * v5)) * v12;
    elseif l__dampingRatio_0 < 1 then
        local v15 = math.sqrt(1 - l__dampingRatio_0 * l__dampingRatio_0);
        local v16 = math.cos(v7 * v15 * v5);
        local v17 = math.sin(v7 * v15 * v5);
        local v18 = nil;
        if v15 > 1.0E-4 then
            v18 = v17 / v15;
        else
            local v19 = v5 * v7;
            v18 = v19 + (v19 * v19 * (v15 * v15) * (v15 * v15) / 20 - v15 * v15) * (v19 * v19 * v19) / 6;
        end;
        local v20 = nil;
        if v7 * v15 > 1.0E-4 then
            v20 = v17 / (v7 * v15);
        else
            local v21 = v7 * v15;
            v20 = v5 + (v5 * v5 * (v21 * v21) * (v21 * v21) / 20 - v21 * v21) * (v5 * v5 * v5) / 6;
        end;
        v13 = (v11 * (v16 + l__dampingRatio_0 * v18) + v10 * v20) * v12 + l__targetValue_0;
        v14 = (v10 * (v16 - v18 * l__dampingRatio_0) - v11 * (v18 * v7)) * v12;
    else
        local v22 = math.sqrt(l__dampingRatio_0 * l__dampingRatio_0 - 1);
        local v23 = -v7 * (l__dampingRatio_0 - v22);
        local v24 = -v7 * (l__dampingRatio_0 + v22);
        local v25 = (v10 - v11 * v23) / (2 * v7 * v22);
        local v26 = (v11 - v25) * math.exp(v23 * v5);
        local v27 = v25 * math.exp(v24 * v5);
        v13 = v26 + v27 + l__targetValue_0;
        v14 = v26 * v23 + v27 * v24;
    end;
    local v28 = false;
    if math.abs(v14) < 0.001 then
        v28 = math.abs(v13 - l__targetValue_0) < 0.001;
    end;
    return {
        complete = v28, 
        value = v28 and l__targetValue_0 or v13, 
        velocity = v14
    };
end;
return v0;