local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.None);
return function(...) --[[ Line: 26 ]] --[[ Name: concat ]]
    -- upvalues: v1 (copy)
    local v2 = {};
    for v3 = 1, select("#", ...) do
        local v4 = select(v3, ...);
        if type(v4) == "table" then
            for _, v6 in ipairs(v4) do
                if v6 ~= v1 then
                    table.insert(v2, v6);
                end;
            end;
        end;
    end;
    return v2;
end;