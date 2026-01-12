local v0 = require(script.Parent.BaseMotor);
local v1 = setmetatable({}, v0);
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy)
    assert(v2, "Missing argument #1: initialValue");
    assert(typeof(v2) == "number", "initialValue must be a number!");
    local v4 = setmetatable(v0.new(), v1);
    if v3 ~= nil then
        v4._useImplicitConnections = v3;
    else
        v4._useImplicitConnections = true;
    end;
    v4._goal = nil;
    v4._state = {
        complete = true, 
        value = v2
    };
    return v4;
end;
v1.step = function(v5, v6) --[[ Line: 27 ]] --[[ Name: step ]]
    if v5._state.complete then
        return true;
    else
        local v7 = v5._goal:step(v5._state, v6);
        v5._state = v7;
        v5._onStep:fire(v7.value);
        if v7.complete then
            if v5._useImplicitConnections then
                v5:stop();
            end;
            v5._onComplete:fire();
        end;
        return v7.complete;
    end;
end;
v1.getValue = function(v8) --[[ Line: 48 ]] --[[ Name: getValue ]]
    return v8._state.value;
end;
v1.setGoal = function(v9, v10) --[[ Line: 52 ]] --[[ Name: setGoal ]]
    v9._state.complete = false;
    v9._goal = v10;
    v9._onStart:fire();
    if v9._useImplicitConnections then
        v9:start();
    end;
end;
v1.__tostring = function(_) --[[ Line: 63 ]] --[[ Name: __tostring ]]
    return "Motor(Single)";
end;
return v1;