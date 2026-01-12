local l_Utils_0 = game:GetService("ReplicatedStorage").Modules.Utils;
local l_Camera_0 = workspace.Camera;
local l_Sounds_0 = script.Sounds;
local l_Animations_0 = script.Animations;
local l_Assets_0 = script.Assets;
local v5 = {
    Forward = "Backward", 
    Backward = "Forward"
};
local v6 = require(l_Utils_0.Signal);
local v7 = require(l_Utils_0.Spring);
local v8 = require(l_Utils_0.Cleaner);
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v6 (copy), v8 (copy)
    local v13 = setmetatable({}, v9);
    v13.Destroyed = v6.new();
    v13._cleaner = v8.new();
    v13._distanceReverseThreshold = 5;
    v13._start = os.clock();
    v13._character = v10;
    v13._rootPart = v10.HumanoidRootPart;
    v13._baseVelocity = 50;
    v13._velocity = v13._baseVelocity;
    v13._direction = v13:_getDirection(v11);
    v13._partData = v13:_getPartData(v11);
    v13._heightOffset = v13:_getHeightOffset(v12);
    v13._animations = v13:_getAnimations();
    v13._faceDirection = v13._rootPart.CFrame.LookVector;
    v13._spring = v13:_createSpring();
    v13._sparks = v13:_createSparkVFX();
    v13._startDistance = v13:_getStartingDistance(v11);
    v13._updateCallbacks = {};
    return v13;
end;
v9._getStartingDistance = function(v14, v15) --[[ Line: 67 ]] --[[ Name: _getStartingDistance ]]
    local l_Z_0 = v15.Size.Z;
    local v17 = v15.CFrame * CFrame.new(0, 0, (l_Z_0 / 2 - l_Z_0) * (v14._direction == "Forward" and 1 or -1)) * CFrame.Angles(0, v14._direction == "Forward" and 0 or 3.141592653589793, 0);
    return -v17.LookVector:Dot(v14._rootPart.Position - v17.Position);
end;
v9._createSparkVFX = function(_) --[[ Line: 74 ]] --[[ Name: _createSparkVFX ]]
    -- upvalues: l_Assets_0 (copy)
    local v19 = l_Assets_0.VFX:Clone();
    v19.Parent = workspace.Effects;
    return v19;
end;
v9._getAnimations = function(v20) --[[ Line: 80 ]] --[[ Name: _getAnimations ]]
    -- upvalues: l_Animations_0 (copy)
    local l_Animator_0 = v20._character.Humanoid.Animator;
    local l_l_Animations_0_Children_0 = l_Animations_0:GetChildren();
    local v23 = {};
    for v24 = 1, #l_l_Animations_0_Children_0 do
        v23[l_l_Animations_0_Children_0[v24].Name] = l_Animator_0:LoadAnimation(l_l_Animations_0_Children_0[v24]);
        v23[l_l_Animations_0_Children_0[v24].Name].Priority = Enum.AnimationPriority.Action2;
    end;
    return v23;
end;
v9._getHeightOffset = function(v25, v26) --[[ Line: 94 ]] --[[ Name: _getHeightOffset ]]
    local l__rootPart_0 = v25._rootPart;
    local l_Humanoid_0 = v25._character.Humanoid;
    local v29 = l__rootPart_0.Size.Y * 0.5 + l_Humanoid_0.HipHeight / 1.4;
    return CFrame.new(0, v29 * v26, 0);
end;
v9._createSpring = function(v30) --[[ Line: 106 ]] --[[ Name: _createSpring ]]
    -- upvalues: v7 (copy)
    local v31 = v7.new(v30._rootPart.CFrame.LookVector);
    v31.Damper = 0.1;
    v31.Speed = 2;
    return v31;
end;
v9._getPartByDistance = function(v32, v33) --[[ Line: 113 ]] --[[ Name: _getPartByDistance ]]
    local l__partData_0 = v32._partData;
    local v35 = 1;
    local v36 = #l__partData_0;
    while true do
        if v35 <= v36 then
            local v37 = math.floor((v36 + v35) / 2);
            local v38 = v37 == 1 and 0 or l__partData_0[v37 - 1].Distance;
            if v33 <= l__partData_0[v37].Distance and v38 <= v33 then
                return l__partData_0[v37];
            elseif v33 < v38 then
                v36 = v37 - 1;
            else
                v35 = v37 + 1;
            end;
        else
            return;
        end;
    end;
end;
v9._getPartData = function(v39, v40) --[[ Line: 131 ]] --[[ Name: _getPartData ]]
    local l__direction_0 = v39._direction;
    local l_Z_1 = v40.Size.Z;
    local v43 = {
        {
            Part = v40, 
            Distance = l_Z_1, 
            Length = v40.Size.Z
        }
    };
    while true do
        local l_v40_FirstChild_0 = v40:FindFirstChild(l__direction_0);
        if l_v40_FirstChild_0 then
            local l_Value_0 = l_v40_FirstChild_0.Value;
            local l_Z_2 = l_Value_0.Size.Z;
            l_Z_1 = l_Z_1 + l_Z_2;
            v40 = l_Value_0;
            table.insert(v43, {
                Part = v40, 
                Distance = l_Z_1, 
                Length = l_Z_2
            });
        else
            break;
        end;
    end;
    return v43;
end;
v9._createBodyMovers = function(v47) --[[ Line: 161 ]] --[[ Name: _createBodyMovers ]]
    local l__rootPart_1 = v47._rootPart;
    local l_BodyPosition_0 = Instance.new("BodyPosition");
    l_BodyPosition_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
    l_BodyPosition_0.Position = l__rootPart_1.Position;
    l_BodyPosition_0.D = 250;
    l_BodyPosition_0.P = 100000;
    l_BodyPosition_0.Parent = l__rootPart_1;
    local l_BodyGyro_0 = Instance.new("BodyGyro");
    l_BodyGyro_0.MaxTorque = Vector3.new(2000000000, 2000000000, 2000000000, 0);
    l_BodyGyro_0.CFrame = l__rootPart_1.CFrame;
    l_BodyGyro_0.D = 1000;
    l_BodyGyro_0.P = 100000;
    l_BodyGyro_0.Parent = l__rootPart_1;
    v47._cleaner:AddTask(l_BodyPosition_0, l_BodyGyro_0);
    return {
        BodyPosition = l_BodyPosition_0, 
        BodyGyro = l_BodyGyro_0
    };
end;
v9._getDirection = function(v51, v52) --[[ Line: 183 ]] --[[ Name: _getDirection ]]
    -- upvalues: l_Camera_0 (copy), v5 (copy)
    local _ = v51._rootPart;
    local l_LookVector_0 = l_Camera_0.CFrame.LookVector;
    local v55 = -1;
    local v56 = nil;
    for _, v58 in v52:GetChildren() do
        local v59 = vector.dot(l_LookVector_0, (v58.Value.Position - v52.Position).Unit);
        if v59 >= v55 then
            v55 = v59;
            v56 = v58.Name;
        end;
    end;
    local l__distanceReverseThreshold_0 = v51._distanceReverseThreshold;
    local v61 = 0;
    local l_v52_0 = v52;
    while true do
        local l_l_v52_0_FirstChild_0 = l_v52_0:FindFirstChild(v56);
        if l_l_v52_0_FirstChild_0 then
            l_v52_0 = l_l_v52_0_FirstChild_0.Value;
            v61 = v61 + v52.Size.Z;
        else
            break;
        end;
    end;
    return v61 < l__distanceReverseThreshold_0 and v5[v56] or v56;
end;
v9.Update = function(v64, v65) --[[ Line: 218 ]] --[[ Name: Update ]]
    local v66 = math.max((os.clock() - v64._start) * v64._velocity + v64._startDistance, 0);
    local v67 = v64:_getPartByDistance(v66);
    if not v67 then
        v64:Exit();
        return;
    else
        local l__character_0 = v64._character;
        if l__character_0:FindFirstChild("Stun") then
            v64:Exit();
            return;
        elseif l__character_0:GetAttribute("flyMode") then
            v64:Exit();
            return;
        else
            local _ = v64._character;
            local l_Humanoid_1 = v64._character.Humanoid;
            local l_Part_0 = v67.Part;
            local v72 = (v67.Distance - v66) / v67.Length;
            local l__heightOffset_0 = v64._heightOffset;
            local v74 = l_Part_0.CFrame * CFrame.new(0, 0, (v67.Length / 2 - v67.Length * v72) * (v64._direction == "Forward" and 1 or -1)) * CFrame.Angles(0, v64._direction == "Forward" and 3.141592653589793 or 0, 0);
            v64._spring.Target = v74.LookVector;
            local v75 = l_Humanoid_1.RootPart.CFrame:ToObjectSpace(CFrame.new(l_Humanoid_1.RootPart.Position + v64._spring.Position));
            local v76 = v74 * CFrame.Angles(v75.Z / 2, 0, v75.X / 2);
            local v77 = -math.min(v75.X, 0.001) * 2;
            v64._animations.HoldSwayLeft:AdjustWeight(v77);
            v64._animations.GrindLeft:AdjustWeight(v77);
            local v78 = math.max(v75.X, 0.001) * 2;
            v64._animations.HoldSwayRight:AdjustWeight(v78);
            v64._animations.GrindRight:AdjustWeight(v78);
            local v79 = 1 - (v77 + v78);
            v64._animations.Grind:AdjustWeight(v79);
            v64._animations.Hold:AdjustWeight(v79);
            v64._sparks.CFrame = v76;
            v64._faceDirection = v64._faceDirection:Lerp(v76.LookVector, v65 * 15);
            v64._character.PrimaryPart.CFrame = CFrame.lookAlong((v76 * l__heightOffset_0).Position, v64._faceDirection);
            v64._character.PrimaryPart.AssemblyLinearVelocity = Vector3.new();
            v64._character.PrimaryPart.AssemblyAngularVelocity = Vector3.new();
            v64._velocity = v64._velocity + v65 * 2;
            if v64.LoopSound then
                v64.LoopSound.Pitch = v64._velocity / v64._baseVelocity;
            end;
            for _, v81 in v64._updateCallbacks do
                v81(v66, v76, v75);
            end;
            return;
        end;
    end;
end;
v9._createZiplineHandle = function(v82) --[[ Line: 288 ]] --[[ Name: _createZiplineHandle ]]
    -- upvalues: l_Assets_0 (copy)
    local v83 = l_Assets_0.ZiplineHandle:Clone();
    v83.Parent = workspace.Effects;
    local l_v83_ExtentsSize_0 = v83:GetExtentsSize();
    for _, v86 in v83:GetDescendants() do
        if v86:IsA("BasePart") then
            v86.Anchored = true;
        end;
    end;
    v82._heightOffset = v82._heightOffset * CFrame.new(0, -l_v83_ExtentsSize_0.Y * 0.7, 0);
    v82._cleaner:AddTask(v83);
    return v83;
end;
v9.Enter = function(v87) --[[ Line: 305 ]] --[[ Name: Enter ]]
    -- upvalues: l_Sounds_0 (copy)
    local l_Humanoid_2 = v87._character.Humanoid;
    local l__character_2 = v87._character;
    l_Humanoid_2.EvaluateStateMachine = false;
    v87._character.Humanoid.AutoRotate = false;
    local v90 = l_Sounds_0.ZiplineStart:Clone();
    v90.Parent = v87._rootPart;
    v90:Play();
    task.delay(5, v90.Destroy, v90);
    local v91 = l_Sounds_0.ZiplineLoop:Clone();
    v91.Parent = v87._rootPart;
    v91:Play();
    v87.LoopSound = v91;
    v87._cleaner:AddTask(v91);
    _G.canuse = false;
    if l__character_2:FindFirstChild("inCombat") then
        v87._velocity = v87._baseVelocity / 2;
    end;
    local l_RagdollConstraints_0 = l__character_2:FindFirstChild("RagdollConstraints");
    if l_RagdollConstraints_0 then
        for _, v94 in ipairs(l_RagdollConstraints_0:GetChildren()) do
            if v94:IsA("Constraint") then
                local _ = v94.Attachment1;
                v94.Enabled = false;
            end;
        end;
    end;
    if v87._heightOffset.Y < 0 then
        v87._animations.Hold:Play(nil, 0.001);
        v87._animations.HoldSwayLeft:Play(nil, 0.001);
        v87._animations.HoldSwayRight:Play(nil, 0.001);
        local v96 = v87:_createZiplineHandle();
        local v97 = Instance.new("Attachment", workspace.Terrain);
        local l_v96_FirstChild_0 = v96:FindFirstChild("HandleAttachment", true);
        local l_IKControl_0 = Instance.new("IKControl");
        l_IKControl_0.ChainRoot = v87._character.RightUpperArm;
        l_IKControl_0.EndEffector = v87._character.RightHand;
        l_IKControl_0.Target = v97;
        l_IKControl_0.Parent = v87._rootPart;
        v97.WorldCFrame = v87._character.RightUpperArm.CFrame;
        v87._cleaner:AddTask(v97, l_IKControl_0);
        table.insert(v87._updateCallbacks, function(_, v101, _) --[[ Line: 361 ]]
            -- upvalues: v96 (copy), v87 (copy), v97 (copy), l_v96_FirstChild_0 (copy)
            if not v101 then
                return;
            else
                v96:PivotTo(v101 * CFrame.Angles(3.141592653589793, v87._direction == "Forward" and 3.141592653589793 or 0, 0) * CFrame.new(0, -0.8, 0));
                v97.WorldCFrame = l_v96_FirstChild_0.WorldCFrame * CFrame.Angles(3.141592653589793, v87._direction == "Forward" and 3.141592653589793 or 0, 0);
                return;
            end;
        end);
    else
        local l__character_3 = v87._character;
        v87._animations.Grind:Play(nil, 0.001);
        v87._animations.GrindLeft:Play(nil, 0.001);
        v87._animations.GrindRight:Play(nil, 0.001);
        local v104 = Instance.new("Attachment", workspace.Terrain);
        local v105 = Instance.new("Attachment", workspace.Terrain);
        v105.WorldCFrame = l__character_3.RightFoot.CFrame;
        v104.WorldCFrame = l__character_3.LeftFoot.CFrame;
        local l_IKControl_1 = Instance.new("IKControl");
        l_IKControl_1.ChainRoot = v87._character.LeftUpperLeg;
        l_IKControl_1.EndEffector = v87._character.LeftFoot;
        l_IKControl_1.Target = v104;
        l_IKControl_1.Parent = v87._rootPart;
        local l_IKControl_2 = Instance.new("IKControl");
        l_IKControl_2.ChainRoot = v87._character.RightUpperLeg;
        l_IKControl_2.EndEffector = v87._character.RightFoot;
        l_IKControl_2.Target = v105;
        l_IKControl_2.Parent = v87._rootPart;
        v87._cleaner:AddTask(v104, v105, l_IKControl_1, l_IKControl_2);
        table.insert(v87._updateCallbacks, function(v108) --[[ Line: 394 ]]
            -- upvalues: v87 (copy), v104 (copy), v105 (copy)
            local v109 = v108 + 2;
            local v110 = v87:_getPartByDistance(v109);
            local v111 = CFrame.new(0, -0.25, 0) * CFrame.Angles(3.141592653589793, 0, 0);
            if v110 then
                local l_Part_1 = v110.Part;
                local v113 = (v110.Distance - v109) / v110.Length;
                v104.WorldCFrame = l_Part_1.CFrame * CFrame.new(0, 0, (v110.Length / 2 - v110.Length * v113) * (v87._direction == "Forward" and 1 or -1)) * CFrame.Angles(3.141592653589793, v87._direction == "Forward" and 3.141592653589793 or 0, 0) * v111;
            end;
            local v114 = v108 - 1;
            local v115 = v87:_getPartByDistance(v114);
            if v115 then
                local l_Part_2 = v115.Part;
                local v117 = (v115.Distance - v114) / v115.Length;
                v105.WorldCFrame = l_Part_2.CFrame * CFrame.new(0, 0, (v115.Length / 2 - v115.Length * v117) * (v87._direction == "Forward" and 1 or -1)) * CFrame.Angles(3.141592653589793, v87._direction == "Forward" and 3.141592653589793 or 0, 0) * v111;
            end;
        end);
    end;
    for _, v119 in v87._updateCallbacks do
        v119(0);
    end;
end;
v9.Exit = function(v120, v121) --[[ Line: 431 ]] --[[ Name: Exit ]]
    -- upvalues: l_Sounds_0 (copy)
    v120._character.Humanoid.EvaluateStateMachine = true;
    v120._character.Humanoid.AutoRotate = true;
    for _, v123 in v120._sparks:GetDescendants() do
        if v123:IsA("ParticleEmitter") then
            v123.Enabled = false;
        end;
    end;
    task.delay(1, v120._sparks.Destroy, v120._sparks);
    for _, v125 in pairs(v120._animations) do
        v125:AdjustWeight(0.001);
        v125:Stop();
    end;
    v120.LoopSound = nil;
    local l_RagdollConstraints_1 = v120._character:FindFirstChild("RagdollConstraints");
    if l_RagdollConstraints_1 then
        for _, v128 in ipairs(l_RagdollConstraints_1:GetChildren()) do
            if v128:IsA("Constraint") then
                local _ = v128.Attachment1;
                v128.Enabled = true;
            end;
        end;
    end;
    local v130 = l_Sounds_0.ZiplineEnd:Clone();
    v130.Parent = v120._rootPart;
    v130:Play();
    task.delay(5, v130.Destroy, v130);
    if v121 then
        v120._animations.Dismount:Play();
        local v131 = l_Sounds_0.ZiplineJump:Clone();
        v131.Parent = v120._rootPart;
        v131:Play();
        task.delay(3, v131.Destroy, v131);
        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
        l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
        l_BodyVelocity_0.Velocity = Vector3.new(0, 75, 0, 0) + v120._rootPart.CFrame.LookVector * 35;
        l_BodyVelocity_0.Parent = v120._character.LowerTorso;
        task.delay(0.1, l_BodyVelocity_0.Destroy, l_BodyVelocity_0);
    end;
    _G.canuse = true;
    v120:Destroy();
end;
v9.Destroy = function(v133) --[[ Line: 488 ]] --[[ Name: Destroy ]]
    v133._cleaner:Destroy();
    v133._rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
    v133.Destroyed:Fire();
    setmetatable(v133, nil);
end;
return v9;