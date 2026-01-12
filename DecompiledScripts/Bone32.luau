--!native
local l_Dependencies_0 = script.Parent.Parent:WaitForChild("Dependencies");
local l_Config_0 = require(l_Dependencies_0:WaitForChild("Config"));
local l_Gizmo_0 = require(l_Dependencies_0:WaitForChild("Gizmo"));
local l_Utilities_0 = require(l_Dependencies_0:WaitForChild("Utilities"));
if game:GetService("RunService"):IsStudio() or l_Config_0.ALLOW_LIVE_GAME_DEBUG then
    l_Gizmo_0.Init();
end;
local l_Constraints_0 = script.Parent:WaitForChild("Constraints");
local l_AxisConstraint_0 = require(l_Constraints_0:WaitForChild("AxisConstraint"));
local l_CollisionConstraint_0 = require(l_Constraints_0:WaitForChild("CollisionConstraint"));
local l_DistanceConstraint_0 = require(l_Constraints_0:WaitForChild("DistanceConstraint"));
local l_FrictionConstraint_0 = require(l_Constraints_0:WaitForChild("FrictionConstraint"));
local l_RopeConstraint_0 = require(l_Constraints_0:WaitForChild("RopeConstraint"));
local l_RotationConstraint_0 = require(l_Constraints_0:WaitForChild("RotationConstraint"));
local l_SpringConstraint_0 = require(l_Constraints_0:WaitForChild("SpringConstraint"));
local _ = l_Utilities_0.SB_ASSERT_CB;
local l_SB_VERBOSE_LOG_0 = l_Utilities_0.SB_VERBOSE_LOG;
local function _(v14) --[[ Line: 73 ]] --[[ Name: IsNaN ]]
    if v14 ~= v14 then
        return true;
    else
        return false;
    end;
end;
local v16 = {};
local function v17(v18) --[[ Line: 86 ]] --[[ Name: QueryTransformedWorldCFrameNonSmartbone ]]
    -- upvalues: v16 (copy), v17 (copy)
    debug.profilebegin("QueryTransformedWorldCFrameNonSmartbone");
    local v19 = v16[v18];
    if v19 and v19.Frame == shared.FrameCounter then
        return v19.CFrame;
    else
        local l_Parent_0 = v18.Parent;
        local _ = nil;
        local v22 = (if l_Parent_0:IsA("Bone") then v17(l_Parent_0) else l_Parent_0.CFrame) * v18.TransformedCFrame;
        v16[v18] = {
            Frame = shared.FrameCounter, 
            CFrame = v22
        };
        debug.profileend();
        return v22;
    end;
end;
local function v23(v24, v25) --[[ Line: 113 ]] --[[ Name: QueryTransformedWorldCFrame ]]
    -- upvalues: v17 (copy), v23 (copy)
    debug.profilebegin("QueryTransformedWorldCFrame");
    v25.SolvedAnimatedCFrame = true;
    local l_ParentIndex_0 = v25.ParentIndex;
    local l_Bone_0 = v25.Bone;
    if l_ParentIndex_0 < 1 then
        debug.profileend();
        return (v17(l_Bone_0));
    else
        local v28 = v24.Bones[l_ParentIndex_0];
        if not v28.SolvedAnimatedCFrame then
            v28.AnimatedWorldCFrame = v23(v24, v28);
        end;
        debug.profileend();
        return v28.AnimatedWorldCFrame * l_Bone_0.TransformedCFrame;
    end;
end;
local function _(v29, v30, v31) --[[ Line: 135 ]] --[[ Name: ClipVector ]]
    return v29 * (Vector3.new(1, 1, 1, 0) - v31) + v30 * v31;
end;
local function _(v33, v34) --[[ Line: 141 ]] --[[ Name: GetFriction ]]
    local l_CurrentPhysicalProperties_0 = v33.CurrentPhysicalProperties;
    local l_CurrentPhysicalProperties_1 = v34.CurrentPhysicalProperties;
    local l_Friction_0 = l_CurrentPhysicalProperties_0.Friction;
    local l_FrictionWeight_0 = l_CurrentPhysicalProperties_0.FrictionWeight;
    local l_Friction_1 = l_CurrentPhysicalProperties_1.Friction;
    local l_FrictionWeight_1 = l_CurrentPhysicalProperties_1.FrictionWeight;
    return (l_Friction_0 * l_FrictionWeight_0 + l_Friction_1 * l_FrictionWeight_1) / (l_FrictionWeight_0 + l_FrictionWeight_1);
end;
local function v82(v42, v43) --[[ Line: 154 ]] --[[ Name: SolveWind ]]
    local l_Settings_0 = v43.Settings;
    local l_WindType_0 = l_Settings_0.WindType;
    if l_WindType_0 ~= "Sine" and l_WindType_0 ~= "Noise" and l_WindType_0 ~= "Hybrid" then
        return (Vector3.new(0, 0, 0, 0));
    else
        local v46 = v43.WindOffset + (os.clock() - v42.HeirarchyLength * 0.2 + (v42.TransformOffset.Position - v43.Root.WorldPosition).Magnitude * 0.2) * l_Settings_0.WindInfluence;
        local v47 = nil;
        local function _(v48, v49, v50, v51) --[[ Line: 170 ]] --[[ Name: GetNoise ]]
            local v52 = math.clamp(math.noise(v48, v49, v50), -1, 1);
            if v51 then
                v52 = v52 ^ 2;
            end;
            return v52;
        end;
        local function _() --[[ Line: 181 ]] --[[ Name: SampleGust ]]
            -- upvalues: v46 (copy)
            return math.sin(v46 * 1) * 0.3 + 0.7;
        end;
        local function _() --[[ Line: 187 ]] --[[ Name: SampleSin ]]
            -- upvalues: l_Settings_0 (copy), v46 (copy)
            local v55 = l_Settings_0.WindStrength ^ 0.8;
            local v56 = l_Settings_0.WindSpeed * 2;
            local v57 = math.sin(v46 * v55) ^ 2;
            local v58 = math.cos(v46 * v55) ^ 2;
            local v59 = (v57 + (v58 - v57) * v58) * v56;
            return l_Settings_0.WindDirection * v59;
        end;
        local function v71(v61, v62) --[[ Line: 196 ]] --[[ Name: SampleNoise ]]
            -- upvalues: l_Settings_0 (copy), v43 (copy)
            v61 = v61 or 0;
            local v63 = l_Settings_0.WindStrength ^ 0.8;
            local v64 = l_Settings_0.WindSpeed * 2;
            local l_WindOffset_0 = v43.WindOffset;
            local v66 = math.clamp(math.noise(v63, 0, l_WindOffset_0), -1, 1);
            if v62 then
                v66 = v66 ^ 2;
            end;
            local v67 = v66 * (v64 + v61);
            local v68 = math.clamp(math.noise(0, v63, l_WindOffset_0), -1, 1);
            if v62 then
                v68 = v68 ^ 2;
            end;
            local v69 = v68 * (v64 + v61);
            local v70 = math.clamp(math.noise(l_WindOffset_0, 0, v63), -1, 1);
            if v62 then
                v70 = v70 ^ 2;
            end;
            v66 = v70 * (v64 + v61);
            return l_Settings_0.WindDirection * Vector3.new(v67, v69, v66);
        end;
        if l_Settings_0.WindType == "Sine" then
            local v72 = l_Settings_0.WindStrength ^ 0.8;
            local v73 = l_Settings_0.WindSpeed * 2;
            local v74 = math.sin(v46 * v72) ^ 2;
            local v75 = math.cos(v46 * v72) ^ 2;
            local v76 = (v74 + (v75 - v74) * v75) * v73;
            v47 = l_Settings_0.WindDirection * v76 * (math.sin(v46 * 1) * 0.3 + 0.7);
        elseif l_Settings_0.WindType == "Noise" then
            v47 = v71(0, true) * (math.sin(v46 * 1) * 0.3 + 0.7);
        elseif l_Settings_0.WindType == "Hybrid" then
            local v77 = l_Settings_0.WindStrength ^ 0.8;
            local v78 = l_Settings_0.WindSpeed * 2;
            local v79 = math.sin(v46 * v77) ^ 2;
            local v80 = math.cos(v46 * v77) ^ 2;
            local v81 = (v79 + (v80 - v79) * v80) * v78;
            v47 = (l_Settings_0.WindDirection * v81 * (math.sin(v46 * 1) * 0.3 + 0.7) + v71(0.5, true) * (math.sin(v46 * 1) * 0.3 + 0.7)) * 0.5;
        end;
        return v47 / math.max(v42.FreeLength, 0.01) * (l_Settings_0.WindInfluence * (l_Settings_0.WindStrength * 0.01) * (math.clamp(v42.HeirarchyLength, 1, 10) * 0.1)) * v42.Weight;
    end;
end;
local v83 = {};
v83.__index = v83;
v83.new = function(v84, v85, v86) --[[ Line: 321 ]] --[[ Name: new ]]
    -- upvalues: v83 (copy), l_Utilities_0 (copy)
    local v87 = v84.Parent:IsA("Bone") and v84.Parent.TransformedWorldCFrame or v86.CFrame;
    local v88 = setmetatable({
        Bone = v84, 
        FreeLength = -1, 
        Weight = 0.7, 
        ParentIndex = -1, 
        HeirarchyLength = 0, 
        Transform = v84.TransformedWorldCFrame:ToObjectSpace(v87):Inverse(), 
        LocalTransform = v84.TransformedCFrame:ToObjectSpace(v85.TransformedCFrame):Inverse(), 
        RootPart = v86, 
        RootBone = v85, 
        Radius = 0, 
        Friction = 0, 
        RotationLimit = 0, 
        Force = nil, 
        Gravity = nil, 
        SolvedAnimatedCFrame = false, 
        HasChild = false, 
        AnimatedWorldCFrame = v84.TransformedWorldCFrame, 
        StartingCFrame = v84.TransformedCFrame, 
        TransformOffset = CFrame.identity, 
        LocalTransformOffset = CFrame.identity, 
        RestPosition = Vector3.new(0, 0, 0, 0), 
        CalculatedWorldCFrame = v84.TransformedWorldCFrame, 
        Position = v84.TransformedWorldCFrame.Position, 
        LastPosition = v84.TransformedWorldCFrame.Position, 
        WeldPosition = Vector3.new(0, 0, 0, 0), 
        ActiveWeld = false, 
        RigidWeld = false, 
        Anchored = false, 
        AxisLocked = {
            false, 
            false, 
            false
        }, 
        XAxisLimits = NumberRange.new(-1e999, 1e999), 
        YAxisLimits = NumberRange.new(-1e999, 1e999), 
        ZAxisLimits = NumberRange.new(-1e999, 1e999), 
        FirstSkipUpdate = false, 
        CollisionHits = {}, 
        CollisionsData = {}
    }, v83);
    v88.AttributeConnection = v84.AttributeChanged:Connect(function(_) --[[ Line: 371 ]]
        -- upvalues: l_Utilities_0 (ref), v84 (copy), v88 (copy)
        for v90, v91 in (l_Utilities_0.GatherBoneSettings(v84)) do
            v88[v90] = v91 ~= "\194\172" and v91 or nil;
        end;
    end);
    return v88;
end;
v83.ClipVelocity = function(v92, v93, v94) --[[ Line: 388 ]] --[[ Name: ClipVelocity ]]
    v92.LastPosition = v92.LastPosition * (Vector3.new(1, 1, 1, 0) - v94) + v93 * v94;
end;
v83.PreUpdate = function(v95, v96) --[[ Line: 394 ]] --[[ Name: PreUpdate ]]
    -- upvalues: v23 (copy), v17 (copy)
    debug.profilebegin("Bone::PreUpdate");
    local v97 = v96.Bones[1];
    local v98 = v96.Bones[v95.ParentIndex];
    v95.AnimatedWorldCFrame = v23(v96, v95);
    local l_SmartWeld_0 = v95.Bone:FindFirstChild("SmartWeld");
    v95.ActiveWeld = false;
    if l_SmartWeld_0 and l_SmartWeld_0:IsA("ObjectValue") then
        local l_Value_0 = l_SmartWeld_0.Value;
        local v101 = true;
        if l_SmartWeld_0:GetAttribute("Rigid") ~= true then
            v101 = false;
        end;
        v95.RigidWeld = v101;
        if l_Value_0 then
            if l_Value_0:IsA("Attachment") then
                v95.WeldPosition = l_Value_0.WorldPosition;
                v95.ActiveWeld = true;
            elseif l_Value_0:IsA("BasePart") then
                v95.WeldPosition = l_Value_0.Position;
                v95.ActiveWeld = true;
            end;
        end;
    end;
    if v95.ParentIndex < 1 then
        v95.Anchored = true;
    end;
    if v95.Bone == v95.RootBone then
        local _ = nil;
        v95.TransformOffset = (if v95.Bone.Parent:IsA("Bone") then v17(v95.Bone.Parent) else v95.RootPart.CFrame) * v95.Transform;
    else
        v95.TransformOffset = v98.AnimatedWorldCFrame * v95.Transform;
    end;
    v95.LocalTransformOffset = v97.Bone.CFrame * v95.LocalTransform;
    debug.profileend();
end;
v83.StepPhysics = function(v103, v104, v105, v106) --[[ Line: 451 ]] --[[ Name: StepPhysics ]]
    -- upvalues: v82 (copy)
    debug.profilebegin("Bone::StepPhysics");
    if v103.Anchored then
        v103.LastPosition = v103.AnimatedWorldCFrame.Position;
        v103.Position = v103.AnimatedWorldCFrame.Position;
        debug.profileend();
        return;
    else
        if v103.Force or v103.Gravity then
            v105 = ((v103.Gravity or v104.Settings.Gravity) + (v103.Force or v104.Settings.Force)) * v106;
        end;
        local l_Settings_1 = v104.Settings;
        local v108 = v103.Position - v103.LastPosition;
        local v109 = v104.ObjectAcceleration * l_Settings_1.Inertia;
        local v110 = v82(v103, v104);
        v103.LastPosition = v103.Position;
        v103.Position = v103.Position + (v108 * (1 - l_Settings_1.Damping) + v105 + v109 + v110);
        debug.profileend();
        return;
    end;
end;
v83.Constrain = function(v111, v112, v113, v114, _) --[[ Line: 485 ]] --[[ Name: Constrain ]]
    -- upvalues: l_FrictionConstraint_0 (copy), l_CollisionConstraint_0 (copy), l_SpringConstraint_0 (copy), l_DistanceConstraint_0 (copy), l_RopeConstraint_0 (copy), l_AxisConstraint_0 (copy), l_RotationConstraint_0 (copy)
    debug.profilebegin("Bone::Constrain");
    if v111.Anchored then
        debug.profileend();
        return;
    else
        local l_Position_0 = v111.Position;
        local l_CFrame_0 = v111.RootPart.CFrame;
        l_Position_0 = l_FrictionConstraint_0(v111, l_Position_0, v111.LastPosition);
        if #v113 ~= 0 then
            l_Position_0 = l_CollisionConstraint_0(v111, l_Position_0, v113);
        end;
        l_Position_0 = if v112.Settings.Constraint == "Spring" then l_SpringConstraint_0(v111, l_Position_0, nil, v112, v114) else if v112.Settings.Constraint == "Distance" then l_DistanceConstraint_0(v111, l_Position_0, v112) else if v112.Settings.Constraint == "Rope" then l_RopeConstraint_0(v111, l_Position_0, v112) else v111.AnimatedWorldCFrame.Position;
        l_Position_0 = l_AxisConstraint_0(v111, l_Position_0, v111.LastPosition, l_CFrame_0);
        l_Position_0 = l_RotationConstraint_0(v111, l_Position_0, v112);
        if v111.ActiveWeld then
            if v111.RigidWeld then
                l_Position_0 = v111.WeldPosition;
                l_Position_0 = l_DistanceConstraint_0(v111, l_Position_0, v112);
            else
                l_Position_0 = l_SpringConstraint_0(v111, l_Position_0, v111.WeldPosition, v112, v114);
            end;
        end;
        v111.Friction = 0;
        for _, v119 in v111.CollisionHits do
            local l_CurrentPhysicalProperties_2 = v111.RootPart.CurrentPhysicalProperties;
            local l_CurrentPhysicalProperties_3 = v119.CurrentPhysicalProperties;
            local l_Friction_2 = l_CurrentPhysicalProperties_2.Friction;
            local l_FrictionWeight_2 = l_CurrentPhysicalProperties_2.FrictionWeight;
            local l_Friction_3 = l_CurrentPhysicalProperties_3.Friction;
            local l_FrictionWeight_3 = l_CurrentPhysicalProperties_3.FrictionWeight;
            v111.Friction = math.max((l_Friction_2 * l_FrictionWeight_2 + l_Friction_3 * l_FrictionWeight_3) / (l_FrictionWeight_2 + l_FrictionWeight_3), v111.Friction);
        end;
        v111.Position = l_Position_0;
        debug.profileend();
        return;
    end;
end;
v83.SkipUpdate = function(v126) --[[ Line: 544 ]] --[[ Name: SkipUpdate ]]
    -- upvalues: l_Config_0 (copy), l_SB_VERBOSE_LOG_0 (copy)
    if v126.FirstSkipUpdate == false and l_Config_0.RESET_TRANSFORM_ON_SKIP then
        l_SB_VERBOSE_LOG_0("Skipping bone, resetting transform.");
        v126.CalculatedWorldCFrame = v126.AnimatedWorldCFrame;
        v126.FirstSkipUpdate = true;
    end;
    v126.Position = v126.Bone.WorldPosition;
    v126.LastPosition = v126.Position;
end;
v83.SolveTransform = function(v127, v128, v129) --[[ Line: 559 ]] --[[ Name: SolveTransform ]]
    -- upvalues: l_Utilities_0 (copy)
    debug.profilebegin("Bone::SolveTransform");
    if v127.ParentIndex < 1 then
        debug.profileend();
        return;
    else
        v127.FirstSkipUpdate = false;
        local v130 = v128.Bones[v127.ParentIndex];
        local l_Bone_1 = v130.Bone;
        if v130 and l_Bone_1 then
            local l_TransformOffset_0 = v130.TransformOffset;
            local v133 = v127.Position - v130.Position;
            local v134 = l_Utilities_0.GetRotationBetween(l_TransformOffset_0.UpVector, v133).Rotation * l_TransformOffset_0.Rotation;
            local v135 = math.min(1 - 1.0E-5 ^ v129, 1);
            if v130.ActiveWeld and v130.RigidWeld then
                v130.CalculatedWorldCFrame = CFrame.new(v130.Position) * v134;
            else
                v130.CalculatedWorldCFrame = l_Bone_1.WorldCFrame:Lerp(CFrame.new(v130.Position) * v134, v135);
            end;
        end;
        debug.profileend();
        return;
    end;
end;
v83.ApplyTransform = function(v136, v137) --[[ Line: 593 ]] --[[ Name: ApplyTransform ]]
    debug.profilebegin("Bone::ApplyTransform");
    v136.SolvedAnimatedCFrame = false;
    if v136.ParentIndex < 1 then
        debug.profileend();
        return;
    else
        local v138 = v137.Bones[v136.ParentIndex];
        local l_Bone_2 = v138.Bone;
        if v138 and l_Bone_2 then
            if v138.Anchored and v137.Settings.AnchorsRotate == false then
                l_Bone_2.WorldCFrame = v138.TransformOffset;
            elseif v138.Anchored and v137.Settings.AnchorsRotate == true then
                l_Bone_2.WorldCFrame = v138.TransformOffset * v138.CalculatedWorldCFrame.Rotation;
                debug.profileend();
                return;
            elseif v138.Anchored then
                l_Bone_2.WorldCFrame = v138.TransformOffset;
                debug.profileend();
                return;
            else
                l_Bone_2.WorldCFrame = v138.CalculatedWorldCFrame;
            end;
        end;
        debug.profileend();
        return;
    end;
end;
v83.DrawDebug = function(v140, v141, v142, v143, v144, v145, v146) --[[ Line: 634 ]] --[[ Name: DrawDebug ]]
    -- upvalues: l_Gizmo_0 (copy)
    debug.profilebegin("Bone::DrawDebug");
    local v147 = Color3.fromRGB(255, 0, 0);
    local v148 = Color3.fromRGB(255, 94, 0);
    local v149 = Color3.fromRGB(234, 1, 255);
    local v150 = Color3.fromRGB(0, 255, 255);
    local v151 = Color3.fromRGB(255, 0, 0);
    local v152 = Color3.fromRGB(0, 255, 0);
    local v153 = Color3.fromRGB(0, 0, 255);
    local v154 = Color3.fromRGB(0, 183, 255);
    local v155 = Color3.fromRGB(255, 0, 0);
    local v156 = Color3.fromRGB(0, 255, 0);
    local v157 = Color3.fromRGB(0, 0, 255);
    local v158 = Color3.fromRGB(28, 41, 224);
    local v159 = Color3.fromRGB(255, 27, 27);
    local v160 = 1;
    local l_AnimatedWorldCFrame_0 = v140.AnimatedWorldCFrame;
    local l_Position_1 = l_AnimatedWorldCFrame_0.Position;
    local v163 = CFrame.new(v140.Position);
    local v164 = CFrame.new(v140.LastPosition);
    if v144 then
        l_Gizmo_0.PushProperty("AlwaysOnTop", false);
        l_Gizmo_0.PushProperty("Color3", v147);
        l_Gizmo_0.Sphere:Draw(v163, v140.Radius, 10, 360);
        l_Gizmo_0.PushProperty("Color3", v148);
        l_Gizmo_0.Sphere:Draw(v164, v140.Radius, 10, 360);
        l_Gizmo_0.PushProperty("Color3", v149);
        l_Gizmo_0.Ray:Draw(v140.Position, v140.LastPosition);
    end;
    if v145 and not v140.Anchored then
        local v165 = v140.AxisLocked[1];
        local v166 = v140.AxisLocked[2];
        local v167 = v140.AxisLocked[3];
        local l_RootPart_0 = v140.RootPart;
        local v169 = l_RootPart_0.CFrame:PointToObjectSpace(l_Position_1);
        local l_RightVector_0 = l_RootPart_0.CFrame.RightVector;
        local l_UpVector_0 = l_RootPart_0.CFrame.UpVector;
        local l_LookVector_0 = l_RootPart_0.CFrame.LookVector;
        if not v165 then
            l_Gizmo_0.PushProperty("Color3", v155);
            l_Gizmo_0.Arrow:Draw(l_Position_1 - l_RightVector_0 * 2, l_Position_1 + l_RightVector_0 * 2, 0.05, 0.15, 9);
            local v173 = v140.XAxisLimits.Min - v169.X;
            local v174 = v140.XAxisLimits.Max - v169.X;
            l_Gizmo_0.Plane:Draw(l_Position_1 + l_RightVector_0 * v173, l_RightVector_0, (Vector3.new(5, 5, 0, 0)));
            l_Gizmo_0.Plane:Draw(l_Position_1 + l_RightVector_0 * v174, l_RightVector_0, (Vector3.new(5, 5, 0, 0)));
        end;
        if not v166 then
            l_Gizmo_0.PushProperty("Color3", v156);
            l_Gizmo_0.Arrow:Draw(l_Position_1 - l_UpVector_0 * 2, l_Position_1 + l_UpVector_0 * 2, 0.05, 0.15, 9);
            local v175 = v140.YAxisLimits.Min - v169.Y;
            local v176 = v140.YAxisLimits.Max - v169.Y;
            l_Gizmo_0.Plane:Draw(l_Position_1 + l_UpVector_0 * v175, l_UpVector_0, (Vector3.new(5, 5, 0, 0)));
            l_Gizmo_0.Plane:Draw(l_Position_1 + l_UpVector_0 * v176, l_UpVector_0, (Vector3.new(5, 5, 0, 0)));
        end;
        if not v167 then
            l_Gizmo_0.PushProperty("Color3", v157);
            l_Gizmo_0.Arrow:Draw(l_Position_1 - l_LookVector_0 * 2, l_Position_1 + l_LookVector_0 * 2, 0.05, 0.15, 9);
            local v177 = v140.ZAxisLimits.Min - v169.Z;
            local v178 = v140.ZAxisLimits.Max - v169.Z;
            l_Gizmo_0.Plane:Draw(l_Position_1 - l_LookVector_0 * v177, l_LookVector_0, (Vector3.new(5, 5, 0, 0)));
            l_Gizmo_0.Plane:Draw(l_Position_1 - l_LookVector_0 * v178, l_LookVector_0, (Vector3.new(5, 5, 0, 0)));
        end;
    end;
    if v143 then
        l_Gizmo_0.PushProperty("Color3", v150);
        l_Gizmo_0.Sphere:Draw(l_AnimatedWorldCFrame_0, 0.08, 5, 360);
        l_Gizmo_0.PushProperty("Color3", v151);
        l_Gizmo_0.VolumeArrow:Draw(l_Position_1, l_Position_1 + l_AnimatedWorldCFrame_0.LookVector * 0.25, 0.005, 0.015, 0.05, true);
        l_Gizmo_0.PushProperty("Color3", v152);
        l_Gizmo_0.VolumeArrow:Draw(l_Position_1, l_Position_1 + l_AnimatedWorldCFrame_0.UpVector * 0.25, 0.005, 0.015, 0.05, true);
        l_Gizmo_0.PushProperty("Color3", v153);
        l_Gizmo_0.VolumeArrow:Draw(l_Position_1, l_Position_1 + l_AnimatedWorldCFrame_0.RightVector * 0.25, 0.005, 0.015, 0.05, true);
    end;
    if v142 and not v140.Anchored then
        for _, v180 in v140.CollisionsData do
            l_Gizmo_0.PushProperty("Color3", v158);
            l_Gizmo_0.Sphere:Draw(CFrame.new(v180.ClosestPoint), 0.08, 5, 360);
            l_Gizmo_0.PushProperty("Color3", v159);
            l_Gizmo_0.Arrow:Draw(v180.ClosestPoint, v180.ClosestPoint + v180.Normal * 0.5, 0.05, 0.15, 9);
        end;
    end;
    if v146 and v140.RotationLimit < 180 and v140.RotationLimit > 0 and v140.ParentIndex > 0 and v140.HasChild then
        local v181 = nil;
        local v182 = 1;
        if v140.RotationLimit < 89.5 then
            v181 = v160 * math.tan((math.rad(v140.RotationLimit)));
        elseif v140.RotationLimit > 90 then
            v182 = -1;
            v181 = v160 * math.tan((math.rad(180 - v140.RotationLimit)));
        else
            v160 = 0;
            v181 = 5;
        end;
        v181 = math.min(v181, 5);
        if v181 == 5 then
            v160 = 0;
        end;
        local v183 = (v140.Position - v141.Bones[v140.ParentIndex].Position).Unit * v182;
        local v184 = CFrame.lookAt(l_Position_1 + v183 * (v160 / 2), l_Position_1 + -v183 * 500, l_AnimatedWorldCFrame_0.LookVector);
        l_Gizmo_0.PushProperty("Color3", v154);
        l_Gizmo_0.Cone:Draw(v184, v181, v160, 8 + v181 * 2);
    end;
    debug.profileend();
end;
v83.DrawOverlay = function(v185, v186) --[[ Line: 825 ]] --[[ Name: DrawOverlay ]]
    -- upvalues: l_Config_0 (copy)
    v186.Text((("Bone: %*"):format(v185.Bone.Name)));
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_NUMERICS then
        v186.Text((("Free Length: %*"):format(v185.FreeLength)));
        v186.Text((("Weight: %*"):format(v185.Weight)));
        v186.Text((("Parent Index: %*"):format(v185.ParentIndex)));
        v186.Text((("Heirarchy Length: %*"):format(v185.HeirarchyLength)));
        v186.Text((("Radius: %*"):format(v185.Radius)));
        v186.Text((("Friction: %*"):format(v185.Friction)));
        v186.Text((("Rotation Limit: %*"):format(v185.RotationLimit)));
    end;
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_CONSTRAIN then
        v186.Text((("Anchored: %*"):format(v185.Anchored)));
        v186.Text((("Axis Locked: %*, %*, %*"):format(v185.AxisLocked[1], v185.AxisLocked[2], v185.AxisLocked[3])));
        v186.Text((("X Axis Limit: %*"):format(v185.XAxisLimits)));
        v186.Text((("Y Axis Limit: %*"):format(v185.YAxisLimits)));
        v186.Text((("Z Axis Limit: %*"):format(v185.ZAxisLimits)));
    end;
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_WELD then
        v186.Text((("Active Weld: %*"):format(v185.ActiveWeld)));
        v186.Text((("Rigid Weld: %*"):format(v185.RigidWeld)));
        v186.Text((("Weld Position: %*"):format((string.format("%.3f, %.3f, %.3f", v185.WeldPosition.X, v185.WeldPosition.Y, v185.WeldPosition.Z)))));
    end;
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_FORCES then
        local v187 = v185.Force and string.format("%.3f, %.3f, %.3f", v185.Force.X, v185.Force.Y, v185.Force.Z) or "-, -, -";
        local v188 = v185.Gravity and string.format("%.3f, %.3f, %.3f", v185.Gravity.X, v185.Gravity.Y, v185.Gravity.Z) or "-, -, -";
        v186.Text((("Force: %*"):format(v187)));
        v186.Text((("Gravity: %*"):format(v188)));
    end;
end;
v83.Destroy = function(v189) --[[ Line: 861 ]] --[[ Name: Destroy ]]
    -- upvalues: l_Config_0 (copy)
    if l_Config_0.RESET_BONE_ON_DESTROY then
        task.synchronize();
        v189.Bone.CFrame = v189.StartingCFrame;
    end;
    v189.AttributeConnection:Disconnect();
    setmetatable(v189, nil);
end;
return v83;