local v0 = require(script.Parent.loader).load(script)("MaidTaskUtils");
local v1 = {
    ClassName = "Subscription"
};
v1.__index = v1;
local v2 = {
    PENDING = "pending", 
    FAILED = "failed", 
    COMPLETE = "complete", 
    CANCELLED = "cancelled"
};
v1.new = function(v3, v4, v5, v6) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v7 = true;
    if type(v3) ~= "function" then
        v7 = v3 == nil;
    end;
    assert(v7, "Bad fireCallback");
    v7 = true;
    if type(v4) ~= "function" then
        v7 = v4 == nil;
    end;
    assert(v7, "Bad failCallback");
    v7 = true;
    if type(v5) ~= "function" then
        v7 = v5 == nil;
    end;
    assert(v7, "Bad completeCallback");
    return (setmetatable({
        _state = v2.PENDING, 
        _source = "", 
        _fireCallback = v3, 
        _failCallback = v4, 
        _completeCallback = v5, 
        _onSubscribe = v6
    }, v1));
end;
v1.Fire = function(v8, ...) --[[ Line: 63 ]] --[[ Name: Fire ]]
    -- upvalues: v2 (copy)
    if v8._state == v2.PENDING then
        if v8._fireCallback then
            v8._fireCallback(...);
            return;
        end;
    elseif v8._state == v2.CANCELLED then
        warn("[Subscription.Fire] - We are cancelled, but events are still being pushed");
    end;
end;
v1.Fail = function(v9) --[[ Line: 81 ]] --[[ Name: Fail ]]
    -- upvalues: v2 (copy)
    if v9._state ~= v2.PENDING then
        return;
    else
        v9._state = v2.FAILED;
        if v9._failCallback then
            v9._failCallback();
        end;
        v9:_doCleanup();
        return;
    end;
end;
v1.GetFireFailComplete = function(v10) --[[ Line: 114 ]] --[[ Name: GetFireFailComplete ]]
    return function(...) --[[ Line: 115 ]]
        -- upvalues: v10 (copy)
        v10:Fire(...);
    end, function(...) --[[ Line: 117 ]]
        -- upvalues: v10 (copy)
        v10:Fail(...);
    end, function(...) --[[ Line: 119 ]]
        -- upvalues: v10 (copy)
        v10:Complete(...);
    end;
end;
v1.GetFailComplete = function(v11) --[[ Line: 141 ]] --[[ Name: GetFailComplete ]]
    return function(...) --[[ Line: 142 ]]
        -- upvalues: v11 (copy)
        v11:Fail(...);
    end, function(...) --[[ Line: 144 ]]
        -- upvalues: v11 (copy)
        v11:Complete(...);
    end;
end;
v1.Complete = function(v12) --[[ Line: 153 ]] --[[ Name: Complete ]]
    -- upvalues: v2 (copy)
    if v12._state ~= v2.PENDING then
        return;
    else
        v12._state = v2.COMPLETE;
        if v12._completeCallback then
            v12._completeCallback();
        end;
        v12:_doCleanup();
        return;
    end;
end;
v1.IsPending = function(v13) --[[ Line: 170 ]] --[[ Name: IsPending ]]
    -- upvalues: v2 (copy)
    return v13._state == v2.PENDING;
end;
v1._giveCleanup = function(v14, v15) --[[ Line: 174 ]] --[[ Name: _giveCleanup ]]
    -- upvalues: v2 (copy), v0 (copy)
    assert(v15, "Bad task");
    assert(not v14._cleanupTask, "Already have _cleanupTask");
    if v14._state ~= v2.PENDING then
        v0.doTask(v15);
        return;
    else
        v14._cleanupTask = v15;
        return;
    end;
end;
v1._doCleanup = function(v16) --[[ Line: 186 ]] --[[ Name: _doCleanup ]]
    -- upvalues: v0 (copy)
    if v16._cleanupTask then
        local l__cleanupTask_0 = v16._cleanupTask;
        v16._cleanupTask = nil;
        v0.doTask(l__cleanupTask_0);
    end;
end;
v1.Destroy = function(v18) --[[ Line: 202 ]] --[[ Name: Destroy ]]
    -- upvalues: v2 (copy)
    if v18._state == v2.PENDING then
        v18._state = v2.CANCELLED;
    end;
    v18:_doCleanup();
end;
v1.Disconnect = function(v19) --[[ Line: 213 ]] --[[ Name: Disconnect ]]
    v19:Destroy();
end;
return v1;