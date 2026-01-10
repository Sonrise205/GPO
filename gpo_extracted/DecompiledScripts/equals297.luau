local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util);
local function v6(v2, v3) --[[ Line: 6 ]] --[[ Name: compare ]]
    if type(v2) ~= "table" or type(v3) ~= "table" then
        return v2 == v3;
    else
        local v4 = #v2;
        if #v3 ~= v4 then
            return false;
        else
            for v5 = 1, v4 do
                if v2[v5] ~= v3[v5] then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
return function(...) --[[ Line: 44 ]] --[[ Name: equals ]]
    -- upvalues: v1 (copy), v6 (copy)
    if v1.equalObjects(...) then
        return true;
    else
        local v7 = select("#", ...);
        local v8 = select(1, ...);
        for v9 = 2, v7 do
            local v10 = select(v9, ...);
            if not v6(v8, v10) then
                return false;
            end;
        end;
        return true;
    end;
end;