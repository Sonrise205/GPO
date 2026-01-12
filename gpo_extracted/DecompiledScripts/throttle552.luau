local v0 = require(script.Parent.loader).load(script)("ThrottledFunction");
return function(v1, v2, v3) --[[ Line: 21 ]] --[[ Name: throttle ]]
    -- upvalues: v0 (copy)
    assert(type(v1) == "number", "timeoutInSeconds is not a number");
    assert(type(v2) == "function", "func is not a function");
    local v4 = v0.new(v1, v2, v3);
    return function(...) --[[ Line: 27 ]]
        -- upvalues: v4 (copy)
        v4:Call(...);
    end;
end;