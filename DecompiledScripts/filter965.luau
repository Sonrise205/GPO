local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util);
return function(v2, v3) --[[ Line: 26 ]] --[[ Name: filter ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    if type(v3) ~= "function" then
        v3 = v1.func.truthy;
    end;
    for v5, v6 in ipairs(v2) do
        if v3(v6, v5, v2) then
            table.insert(v4, v6);
        end;
    end;
    return v4;
end;