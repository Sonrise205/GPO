--!native
local v0 = {};
v0.__index = v0;
local l_Players_0 = game:GetService("Players");
local l_Util_0 = script.Parent.Parent.Util;
local _ = require(script.Parent.Parent.Type);
local v4 = require(script.Parent.ServerProcess);
local v5 = require(l_Util_0.Assert);
local v6 = require(l_Util_0.Key);
local v7 = require(l_Util_0.Serdes);
local v8 = require(l_Util_0.Buffer);
v0.new = function(v9, v10) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v8 (copy), v7 (copy), v4 (copy)
    local v11 = setmetatable({}, v0);
    v11._buffer = v8.new();
    v11._buffer:wu8(v7.increment(v9));
    v11.id = v8.convert(v11._buffer:build());
    v11.fn = {};
    v11._conf = table.freeze(v10 or {});
    v11.IsConnected = false;
    v4.add(v11.id, v9, v10 or {
        rateLimit = {
            maxEntrance = 200, 
            interval = 2
        }
    });
    v11._buffer:remove();
    return v11;
end;
v0.Fire = function(v12, v13, v14, ...) --[[ Line: 33 ]] --[[ Name: Fire ]]
    -- upvalues: v4 (copy)
    v4.insertQueue(v12.id, v13, v14, ...);
end;
v0.Fires = function(v15, v16, ...) --[[ Line: 37 ]] --[[ Name: Fires ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    for _, v18 in ipairs(l_Players_0:GetPlayers()) do
        v4.insertQueue(v15.id, v16, v18, ...);
    end;
end;
v0.FireExcept = function(v19, v20, v21, ...) --[[ Line: 43 ]] --[[ Name: FireExcept ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    for _, v23 in ipairs(l_Players_0:GetPlayers()) do
        if not table.find(v21, v23) then
            v4.insertQueue(v19.id, v20, v23, ...);
        end;
    end;
end;
v0.FireIn = function(v24, v25, v26, v27, v28, v29) --[[ Line: 50 ]] --[[ Name: FireIn ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    for _, v31 in ipairs(l_Players_0:GetPlayers()) do
        if (not v29 or not table.find(v29, v31)) and v31.Character and v31.Character.PrimaryPart and (v31.Character.PrimaryPart.Position - v27).Magnitude >= v26 then
            v4.insertQueue(v24.id, v25, v31, table.unpack(v28));
        end;
    end;
end;
v0.Invoke = function(v32, v33, v34, ...) --[[ Line: 57 ]] --[[ Name: Invoke ]]
    -- upvalues: v4 (copy)
    return v4.insertRequest(v32.id, v33, v34, ...);
end;
v0.Connect = function(v35, v36) --[[ Line: 61 ]] --[[ Name: Connect ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v37 = tostring(v6());
    table.insert(v35.fn, v37);
    v4.addCallback(v35.id, v37, v36);
    v35.IsConnected = #v35.fn > 0;
    return v37;
end;
v0.Once = function(v38, v39) --[[ Line: 69 ]] --[[ Name: Once ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v40 = tostring(v6());
    table.insert(v38.fn, v40);
    v38.IsConnected = #v38.fn > 0;
    v4.addCallback(v38.id, v40, function(v41, ...) --[[ Line: 73 ]]
        -- upvalues: v38 (copy), v40 (copy), v39 (copy)
        v38:Disconnect(v40);
        task.spawn(v39, v41, ...);
    end);
    return v40;
end;
v0.Wait = function(v42) --[[ Line: 80 ]] --[[ Name: Wait ]]
    local v43 = coroutine.running();
    local v44 = os.clock();
    v42:Once(function() --[[ Line: 82 ]]
        -- upvalues: v43 (copy), v44 (copy)
        task.spawn(v43, os.clock() - v44);
    end);
    return coroutine.yield();
end;
v0.DisconnectAll = function(v45) --[[ Line: 88 ]] --[[ Name: DisconnectAll ]]
    for _, v47 in v45.fn do
        v45:Disconnect(v47);
    end;
end;
v0.Disconnect = function(v48, v49) --[[ Line: 94 ]] --[[ Name: Disconnect ]]
    -- upvalues: v5 (copy), v4 (copy)
    v5(typeof(v49) == "string", "Key must be a string type.");
    v4.removeCallback(v48.id, v49);
    table.remove(v48.fn, table.find(v48.fn, v49));
    v48.IsConnected = #v48.fn > 0;
    return table.find(v48.fn, v49) == nil;
end;
v0.Destroy = function(v50) --[[ Line: 102 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy), v7 (copy)
    v50:DisconnectAll();
    v50._buffer:remove();
    v4.remove(v50.id);
    v7.decrement();
    table.clear(v50);
    setmetatable(v50, nil);
end;
return v0.new;