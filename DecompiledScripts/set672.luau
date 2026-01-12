local v0 = require(script.Parent.copy);
return function(v1, v2, v3) --[[ Line: 21 ]] --[[ Name: set ]]
    -- upvalues: v0 (copy)
    local v4 = v0(v1);
    v4[v2] = v3;
    return v4;
end;