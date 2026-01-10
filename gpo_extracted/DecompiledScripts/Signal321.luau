--!native
local v0 = {};
v0.__index = v0;
local v1 = require(script.Dedicated);
local l_Util_0 = script.Parent.Util;
local v3 = require(l_Util_0.Key);
local v4 = require(l_Util_0.Assert);
local v5 = {};
v0.new = function(v6) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v5 (copy), v0 (copy)
    v4(typeof(v6) == "string", (("[Signal]: Identifier must be a string type, got %*"):format((typeof(v6)))));
    if not v5[v6] then
        local v7 = setmetatable({}, v0);
        v5[v6] = v7;
        return v7;
    else
        return v5[v6];
    end;
end;
v0.Connect = function(v8, v9, v10) --[[ Line: 25 ]] --[[ Name: Connect ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v11 = v10 or tostring(v3());
    v8[v11] = v1(v8, v9);
    return v11;
end;
v0.Once = function(v12, v13) --[[ Line: 31 ]] --[[ Name: Once ]]
    local v14 = nil;
    v14 = v12:Connect(function(...) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v14 (ref), v13 (copy)
        v12:Disconnect(v14);
        task.spawn(v13, ...);
    end);
    return v14;
end;
v0.Disconnect = function(v15, v16) --[[ Line: 40 ]] --[[ Name: Disconnect ]]
    if not v15[v16] then
        return;
    else
        v15[v16]:Disconnect();
        v15[v16] = nil;
        return;
    end;
end;
v0.DisconnectAll = function(v17) --[[ Line: 46 ]] --[[ Name: DisconnectAll ]]
    table.clear(v17);
end;
v0.Wait = function(v18) --[[ Line: 50 ]] --[[ Name: Wait ]]
    local v19 = os.clock();
    local v20 = coroutine.running();
    v18:Once(function() --[[ Line: 52 ]]
        -- upvalues: v20 (copy), v19 (copy)
        task.spawn(v20, os.clock() - v19);
    end);
    return coroutine.yield();
end;
v0.DeferFire = function(v21, ...) --[[ Line: 58 ]] --[[ Name: DeferFire ]]
    for _, v23 in v21 do
        task.defer(v23.fn, ...);
    end;
end;
v0.Fire = function(v24, ...) --[[ Line: 64 ]] --[[ Name: Fire ]]
    for _, v26 in v24 do
        task.spawn(v26.fn, ...);
    end;
end;
v0.FireTo = function(_, v28, ...) --[[ Line: 70 ]] --[[ Name: FireTo ]]
    -- upvalues: v5 (copy), v0 (copy)
    local v29 = v5[v28];
    if not v29 then
        return;
    else
        v0.Fire(v29, ...);
        return;
    end;
end;
v0.Invoke = function(v30, v31, ...) --[[ Line: 76 ]] --[[ Name: Invoke ]]
    local v32 = v30[v31];
    if not v32 then
        return;
    else
        return v32.fn(...);
    end;
end;
v0.InvokeTo = function(_, v34, v35, ...) --[[ Line: 82 ]] --[[ Name: InvokeTo ]]
    -- upvalues: v5 (copy), v0 (copy)
    if not v5[v34] then
        return;
    else
        return v0.Invoke(v5[v34], v35, ...);
    end;
end;
v0.Destroy = function(v36) --[[ Line: 87 ]] --[[ Name: Destroy ]]
    v36:DisconnectAll();
    setmetatable(v36, nil);
end;
return v0.new;