local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local v2 = "Standing";
local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
    return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop");
end);
local v5 = l_status_0 and l_result_0;
local v6 = nil;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 9 ]]
    return UserSettings():IsUserFeatureEnabled("UserEmoteToRunThresholdChange");
end);
v6 = l_status_1 and l_result_1;
l_status_1 = nil;
local v9;
l_result_1, v9 = pcall(function() --[[ Line: 16 ]]
    return UserSettings():IsUserFeatureEnabled("UserPlayEmoteByIdAnimTrackReturn2");
end);
l_status_1 = l_result_1 and v9;
l_result_1 = script:FindFirstChild("ScaleDampeningPercent");
v9 = "";
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = 1;
local v14 = nil;
local v15 = nil;
local v16 = {};
local v17 = {};
local v18 = {
    idle = {
        {
            id = "http://www.roblox.com/asset/?id=507766666", 
            weight = 1
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507766951", 
            weight = 1
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507766388", 
            weight = 9
        }
    }, 
    walk = {
        {
            id = "http://www.roblox.com/asset/?id=507777826", 
            weight = 10
        }
    }, 
    run = {
        {
            id = "http://www.roblox.com/asset/?id=507767714", 
            weight = 10
        }
    }, 
    swim = {
        {
            id = "http://www.roblox.com/asset/?id=507784897", 
            weight = 10
        }
    }, 
    swimidle = {
        {
            id = "http://www.roblox.com/asset/?id=507785072", 
            weight = 10
        }
    }, 
    jump = {
        {
            id = "http://www.roblox.com/asset/?id=507765000", 
            weight = 10
        }
    }, 
    fall = {
        {
            id = "http://www.roblox.com/asset/?id=507767968", 
            weight = 10
        }
    }, 
    climb = {
        {
            id = "http://www.roblox.com/asset/?id=507765644", 
            weight = 10
        }
    }, 
    sit = {
        {
            id = "http://www.roblox.com/asset/?id=2506281703", 
            weight = 10
        }
    }, 
    toolnone = {
        {
            id = "http://www.roblox.com/asset/?id=507768375", 
            weight = 10
        }
    }, 
    toolslash = {
        {
            id = "http://www.roblox.com/asset/?id=522635514", 
            weight = 10
        }
    }, 
    toollunge = {
        {
            id = "http://www.roblox.com/asset/?id=522638767", 
            weight = 10
        }
    }, 
    wave = {
        {
            id = "http://www.roblox.com/asset/?id=507770239", 
            weight = 10
        }
    }, 
    point = {
        {
            id = "http://www.roblox.com/asset/?id=507770453", 
            weight = 10
        }
    }, 
    dance = {
        {
            id = "http://www.roblox.com/asset/?id=507771019", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507771955", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507772104", 
            weight = 10
        }
    }, 
    dance2 = {
        {
            id = "http://www.roblox.com/asset/?id=507776043", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507776720", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507776879", 
            weight = 10
        }
    }, 
    dance3 = {
        {
            id = "http://www.roblox.com/asset/?id=507777268", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507777451", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507777623", 
            weight = 10
        }
    }, 
    laugh = {
        {
            id = "http://www.roblox.com/asset/?id=507770818", 
            weight = 10
        }
    }, 
    cheer = {
        {
            id = "http://www.roblox.com/asset/?id=507770677", 
            weight = 10
        }
    }
};
local v19 = {
    wave = false, 
    point = false, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = false, 
    cheer = false
};
math.randomseed(tick());
findExistingAnimationInSet = function(v20, v21) --[[ Line: 112 ]] --[[ Name: findExistingAnimationInSet ]]
    if v20 == nil or v21 == nil then
        return 0;
    else
        for v22 = 1, v20.count do
            if v20[v22].anim.AnimationId == v21.AnimationId then
                return v22;
            end;
        end;
        return 0;
    end;
end;
configureAnimationSet = function(v23, v24) --[[ Line: 126 ]] --[[ Name: configureAnimationSet ]]
    -- upvalues: v17 (copy), v16 (copy), l_Humanoid_0 (copy)
    if v17[v23] ~= nil then
        for _, v26 in pairs(v17[v23].connections) do
            v26:disconnect();
        end;
    end;
    v17[v23] = {};
    v17[v23].count = 0;
    v17[v23].totalWeight = 0;
    v17[v23].connections = {};
    local v27 = true;
    local l_status_2, _ = pcall(function() --[[ Line: 139 ]]
        -- upvalues: v27 (ref)
        v27 = game:GetService("StarterPlayer").AllowCustomAnimations;
    end);
    if not l_status_2 then
        v27 = true;
    end;
    local l_script_FirstChild_0 = script:FindFirstChild(v23);
    if v27 and l_script_FirstChild_0 ~= nil then
        table.insert(v17[v23].connections, l_script_FirstChild_0.ChildAdded:connect(function(_) --[[ Line: 147 ]]
            -- upvalues: v23 (copy), v24 (copy)
            configureAnimationSet(v23, v24);
        end));
        table.insert(v17[v23].connections, l_script_FirstChild_0.ChildRemoved:connect(function(_) --[[ Line: 148 ]]
            -- upvalues: v23 (copy), v24 (copy)
            configureAnimationSet(v23, v24);
        end));
        local v33 = 0;
        for _, v35 in pairs(l_script_FirstChild_0:GetChildren()) do
            if v35:IsA("Animation") then
                local v36 = 1;
                local l_Weight_0 = v35:FindFirstChild("Weight");
                if l_Weight_0 ~= nil then
                    v36 = l_Weight_0.Value;
                end;
                v17[v23].count = v17[v23].count + 1;
                v33 = v17[v23].count;
                v17[v23][v33] = {};
                v17[v23][v33].anim = v35;
                v17[v23][v33].weight = v36;
                v17[v23].totalWeight = v17[v23].totalWeight + v17[v23][v33].weight;
                table.insert(v17[v23].connections, v35.Changed:connect(function(_) --[[ Line: 164 ]]
                    -- upvalues: v23 (copy), v24 (copy)
                    configureAnimationSet(v23, v24);
                end));
                table.insert(v17[v23].connections, v35.ChildAdded:connect(function(_) --[[ Line: 165 ]]
                    -- upvalues: v23 (copy), v24 (copy)
                    configureAnimationSet(v23, v24);
                end));
                table.insert(v17[v23].connections, v35.ChildRemoved:connect(function(_) --[[ Line: 166 ]]
                    -- upvalues: v23 (copy), v24 (copy)
                    configureAnimationSet(v23, v24);
                end));
            end;
        end;
    end;
    if v17[v23].count <= 0 then
        for v41, v42 in pairs(v24) do
            v17[v23][v41] = {};
            v17[v23][v41].anim = Instance.new("Animation");
            v17[v23][v41].anim.Name = v23;
            v17[v23][v41].anim.AnimationId = v42.id;
            v17[v23][v41].weight = v42.weight;
            v17[v23].count = v17[v23].count + 1;
            v17[v23].totalWeight = v17[v23].totalWeight + v42.weight;
        end;
    end;
    for _, v44 in pairs(v17) do
        for v45 = 1, v44.count do
            if v16[v44[v45].anim.AnimationId] == nil then
                l_Humanoid_0:LoadAnimation(v44[v45].anim);
                v16[v44[v45].anim.AnimationId] = true;
            end;
        end;
    end;
end;
configureAnimationSetOld = function(v46, v47) --[[ Line: 197 ]] --[[ Name: configureAnimationSetOld ]]
    -- upvalues: v17 (copy), l_Humanoid_0 (copy)
    if v17[v46] ~= nil then
        for _, v49 in pairs(v17[v46].connections) do
            v49:disconnect();
        end;
    end;
    v17[v46] = {};
    v17[v46].count = 0;
    v17[v46].totalWeight = 0;
    v17[v46].connections = {};
    local v50 = true;
    local l_status_3, _ = pcall(function() --[[ Line: 210 ]]
        -- upvalues: v50 (ref)
        v50 = game:GetService("StarterPlayer").AllowCustomAnimations;
    end);
    if not l_status_3 then
        v50 = true;
    end;
    local l_script_FirstChild_1 = script:FindFirstChild(v46);
    if v50 and l_script_FirstChild_1 ~= nil then
        table.insert(v17[v46].connections, l_script_FirstChild_1.ChildAdded:connect(function(_) --[[ Line: 218 ]]
            -- upvalues: v46 (copy), v47 (copy)
            configureAnimationSet(v46, v47);
        end));
        table.insert(v17[v46].connections, l_script_FirstChild_1.ChildRemoved:connect(function(_) --[[ Line: 219 ]]
            -- upvalues: v46 (copy), v47 (copy)
            configureAnimationSet(v46, v47);
        end));
        local v56 = 1;
        for _, v58 in pairs(l_script_FirstChild_1:GetChildren()) do
            if v58:IsA("Animation") then
                table.insert(v17[v46].connections, v58.Changed:connect(function(_) --[[ Line: 223 ]]
                    -- upvalues: v46 (copy), v47 (copy)
                    configureAnimationSet(v46, v47);
                end));
                v17[v46][v56] = {};
                v17[v46][v56].anim = v58;
                local l_Weight_1 = v58:FindFirstChild("Weight");
                if l_Weight_1 == nil then
                    v17[v46][v56].weight = 1;
                else
                    v17[v46][v56].weight = l_Weight_1.Value;
                end;
                v17[v46].count = v17[v46].count + 1;
                v17[v46].totalWeight = v17[v46].totalWeight + v17[v46][v56].weight;
                v56 = v56 + 1;
            end;
        end;
    end;
    if v17[v46].count <= 0 then
        for v61, v62 in pairs(v47) do
            v17[v46][v61] = {};
            v17[v46][v61].anim = Instance.new("Animation");
            v17[v46][v61].anim.Name = v46;
            v17[v46][v61].anim.AnimationId = v62.id;
            v17[v46][v61].weight = v62.weight;
            v17[v46].count = v17[v46].count + 1;
            v17[v46].totalWeight = v17[v46].totalWeight + v62.weight;
        end;
    end;
    for _, v64 in pairs(v17) do
        for v65 = 1, v64.count do
            l_Humanoid_0:LoadAnimation(v64[v65].anim);
        end;
    end;
end;
scriptChildModified = function(v66) --[[ Line: 262 ]] --[[ Name: scriptChildModified ]]
    -- upvalues: v18 (copy)
    local v67 = v18[v66.Name];
    if v67 ~= nil then
        configureAnimationSet(v66.Name, v67);
    end;
end;
script.ChildAdded:connect(scriptChildModified);
script.ChildRemoved:connect(scriptChildModified);
local v68 = if l_Humanoid_0 then l_Humanoid_0:FindFirstChildOfClass("Animator") else nil;
if v68 then
    local l_v68_PlayingAnimationTracks_0 = v68:GetPlayingAnimationTracks();
    for _, v71 in ipairs(l_v68_PlayingAnimationTracks_0) do
        v71:Stop(0);
        v71:Destroy();
    end;
end;
for v72, v73 in pairs(v18) do
    configureAnimationSet(v72, v73);
end;
local v74 = "None";
local v75 = 0;
local v76 = 0;
local v77 = false;
stopAllAnimations = function() --[[ Line: 303 ]] --[[ Name: stopAllAnimations ]]
    -- upvalues: v9 (ref), v19 (copy), v77 (ref), v10 (ref), v12 (ref), v11 (ref), v15 (ref), v14 (ref)
    local l_v9_0 = v9;
    if v19[l_v9_0] ~= nil and v19[l_v9_0] == false then
        l_v9_0 = "idle";
    end;
    if v77 then
        l_v9_0 = "idle";
        v77 = false;
    end;
    v9 = "";
    v10 = nil;
    if v12 ~= nil then
        v12:disconnect();
    end;
    if v11 ~= nil then
        v11:Stop();
        v11:Destroy();
        v11 = nil;
    end;
    if v15 ~= nil then
        v15:disconnect();
    end;
    if v14 ~= nil then
        v14:Stop();
        v14:Destroy();
        v14 = nil;
    end;
    return l_v9_0;
end;
getHeightScale = function() --[[ Line: 342 ]] --[[ Name: getHeightScale ]]
    -- upvalues: l_Humanoid_0 (copy), l_result_1 (ref)
    if l_Humanoid_0 then
        if not l_Humanoid_0.AutomaticScalingEnabled then
            return 1;
        else
            local v79 = l_Humanoid_0.HipHeight / 2;
            if l_result_1 == nil then
                l_result_1 = script:FindFirstChild("ScaleDampeningPercent");
            end;
            if l_result_1 ~= nil then
                v79 = 1 + (l_Humanoid_0.HipHeight - 2) * l_result_1.Value / 2;
            end;
            return v79;
        end;
    else
        return 1;
    end;
end;
local function _(v80) --[[ Line: 360 ]] --[[ Name: rootMotionCompensation ]]
    return v80 * 1.25 / getHeightScale();
end;
local function v89(v82) --[[ Line: 368 ]] --[[ Name: setRunSpeed ]]
    -- upvalues: v11 (ref), v14 (ref)
    local v83 = v82 * 1.25 / getHeightScale();
    local v84 = 1.0E-4;
    local v85 = 1.0E-4;
    local v86 = v83 / 0.5;
    local v87 = v83 / 1;
    if v83 <= 0.5 then
        v84 = 1;
    elseif v83 < 1 then
        local v88 = (v83 - 0.5) / 0.5;
        v84 = 1 - v88;
        v85 = v88;
        v86 = 1;
        v87 = 1;
    else
        v85 = 1;
    end;
    v11:AdjustWeight(v84);
    v14:AdjustWeight(v85);
    v11:AdjustSpeed(v86);
    v14:AdjustSpeed(v87);
end;
setAnimationSpeed = function(v90) --[[ Line: 395 ]] --[[ Name: setAnimationSpeed ]]
    -- upvalues: v9 (ref), v89 (copy), v13 (ref), v11 (ref)
    if v9 == "walk" then
        v89(v90);
        return;
    else
        if v90 ~= v13 then
            v13 = v90;
            v11:AdjustSpeed(v13);
        end;
        return;
    end;
end;
keyFrameReachedFunc = function(v91) --[[ Line: 406 ]] --[[ Name: keyFrameReachedFunc ]]
    -- upvalues: v9 (ref), v5 (copy), v14 (ref), v11 (ref), v19 (copy), v77 (ref), v13 (ref), l_Humanoid_0 (copy)
    if v91 == "End" then
        if v9 == "walk" then
            if v5 == true then
                if v14.Looped ~= true then
                    v14.TimePosition = 0;
                end;
                if v11.Looped ~= true then
                    v11.TimePosition = 0;
                    return;
                end;
            else
                v14.TimePosition = 0;
                v11.TimePosition = 0;
                return;
            end;
        else
            local l_v9_1 = v9;
            if v19[l_v9_1] ~= nil and v19[l_v9_1] == false then
                l_v9_1 = "idle";
            end;
            if v77 then
                if v11.Looped then
                    return;
                else
                    l_v9_1 = "idle";
                    v77 = false;
                end;
            end;
            local l_v13_0 = v13;
            playAnimation(l_v9_1, 0.15, l_Humanoid_0);
            setAnimationSpeed(l_v13_0);
        end;
    end;
end;
rollAnimation = function(v94) --[[ Line: 444 ]] --[[ Name: rollAnimation ]]
    -- upvalues: v17 (copy)
    local v95 = math.random(1, v17[v94].totalWeight);
    local _ = v95;
    local v97 = 1;
    while v17[v94][v97].weight < v95 do
        v95 = v95 - v17[v94][v97].weight;
        v97 = v97 + 1;
    end;
    return v97;
end;
local function v103(v98, v99, v100, v101) --[[ Line: 455 ]] --[[ Name: switchToAnim ]]
    -- upvalues: v10 (ref), v11 (ref), v14 (ref), v5 (copy), v13 (ref), v9 (ref), v12 (ref), v17 (copy), v15 (ref)
    if v98 ~= v10 then
        if v11 ~= nil then
            v11:Stop(v100);
            v11:Destroy();
        end;
        if v14 ~= nil then
            v14:Stop(v100);
            v14:Destroy();
            if v5 == true then
                v14 = nil;
            end;
        end;
        v13 = 1;
        v11 = v101:LoadAnimation(v98);
        v11.Priority = Enum.AnimationPriority.Core;
        v11:Play(v100);
        v9 = v99;
        v10 = v98;
        if v12 ~= nil then
            v12:disconnect();
        end;
        v12 = v11.KeyframeReached:connect(keyFrameReachedFunc);
        if v99 == "walk" then
            local v102 = rollAnimation("run");
            v14 = v101:LoadAnimation(v17.run[v102].anim);
            v14.Priority = Enum.AnimationPriority.Core;
            v14:Play(v100);
            if v15 ~= nil then
                v15:disconnect();
            end;
            v15 = v14.KeyframeReached:connect(keyFrameReachedFunc);
        end;
    end;
end;
playAnimation = function(v104, v105, v106) --[[ Line: 506 ]] --[[ Name: playAnimation ]]
    -- upvalues: v17 (copy), v103 (copy), v77 (ref)
    local v107 = rollAnimation(v104);
    local l_anim_0 = v17[v104][v107].anim;
    v103(l_anim_0, v104, v105, v106);
    v77 = false;
end;
playEmote = function(v109, v110, v111) --[[ Line: 514 ]] --[[ Name: playEmote ]]
    -- upvalues: v103 (copy), v77 (ref)
    v103(v109, v109.Name, v110, v111);
    v77 = true;
end;
local v112 = "";
local v113 = nil;
local v114 = nil;
local v115 = nil;
toolKeyFrameReachedFunc = function(v116) --[[ Line: 527 ]] --[[ Name: toolKeyFrameReachedFunc ]]
    -- upvalues: v112 (ref), l_Humanoid_0 (copy)
    if v116 == "End" then
        playToolAnimation(v112, 0, l_Humanoid_0);
    end;
end;
playToolAnimation = function(v117, v118, v119, v120) --[[ Line: 534 ]] --[[ Name: playToolAnimation ]]
    -- upvalues: v17 (copy), v114 (ref), v113 (ref), v112 (ref), v115 (ref)
    local v121 = rollAnimation(v117);
    local l_anim_1 = v17[v117][v121].anim;
    if v114 ~= l_anim_1 then
        if v113 ~= nil then
            v113:Stop();
            v113:Destroy();
            v118 = 0;
        end;
        v113 = v119:LoadAnimation(l_anim_1);
        if v120 then
            v113.Priority = v120;
        end;
        v113:Play(v118);
        v112 = v117;
        v114 = l_anim_1;
        v115 = v113.KeyframeReached:connect(toolKeyFrameReachedFunc);
    end;
end;
stopToolAnimations = function() --[[ Line: 561 ]] --[[ Name: stopToolAnimations ]]
    -- upvalues: v112 (ref), v115 (ref), v114 (ref), v113 (ref)
    local l_v112_0 = v112;
    if v115 ~= nil then
        v115:disconnect();
    end;
    v112 = "";
    v114 = nil;
    if v113 ~= nil then
        v113:Stop();
        v113:Destroy();
        v113 = nil;
    end;
    return l_v112_0;
end;
onRunning = function(v124) --[[ Line: 583 ]] --[[ Name: onRunning ]]
    -- upvalues: v6 (ref), v77 (ref), l_Humanoid_0 (copy), v2 (ref), v19 (copy), v9 (ref)
    if (v6 and v77 and l_Humanoid_0.MoveDirection == Vector3.new(0, 0, 0, 0) and l_Humanoid_0.WalkSpeed or 0.75) < v124 then
        playAnimation("walk", 0.2, l_Humanoid_0);
        setAnimationSpeed(v124 / 16);
        v2 = "Running";
        return;
    else
        if v19[v9] == nil and not v77 then
            playAnimation("idle", 0.2, l_Humanoid_0);
            v2 = "Standing";
        end;
        return;
    end;
end;
onDied = function() --[[ Line: 600 ]] --[[ Name: onDied ]]
    -- upvalues: v2 (ref)
    v2 = "Dead";
end;
onJumping = function() --[[ Line: 604 ]] --[[ Name: onJumping ]]
    -- upvalues: l_Humanoid_0 (copy), v76 (ref), v2 (ref)
    playAnimation("jump", 0.1, l_Humanoid_0);
    v76 = 0.31;
    v2 = "Jumping";
end;
onClimbing = function(v125) --[[ Line: 610 ]] --[[ Name: onClimbing ]]
    -- upvalues: l_Humanoid_0 (copy), v2 (ref)
    playAnimation("climb", 0.1, l_Humanoid_0);
    setAnimationSpeed(v125 / 5);
    v2 = "Climbing";
end;
onGettingUp = function() --[[ Line: 617 ]] --[[ Name: onGettingUp ]]
    -- upvalues: v2 (ref)
    v2 = "GettingUp";
end;
onFreeFall = function() --[[ Line: 621 ]] --[[ Name: onFreeFall ]]
    -- upvalues: v76 (ref), l_Humanoid_0 (copy), v2 (ref)
    if v76 <= 0 then
        playAnimation("fall", 0.2, l_Humanoid_0);
    end;
    v2 = "FreeFall";
end;
onFallingDown = function() --[[ Line: 628 ]] --[[ Name: onFallingDown ]]
    -- upvalues: v2 (ref)
    v2 = "FallingDown";
end;
onSeated = function() --[[ Line: 632 ]] --[[ Name: onSeated ]]
    -- upvalues: v2 (ref)
    v2 = "Seated";
end;
onPlatformStanding = function() --[[ Line: 636 ]] --[[ Name: onPlatformStanding ]]
    -- upvalues: v2 (ref)
    v2 = "PlatformStanding";
end;
onSwimming = function(v126) --[[ Line: 643 ]] --[[ Name: onSwimming ]]
    -- upvalues: l_Humanoid_0 (copy), v2 (ref)
    if v126 > 1 then
        playAnimation("swim", 0.4, l_Humanoid_0);
        setAnimationSpeed(v126 / 10);
        v2 = "Swimming";
        return;
    else
        playAnimation("swimidle", 0.4, l_Humanoid_0);
        v2 = "Standing";
        return;
    end;
end;
animateTool = function() --[[ Line: 655 ]] --[[ Name: animateTool ]]
    -- upvalues: v74 (ref), l_Humanoid_0 (copy)
    if v74 == "None" then
        playToolAnimation("toolnone", 0.1, l_Humanoid_0, Enum.AnimationPriority.Idle);
        return;
    elseif v74 == "Slash" then
        playToolAnimation("toolslash", 0, l_Humanoid_0, Enum.AnimationPriority.Action);
        return;
    elseif v74 == "Lunge" then
        playToolAnimation("toollunge", 0, l_Humanoid_0, Enum.AnimationPriority.Action);
        return;
    else
        return;
    end;
end;
getToolAnim = function(v127) --[[ Line: 672 ]] --[[ Name: getToolAnim ]]
    for _, v129 in ipairs(v127:GetChildren()) do
        if v129.Name == "toolanim" and v129.className == "StringValue" then
            return v129;
        end;
    end;
    return nil;
end;
local v130 = 0;
stepAnimate = function(v131) --[[ Line: 683 ]] --[[ Name: stepAnimate ]]
    -- upvalues: v130 (ref), v76 (ref), v2 (ref), l_Humanoid_0 (copy), l_Parent_0 (copy), v74 (ref), v75 (ref), v114 (ref)
    local v132 = 1;
    local v133 = 1;
    local v134 = v131 - v130;
    v130 = v131;
    local v135 = false;
    if v76 > 0 then
        v76 = v76 - v134;
    end;
    if v2 == "FreeFall" and v76 <= 0 then
        playAnimation("fall", 0.2, l_Humanoid_0);
    elseif v2 == "Seated" then
        playAnimation("sit", 0.5, l_Humanoid_0);
        return;
    elseif v2 == "Running" then
        playAnimation("walk", 0.2, l_Humanoid_0);
    elseif v2 == "Dead" or v2 == "GettingUp" or v2 == "FallingDown" or v2 == "Seated" or v2 == "PlatformStanding" then
        stopAllAnimations();
        v132 = 0.1;
        v133 = 1;
        v135 = true;
    end;
    local l_Tool_0 = l_Parent_0:FindFirstChildOfClass("Tool");
    if l_Tool_0 and l_Tool_0:FindFirstChild("Handle") then
        local v137 = getToolAnim(l_Tool_0);
        if v137 then
            v74 = v137.Value;
            v137.Parent = nil;
            v75 = v131 + 0.3;
        end;
        if v75 < v131 then
            v75 = 0;
            v74 = "None";
        end;
        animateTool();
        return;
    else
        stopToolAnimations();
        v74 = "None";
        v114 = nil;
        v75 = 0;
        return;
    end;
end;
l_Humanoid_0.Died:connect(onDied);
l_Humanoid_0.Running:connect(onRunning);
l_Humanoid_0.Jumping:connect(onJumping);
l_Humanoid_0.Climbing:connect(onClimbing);
l_Humanoid_0.GettingUp:connect(onGettingUp);
l_Humanoid_0.FreeFalling:connect(onFreeFall);
l_Humanoid_0.FallingDown:connect(onFallingDown);
l_Humanoid_0.Seated:connect(onSeated);
l_Humanoid_0.PlatformStanding:connect(onPlatformStanding);
l_Humanoid_0.Swimming:connect(onSwimming);
game:GetService("Players").LocalPlayer.Chatted:connect(function(v138) --[[ Line: 749 ]]
    -- upvalues: v2 (ref), v19 (copy), l_Humanoid_0 (copy)
    local v139 = "";
    if string.sub(v138, 1, 3) == "/e " then
        v139 = string.sub(v138, 4);
    elseif string.sub(v138, 1, 7) == "/emote " then
        v139 = string.sub(v138, 8);
    end;
    if v2 == "Standing" and v19[v139] ~= nil then
        playAnimation(v139, 0.1, l_Humanoid_0);
    end;
end);
script:WaitForChild("PlayEmote").OnInvoke = function(v140) --[[ Line: 763 ]]
    -- upvalues: v2 (ref), v19 (copy), l_Humanoid_0 (copy), l_status_1 (ref), v11 (ref)
    if v2 ~= "Standing" then
        return;
    elseif v19[v140] ~= nil then
        playAnimation(v140, 0.1, l_Humanoid_0);
        if l_status_1 then
            return true, v11;
        else
            return true;
        end;
    elseif typeof(v140) == "Instance" and v140:IsA("Animation") then
        playEmote(v140, 0.1, l_Humanoid_0);
        if l_status_1 then
            return true, v11;
        else
            return true;
        end;
    else
        return false;
    end;
end;
if l_Parent_0.Parent ~= nil then
    playAnimation("idle", 0.1, l_Humanoid_0);
    v2 = "Standing";
end;
while l_Parent_0.Parent ~= nil do
    local _, v142 = wait(0.1);
    stepAnimate(v142);
end;