local v0 = nil;
local function v3(v1, ...) --[[ Line: 35 ]] --[[ Name: acquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 46 ]] --[[ Name: runEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        Connected = true, 
        _signal = v6, 
        _fn = v7, 
        _next = false
    }, v5));
end;
v5.Disconnect = function(v8) --[[ Line: 81 ]] --[[ Name: Disconnect ]]
    if not v8.Connected then
        return;
    else
        v8.Connected = false;
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
end;
v5.Destroy = v5.Disconnect;
setmetatable(v5, {
    __index = function(_, v11) --[[ Line: 108 ]] --[[ Name: __index ]]
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(v11))), 2);
    end, 
    __newindex = function(_, v13, _) --[[ Line: 111 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(v13))), 2);
    end
});
local v15 = {};
v15.__index = v15;
v15.new = function() --[[ Line: 147 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    return (setmetatable({
        _handlerListHead = false, 
        _proxyHandler = nil
    }, v15));
end;
v15.Wrap = function(v16) --[[ Line: 168 ]] --[[ Name: Wrap ]]
    -- upvalues: v15 (copy)
    assert(typeof(v16) == "RBXScriptSignal", "Argument #1 to Signal.Wrap must be a RBXScriptSignal; got " .. typeof(v16));
    local v17 = v15.new();
    v17._proxyHandler = v16:Connect(function(...) --[[ Line: 174 ]]
        -- upvalues: v17 (copy)
        v17:Fire(...);
    end);
    return v17;
end;
v15.Is = function(v18) --[[ Line: 186 ]] --[[ Name: Is ]]
    -- upvalues: v15 (copy)
    local v19 = false;
    if type(v18) == "table" then
        v19 = getmetatable(v18) == v15;
    end;
    return v19;
end;
v15.Connect = function(v20, v21) --[[ Line: 203 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    local v22 = v5.new(v20, v21);
    if v20._handlerListHead then
        v22._next = v20._handlerListHead;
        v20._handlerListHead = v22;
        return v22;
    else
        v20._handlerListHead = v22;
        return v22;
    end;
end;
v15.ConnectOnce = function(v23, v24) --[[ Line: 229 ]] --[[ Name: ConnectOnce ]]
    local v25 = nil;
    local v26 = false;
    v25 = v23:Connect(function(...) --[[ Line: 232 ]]
        -- upvalues: v26 (ref), v25 (ref), v24 (copy)
        if v26 then
            return;
        else
            v26 = true;
            v25:Disconnect();
            v24(...);
            return;
        end;
    end);
    return v25;
end;
v15.GetConnections = function(v27) --[[ Line: 243 ]] --[[ Name: GetConnections ]]
    local v28 = {};
    local l__handlerListHead_1 = v27._handlerListHead;
    while l__handlerListHead_1 do
        table.insert(v28, l__handlerListHead_1);
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
    return v28;
end;
v15.DisconnectAll = function(v30) --[[ Line: 261 ]] --[[ Name: DisconnectAll ]]
    local l__handlerListHead_2 = v30._handlerListHead;
    while l__handlerListHead_2 do
        l__handlerListHead_2.Connected = false;
        l__handlerListHead_2 = l__handlerListHead_2._next;
    end;
    v30._handlerListHead = false;
end;
v15.Fire = function(v32, ...) --[[ Line: 285 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l__handlerListHead_3 = v32._handlerListHead;
    while l__handlerListHead_3 do
        if l__handlerListHead_3.Connected then
            if not v0 then
                v0 = coroutine.create(v4);
            end;
            task.spawn(v0, l__handlerListHead_3._fn, ...);
        end;
        l__handlerListHead_3 = l__handlerListHead_3._next;
    end;
end;
v15.FireDeferred = function(v34, ...) --[[ Line: 306 ]] --[[ Name: FireDeferred ]]
    local l__handlerListHead_4 = v34._handlerListHead;
    while l__handlerListHead_4 do
        task.defer(l__handlerListHead_4._fn, ...);
        l__handlerListHead_4 = l__handlerListHead_4._next;
    end;
end;
v15.Wait = function(v36) --[[ Line: 329 ]] --[[ Name: Wait ]]
    local v37 = coroutine.running();
    local v38 = nil;
    local v39 = false;
    v38 = v36:Connect(function(...) --[[ Line: 333 ]]
        -- upvalues: v39 (ref), v38 (ref), v37 (copy)
        if v39 then
            return;
        else
            v39 = true;
            v38:Disconnect();
            task.spawn(v37, ...);
            return;
        end;
    end);
    return coroutine.yield();
end;
v15.Destroy = function(v40) --[[ Line: 356 ]] --[[ Name: Destroy ]]
    v40:DisconnectAll();
    local v41 = rawget(v40, "_proxyHandler");
    if v41 then
        v41:Disconnect();
    end;
end;
setmetatable(v15, {
    __index = function(_, v43) --[[ Line: 366 ]] --[[ Name: __index ]]
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(v43))), 2);
    end, 
    __newindex = function(_, v45, _) --[[ Line: 369 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(v45))), 2);
    end
});
return v15;