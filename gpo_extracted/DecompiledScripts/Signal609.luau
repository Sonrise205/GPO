local v0 = nil;
local function v3(v1, ...) --[[ Line: 34 ]] --[[ Name: acquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 45 ]] --[[ Name: runEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        _connected = true, 
        _signal = v6, 
        _fn = v7, 
        _next = false
    }, v5));
end;
v5.Disconnect = function(v8) --[[ Line: 65 ]] --[[ Name: Disconnect ]]
    assert(v8._connected, "Can't disconnect a connection twice.", 2);
    v8._connected = false;
    local l__signal_0 = v8._signal;
    if l__signal_0._handlerListHead == v8 then
        l__signal_0._handlerListHead = v8._next;
    else
        local l__handlerListHead_0 = l__signal_0._handlerListHead;
        while l__handlerListHead_0 and l__handlerListHead_0._next ~= v8 do
            l__handlerListHead_0 = l__handlerListHead_0._next;
        end;
        if l__handlerListHead_0 then
            l__handlerListHead_0._next = v8._next;
        end;
    end;
    if l__signal_0.connectionsChanged then
        l__signal_0.totalConnections = l__signal_0.totalConnections - 1;
        l__signal_0.connectionsChanged:Fire(-1);
    end;
end;
setmetatable(v5, {
    __index = function(_, v12) --[[ Line: 94 ]] --[[ Name: __index ]]
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(v12))), 2);
    end, 
    __newindex = function(_, v14, _) --[[ Line: 97 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(v14))), 2);
    end
});
local v16 = {};
v16.__index = v16;
v16.new = function(v17) --[[ Line: 106 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy)
    local v18 = setmetatable({
        _handlerListHead = false
    }, v16);
    if v17 then
        v18.totalConnections = 0;
        v18.connectionsChanged = v16.new();
    end;
    return v18;
end;
v16.Connect = function(v19, v20) --[[ Line: 117 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    local v21 = v5.new(v19, v20);
    if v19._handlerListHead then
        v21._next = v19._handlerListHead;
        v19._handlerListHead = v21;
    else
        v19._handlerListHead = v21;
    end;
    if v19.connectionsChanged then
        v19.totalConnections = v19.totalConnections + 1;
        v19.connectionsChanged:Fire(1);
    end;
    return v21;
end;
v16.DisconnectAll = function(v22) --[[ Line: 135 ]] --[[ Name: DisconnectAll ]]
    v22._handlerListHead = false;
    if v22.connectionsChanged then
        v22.connectionsChanged:Fire(-v22.totalConnections);
        v22.connectionsChanged:Destroy();
        v22.connectionsChanged = nil;
        v22.totalConnections = 0;
    end;
end;
v16.Destroy = v16.DisconnectAll;
v16.destroy = v16.DisconnectAll;
v16.Fire = function(v23, ...) --[[ Line: 152 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l__handlerListHead_1 = v23._handlerListHead;
    while l__handlerListHead_1 do
        if l__handlerListHead_1._connected then
            if not v0 then
                v0 = coroutine.create(v4);
            end;
            task.spawn(v0, l__handlerListHead_1._fn, ...);
        end;
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
end;
v16.Wait = function(v25) --[[ Line: 167 ]] --[[ Name: Wait ]]
    local v26 = coroutine.running();
    local v27 = nil;
    v27 = v25:Connect(function(...) --[[ Line: 170 ]]
        -- upvalues: v27 (ref), v26 (copy)
        v27:Disconnect();
        task.spawn(v26, ...);
    end);
    return coroutine.yield();
end;
return v16;