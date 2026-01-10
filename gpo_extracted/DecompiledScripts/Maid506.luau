local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _tasks = {}, 
        Destroy = v0.Clean, 
        IsMaid = true
    }, v0));
end;
v0.__index = function(v1, v2) --[[ Line: 8 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if v0[v2] then
        return v0[v2];
    else
        return v1._tasks[v2];
    end;
end;
v0.__newindex = function(v3, v4, v5) --[[ Line: 16 ]] --[[ Name: __newindex ]]
    -- upvalues: v0 (copy)
    if v0[v4] ~= nil then
        error(("'%s' is reserved"):format((tostring(v4))), 2);
    end;
    local l__tasks_0 = v3._tasks;
    local v7 = l__tasks_0[v4];
    if v7 == v5 then
        return;
    else
        l__tasks_0[v4] = v5;
        if v7 then
            if type(v7) == "function" then
                v7();
                return;
            elseif typeof(v7) == "RBXScriptConnection" then
                v7:Disconnect();
                return;
            elseif v7.Destroy then
                v7:Destroy();
            end;
        end;
        return;
    end;
end;
v0.AddTask = function(v8, v9) --[[ Line: 41 ]] --[[ Name: AddTask ]]
    if not v9 then
        error("Task cannot be false or nil", 2);
    end;
    local v10 = #v8._tasks + 1;
    v8[v10] = v9;
    if type(v9) == "table" then
        print(v9);
        if not v9.Disconnect and not v9.Destroy then
            warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
        end;
    end;
    return v10;
end;
v0.Clean = function(v11) --[[ Line: 61 ]] --[[ Name: Clean ]]
    local l__tasks_1 = v11._tasks;
    for v13, v14 in pairs(l__tasks_1) do
        if typeof(v14) == "RBXScriptConnection" then
            l__tasks_1[v13] = nil;
            v14:Disconnect();
        end;
    end;
    local v15, v16 = next(l__tasks_1);
    while v16 ~= nil do
        l__tasks_1[v15] = nil;
        if type(v16) == "function" then
            v16();
        elseif typeof(v16) == "RBXScriptConnection" then
            v16:Disconnect();
        elseif typeof(v16) == "thread" then
            task.cancel(v16);
        elseif v16.Destroy then
            v16:Destroy();
        elseif v16.Disconnect then
            v16:Disconnect();
        end;
        local v17, v18 = next(l__tasks_1);
        v15 = v17;
        v16 = v18;
    end;
end;
v0.Give = v0.AddTask;
v0.give = v0.AddTask;
return v0;