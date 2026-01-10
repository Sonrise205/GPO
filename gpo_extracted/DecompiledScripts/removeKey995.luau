local v0 = require(script.Parent.copy);
return function(v1, v2) --[[ Line: 21 ]] --[[ Name: removeKey ]]
    -- upvalues: v0 (copy)
    local v3 = v0(v1);
    v3[v2] = nil;
    return v3;
end;