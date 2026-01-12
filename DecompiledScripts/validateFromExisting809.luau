local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
local function v5(v2, v3) --[[ Line: 10 ]] --[[ Name: GetValidator ]]
    -- upvalues: v1 (copy)
    local v4 = typeof(v2);
    if v4 == "table" and not v3 then
        return FromTable(v2, true);
    else
        return v1[v4];
    end;
end;
FromTable = function(v6, v7) --[[ Line: 23 ]] --[[ Name: FromTable ]]
    -- upvalues: v1 (copy)
    local v8 = {};
    for v9, v10 in pairs(v6) do
        local v11 = typeof(v10);
        v8[v9] = if not (v11 == "table") or v7 then v1[v11] else FromTable(v10, true);
    end;
    return v8;
end;
return v5;