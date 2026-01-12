local _ = require(script.Parent.Parent.Types);
local v1 = require(script.Parent.copy);
return function(v2) --[[ Line: 23 ]] --[[ Name: freeze ]]
    -- upvalues: v1 (copy)
    local v3 = v1(v2);
    table.freeze(v3);
    return v3;
end;