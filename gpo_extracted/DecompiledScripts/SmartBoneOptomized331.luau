local _ = game:FindService("Lighting");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Dependencies_0 = script:WaitForChild("Dependencies");
local l_Components_0 = script:WaitForChild("Components");
local v4 = require(l_Dependencies_0.Config);
local l_UnitConversion_0 = require(l_Dependencies_0:WaitForChild("UnitConversion"));
local l_DefaultSettings_0 = require(l_Dependencies_0:WaitForChild("DefaultSettings"));
local l_ParticleTree_0 = require(l_Components_0:WaitForChild("ParticleTree"));
local l_Particle_0 = require(l_Components_0:WaitForChild("Particle"));
local l_SettingsMath_0 = require(l_Dependencies_0:WaitForChild("SettingsMath"));
local l_Utilities_0 = require(l_Dependencies_0:WaitForChild("Utilities"));
local v11 = Random.new();
local l_Debug_0 = v4.Debug;
local v13 = nil;
local v14 = nil;
if l_Debug_0 then
    v13 = Instance.new("Model");
    v13.Name = "SMARTBONE_DEBUGFOLDER";
    v14 = Instance.new("Highlight");
    v14.FillColor = Color3.new(1, 0, 0);
    v14.OutlineTransparency = 1;
    v14.FillTransparency = 0;
    v14.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
    v14.Enabled = true;
    v14.Parent = v13;
    v13.Parent = workspace;
end;
local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged("SmartBone");
local v16 = {};
local v17 = {};
v17.__index = v17;
v17.new = function(v18, v19) --[[ Line: 112 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), l_UnitConversion_0 (copy), v17 (copy), l_DefaultSettings_0 (copy)
    local v20 = setmetatable({
        ID = v11:NextInteger(1, 10000000), 
        RootPart = v18, 
        Time = 0, 
        ParticleTrees = {}, 
        Connections = {}, 
        RootList = v19, 
        ObjectScale = l_UnitConversion_0.Convert(math.abs(v18.Size.X), "Millimeter"), 
        WindPreviousPosition = Vector3.new(0, 0, 0, 0), 
        Removed = false, 
        RemovedEvent = Instance.new("BindableEvent"), 
        InRange = false, 
        Settings = {}, 
        BoxColliders = {}
    }, v17);
    for v21, v22 in l_DefaultSettings_0 do
        v20.Settings[v21] = v18:GetAttribute(v21) or v22;
    end;
    v20.Settings.BlendWeight = 1;
    v20.Settings.UpdateRate = math.floor(v20.Settings.UpdateRate + 0.1);
    v20:Init();
    v20:UpdateParameters(v20.Settings);
    if not v18:GetAttribute("IgnoreCollisions") then
        v20:DetermineCharacterBoxes();
    end;
    return v20;
end;
v17.DetermineCharacterBoxes = function(v23) --[[ Line: 148 ]] --[[ Name: DetermineCharacterBoxes ]]
    if not v23.BoxColliders then
        return;
    else
        table.clear(v23.BoxColliders);
        local l_RootPart_0 = v23.RootPart;
        if not l_RootPart_0 then
            return;
        else
            local v25 = nil;
            while l_RootPart_0 ~= workspace do
                l_RootPart_0 = l_RootPart_0.Parent;
                if l_RootPart_0 then
                    if l_RootPart_0:FindFirstChild("Humanoid") then
                        v25 = l_RootPart_0.Humanoid;
                        break;
                    end;
                else
                    break;
                end;
            end;
            if v25 then
                for _, v27 in l_RootPart_0:GetChildren() do
                    if v27:IsA("Part") and v27.Name ~= "HumanoidRootPart" then
                        table.insert(v23.BoxColliders, v27);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v17.Init = function(v28) --[[ Line: 180 ]] --[[ Name: Init ]]
    -- upvalues: v16 (copy)
    local l_RootPart_1 = v28.RootPart;
    v16[v28.ID] = v28;
    local function v31() --[[ Line: 183 ]] --[[ Name: UpdateWind ]]
        -- upvalues: v28 (copy)
        local l_Unit_0 = workspace.GlobalWind.Unit;
        if l_Unit_0.X ~= l_Unit_0.X or l_Unit_0.X < -1024 or l_Unit_0.X > 1024 then
            l_Unit_0 = Vector3.new(0, 0, 0, 0);
        end;
        v28:UpdateParameters("WindDirection", l_Unit_0);
        v28:UpdateParameters("WindSpeed", workspace.GlobalWind.Magnitude);
    end;
    v31();
    v28.Connections.WindDirectionChange = workspace:GetPropertyChangedSignal("GlobalWind"):ConnectParallel(v31);
    for _, v33 in l_RootPart_1:GetDescendants() do
        if v33:IsA("Bone") and v33.Parent:IsA("Bone") and #v33:GetChildren() == 0 then
            local v34 = v33.WorldCFrame + v33.WorldCFrame.UpVector.Unit * (v33.WorldPosition - v33.Parent.WorldPosition).Magnitude;
            local l_Bone_0 = Instance.new("Bone");
            l_Bone_0.Name = v33.Name .. "_Tail";
            l_Bone_0.Parent = v33;
            l_Bone_0.WorldCFrame = v34;
        end;
    end;
    for _, v37 in v28.RootList do
        v28:AppendParticleTree(v37);
    end;
    for _, v39 in v28.ParticleTrees do
        v28:AppendParticles(v39, v39.Root, 0, 0);
    end;
end;
v17.AppendParticleTree = function(v40, v41) --[[ Line: 230 ]] --[[ Name: AppendParticleTree ]]
    -- upvalues: l_ParticleTree_0 (copy)
    table.insert(v40.ParticleTrees, l_ParticleTree_0.new(v41, v40.RootPart, v40.Settings.Gravity));
end;
v17.AppendParticles = function(v42, v43, v44, v45, v46) --[[ Line: 234 ]] --[[ Name: AppendParticles ]]
    -- upvalues: l_Particle_0 (copy), l_Debug_0 (copy), v13 (ref), l_Utilities_0 (copy)
    local l_Settings_0 = v42.Settings;
    local v48 = l_Particle_0.new(v44, v43.Root, v42.RootPart, l_Settings_0);
    local l_WorldPosition_0 = v44.WorldPosition;
    local l_WorldPosition_1 = v44.WorldPosition;
    v48.Position = l_WorldPosition_0;
    v48.LastPosition = l_WorldPosition_1;
    v48.ParentIndex = v45;
    v48.BoneLength = v46;
    v48.HeirarchyLength = 0;
    if l_Debug_0 then
        v48.DebugPart = Instance.new("Part");
        v48.DebugPart.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v48.DebugPart.Anchored = true;
        v48.DebugPart.CanCollide = false;
        v48.DebugPart.CastShadow = false;
        v48.DebugPart.CanTouch = false;
        v48.DebugPart.CanQuery = false;
        v48.DebugPart.Color = Color3.new(1, 0, 0);
        v48.DebugPart.Parent = v13;
    end;
    if v45 >= 1 then
        v46 = (v43.Particles[v45].Bone.WorldPosition - v48.Position).Magnitude;
        v48.BoneLength = v46;
        v48.Weight = v46 * 0.7;
        l_WorldPosition_0 = l_Utilities_0.GetHierarchyLength(v44, v43.Root);
        if l_WorldPosition_0 then
            v48.HeirarchyLength = l_WorldPosition_0;
        end;
    end;
    if v48.HeirarchyLength <= l_Settings_0.AnchorDepth then
        v48.Anchored = true;
    end;
    table.insert(v43.Particles, v48);
    l_WorldPosition_0 = #v43.Particles;
    for _, v52 in v44:GetChildren() do
        if v52:IsA("Bone") then
            v42:AppendParticles(v43, v52, l_WorldPosition_0, v46);
        end;
    end;
end;
v17.UpdateParameters = function(v53, v54, v55) --[[ Line: 278 ]] --[[ Name: UpdateParameters ]]
    -- upvalues: l_SettingsMath_0 (copy)
    if not v53.Settings[v54] then
        return;
    else
        v53.Settings[v54] = if l_SettingsMath_0[v54] then l_SettingsMath_0[v54](v55) else v55;
        return;
    end;
end;
v17.PreUpdate = function(_, v57) --[[ Line: 283 ]] --[[ Name: PreUpdate ]]
    local l_RootPart_2 = v57.RootPart;
    local l_Root_0 = v57.Root;
    v57.ObjectMove = l_RootPart_2.Position - v57.ObjectPreviousPosition;
    v57.ObjectPreviousPosition = l_RootPart_2.Position;
    v57.RestGravity = l_Root_0.CFrame:PointToWorldSpace(v57.LocalGravity);
    for _, v61 in v57.Particles do
        v61.LastTransformOffset = v61.TransformOffset;
        if v61.Bone == v61.Root then
            v61.TransformOffset = l_RootPart_2.CFrame * v61.RootTransform;
        else
            v61.TransformOffset = l_Root_0.WorldCFrame * v61.Transform;
        end;
        v61.LocalTransformOffset = l_Root_0.CFrame * v61.LocalTransform;
    end;
end;
v17.UpdateParticles = function(v62, v63, v64, v65) --[[ Line: 304 ]] --[[ Name: UpdateParticles ]]
    -- upvalues: l_Utilities_0 (copy)
    local l_Settings_1 = v62.Settings;
    local l_Damping_0 = l_Settings_1.Damping;
    local l_Gravity_0 = l_Settings_1.Gravity;
    local l_Unit_1 = l_Settings_1.Gravity.Unit;
    l_Gravity_0 = (l_Gravity_0 - l_Unit_1 * math.max(v63.RestGravity:Dot(l_Unit_1), 0) + l_Settings_1.Force) * (v62.ObjectScale * v64);
    local v70 = v65 == 0 and v63.ObjectMove or Vector3.new(0, 0, 0, 0);
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    for _, v76 in v63.Particles do
        if v76.ParentIndex >= 1 and not v76.Anchored then
            v71 = Vector3.new(0, 0, 0, 0);
            if l_Settings_1.WindInfluence > 0 then
                v74 = v63.WindOffset + (os.clock() - v76.HeirarchyLength / 5) + (v76.TransformOffset.Position - v63.Root.WorldPosition).Magnitude / 5 * l_Settings_1.WindInfluence;
                v71 = Vector3.new(l_Settings_1.WindDirection.X + l_Settings_1.WindDirection.X * math.sin(v74 * l_Settings_1.WindSpeed), l_Settings_1.WindDirection.Y + math.sin(v74 * l_Settings_1.WindSpeed) * 0.05, l_Settings_1.WindDirection.Z + l_Settings_1.WindDirection.X * math.sin(v74 * l_Settings_1.WindSpeed)) / v76.BoneLength * l_Settings_1.WindInfluence * (l_Settings_1.WindStrength / 100 * (math.clamp(v76.HeirarchyLength, 1, 10) / 10)) * v76.Weight;
                v62.WindPreviousPosition = v71;
            end;
            v72 = v76.Position - v76.LastPosition;
            v73 = v70 * l_Settings_1.Inertia;
            v76.LastPosition = v76.Position + v73;
            v76.Position = v76.Position + (v72 * (1 - l_Damping_0) + l_Gravity_0 + v73 + v71);
            for _, v78 in v62.BoxColliders do
                local v79, v80, v81 = l_Utilities_0.BoxPointIntersection(v78.CFrame, v78.Size, v76.Position);
                if v79 then
                    v76.Position = v80 + v81 * 1.25;
                    break;
                end;
            end;
        else
            v76.LastPosition = v76.TransformOffset.Position;
            v76.Position = v76.TransformOffset.Position;
        end;
    end;
end;
v17.CorrectParticles = function(v82, v83, v84) --[[ Line: 367 ]] --[[ Name: CorrectParticles ]]
    local l_Settings_2 = v82.Settings;
    local l_Stiffness_0 = l_Settings_2.Stiffness;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local _ = nil;
    local v92 = nil;
    local v93 = nil;
    for _, v95 in v83.Particles do
        v87 = v83.Particles[v95.ParentIndex];
        if v87 and v95.ParentIndex >= 1 and not v95.Anchored then
            v88 = (v87.TransformOffset.Position - v95.TransformOffset.Position).Magnitude;
            if l_Stiffness_0 > 0 or l_Settings_2.Elasticity > 0 then
                v92 = (CFrame.new(v87.Position) * v87.TransformOffset.Rotation * CFrame.new(v95.LocalTransformOffset.Position)).Position;
                v89 = v92 - v95.Position;
                v95.Position = v95.Position + v89 * (l_Settings_2.Elasticity * v84);
                if l_Stiffness_0 > 0 then
                    v89 = v92 - v95.Position;
                    v90 = v89.Magnitude;
                    v93 = v88 * (1 - l_Stiffness_0) * 2;
                    if v93 < v90 then
                        v95.Position = v95.Position + v89 * ((v90 - v93) / v90);
                    end;
                end;
            end;
            v89 = v87.Position - v95.Position;
            v90 = v89.Magnitude;
            if v90 > 0 then
                v95.Position = v95.Position + v89 * ((v90 - v88) / v90);
            end;
        end;
    end;
end;
v17.SkipUpdateParticles = function(v96, v97) --[[ Line: 407 ]] --[[ Name: SkipUpdateParticles ]]
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local _ = nil;
    local v102 = nil;
    local v103 = nil;
    local v104 = nil;
    for _, v106 in v97.Particles do
        if v106.ParentIndex >= 1 and not v106.Anchored then
            v106.LastPosition = v106.LastPosition + v97.ObjectMove;
            v106.Position = v106.Position + v97.ObjectMove;
            v98 = v97.Particles[v106.ParentIndex];
            v99 = (v98.TransformOffset.Position - v106.TransformOffset.Position).Magnitude;
            v100 = v96.Settings.Stiffness;
            if v100 > 0 then
                v102 = v98.Position + CFrame.lookAt(v98.Position, v106.Position).LookVector.Unit * (v98.Position - v106.Position).Magnitude - v106.Position;
                v103 = v102.Magnitude;
                v104 = v99 * (1 - v100) * 2;
                if v104 < v103 then
                    v106.Position = v106.Position + v102 * ((v103 - v104) / v103);
                end;
            end;
            v102 = v98.Position - v106.Position;
            v103 = v102.Magnitude;
            if v99 < v103 then
                v106.Position = v106.Position + v102 * ((v103 - v99) / v103);
            end;
        else
            v106.LastPosition = v106.TransformOffset.Position;
            v106.Position = v106.TransformOffset.Position;
        end;
    end;
end;
v17.CalculateTransforms = function(v107, v108, v109) --[[ Line: 445 ]] --[[ Name: CalculateTransforms ]]
    -- upvalues: l_Utilities_0 (copy)
    if v107.InRange then
        local v110 = nil;
        local v111 = nil;
        local v112 = nil;
        local v113 = nil;
        local v114 = nil;
        local v115 = nil;
        local v116 = nil;
        local _ = nil;
        local v118 = nil;
        for _, v120 in v108.Particles do
            if v120.ParentIndex >= 1 and not v120.Anchored then
                v110 = v108.Particles[v120.ParentIndex];
                v111 = v110.Bone;
                if v110 and v111 and v111:IsA("Bone") and v111 ~= v108.Root then
                    v112 = v110.LocalTransformOffset.Position;
                    v113 = v110.TransformOffset;
                    v114 = v113:PointToObjectSpace(v112);
                    v115 = v120.Position - v110.Position;
                    v116 = l_Utilities_0.GetRotationBetween(v113.UpVector, v115, v114).Rotation * v113.Rotation;
                    v118 = 1 - 1.0E-5 ^ v109;
                    v110.CalculatedWorldCFrame = v111.WorldCFrame:Lerp(CFrame.new(v110.Position) * v116, v118);
                end;
            end;
        end;
    end;
end;
v17.TransformBones = function(v121, v122) --[[ Line: 473 ]] --[[ Name: TransformBones ]]
    local v123 = nil;
    local v124 = nil;
    if v121.InRange then
        for _, v126 in v122.Particles do
            if v126.ParentIndex >= 1 and not v126.Anchored then
                v123 = v122.Particles[v126.ParentIndex];
                v124 = v123.Bone;
                if v123 and v124 and v124:IsA("Bone") and v124 ~= v122.Root then
                    if v123.Anchored and not v121.Settings.AnchorsRotate then
                        v124.WorldCFrame = v123.TransformOffset;
                    else
                        v124.WorldCFrame = v123.CalculatedWorldCFrame;
                    end;
                end;
            end;
        end;
    end;
end;
v17.DEBUG = function(_, v128) --[[ Line: 494 ]] --[[ Name: DEBUG ]]
    for _, v130 in v128.Particles do
        if v130 then
            v130.DebugPart.CFrame = CFrame.new(v130.Position);
        end;
    end;
end;
v17.RunLoop = function(v131, v132, v133, v134) --[[ Line: 502 ]] --[[ Name: RunLoop ]]
    local v135 = true;
    local v136 = v133 * 10;
    if v134 > 0 then
        local v137 = 1 / v134;
        v131.Time = v131.Time + v133;
        v135 = false;
        if v137 <= v131.Time then
            v135 = true;
            v131.Time = 0;
        end;
    end;
    if v135 then
        v131:UpdateParticles(v132, v136, 0);
        v131:CorrectParticles(v132, v136);
        return;
    else
        v131:SkipUpdateParticles(v132);
        return;
    end;
end;
v17.ResetParticles = function(_, v139) --[[ Line: 525 ]] --[[ Name: ResetParticles ]]
    for _, v141 in v139.Particles do
        v141.LastPosition = v141.TransformOffset.Position;
        v141.Position = v141.TransformOffset.Position;
    end;
end;
v17.ResetTransforms = function(_, v143) --[[ Line: 532 ]] --[[ Name: ResetTransforms ]]
    local v144 = nil;
    for _, v146 in v143.Particles do
        v144 = if v146.Bone == v146.Root then v143.RootPart.CFrame * v146.RootTransform else v143.Root.WorldCFrame * v146.Transform;
        v146.Bone.WorldCFrame = v144;
    end;
end;
v17.UpdateBones = function(v147, v148, v149) --[[ Line: 546 ]] --[[ Name: UpdateBones ]]
    for _, v151 in v147.ParticleTrees do
        v147:PreUpdate(v151, v148);
        v147:RunLoop(v151, v148, v149);
        v147:CalculateTransforms(v151, v148);
    end;
end;
v17.Start = function() --[[ Line: 554 ]] --[[ Name: Start ]]
    -- upvalues: l_Debug_0 (copy), l_Utilities_0 (copy), v16 (copy), l_CollectionService_0 (copy), l_l_CollectionService_0_Tagged_0 (copy)
    local l_game_Service_1 = game:FindService("Players");
    local v153 = l_game_Service_1.LocalPlayer or l_game_Service_1.PlayerAdded:Wait();
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "Actors";
    l_Folder_0.Parent = v153:WaitForChild("PlayerScripts");
    local function _(v155) --[[ Line: 560 ]] --[[ Name: DebugPrint ]]
        -- upvalues: l_Debug_0 (ref)
        if l_Debug_0 then
            warn(v155);
        end;
    end;
    local v157 = {};
    local v158 = {};
    local function v170(v159) --[[ Line: 568 ]] --[[ Name: registerSmartBoneObject ]]
        -- upvalues: l_Utilities_0 (ref), v153 (copy), l_Folder_0 (copy), v157 (copy), v158 (copy), l_Debug_0 (ref)
        if v159:IsA("BasePart") and l_Utilities_0.WaitForChildOfClass(v159, "Bone", 10) and workspace:IsAncestorOf(v159) then
            local l_Character_0 = v153.Character;
            if l_Character_0 and v159:IsDescendantOf(l_Character_0) == false then
                return;
            elseif l_Character_0 == nil then
                return;
            else
                local v161 = {};
                if v159:GetAttribute("Roots") and typeof(v159:GetAttribute("Roots")) == "string" then
                    for _, v163 in (string.split(v159:GetAttribute("Roots"), ",")) do
                        local l_v159_FirstChild_0 = v159:FindFirstChild(v163, true);
                        if l_v159_FirstChild_0 and l_v159_FirstChild_0:IsA("Bone") then
                            table.insert(v161, l_v159_FirstChild_0);
                        else
                            warn("Missing bone from SmartBone Module: " .. v163);
                        end;
                    end;
                end;
                if #v161 > 0 then
                    local l_Actor_0 = Instance.new("Actor");
                    local l_BindableFunction_0 = Instance.new("BindableFunction");
                    l_BindableFunction_0.Name = "Event";
                    l_BindableFunction_0.Parent = l_Actor_0;
                    local v167 = script.Dependencies.ActorScript:Clone();
                    v167.Name = "Runtime";
                    v167.Parent = l_Actor_0;
                    l_Actor_0.Parent = l_Folder_0;
                    v167.Enabled = true;
                    v157[v159] = l_BindableFunction_0:Invoke(v159, v161);
                    l_Actor_0.Name = v159.Name .. v157[v159].ID;
                    v157[v159].RemovedEvent.Event:Once(function() --[[ Line: 610 ]]
                        -- upvalues: l_Actor_0 (copy)
                        l_Actor_0.Runtime.Enabled = false;
                        l_Actor_0:Destroy();
                    end);
                    table.insert(v158, v159);
                    local v168 = "Created new SmartBone Object with ID: " .. v157[v159].ID;
                    if l_Debug_0 then
                        warn(v168);
                        return;
                    end;
                else
                    table.insert(v158, v159);
                    local v169 = "Failed to create SmartBone Object for " .. v159:GetFullName() .. "! Make sure you have defined the Root Bone(s) for this object!";
                    if l_Debug_0 then
                        warn(v169);
                    end;
                end;
            end;
        end;
    end;
    local function v181(v171) --[[ Line: 628 ]] --[[ Name: removeSmartBoneObject ]]
        -- upvalues: v157 (copy), l_Debug_0 (ref), v16 (ref)
        if v157[v171] then
            local v172 = "Removing SmartBone Object with ID: " .. v157[v171].ID;
            if l_Debug_0 then
                warn(v172);
            end;
            for _, v174 in v157[v171].Connections do
                v174:Disconnect();
            end;
            v157[v171].SimulationConnection:Disconnect();
            task.wait();
            v157[v171].RemovedEvent:Destroy();
            for _, v176 in v157[v171].ParticleTrees do
                for _, v178 in v176.Particles do
                    for _, v180 in v178.RecyclingBin do
                        v180:Destroy();
                    end;
                    if v178.DebugPart then
                        v178.DebugPart:Destroy();
                        v178.DebugPart = nil;
                    end;
                end;
            end;
            task.wait();
            if v16[v157[v171].ID] then
                v16[v157[v171].ID] = nil;
            end;
            v157[v171].Removed = true;
            v157[v171].RemovedEvent:Fire();
            v157[v171] = nil;
        end;
    end;
    l_CollectionService_0:GetInstanceAddedSignal("SmartBone"):Connect(v170);
    l_CollectionService_0:GetInstanceRemovedSignal("SmartBone"):Connect(v181);
    for _, v183 in l_l_CollectionService_0_Tagged_0 do
        if not v157[v183] and not table.find(v158, v183) and v183:IsDescendantOf(workspace) then
            task.spawn(v170, v183);
        end;
    end;
end;
return v17;