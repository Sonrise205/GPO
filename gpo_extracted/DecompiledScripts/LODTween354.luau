local l_RunService_0 = game:GetService("RunService");
local v1 = {
    ActiveTweens = {}, 
    LastUpdateTime = {}
};
local function _(v2, v3, v4, v5, v6) --[[ Line: 10 ]] --[[ Name: getLerpInterval ]]
    return v5 + (math.clamp(v2, v3, v4) - v3) / (v4 - v3) * (v6 - v5);
end;
v1.AddTween = function(_, v9, v10, v11, v12, v13) --[[ Line: 17 ]] --[[ Name: AddTween ]]
    -- upvalues: v1 (copy)
    if v9 == nil then
        return;
    else
        local l_CFrame_0 = v9.CFrame;
        local v15 = tick();
        v1.ActiveTweens[v9] = {
            part = v9, 
            targetCFrame = v10, 
            initialCFrame = l_CFrame_0, 
            duration = v11, 
            lodSettings = v12, 
            startTime = v15, 
            callback = v13
        };
        v1.LastUpdateTime[v9] = v15;
        return;
    end;
end;
l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 40 ]]
    -- upvalues: v1 (copy)
    local v17 = {};
    local v18 = {};
    local function _(v19, v20) --[[ Line: 46 ]] --[[ Name: queueCFrameUpdate ]]
        -- upvalues: v17 (copy), v18 (copy)
        table.insert(v17, v19);
        table.insert(v18, v20);
    end;
    local v22 = tick();
    local l_Position_0 = workspace.CurrentCamera.CFrame.Position;
    for v24, v25 in pairs(v1.ActiveTweens) do
        local v26 = v22 - v25.startTime;
        local v27 = v26 / v25.duration;
        if not v24 or not v24:IsDescendantOf(workspace) then
            v1.ActiveTweens[v24] = nil;
            v1.LastUpdateTime[v24] = nil;
        else
            local l_Magnitude_0 = (l_Position_0 - v24.Position).Magnitude;
            local l_minDistance_0 = v25.lodSettings.minDistance;
            local l_maxDistance_0 = v25.lodSettings.maxDistance;
            local l_minLerpInterval_0 = v25.lodSettings.minLerpInterval;
            local l_maxLerpInterval_0 = v25.lodSettings.maxLerpInterval;
            if l_minLerpInterval_0 + (math.clamp(l_Magnitude_0, l_minDistance_0, l_maxDistance_0) - l_minDistance_0) / (l_maxDistance_0 - l_minDistance_0) * (l_maxLerpInterval_0 - l_minLerpInterval_0) <= tick() - v1.LastUpdateTime[v24] then
                if v27 < 1 then
                    l_minDistance_0 = v26 / v25.duration;
                    l_maxDistance_0 = v25.initialCFrame:Lerp(v25.targetCFrame, l_minDistance_0);
                    table.insert(v17, v24);
                    table.insert(v18, l_maxDistance_0);
                    v1.LastUpdateTime[v24] = tick();
                else
                    l_minDistance_0 = v25.targetCFrame;
                    table.insert(v17, v24);
                    table.insert(v18, l_minDistance_0);
                    if v25.callback then
                        v25.callback();
                    end;
                    v1.ActiveTweens[v24] = nil;
                    v1.LastUpdateTime[v24] = nil;
                end;
            end;
        end;
    end;
    if #v17 > 0 then
        workspace:BulkMoveTo(v17, v18, Enum.BulkMoveMode.FireCFrameChanged);
    end;
end);
return v1;