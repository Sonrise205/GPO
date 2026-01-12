local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util);
local _ = require(l_Parent_0.Types);
local function v9(v3, v4) --[[ Line: 7 ]] --[[ Name: compare ]]
    if type(v3) ~= "table" or type(v4) ~= "table" then
        return v3 == v4;
    else
        for v5, v6 in pairs(v3) do
            if v4[v5] ~= v6 then
                return false;
            end;
        end;
        for v7, v8 in pairs(v4) do
            if v3[v7] ~= v8 then
                return false;
            end;
        end;
        return true;
    end;
end;
return function(...) --[[ Line: 45 ]] --[[ Name: equals ]]
    -- upvalues: v1 (copy), v9 (copy)
    if v1.equalObjects(...) then
        return true;
    else
        local v10 = select("#", ...);
        local v11 = select(1, ...);
        for v12 = 2, v10 do
            local v13 = select(v12, ...);
            if not v9(v11, v13) then
                return false;
            end;
        end;
        return true;
    end;
end;