local v0 = require(script.Parent.copy);
return function(v1, v2) --[[ Line: 22 ]] --[[ Name: sort ]]
    -- upvalues: v0 (copy)
    local v3 = v0(v1);
    table.sort(v3, v2);
    return v3;
end;