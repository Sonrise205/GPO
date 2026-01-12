local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        signal = v1, 
        connected = true, 
        _handler = v2
    }, v0));
end;
v0.disconnect = function(v3) --[[ Line: 12 ]] --[[ Name: disconnect ]]
    if v3.connected then
        v3.connected = false;
        for v4, v5 in pairs(v3.signal._connections) do
            if v5 == v3 then
                table.remove(v3.signal._connections, v4);
                return;
            end;
        end;
    end;
end;
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        _connections = {}, 
        _threads = {}
    }, v6));
end;
v6.fire = function(v7, ...) --[[ Line: 35 ]] --[[ Name: fire ]]
    for _, v9 in pairs(v7._connections) do
        v9._handler(...);
    end;
    for _, v11 in pairs(v7._threads) do
        coroutine.resume(v11, ...);
    end;
    v7._threads = {};
end;
v6.connect = function(v12, v13) --[[ Line: 47 ]] --[[ Name: connect ]]
    -- upvalues: v0 (copy)
    local v14 = v0.new(v12, v13);
    table.insert(v12._connections, v14);
    return v14;
end;
v6.wait = function(v15) --[[ Line: 53 ]] --[[ Name: wait ]]
    table.insert(v15._threads, coroutine.running());
    return coroutine.yield();
end;
return v6;