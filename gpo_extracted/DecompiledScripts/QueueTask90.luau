local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1.pendingTasks = {};
    v1.running = false;
    return v1;
end;
v0.QueueTask = function(v2, ...) --[[ Line: 12 ]] --[[ Name: QueueTask ]]
    table.insert(v2.pendingTasks, {
        ...
    });
    if not v2.running then
        v2:Run();
    end;
end;
v0.Run = function(v3) --[[ Line: 19 ]] --[[ Name: Run ]]
    v3.running = true;
    task.spawn(function() --[[ Line: 21 ]]
        -- upvalues: v3 (copy)
        while #v3.pendingTasks > 0 do
            local v4 = table.remove(v3.pendingTasks, 1);
            v4[1](table.unpack(v4, 2));
        end;
        v3.running = false;
    end);
end;
return v0;