local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util);
local function v2(v3, v4) --[[ Line: 6 ]] --[[ Name: compareDeep ]]
    -- upvalues: v2 (copy)
    if type(v3) ~= "table" or type(v4) ~= "table" then
        return v3 == v4;
    else
        local v5 = #v3;
        if #v4 ~= v5 then
            return false;
        else
            for v6 = 1, v5 do
                if not v2(v3[v6], v4[v6]) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
return function(...) --[[ Line: 44 ]] --[[ Name: equalsDeep ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1.equalObjects(...) then
        return true;
    else
        local v7 = select("#", ...);
        local v8 = select(1, ...);
        for v9 = 2, v7 do
            local v10 = select(v9, ...);
            if not v2(v8, v10) then
                return false;
            end;
        end;
        return true;
    end;
end;