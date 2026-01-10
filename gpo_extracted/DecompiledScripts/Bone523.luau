--!native
local l_Dependencies_0 = script.Parent.Parent:WaitForChild("Dependencies");
local l_Config_0 = require(l_Dependencies_0:WaitForChild("Config"));
local l_Gizmo_0 = require(l_Dependencies_0:WaitForChild("Debug"):WaitForChild("Gizmo"));
local l_Utilities_0 = require(l_Dependencies_0:WaitForChild("Utilities"));
local l_Constraints_0 = script.Parent:WaitForChild("Constraints");
local l_AxisConstraint_0 = require(l_Constraints_0:WaitForChild("AxisConstraint"));
local l_CollisionConstraint_0 = require(l_Constraints_0:WaitForChild("CollisionConstraint"));
local l_DistanceConstraint_0 = require(l_Constraints_0:WaitForChild("DistanceConstraint"));
local l_FrictionConstraint_0 = require(l_Constraints_0:WaitForChild("FrictionConstraint"));
local l_RopeConstraint_0 = require(l_Constraints_0:WaitForChild("RopeConstraint"));
local l_RotationConstraint_0 = require(l_Constraints_0:WaitForChild("RotationConstraint"));
local l_SpringConstraint_0 = require(l_Constraints_0:WaitForChild("SpringConstraint"));
local l_SB_ASSERT_CB_0 = l_Utilities_0.SB_ASSERT_CB;
local function _(v13) --[[ Line: 23 ]] --[[ Name: SafeUnit ]]
    if v13.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v13.Unit;
    end;
end;
local function _(v15) --[[ Line: 84 ]] --[[ Name: IsNaN ]]
    if v15 ~= v15 then
        return true;
    else
        return false;
    end;
end;
local v17 = {};
local function v18(v19) --[[ Line: 95 ]] --[[ Name: QueryTransformedWorldCFrameNonSmartbone ]]
    -- upvalues: v17 (copy), v18 (copy)
    local v20 = v17[v19];
    if v20 and v20.Frame == shared.FrameCounter then
        return v20.CFrame;
    else
        local l_Parent_0 = v19.Parent;
        local _ = nil;
        local v23 = (if l_Parent_0:IsA("Bone") then v18(l_Parent_0) else l_Parent_0.CFrame) * v19.TransformedCFrame;
        v17[v19] = {
            Frame = shared.FrameCounter, 
            CFrame = v23
        };
        return v23;
    end;
end;
local function v24(v25, v26) --[[ Line: 122 ]] --[[ Name: QueryTransformedWorldCFrame ]]
    -- upvalues: v18 (copy), v24 (copy)
    v26.SolvedAnimatedCFrame = true;
    local l_ParentIndex_0 = v26.ParentIndex;
    local l_Bone_0 = v26.Bone;
    if l_ParentIndex_0 < 1 then
        return (v18(l_Bone_0));
    else
        local v29 = v25.Bones[l_ParentIndex_0];
        if not v29.SolvedAnimatedCFrame then
            v29.AnimatedWorldCFrame = v24(v25, v29);
        end;
        return v29.AnimatedWorldCFrame * l_Bone_0.TransformedCFrame;
    end;
end;
local function _(v30, v31, v32) --[[ Line: 144 ]] --[[ Name: ClipVector ]]
    return v30 * (Vector3.new(1, 1, 1, 0) - v32) + v31 * v32;
end;
local function _(v34, v35) --[[ Line: 150 ]] --[[ Name: GetFriction ]]
    local l_CurrentPhysicalProperties_0 = v34.CurrentPhysicalProperties;
    local l_CurrentPhysicalProperties_1 = v35.CurrentPhysicalProperties;
    local l_Friction_0 = l_CurrentPhysicalProperties_0.Friction;
    local l_FrictionWeight_0 = l_CurrentPhysicalProperties_0.FrictionWeight;
    local l_Friction_1 = l_CurrentPhysicalProperties_1.Friction;
    local l_FrictionWeight_1 = l_CurrentPhysicalProperties_1.FrictionWeight;
    return (l_Friction_0 * l_FrictionWeight_0 + l_Friction_1 * l_FrictionWeight_1) / (l_FrictionWeight_0 + l_FrictionWeight_1);
end;
local function v87(v43, v44, v45) --[[ Line: 163 ]] --[[ Name: SolveWind ]]
    local l_Settings_0 = v44.Settings;
    local l_WindType_0 = l_Settings_0.WindType;
    if l_WindType_0 ~= "Sine" and l_WindType_0 ~= "Noise" and l_WindType_0 ~= "Hybrid" then
        return (Vector3.new(0, 0, 0, 0));
    else
        local v48 = v44.WindOffset + (os.clock() - v43.HeirarchyLength * 0.2 + (v43.TransformOffset.Position - v44.Root.WorldPosition).Magnitude * 0.2) * l_Settings_0.WindInfluence;
        local l_WindSpeed_0 = l_Settings_0.WindSpeed;
        local l_WindStrength_0 = l_Settings_0.WindStrength;
        if l_WindSpeed_0 <= 1.0E-6 or l_WindStrength_0 <= 1.0E-6 then
            return (Vector3.new(0, 0, 0, 0));
        else
            local l_WindDirection_0 = l_Settings_0.WindDirection;
            local v52 = if v45.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v45.Unit;
            local v53 = 1 - math.abs((v52:Dot(l_WindDirection_0)));
            if l_WindSpeed_0 > 0 then
                v53 = if v52:Dot(l_WindDirection_0) > 0 then v53 * math.abs(1 - v45.Magnitude / l_WindSpeed_0) else v53 * (1 + v45.Magnitude / l_WindSpeed_0);
            end;
            l_WindSpeed_0 = l_WindSpeed_0 * v53;
            local function _(v54) --[[ Line: 211 ]] --[[ Name: EaseInExpo ]]
                if v54 == 0 then
                    return 0;
                else
                    return 2 ^ (v54 * 10 - 10);
                end;
            end;
            local v56 = v45.Magnitude < 100 and v45.Magnitude or 100;
            local v57 = math.min(v56 == 0 and 0 or 2 ^ (v56 * 10 - 10), 100);
            v48 = v48 * math.max(v57, 1);
            if l_WindSpeed_0 < 1 then
                l_WindSpeed_0 = l_WindSpeed_0 * v57;
            else
                local v58 = v57 / 2;
                l_WindSpeed_0 = l_WindSpeed_0 * (v58 > 1 and v58 or 1);
            end;
            local v59 = nil;
            local function _(v60, v61, v62, v63) --[[ Line: 228 ]] --[[ Name: GetNoise ]]
                local v64 = math.clamp(math.noise(v60, v61, v62), -1, 1);
                if v63 then
                    v64 = v64 ^ 2;
                end;
                return v64;
            end;
            local function _() --[[ Line: 240 ]] --[[ Name: SampleGust ]]
                -- upvalues: v48 (ref)
                return math.sin(v48 * 1) * 0.3 + 0.7;
            end;
            local function v75() --[[ Line: 246 ]] --[[ Name: SampleSin ]]
                -- upvalues: l_WindStrength_0 (copy), l_WindSpeed_0 (ref), v48 (ref), l_WindDirection_0 (copy)
                local v67 = l_WindStrength_0 ^ 0.8;
                local v68 = l_WindSpeed_0 * 2;
                local v69 = math.sin(v48 * v67);
                local v70 = math.cos(v48 / 10 * v67);
                local v71 = math.sin(v48 * 2 * v67);
                local v72 = math.cos(v48 * 3 * v67);
                local v73 = (v69 + v70 + v71 + v72) / 4;
                local v74 = v73 * 0.5 + 0.5;
                v73 = v73 * v68;
                v74 = v74 * v68;
                return l_WindDirection_0 * (v73 < v74 and v74 or v73);
            end;
            local function v86(v76, v77) --[[ Line: 264 ]] --[[ Name: SampleNoise ]]
                -- upvalues: l_WindStrength_0 (copy), l_WindSpeed_0 (ref), v44 (copy), l_WindDirection_0 (copy)
                v76 = v76 or 0;
                local v78 = l_WindStrength_0 ^ 0.8;
                local v79 = l_WindSpeed_0 * 2;
                local l_WindOffset_0 = v44.WindOffset;
                local v81 = math.clamp(math.noise(v78, 0, l_WindOffset_0), -1, 1);
                if v77 then
                    v81 = v81 ^ 2;
                end;
                local v82 = v81 * (v79 + v76);
                local v83 = math.clamp(math.noise(0, v78, l_WindOffset_0), -1, 1);
                if v77 then
                    v83 = v83 ^ 2;
                end;
                local v84 = v83 * (v79 + v76);
                local v85 = math.clamp(math.noise(l_WindOffset_0, 0, v78), -1, 1);
                if v77 then
                    v85 = v85 ^ 2;
                end;
                v81 = v85 * (v79 + v76);
                return l_WindDirection_0 * Vector3.new(v82, v84, v81);
            end;
            if l_Settings_0.WindType == "Sine" then
                v59 = v75() * (math.sin(v48 * 1) * 0.3 + 0.7);
            elseif l_Settings_0.WindType == "Noise" then
                v59 = v86(0, true) * (math.sin(v48 * 1) * 0.3 + 0.7);
            elseif l_Settings_0.WindType == "Hybrid" then
                v59 = (v75() * (math.sin(v48 * 1) * 0.3 + 0.7) + v86(0.5, true) * (math.sin(v48 * 1) * 0.3 + 0.7)) * 0.5;
            end;
            return v59 / (v43.FreeLength < 0.01 and 0.01 or v43.FreeLength) * (l_Settings_0.WindInfluence * (l_WindStrength_0 * 0.01) * (math.clamp(v43.HeirarchyLength, 1, 10) * 0.1)) * v43.Weight;
        end;
    end;
end;
local v88 = {};
v88.__index = v88;
v88.new = function(v89, v90, v91) --[[ Line: 440 ]] --[[ Name: new ]]
    -- upvalues: v88 (copy), l_Utilities_0 (copy)
    local v92 = v89.Parent:IsA("Bone") and v89.Parent.TransformedWorldCFrame or v91.CFrame;
    local v93 = setmetatable({
        Bone = v89, 
        FreeLength = -1, 
        Weight = 0.7, 
        ParentIndex = -1, 
        HeirarchyLength = 0, 
        Transform = v89.TransformedWorldCFrame:ToObjectSpace(v92):Inverse(), 
        LocalTransform = v89.TransformedCFrame:ToObjectSpace(v90.TransformedCFrame):Inverse(), 
        RootPart = v91, 
        RootBone = v90, 
        Radius = 0, 
        Friction = 0, 
        RotationLimit = 0, 
        Force = nil, 
        Gravity = nil, 
        SolvedAnimatedCFrame = false, 
        HasChild = false, 
        AnimatedWorldCFrame = v89.TransformedWorldCFrame, 
        StartingCFrame = v89.TransformedCFrame, 
        TransformOffset = CFrame.identity, 
        LocalTransformOffset = CFrame.identity, 
        RestPosition = Vector3.new(0, 0, 0, 0), 
        CalculatedWorldCFrame = v89.TransformedWorldCFrame, 
        Position = v89.TransformedWorldCFrame.Position, 
        LastPosition = v89.TransformedWorldCFrame.Position, 
        WeldPosition = Vector3.new(0, 0, 0, 0), 
        WeldCFrame = CFrame.identity, 
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
        IsSkippingUpdates = false, 
        CollisionHits = {}, 
        CollisionsData = {}
    }, v88);
    v93.AttributeConnection = v89.AttributeChanged:Connect(function(_) --[[ Line: 493 ]]
        -- upvalues: l_Utilities_0 (ref), v89 (copy), v93 (copy)
        for v95, v96 in (l_Utilities_0.GatherBoneSettings(v89)) do
            v93[v95] = v96 ~= "\194\172" and v96 or nil;
        end;
    end);
    return v93;
end;
v88.ClipVelocity = function(v97, v98, v99) --[[ Line: 510 ]] --[[ Name: ClipVelocity ]]
    v97.LastPosition = v97.LastPosition * (Vector3.new(1, 1, 1, 0) - v99) + v98 * v99;
end;
v88.PreUpdate = function(v100, v101) --[[ Line: 516 ]] --[[ Name: PreUpdate ]]
    -- upvalues: v18 (copy), v24 (copy)
    local v102 = v101.Bones[1];
    local v103 = v101.Bones[v100.ParentIndex];
    v100.SolvedAnimatedCFrame = true;
    local l_ParentIndex_1 = v100.ParentIndex;
    local l_Bone_1 = v100.Bone;
    local v106;
    if l_ParentIndex_1 < 1 then
        v106 = v18(l_Bone_1);
    else
        local v107 = v101.Bones[l_ParentIndex_1];
        if not v107.SolvedAnimatedCFrame then
            v107.AnimatedWorldCFrame = v24(v101, v107);
        end;
        v106 = v107.AnimatedWorldCFrame * l_Bone_1.TransformedCFrame;
    end;
    v100.AnimatedWorldCFrame = v106;
    v106 = v100.Bone:FindFirstChild("SmartWeld");
    v100.ActiveWeld = false;
    if v106 and v106:IsA("ObjectValue") then
        l_ParentIndex_1 = v106.Value;
        l_Bone_1 = true;
        if v106:GetAttribute("Rigid") ~= true then
            l_Bone_1 = false;
        end;
        v100.RigidWeld = l_Bone_1;
        if l_ParentIndex_1 then
            if l_ParentIndex_1:IsA("Attachment") then
                v100.WeldPosition = l_ParentIndex_1.WorldPosition;
                v100.WeldCFrame = l_ParentIndex_1.WorldCFrame;
                v100.ActiveWeld = true;
            elseif l_ParentIndex_1:IsA("BasePart") then
                v100.WeldPosition = l_ParentIndex_1.Position;
                v100.WeldCFrame = l_ParentIndex_1.CFrame;
                v100.ActiveWeld = true;
            end;
        end;
    end;
    if v100.ParentIndex < 1 then
        v100.Anchored = true;
    end;
    if v100.Bone == v100.RootBone then
        l_ParentIndex_1 = nil;
        v100.TransformOffset = (if v100.Bone.Parent:IsA("Bone") then v18(v100.Bone.Parent) else v100.RootPart.CFrame) * v100.Transform;
    else
        v100.TransformOffset = v103.AnimatedWorldCFrame * v100.Transform;
    end;
    v100.LocalTransformOffset = v102.Bone.CFrame * v100.LocalTransform;
end;
v88.StepPhysics = function(v108, v109, v110, v111) --[[ Line: 575 ]] --[[ Name: StepPhysics ]]
    -- upvalues: v87 (copy)
    if v108.Anchored then
        v108.LastPosition = v108.AnimatedWorldCFrame.Position;
        v108.Position = v108.AnimatedWorldCFrame.Position;
        return;
    else
        if v108.Force or v108.Gravity then
            v110 = (v108.Gravity or v109.Settings.Gravity) + (v108.Force or v109.Settings.Force);
        end;
        local l_Settings_1 = v109.Settings;
        local v113 = (v108.Position - v108.LastPosition) / v111;
        v113 = v113.Magnitude > 50 and v113.Unit * 50 or v113;
        local v114 = v109.ObjectAcceleration * l_Settings_1.Inertia;
        local v115 = v87(v108, v109, v113);
        local v116 = v110 + v114;
        v108.LastPosition = v108.Position;
        v108.Position = v108.Position + (v113 * (1 - l_Settings_1.Damping) * v111 + v116 * v111 * v111 + v115);
        return;
    end;
end;
v88.Constrain = function(v117, v118, v119, v120) --[[ Line: 615 ]] --[[ Name: Constrain ]]
    -- upvalues: l_FrictionConstraint_0 (copy), l_CollisionConstraint_0 (copy), l_SpringConstraint_0 (copy), l_DistanceConstraint_0 (copy), l_RopeConstraint_0 (copy), l_AxisConstraint_0 (copy), l_RotationConstraint_0 (copy)
    if v117.Anchored then
        return;
    else
        local l_Position_0 = v117.Position;
        local l_CFrame_0 = v117.RootPart.CFrame;
        l_Position_0 = l_FrictionConstraint_0(v117, l_Position_0, v117.LastPosition);
        if #v119 ~= 0 then
            l_Position_0 = l_CollisionConstraint_0(v117, l_Position_0, v119);
        end;
        l_Position_0 = if v118.Settings.Constraint == "Spring" then l_SpringConstraint_0(v117, l_Position_0, nil, v118, v120) else if v118.Settings.Constraint == "Distance" then l_DistanceConstraint_0(v117, l_Position_0, v118) else if v118.Settings.Constraint == "Rope" then l_RopeConstraint_0(v117, l_Position_0, v118) else v117.AnimatedWorldCFrame.Position;
        l_Position_0 = l_AxisConstraint_0(v117, l_Position_0, v117.LastPosition, l_CFrame_0);
        l_Position_0 = l_RotationConstraint_0(v117, l_Position_0, v118);
        if v117.ActiveWeld then
            l_Position_0 = if v117.RigidWeld then v117.WeldPosition else l_SpringConstraint_0(v117, l_Position_0, v117.WeldPosition, v118, v120);
        end;
        v117.Friction = 0;
        for _, v124 in v117.CollisionHits do
            local l_CurrentPhysicalProperties_2 = v117.RootPart.CurrentPhysicalProperties;
            local l_CurrentPhysicalProperties_3 = v124.CurrentPhysicalProperties;
            local l_Friction_2 = l_CurrentPhysicalProperties_2.Friction;
            local l_FrictionWeight_2 = l_CurrentPhysicalProperties_2.FrictionWeight;
            local l_Friction_3 = l_CurrentPhysicalProperties_3.Friction;
            local l_FrictionWeight_3 = l_CurrentPhysicalProperties_3.FrictionWeight;
            local v131 = (l_Friction_2 * l_FrictionWeight_2 + l_Friction_3 * l_FrictionWeight_3) / (l_FrictionWeight_2 + l_FrictionWeight_3);
            v117.Friction = v131 < v117.Friction and v117.Friction or v131;
        end;
        v117.Position = l_Position_0;
        return;
    end;
end;
v88.SkipUpdate = function(v132) --[[ Line: 671 ]] --[[ Name: SkipUpdate ]]
    -- upvalues: l_Config_0 (copy)
    if v132.IsSkippingUpdates == false and l_Config_0.RESET_TRANSFORM_ON_SKIP then
        v132.CalculatedWorldCFrame = v132.AnimatedWorldCFrame;
        v132.IsSkippingUpdates = true;
    end;
    v132.LastPosition = v132.AnimatedWorldCFrame.Position + (v132.LastPosition - v132.Position);
    v132.Position = v132.AnimatedWorldCFrame.Position;
end;
v88.SolveTransform = function(v133, v134, v135) --[[ Line: 686 ]] --[[ Name: SolveTransform ]]
    -- upvalues: l_Utilities_0 (copy), l_SB_ASSERT_CB_0 (copy)
    if v133.ParentIndex < 1 then
        return;
    else
        v133.IsSkippingUpdates = false;
        local v136 = v134.Bones[v133.ParentIndex];
        local l_Bone_2 = v136.Bone;
        if v136 and l_Bone_2 then
            local l_TransformOffset_0 = v136.TransformOffset;
            local v139 = v133.Position - v136.Position;
            local v140 = l_Utilities_0.GetRotationBetween(l_TransformOffset_0.UpVector, v139).Rotation * l_TransformOffset_0.Rotation;
            local v141 = math.min(1 - 1.0E-5 ^ v135, 1);
            if v136.ActiveWeld and v136.RigidWeld then
                v136.CalculatedWorldCFrame = v136.WeldCFrame;
            else
                v136.CalculatedWorldCFrame = l_Bone_2.WorldCFrame:Lerp(CFrame.new(v136.Position) * v140, v141);
            end;
            local l_l_SB_ASSERT_CB_0_0 = l_SB_ASSERT_CB_0;
            local l_Position_1 = v136.CalculatedWorldCFrame.Position;
            l_l_SB_ASSERT_CB_0_0(not (l_Position_1 ~= l_Position_1), warn, "If you see this report this as a bug, (NaN Calc world cframe)");
        end;
        return;
    end;
end;
v88.ApplyTransform = function(v144, v145) --[[ Line: 725 ]] --[[ Name: ApplyTransform ]]
    v144.SolvedAnimatedCFrame = false;
    if v144.ParentIndex < 1 then
        return;
    else
        local v146 = v145.Bones[v144.ParentIndex];
        local l_Bone_3 = v146.Bone;
        if v146 and l_Bone_3 then
            if v146.Anchored and not v145.Settings.AnchorsRotate then
                l_Bone_3.WorldCFrame = v146.TransformOffset;
                return;
            elseif v146.Anchored then
                l_Bone_3.WorldCFrame = CFrame.new(v146.Position) * v146.CalculatedWorldCFrame.Rotation;
                return;
            else
                l_Bone_3.WorldCFrame = v146.CalculatedWorldCFrame;
            end;
        end;
        return;
    end;
end;
v88.DrawDebug = function(v148, v149, v150, v151, v152, v153, v154) --[[ Line: 766 ]] --[[ Name: DrawDebug ]]
    -- upvalues: l_Gizmo_0 (copy)
    local v155 = Color3.fromRGB(255, 0, 0);
    local v156 = Color3.fromRGB(255, 94, 0);
    local v157 = Color3.fromRGB(234, 1, 255);
    local v158 = Color3.fromRGB(0, 255, 255);
    local v159 = Color3.fromRGB(255, 0, 0);
    local v160 = Color3.fromRGB(0, 255, 0);
    local v161 = Color3.fromRGB(0, 0, 255);
    local v162 = Color3.fromRGB(0, 183, 255);
    local v163 = Color3.fromRGB(255, 0, 0);
    local v164 = Color3.fromRGB(0, 255, 0);
    local v165 = Color3.fromRGB(0, 0, 255);
    local v166 = Color3.fromRGB(28, 41, 224);
    local v167 = Color3.fromRGB(255, 27, 27);
    local v168 = 1;
    local l_AnimatedWorldCFrame_0 = v148.AnimatedWorldCFrame;
    local l_Position_2 = l_AnimatedWorldCFrame_0.Position;
    local v171 = CFrame.new(v148.Position);
    local v172 = CFrame.new(v148.LastPosition);
    if v152 then
        l_Gizmo_0.PushProperty("AlwaysOnTop", false);
        l_Gizmo_0.PushProperty("Color3", v155);
        l_Gizmo_0.Sphere:Draw(v171, v148.Radius, 10, 360);
        l_Gizmo_0.PushProperty("Color3", v156);
        l_Gizmo_0.Sphere:Draw(v172, v148.Radius, 10, 360);
        l_Gizmo_0.PushProperty("Color3", v157);
        l_Gizmo_0.Ray:Draw(v148.Position, v148.LastPosition);
    end;
    if v153 and not v148.Anchored then
        local v173 = v148.AxisLocked[1];
        local v174 = v148.AxisLocked[2];
        local v175 = v148.AxisLocked[3];
        local l_RootPart_0 = v148.RootPart;
        local v177 = l_RootPart_0.CFrame:PointToObjectSpace(l_Position_2);
        local l_RightVector_0 = l_RootPart_0.CFrame.RightVector;
        local l_UpVector_0 = l_RootPart_0.CFrame.UpVector;
        local l_LookVector_0 = l_RootPart_0.CFrame.LookVector;
        if not v173 then
            l_Gizmo_0.PushProperty("Color3", v163);
            l_Gizmo_0.Arrow:Draw(l_Position_2 - l_RightVector_0 * 2, l_Position_2 + l_RightVector_0 * 2, 0.05, 0.15, 9);
            local v181 = v148.XAxisLimits.Min - v177.X;
            local v182 = v148.XAxisLimits.Max - v177.X;
            l_Gizmo_0.Plane:Draw(l_Position_2 + l_RightVector_0 * v181, l_RightVector_0, (Vector3.new(5, 5, 0, 0)));
            l_Gizmo_0.Plane:Draw(l_Position_2 + l_RightVector_0 * v182, l_RightVector_0, (Vector3.new(5, 5, 0, 0)));
        end;
        if not v174 then
            l_Gizmo_0.PushProperty("Color3", v164);
            l_Gizmo_0.Arrow:Draw(l_Position_2 - l_UpVector_0 * 2, l_Position_2 + l_UpVector_0 * 2, 0.05, 0.15, 9);
            local v183 = v148.YAxisLimits.Min - v177.Y;
            local v184 = v148.YAxisLimits.Max - v177.Y;
            l_Gizmo_0.Plane:Draw(l_Position_2 + l_UpVector_0 * v183, l_UpVector_0, (Vector3.new(5, 5, 0, 0)));
            l_Gizmo_0.Plane:Draw(l_Position_2 + l_UpVector_0 * v184, l_UpVector_0, (Vector3.new(5, 5, 0, 0)));
        end;
        if not v175 then
            l_Gizmo_0.PushProperty("Color3", v165);
            l_Gizmo_0.Arrow:Draw(l_Position_2 - l_LookVector_0 * 2, l_Position_2 + l_LookVector_0 * 2, 0.05, 0.15, 9);
            local v185 = v148.ZAxisLimits.Min - v177.Z;
            local v186 = v148.ZAxisLimits.Max - v177.Z;
            l_Gizmo_0.Plane:Draw(l_Position_2 - l_LookVector_0 * v185, l_LookVector_0, (Vector3.new(5, 5, 0, 0)));
            l_Gizmo_0.Plane:Draw(l_Position_2 - l_LookVector_0 * v186, l_LookVector_0, (Vector3.new(5, 5, 0, 0)));
        end;
    end;
    if v151 then
        l_Gizmo_0.PushProperty("Color3", v158);
        l_Gizmo_0.Sphere:Draw(l_AnimatedWorldCFrame_0, 0.08, 5, 360);
        l_Gizmo_0.PushProperty("Color3", v159);
        l_Gizmo_0.VolumeArrow:Draw(l_Position_2, l_Position_2 + l_AnimatedWorldCFrame_0.LookVector * 0.25, 0.005, 0.015, 0.05, true);
        l_Gizmo_0.PushProperty("Color3", v160);
        l_Gizmo_0.VolumeArrow:Draw(l_Position_2, l_Position_2 + l_AnimatedWorldCFrame_0.UpVector * 0.25, 0.005, 0.015, 0.05, true);
        l_Gizmo_0.PushProperty("Color3", v161);
        l_Gizmo_0.VolumeArrow:Draw(l_Position_2, l_Position_2 + l_AnimatedWorldCFrame_0.RightVector * 0.25, 0.005, 0.015, 0.05, true);
    end;
    if v150 and not v148.Anchored then
        for _, v188 in v148.CollisionsData do
            l_Gizmo_0.PushProperty("Color3", v166);
            l_Gizmo_0.Sphere:Draw(CFrame.new(v188.ClosestPoint), 0.08, 5, 360);
            l_Gizmo_0.PushProperty("Color3", v167);
            l_Gizmo_0.Arrow:Draw(v188.ClosestPoint, v188.ClosestPoint + v188.Normal * 0.5, 0.05, 0.15, 9);
        end;
    end;
    if v154 and v148.RotationLimit < 180 and v148.RotationLimit > 0 and v148.ParentIndex > 0 and v148.HasChild then
        local v189 = nil;
        local v190 = 1;
        if v148.RotationLimit < 89.5 then
            v189 = v168 * math.tan((math.rad(v148.RotationLimit)));
        elseif v148.RotationLimit > 90 then
            v190 = -1;
            v189 = v168 * math.tan((math.rad(180 - v148.RotationLimit)));
        else
            v168 = 0;
            v189 = 5;
        end;
        v189 = math.min(v189, 5);
        if v189 == 5 then
            v168 = 0;
        end;
        local v191 = (v148.Position - v149.Bones[v148.ParentIndex].Position).Unit * v190;
        local v192 = CFrame.lookAt(l_Position_2 + v191 * (v168 * 0.5), l_Position_2 + -v191 * 500, l_AnimatedWorldCFrame_0.LookVector);
        l_Gizmo_0.PushProperty("Color3", v162);
        l_Gizmo_0.Cone:Draw(v192, v189, v168, 8 + v189 * 2);
    end;
end;
v88.DrawOverlay = function(v193, v194) --[[ Line: 957 ]] --[[ Name: DrawOverlay ]]
    -- upvalues: l_Config_0 (copy)
    v194.Text((("Bone: %*"):format(v193.Bone.Name)));
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_NUMERICS then
        v194.Text((("Free Length: %*"):format(v193.FreeLength)));
        v194.Text((("Weight: %*"):format(v193.Weight)));
        v194.Text((("Parent Index: %*"):format(v193.ParentIndex)));
        v194.Text((("Heirarchy Length: %*"):format(v193.HeirarchyLength)));
        v194.Text((("Radius: %*"):format(v193.Radius)));
        v194.Text((("Friction: %*"):format(v193.Friction)));
        v194.Text((("Rotation Limit: %*"):format(v193.RotationLimit)));
    end;
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_CONSTRAIN then
        v194.Text((("Anchored: %*"):format(v193.Anchored)));
        v194.Text((("Axis Locked: %*, %*, %*"):format(v193.AxisLocked[1], v193.AxisLocked[2], v193.AxisLocked[3])));
        v194.Text((("X Axis Limit: %*"):format(v193.XAxisLimits)));
        v194.Text((("Y Axis Limit: %*"):format(v193.YAxisLimits)));
        v194.Text((("Z Axis Limit: %*"):format(v193.ZAxisLimits)));
    end;
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_WELD then
        v194.Text((("Active Weld: %*"):format(v193.ActiveWeld)));
        v194.Text((("Rigid Weld: %*"):format(v193.RigidWeld)));
        v194.Text((("Weld Position: %*"):format((string.format("%.3f, %.3f, %.3f", v193.WeldPosition.X, v193.WeldPosition.Y, v193.WeldPosition.Z)))));
    end;
    if l_Config_0.DEBUG_OVERLAY_BONE_INFO or l_Config_0.DEBUG_OVERLAY_BONE_FORCES then
        local v195 = v193.Force and string.format("%.3f, %.3f, %.3f", v193.Force.X, v193.Force.Y, v193.Force.Z) or "-, -, -";
        local v196 = v193.Gravity and string.format("%.3f, %.3f, %.3f", v193.Gravity.X, v193.Gravity.Y, v193.Gravity.Z) or "-, -, -";
        v194.Text((("Force: %*"):format(v195)));
        v194.Text((("Gravity: %*"):format(v196)));
    end;
end;
v88.Destroy = function(v197) --[[ Line: 993 ]] --[[ Name: Destroy ]]
    -- upvalues: l_Config_0 (copy)
    if l_Config_0.RESET_BONE_ON_DESTROY then
        task.synchronize();
        v197.Bone.CFrame = v197.StartingCFrame;
    end;
    v197.AttributeConnection:Disconnect();
    setmetatable(v197, nil);
end;
return v88;