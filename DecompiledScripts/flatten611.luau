local _ = require(script.Parent.Parent.Types);
local function v1(v2, v3) --[[ Line: 30 ]] --[[ Name: flatten ]]
    -- upvalues: v1 (copy)
    if type(v3) ~= "number" then
        v3 = 1e999;
    end;
    local v4 = {};
    for v5, v6 in pairs(v2) do
        if type(v6) == "table" and v3 > 0 then
            local v7 = v1(v6, v3 - 1);
            for v8, v9 in pairs(v4) do
                v7[v8] = v9;
            end;
            v4 = v7;
        else
            v4[v5] = v6;
        end;
    end;
    return v4;
end;
return v1;