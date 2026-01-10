--!native
local l_RunService_0 = game:GetService("RunService");
local v1 = Random.new();
local v2 = 0;
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 230 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy), v1 (copy)
    local v4 = setmetatable({}, v3);
    v4.Amplitude = 1;
    v4.Frequency = 1;
    v4.FadeInTime = 1;
    v4.FadeOutTime = 1;
    v4.SustainTime = 0;
    v4.Sustain = false;
    v4.PositionInfluence = Vector3.new(1, 1, 1, 0);
    v4.RotationInfluence = Vector3.new(1, 1, 1, 0);
    v4.TimeFunction = if l_RunService_0:IsRunning() then time else os.clock;
    v4._timeOffset = v1:NextNumber(-1000000, 1000000);
    v4._startTime = 0;
    v4._running = false;
    v4._signalConnections = {};
    v4._renderBindings = {};
    return v4;
end;
v3.InverseSquare = function(v5, v6) --[[ Line: 281 ]] --[[ Name: InverseSquare ]]
    if v6 < 1 then
        v6 = 1;
    end;
    return v5 * (1 / (v6 * v6));
end;
v3.NextRenderName = function() --[[ Line: 297 ]] --[[ Name: NextRenderName ]]
    -- upvalues: v2 (ref)
    v2 = v2 + 1;
    return ("__shake_%.4i__"):format(v2);
end;
v3.Start = function(v7) --[[ Line: 310 ]] --[[ Name: Start ]]
    v7._startTime = v7.TimeFunction();
    v7._running = true;
end;
v3.Stop = function(v8) --[[ Line: 322 ]] --[[ Name: Stop ]]
    -- upvalues: l_RunService_0 (copy)
    v8._running = false;
    for _, v10 in v8._renderBindings do
        l_RunService_0:UnbindFromRenderStep(v10);
    end;
    table.clear(v8._renderBindings);
    for _, v12 in v8._signalConnections do
        v12:Disconnect();
    end;
    table.clear(v8._signalConnections);
end;
v3.IsShaking = function(v13) --[[ Line: 340 ]] --[[ Name: IsShaking ]]
    return v13._running;
end;
v3.StopSustain = function(v14) --[[ Line: 349 ]] --[[ Name: StopSustain ]]
    local v15 = v14.TimeFunction();
    v14.Sustain = false;
    v14.SustainTime = v15 - v14._startTime - v14.FadeInTime;
end;
v3.Update = function(v16) --[[ Line: 377 ]] --[[ Name: Update ]]
    local v17 = false;
    local v18 = v16.TimeFunction();
    local v19 = v18 - v16._startTime;
    local v20 = (v18 + v16._timeOffset) / v16.Frequency % 10000;
    local v21 = 1;
    local v22 = 1;
    if v19 < v16.FadeInTime then
        v21 = v19 / v16.FadeInTime;
    end;
    if not v16.Sustain and v16.FadeInTime + v16.SustainTime < v19 then
        if v16.FadeOutTime == 0 then
            v17 = true;
        else
            v22 = 1 - (v19 - v16.FadeInTime - v16.SustainTime) / v16.FadeOutTime;
            if not v16.Sustain and v16.FadeInTime + v16.SustainTime + v16.FadeOutTime <= v19 then
                v17 = true;
            end;
        end;
    end;
    local v23 = Vector3.new(math.noise(v20, 0) / 2, math.noise(0, v20) / 2, math.noise(v20, v20) / 2) * v16.Amplitude * math.min(v21, v22);
    if v17 then
        v16:Stop();
    end;
    return v16.PositionInfluence * v23, v16.RotationInfluence * v23, v17;
end;
v3.OnSignal = function(v24, v25, v26) --[[ Line: 435 ]] --[[ Name: OnSignal ]]
    local v27 = v25:Connect(function() --[[ Line: 436 ]]
        -- upvalues: v26 (copy), v24 (copy)
        v26(v24:Update());
    end);
    table.insert(v24._signalConnections, v27);
    return v27;
end;
v3.BindToRenderStep = function(v28, v29, v30, v31) --[[ Line: 465 ]] --[[ Name: BindToRenderStep ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0:BindToRenderStep(v29, v30, function() --[[ Line: 466 ]]
        -- upvalues: v31 (copy), v28 (copy)
        v31(v28:Update());
    end);
    table.insert(v28._renderBindings, v29);
end;
v3.Clone = function(v32) --[[ Line: 502 ]] --[[ Name: Clone ]]
    -- upvalues: v3 (copy)
    local v33 = v3.new();
    for _, v35 in {
        "Amplitude", 
        "Frequency", 
        "FadeInTime", 
        "FadeOutTime", 
        "SustainTime", 
        "Sustain", 
        "PositionInfluence", 
        "RotationInfluence", 
        "TimeFunction"
    } do
        v33[v35] = v32[v35];
    end;
    return v33;
end;
v3.Destroy = function(v36) --[[ Line: 524 ]] --[[ Name: Destroy ]]
    v36:Stop();
end;
return {
    new = v3.new, 
    InverseSquare = v3.InverseSquare, 
    NextRenderName = v3.NextRenderName
};