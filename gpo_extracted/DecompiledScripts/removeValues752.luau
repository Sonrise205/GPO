local v0 = require(script.Parent.toSet);
return function(v1, ...) --[[ Line: 20 ]] --[[ Name: removeValues ]]
    -- upvalues: v0 (copy)
    local v2 = v0({
        ...
    });
    local v3 = {};
    for _, v5 in ipairs(v1) do
        if not v2[v5] then
            table.insert(v3, v5);
        end;
    end;
    return v3;
end;