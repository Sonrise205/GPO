local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.None);
return function(...) --[[ Line: 27 ]] --[[ Name: merge ]]
    -- upvalues: v1 (copy)
    local v2 = {};
    for v3 = 1, select("#", ...) do
        local v4 = select(v3, ...);
        if type(v4) == "table" then
            for v5, v6 in pairs(v4) do
                v2[v5] = if v6 == v1 then nil else v6;
            end;
        end;
    end;
    return v2;
end;