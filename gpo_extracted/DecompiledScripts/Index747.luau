--!native
local v0 = {};
v0.__index = v0;
local _ = game:GetService("Players");
local l_Util_0 = script.Parent.Parent.Util;
local _ = require(script.Parent.Parent.Type);
local v4 = require(script.Parent.ClientProcess);
local v5 = require(l_Util_0.Assert);
local v6 = require(l_Util_0.Key);
local v7 = require(l_Util_0.Serdes);
local v8 = require(l_Util_0.Buffer);
v0.new = function(v9, v10) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v8 (copy), v7 (copy), v4 (copy)
    local v11 = setmetatable({}, v0);
    v11._buffer = v8.new();
    v11._buffer:wu8(v7.increment(v9, v10 and v10.yieldWait));
    v11.id = v8.convert(v11._buffer:build());
    v11.fn = {};
    v11._conf = table.freeze(v10 or {});
    v11.IsConnected = false;
    v4.add(v11.id, v9, v10 or {
        yieldWait = 10
    });
    v11._buffer:remove();
    return v11;
end;
v0.Fire = function(v12, v13, ...) --[[ Line: 33 ]] --[[ Name: Fire ]]
    -- upvalues: v4 (copy)
    v4.insertQueue(v12.id, v13, ...);
end;
v0.Invoke = function(v14, v15, ...) --[[ Line: 37 ]] --[[ Name: Invoke ]]
    -- upvalues: v4 (copy)
    return v4.insertRequest(v14.id, v15, ...);
end;
v0.Connect = function(v16, v17) --[[ Line: 41 ]] --[[ Name: Connect ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v18 = tostring(v6());
    table.insert(v16.fn, v18);
    v16.IsConnected = #v16.fn > 0;
    v4.addCallback(v16.id, v18, v17);
    return v18;
end;
v0.Once = function(v19, v20) --[[ Line: 49 ]] --[[ Name: Once ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v21 = tostring(v6());
    table.insert(v19.fn, v21);
    v19.IsConnected = #v19.fn > 0;
    v4.addCallback(v19.id, v21, function(...) --[[ Line: 53 ]]
        -- upvalues: v19 (copy), v21 (copy), v20 (copy)
        v19:Disconnect(v21);
        task.spawn(v20, ...);
    end);
    return v21;
end;
v0.Wait = function(v22) --[[ Line: 60 ]] --[[ Name: Wait ]]
    local v23 = coroutine.running();
    local v24 = os.clock();
    v22:Once(function() --[[ Line: 62 ]]
        -- upvalues: v23 (copy), v24 (copy)
        task.spawn(v23, os.clock() - v24);
    end);
    return coroutine.yield();
end;
v0.DisconnectAll = function(v25) --[[ Line: 68 ]] --[[ Name: DisconnectAll ]]
    for _, v27 in v25.fn do
        v25:Disconnect(v27);
    end;
end;
v0.Disconnect = function(v28, v29) --[[ Line: 74 ]] --[[ Name: Disconnect ]]
    -- upvalues: v5 (copy), v4 (copy)
    v5(typeof(v29) == "string", "Key must be a string type.");
    v4.removeCallback(v28.id, v29);
    table.remove(v28.fn, table.find(v28.fn, v29));
    v28.IsConnected = #v28.fn > 0;
end;
v0.Destroy = function(v30) --[[ Line: 81 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy), v7 (copy)
    v30:DisconnectAll();
    v30._buffer:remove();
    v4.remove(v30.id);
    v7.decrement();
    table.clear(v30);
    setmetatable(v30, nil);
end;
return v0.new;