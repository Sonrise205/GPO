local v0 = {};
v0.__index = v0;
local l_InstanceCache_0 = require(script:WaitForChild("InstanceCache"));
local function _(v2, v3) --[[ Line: 9 ]]
    local v4 = Instance.new(v2);
    for v5, v6 in next, v3 do
        if v5 ~= "Parent" and v4[v5] ~= nil then
            v4[v5] = v6;
        end;
    end;
    v4.Parent = v3.Parent or nil;
    return v4;
end;
v0.new = function(v8, ...) --[[ Line: 21 ]]
    -- upvalues: l_InstanceCache_0 (copy), v0 (copy)
    local v9 = l_InstanceCache_0.new(v8, ...);
    v0[v8.Name] = v9;
end;
v0.getInstance = function(v10) --[[ Line: 26 ]]
    -- upvalues: v0 (copy)
    return v0[v10] and v0[v10]:GetObject();
end;
v0.returnInstance = function(v11, v12) --[[ Line: 29 ]]
    -- upvalues: v0 (copy)
    return v0[v11] and v0[v11]:ReturnObject(v12);
end;
return v0;