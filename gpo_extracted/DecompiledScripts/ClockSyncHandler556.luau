local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_ClockSync_0 = l_ReplicatedStorage_0:WaitForChild("ClockSync");
local v5 = l_RunService_0:IsClient();
v0.GetTime = function(v6, v7) --[[ Line: 42 ]] --[[ Name: GetTime ]]
    -- upvalues: v5 (copy)
    if v5 then
        local v8 = v6.ServerTimeOffset or 0;
        return (v7 or tick()) + v8;
    else
        return v7 or tick();
    end;
end;
v0.Update = function(v9) --[[ Line: 51 ]] --[[ Name: Update ]]
    -- upvalues: v5 (copy), l_ClockSync_0 (copy)
    local v10 = tick();
    v9.AverageFrameTime = v9.AverageFrameTime * 0.9 + (v10 - v9.LastUpdate) * 0.1;
    v9.LastUpdate = v10;
    if not v5 then
        for v11, v12 in v9.AverageDelays do
            local v13 = v9.PlayerCaches[v11];
            for v14, v15 in v13 do
                if v10 - v15[1] > 10 then
                    v13[v14] = nil;
                end;
            end;
            coroutine.resume(coroutine.create(function() --[[ Line: 66 ]]
                -- upvalues: l_ClockSync_0 (ref), v11 (copy), v10 (copy), v12 (copy), v9 (copy), v13 (copy)
                local v16, _, _, v19, v20, v21, v22 = pcall(function() --[[ Line: 67 ]]
                    -- upvalues: l_ClockSync_0 (ref), v11 (ref), v10 (ref), v12 (ref), v9 (ref)
                    return l_ClockSync_0:InvokeClient(v11, v10, v12, v9.AverageFrameTime);
                end);
                local v23 = tick() - v10;
                if v16 and v9.PlayerCaches[v11] then
                    if v22 then
                        local v24 = v22[1];
                        local v25 = v13[v24];
                        if v25 then
                            for v26, v27 in i(v22[2]) do
                                local v28 = v25[2][v26];
                                if v28 then
                                    local v29 = 0.5 * (v28 - (v27[1] + v27[2]));
                                    v9.AverageDelays[v11] = v9.AverageDelays[v11] * 0.9 + v29 * 0.1;
                                end;
                            end;
                            v13[v24] = nil;
                        end;
                    end;
                    if not v13[v20] and v19 then
                        v13[v20] = {
                            tick(), 
                            {}
                        };
                    end;
                    local v30 = v13[v20];
                    if v30 then
                        v30[2][v21] = v23;
                    end;
                end;
            end));
        end;
    end;
end;
if v5 then
    v0.InvokeSignal = function(v31, v32, v33, v34) --[[ Line: 104 ]] --[[ Name: InvokeSignal ]]
        local v35 = tick();
        local v36 = v35 - (v32 + v33);
        if not v31.LastDelta then
            v31.LastDelta = v36;
        end;
        local v37 = (v36 - v31.LastDelta) / v34;
        v31.LastDelta = v36;
        v37 = math.floor(v37 + 0.5);
        local v38 = false;
        local v39 = nil;
        local v40 = false;
        if not v31.CurrentReference or v37 >= 0 then
            v31.TotalShift = v37;
            v39 = v31.Grouping;
            v31.Grouping = (v31.Grouping + 1) % 1000;
            v40 = true;
            v38 = true;
            v31.CurrentReference = 0;
        else
            v31.CurrentReference = v31.CurrentReference - v37;
        end;
        local v41 = nil;
        if v38 then
            if #v31.Cache > 0 then
                local v42 = v31.Cache[#v31.Cache][1] + 1;
                local v43 = 0;
                local v44 = {};
                v41 = {
                    v39, 
                    v44
                };
                for v45 = 1, #v31.Cache do
                    local v46 = v31.Cache[v45];
                    local v47 = (v42 - v46[1]) * v46[3];
                    v43 = v43 + (v46[5] + v46[4] + v47);
                    v44[v45] = {
                        v46[2], 
                        v47
                    };
                end;
                v43 = v43 / #v31.Cache;
                if not v31.ServerTimeOffset then
                    v31.ServerTimeOffset = v43;
                else
                    v31.ServerTimeOffset = v31.ServerTimeOffset * 0.98 + v43 * 0.02;
                end;
            end;
            v31.Cache = {};
        end;
        local v48 = #v31.Cache + 1;
        v31.Cache[v48] = {
            v31.CurrentReference, 
            v31.AverageFrameTime, 
            v34, 
            v33, 
            v32 - v35
        };
        return v35, v31.AverageFrameTime, v40, v31.Grouping, v48, v41;
    end;
else
    v0.PlayerAdded = function(v49, v50) --[[ Line: 168 ]] --[[ Name: PlayerAdded ]]
        v49.AverageDelays[v50] = 0;
        v49.PlayerCaches[v50] = {};
    end;
    v0.PlayerRemoving = function(v51, v52) --[[ Line: 173 ]] --[[ Name: PlayerRemoving ]]
        v51.AverageDelays[v52] = nil;
        v51.PlayerCaches[v52] = nil;
    end;
end;
v0.Initialize = function(v53) --[[ Line: 179 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RunService_0 (copy), v5 (copy), l_ClockSync_0 (copy), l_Players_0 (copy)
    v53.AverageFrameTime = 0.0167;
    v53.LastUpdate = tick();
    l_RunService_0.Heartbeat:Connect(function() --[[ Line: 183 ]]
        -- upvalues: v53 (copy)
        v53:Update();
    end);
    if v5 then
        v53.ServerTimeOffset = nil;
        v53.LastDelta = nil;
        v53.CurrentReference = nil;
        v53.Cache = {};
        v53.Grouping = 0;
        v53.TotalShift = 0;
        l_ClockSync_0.OnClientInvoke = function(...) --[[ Line: 196 ]] --[[ Name: OnClientInvoke ]]
            -- upvalues: v53 (copy)
            v53:InvokeSignal(...);
        end;
        return;
    else
        v53.AverageDelays = {};
        v53.PlayerCaches = {};
        l_Players_0.PlayerAdded:Connect(function(v54) --[[ Line: 203 ]]
            -- upvalues: v53 (copy)
            v53:PlayerAdded(v54);
        end);
        l_Players_0.PlayerRemoving:Connect(function(v55) --[[ Line: 207 ]]
            -- upvalues: v53 (copy)
            v53:PlayerRemoving(v55);
        end);
        return;
    end;
end;
return v0;