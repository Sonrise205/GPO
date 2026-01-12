local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _targetValue = v1
    }, v0));
end;
v0.step = function(v2) --[[ Line: 10 ]] --[[ Name: step ]]
    return {
        complete = true, 
        value = v2._targetValue
    };
end;
return v0;