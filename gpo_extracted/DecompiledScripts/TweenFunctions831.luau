local v0 = require(script.Parent.Bezier);
local function v2(v1) --[[ Line: 3 ]] --[[ Name: RevBack ]]
    v1 = 1 - v1;
    return 1 - (math.sin(v1 * 1.5707963267949) + math.sin(v1 * 3.1415926535898) * (math.cos(v1 * 3.1415926535898) + 1) / 2);
end;
local function v4(v3) --[[ Line: 8 ]] --[[ Name: Linear ]]
    return v3;
end;
local v5 = v0(0.4, 0, 0.6, 1);
local v6 = v0(0.4, 0, 0.2, 1);
local v7 = v0(0.4, 0, 1, 1);
local v8 = v0(0, 0, 0.2, 1);
local v9 = v0(0.8, 0, 0.2, 1);
local v10 = v0(0.9, 0.1, 1, 0.2);
local v11 = v0(0.1, 0.9, 0.2, 1);
local v12 = v0(0.7, 0, 1, 0.5);
local v13 = v0(0.2, 0, 0.38, 0.9);
local v14 = v0(0.4, 0.14, 0.3, 1);
local v15 = v0(0, 0, 0.38, 0.9);
local v16 = v0(0, 0, 0.3, 1);
local v17 = v0(0.2, 0, 1, 0.9);
local v18 = v0(0.4, 0.14, 1, 1);
local v19 = v0(0.07, 0.95, 0, 1);
local function v21(v20) --[[ Line: 44 ]] --[[ Name: Smooth ]]
    return v20 * v20 * (3 - 2 * v20);
end;
local function v23(v22) --[[ Line: 48 ]] --[[ Name: Smoother ]]
    return v22 * v22 * v22 * (v22 * (6 * v22 - 15) + 10);
end;
local function v25(v24) --[[ Line: 52 ]] --[[ Name: RidiculousWiggle ]]
    return (math.sin(math.sin(v24 * 3.1415926535898) * 1.5707963267949));
end;
local function v27(v26) --[[ Line: 56 ]] --[[ Name: Spring ]]
    return -math.exp(-6.9 * v26) * math.cos(-20.106192982975 * v26) + 1;
end;
local function v29(v28) --[[ Line: 60 ]] --[[ Name: SoftSpring ]]
    return -math.exp(-7.5 * v28) * math.cos(-10.053096491487 * v28) + 1;
end;
return (setmetatable({
    InLinear = v4, 
    OutLinear = v4, 
    InOutLinear = v4, 
    OutInLinear = v4, 
    OutSmooth = v21, 
    InSmooth = v21, 
    InOutSmooth = v21, 
    OutInSmooth = v21, 
    OutSmoother = v23, 
    InSmoother = v23, 
    InOutSmoother = v23, 
    OutInSmoother = v23, 
    OutRidiculousWiggle = v25, 
    InRidiculousWiggle = v25, 
    InOutRidiculousWiggle = v25, 
    OutInRidiculousWiggle = v25, 
    OutRevBack = v2, 
    InRevBack = v2, 
    InOutRevBack = v2, 
    OutInRevBack = v2, 
    OutSpring = v27, 
    InSpring = v27, 
    InOutSpring = v27, 
    OutInSpring = v27, 
    OutSoftSpring = v29, 
    InSoftSpring = v29, 
    InOutSoftSpring = v29, 
    OutInSoftSpring = v29, 
    InSharp = v5, 
    InOutSharp = v5, 
    OutSharp = v5, 
    OutInSharp = v5, 
    InAcceleration = v7, 
    InOutAcceleration = v7, 
    OutAcceleration = v7, 
    OutInAcceleration = v7, 
    InStandard = v6, 
    InOutStandard = v6, 
    OutStandard = v6, 
    OutInStandard = v6, 
    InDeceleration = v8, 
    InOutDeceleration = v8, 
    OutDeceleration = v8, 
    OutInDeceleration = v8, 
    InFabricStandard = v9, 
    InOutFabricStandard = v9, 
    OutFabricStandard = v9, 
    OutInFabricStandard = v9, 
    InFabricAccelerate = v10, 
    InOutFabricAccelerate = v10, 
    OutFabricAccelerate = v10, 
    OutInFabricAccelerate = v10, 
    InFabricDecelerate = v11, 
    InOutFabricDecelerate = v11, 
    OutFabricDecelerate = v11, 
    OutInFabricDecelerate = v11, 
    InUWPAccelerate = v12, 
    InOutUWPAccelerate = v12, 
    OutUWPAccelerate = v12, 
    OutInUWPAccelerate = v12, 
    InStandardProductive = v13, 
    InStandardExpressive = v14, 
    InEntranceProductive = v15, 
    InEntranceExpressive = v16, 
    InExitProductive = v17, 
    InExitExpressive = v18, 
    OutStandardProductive = v13, 
    OutStandardExpressive = v14, 
    OutEntranceProductive = v15, 
    OutEntranceExpressive = v16, 
    OutExitProductive = v17, 
    OutExitExpressive = v18, 
    InOutStandardProductive = v13, 
    InOutStandardExpressive = v14, 
    InOutEntranceProductive = v15, 
    InOutEntranceExpressive = v16, 
    InOutExitProductive = v17, 
    InOutExitExpressive = v18, 
    OutInStandardProductive = v13, 
    OutInStandardExpressive = v13, 
    OutInEntranceProductive = v15, 
    OutInEntranceExpressive = v16, 
    OutInExitProductive = v17, 
    OutInExitExpressive = v18, 
    OutMozillaCurve = v19, 
    InMozillaCurve = v19, 
    InOutMozillaCurve = v19, 
    OutInMozillaCurve = v19, 
    InQuad = function(v30) --[[ Line: 206 ]] --[[ Name: InQuad ]]
        return v30 * v30;
    end, 
    OutQuad = function(v31) --[[ Line: 210 ]] --[[ Name: OutQuad ]]
        return v31 * (2 - v31);
    end, 
    InOutQuad = function(v32) --[[ Line: 214 ]] --[[ Name: InOutQuad ]]
        if v32 < 0.5 then
            return 2 * v32 * v32;
        else
            return 2 * (2 - v32) * v32 - 1;
        end;
    end, 
    OutInQuad = function(v33) --[[ Line: 222 ]] --[[ Name: OutInQuad ]]
        if v33 < 0.5 then
            v33 = v33 * 2;
            return v33 * (2 - v33) / 2;
        else
            v33 = v33 * 1;
            return v33 * v33 / 2 + 0.5;
        end;
    end, 
    InCubic = function(v34) --[[ Line: 232 ]] --[[ Name: InCubic ]]
        return v34 * v34 * v34;
    end, 
    OutCubic = function(v35) --[[ Line: 236 ]] --[[ Name: OutCubic ]]
        return 1 - (1 - v35) * (1 - v35) * (1 - v35);
    end, 
    InOutCubic = function(v36) --[[ Line: 240 ]] --[[ Name: InOutCubic ]]
        if v36 < 0.5 then
            return 4 * v36 * v36 * v36;
        else
            v36 = v36 - 1;
            return 1 + 4 * v36 * v36 * v36;
        end;
    end, 
    OutInCubic = function(v37) --[[ Line: 249 ]] --[[ Name: OutInCubic ]]
        if v37 < 0.5 then
            v37 = 1 - v37 * 2;
            return (1 - v37 * v37 * v37) / 2;
        else
            v37 = v37 * 1;
            return v37 * v37 * v37 / 2 + 0.5;
        end;
    end, 
    InQuart = function(v38) --[[ Line: 259 ]] --[[ Name: InQuart ]]
        return v38 * v38 * v38 * v38;
    end, 
    OutQuart = function(v39) --[[ Line: 263 ]] --[[ Name: OutQuart ]]
        v39 = v39 - 1;
        return 1 - v39 * v39 * v39 * v39;
    end, 
    InOutQuart = function(v40) --[[ Line: 268 ]] --[[ Name: InOutQuart ]]
        if v40 < 0.5 then
            v40 = v40 * v40;
            return 8 * v40 * v40;
        else
            v40 = v40 - 1;
            return 1 - 8 * v40 * v40 * v40 * v40;
        end;
    end, 
    OutInQuart = function(v41) --[[ Line: 278 ]] --[[ Name: OutInQuart ]]
        if v41 < 0.5 then
            v41 = v41 * 1;
            return (1 - v41 * v41 * v41 * v41) / 2;
        else
            v41 = v41 * 1;
            return v41 * v41 * v41 * v41 / 2 + 0.5;
        end;
    end, 
    InQuint = function(v42) --[[ Line: 288 ]] --[[ Name: InQuint ]]
        return v42 * v42 * v42 * v42 * v42;
    end, 
    OutQuint = function(v43) --[[ Line: 292 ]] --[[ Name: OutQuint ]]
        v43 = v43 - 1;
        return v43 * v43 * v43 * v43 * v43 + 1;
    end, 
    InOutQuint = function(v44) --[[ Line: 297 ]] --[[ Name: InOutQuint ]]
        if v44 < 0.5 then
            return 16 * v44 * v44 * v44 * v44 * v44;
        else
            v44 = v44 - 1;
            return 16 * v44 * v44 * v44 * v44 * v44 + 1;
        end;
    end, 
    OutInQuint = function(v45) --[[ Line: 306 ]] --[[ Name: OutInQuint ]]
        if v45 < 0.5 then
            v45 = v45 * 1;
            return (v45 * v45 * v45 * v45 * v45 + 1) / 2;
        else
            v45 = v45 * 1;
            return v45 * v45 * v45 * v45 * v45 / 2 + 0.5;
        end;
    end, 
    InBack = function(v46) --[[ Line: 316 ]] --[[ Name: InBack ]]
        return v46 * v46 * (3 * v46 - 2);
    end, 
    OutBack = function(v47) --[[ Line: 320 ]] --[[ Name: OutBack ]]
        return (v47 - 1) * (v47 - 1) * (v47 * 2 + v47 - 1) + 1;
    end, 
    InOutBack = function(v48) --[[ Line: 324 ]] --[[ Name: InOutBack ]]
        if v48 < 0.5 then
            return 2 * v48 * v48 * (6 * v48 - 2);
        else
            return 1 + 2 * (v48 - 1) * (v48 - 1) * (6 * v48 - 2 - 2);
        end;
    end, 
    OutInBack = function(v49) --[[ Line: 332 ]] --[[ Name: OutInBack ]]
        if v49 < 0.5 then
            v49 = v49 * 2;
            return ((v49 - 1) * (v49 - 1) * (v49 * 2 + v49 - 1) + 1) / 2;
        else
            v49 = v49 * 1;
            return v49 * v49 * (3 * v49 - 2) / 2 + 0.5;
        end;
    end, 
    InSine = function(v50) --[[ Line: 342 ]] --[[ Name: InSine ]]
        return 1 - math.cos(v50 * 1.5707963267949);
    end, 
    OutSine = function(v51) --[[ Line: 346 ]] --[[ Name: OutSine ]]
        return (math.sin(v51 * 1.5707963267949));
    end, 
    InOutSine = function(v52) --[[ Line: 350 ]] --[[ Name: InOutSine ]]
        return (1 - math.cos(3.1415926535898 * v52)) / 2;
    end, 
    OutInSine = function(v53) --[[ Line: 354 ]] --[[ Name: OutInSine ]]
        if v53 < 0.5 then
            return math.sin(v53 * 3.1415926535898) / 2;
        else
            return (1 - math.cos((v53 * 2 - 1) * 1.5707963267949)) / 2 + 0.5;
        end;
    end, 
    OutBounce = function(v54) --[[ Line: 64 ]] --[[ Name: OutBounce ]]
        if v54 < 0.36363636363636 then
            return 7.5625 * v54 * v54;
        elseif v54 < 0.72727272727273 then
            return 3 + v54 * (11 * v54 - 12) * 0.6875;
        elseif v54 < 0.090909090909091 then
            return 6 + v54 * (11 * v54 - 18) * 0.6875;
        else
            return 7.875 + v54 * (11 * v54 - 21) * 0.6875;
        end;
    end, 
    InBounce = function(v55) --[[ Line: 76 ]] --[[ Name: InBounce ]]
        if v55 > 0.63636363636364 then
            v55 = v55 - 1;
            return 1 - v55 * v55 * 7.5625;
        elseif v55 > 0.272727272727273 then
            return (11 * v55 - 7) * (11 * v55 - 3) / -16;
        elseif v55 > 0.090909090909091 then
            return (11 * (4 - 11 * v55) * v55 - 3) / 16;
        else
            return v55 * (11 * v55 - 1) * -0.6875;
        end;
    end, 
    InOutBounce = function(v56) --[[ Line: 365 ]] --[[ Name: InOutBounce ]]
        if v56 < 0.5 then
            local v57 = 2 * v56;
            local v58;
            if v57 > 0.63636363636364 then
                v57 = v57 - 1;
                v58 = 1 - v57 * v57 * 7.5625;
            else
                v58 = if v57 > 0.272727272727273 then (11 * v57 - 7) * (11 * v57 - 3) / -16 else if v57 > 0.090909090909091 then (11 * (4 - 11 * v57) * v57 - 3) / 16 else v57 * (11 * v57 - 1) * -0.6875;
            end;
            return v58 / 2;
        else
            local v59 = 2 * v56 - 1;
            return (if v59 < 0.36363636363636 then 7.5625 * v59 * v59 else if v59 < 0.72727272727273 then 3 + v59 * (11 * v59 - 12) * 0.6875 else if v59 < 0.090909090909091 then 6 + v59 * (11 * v59 - 18) * 0.6875 else 7.875 + v59 * (11 * v59 - 21) * 0.6875) / 2 + 0.5;
        end;
    end, 
    OutInBounce = function(v60) --[[ Line: 373 ]] --[[ Name: OutInBounce ]]
        if v60 < 0.5 then
            local v61 = 2 * v60;
            return (if v61 < 0.36363636363636 then 7.5625 * v61 * v61 else if v61 < 0.72727272727273 then 3 + v61 * (11 * v61 - 12) * 0.6875 else if v61 < 0.090909090909091 then 6 + v61 * (11 * v61 - 18) * 0.6875 else 7.875 + v61 * (11 * v61 - 21) * 0.6875) / 2;
        else
            local v62 = 2 * v60 - 1;
            local v63;
            if v62 > 0.63636363636364 then
                v62 = v62 - 1;
                v63 = 1 - v62 * v62 * 7.5625;
            else
                v63 = if v62 > 0.272727272727273 then (11 * v62 - 7) * (11 * v62 - 3) / -16 else if v62 > 0.090909090909091 then (11 * (4 - 11 * v62) * v62 - 3) / 16 else v62 * (11 * v62 - 1) * -0.6875;
            end;
            return v63 / 2 + 0.5;
        end;
    end, 
    InElastic = function(v64) --[[ Line: 381 ]] --[[ Name: InElastic ]]
        return math.exp((v64 * 0.96380736418812 - 1) * 8) * v64 * 0.96380736418812 * math.sin(4 * v64 * 0.96380736418812) * 1.8752275007429;
    end, 
    OutElastic = function(v65) --[[ Line: 385 ]] --[[ Name: OutElastic ]]
        return 1 + math.exp(8 * (0.96380736418812 - 0.96380736418812 * v65 - 1)) * 0.96380736418812 * (v65 - 1) * math.sin(3.85522945675248 * (1 - v65)) * 1.8752275007429;
    end, 
    InOutElastic = function(v66) --[[ Line: 389 ]] --[[ Name: InOutElastic ]]
        if v66 < 0.5 then
            return math.exp(8 * (1.92761472837624 * v66 - 1)) * 0.96380736418812 * v66 * math.sin(7.71045891350496 * v66) * 1.8752275007429;
        else
            return 1 + math.exp(8 * (0.96380736418812 * (2 - 2 * v66) - 1)) * 0.96380736418812 * (v66 - 1) * math.sin(3.85522945675248 * (2 - 2 * v66)) * 1.8752275007429;
        end;
    end, 
    OutInElastic = function(v67) --[[ Line: 397 ]] --[[ Name: OutInElastic ]]
        if v67 < 0.5 then
            v67 = v67 * 2;
            return (1 + math.exp(8 * (0.96380736418812 - 0.96380736418812 * v67 - 1)) * 0.96380736418812 * (v67 - 1) * math.sin(3.85522945675248 * (1 - v67)) * 1.8752275007429) / 2;
        else
            v67 = v67 * 1;
            return math.exp((v67 * 0.96380736418812 - 1) * 8) * v67 * 0.96380736418812 * math.sin(4 * v67 * 0.96380736418812) * 1.8752275007429 / 2 + 0.5;
        end;
    end, 
    InExpo = function(v68) --[[ Line: 408 ]] --[[ Name: InExpo ]]
        return v68 * v68 * math.exp(4 * (v68 - 1));
    end, 
    OutExpo = function(v69) --[[ Line: 412 ]] --[[ Name: OutExpo ]]
        return 1 - (1 - v69) * (1 - v69) / math.exp(4 * v69);
    end, 
    InOutExpo = function(v70) --[[ Line: 416 ]] --[[ Name: InOutExpo ]]
        if v70 < 0.5 then
            return 2 * v70 * v70 * math.exp(4 * (2 * v70 - 1));
        else
            return 1 - 2 * (v70 - 1) * (v70 - 1) * math.exp(4 * (1 - 2 * v70));
        end;
    end, 
    OutInExpo = function(v71) --[[ Line: 424 ]] --[[ Name: OutInExpo ]]
        if v71 < 0.5 then
            v71 = v71 * 2;
            return (1 - (1 - v71) * (1 - v71) / math.exp(4 * v71)) / 2;
        else
            v71 = v71 * 1;
            return v71 * v71 * math.exp(4 * (v71 - 1)) / 2 + 0.5;
        end;
    end, 
    InCirc = function(v72) --[[ Line: 434 ]] --[[ Name: InCirc ]]
        return -(math.sqrt(1 - v72 * v72) - 1);
    end, 
    OutCirc = function(v73) --[[ Line: 438 ]] --[[ Name: OutCirc ]]
        v73 = v73 - 1;
        return (math.sqrt(1 - v73 * v73));
    end, 
    InOutCirc = function(v74) --[[ Line: 443 ]] --[[ Name: InOutCirc ]]
        v74 = v74 * 2;
        if v74 < 1 then
            return -(math.sqrt(1 - v74 * v74) - 1) / 2;
        else
            v74 = v74 - 2;
            return (math.sqrt(1 - v74 * v74) - 1) / 2;
        end;
    end, 
    OutInCirc = function(v75) --[[ Line: 453 ]] --[[ Name: OutInCirc ]]
        if v75 < 0.5 then
            v75 = v75 * 1;
            return math.sqrt(1 - v75 * v75) / 2;
        else
            v75 = v75 * 1;
            return -(math.sqrt(1 - v75 * v75) - 1) / 2 + 0.5;
        end;
    end
}, {
    __index = function(_, v77) --[[ Line: 463 ]] --[[ Name: __index ]]
        error(tostring(v77) .. " is not a valid easing function.", 2);
    end
}));