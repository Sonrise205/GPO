local v0 = nil;
local function v3(v1, ...) --[[ Line: 58 ]] --[[ Name: acquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4() --[[ Line: 69 ]] --[[ Name: runEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 84 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        _connected = true, 
        _signal = v6, 
        _fn = v7, 
        _next = false
    }, v5));
end;
v5.Disconnect = function(v8) --[[ Line: 93 ]] --[[ Name: Disconnect ]]
    v8._connected = false;
    if v8._signal._handlerListHead == v8 then
        v8._signal._handlerListHead = v8._next;
        return;
    else
        local l__handlerListHead_0 = v8._signal._handlerListHead;
        while l__handlerListHead_0 and l__handlerListHead_0._next ~= v8 do
            l__handlerListHead_0 = l__handlerListHead_0._next;
        end;
        if l__handlerListHead_0 then
            l__handlerListHead_0._next = v8._next;
        end;
        return;
    end;
end;
setmetatable(v5, {
    __index = function(_, v11) --[[ Line: 115 ]] --[[ Name: __index ]]
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(v11))), 2);
    end, 
    __newindex = function(_, v13, _) --[[ Line: 118 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(v13))), 2);
    end
});
local v15 = {};
v15.__index = v15;
v15.new = function() --[[ Line: 127 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    return (setmetatable({
        _handlerListHead = false, 
        Event = {}
    }, v15));
end;
v15.Connect = function(v16, v17) --[[ Line: 134 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    local v18 = v5.new(v16, v17);
    if v16._handlerListHead then
        v18._next = v16._handlerListHead;
        v16._handlerListHead = v18;
    else
        v16._handlerListHead = v18;
    end;
    v18.Fire = function(_, ...) --[[ Line: 143 ]] --[[ Name: Fire ]]
        -- upvalues: v16 (copy), v17 (copy)
        v16:Fire(v17);
    end;
    v18.fire = function(_, ...) --[[ Line: 146 ]] --[[ Name: fire ]]
        -- upvalues: v16 (copy), v17 (copy)
        v16:Fire(v17);
    end;
    v18.disconnect = function(v21) --[[ Line: 149 ]] --[[ Name: disconnect ]]
        v21:Disconnect();
    end;
    v18.wait = function(_) --[[ Line: 152 ]] --[[ Name: wait ]]
        -- upvalues: v16 (copy)
        return v16:Wait();
    end;
    return v18;
end;
v15.connect = function(v23, v24) --[[ Line: 158 ]] --[[ Name: connect ]]
    return v23:Connect(v24);
end;
v15.DisconnectAll = function(v25) --[[ Line: 164 ]] --[[ Name: DisconnectAll ]]
    v25._handlerListHead = false;
end;
v15.Fire = function(v26, ...) --[[ Line: 172 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l__handlerListHead_1 = v26._handlerListHead;
    while l__handlerListHead_1 do
        if l__handlerListHead_1._connected then
            if not v0 then
                v0 = coroutine.create(v4);
                coroutine.resume(v0);
            end;
            task.spawn(v0, l__handlerListHead_1._fn, ...);
        end;
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
end;
v15.fire = function(v28, ...) --[[ Line: 187 ]] --[[ Name: fire ]]
    v28:Fire(...);
end;
v15.Wait = function(v29) --[[ Line: 193 ]] --[[ Name: Wait ]]
    local v30 = coroutine.running();
    local v31 = nil;
    v31 = v29:Connect(function(...) --[[ Line: 196 ]]
        -- upvalues: v31 (ref), v30 (copy)
        v31:Disconnect();
        task.spawn(v30, ...);
    end);
    return coroutine.yield();
end;
v15.wait = function(v32) --[[ Line: 203 ]] --[[ Name: wait ]]
    return v32:Wait();
end;
v15.Once = function(v33, v34) --[[ Line: 209 ]] --[[ Name: Once ]]
    local v35 = nil;
    v35 = v33:Connect(function(...) --[[ Line: 211 ]]
        -- upvalues: v35 (ref), v34 (copy)
        if v35._connected then
            v35:Disconnect();
        end;
        v34(...);
    end);
    return v35;
end;
v15.ConnectOnce = function(v36, v37) --[[ Line: 220 ]] --[[ Name: ConnectOnce ]]
    return v36:Once(v37);
end;
v15.connectOnce = function(v38, v39) --[[ Line: 224 ]] --[[ Name: connectOnce ]]
    return v38:Once(v39);
end;
v15.Destroy = function(v40) --[[ Line: 228 ]] --[[ Name: Destroy ]]
    v40:DisconnectAll();
    setmetatable(v40, nil);
end;
setmetatable(v15, {
    __index = function(_, v42) --[[ Line: 235 ]] --[[ Name: __index ]]
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(v42))), 2);
    end, 
    __newindex = function(_, v44, _) --[[ Line: 238 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(v44))), 2);
    end
});
return v15;