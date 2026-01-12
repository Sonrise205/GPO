local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Settings_0 = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name).Settings;
local v2 = require(script.Graph);
local v3 = require(script.Range);
local v4 = require(script.Particles);
local v5 = require(script.Flipbook);
local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v8 = {
    Beam = {}, 
    EnabledParts = {}
};
_G.Part_Icles = _G.Part_Icles or {};
_G.Part_Icles.EnableAllowed = _G.Part_Icles.EnableAllowed or true;
local l_Beam_0 = v8.Beam;
local v10 = {
    [Enum.NormalId.Top] = {
        vector = "UpVector", 
        multiplier = 1
    }, 
    [Enum.NormalId.Bottom] = {
        vector = "UpVector", 
        multiplier = -1
    }, 
    [Enum.NormalId.Front] = {
        vector = "LookVector", 
        multiplier = 1
    }, 
    [Enum.NormalId.Back] = {
        vector = "LookVector", 
        multiplier = -1
    }, 
    [Enum.NormalId.Left] = {
        vector = "RightVector", 
        multiplier = -1
    }, 
    [Enum.NormalId.Right] = {
        vector = "RightVector", 
        multiplier = 1
    }
};
local v41 = {
    [Enum.ParticleEmitterShape.Box] = function(v11, _) --[[ Line: 47 ]]
        return (Vector3.new((math.random() * 2 - 1) * v11.Size.X / 2, (math.random() * 2 - 1) * v11.Size.Y / 2, (math.random() * 2 - 1) * v11.Size.Z / 2));
    end, 
    [Enum.ParticleEmitterShape.Sphere] = function(v13, v14) --[[ Line: 53 ]]
        local v15 = v13.Size.X / 2;
        local v16 = v15 * v14.ShapePartial;
        local v17 = (math.random() * (v15 ^ 3 - v16 ^ 3) + v16 ^ 3) ^ 0.3333333333333333;
        local v18 = math.random() * 2 * 3.141592653589793;
        local v19 = math.acos(math.random() * 2 - 1);
        local v20 = Vector3.new(math.sin(v19) * math.cos(v18), math.sin(v19) * math.sin(v18), (math.cos(v19)));
        return v20 * v17, (CFrame.lookAt(Vector3.new(), -v20));
    end, 
    [Enum.ParticleEmitterShape.Cylinder] = function(v21, v22) --[[ Line: 68 ]]
        local v23 = v21.Size.X / 2;
        local l_Y_0 = v21.Size.Y;
        local l_ShapePartial_0 = v22.ShapePartial;
        local v26 = math.sqrt((math.random())) * (1 - l_ShapePartial_0) + l_ShapePartial_0;
        local v27 = math.random() * 2 * 3.141592653589793;
        local v28 = v26 * v23 * math.cos(v27);
        local v29 = (math.random() * 2 - 1) * (l_Y_0 / 2);
        local v30 = v26 * v23 * math.sin(v27);
        local v31 = Vector3.new(v28, v29, v30);
        local v32 = nil;
        v32 = if math.abs(v29) > l_Y_0 / 2 - 0.01 then Vector3.new(0, math.sign(v29), 0) else Vector3.new(v28, 0, v30).Unit;
        return v31, (CFrame.lookAt(Vector3.new(), -v32));
    end, 
    [Enum.ParticleEmitterShape.Disc] = function(v33, v34) --[[ Line: 87 ]]
        local v35 = v33.Size.X / 2;
        local l_ShapePartial_1 = v34.ShapePartial;
        local v37 = math.sqrt((math.random())) * (1 - l_ShapePartial_1) + l_ShapePartial_1;
        local v38 = math.random() * 2 * 3.141592653589793;
        local v39 = Vector3.new(v37 * v35 * math.cos(v38), 0, v37 * v35 * math.sin(v38));
        local l_Unit_0 = v39.Unit;
        return v39, (CFrame.lookAt(Vector3.new(), -l_Unit_0));
    end
};
v8.GetFolder = function(_) --[[ Line: 101 ]] --[[ Name: GetFolder ]]
    local v43 = nil;
    if workspace.Terrain:FindFirstChild("EmittedPartsUsingPart_icle") then
        return workspace.Terrain.EmittedPartsUsingPart_icle;
    else
        v43 = Instance.new("Folder");
        v43.Name = "EmittedPartsUsingPart_icle";
        v43.Parent = workspace.Terrain;
        return v43;
    end;
end;
l_Beam_0.Emit = function(_, v45) --[[ Line: 112 ]] --[[ Name: Emit ]]
    -- upvalues: v2 (copy), v3 (copy), l_RunService_0 (copy)
    if v45:IsA("Beam") and v45:GetAttribute("Transformed") then
        local l_Factors_0 = v45:FindFirstChild("Factors");
        if not l_Factors_0 then
            return;
        else
            local function _(v47) --[[ Line: 118 ]] --[[ Name: isStatic ]]
                return not v47 or #v47.Keypoints <= 1;
            end;
            local function _(v49, v50) --[[ Line: 123 ]] --[[ Name: getStaticValue ]]
                if not v49 or #v49.Keypoints == 0 then
                    return v50;
                else
                    return v49.Keypoints[1].Value;
                end;
            end;
            local v52 = nil;
            if workspace.Terrain:FindFirstChild("EmittedPartsUsingPart_icle") then
                v52 = workspace.Terrain.EmittedPartsUsingPart_icle;
            else
                v52 = Instance.new("Folder");
                v52.Name = "EmittedPartsUsingPart_icle";
                v52.Parent = workspace.Terrain;
            end;
            local l_Properties_0 = l_Factors_0:FindFirstChild("Properties");
            local l_GraphBlender_0 = l_Factors_0:FindFirstChild("GraphBlender");
            local l_TotalKeyFrames_0 = l_Factors_0:FindFirstChild("TotalKeyFrames");
            local l_LifeTime_0 = l_Factors_0:FindFirstChild("LifeTime");
            v45 = v45:Clone();
            local v57 = {
                Brightness = l_Properties_0:FindFirstChild("Brightness"), 
                CurveSize0 = l_Properties_0:FindFirstChild("CurveSize0"), 
                CurveSize1 = l_Properties_0:FindFirstChild("CurveSize1"), 
                Width0 = l_Properties_0:FindFirstChild("Width0"), 
                Width1 = l_Properties_0:FindFirstChild("Width1"), 
                LightEmission = l_Properties_0:FindFirstChild("LightEmission"), 
                Segments = l_Properties_0:FindFirstChild("Segments"), 
                TextureLength = l_Properties_0:FindFirstChild("TextureLength"), 
                TextureSpeed = l_Properties_0:FindFirstChild("TextureSpeed")
            };
            local v58 = {};
            for v59, v60 in pairs(v57) do
                if v60 then
                    local l_Size_0 = v60.Size;
                    if not l_Size_0 or #l_Size_0.Keypoints <= 1 then
                        local v62 = v45[v59];
                        local v63 = if not l_Size_0 or #l_Size_0.Keypoints == 0 then v62 else l_Size_0.Keypoints[1].Value;
                        v45[v59] = v63;
                        print(v59, ": is now", v45[v59], "or", v63);
                    else
                        local v64 = v2.GenerateSeeds(l_Size_0, 20);
                        v58[v59] = {
                            Sequence = l_Size_0, 
                            Seed = v64[math.random(1, 20)]
                        };
                    end;
                end;
            end;
            local l_ColorGraphs_0 = l_GraphBlender_0:FindFirstChild("ColorGraphs");
            local l_TransparencyGraphs_0 = l_GraphBlender_0:FindFirstChild("TransparencyGraphs");
            local v67 = v3.RandomValueFromRange(l_LifeTime_0.Lifetime);
            local v68 = {};
            local v69 = {};
            for _, v71 in pairs(l_TransparencyGraphs_0:GetChildren()) do
                table.insert(v69, v71);
            end;
            for _, v73 in pairs(l_ColorGraphs_0:GetChildren()) do
                table.insert(v68, v73);
            end;
            table.sort(v69, function(v74, v75) --[[ Line: 195 ]]
                return v74.Name < v75.Name;
            end);
            table.sort(v68, function(v76, v77) --[[ Line: 196 ]]
                return v76.Name < v77.Name;
            end);
            local v78 = 1;
            local v79 = v68[v78];
            local v80 = 1;
            local v81 = v69[v80];
            v45.Enabled = true;
            v45.Parent = v52;
            do
                local l_v78_0, l_v79_0, l_v80_0, l_v81_0 = v78, v79, v80, v81;
                task.spawn(function() --[[ Line: 211 ]]
                    -- upvalues: l_TotalKeyFrames_0 (copy), l_RunService_0 (ref), v67 (copy), v45 (ref), l_v81_0 (ref), v69 (copy), l_v80_0 (ref), l_v79_0 (ref), v68 (copy), l_v78_0 (ref), v2 (ref), v58 (copy)
                    local v86 = tick();
                    local v87 = 0;
                    local v88 = 100;
                    local v89 = 0;
                    local v90 = 0;
                    if l_TotalKeyFrames_0 and l_TotalKeyFrames_0.Value > 0 then
                        v88 = l_TotalKeyFrames_0.Value;
                    end;
                    local v91 = nil;
                    v91 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 224 ]]
                        -- upvalues: v86 (copy), v67 (ref), v45 (ref), v91 (ref), v88 (ref), v87 (ref), l_v81_0 (ref), v90 (ref), v69 (ref), l_v80_0 (ref), l_v79_0 (ref), v89 (ref), v68 (ref), l_v78_0 (ref), v2 (ref), v58 (ref)
                        local v92 = tick() - v86;
                        local v93 = v92 / v67;
                        if v93 > 1 or not v45.Parent then
                            v91:Disconnect();
                            if v45 and v45.Parent then
                                v45:Destroy();
                            end;
                            return;
                        else
                            local v94 = math.floor(v93 * v88);
                            if v87 < v94 then
                                v87 = v94;
                                v93 = v87 / v88;
                                if l_v81_0 and l_v81_0.DurationOfBlend then
                                    local l_Value_0 = l_v81_0.DurationOfBlend.Value;
                                    if v90 + l_Value_0 < v92 and v69[l_v80_0 + 1] then
                                        v90 = v90 + l_Value_0;
                                        l_v80_0 = l_v80_0 + 1;
                                        l_v81_0 = v69[l_v80_0];
                                    end;
                                    local l_Value_1 = l_v79_0.DurationOfBlend.Value;
                                    if v89 + l_Value_1 < v92 and v68[l_v78_0 + 1] then
                                        v89 = v89 + l_Value_1;
                                        l_v78_0 = l_v78_0 + 1;
                                        l_v79_0 = v68[l_v78_0];
                                    end;
                                    local l_Transparency_0 = l_v81_0.Transparency.Transparency;
                                    local l_Transparency_1 = l_v81_0.BlendSpeed.Transparency;
                                    v45.Transparency = v2.BlendGraphWithTime(v45.Transparency, l_Transparency_0, l_Transparency_1, v93);
                                    local l_Color_0 = l_v79_0.Color.Color;
                                    local l_Transparency_2 = l_v79_0.BlendSpeed.Transparency;
                                    v45.Color = v2.BlendColorGraphWithTime(v45.Color, l_Color_0, l_Transparency_2, v93);
                                end;
                                for v101, v102 in pairs(v58) do
                                    v45[v101] = v2.QueryPointsWithTime(v93, v102.Sequence, v102.Seed);
                                end;
                            end;
                            return;
                        end;
                    end);
                end);
            end;
        end;
    end;
end;
l_Beam_0.EnableEmit = function(_, v104) --[[ Line: 281 ]] --[[ Name: EnableEmit ]]
    -- upvalues: l_Beam_0 (copy)
    if v104:IsA("Beam") and v104:GetAttribute("EmitDelay") then
        task.delay(v104:GetAttribute("EmitDelay"), function() --[[ Line: 284 ]]
            -- upvalues: l_Beam_0 (ref), v104 (copy)
            l_Beam_0:Emit(v104);
        end);
    end;
end;
v8.Transform = function(_, v106) --[[ Line: 290 ]] --[[ Name: Transform ]]
    -- upvalues: l_Parent_0 (copy)
    if v106:IsA("Beam") then
        l_Parent_0.Layouts.Beam.Factors:Clone().Parent = v106;
        v106:SetAttribute("Transformed", true);
        v106:SetAttribute("EmitCount", 1);
        v106:SetAttribute("EmitDuration", 0);
        v106:SetAttribute("EmitDelay", 0);
        v106:SetAttribute("IsEmitter", true);
        return;
    else
        if v106:IsA("Part") or v106:IsA("MeshPart") then
            l_Parent_0.Layouts.Part.Factors:Clone().Parent = v106;
            v106:SetAttribute("Transformed", true);
            v106:SetAttribute("EmitCount", 0);
            v106:SetAttribute("EmitDuration", 0);
            v106:SetAttribute("EmitDelay", 0);
            v106:SetAttribute("IsEmitter", true);
        end;
        return;
    end;
end;
v8.Emit = function(_, v108, v109) --[[ Line: 309 ]] --[[ Name: Emit ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v41 (copy), v10 (copy), l_RunService_0 (copy)
    if v108:FindFirstChild("Factors") then
        local v110 = {
            [Enum.NormalId.Top] = v108.CFrame.UpVector, 
            [Enum.NormalId.Bottom] = -v108.CFrame.UpVector, 
            [Enum.NormalId.Front] = v108.CFrame.LookVector, 
            [Enum.NormalId.Back] = -v108.CFrame.LookVector, 
            [Enum.NormalId.Left] = -v108.CFrame.RightVector, 
            [Enum.NormalId.Right] = v108.CFrame.RightVector
        };
        local l_SpecialMesh_0 = v108:FindFirstChildOfClass("SpecialMesh");
        local l_Decal_0 = v108:FindFirstChildOfClass("Decal");
        local l_Factors_1 = v108:FindFirstChild("Factors");
        local l_TotalKeyFrames_1 = l_Factors_1:FindFirstChild("TotalKeyFrames");
        local l_MeshFlipbooks_0 = l_Factors_1:FindFirstChild("MeshFlipbooks");
        local l_Main_0 = l_Factors_1:FindFirstChild("Main");
        local l_VelocityVectored_0 = l_Factors_1:FindFirstChild("VelocityVectored");
        local l_Main_1 = l_Factors_1:FindFirstChild("Main");
        local l_Size_1 = l_Factors_1:FindFirstChild("Size");
        local l_X_0 = l_Size_1:FindFirstChild("X");
        local l_Y_1 = l_Size_1:FindFirstChild("Y");
        local l_Z_0 = l_Size_1:FindFirstChild("Z");
        local l_Rotation_0 = l_Factors_1:FindFirstChild("Rotation");
        local l_X_1 = l_Rotation_0:FindFirstChild("X");
        local l_Y_2 = l_Rotation_0:FindFirstChild("Y");
        local l_Z_1 = l_Rotation_0:FindFirstChild("Z");
        local l_RotationSpeed_0 = l_Factors_1:FindFirstChild("RotationSpeed");
        local l_X_2 = l_RotationSpeed_0:FindFirstChild("X");
        local l_Y_3 = l_RotationSpeed_0:FindFirstChild("Y");
        local l_Z_2 = l_RotationSpeed_0:FindFirstChild("Z");
        local l_Main_2 = l_Factors_1:FindFirstChild("Main");
        local v132 = v2.GenerateSeeds(l_Main_1.Size, 20);
        local v133 = v2.GenerateSeeds(l_X_0.Size, 20);
        local v134 = v2.GenerateSeeds(l_Y_1.Size, 20);
        local v135 = v2.GenerateSeeds(l_Z_0.Size, 20);
        local v136 = v2.GenerateSeeds(l_X_2.Squash, 20);
        local v137 = v2.GenerateSeeds(l_Y_3.Squash, 20);
        local v138 = v2.GenerateSeeds(l_Z_2.Squash, 20);
        local v139 = v2.GenerateSeeds(l_Main_2.Squash, 20);
        local v140 = v2.GenerateSeeds(l_Main_0.Transparency, 20);
        local v141 = math.random(1, 20);
        local v142 = v132[v141];
        local v143 = v133[v141];
        local v144 = v134[v141];
        local v145 = v135[v141];
        local v146 = v136[v141];
        local v147 = v137[v141];
        local v148 = v138[v141];
        local v149 = v139[v141];
        local v150 = v140[v141];
        local v151 = v3.RandomValueFromRange(l_Main_0.Lifetime);
        local v152 = v3.RandomValueFromRange(l_X_1.Rotation);
        local v153 = v3.RandomValueFromRange(l_Y_2.Rotation);
        local v154 = v3.RandomValueFromRange(l_Z_1.Rotation);
        v108.Locked = true;
        v108:SetAttribute("IsEmitter", false);
        for _, v156 in v108:GetDescendants() do
            if v156:IsA("ParticleEmitter") then
                v156.Enabled = false;
            end;
        end;
        for _, v158 in v108:GetChildren() do
            if v158:IsA("Attachment") then
                v4.EnableEmitChildrenAndRepeatForAttachments(v158);
            end;
            v4.EnableEmitSingle(v158);
        end;
        if l_Decal_0 then
            v5.Flip(l_Main_0, l_MeshFlipbooks_0, l_Decal_0, v151);
        end;
        if l_Main_0.ShapeInOut == Enum.ParticleEmitterShapeInOut.InAndOut then
            local v159 = v41[l_Main_0.Shape];
            if v159 then
                local v160, v161 = v159(v108, l_Main_0);
                if typeof(v161) == "CFrame" and l_Main_0.ShapeStyle == Enum.ParticleEmitterShapeStyle.Surface then
                    local v162, v163, v164 = v108.CFrame:ToEulerAnglesXYZ();
                    v108:PivotTo(CFrame.new((v108.CFrame * CFrame.new(v160)).Position) * v161 * CFrame.Angles(v162, v163, v164));
                else
                    v108:PivotTo(CFrame.new((v108.CFrame * CFrame.new(v160)).Position) * v108.CFrame.Rotation);
                end;
            end;
        end;
        if l_SpecialMesh_0 then
            l_SpecialMesh_0.Scale = Vector3.new(0, 0, 0, 0);
        else
            v108.Size = Vector3.new(0, 0, 0, 0);
        end;
        v108.CFrame = v108.CFrame * CFrame.Angles(math.rad(v152), math.rad(v153), (math.rad(v154)));
        local l_Position_0 = v108.Position;
        local l_EmissionDirection_0 = l_Main_0.EmissionDirection;
        local v167 = nil;
        if l_VelocityVectored_0.Value == false then
            v167 = v110[l_EmissionDirection_0];
        else
            local v168 = v10[l_EmissionDirection_0] or v10[Enum.NormalId.Top];
            v167 = v108.CFrame[v168.vector] * v168.multiplier;
        end;
        local l_SpreadAngle_0 = l_Main_0.SpreadAngle;
        local v170 = 0;
        local v171 = 0;
        if l_SpreadAngle_0.X > 0 or l_SpreadAngle_0.Y > 0 then
            v170 = (math.random() * 2 - 1) * l_SpreadAngle_0.X;
            v171 = (math.random() * 2 - 1) * l_SpreadAngle_0.Y;
            v167 = (CFrame.lookAt(Vector3.new(), v167) * CFrame.Angles(math.rad(v170), math.rad(v171), 0)).LookVector;
        end;
        local v172 = CFrame.Angles(math.rad(v170), math.rad(v171), 0);
        local _ = v167 * v2.QueryPointsWithTime(0.1, l_Main_2.Squash, v149);
        local l_Acceleration_0 = l_Main_0.Acceleration;
        local v175 = v109 and v109.CFrame or CFrame.new();
        local v176 = v109 and v175:ToObjectSpace(v108.CFrame) or v108.CFrame;
        do
            local l_l_Position_0_0, l_v167_0, l_v176_0 = l_Position_0, v167, v176;
            task.spawn(function() --[[ Line: 461 ]]
                -- upvalues: l_TotalKeyFrames_1 (copy), l_RunService_0 (ref), v151 (copy), l_Factors_1 (copy), v108 (copy), v2 (ref), l_Main_1 (copy), v142 (copy), l_X_0 (copy), v143 (copy), l_Y_1 (copy), v144 (copy), l_Z_0 (copy), v145 (copy), l_X_2 (copy), v146 (copy), l_Y_3 (copy), v147 (copy), l_Z_2 (copy), v148 (copy), l_Main_2 (copy), v149 (copy), l_Main_0 (copy), v150 (copy), l_Acceleration_0 (copy), l_l_Position_0_0 (ref), l_v167_0 (ref), v109 (copy), l_v176_0 (ref), l_SpecialMesh_0 (copy), l_Decal_0 (copy), l_VelocityVectored_0 (copy), v172 (copy), v10 (ref), l_EmissionDirection_0 (copy)
                local v180 = tick();
                local v181 = 0;
                local v182 = 100;
                if l_TotalKeyFrames_1 and l_TotalKeyFrames_1.Value and l_TotalKeyFrames_1.Value > 0 then
                    v182 = l_TotalKeyFrames_1.Value;
                end;
                local v183 = nil;
                v183 = l_RunService_0.Heartbeat:Connect(function(v184) --[[ Line: 470 ]]
                    -- upvalues: v180 (copy), v151 (ref), v181 (ref), v182 (ref), l_Factors_1 (ref), v108 (ref), v183 (ref), v2 (ref), l_Main_1 (ref), v142 (ref), l_X_0 (ref), v143 (ref), l_Y_1 (ref), v144 (ref), l_Z_0 (ref), v145 (ref), l_X_2 (ref), v146 (ref), l_Y_3 (ref), v147 (ref), l_Z_2 (ref), v148 (ref), l_Main_2 (ref), v149 (ref), l_Main_0 (ref), v150 (ref), l_Acceleration_0 (ref), l_l_Position_0_0 (ref), l_v167_0 (ref), v109 (ref), l_v176_0 (ref), l_SpecialMesh_0 (ref), l_Decal_0 (ref), l_VelocityVectored_0 (ref), v172 (ref), v10 (ref), l_EmissionDirection_0 (ref)
                    local v185 = (tick() - v180) / v151;
                    if v185 >= 1 or v182 <= v181 then
                        if l_Factors_1:FindFirstChild("PartLife") ~= nil then
                            task.delay(l_Factors_1.PartLife.Value or 0, function() --[[ Line: 477 ]]
                                -- upvalues: v108 (ref)
                                v108:Destroy();
                            end);
                        else
                            v108:Destroy();
                        end;
                        v183:Disconnect();
                        return;
                    else
                        local v186 = math.floor(v185 * v182);
                        if v181 < v186 then
                            v181 = v186;
                            task.spawn(function() --[[ Line: 490 ]]
                                -- upvalues: v2 (ref), v185 (copy), l_Main_1 (ref), v142 (ref), l_X_0 (ref), v143 (ref), l_Y_1 (ref), v144 (ref), l_Z_0 (ref), v145 (ref), l_X_2 (ref), v146 (ref), l_Y_3 (ref), v147 (ref), l_Z_2 (ref), v148 (ref), l_Main_2 (ref), v149 (ref), l_Main_0 (ref), v150 (ref), l_Acceleration_0 (ref), l_l_Position_0_0 (ref), l_v167_0 (ref), v184 (copy), v109 (ref), l_v176_0 (ref), v108 (ref), l_SpecialMesh_0 (ref), l_Decal_0 (ref), l_VelocityVectored_0 (ref), v172 (ref), v10 (ref), l_EmissionDirection_0 (ref)
                                local v187 = v2.QueryPointsWithTime(v185, l_Main_1.Size, v142);
                                local v188 = v2.QueryPointsWithTime(v185, l_X_0.Size, v143);
                                local v189 = v2.QueryPointsWithTime(v185, l_Y_1.Size, v144);
                                local v190 = v2.QueryPointsWithTime(v185, l_Z_0.Size, v145);
                                local v191 = v2.QueryPointsWithTime(v185, l_X_2.Squash, v146);
                                local v192 = v2.QueryPointsWithTime(v185, l_Y_3.Squash, v147);
                                local v193 = v2.QueryPointsWithTime(v185, l_Z_2.Squash, v148);
                                local v194 = v2.QueryPointsWithTime(v185, l_Main_2.Squash, v149);
                                local v195 = v2.QueryPointsWithTime(v185, l_Main_0.Transparency, v150);
                                local v196 = v2.QueryColorPointWithTime(v185, l_Main_0.Color);
                                local l_v185_0 = v185;
                                local v198 = l_Acceleration_0 * l_v185_0;
                                local v199 = v194 * math.exp(-l_Main_0.Drag * l_v185_0);
                                local v200 = l_l_Position_0_0 + l_v167_0 * v199 * (v184 * 10) + v198 * (v184 * 10);
                                local v201 = CFrame.Angles(math.rad(v191), math.rad(v192), (math.rad(v193)));
                                local v202 = v200 - l_l_Position_0_0;
                                local v203 = v109 and v109.CFrame or CFrame.new();
                                local v204 = v203:VectorToObjectSpace(v202);
                                l_v176_0 = CFrame.new(v204) * l_v176_0;
                                v108.CFrame = v203 * l_v176_0;
                                v108.CFrame = v108.CFrame * v201;
                                l_l_Position_0_0 = v108.Position;
                                if l_SpecialMesh_0 then
                                    l_SpecialMesh_0.Scale = Vector3.new(v188, v189, v190);
                                else
                                    v108.Size = Vector3.new(v188, v189, v190);
                                end;
                                if l_Decal_0 then
                                    l_Decal_0.Transparency = v195;
                                    l_Decal_0.Color3 = Color3.fromRGB(v196.R * 255 * v187, v196.G * 255 * v187, v196.B * 255 * v187);
                                else
                                    v108.Transparency = v195;
                                    v108.Color = v196;
                                end;
                                if l_VelocityVectored_0.Value == true then
                                    local v205 = v108.CFrame * v172;
                                    local v206 = v10[l_EmissionDirection_0] or v10[Enum.NormalId.Top];
                                    l_v167_0 = v205[v206.vector] * v206.multiplier;
                                end;
                            end);
                        end;
                        return;
                    end;
                end);
            end);
        end;
    end;
end;
v8.Enable = function(v207, v208, v209) --[[ Line: 569 ]] --[[ Name: Enable ]]
    -- upvalues: v8 (copy)
    if v208:FindFirstChild("Factors") then
        _G.Part_Icles.EnableAllowed = false;
        local l_Factors_2 = v208:FindFirstChild("Factors");
        local l_Main_3 = l_Factors_2:FindFirstChild("Main");
        local l_Enabled_0 = l_Factors_2:FindFirstChild("Enabled");
        local l_EnableWithRespectToEnable_0 = l_Factors_2:FindFirstChild("EnableWithRespectToEnable");
        local l_v8_Folder_0 = v8:GetFolder();
        if v207.EnabledParts[v208] then
            task.cancel(v207.EnabledParts[v208]);
            v207.EnabledParts[v208] = nil;
        end;
        v207.EnabledParts[v208] = task.spawn(function() --[[ Line: 585 ]]
            -- upvalues: v207 (copy), v208 (ref), l_Enabled_0 (copy), l_EnableWithRespectToEnable_0 (copy), v209 (copy), l_v8_Folder_0 (copy), l_Main_3 (copy)
            local function _() --[[ Line: 587 ]] --[[ Name: cleanup ]]
                -- upvalues: v207 (ref), v208 (ref)
                _G.Part_Icles.EnableAllowed = true;
                v207.EnabledParts[v208] = nil;
            end;
            if not l_Enabled_0.Value then
                _G.Part_Icles.EnableAllowed = true;
                v207.EnabledParts[v208] = nil;
                return;
            else
                if l_EnableWithRespectToEnable_0 and l_EnableWithRespectToEnable_0.Value == true then
                    while l_Enabled_0.Value == true do
                        v208 = v208:Clone();
                        v207:Emit(v208, v209);
                        v208.Parent = l_v8_Folder_0;
                        task.wait(1 / l_Main_3.Rate);
                    end;
                    _G.Part_Icles.EnableAllowed = true;
                else
                    while l_Enabled_0.Value == true do
                        local v216 = v208:Clone();
                        v207:Emit(v216, v209);
                        v216.Parent = l_v8_Folder_0;
                        task.wait(1 / l_Main_3.Rate);
                    end;
                    _G.Part_Icles.EnableAllowed = true;
                end;
                _G.Part_Icles.EnableAllowed = true;
                v207.EnabledParts[v208] = nil;
                return;
            end;
        end);
    else
        warn(v208.Name .. "- is not Transformed");
    end;
end;
v8.EnableEmit = function(v217, v218) --[[ Line: 621 ]] --[[ Name: EnableEmit ]]
    -- upvalues: l_Beam_0 (copy), l_Settings_0 (copy)
    local l_Factors_3 = v218:FindFirstChild("Factors");
    if l_Factors_3 then
        if v218:IsA("Beam") then
            l_Beam_0:EnableEmit(v218);
            return;
        else
            local v220 = v218:GetAttribute("EmitCount") or 0;
            local v221 = v218:GetAttribute("EmitDelay") or 0;
            local v222 = v218:GetAttribute("EmitDuration") or 0;
            local l_Enabled_1 = l_Factors_3:FindFirstChild("Enabled");
            local l_v217_Folder_0 = v217:GetFolder();
            local v225 = {};
            if v220 > 0 then
                v220 = math.ceil((math.min(v220 * l_Settings_0.ParticleEmitRate.Value, 1)));
            end;
            for v226 = 1, v220 do
                v225[v226] = v218:Clone();
            end;
            task.delay(v221, function() --[[ Line: 643 ]]
                -- upvalues: v225 (copy), v217 (copy), l_v217_Folder_0 (copy), v222 (copy), l_Enabled_1 (copy), v218 (copy)
                for _, v228 in v225 do
                    v217:Emit(v228);
                    v228.Parent = l_v217_Folder_0;
                    v217:EnableEmitChildren(v228);
                end;
                if v222 > 0 then
                    l_Enabled_1.Value = true;
                    v217:Enable(v218);
                    task.wait(v222);
                    l_Enabled_1.Value = false;
                end;
            end);
        end;
    end;
end;
v8.EnableEmitChildren = function(v229, v230) --[[ Line: 660 ]] --[[ Name: EnableEmitChildren ]]
    -- upvalues: l_Beam_0 (copy), l_Settings_0 (copy)
    for _, v232 in v230:GetChildren() do
        if v232:GetAttribute("Transformed") then
            local l_Factors_4 = v232:FindFirstChild("Factors");
            if l_Factors_4 then
                if v232:IsA("Beam") then
                    l_Beam_0:EnableEmit(v232);
                else
                    local v234 = (v232:GetAttribute("EmitCount") or 0) * l_Settings_0.ParticleEmitRate.Value;
                    local v235 = v232:GetAttribute("EmitDelay") or 0;
                    local v236 = v232:GetAttribute("EmitDuration") or 0;
                    local l_Enabled_2 = l_Factors_4:FindFirstChild("Enabled");
                    local l_v229_Folder_0 = v229:GetFolder();
                    local v239 = {};
                    for v240 = 1, v234 do
                        v239[v240] = v232:Clone();
                    end;
                    task.delay(v235, function() --[[ Line: 679 ]]
                        -- upvalues: v239 (copy), v229 (copy), v230 (copy), v232 (copy), l_v229_Folder_0 (copy), v236 (copy), l_Enabled_2 (copy), v232 (copy)
                        for _, v242 in v239 do
                            v229:Emit(v242, v230);
                            v229:EnableEmitChildren(v242, v232);
                            v242.Parent = l_v229_Folder_0;
                        end;
                        if v236 > 0 then
                            l_Enabled_2.Value = true;
                            v229:Enable(v232, v230);
                            task.wait(v236);
                            l_Enabled_2.Value = false;
                        end;
                    end);
                end;
            end;
        end;
    end;
end;
v8._RecurCheck = function(v243, v244) --[[ Line: 697 ]] --[[ Name: _RecurCheck ]]
    for _, v246 in v244:GetChildren() do
        if v246:GetAttribute("Transformed") then
            v243:EnableEmit(v246);
        else
            v243:_RecurCheck(v246);
        end;
    end;
end;
v8.AbsoluteEmit = function(v247, v248) --[[ Line: 706 ]] --[[ Name: AbsoluteEmit ]]
    if v248:GetAttribute("Transformed") then
        v247:EnableEmit(v248);
        return;
    else
        v247:_RecurCheck(v248);
        return;
    end;
end;
return v8;