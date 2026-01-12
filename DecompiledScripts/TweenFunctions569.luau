local v0 = require(script.Bezier);
local function v2(v1) --[[ Line: 3 ]] --[[ Name: RevBack ]]
    v1 = 1 - v1;
    return 1 - (math.sin(v1 * 1.5707963267948966) + math.sin(v1 * 3.141592653589793) * (math.cos(v1 * 3.141592653589793) + 1) / 2);
end;
local function v4(v3) --[[ Line: 10 ]] --[[ Name: Linear ]]
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
    return (math.sin(math.sin(v24 * 3.141592653589793) * 1.5707963267948966));
end;
local function v27(v26) --[[ Line: 56 ]] --[[ Name: Spring ]]
    return -math.exp(-6.9 * v26) * math.cos(-20.106192982974676 * v26) + 1;
end;
local function v29(v28) --[[ Line: 60 ]] --[[ Name: SoftSpring ]]
    return -math.exp(-7.5 * v28) * math.cos(-10.053096491487338 * v28) + 1;
end;
return (setmetatable({
    Linear = v4, 
    OutSmooth = v21, 
    InSmooth = v21, 
    InOutSmooth = v21, 
    OutSmoother = v23, 
    InSmoother = v23, 
    InOutSmoother = v23, 
    OutRidiculousWiggle = v25, 
    InRidiculousWiggle = v25, 
    InOutRidiculousWiggle = v25, 
    OutRevBack = v2, 
    InRevBack = v2, 
    InOutRevBack = v2, 
    OutSpring = v27, 
    InSpring = v27, 
    InOutSpring = v27, 
    OutSoftSpring = v29, 
    InSoftSpring = v29, 
    InOutSoftSpring = v29, 
    InSharp = v5, 
    InOutSharp = v5, 
    OutSharp = v5, 
    InAcceleration = v7, 
    InOutAcceleration = v7, 
    OutAcceleration = v7, 
    InStandard = v6, 
    InOutStandard = v6, 
    OutStandard = v6, 
    InDeceleration = v8, 
    InOutDeceleration = v8, 
    OutDeceleration = v8, 
    InFabricStandard = v9, 
    InOutFabricStandard = v9, 
    OutFabricStandard = v9, 
    InFabricAccelerate = v10, 
    InOutFabricAccelerate = v10, 
    OutFabricAccelerate = v10, 
    InFabricDecelerate = v11, 
    InOutFabricDecelerate = v11, 
    OutFabricDecelerate = v11, 
    InUWPAccelerate = v12, 
    InOutUWPAccelerate = v12, 
    OutUWPAccelerate = v12, 
    InStandardProductive = v13, 
    OutStandardProductive = v13, 
    InOutStandardProductive = v13, 
    InStandardExpressive = v14, 
    OutStandardExpressive = v14, 
    InOutStandardExpressive = v14, 
    InEntranceProductive = v15, 
    OutEntranceProductive = v15, 
    InOutEntranceProductive = v15, 
    InEntranceExpressive = v16, 
    OutEntranceExpressive = v16, 
    InOutEntranceExpressive = v16, 
    InExitProductive = v17, 
    OutExitProductive = v17, 
    InOutExitProductive = v17, 
    InExitExpressive = v18, 
    OutExitExpressive = v18, 
    InOutExitExpressive = v18, 
    OutMozillaCurve = v19, 
    InMozillaCurve = v19, 
    InOutMozillaCurve = v19, 
    InQuad = function(v30) --[[ Line: 172 ]] --[[ Name: InQuad ]]
        return v30 * v30;
    end, 
    OutQuad = function(v31) --[[ Line: 176 ]] --[[ Name: OutQuad ]]
        return v31 * (2 - v31);
    end, 
    InOutQuad = function(v32) --[[ Line: 180 ]] --[[ Name: InOutQuad ]]
        return v32 < 0.5 and 2 * v32 * v32 or 2 * (2 - v32) * v32 - 1;
    end, 
    InCubic = function(v33) --[[ Line: 184 ]] --[[ Name: InCubic ]]
        return v33 * v33 * v33;
    end, 
    OutCubic = function(v34) --[[ Line: 188 ]] --[[ Name: OutCubic ]]
        return 1 - (1 - v34) * (1 - v34) * (1 - v34);
    end, 
    InOutCubic = function(v35) --[[ Line: 192 ]] --[[ Name: InOutCubic ]]
        return v35 < 0.5 and 4 * v35 * v35 * v35 or 1 + 4 * (v35 - 1) * (v35 - 1) * (v35 - 1);
    end, 
    InQuart = function(v36) --[[ Line: 196 ]] --[[ Name: InQuart ]]
        return v36 * v36 * v36 * v36;
    end, 
    OutQuart = function(v37) --[[ Line: 200 ]] --[[ Name: OutQuart ]]
        v37 = v37 - 1;
        return 1 - v37 * v37 * v37 * v37;
    end, 
    InOutQuart = function(v38) --[[ Line: 205 ]] --[[ Name: InOutQuart ]]
        if v38 < 0.5 then
            v38 = v38 * v38;
            return 8 * v38 * v38;
        else
            v38 = v38 - 1;
            return 1 - 8 * v38 * v38 * v38 * v38;
        end;
    end, 
    InQuint = function(v39) --[[ Line: 215 ]] --[[ Name: InQuint ]]
        return v39 * v39 * v39 * v39 * v39;
    end, 
    OutQuint = function(v40) --[[ Line: 219 ]] --[[ Name: OutQuint ]]
        v40 = v40 - 1;
        return v40 * v40 * v40 * v40 * v40 + 1;
    end, 
    InOutQuint = function(v41) --[[ Line: 224 ]] --[[ Name: InOutQuint ]]
        if v41 < 0.5 then
            return 16 * v41 * v41 * v41 * v41 * v41;
        else
            v41 = v41 - 1;
            return 16 * v41 * v41 * v41 * v41 * v41 + 1;
        end;
    end, 
    InBack = function(v42) --[[ Line: 233 ]] --[[ Name: InBack ]]
        return v42 * v42 * (3 * v42 - 2);
    end, 
    OutBack = function(v43) --[[ Line: 237 ]] --[[ Name: OutBack ]]
        return (v43 - 1) * (v43 - 1) * (v43 * 2 + v43 - 1) + 1;
    end, 
    InOutBack = function(v44) --[[ Line: 241 ]] --[[ Name: InOutBack ]]
        return v44 < 0.5 and 2 * v44 * v44 * (6 * v44 - 2) or 1 + 2 * (v44 - 1) * (v44 - 1) * (6 * v44 - 2 - 2);
    end, 
    InSine = function(v45) --[[ Line: 245 ]] --[[ Name: InSine ]]
        return 1 - math.cos(v45 * 1.5707963267948966);
    end, 
    OutSine = function(v46) --[[ Line: 249 ]] --[[ Name: OutSine ]]
        return (math.sin(v46 * 1.5707963267948966));
    end, 
    InOutSine = function(v47) --[[ Line: 253 ]] --[[ Name: InOutSine ]]
        return (1 - math.cos(3.141592653589793 * v47)) / 2;
    end, 
    OutBounce = function(v48) --[[ Line: 64 ]] --[[ Name: OutBounce ]]
        return v48 < 0.36363636363636365 and 7.5625 * v48 * v48 or v48 < 0.7272727272727273 and 3 + v48 * (11 * v48 - 12) * 0.6875 or v48 < 0.9090909090909091 and 6 + v48 * (11 * v48 - 18) * 0.6875 or 7.875 + v48 * (11 * v48 - 21) * 0.6875;
    end, 
    InBounce = function(v49) --[[ Line: 71 ]] --[[ Name: InBounce ]]
        if v49 > 0.6363636363636364 then
            v49 = v49 - 1;
            return 1 - v49 * v49 * 7.5625;
        elseif v49 > 0.2727272727272727 then
            return (11 * v49 - 7) * (11 * v49 - 3) / -16;
        elseif v49 > 0.09090909090909091 then
            return (11 * (4 - 11 * v49) * v49 - 3) / 16;
        else
            return v49 * (11 * v49 - 1) * -0.6875;
        end;
    end, 
    InOutBounce = function(v50) --[[ Line: 260 ]] --[[ Name: InOutBounce ]]
        local v51 = false;
        local v52, v53;
        if v50 < 0.5 then
            local v54 = 2 * v50;
            local v55;
            if v54 > 0.6363636363636364 then
                v54 = v54 - 1;
                v55 = 1 - v54 * v54 * 7.5625;
            else
                v55 = if v54 > 0.2727272727272727 then (11 * v54 - 7) * (11 * v54 - 3) / -16 else if v54 > 0.09090909090909091 then (11 * (4 - 11 * v54) * v54 - 3) / 16 else v54 * (11 * v54 - 1) * -0.6875;
            end;
            v53 = v55 / 2;
            v51 = v53;
        end;
        if not v51 then
            v52 = 2 * v50 - 1;
            v53 = (v52 < 0.36363636363636365 and 7.5625 * v52 * v52 or v52 < 0.7272727272727273 and 3 + v52 * (11 * v52 - 12) * 0.6875 or v52 < 0.9090909090909091 and 6 + v52 * (11 * v52 - 18) * 0.6875 or 7.875 + v52 * (11 * v52 - 21) * 0.6875) / 2 + 0.5;
        end;
        v51 = false;
        return v53;
    end, 
    InElastic = function(v56) --[[ Line: 264 ]] --[[ Name: InElastic ]]
        return math.exp((v56 * 0.9638073641881153 - 1) * 8) * v56 * 0.9638073641881153 * math.sin(4 * v56 * 0.9638073641881153) * 1.8752275007428716;
    end, 
    OutElastic = function(v57) --[[ Line: 270 ]] --[[ Name: OutElastic ]]
        return 1 + math.exp(8 * (0.9638073641881153 - 0.9638073641881153 * v57 - 1)) * 0.9638073641881153 * (v57 - 1) * math.sin(3.855229456752461 * (1 - v57)) * 1.8752275007428716;
    end, 
    InOutElastic = function(v58) --[[ Line: 277 ]] --[[ Name: InOutElastic ]]
        return v58 < 0.5 and math.exp(8 * (1.9276147283762306 * v58 - 1)) * 0.9638073641881153 * v58 * math.sin(7.710458913504922 * v58) * 1.8752275007428716 or 1 + math.exp(8 * (0.9638073641881153 * (2 - 2 * v58) - 1)) * 0.9638073641881153 * (v58 - 1) * math.sin(3.855229456752461 * (2 - 2 * v58)) * 1.8752275007428716;
    end, 
    InExponential = function(v59) --[[ Line: 282 ]] --[[ Name: InExponential ]]
        return v59 * v59 * math.exp(4 * (v59 - 1));
    end, 
    OutExponential = function(v60) --[[ Line: 286 ]] --[[ Name: OutExponential ]]
        return 1 - (1 - v60) * (1 - v60) / math.exp(4 * v60);
    end, 
    InOutExponential = function(v61) --[[ Line: 290 ]] --[[ Name: InOutExponential ]]
        return v61 < 0.5 and 2 * v61 * v61 * math.exp(4 * (2 * v61 - 1)) or 1 - 2 * (v61 - 1) * (v61 - 1) * math.exp(4 * (1 - 2 * v61));
    end, 
    InCircular = function(v62) --[[ Line: 294 ]] --[[ Name: InCircular ]]
        return -(math.sqrt(1 - v62 * v62) - 1);
    end, 
    OutCircular = function(v63) --[[ Line: 298 ]] --[[ Name: OutCircular ]]
        v63 = v63 - 1;
        return (math.sqrt(1 - v63 * v63));
    end, 
    InOutCircular = function(v64) --[[ Line: 303 ]] --[[ Name: InOutCircular ]]
        v64 = v64 * 2;
        if v64 < 1 then
            return -(math.sqrt(1 - v64 * v64) - 1) / 2;
        else
            v64 = v64 - 2;
            return (math.sqrt(1 - v64 * v64) - 1) / 2;
        end;
    end
}, {
    __index = function(_, v66) --[[ Line: 313 ]] --[[ Name: __index ]]
        error(tostring(v66) .. " is not a valid easing style.", 2);
    end
}));