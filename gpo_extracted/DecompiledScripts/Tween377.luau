local _ = {};
local v1 = require(game.ReplicatedStorage.Modules.BoatTween.TweenFunctions);
local _ = {
    Linear = {
        In = v1.Linear, 
        Out = v1.Linear, 
        InOut = v1.Linear
    }, 
    Quad = {
        In = v1.InQuad, 
        Out = v1.OutQuad, 
        InOut = v1.InOutQuad
    }, 
    Cubic = {
        In = v1.InCubic, 
        Out = v1.OutCubic, 
        InOut = v1.InOutCubic
    }, 
    Quart = {
        In = v1.InQuart, 
        Out = v1.OutQuart, 
        InOut = v1.InOutQuart
    }, 
    Quint = {
        In = v1.InQuint, 
        Out = v1.OutQuint, 
        InOut = v1.InOutQuint
    }, 
    Sine = {
        In = v1.InSine, 
        Out = v1.OutSine, 
        InOut = v1.InOutSine
    }, 
    Exponential = {
        In = v1.InExponential, 
        Out = v1.OutExponential, 
        InOut = v1.InOutExponential
    }, 
    Circular = {
        In = v1.InCircular, 
        Out = v1.OutCircular, 
        InOut = v1.InOutCircular
    }, 
    Elastic = {
        In = v1.InElastic, 
        Out = v1.OutElastic, 
        InOut = v1.InOutElastic
    }, 
    Back = {
        In = v1.InBack, 
        Out = v1.OutBack, 
        InOut = v1.InOutBack
    }, 
    Bounce = {
        In = v1.InBounce, 
        Out = v1.OutBounce, 
        InOut = v1.InOutBounce
    }, 
    Smooth = {
        In = v1.InSmooth, 
        Out = v1.OutSmooth, 
        InOut = v1.InOutSmooth
    }, 
    Smoother = {
        In = v1.InSmoother, 
        Out = v1.OutSmoother, 
        InOut = v1.InOutSmoother
    }, 
    RidiculousWiggle = {
        In = v1.InRidiculousWiggle, 
        Out = v1.OutRidiculousWiggle, 
        InOut = v1.InOutRidiculousWiggle
    }, 
    RevBack = {
        In = v1.InRevBack, 
        Out = v1.OutRevBack, 
        InOut = v1.InOutRevBack
    }, 
    Spring = {
        In = v1.InSpring, 
        Out = v1.OutSpring, 
        InOut = v1.InOutSpring
    }, 
    SoftSpring = {
        In = v1.InSoftSpring, 
        Out = v1.OutSoftSpring, 
        InOut = v1.InOutSoftSpring
    }, 
    Sharp = {
        In = v1.InSharp, 
        Out = v1.OutSharp, 
        InOut = v1.InOutSharp
    }, 
    Acceleration = {
        In = v1.InAcceleration, 
        Out = v1.OutAcceleration, 
        InOut = v1.InOutAcceleration
    }, 
    Standard = {
        In = v1.InStandard, 
        Out = v1.OutStandard, 
        InOut = v1.InOutStandard
    }, 
    Deceleration = {
        In = v1.InDeceleration, 
        Out = v1.OutDeceleration, 
        InOut = v1.InOutDeceleration
    }, 
    FabricStandard = {
        In = v1.InFabricStandard, 
        Out = v1.OutFabricStandard, 
        InOut = v1.InOutFabricStandard
    }, 
    FabricAccelerate = {
        In = v1.InFabricAccelerate, 
        Out = v1.OutFabricAccelerate, 
        InOut = v1.InOutFabricAccelerate
    }, 
    FabricDecelerate = {
        In = v1.InFabricDecelerate, 
        Out = v1.OutFabricDecelerate, 
        InOut = v1.InOutFabricDecelerate
    }, 
    UWPAccelerate = {
        In = v1.InUWPAccelerate, 
        Out = v1.OutUWPAccelerate, 
        InOut = v1.InOutUWPAccelerate
    }, 
    StandardProductive = {
        In = v1.InStandardProductive, 
        Out = v1.OutStandardProductive, 
        InOut = v1.InOutStandardProductive
    }, 
    EntranceProductive = {
        In = v1.InEntranceProductive, 
        Out = v1.OutEntranceProductive, 
        InOut = v1.InOutEntranceProductive
    }, 
    ExitProductive = {
        In = v1.InExitProductive, 
        Out = v1.OutExitProductive, 
        InOut = v1.InOutExitProductive
    }, 
    StandardExpressive = {
        In = v1.InStandardExpressive, 
        Out = v1.OutStandardExpressive, 
        InOut = v1.InOutStandardExpressive
    }, 
    EntranceExpressive = {
        In = v1.InEntranceExpressive, 
        Out = v1.OutEntranceExpressive, 
        InOut = v1.InOutEntranceExpressive
    }, 
    ExitExpressive = {
        In = v1.InExitExpressive, 
        Out = v1.OutExitExpressive, 
        InOut = v1.InOutExitExpressive
    }, 
    MozillaCurve = {
        In = v1.InMozillaCurve, 
        Out = v1.OutMozillaCurve, 
        InOut = v1.InOutMozillaCurve
    }
};
return function(v3, v4, v5, v6) --[[ Line: 166 ]]
    local v7 = {};
    local l_v6_0 = v6;
    if v5 then
        l_v6_0 = v5(v6);
    end;
    l_v6_0 = math.clamp(l_v6_0, 0, 1);
    for v9, v10 in v4 do
        v7[v9] = v10(l_v6_0);
    end;
    for v11, v12 in v7 do
        v3[v11] = v12;
    end;
end;