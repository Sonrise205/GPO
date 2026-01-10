local v0 = require(script.Connection);
local v1 = require(script.CoroutineManager);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = setmetatable({}, v2);
    v3._head = nil;
    return v3;
end;
v2.Fire = function(v4, ...) --[[ Line: 16 ]] --[[ Name: Fire ]]
    -- upvalues: v1 (copy)
    local l__head_0 = v4._head;
    while l__head_0 do
        if l__head_0.Connected then
            v1.InitializeRunnerThread();
            task.spawn(v1.FreeRunnerThread, l__head_0.Callback, ...);
        end;
        l__head_0 = l__head_0.Next;
    end;
end;
v2.Connect = function(v6, v7) --[[ Line: 28 ]] --[[ Name: Connect ]]
    -- upvalues: v0 (copy)
    local v8 = v0.new(v6, v7);
    if v6._head then
        v6._head.Previous = v8;
    end;
    v8.Next = v6._head;
    v6._head = v8;
    return v8;
end;
v2.Wait = function(v9) --[[ Line: 41 ]] --[[ Name: Wait ]]
    local v10 = coroutine.running();
    v9:Once(function(...) --[[ Line: 44 ]]
        -- upvalues: v10 (copy)
        task.spawn(v10, ...);
    end);
    return coroutine.yield();
end;
v2.Once = function(v11, v12) --[[ Line: 51 ]] --[[ Name: Once ]]
    local v13 = nil;
    v13 = v11:Connect(function(...) --[[ Line: 53 ]]
        -- upvalues: v13 (ref), v12 (copy)
        v13:Disconnect();
        v13 = nil;
        v12(...);
    end);
    return v13;
end;
v2.DisconnectAll = function(v14) --[[ Line: 62 ]] --[[ Name: DisconnectAll ]]
    v14._head = nil;
end;
return v2;