local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.copyDeep);
local v2 = require(l_Parent_0.None);
return function(...) --[[ Line: 28 ]] --[[ Name: concatDeep ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3 = {};
    for v4 = 1, select("#", ...) do
        local v5 = select(v4, ...);
        if type(v5) == "table" then
            for _, v7 in ipairs(v5) do
                if v7 ~= v2 then
                    if type(v7) == "table" then
                        table.insert(v3, v1(v7));
                    else
                        table.insert(v3, v7);
                    end;
                end;
            end;
        end;
    end;
    return v3;
end;