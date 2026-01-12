local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.TweenFunctions);
local v2 = require(script.Lerps);
local l_Heartbeat_0 = l_RunService_0.Heartbeat;
local v4 = {};
local v5 = {
    Heartbeat = true, 
    Stepped = true, 
    RenderStepped = true
};
if not l_RunService_0:IsClient() then
    v5.RenderStepped = nil;
end;
local v6 = {
    FabricAccelerate = {
        In = v1.InFabricAccelerate, 
        Out = v1.OutFabricAccelerate, 
        InOut = v1.InOutFabricAccelerate, 
        OutIn = v1.OutInFabricAccelerate
    }, 
    UWPAccelerate = {
        In = v1.InUWPAccelerate, 
        Out = v1.OutUWPAccelerate, 
        InOut = v1.InOutUWPAccelerate, 
        OutIn = v1.OutInUWPAccelerate
    }, 
    Circ = {
        In = v1.InCirc, 
        Out = v1.OutCirc, 
        InOut = v1.InOutCirc, 
        OutIn = v1.OutInCirc
    }, 
    RevBack = {
        In = v1.InRevBack, 
        Out = v1.OutRevBack, 
        InOut = v1.InOutRevBack, 
        OutIn = v1.OutInRevBack
    }, 
    Spring = {
        In = v1.InSpring, 
        Out = v1.OutSpring, 
        InOut = v1.InOutSpring, 
        OutIn = v1.OutInSpring
    }, 
    Standard = {
        In = v1.InStandard, 
        Out = v1.OutStandard, 
        InOut = v1.InOutStandard, 
        OutIn = v1.OutInStandard
    }, 
    StandardExpressive = {
        In = v1.InStandardExpressive, 
        Out = v1.OutStandardExpressive, 
        InOut = v1.InOutStandardExpressive, 
        OutIn = v1.OutInStandardExpressive
    }, 
    Linear = {
        In = v1.InLinear, 
        Out = v1.OutLinear, 
        InOut = v1.InOutLinear, 
        OutIn = v1.OutInLinear
    }, 
    ExitProductive = {
        In = v1.InExitProductive, 
        Out = v1.OutExitProductive, 
        InOut = v1.InOutExitProductive, 
        OutIn = v1.OutInExitProductive
    }, 
    Deceleration = {
        In = v1.InDeceleration, 
        Out = v1.OutDeceleration, 
        InOut = v1.InOutDeceleration, 
        OutIn = v1.OutInDeceleration
    }, 
    Smoother = {
        In = v1.InSmoother, 
        Out = v1.OutSmoother, 
        InOut = v1.InOutSmoother, 
        OutIn = v1.OutInSmoother
    }, 
    FabricStandard = {
        In = v1.InFabricStandard, 
        Out = v1.OutFabricStandard, 
        InOut = v1.InOutFabricStandard, 
        OutIn = v1.OutInFabricStandard
    }, 
    RidiculousWiggle = {
        In = v1.InRidiculousWiggle, 
        Out = v1.OutRidiculousWiggle, 
        InOut = v1.InOutRidiculousWiggle, 
        OutIn = v1.OutInRidiculousWiggle
    }, 
    MozillaCurve = {
        In = v1.InMozillaCurve, 
        Out = v1.OutMozillaCurve, 
        InOut = v1.InOutMozillaCurve, 
        OutIn = v1.OutInMozillaCurve
    }, 
    Expo = {
        In = v1.InExpo, 
        Out = v1.OutExpo, 
        InOut = v1.InOutExpo, 
        OutIn = v1.OutInExpo
    }, 
    Sine = {
        In = v1.InSine, 
        Out = v1.OutSine, 
        InOut = v1.InOutSine, 
        OutIn = v1.OutInSine
    }, 
    Cubic = {
        In = v1.InCubic, 
        Out = v1.OutCubic, 
        InOut = v1.InOutCubic, 
        OutIn = v1.OutInCubic
    }, 
    EntranceExpressive = {
        In = v1.InEntranceExpressive, 
        Out = v1.OutEntranceExpressive, 
        InOut = v1.InOutEntranceExpressive, 
        OutIn = v1.OutInEntranceExpressive
    }, 
    Elastic = {
        In = v1.InElastic, 
        Out = v1.OutElastic, 
        InOut = v1.InOutElastic, 
        OutIn = v1.OutInElastic
    }, 
    Quint = {
        In = v1.InQuint, 
        Out = v1.OutQuint, 
        InOut = v1.InOutQuint, 
        OutIn = v1.OutInQuint
    }, 
    EntranceProductive = {
        In = v1.InEntranceProductive, 
        Out = v1.OutEntranceProductive, 
        InOut = v1.InOutEntranceProductive, 
        OutIn = v1.OutInEntranceProductive
    }, 
    Bounce = {
        In = v1.InBounce, 
        Out = v1.OutBounce, 
        InOut = v1.InOutBounce, 
        OutIn = v1.OutInBounce
    }, 
    Smooth = {
        In = v1.InSmooth, 
        Out = v1.OutSmooth, 
        InOut = v1.InOutSmooth, 
        OutIn = v1.OutInSmooth
    }, 
    Back = {
        In = v1.InBack, 
        Out = v1.OutBack, 
        InOut = v1.InOutBack, 
        OutIn = v1.OutInBack
    }, 
    Quart = {
        In = v1.InQuart, 
        Out = v1.OutQuart, 
        InOut = v1.InOutQuart, 
        OutIn = v1.OutInQuart
    }, 
    StandardProductive = {
        In = v1.InStandardProductive, 
        Out = v1.OutStandardProductive, 
        InOut = v1.InOutStandardProductive, 
        OutIn = v1.OutInStandardProductive
    }, 
    Quad = {
        In = v1.InQuad, 
        Out = v1.OutQuad, 
        InOut = v1.InOutQuad, 
        OutIn = v1.OutInQuad
    }, 
    FabricDecelerate = {
        In = v1.InFabricDecelerate, 
        Out = v1.OutFabricDecelerate, 
        InOut = v1.InOutFabricDecelerate, 
        OutIn = v1.OutInFabricDecelerate
    }, 
    Acceleration = {
        In = v1.InAcceleration, 
        Out = v1.OutAcceleration, 
        InOut = v1.InOutAcceleration, 
        OutIn = v1.OutInAcceleration
    }, 
    SoftSpring = {
        In = v1.InSoftSpring, 
        Out = v1.OutSoftSpring, 
        InOut = v1.InOutSoftSpring, 
        OutIn = v1.OutInSoftSpring
    }, 
    ExitExpressive = {
        In = v1.InExitExpressive, 
        Out = v1.OutExitExpressive, 
        InOut = v1.InOutExitExpressive, 
        OutIn = v1.OutInExitExpressive
    }, 
    Sharp = {
        In = v1.InSharp, 
        Out = v1.OutSharp, 
        InOut = v1.InOutSharp, 
        OutIn = v1.OutInSharp
    }
};
local function v9(v7) --[[ Line: 316 ]] --[[ Name: Wait ]]
    -- upvalues: l_Heartbeat_0 (copy)
    v7 = math.max(v7 or 0.03, 0);
    local l_v7_0 = v7;
    while l_v7_0 > 0 do
        l_v7_0 = l_v7_0 - l_Heartbeat_0:Wait();
    end;
    return v7 - l_v7_0;
end;
v4.Create = function(_, v11, v12) --[[ Line: 327 ]] --[[ Name: Create ]]
    -- upvalues: v5 (copy), l_RunService_0 (copy), v6 (copy), v2 (copy), v9 (copy)
    if not v11 or typeof(v11) ~= "Instance" then
        return warn("Invalid object to tween:", v11);
    else
        v12 = type(v12) == "table" and v12 or {};
        local v13 = v5[v12.StepType] and l_RunService_0[v12.StepType] or l_RunService_0.Stepped;
        local v14 = v6[v12.EasingStyle or "Quad"][v12.EasingDirection or "In"];
        local v15 = math.max(type(v12.Time) == "number" and v12.Time or 1, 0.001);
        local v16 = type(v12.Goal) == "table" and v12.Goal or {};
        local v17 = false;
        if type(v12.DelayTime) == "number" then
            v17 = false;
            if v12.DelayTime > 0.027 then
                v17 = v12.DelayTime;
            end;
        end;
        local v18 = (type(v12.RepeatCount) == "number" and math.max(v12.RepeatCount, -1) or 0) + 1;
        local v19 = {};
        for v20, v21 in pairs(v16) do
            v19[v20] = v2[typeof(v21)](v11[v20], v21);
        end;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        local v25 = nil;
        local v26 = os.clock();
        local v27 = 0;
        local v28 = {
            Instance = v11, 
            PlaybackState = Enum.PlaybackState.Begin, 
            Completed = l_BindableEvent_0.Event, 
            Resumed = l_BindableEvent_2.Event, 
            Stopped = l_BindableEvent_1.Event
        };
        v28.Destroy = function() --[[ Line: 365 ]] --[[ Name: Destroy ]]
            -- upvalues: v25 (ref), l_BindableEvent_0 (copy), l_BindableEvent_1 (copy), l_BindableEvent_2 (copy), v28 (ref)
            if v25 then
                v25:Disconnect();
                v25 = nil;
            end;
            l_BindableEvent_0:Destroy();
            l_BindableEvent_1:Destroy();
            l_BindableEvent_2:Destroy();
            v28 = nil;
        end;
        local v29 = false;
        local v30 = 0;
        local function v31(v32, v33) --[[ Line: 380 ]] --[[ Name: Play ]]
            -- upvalues: v25 (ref), v18 (copy), v28 (ref), l_BindableEvent_0 (copy), v29 (ref), v30 (ref), v17 (copy), v9 (ref), v26 (ref), v27 (ref), v13 (copy), v15 (copy), v19 (copy), v11 (copy), v31 (copy), v12 (ref), v14 (copy)
            if v25 then
                v25:Disconnect();
                v25 = nil;
            end;
            v32 = v32 or 1;
            if v18 ~= 0 and v18 < v32 then
                v28.PlaybackState = Enum.PlaybackState.Completed;
                l_BindableEvent_0:Fire();
                v29 = false;
                v30 = 1;
                return;
            else
                v30 = v32;
                if v33 then
                    v29 = true;
                end;
                if v17 then
                    v28.PlaybackState = Enum.PlaybackState.Delayed;
                    (v17 < 2 and v9 or wait)(v17);
                end;
                v26 = os.clock() - v27;
                v25 = v13:Connect(function() --[[ Line: 409 ]]
                    -- upvalues: v27 (ref), v26 (ref), v15 (ref), v33 (copy), v19 (ref), v11 (ref), v25 (ref), v31 (ref), v32 (ref), v12 (ref), v14 (ref)
                    v27 = os.clock() - v26;
                    if v15 <= v27 then
                        if v33 then
                            for v34, v35 in pairs(v19) do
                                v11[v34] = v35(0);
                            end;
                        else
                            for v36, v37 in pairs(v19) do
                                v11[v36] = v37(1);
                            end;
                        end;
                        v25:Disconnect();
                        v25 = nil;
                        if v33 then
                            v27 = 0;
                            v31(v32 + 1, false);
                            return;
                        elseif v12.Reverses then
                            v27 = 0;
                            v31(v32, true);
                            return;
                        else
                            v27 = 0;
                            v31(v32 + 1, false);
                            return;
                        end;
                    else
                        local v38 = v33 and 1 - v27 / v15 or v27 / v15;
                        local v39 = math.clamp(v14(v38), 0, 1);
                        for v40, v41 in pairs(v19) do
                            v11[v40] = v41(v39);
                        end;
                        return;
                    end;
                end);
                v28.PlaybackState = Enum.PlaybackState.Playing;
                return;
            end;
        end;
        v28.Play = function() --[[ Line: 449 ]] --[[ Name: Play ]]
            -- upvalues: v27 (ref), v31 (copy)
            v27 = 0;
            v31(1, false);
        end;
        v28.Stop = function() --[[ Line: 454 ]] --[[ Name: Stop ]]
            -- upvalues: v25 (ref), v28 (ref), l_BindableEvent_1 (copy)
            if v25 then
                v25:Disconnect();
                v25 = nil;
                v28.PlaybackState = Enum.PlaybackState.Cancelled;
                l_BindableEvent_1:Fire();
            end;
        end;
        v28.Resume = function() --[[ Line: 463 ]] --[[ Name: Resume ]]
            -- upvalues: v31 (copy), v30 (ref), v29 (ref), l_BindableEvent_2 (copy)
            v31(v30, v29);
            l_BindableEvent_2:Fire();
        end;
        return v28;
    end;
end;
return v4;