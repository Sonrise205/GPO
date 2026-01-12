local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(v1, "Missing argument #1: targetValue");
    local v3 = v2 or {};
    return (setmetatable({
        _targetValue = v1, 
        _velocity = v3.velocity or 1
    }, v0));
end;
v0.step = function(v4, v5, v6) --[[ Line: 15 ]] --[[ Name: step ]]
    local l_value_0 = v5.value;
    local l__velocity_0 = v4._velocity;
    local l__targetValue_0 = v4._targetValue;
    local v10 = v6 * l__velocity_0;
    local v11 = math.abs(l__targetValue_0 - l_value_0) <= v10;
    l_value_0 = l_value_0 + v10 * (l_value_0 < l__targetValue_0 and 1 or -1);
    if v11 then
        l_value_0 = v4._targetValue;
        l__velocity_0 = 0;
    end;
    return {
        complete = v11, 
        value = l_value_0, 
        velocity = l__velocity_0
    };
end;
return v0;