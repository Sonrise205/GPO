local v0 = require(script.Parent.copy);
return function(v1) --[[ Line: 22 ]] --[[ Name: freeze ]]
    -- upvalues: v0 (copy)
    local v2 = v0(v1);
    table.freeze(v2);
    return v2;
end;