local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.reduce);
local v2 = require(l_Parent_0.None);
return function(...) --[[ Line: 24 ]] --[[ Name: zipAll ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = select("#", ...);
    local v4 = {
        ...
    };
    local v5 = {};
    if v3 == 0 then
        return v5;
    else
        for v8 = 1, v1(v4, function(v6, v7) --[[ Line: 33 ]]
            return (math.max(v6, #v7));
        end, #v4[1]) do
            local v9 = {};
            for _, v11 in ipairs(v4) do
                local v12 = v11[v8];
                table.insert(v9, if v12 == nil then v2 else v12);
            end;
            table.insert(v5, v9);
        end;
        return v5;
    end;
end;