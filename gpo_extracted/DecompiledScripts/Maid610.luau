local v0 = {
    ClassName = "Maid"
};
v0.new = function() --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _tasks = {}
    }, v0));
end;
v0.isMaid = function(v1) --[[ Line: 34 ]] --[[ Name: isMaid ]]
    local v2 = false;
    if type(v1) == "table" then
        v2 = v1.ClassName == "Maid";
    end;
    return v2;
end;
v0.__index = function(v3, v4) --[[ Line: 38 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if v0[v4] then
        return v0[v4];
    else
        return v3._tasks[v4];
    end;
end;
v0.__newindex = function(v5, v6, v7) --[[ Line: 46 ]] --[[ Name: __newindex ]]
    -- upvalues: v0 (copy)
    if v0[v6] ~= nil then
        error(("Cannot use '%s' as a Maid key"):format((tostring(v6))), 2);
    end;
    local l__tasks_0 = v5._tasks;
    local v9 = l__tasks_0[v6];
    if v9 == v7 then
        return;
    else
        l__tasks_0[v6] = v7;
        if v9 then
            if type(v9) == "function" then
                v9();
                return;
            elseif type(v9) == "thread" then
                local v10 = nil;
                if coroutine.running() ~= v9 then
                    v10 = pcall(function() --[[ Line: 66 ]]
                        -- upvalues: v9 (copy)
                        task.cancel(v9);
                    end);
                end;
                if not v10 then
                    task.defer(function() --[[ Line: 72 ]]
                        -- upvalues: v9 (copy)
                        task.cancel(v9);
                    end);
                    return;
                end;
            elseif typeof(v9) == "RBXScriptConnection" then
                v9:Disconnect();
                return;
            elseif v9.Destroy then
                v9:Destroy();
            end;
        end;
        return;
    end;
end;
v0.Add = function(v11, v12) --[[ Line: 84 ]] --[[ Name: Add ]]
    if not v12 then
        error("Task cannot be false or nil", 2);
    end;
    v11[#v11._tasks + 1] = v12;
    if type(v12) == "table" and not v12.Destroy then
        warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
    end;
    return v12;
end;
v0.GiveTask = function(v13, v14) --[[ Line: 98 ]] --[[ Name: GiveTask ]]
    if not v14 then
        error("Task cannot be false or nil", 2);
    end;
    local v15 = #v13._tasks + 1;
    v13[v15] = v14;
    if type(v14) == "table" and not v14.Destroy then
        warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
    end;
    return v15;
end;
v0.AddTask = v0.Add;
v0.GivePromise = function(v16, v17) --[[ Line: 115 ]] --[[ Name: GivePromise ]]
    if not v17:IsPending() then
        return v17;
    else
        local v18 = v17:resolved();
        local v19 = v16:GiveTask(v18);
        v18:Finally(function() --[[ Line: 124 ]]
            -- upvalues: v16 (copy), v19 (copy)
            v16[v19] = nil;
        end);
        return v18;
    end;
end;
v0.DoCleaning = function(v20) --[[ Line: 131 ]] --[[ Name: DoCleaning ]]
    local l__tasks_1 = v20._tasks;
    for v22, v23 in pairs(l__tasks_1) do
        if typeof(v23) == "RBXScriptConnection" then
            l__tasks_1[v22] = nil;
            v23:Disconnect();
        end;
    end;
    local v24, v25 = next(l__tasks_1);
    while v25 ~= nil do
        l__tasks_1[v24] = nil;
        if type(v25) == "function" then
            v25();
        elseif type(v25) == "thread" then
            local v26 = nil;
            if coroutine.running() ~= v25 then
                v26 = pcall(function() --[[ Line: 151 ]]
                    -- upvalues: v25 (ref)
                    task.cancel(v25);
                end);
            end;
            if not v26 then
                local l_v25_0 = v25;
                local l_l_v25_0_0 = l_v25_0 --[[ copy: 5 -> 7 ]];
                task.defer(function() --[[ Line: 158 ]]
                    -- upvalues: l_l_v25_0_0 (copy)
                    task.cancel(l_l_v25_0_0);
                end);
            end;
        elseif typeof(v25) == "RBXScriptConnection" then
            v25:Disconnect();
        elseif v25.Destroy then
            v25:Destroy();
        end;
        local v29, v30 = next(l__tasks_1);
        v24 = v29;
        v25 = v30;
    end;
end;
v0.AttachToInstance = function(v31, v32) --[[ Line: 171 ]] --[[ Name: AttachToInstance ]]
    warn("hooked ", v32);
    v31:GiveTask(v32:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 174 ]]
        -- upvalues: v32 (copy), v31 (copy)
        if not v32.Parent then
            print("destroyed", v32);
            v31:Destroy();
        end;
    end));
end;
v0.Destroy = v0.DoCleaning;
return v0;