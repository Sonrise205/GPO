local _ = game:GetService("HttpService");
local l_Types_0 = script.Types;
local v2 = {};
for _, v4 in l_Types_0:GetChildren() do
    v2[v4.Name] = require(v4);
end;
local v5 = {};
v5.__index = function(v6, v7) --[[ Line: 16 ]] --[[ Name: __index ]]
    -- upvalues: v5 (copy)
    return v5[v7] or v6._tasks[v7];
end;
v5.__newindex = function(v8, v9, v10) --[[ Line: 22 ]] --[[ Name: __newindex ]]
    -- upvalues: v5 (copy)
    if v5[v9] then
        warn((("[Cleaner]: %* is an existing method of class"):format(v9)));
        return;
    elseif v8._tasks[v9] == v10 then
        return;
    else
        v8:_cleanTask(v9);
        v8:_addTaskWithID(v10, v9);
        return;
    end;
end;
v5.new = function() --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        _tasks = {}, 
        _length = 0
    }, v5));
end;
v5._addTaskWithID = function(v11, v12, v13) --[[ Line: 44 ]] --[[ Name: _addTaskWithID ]]
    v11._tasks[v13] = v12;
end;
v5.AddTask = function(v14, ...) --[[ Line: 48 ]] --[[ Name: AddTask ]]
    for _, v16 in {
        ...
    } do
        v14._length = v14._length + 1;
        v14:_addTaskWithID(v16, v14._length);
    end;
end;
v5._cleanTask = function(v17, v18) --[[ Line: 56 ]] --[[ Name: _cleanTask ]]
    -- upvalues: v2 (copy)
    local l__tasks_0 = v17._tasks;
    local v20 = l__tasks_0[v18];
    if not v20 then
        return;
    else
        local v21 = typeof(v20);
        local v22 = v2[v21];
        l__tasks_0[v18] = nil;
        if not v22 then
            warn((("[Cleaner]: Unable to clean %*"):format(v21)));
            return;
        else
            v22(v20);
            return;
        end;
    end;
end;
v5.Destroy = function(v23) --[[ Line: 75 ]] --[[ Name: Destroy ]]
    for v24 in v23._tasks do
        v23:_cleanTask(v24);
    end;
    v23._length = 0;
end;
return v5;