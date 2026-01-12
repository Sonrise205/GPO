local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 20 ]] --[[ Name: toSet ]]
    local v3 = {};
    for _, v5 in ipairs(v2) do
        v3[v5] = true;
    end;
    return v3;
end;