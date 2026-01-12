local v0 = {};
v0.__index = v0;
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        _handler = v3, 
        _signal = v2
    }, v1));
end;
v1.Disconnect = function(v4) --[[ Line: 20 ]] --[[ Name: Disconnect ]]
    local l__signal_0 = v4._signal;
    local v6 = table.find(l__signal_0, v4);
    if v6 then
        table.remove(l__signal_0, v6);
    end;
end;
v0.new = function() --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.Connect = function(v7, v8) --[[ Line: 32 ]] --[[ Name: Connect ]]
    -- upvalues: v1 (copy)
    local v9 = v1.new(v7, v8);
    table.insert(v7, v9);
    return v9;
end;
v0.DisconnectAll = function(v10) --[[ Line: 38 ]] --[[ Name: DisconnectAll ]]
    table.clear(v10);
end;
v0.Fire = function(v11, ...) --[[ Line: 42 ]] --[[ Name: Fire ]]
    local v12 = #v11;
    local v13 = nil;
    if v12 > 0 then
        v13 = table.create(v12);
        table.move(v11, 1, v12, 1, v13);
        for v14 = v12, 1, -1 do
            task.spawn(v13[v14]._handler, ...);
        end;
    end;
end;
v0.Wait = function(v15) --[[ Line: 54 ]] --[[ Name: Wait ]]
    local v16 = coroutine.running();
    local v17 = nil;
    v17 = v15:Connect(function(...) --[[ Line: 57 ]]
        -- upvalues: v17 (ref), v16 (copy)
        v17:Disconnect();
        task.spawn(v16, ...);
    end);
    return coroutine.yield();
end;
v0.Once = function(v18, v19) --[[ Line: 64 ]] --[[ Name: Once ]]
    local v20 = nil;
    v20 = v18:Connect(function(...) --[[ Line: 66 ]]
        -- upvalues: v20 (ref), v19 (copy)
        v20:Disconnect();
        v19(...);
    end);
    return v20;
end;
return v0;