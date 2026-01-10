local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local v2 = {
    Heartbeat = true, 
    Stepped = true, 
    RenderStepped = true
};
if not l_RunService_0:IsClient() then
    v2.RenderStepped = nil;
end;
local v3 = require(script.TweenFunctions);
local v4 = require(game.ReplicatedStorage.Modules.Trove);
local v5 = {
    Linear = {
        In = v3.Linear, 
        Out = v3.Linear, 
        InOut = v3.Linear
    }, 
    Quad = {
        In = v3.InQuad, 
        Out = v3.OutQuad, 
        InOut = v3.InOutQuad
    }, 
    Cubic = {
        In = v3.InCubic, 
        Out = v3.OutCubic, 
        InOut = v3.InOutCubic
    }, 
    Quart = {
        In = v3.InQuart, 
        Out = v3.OutQuart, 
        InOut = v3.InOutQuart
    }, 
    Quint = {
        In = v3.InQuint, 
        Out = v3.OutQuint, 
        InOut = v3.InOutQuint
    }, 
    Sine = {
        In = v3.InSine, 
        Out = v3.OutSine, 
        InOut = v3.InOutSine
    }, 
    Exponential = {
        In = v3.InExponential, 
        Out = v3.OutExponential, 
        InOut = v3.InOutExponential
    }, 
    Circular = {
        In = v3.InCircular, 
        Out = v3.OutCircular, 
        InOut = v3.InOutCircular
    }, 
    Elastic = {
        In = v3.InElastic, 
        Out = v3.OutElastic, 
        InOut = v3.InOutElastic
    }, 
    Back = {
        In = v3.InBack, 
        Out = v3.OutBack, 
        InOut = v3.InOutBack
    }, 
    Bounce = {
        In = v3.InBounce, 
        Out = v3.OutBounce, 
        InOut = v3.InOutBounce
    }, 
    Smooth = {
        In = v3.InSmooth, 
        Out = v3.OutSmooth, 
        InOut = v3.InOutSmooth
    }, 
    Smoother = {
        In = v3.InSmoother, 
        Out = v3.OutSmoother, 
        InOut = v3.InOutSmoother
    }, 
    RidiculousWiggle = {
        In = v3.InRidiculousWiggle, 
        Out = v3.OutRidiculousWiggle, 
        InOut = v3.InOutRidiculousWiggle
    }, 
    RevBack = {
        In = v3.InRevBack, 
        Out = v3.OutRevBack, 
        InOut = v3.InOutRevBack
    }, 
    Spring = {
        In = v3.InSpring, 
        Out = v3.OutSpring, 
        InOut = v3.InOutSpring
    }, 
    SoftSpring = {
        In = v3.InSoftSpring, 
        Out = v3.OutSoftSpring, 
        InOut = v3.InOutSoftSpring
    }, 
    Sharp = {
        In = v3.InSharp, 
        Out = v3.OutSharp, 
        InOut = v3.InOutSharp
    }, 
    Acceleration = {
        In = v3.InAcceleration, 
        Out = v3.OutAcceleration, 
        InOut = v3.InOutAcceleration
    }, 
    Standard = {
        In = v3.InStandard, 
        Out = v3.OutStandard, 
        InOut = v3.InOutStandard
    }, 
    Deceleration = {
        In = v3.InDeceleration, 
        Out = v3.OutDeceleration, 
        InOut = v3.InOutDeceleration
    }, 
    FabricStandard = {
        In = v3.InFabricStandard, 
        Out = v3.OutFabricStandard, 
        InOut = v3.InOutFabricStandard
    }, 
    FabricAccelerate = {
        In = v3.InFabricAccelerate, 
        Out = v3.OutFabricAccelerate, 
        InOut = v3.InOutFabricAccelerate
    }, 
    FabricDecelerate = {
        In = v3.InFabricDecelerate, 
        Out = v3.OutFabricDecelerate, 
        InOut = v3.InOutFabricDecelerate
    }, 
    UWPAccelerate = {
        In = v3.InUWPAccelerate, 
        Out = v3.OutUWPAccelerate, 
        InOut = v3.InOutUWPAccelerate
    }, 
    StandardProductive = {
        In = v3.InStandardProductive, 
        Out = v3.OutStandardProductive, 
        InOut = v3.InOutStandardProductive
    }, 
    EntranceProductive = {
        In = v3.InEntranceProductive, 
        Out = v3.OutEntranceProductive, 
        InOut = v3.InOutEntranceProductive
    }, 
    ExitProductive = {
        In = v3.InExitProductive, 
        Out = v3.OutExitProductive, 
        InOut = v3.InOutExitProductive
    }, 
    StandardExpressive = {
        In = v3.InStandardExpressive, 
        Out = v3.OutStandardExpressive, 
        InOut = v3.InOutStandardExpressive
    }, 
    EntranceExpressive = {
        In = v3.InEntranceExpressive, 
        Out = v3.OutEntranceExpressive, 
        InOut = v3.InOutEntranceExpressive
    }, 
    ExitExpressive = {
        In = v3.InExitExpressive, 
        Out = v3.OutExitExpressive, 
        InOut = v3.InOutExitExpressive
    }, 
    MozillaCurve = {
        In = v3.InMozillaCurve, 
        Out = v3.OutMozillaCurve, 
        InOut = v3.InOutMozillaCurve
    }
};
local v6 = require(script.Lerps);
v0.Create = function(_, v8, v9) --[[ Line: 181 ]] --[[ Name: Create ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy), v5 (copy), v6 (copy), v4 (copy)
    if not v8 or typeof(v8) ~= "Instance" then
        error("Invalid object to tween:", v8);
        return;
    else
        v9 = type(v9) == "table" and v9 or {};
        local v10 = v2[v9.StepType] and l_RunService_0[v9.StepType] or l_RunService_0.Heartbeat;
        local v11 = v5[v9.EasingStyle or "Quad"][v9.EasingDirection or "In"];
        local v12 = math.clamp(type(v9.Time) == "number" and v9.Time or 1, 0, 9999999999);
        local v13 = type(v9.Goal) == "table" and v9.Goal or {};
        local v14 = false;
        if type(v9.DelayTime) == "number" then
            v14 = false;
            if v9.DelayTime > 0.027 then
                v14 = v9.DelayTime;
            end;
        end;
        local v15 = (type(v9.RepeatCount) == "number" and math.clamp(v9.RepeatCount, -1, 999999999) or 0) + 1;
        local l_CustomEventStepFreq_0 = v9.CustomEventStepFreq;
        local v17 = {};
        if v13.CustomEventStepFreq then
            v13.CustomEventStepFreq = nil;
        end;
        for v18, v19 in v13 do
            v17[v18] = v6[typeof(v19)](v8[v18], v19);
        end;
        local v20 = v4.new();
        local v21 = Instance.new("BindableEvent", script);
        v21.Name = "btCompleted";
        local v22 = Instance.new("BindableEvent", script);
        v22.Name = "btStopped";
        local v23 = Instance.new("BindableEvent", script);
        v23.Name = "btResume";
        local v24 = nil;
        if l_CustomEventStepFreq_0 then
            v24 = Instance.new("BindableEvent", script);
            v24.Name = "CustomEventStepFreq";
            v20:Add(task.spawn(function() --[[ Line: 228 ]]
                -- upvalues: l_CustomEventStepFreq_0 (copy), v24 (ref)
                while task.wait(l_CustomEventStepFreq_0) do
                    v24:Fire();
                end;
            end));
            v20:Add(v24);
        end;
        local v25 = nil;
        local v26 = tick();
        local v27 = 0;
        local v28 = {
            Instance = v8, 
            PlaybackState = Enum.PlaybackState.Begin, 
            Completed = v21.Event, 
            Resumed = v23.Event, 
            Stopped = v22.Event
        };
        local v29 = false;
        local function _() --[[ Line: 251 ]] --[[ Name: completed ]]
            -- upvalues: v29 (ref), v28 (ref), v21 (ref)
            if v29 == true then
                return;
            else
                v29 = true;
                if v28 then
                    v28.PlaybackState = Enum.PlaybackState.Completed;
                end;
                if v21 then
                    v21:Fire();
                    if v21 then
                        v21:Destroy();
                    end;
                    v21 = nil;
                end;
                if v28 then
                    v28:Destroy();
                end;
                return;
            end;
        end;
        v20:Add(v21);
        v20:Add(v22);
        v20:Add(v23);
        v28.Destroy = function(_) --[[ Line: 278 ]] --[[ Name: Destroy ]]
            -- upvalues: v29 (ref), v28 (ref), v21 (ref), v20 (ref), v17 (copy), v13 (copy)
            if v29 ~= true then
                v29 = true;
                if v28 then
                    v28.PlaybackState = Enum.PlaybackState.Completed;
                end;
                if v21 then
                    v21:Fire();
                    if v21 then
                        v21:Destroy();
                    end;
                    v21 = nil;
                end;
                if v28 then
                    v28:Destroy();
                end;
            end;
            if v20 == nil then
                return;
            else
                v20:Destroy();
                table.clear(v17);
                table.clear(v13);
                table.clear(v28);
                v28 = nil;
                v20 = nil;
                return;
            end;
        end;
        local l_Destroying_0 = v8.Destroying;
        v20:Connect(l_Destroying_0, function() --[[ Line: 292 ]]
            -- upvalues: v28 (ref)
            v28:Destroy();
        end);
        local v33 = false;
        local v34 = 0;
        l_Destroying_0 = v6;
        local function v35(v36, v37) --[[ Line: 301 ]] --[[ Name: Play ]]
            -- upvalues: v8 (copy), v29 (ref), v28 (ref), v21 (ref), v15 (copy), v33 (ref), v34 (ref), v14 (copy), v26 (ref), v27 (ref), v24 (ref), v10 (ref), v25 (ref), v12 (copy), v17 (copy), v35 (copy), v9 (ref), v11 (copy), v20 (ref)
            if v8 ~= nil and v8:IsDescendantOf(game) == false then
                if v29 ~= true then
                    v29 = true;
                    if v28 then
                        v28.PlaybackState = Enum.PlaybackState.Completed;
                    end;
                    if v21 then
                        v21:Fire();
                        if v21 then
                            v21:Destroy();
                        end;
                        v21 = nil;
                    end;
                    if v28 then
                        v28:Destroy();
                    end;
                end;
                return;
            else
                v36 = v36 or 1;
                if v15 ~= 0 and v15 < v36 then
                    if v29 ~= true then
                        v29 = true;
                        if v28 then
                            v28.PlaybackState = Enum.PlaybackState.Completed;
                        end;
                        if v21 then
                            v21:Fire();
                            if v21 then
                                v21:Destroy();
                            end;
                            v21 = nil;
                        end;
                        if v28 then
                            v28:Destroy();
                        end;
                    end;
                    v33 = false;
                    v34 = 1;
                    return;
                else
                    v34 = v36;
                    if v37 then
                        v33 = true;
                    end;
                    if v14 then
                        v28.PlaybackState = Enum.PlaybackState.Delayed;
                        task.wait(v14);
                    end;
                    v26 = tick() - v27;
                    local v38 = game:GetService("HttpService"):GenerateGUID();
                    local _ = "BoatTween" .. v8:GetFullName() .. v38;
                    local _ = tick();
                    if v24 then
                        v10 = v24.Event;
                    end;
                    v25 = v10:Connect(function() --[[ Line: 336 ]]
                        -- upvalues: v27 (ref), v26 (ref), v12 (ref), v37 (copy), v17 (ref), v8 (ref), v25 (ref), v35 (ref), v36 (ref), v9 (ref), v11 (ref)
                        v27 = tick() - v26;
                        local _, _ = pcall(function() --[[ Line: 338 ]]
                            -- upvalues: v27 (ref), v12 (ref), v37 (ref), v17 (ref), v8 (ref), v25 (ref), v35 (ref), v36 (ref), v9 (ref), v11 (ref)
                            if v12 <= v27 then
                                if v37 then
                                    for v41, v42 in v17 do
                                        v8[v41] = v42(0);
                                    end;
                                else
                                    for v43, v44 in v17 do
                                        v8[v43] = v44(1);
                                    end;
                                end;
                                v25:Disconnect();
                                v25 = nil;
                                if v37 then
                                    v27 = 0;
                                    v35(v36 + 1, false);
                                    return;
                                elseif v9.Reverses then
                                    v27 = 0;
                                    v35(v36, true);
                                    return;
                                else
                                    v27 = 0;
                                    v35(v36 + 1, false);
                                    return;
                                end;
                            elseif v37 then
                                for v45, v46 in v17 do
                                    v8[v45] = v46((math.clamp(v11(1 - v27 / v12), 0, 1)));
                                end;
                                return;
                            else
                                for v47, v48 in v17 do
                                    v8[v47] = v48((math.clamp(v11(v27 / v12), 0, 1)));
                                end;
                                return;
                            end;
                        end);
                    end);
                    v28.PlaybackState = Enum.PlaybackState.Playing;
                    v20:Add(v25);
                    return;
                end;
            end;
        end;
        v28.Play = function(_) --[[ Line: 380 ]] --[[ Name: Play ]]
            -- upvalues: v27 (ref), v35 (copy)
            v27 = 0;
            v35(1, false);
        end;
        v28.Stop = function(_) --[[ Line: 385 ]] --[[ Name: Stop ]]
            -- upvalues: v25 (ref), v28 (ref), v22 (copy)
            if v25 then
                v25:Disconnect();
                v25 = nil;
                v28.PlaybackState = Enum.PlaybackState.Cancelled;
                v22:Fire();
            end;
        end;
        v28.Resume = function(_) --[[ Line: 394 ]] --[[ Name: Resume ]]
            -- upvalues: v35 (copy), v34 (ref), v33 (ref), v23 (copy)
            v35(v34, v33);
            v23:Fire();
        end;
        return v28;
    end;
end;
return v0;