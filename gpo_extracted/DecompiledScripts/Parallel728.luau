local v0 = {};
local v1 = {};
local v2 = {};
local v3 = 0;
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "__ParallelWorkers";
l_Folder_0.Parent = game:GetService("Players").LocalPlayer.PlayerScripts;
local l_ClientWorker_0 = script.ClientWorker;
local function v10() --[[ Line: 14 ]] --[[ Name: getFreeWorker ]]
    -- upvalues: v1 (copy), l_ClientWorker_0 (copy), l_Folder_0 (copy)
    for _, v7 in ipairs(v1) do
        if v7.available then
            return v7;
        end;
    end;
    local v8 = l_ClientWorker_0:Clone();
    v8.Parent = l_Folder_0;
    local v9 = {
        run = require(v8.WorkerMain), 
        available = true
    };
    table.insert(v1, v9);
    return v9;
end;
v0.runParallel = function(v11, ...) --[[ Line: 33 ]] --[[ Name: runParallel ]]
    -- upvalues: v10 (copy), v3 (ref), v2 (copy)
    local v12 = v10();
    v3 = v3 + 1;
    v12.available = false;
    v12.run(v11, ...);
    v12.available = true;
    v3 = v3 - 1;
    if v3 == 0 then
        for _, v14 in next, v2 do
            task.spawn(v14);
        end;
        table.clear(v2);
    end;
end;
v0.waitForThreads = function() --[[ Line: 50 ]] --[[ Name: waitForThreads ]]
    -- upvalues: v3 (ref), v2 (copy)
    if v3 ~= 0 then
        table.insert(v2, coroutine.running());
        coroutine.yield();
    end;
end;
return v0;