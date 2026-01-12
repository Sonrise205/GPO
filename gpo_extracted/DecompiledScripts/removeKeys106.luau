local v0 = require(script.Parent.copy);
return function(v1, ...) --[[ Line: 20 ]] --[[ Name: removeKeys ]]
    -- upvalues: v0 (copy)
    local v2 = v0(v1);
    for _, v4 in ipairs({
        ...
    }) do
        v2[v4] = nil;
    end;
    return v2;
end;