local l_Signals_0 = script.Parent.Parent.Signals;
local l_GoodSignal_0 = require(l_Signals_0:WaitForChild("GoodSignal"));
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: l_GoodSignal_0 (copy), v2 (copy)
    return (setmetatable({
        Queues = {}, 
        OnQueueAdded = l_GoodSignal_0.new(), 
        OnQueueRemoved = l_GoodSignal_0.new()
    }, v2));
end;
v2.IsInQueue = function(v3, v4) --[[ Line: 22 ]] --[[ Name: IsInQueue ]]
    return v3.Queues[v4];
end;
v2.AddQueue = function(v5, v6) --[[ Line: 26 ]] --[[ Name: AddQueue ]]
    if v5:IsInQueue(v6) ~= nil then
        warn(v6, "Already in queue!");
        return;
    else
        v5.Queues[v6] = true;
        v5.OnQueueAdded:Fire(v6);
        return;
    end;
end;
v2.RemoveQueue = function(v7, v8) --[[ Line: 32 ]] --[[ Name: RemoveQueue ]]
    if v7:IsInQueue(v8) == nil then
        warn(v8, "Queue not found!");
        return;
    else
        v7.Queues[v8] = nil;
        v7.OnQueueRemoved:Fire(v8);
        return;
    end;
end;
return v2;