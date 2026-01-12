local _ = require(script.Parent.Parent.Types);
local function v1(v2) --[[ Line: 22 ]] --[[ Name: freezeDeep ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    for v4, v5 in pairs(v2) do
        if type(v5) == "table" then
            v3[v4] = v1(v5);
        else
            v3[v4] = v5;
        end;
    end;
    table.freeze(v3);
    return v3;
end;
return v1;