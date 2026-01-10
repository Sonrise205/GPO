local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util);
local v2 = require(script.Parent.copy);
local function _(v3, v4) --[[ Line: 10 ]] --[[ Name: call ]]
    if type(v3) == "function" then
        return v3(v4);
    else
        return;
    end;
end;
return function(v6, v7, v8, v9) --[[ Line: 44 ]] --[[ Name: update ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v10 = #v6;
    local v11 = v2(v6);
    if v7 < 1 then
        v7 = v7 + v10;
    end;
    if type(v8) ~= "function" then
        v8 = v1.func.returned;
    end;
    if v11[v7] ~= nil then
        v11[v7] = v8(v11[v7], v7);
        return v11;
    else
        local l_v7_0 = v7;
        v11[v7] = if type(v9) == "function" then v9(l_v7_0) else nil;
        return v11;
    end;
end;