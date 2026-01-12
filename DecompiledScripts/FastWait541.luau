local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local v2 = nil;
local function v7(v3, v4) --[[ Line: 26 ]] --[[ Name: pushThread ]]
    -- upvalues: v2 (ref)
    local v5 = {
        [1] = v3, 
        [2] = v4
    };
    if v2 then
        if v4 <= v2[2] then
            v5[3] = v2;
            v2 = v5;
            return;
        else
            local l_v2_0 = v2;
            while l_v2_0[3] and l_v2_0[3][2] < v4 do
                l_v2_0 = l_v2_0[3];
            end;
            v5[3] = l_v2_0[3];
            if l_v2_0[3] then
                v5[3][4] = v5;
            end;
            l_v2_0[3] = v5;
            v5[4] = l_v2_0;
            return;
        end;
    else
        v2 = v5;
        return;
    end;
end;
local function v11() --[[ Line: 58 ]] --[[ Name: popThreads ]]
    -- upvalues: v2 (ref)
    local v8 = tick();
    while v2 and v2[2] - v8 < 0.005 do
        local v9 = v2[1];
        local v10 = v2[3];
        if v10 then
            v10[4] = nil;
        end;
        v2 = v10;
        coroutine.resume(v9, v8);
    end;
end;
if l_RunService_0:IsClient() == false then
    l_RunService_0.Heartbeat:Connect(v11);
else
    l_RunService_0.Heartbeat:Connect(v11);
end;
v0.Wait = function(_, v13) --[[ Line: 88 ]] --[[ Name: Wait ]]
    task.wait((tonumber(v13)));
end;
v0.Spawn = function(_, v15, ...) --[[ Line: 100 ]] --[[ Name: Spawn ]]
    debug.profilebegin("Thread:Spawn");
    local v16 = {
        ...
    };
    local v17 = select("#", ...);
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Event:Connect(function(v19) --[[ Line: 107 ]]
        -- upvalues: v15 (copy), l_BindableEvent_0 (copy)
        v15(v19());
        l_BindableEvent_0:Destroy();
    end);
    l_BindableEvent_0:Fire(function() --[[ Line: 112 ]]
        -- upvalues: v16 (copy), v17 (copy)
        return unpack(v16, 1, v17);
    end);
    debug.profileend();
end;
v0.Delay = function(v20, v21, v22) --[[ Line: 119 ]] --[[ Name: Delay ]]
    v20:Spawn(function() --[[ Line: 120 ]]
        -- upvalues: v20 (copy), v21 (copy), v22 (copy)
        local v23, v24 = v20:Wait(v21);
        v22(v23, v24);
    end);
end;
return function(v25) --[[ Line: 126 ]] --[[ Name: fastwait ]]
    -- upvalues: v7 (copy)
    local v26 = tonumber(v25) or 0.03333333333333333;
    local v27 = tick();
    local v28 = coroutine.running();
    v7(v28, v27 + (v26 or 0));
    return coroutine.yield() - v27, elapsedTime();
end;