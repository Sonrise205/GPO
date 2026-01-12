local v0 = require(script.Parent.copy);
local function _(v1, v2) --[[ Line: 7 ]] --[[ Name: call ]]
    if type(v1) == "function" then
        return v1(v2);
    else
        return;
    end;
end;
return function(v4, v5, v6, v7) --[[ Line: 39 ]] --[[ Name: update ]]
    -- upvalues: v0 (copy)
    local v8 = v0(v4);
    if v8[v5] ~= nil then
        if v6 then
            v8[v5] = v6(v8[v5], v5);
            return v8;
        end;
    elseif v7 then
        v8[v5] = if type(v7) == "function" then v7(v5) else nil;
    end;
    return v8;
end;