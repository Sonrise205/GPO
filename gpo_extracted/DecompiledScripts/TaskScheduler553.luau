local v0 = nil;
local v1 = nil;
local v2 = {};
local v19 = {
    CreateScheduler = function(_, v4) --[[ Line: 52 ]] --[[ Name: CreateScheduler ]]
        -- upvalues: v2 (copy)
        local v5 = {};
        local v6 = {};
        local v7 = true;
        local v8 = nil;
        local function v9() --[[ Line: 58 ]] --[[ Name: loop ]]
            -- upvalues: v7 (ref), v4 (copy), v2 (ref), v6 (copy)
            while true do
                if not v7 then
                    if _G.FPS >= v4 and tick() - v2[1] < 1 / v4 then
                        if #v6 > 0 then
                            v6[1]();
                            table.remove(v6, 1);
                        else
                            v7 = true;
                            return;
                        end;
                    else
                        game:GetService("RunService").Heartbeat:Wait();
                    end;
                else
                    return;
                end;
            end;
        end;
        v5.Pause = function(_) --[[ Line: 76 ]] --[[ Name: Pause ]]
            -- upvalues: v8 (ref), v7 (ref)
            v8 = true;
            v7 = true;
        end;
        v5.Resume = function(_) --[[ Line: 81 ]] --[[ Name: Resume ]]
            -- upvalues: v8 (ref), v7 (ref), v9 (copy)
            if v8 then
                v8 = false;
                v7 = false;
                v9();
            end;
        end;
        v5.Destroy = function(_) --[[ Line: 89 ]] --[[ Name: Destroy ]]
            -- upvalues: v5 (copy)
            v5:Pause();
            for v13 in next, v5 do
                v5[v13] = nil;
            end;
            setmetatable(v5, {
                __index = function() --[[ Line: 95 ]] --[[ Name: __index ]]
                    error("Attempt to use destroyed scheduler");
                end, 
                __newindex = function() --[[ Line: 98 ]] --[[ Name: __newindex ]]
                    error("Attempt to use destroyed scheduler");
                end
            });
        end;
        v5.QueueTask = function(_, v15) --[[ Line: 104 ]] --[[ Name: QueueTask ]]
            -- upvalues: v6 (copy), v7 (ref), v8 (ref), v9 (copy)
            v6[#v6 + 1] = v15;
            if v7 and not v8 then
                v7 = false;
                v9();
            end;
        end;
        v5.GetQueueSize = function(_) --[[ Line: 112 ]] --[[ Name: GetQueueSize ]]
            -- upvalues: v6 (copy)
            return #v6;
        end;
        return v5;
    end, 
    GetCurrentFPS = function(_) --[[ Line: 120 ]] --[[ Name: GetCurrentFPS ]]
        -- upvalues: v1 (ref), v2 (copy)
        return tick() - v1 >= 1 and #v2 or #v2 / (tick() - v1);
    end, 
    wait = function(v18) --[[ Line: 124 ]] --[[ Name: wait ]]
        task.wait(v18);
    end
};
v1 = tick();
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 129 ]]
    -- upvalues: v0 (ref), v2 (copy)
    v0 = tick();
    for v20 = #v2, 1, -1 do
        v2[v20 + 1] = v2[v20] >= v0 - 1 and v2[v20] or nil;
    end;
    v2[1] = v0;
end);
game:GetService("RunService").Heartbeat:Wait();
return v19;