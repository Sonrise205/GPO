local v0 = {
    ClassName = "Maid"
};
v0.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _tasks = {}
    }, v0));
end;
v0.isMaid = function(v1) --[[ Line: 32 ]] --[[ Name: isMaid ]]
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
v0.__newindex = function(v5, v6, v7) --[[ Line: 55 ]] --[[ Name: __newindex ]]
    -- upvalues: v0 (copy)
    if v0[v6] ~= nil then
        error(("'%s' is reserved"):format((tostring(v6))), 2);
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
v0.GiveTask = function(v10, v11) --[[ Line: 83 ]] --[[ Name: GiveTask ]]
    if not v11 then
        warn("Task cannot be false or nil", 2);
        return;
    else
        local v12 = #v10._tasks + 1;
        v10[v12] = v11;
        if type(v11) == "table" and not v11.Destroy then
            warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
        end;
        return v12;
    end;
end;
v0.GivePromise = function(v13, v14) --[[ Line: 99 ]] --[[ Name: GivePromise ]]
    if not v14:IsPending() then
        return v14;
    else
        local v15 = v14:resolved();
        local v16 = v13:GiveTask(v15);
        v15:Finally(function() --[[ Line: 108 ]]
            -- upvalues: v13 (copy), v16 (copy)
            v13[v16] = nil;
        end);
        return v15;
    end;
end;
v0.DoCleaning = function(v17) --[[ Line: 117 ]] --[[ Name: DoCleaning ]]
    local l__tasks_1 = v17._tasks;
    if l__tasks_1 == nil then
        warn("NO TASKS IN MAIDTASK TO DESTROY");
        return;
    else
        for v19, v20 in pairs(l__tasks_1) do
            if typeof(v20) == "RBXScriptConnection" then
                l__tasks_1[v19] = nil;
                v20:Disconnect();
            end;
        end;
        local v21, v22 = next(l__tasks_1);
        while v22 ~= nil do
            l__tasks_1[v21] = nil;
            if type(v22) == "function" then
                v22();
            elseif typeof(v22) == "RBXScriptConnection" then
                v22:Disconnect();
            elseif v22.Destroy then
                v22:Destroy();
            end;
            local v23, v24 = next(l__tasks_1);
            v21 = v23;
            v22 = v24;
        end;
        return;
    end;
end;
v0.TagAll = function(_, v26) --[[ Line: 147 ]] --[[ Name: TagAll ]]
    -- upvalues: v0 (copy)
    for _, v28 in pairs(v26) do
        v0:GiveTask(v28);
    end;
end;
v0.AttachToInstance = function(_, v30) --[[ Line: 153 ]] --[[ Name: AttachToInstance ]]
    -- upvalues: v0 (copy)
    v30.Destroying:Connect(function() --[[ Line: 154 ]]
        -- upvalues: v0 (ref)
        v0:Destroy();
    end);
end;
v0.Destroy = v0.DoCleaning;
return v0;