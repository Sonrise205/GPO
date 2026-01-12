local v0 = require(script.Parent.reduce);
return function(...) --[[ Line: 20 ]] --[[ Name: zip ]]
    -- upvalues: v0 (copy)
    local v1 = select("#", ...);
    local v2 = {
        ...
    };
    local v3 = {};
    if v1 == 0 then
        return v3;
    else
        for v6 = 1, v0(v2, function(v4, v5) --[[ Line: 30 ]]
            return (math.min(v4, #v5));
        end, #v2[1]) do
            local v7 = {};
            for _, v9 in ipairs(v2) do
                table.insert(v7, v9[v6]);
            end;
            table.insert(v3, v7);
        end;
        return v3;
    end;
end;