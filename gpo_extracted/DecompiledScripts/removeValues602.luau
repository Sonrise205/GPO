local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Array.toSet);
return function(v2, ...) --[[ Line: 23 ]] --[[ Name: removeValues ]]
    -- upvalues: v1 (copy)
    local v3 = v1({
        ...
    });
    local v4 = {};
    for v5, v6 in pairs(v2) do
        if not v3[v6] then
            v4[v5] = v6;
        end;
    end;
    return v4;
end;