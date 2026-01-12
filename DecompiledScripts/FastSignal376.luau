local v0 = {};
v0.__index = v0;
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        _handler = v3, 
        _signal = v2
    }, v1));
end;
v1.Disconnect = function(v4) --[[ Line: 23 ]] --[[ Name: Disconnect ]]
    v4._signal[v4] = nil;
end;
v0.new = function() --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.Connect = function(v5, v6) --[[ Line: 31 ]] --[[ Name: Connect ]]
    -- upvalues: v1 (copy)
    local v7 = v1.new(v5, v6);
    v5[v7] = true;
    return v7;
end;
v0.DisconnectAll = function(v8) --[[ Line: 37 ]] --[[ Name: DisconnectAll ]]
    table.clear(v8);
end;
v0.Fire = function(v9, ...) --[[ Line: 41 ]] --[[ Name: Fire ]]
    if next(v9) then
        for v10, _ in pairs(v9) do
            v10._handler(...);
        end;
    end;
end;
v0.Wait = function(v12) --[[ Line: 49 ]] --[[ Name: Wait ]]
    local v13 = coroutine.running();
    local v14 = nil;
    v14 = v12:Connect(function(...) --[[ Line: 52 ]]
        -- upvalues: v14 (ref), v13 (copy)
        v14:Disconnect();
        task.spawn(v13, ...);
    end);
    return coroutine.yield();
end;
v0.Once = function(v15, v16) --[[ Line: 59 ]] --[[ Name: Once ]]
    local v17 = nil;
    v17 = v15:Connect(function(...) --[[ Line: 61 ]]
        -- upvalues: v17 (ref), v16 (copy)
        v17:Disconnect();
        v16(...);
    end);
    return v17;
end;
return v0;