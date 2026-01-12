local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
if l_RunService_0:IsClient() then
    l_Players_0.LocalPlayer.CharacterAdded:Wait();
end;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local v4 = require(l_Modules_0.DataStructures.Grids.RectGrid);
local v5 = require(l_Modules_0.Data.OceanData);
local v6 = require(l_Modules_0.DataStructures.Grids["2DPointGrid"]);
local l_Terrain_0 = workspace:FindFirstChildOfClass("Terrain");
local l_l_Terrain_0_Attribute_0 = l_Terrain_0:GetAttribute("SeaLevel");
local l_l_Terrain_0_Attribute_1 = l_Terrain_0:GetAttribute("PlaneSize");
local l_l_Terrain_0_Attribute_2 = l_Terrain_0:GetAttribute("OceanSize");
local v11 = l_l_Terrain_0_Attribute_1 / 2;
local function _(v12, v13) --[[ Line: 25 ]] --[[ Name: CeilToMult ]]
    return math.ceil(v12 / v13) * v13;
end;
local v15 = l_ReplicatedStorage_0.Assets.ClientFX:WaitForChild("Wave4", 3);
local v16 = v4.new(100);
local v17 = v6.new(40);
local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
local l_Model_0 = Instance.new("Model");
l_Model_0.Name = "OceanMeshes";
local l_Model_1 = Instance.new("Model");
local l_Humanoid_0 = Instance.new("Humanoid");
l_Humanoid_0.EvaluateStateMachine = false;
l_Humanoid_0.Parent = l_Model_1;
l_Model_1.Name = "farPlaneMeshs";
l_Model_1.Parent = l_Model_0;
warn("OCEAN MODULE REQUIRED");
local function v22(v23, v24, v25) --[[ Line: 47 ]] --[[ Name: ScaleRecursive ]]
    -- upvalues: v22 (copy)
    if v24:IsA("Bone") then
        local v26 = v23.CFrame:Inverse() * v24.Parent.CFrame;
        v26 = v26 - v26.Position;
        v24.Position = v26:Inverse() * (v26 * v24.Position * v25);
    end;
    for _, v28 in next, v24:GetChildren() do
        v22(v23, v28, v25);
    end;
end;
v22(v15, v15, l_l_Terrain_0_Attribute_1 / v15.Size.X);
v15.Size = Vector3.new(l_l_Terrain_0_Attribute_1, 0, l_l_Terrain_0_Attribute_1);
local function _(v29, v30) --[[ Line: 66 ]] --[[ Name: IsCornerVertex ]]
    -- upvalues: v11 (copy)
    if math.abs(v29) == v11 and math.abs(v30) == v11 then
        return true;
    else
        return;
    end;
end;
local v32 = {};
local v75, v76 = ({
    new = function(v33, v34) --[[ Line: 75 ]] --[[ Name: new ]]
        -- upvalues: l_l_Terrain_0_Attribute_1 (copy), v15 (copy), l_l_Terrain_0_Attribute_0 (copy), l_Model_0 (copy), l_workspace_ServerTimeNow_0 (ref)
        local v35 = {};
        local function _(v36) --[[ Line: 78 ]] --[[ Name: CreateWave ]]
            local l_Direction_0 = v36.Direction;
            local l_Steepness_0 = v36.Steepness;
            local l_Length_0 = v36.Length;
            return {
                Direction = l_Direction_0, 
                XDir = l_Direction_0.X, 
                ZDir = l_Direction_0.Y, 
                Length = l_Length_0, 
                Steepness = l_Steepness_0, 
                k = 6.283185307179586 / l_Length_0
            };
        end;
        local v41 = {};
        local v42 = {};
        local l_l_l_Terrain_0_Attribute_1_0 = l_l_Terrain_0_Attribute_1;
        local v44 = math.ceil(v34 / l_l_l_Terrain_0_Attribute_1_0) * l_l_l_Terrain_0_Attribute_1_0 / l_l_Terrain_0_Attribute_1;
        for v45 = -v44 * 0.5, v44 * 0.5 do
            for v46 = -v44 * 0.5, v44 * 0.5 do
                local l_Model_2 = Instance.new("Model");
                local v48 = v15:Clone();
                local v49 = v45 * l_l_Terrain_0_Attribute_1;
                local v50 = v46 * l_l_Terrain_0_Attribute_1;
                v48.CFrame = CFrame.new(v49, l_l_Terrain_0_Attribute_0, v50) * CFrame.Angles(0, 1.5707963267948966, 0);
                v48.Parent = l_Model_2;
                l_Model_2.Parent = l_Model_0;
                table.insert(v42, {
                    Object = v48, 
                    Vertices = {}, 
                    EdgeVertices = {}, 
                    X = v49, 
                    Z = v50, 
                    CFrame = v48.CFrame, 
                    InverseCFrame = v48.CFrame:Inverse()
                });
            end;
        end;
        for _, v52 in next, v42 do
            local l_X_0 = v52.X;
            local l_Z_0 = v52.Z;
            local v55 = v52.Object.Size.X / 2;
            for _, v57 in next, v52.Object:GetChildren() do
                if v57:IsA("Bone") then
                    local l_Position_0 = v57.Position;
                    local l_X_1 = l_Position_0.X;
                    local l_Z_1 = l_Position_0.Z;
                    local v61 = false;
                    if math.abs(math.abs(l_X_1) - v55) < 1 then
                        v61 = true;
                    elseif math.abs(math.abs(l_Z_1) - v55) < 1 then
                        v61 = true;
                    end;
                    if v61 then
                        table.insert(v52.EdgeVertices, {
                            l_X_0 + l_X_1, 
                            l_Z_0 + l_Z_1, 
                            v57, 
                            l_X_1, 
                            l_Z_1
                        });
                    else
                        local v62 = {
                            l_X_0 + l_X_1, 
                            l_Z_0 + l_Z_1, 
                            v57, 
                            l_workspace_ServerTimeNow_0, 
                            0, 
                            l_X_1, 
                            l_Z_1, 
                            nil
                        };
                        table.insert(v41, v62);
                        table.insert(v52.Vertices, v62);
                    end;
                end;
            end;
        end;
        local v63 = {};
        for v64, v65 in next, v33 do
            local l_Direction_1 = v65.Direction;
            local l_Steepness_1 = v65.Steepness;
            local l_Length_1 = v65.Length;
            v63[v64] = {
                Direction = l_Direction_1, 
                XDir = l_Direction_1.X, 
                ZDir = l_Direction_1.Y, 
                Length = l_Length_1, 
                Steepness = l_Steepness_1, 
                k = 6.283185307179586 / l_Length_1
            };
        end;
        v35 = {
            Vertices = v41, 
            WaveParams = v63, 
            Planes = v42
        };
        l_l_l_Terrain_0_Attribute_1_0 = function() --[[ Line: 177 ]] --[[ Name: updateTransparency ]]
            -- upvalues: v42 (copy)
            local l_Attribute_0 = workspace.Terrain:GetAttribute("OceanTransparency");
            for _, v71 in next, v42 do
                v71.Object.Transparency = l_Attribute_0;
            end;
        end;
        local l_Attribute_1 = workspace.Terrain:GetAttribute("OceanTransparency");
        for _, v74 in next, v42 do
            v74.Object.Transparency = l_Attribute_1;
        end;
        workspace.Terrain:GetAttributeChangedSignal("OceanTransparency"):Connect(l_l_l_Terrain_0_Attribute_1_0);
        return v35, v44;
    end
}).new({
    WaveA = {
        Direction = Vector2.new(1, 1), 
        Steepness = 1, 
        Length = 65
    }, 
    WaveB = {
        Direction = Vector2.new(1, 0.6), 
        Steepness = 0.33, 
        Length = 88
    }
}, l_l_Terrain_0_Attribute_2);
local l_WaveParams_0 = v75.WaveParams;
v32.Vertices = v75.Vertices;
local l_WaveA_0 = l_WaveParams_0.WaveA;
local l_WaveB_0 = l_WaveParams_0.WaveB;
local l_XDir_0 = l_WaveA_0.XDir;
local l_ZDir_0 = l_WaveA_0.ZDir;
local l_XDir_1 = l_WaveB_0.XDir;
local l_ZDir_1 = l_WaveB_0.ZDir;
local _ = l_WaveA_0.Direction.Unit;
local _ = l_WaveB_0.Direction.Unit;
local l_Steepness_2 = l_WaveA_0.Steepness;
local l_Steepness_3 = l_WaveB_0.Steepness;
local v88 = 6.283185307179586 / l_WaveA_0.Length;
local v89 = 6.283185307179586 / l_WaveB_0.Length;
local v90 = math.sqrt(9.8 / v88);
local v91 = math.sqrt(9.8 / v89);
local v92 = v90 * l_workspace_ServerTimeNow_0;
local v93 = v91 * l_workspace_ServerTimeNow_0;
local v94 = l_Steepness_2 / v88;
local v95 = l_Steepness_3 / v89;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_sqrt_0 = math.sqrt;
local l_abs_0 = math.abs;
local function _(v100) --[[ Line: 239 ]] --[[ Name: V3ToV2 ]]
    return Vector2.new(v100.X, v100.Z);
end;
local v102 = {};
local function v111(v103) --[[ Line: 244 ]] --[[ Name: UnpackWaveData ]]
    -- upvalues: l_sqrt_0 (copy), v102 (copy)
    local l_Unit_2 = v103.Direction.Unit;
    local l_Steepness_4 = v103.Steepness;
    local v106 = 6.283185307179586 / v103.Length;
    local v107 = {
        l_Unit_2.X, 
        l_Unit_2.Y, 
        v106, 
        l_sqrt_0(9.8 / v106), 
        l_Steepness_4 / v106, 
        -l_Unit_2.X * l_Unit_2.X * l_Steepness_4, 
        -l_Unit_2.X * l_Unit_2.Y * l_Steepness_4, 
        l_Unit_2.X * l_Steepness_4, 
        l_Unit_2.Y * l_Steepness_4, 
        -l_Unit_2.Y * l_Unit_2.Y * l_Steepness_4, 
        l_Unit_2, 
        l_Steepness_4
    };
    local v108 = v102[v103] or v107;
    v102[v103] = v108;
    for v109, v110 in next, v107 do
        v108[v109] = v110;
    end;
    return v108;
end;
local function v116(v112) --[[ Line: 277 ]] --[[ Name: UnpackRegionData ]]
    -- upvalues: v111 (copy)
    local v113 = {};
    v112.WaveUpdated = v111;
    for _, v115 in next, v112.Waves do
        table.insert(v113, (v111(v115)));
    end;
    return v113;
end;
for _, v118 in next, v5 do
    local l_Position_1 = v118.P0.Position;
    local v120 = Vector2.new(l_Position_1.X, l_Position_1.Z);
    local l_Position_2 = v118.P1.Position;
    l_Position_1 = Vector2.new(l_Position_2.X, l_Position_2.Z);
    v16:FillRect(Rect.new(v120, l_Position_1), (v116(v118)));
end;
local v122 = v116(v5.DefaultRegionData);
local v123 = -l_XDir_0 * l_XDir_0 * l_Steepness_2;
local v124 = -l_XDir_1 * l_XDir_1 * l_Steepness_3;
local v125 = l_XDir_0 * l_Steepness_2;
local v126 = l_XDir_1 * l_Steepness_3;
local _ = -l_XDir_0 * l_ZDir_0 * l_Steepness_2;
local _ = -l_XDir_1 * l_ZDir_1 * l_Steepness_3;
local v129 = -l_XDir_0 * l_ZDir_0 * l_Steepness_2;
local v130 = -l_XDir_1 * l_ZDir_1 * l_Steepness_3;
local v131 = l_ZDir_0 * l_Steepness_2;
local v132 = l_ZDir_1 * l_Steepness_3;
local v133 = -l_ZDir_0 * l_ZDir_0 * l_Steepness_2;
local v134 = -l_ZDir_1 * l_ZDir_1 * l_Steepness_3;
local v135 = 9000000000;
local _, v137 = next(v75.Vertices);
v137 = v137 and Vector3.new(v137[1], 0, v137[2]);
for _, v139 in next, v75.Vertices do
    local l_Magnitude_0 = (Vector3.new(v139[1], 0, v139[2]) - v137).Magnitude;
    if l_Magnitude_0 < v135 and l_Magnitude_0 > 0.08 then
        v135 = l_Magnitude_0;
    end;
end;
local function v167(v141, v142, v143) --[[ Line: 333 ]] --[[ Name: LookupOceanNormal ]]
    -- upvalues: v16 (copy), v122 (copy), v88 (copy), l_XDir_0 (copy), l_ZDir_0 (copy), v92 (ref), v89 (copy), l_XDir_1 (copy), l_ZDir_1 (copy), v93 (ref), l_sin_0 (copy), l_cos_0 (copy), v123 (copy), v124 (copy), v125 (copy), v126 (copy), v129 (copy), v130 (copy), v131 (copy), v132 (copy), v133 (copy), v134 (copy), l_l_Terrain_0_Attribute_0 (copy), v94 (copy), v95 (copy), l_workspace_ServerTimeNow_0 (ref)
    local v144 = v143 or v16:GetPointData(v141, v142) or v122;
    if not v144 or v144 == "nil" then
        local v145 = v88 * (l_XDir_0 * v141 + l_ZDir_0 * v142 - v92);
        local v146 = v89 * (l_XDir_1 * v141 + l_ZDir_1 * v142 - v93);
        local v147 = l_sin_0(v145);
        local v148 = l_cos_0(v145);
        local v149 = l_sin_0(v146);
        local v150 = l_cos_0(v146);
        local v151 = 0 + v123 * v147 + v124 * v149;
        local v152 = v125 * v148 + v126 * v150;
        local v153 = v129 * v147 + v130 * v149;
        local v154 = v129 * v147 + v130 * v149;
        local v155 = v131 * v148 + v132 * v150;
        local v156 = 0 + v133 * v147 + v134 * v149;
        return l_l_Terrain_0_Attribute_0 + v94 * l_sin_0(v88 * (l_XDir_0 * v141 + l_ZDir_0 * v142 - v92)) + v95 * l_sin_0(v89 * (l_XDir_1 * v141 + l_ZDir_1 * v142 - v93)), Vector3.new(v154, v155, v156), (Vector3.new(v151, v152, v153));
    else
        local v157 = Vector3.new(0, 0, 0, 0);
        local v158 = Vector3.new(0, 0, 0, 0);
        local l_l_l_Terrain_0_Attribute_0_0 = l_l_Terrain_0_Attribute_0;
        for _, v161 in next, v144 do
            local v162 = v161[3] * (v161[1] * v141 + v161[2] * v142 - v161[4] * l_workspace_ServerTimeNow_0);
            local v163 = v161[11];
            local v164 = v161[12];
            local v165 = l_sin_0(v162);
            local v166 = l_cos_0(v162);
            v157 = v157 + Vector3.new(-v163.X * v163.X * v164 * v165, v163.X * v164 * v166, -v163.X * -v163.Y * v164 * v165);
            v158 = v158 + Vector3.new(-v163.X * v163.Y * v164 * v165, v163.Y * v164 * v166, -v163.Y * v163.Y * v164 * v165);
            l_l_l_Terrain_0_Attribute_0_0 = l_l_l_Terrain_0_Attribute_0_0 + v161[5] * v165;
        end;
        return l_l_l_Terrain_0_Attribute_0_0, v158, v157;
    end;
end;
local function v175(v168, v169, v170) --[[ Line: 420 ]] --[[ Name: LookupOceanHeight ]]
    -- upvalues: v16 (copy), v122 (copy), l_l_Terrain_0_Attribute_0 (copy), v94 (copy), v88 (copy), l_XDir_0 (copy), l_ZDir_0 (copy), v92 (ref), l_sin_0 (copy), v95 (copy), v89 (copy), l_XDir_1 (copy), l_ZDir_1 (copy), v93 (ref), l_workspace_ServerTimeNow_0 (ref)
    local v171 = v170 or v16:GetPointData(v168, v169) or v122;
    if not v171 or v171 == "nil" then
        return l_l_Terrain_0_Attribute_0 + v94 * l_sin_0(v88 * (l_XDir_0 * v168 + l_ZDir_0 * v169 - v92)) + v95 * l_sin_0(v89 * (l_XDir_1 * v168 + l_ZDir_1 * v169 - v93));
    else
        local l_l_l_Terrain_0_Attribute_0_1 = l_l_Terrain_0_Attribute_0;
        for _, v174 in next, v171 do
            l_l_l_Terrain_0_Attribute_0_1 = l_l_l_Terrain_0_Attribute_0_1 + v174[5] * l_sin_0(v174[3] * (v174[1] * v168 + v174[2] * v169 - v174[4] * l_workspace_ServerTimeNow_0));
        end;
        return l_l_l_Terrain_0_Attribute_0_1, v171;
    end;
end;
local function v190(v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186) --[[ Line: 438 ]] --[[ Name: DerivePlane ]]
    local v187 = (v181 - v184) * (v176 - v182) + (v182 - v179) * (v178 - v184);
    local v188 = ((v181 - v184) * (v185 - v182) + (v182 - v179) * (v186 - v184)) / v187;
    local v189 = ((v184 - v178) * (v185 - v182) + (v176 - v182) * (v186 - v184)) / v187;
    return v188 * v177 + v189 * v180 + (1 - v188 - v189) * v183;
end;
local v191 = v135 ^ 2;
local function v201(v192, v193) --[[ Line: 450 ]] --[[ Name: LookupHeight ]]
    -- upvalues: v135 (ref), l_abs_0 (copy), v175 (copy), v191 (copy), v190 (copy)
    local v194 = v192 - v192 % v135;
    local v195 = v193 - v193 % v135;
    if l_abs_0(v192 - (l_abs_0(v192 - (v192 + v135 - (v192 + v135) % v135)) < v194 - v192 and v192 + v135 - (v192 + v135) % v135 or v194)) < 0.01 and l_abs_0(v193 - (l_abs_0(v193 - (v193 + v135 - (v193 + v135) % v135)) < v195 - v193 and v193 + v135 - (v193 + v135) % v135 or v195)) < 0.01 then
        return v175(v194, v195);
    else
        local v196 = v135 * (v192 - v194) + v135 * (v193 - v195) - v191 < 0;
        local v197 = v196 and v194 or v194 + v135;
        local v198 = v195 + v135;
        local v199 = v196 and v194 + v135 or v194;
        local v200 = v196 and v195 or v195 + v135;
        v194 = v194 + (v196 and 0 or v135);
        return (v190(v194, v175(v194, v195), v195, v197, v175(v197, v198), v198, v199, v175(v199, v200), v200, v192, v193));
    end;
end;
local function v218(v202, v203) --[[ Line: 472 ]] --[[ Name: LookupNormal ]]
    -- upvalues: v135 (ref), v191 (copy), v175 (copy)
    local v204 = v202 - v202 % v135;
    local v205 = v203 - v203 % v135;
    local v206 = v135 * (v202 - v204) + v135 * (v203 - v205) - v191 < 0;
    local v207 = v206 and v204 or v204 + v135;
    local v208 = v205 + v135;
    local v209 = v206 and v204 + v135 or v204;
    local v210 = v206 and v205 or v205 + v135;
    v204 = v204 + (v206 and 0 or v135);
    local v211 = v175(v204, v205);
    local v212 = v175(v207, v208);
    local v213 = v175(v209, v210);
    local l_Unit_3 = Vector3.new(-((v212 - v211) * (v210 - v208) - (v208 - v205) * (v213 - v212)), -((v208 - v205) * (v209 - v207) - (v207 - v204) * (v210 - v208)), -((v207 - v204) * (v213 - v212) - (v212 - v211) * (v209 - v207))).Unit;
    local v215 = (v208 - v210) * (v202 - v209) + (v209 - v207) * (v203 - v210);
    local v216 = (v208 - v210) * (v204 - v209) + (v209 - v207) * (v205 - v210);
    local v217 = (v210 - v205) * (v202 - v209) + (v204 - v209) * (v203 - v210);
    return v215 / v216 * v211 + v217 / v216 * v212 + (1 - v215 / v216 - v217 / v216) * v213, l_Unit_3;
end;
l_RunService_0.Heartbeat:Connect(function() --[[ Line: 502 ]]
    -- upvalues: l_workspace_ServerTimeNow_0 (ref), v32 (copy), v92 (ref), v90 (copy), v93 (ref), v91 (copy)
    debug.profilebegin("Wave update [Main Module]");
    l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    v32.Time = l_workspace_ServerTimeNow_0;
    v92 = v90 * l_workspace_ServerTimeNow_0;
    v93 = v91 * l_workspace_ServerTimeNow_0;
    debug.profileend();
end);
v32.NormalLookup = v218;
v32.HeightLookup = v201;
v32.OceanHeightLookup = v175;
v32.OceanNormalLookup = v167;
v32.Params = v75;
v32.VertexSpacing = v135;
v32.PlaneSize = l_l_Terrain_0_Attribute_1;
v32.SeaLevel = l_l_Terrain_0_Attribute_0;
v32.PlaneParams = v75;
v32.NumPlaneRows = v76;
v32.SteepKA = v94;
v32.WaveAk = v88;
v32.WaveAXDir = l_XDir_0;
v32.WaveAZDir = l_ZDir_0;
v32.ctA = v92;
v32.SteepKB = v95;
v32.WaveBk = v89;
v32.WaveBXDir = l_XDir_1;
v32.WaveBZDir = l_ZDir_1;
v32.ctB = v93;
v32.WaveAc = v90;
v32.WaveBc = v91;
v32.DefaultRegionData = v122;
v32.VertexGrid = v17;
v32.OceanGrid = v16;
v32.NoRender = false;
v32.NoOceanRegion = false;
v32.OceanMeshes = l_Model_0;
if not l_RunService_0:IsClient() then
    l_Model_0:ClearAllChildren();
    v32.NoRender = true;
else
    l_Model_0.Parent = workspace.Ocean;
end;
return v32;