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
local v4 = {
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
local v5 = require(script.Lerps);
local v6 = {};
for _ = 1, 64 do
    local v8 = script.Actor:Clone();
    v8.Parent = script.AllActors;
    table.insert(v6, require(v8.Tween));
end;
v0.Create = function(_, v10, v11) --[[ Line: 277 ]] --[[ Name: Create ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy), v4 (copy), v5 (copy), v6 (copy)
    if not v10 or typeof(v10) ~= "Instance" then
        error("Invalid object to tween:", v10);
        return;
    else
        v11 = type(v11) == "table" and v11 or {};
        local v12 = v2[v11.StepType] and l_RunService_0[v11.StepType] or l_RunService_0.Heartbeat;
        local v13 = v4[v11.EasingStyle or "Quad"][v11.EasingDirection or "In"];
        local v14 = math.clamp(type(v11.Time) == "number" and v11.Time or 1, 0, 9999999999);
        local v15 = type(v11.Goal) == "table" and v11.Goal or {};
        local v16 = false;
        if type(v11.DelayTime) == "number" then
            v16 = false;
            if v11.DelayTime > 0.027 then
                v16 = v11.DelayTime;
            end;
        end;
        local v17 = (type(v11.RepeatCount) == "number" and math.clamp(v11.RepeatCount, -1, 999999999) or 0) + 1;
        local v18 = {};
        for v19, v20 in v15 do
            v18[v19] = v5[typeof(v20)](v10[v19], v20);
        end;
        local v21 = Instance.new("BindableEvent", script);
        v21.Name = "btCompleted";
        local v22 = Instance.new("BindableEvent", script);
        v22.Name = "btStopped";
        local v23 = Instance.new("BindableEvent", script);
        v23.Name = "btResume";
        local v24 = nil;
        local v25 = nil;
        local v26 = tick();
        local v27 = 0;
        local v28 = {
            Instance = v10, 
            PlaybackState = Enum.PlaybackState.Begin, 
            Completed = v21.Event, 
            Resumed = v23.Event, 
            Stopped = v22.Event
        };
        v28.Destroy = function(_) --[[ Line: 321 ]] --[[ Name: Destroy ]]
            -- upvalues: v24 (ref), v25 (ref), v21 (ref), v22 (ref), v23 (ref), v28 (copy), v10 (ref)
            if v24 then
                v24:Disconnect();
                v24 = nil;
            end;
            if v25 then
                v25:Disconnect();
                v25 = nil;
            end;
            v21:Destroy();
            v22:Destroy();
            v23:Destroy();
            v21 = nil;
            v22 = nil;
            v23 = nil;
            table.clear(v28);
            v10 = nil;
        end;
        v25 = v10.Destroying:Connect(function() --[[ Line: 340 ]]
            -- upvalues: v28 (copy)
            v28.PlaybackState = Enum.PlaybackState.Completed;
            v28:Destroy();
        end);
        local v30 = false;
        local v31 = 0;
        local _ = v5;
        local function v33(v34, v35) --[[ Line: 352 ]] --[[ Name: Play ]]
            -- upvalues: v10 (ref), v28 (copy), v21 (ref), v17 (copy), v30 (ref), v31 (ref), v16 (copy), v26 (ref), v27 (ref), v24 (ref), v12 (copy), v14 (copy), v18 (copy), v33 (copy), v11 (ref), v6 (ref), v13 (copy)
            if v10 ~= nil and v10:IsDescendantOf(game) == false then
                v28.PlaybackState = Enum.PlaybackState.Completed;
                v21:Fire();
                return;
            else
                v34 = v34 or 1;
                if v17 ~= 0 and v17 < v34 then
                    v28.PlaybackState = Enum.PlaybackState.Completed;
                    v21:Fire();
                    v30 = false;
                    v31 = 1;
                    return;
                else
                    v31 = v34;
                    if v35 then
                        v30 = true;
                    end;
                    if v16 then
                        v28.PlaybackState = Enum.PlaybackState.Delayed;
                        task.wait(v16);
                    end;
                    v26 = tick() - v27;
                    local v36 = game:GetService("HttpService"):GenerateGUID();
                    local _ = "BoatTween" .. v10:GetFullName() .. v36;
                    local _ = tick();
                    v24 = v12:Connect(function() --[[ Line: 383 ]]
                        -- upvalues: v27 (ref), v26 (ref), v14 (ref), v35 (copy), v18 (ref), v10 (ref), v24 (ref), v33 (ref), v34 (ref), v11 (ref), v6 (ref), v13 (ref)
                        v27 = tick() - v26;
                        if v14 <= v27 then
                            if v35 then
                                for v39, v40 in v18 do
                                    v10[v39] = v40(0);
                                end;
                            else
                                for v41, v42 in v18 do
                                    v10[v41] = v42(1);
                                end;
                            end;
                            v24:Disconnect();
                            v24 = nil;
                            if v35 then
                                v27 = 0;
                                v33(v34 + 1, false);
                                return;
                            elseif v11.Reverses then
                                v27 = 0;
                                v33(v34, true);
                                return;
                            else
                                v27 = 0;
                                v33(v34 + 1, false);
                                return;
                            end;
                        elseif v35 then
                            v6[math.random(1, 64)](v10, v18, v13, 1 - v27 / v14);
                            return;
                        else
                            v6[math.random(1, 64)](v10, v18, v13, v27 / v14);
                            return;
                        end;
                    end);
                    v28.PlaybackState = Enum.PlaybackState.Playing;
                    return;
                end;
            end;
        end;
        v28.Play = function(_) --[[ Line: 421 ]] --[[ Name: Play ]]
            -- upvalues: v27 (ref), v33 (copy)
            v27 = 0;
            v33(1, false);
        end;
        v28.Stop = function(_) --[[ Line: 426 ]] --[[ Name: Stop ]]
            -- upvalues: v24 (ref), v28 (copy), v22 (ref)
            if v24 then
                v24:Disconnect();
                v24 = nil;
                v28.PlaybackState = Enum.PlaybackState.Cancelled;
                v22:Fire();
            end;
        end;
        v28.Resume = function(_) --[[ Line: 435 ]] --[[ Name: Resume ]]
            -- upvalues: v33 (copy), v31 (ref), v30 (ref), v23 (ref)
            v33(v31, v30);
            v23:Fire();
        end;
        return v28;
    end;
end;
return v0;