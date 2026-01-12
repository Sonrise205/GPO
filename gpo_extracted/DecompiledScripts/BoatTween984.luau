--!native
local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_tick_0 = tick;
local l_typeof_0 = typeof;
local l_clamp_0 = math.clamp;
local l_clear_0 = table.clear;
local l_spawn_0 = task.spawn;
local l_wait_0 = task.wait;
local v9 = {
    Heartbeat = true, 
    Stepped = true, 
    RenderStepped = true
};
if not l_RunService_0:IsClient() then
    v9.RenderStepped = nil;
end;
local v10 = require(script.TweenFunctions);
local v11 = require(game.ReplicatedStorage.Modules.Trove);
local v12 = require(l_ReplicatedStorage_0.Modules.Shared.Signals.GoodSignal);
local v13 = {
    Linear = {
        In = v10.Linear, 
        Out = v10.Linear, 
        InOut = v10.Linear
    }, 
    Quad = {
        In = v10.InQuad, 
        Out = v10.OutQuad, 
        InOut = v10.InOutQuad
    }, 
    Cubic = {
        In = v10.InCubic, 
        Out = v10.OutCubic, 
        InOut = v10.InOutCubic
    }, 
    Quart = {
        In = v10.InQuart, 
        Out = v10.OutQuart, 
        InOut = v10.InOutQuart
    }, 
    Quint = {
        In = v10.InQuint, 
        Out = v10.OutQuint, 
        InOut = v10.InOutQuint
    }, 
    Sine = {
        In = v10.InSine, 
        Out = v10.OutSine, 
        InOut = v10.InOutSine
    }, 
    Exponential = {
        In = v10.InExponential, 
        Out = v10.OutExponential, 
        InOut = v10.InOutExponential
    }, 
    Expo = {
        In = v10.InExponential, 
        Out = v10.OutExponential, 
        InOut = v10.InOutExponential
    }, 
    Circular = {
        In = v10.InCircular, 
        Out = v10.OutCircular, 
        InOut = v10.InOutCircular
    }, 
    Elastic = {
        In = v10.InElastic, 
        Out = v10.OutElastic, 
        InOut = v10.InOutElastic
    }, 
    Back = {
        In = v10.InBack, 
        Out = v10.OutBack, 
        InOut = v10.InOutBack
    }, 
    Bounce = {
        In = v10.InBounce, 
        Out = v10.OutBounce, 
        InOut = v10.InOutBounce
    }, 
    Smooth = {
        In = v10.InSmooth, 
        Out = v10.OutSmooth, 
        InOut = v10.InOutSmooth
    }, 
    Smoother = {
        In = v10.InSmoother, 
        Out = v10.OutSmoother, 
        InOut = v10.InOutSmoother
    }, 
    RidiculousWiggle = {
        In = v10.InRidiculousWiggle, 
        Out = v10.OutRidiculousWiggle, 
        InOut = v10.InOutRidiculousWiggle
    }, 
    RevBack = {
        In = v10.InRevBack, 
        Out = v10.OutRevBack, 
        InOut = v10.InOutRevBack
    }, 
    Spring = {
        In = v10.InSpring, 
        Out = v10.OutSpring, 
        InOut = v10.InOutSpring
    }, 
    SoftSpring = {
        In = v10.InSoftSpring, 
        Out = v10.OutSoftSpring, 
        InOut = v10.InOutSoftSpring
    }, 
    Sharp = {
        In = v10.InSharp, 
        Out = v10.OutSharp, 
        InOut = v10.InOutSharp
    }, 
    Acceleration = {
        In = v10.InAcceleration, 
        Out = v10.OutAcceleration, 
        InOut = v10.InOutAcceleration
    }, 
    Standard = {
        In = v10.InStandard, 
        Out = v10.OutStandard, 
        InOut = v10.InOutStandard
    }, 
    Deceleration = {
        In = v10.InDeceleration, 
        Out = v10.OutDeceleration, 
        InOut = v10.InOutDeceleration
    }, 
    FabricStandard = {
        In = v10.InFabricStandard, 
        Out = v10.OutFabricStandard, 
        InOut = v10.InOutFabricStandard
    }, 
    FabricAccelerate = {
        In = v10.InFabricAccelerate, 
        Out = v10.OutFabricAccelerate, 
        InOut = v10.InOutFabricAccelerate
    }, 
    FabricDecelerate = {
        In = v10.InFabricDecelerate, 
        Out = v10.OutFabricDecelerate, 
        InOut = v10.InOutFabricDecelerate
    }, 
    UWPAccelerate = {
        In = v10.InUWPAccelerate, 
        Out = v10.OutUWPAccelerate, 
        InOut = v10.InOutUWPAccelerate
    }, 
    StandardProductive = {
        In = v10.InStandardProductive, 
        Out = v10.OutStandardProductive, 
        InOut = v10.InOutStandardProductive
    }, 
    EntranceProductive = {
        In = v10.InEntranceProductive, 
        Out = v10.OutEntranceProductive, 
        InOut = v10.InOutEntranceProductive
    }, 
    ExitProductive = {
        In = v10.InExitProductive, 
        Out = v10.OutExitProductive, 
        InOut = v10.InOutExitProductive
    }, 
    StandardExpressive = {
        In = v10.InStandardExpressive, 
        Out = v10.OutStandardExpressive, 
        InOut = v10.InOutStandardExpressive
    }, 
    EntranceExpressive = {
        In = v10.InEntranceExpressive, 
        Out = v10.OutEntranceExpressive, 
        InOut = v10.InOutEntranceExpressive
    }, 
    ExitExpressive = {
        In = v10.InExitExpressive, 
        Out = v10.OutExitExpressive, 
        InOut = v10.InOutExitExpressive
    }, 
    MozillaCurve = {
        In = v10.InMozillaCurve, 
        Out = v10.OutMozillaCurve, 
        InOut = v10.InOutMozillaCurve
    }
};
local v14 = require(script.Lerps);
v0.Create = function(_, v16, v17) --[[ Line: 199 ]] --[[ Name: Create ]]
    -- upvalues: l_typeof_0 (copy), v9 (copy), l_RunService_0 (copy), v13 (copy), l_clamp_0 (copy), v14 (copy), v11 (copy), v12 (copy), l_spawn_0 (copy), l_wait_0 (copy), l_tick_0 (copy), l_clear_0 (copy)
    if not v16 or l_typeof_0(v16) ~= "Instance" then
        error("Invalid object to tween:", v16);
        return;
    else
        v17 = type(v17) == "table" and v17 or {};
        local v18 = v9[v17.StepType] and l_RunService_0[v17.StepType] or l_RunService_0.Heartbeat;
        local v19 = v13[v17.EasingStyle or "Quad"][v17.EasingDirection or "In"];
        local v20 = l_clamp_0(type(v17.Time) == "number" and v17.Time or 1, 0, 9999999999);
        local v21 = 1 / v20;
        local v22 = type(v17.Goal) == "table" and v17.Goal or {};
        local v23 = false;
        if type(v17.DelayTime) == "number" then
            v23 = false;
            if v17.DelayTime > 0.027 then
                v23 = v17.DelayTime;
            end;
        end;
        local v24 = (type(v17.RepeatCount) == "number" and l_clamp_0(v17.RepeatCount, -1, 999999999) or 0) + 1;
        local l_CustomEventStepFreq_0 = v17.CustomEventStepFreq;
        local l_Reverses_0 = v17.Reverses;
        local v27 = {};
        local v28 = {};
        local v29 = 0;
        if v22.CustomEventStepFreq then
            v22.CustomEventStepFreq = nil;
        end;
        for v30, v31 in v22 do
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 229 ]]
                -- upvalues: v16 (copy), v30 (copy)
                return v16[v30];
            end);
            if not l_status_0 or l_result_0 == nil then
                error("Property '" .. v30 .. "' does not exist or is not accessible on " .. tostring(v16));
            end;
            v29 = v29 + 1;
            v27[v29] = v30;
            v28[v29] = v14[l_typeof_0(v31)](l_result_0, v31);
        end;
        local v34 = v11.new();
        local v35 = v34:Construct(v12);
        local v36 = v34:Construct(v12);
        local v37 = v34:Construct(v12);
        local v38 = nil;
        if l_CustomEventStepFreq_0 then
            v38 = v34:Construct(v12);
            v34:Add(l_spawn_0(function() --[[ Line: 255 ]]
                -- upvalues: l_wait_0 (ref), l_CustomEventStepFreq_0 (copy), v38 (ref)
                while l_wait_0(l_CustomEventStepFreq_0) do
                    v38:Fire();
                end;
            end));
        end;
        local v39 = nil;
        local v40 = l_tick_0();
        local v41 = 0;
        local v42 = {
            Instance = v16, 
            PlaybackState = Enum.PlaybackState.Begin, 
            Completed = v35, 
            Resumed = v37, 
            Stopped = v36
        };
        local v43 = false;
        local v44 = false;
        local function _() --[[ Line: 279 ]] --[[ Name: completed ]]
            -- upvalues: v43 (ref), v42 (copy), v35 (copy), v44 (ref)
            if v43 then
                return;
            else
                v43 = true;
                if v42 then
                    v42.PlaybackState = Enum.PlaybackState.Completed;
                end;
                if v35 then
                    v35:Fire();
                end;
                if not v44 and v42 and v42.Destroy then
                    v42:Destroy();
                end;
                return;
            end;
        end;
        v42.Destroy = function(_) --[[ Line: 298 ]] --[[ Name: Destroy ]]
            -- upvalues: v44 (ref), v34 (ref), v43 (ref), v39 (ref), v36 (copy), v37 (copy), v35 (copy), l_clear_0 (ref), v27 (copy), v28 (copy), v22 (copy), v42 (copy)
            if v44 then
                return;
            else
                v44 = true;
                if v34 == nil then
                    return;
                else
                    if not v43 then
                        v43 = true;
                    end;
                    if v39 then
                        v39:Disconnect();
                        v39 = nil;
                    end;
                    if v36 then
                        v36:DisconnectAll();
                    end;
                    if v37 then
                        v37:DisconnectAll();
                    end;
                    if v35 then
                        v35:DisconnectAll();
                    end;
                    v34:Destroy();
                    v34 = nil;
                    l_clear_0(v27);
                    l_clear_0(v28);
                    l_clear_0(v22);
                    l_clear_0(v42);
                    return;
                end;
            end;
        end;
        local l_Destroying_0 = v16.Destroying;
        v34:Connect(l_Destroying_0, function() --[[ Line: 336 ]]
            -- upvalues: v42 (copy)
            v42:Destroy();
        end);
        local v48 = false;
        local v49 = 0;
        l_Destroying_0 = function(v50, v51) --[[ Line: 343 ]] --[[ Name: Play ]]
            -- upvalues: v16 (copy), v43 (ref), v42 (copy), v35 (copy), v44 (ref), v24 (copy), v48 (ref), v49 (ref), v23 (copy), l_wait_0 (ref), v40 (ref), l_tick_0 (ref), v41 (ref), v38 (ref), v18 (ref), v39 (ref), v20 (copy), v29 (ref), v27 (copy), v28 (copy), l_Destroying_0 (copy), l_Reverses_0 (copy), v21 (copy), v19 (copy), v34 (ref)
            if v16 ~= nil and v16:IsDescendantOf(game) == false then
                if not v43 then
                    v43 = true;
                    if v42 then
                        v42.PlaybackState = Enum.PlaybackState.Completed;
                    end;
                    if v35 then
                        v35:Fire();
                    end;
                    if not v44 and v42 and v42.Destroy then
                        v42:Destroy();
                    end;
                end;
                return;
            else
                v50 = v50 or 1;
                if v24 ~= 0 and v24 < v50 then
                    if not v43 then
                        v43 = true;
                        if v42 then
                            v42.PlaybackState = Enum.PlaybackState.Completed;
                        end;
                        if v35 then
                            v35:Fire();
                        end;
                        if not v44 and v42 and v42.Destroy then
                            v42:Destroy();
                        end;
                    end;
                    v48 = false;
                    v49 = 1;
                    return;
                else
                    v49 = v50;
                    if v51 then
                        v48 = true;
                    end;
                    if v23 then
                        v42.PlaybackState = Enum.PlaybackState.Delayed;
                        l_wait_0(v23);
                    end;
                    v40 = l_tick_0() - v41;
                    if v38 then
                        v18 = v38;
                    end;
                    if v44 == true then
                        return;
                    else
                        v39 = v18:Connect(function() --[[ Line: 379 ]]
                            -- upvalues: v41 (ref), l_tick_0 (ref), v40 (ref), v20 (ref), v51 (copy), v29 (ref), v16 (ref), v27 (ref), v28 (ref), v39 (ref), l_Destroying_0 (ref), v50 (ref), l_Reverses_0 (ref), v21 (ref), v19 (ref)
                            v41 = l_tick_0() - v40;
                            if v20 <= v41 then
                                if v51 then
                                    for v52 = 1, v29 do
                                        v16[v27[v52]] = v28[v52](0);
                                    end;
                                else
                                    for v53 = 1, v29 do
                                        v16[v27[v53]] = v28[v53](1);
                                    end;
                                end;
                                v39:Disconnect();
                                v39 = nil;
                                v41 = 0;
                                if v51 then
                                    l_Destroying_0(v50 + 1, false);
                                    return;
                                elseif l_Reverses_0 then
                                    l_Destroying_0(v50, true);
                                    return;
                                else
                                    l_Destroying_0(v50 + 1, false);
                                    return;
                                end;
                            else
                                local v54 = v41 * v21;
                                local v55 = nil;
                                if v51 then
                                    v55 = v19(1 - v54);
                                    if v55 > 1 then
                                        v55 = 1;
                                    elseif v55 < 0 then
                                        v55 = 0;
                                    end;
                                    for v56 = 1, v29 do
                                        v16[v27[v56]] = v28[v56](v55);
                                    end;
                                    return;
                                else
                                    v55 = v19(v54);
                                    if v55 > 1 then
                                        v55 = 1;
                                    elseif v55 < 0 then
                                        v55 = 0;
                                    end;
                                    for v57 = 1, v29 do
                                        v16[v27[v57]] = v28[v57](v55);
                                    end;
                                    return;
                                end;
                            end;
                        end);
                        v42.PlaybackState = Enum.PlaybackState.Playing;
                        v34:Add(v39);
                        return;
                    end;
                end;
            end;
        end;
        v42.Play = function(_) --[[ Line: 441 ]] --[[ Name: Play ]]
            -- upvalues: v41 (ref), l_Destroying_0 (copy)
            v41 = 0;
            l_Destroying_0(1, false);
        end;
        v42.Stop = function(_) --[[ Line: 446 ]] --[[ Name: Stop ]]
            -- upvalues: v39 (ref), v42 (copy), v36 (copy)
            if v39 then
                v39:Disconnect();
                v39 = nil;
                v42.PlaybackState = Enum.PlaybackState.Cancelled;
                v36:Fire();
            end;
        end;
        v42.Resume = function(_) --[[ Line: 455 ]] --[[ Name: Resume ]]
            -- upvalues: l_Destroying_0 (copy), v49 (ref), v48 (ref), v37 (copy)
            l_Destroying_0(v49, v48);
            v37:Fire();
        end;
        return v42;
    end;
end;
return v0;