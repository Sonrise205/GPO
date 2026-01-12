local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util);
local _ = require(l_Parent_0.Types);
local function v3(v4, v5) --[[ Line: 7 ]] --[[ Name: compareDeep ]]
    -- upvalues: v3 (copy)
    if type(v4) ~= "table" or type(v5) ~= "table" then
        return v4 == v5;
    else
        for v6, v7 in pairs(v4) do
            if not v3(v7, v5[v6]) then
                return false;
            end;
        end;
        for v8, v9 in pairs(v5) do
            if not v3(v9, v4[v8]) then
                return false;
            end;
        end;
        return true;
    end;
end;
return function(...) --[[ Line: 45 ]] --[[ Name: equalsDeep ]]
    -- upvalues: v1 (copy), v3 (copy)
    if v1.equalObjects(...) then
        return true;
    else
        local v10 = select("#", ...);
        local v11 = select(1, ...);
        for v12 = 2, v10 do
            local v13 = select(v12, ...);
            if not v3(v11, v13) then
                return false;
            end;
        end;
        return true;
    end;
end;