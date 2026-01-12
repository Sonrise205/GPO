local v0 = {
    FreeRunnerThread = nil
};
v0._acquireAndRun = function(v1, ...) --[[ Line: 12 ]] --[[ Name: _acquireAndRun ]]
    -- upvalues: v0 (copy)
    local l_FreeRunnerThread_0 = v0.FreeRunnerThread;
    v0.FreeRunnerThread = nil;
    v1(...);
    v0.FreeRunnerThread = v0.FreeRunnerThread or l_FreeRunnerThread_0;
end;
v0._runHandlerInThread = function() --[[ Line: 19 ]] --[[ Name: _runHandlerInThread ]]
    -- upvalues: v0 (copy)
    while true do
        v0._acquireAndRun(coroutine.yield());
    end;
end;
v0.InitializeRunnerThread = function() --[[ Line: 25 ]] --[[ Name: InitializeRunnerThread ]]
    -- upvalues: v0 (copy)
    if not v0.FreeRunnerThread then
        v0.FreeRunnerThread = coroutine.create(v0._runHandlerInThread);
        task.spawn(v0.FreeRunnerThread);
    end;
end;
return v0;