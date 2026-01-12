local v0 = require(script.Parent);
local v1 = {};
local v2 = nil;
v1.GetAllFishes = function() --[[ Line: 7 ]] --[[ Name: GetAllFishes ]]
    -- upvalues: v2 (ref), v0 (copy)
    if v2 ~= nil then
        return v2;
    else
        v2 = {};
        local v3 = {
            ["Common Fish"] = true, 
            ["Rare Fish"] = true, 
            ["Legendary Fish"] = true
        };
        for v4, v5 in pairs(v0) do
            if v5.BaseItem ~= nil and v3[v5.BaseItem] == true then
                v2[v4] = v5;
            end;
        end;
        return v2;
    end;
end;
return v1;