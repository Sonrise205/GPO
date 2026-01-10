local l_InstanceHandler_0 = require(script.Parent:WaitForChild("InstanceHandler"));
local l_Modes_0 = require(script.Parent:WaitForChild("Modes"));
local _ = game:GetService("TweenService");
local l_PhysicsService_0 = game:GetService("PhysicsService");
local v4 = RaycastParams.new();
local v5 = Random.new();
local _ = l_InstanceHandler_0.new(Instance.new("Part"), 250, "DebrisCache");
v4.FilterType = Enum.RaycastFilterType.Whitelist;
v4.IgnoreWater = true;
local function _(v7, v8, v9) --[[ Line: 25 ]]
    return v7 + (v8 - v7) * v9;
end;
local function _(v11) --[[ Line: 28 ]]
    if typeof(v11) == "Vector3" then
        return CFrame.new(v11);
    else
        return v11;
    end;
end;
local function _(v13, v14) --[[ Line: 34 ]]
    return math.cos(v13) * v14, math.sin(v13) * v14;
end;
local function _(v16, v17, v18, v19) --[[ Line: 40 ]]
    return (1 - v16) ^ 2 * v17 + 2 * (1 - v16) * v16 * v18 + v16 ^ 2 * v19;
end;
local function v26(v21, v22) --[[ Line: 44 ]]
    -- upvalues: l_InstanceHandler_0 (copy)
    local v23 = l_InstanceHandler_0.getInstance(v21 or "Part") or Instance.new(v21);
    for v24, v25 in next, v22 do
        if v24 ~= "Parent" or v24 ~= "ObjectName" then
            v23[v24] = v25;
        end;
    end;
    return v23;
end;
local function v30(v27, v28) --[[ Line: 54 ]]
    -- upvalues: v4 (copy)
    v4.FilterDescendantsInstances = {
        workspace.Env, 
        workspace.Islands, 
        workspace.Ships
    };
    local v29 = workspace:Raycast(v27.Position, v28, v4);
    if v29 then
        return v29.Instance, v29.Position, v29.Material, v29.Normal;
    else
        return false;
    end;
end;
local function v43(v31, v32, v33) --[[ Line: 65 ]]
    -- upvalues: v30 (copy), v26 (copy)
    local v34, v35, v36, _ = v30(v31, -v31.UpVector * v32);
    if v34 then
        local v38 = v26("Part", {
            Anchored = true, 
            CanCollide = false, 
            Material = v36, 
            Size = v33, 
            Color = v34.Color, 
            Reflectance = v34.Reflectance, 
            Transparency = v34.Transparency, 
            CFrame = if typeof(v35) == "Vector3" then CFrame.new(v35) else v35
        });
        for _, v40 in ipairs(v38:GetChildren()) do
            v40:Destroy();
        end;
        for _, v42 in ipairs(v34:GetChildren()) do
            if v42:IsA("Texture") then
                v42:Clone().Parent = v38;
            end;
        end;
        return v38, v35;
    else
        return;
    end;
end;
local function v46(v44, v45) --[[ Line: 90 ]]
    -- upvalues: v5 (copy)
    return v5:NextNumber(v44, v45);
end;
local function v54(v47, v48, v49, _) --[[ Line: 95 ]]
    local v51 = {};
    for v52 = 1, v49 + 1 do
        local v53 = v52 * (6.283185307179586 / v49);
        v51[v52] = v47 * Vector3.new(math.cos(v53) * v48, 0, math.sin(v53) * v48);
    end;
    return v51;
end;
return {
    Crater = function(v55, v56) --[[ Line: 109 ]]
        -- upvalues: v54 (copy), v5 (copy), v43 (copy), v46 (copy), l_Modes_0 (copy), l_InstanceHandler_0 (copy)
        local v57 = v56.BlockSize or {
            2, 
            3.5
        };
        local v58 = v56.PartCount or 10;
        local v59 = v56.Radius or 8;
        local v60 = v56.Range or 5;
        local v61 = v56.Angle or {
            45, 
            65
        };
        local v62 = v56.Height or {
            0, 
            0
        };
        local v63 = v56.Tilt or {
            0, 
            0
        };
        local v64 = v56.PartOffset or {
            0, 
            0
        };
        local v65 = v56.FlourishTypes or {};
        local v66 = v56.IterateSpeed or {};
        local v67 = 1;
        local v68 = {};
        local v69 = v56.CircleComplete or 1;
        local v70 = v54(v55, v59, v58);
        for v71 = 1, math.floor(#v70 * v69 + 0.5) do
            if v70[v71 + 1] ~= nil then
                local v72 = v70[v71];
                local l_Magnitude_0 = (v72 - v70[v71 + 1]).Magnitude;
                local v74 = v57[1];
                local v75 = v57[2];
                local v76 = v5:NextNumber(v74, v75);
                v74 = Vector3.new(l_Magnitude_0 + 0.5, v76, v76);
                local v77;
                v75, v77 = v43(if typeof(v72) == "Vector3" then CFrame.new(v72) else v72, v60, v74);
                if v75 then
                    local v78 = CFrame.lookAt(v75.Position, (Vector3.new(v55.X, 0, v55.Z)));
                    local l_new_0 = CFrame.new;
                    local v80 = 0;
                    local v81 = v62[1];
                    local v82 = v62[2];
                    local v83 = v78 * l_new_0(v80, v5:NextNumber(v81, v82), v46(v64[1], v64[2]));
                    v78 = CFrame.fromEulerAnglesXYZ;
                    local v84 = v61[1];
                    v81 = v61[2];
                    l_new_0 = math.rad((v5:NextNumber(v84, v81)));
                    v81 = v63[1];
                    v82 = v63[2];
                    v83 = {
                        CFrame = v83 * v78(l_new_0, math.rad((v5:NextNumber(v81, v82))), 0)
                    };
                    v75.CFrame = CFrame.lookAt(v75.Position, (Vector3.new(v55.X, 0, v55.Z)));
                    task.spawn(function() --[[ Line: 141 ]]
                        -- upvalues: v68 (copy), v75 (copy)
                        v68[#v68 + 1] = v75;
                    end);
                    l_Modes_0[v65.Entrance or "Enlarge"](v75, v65.EntranceSpeed or 0.3, v83);
                    if v66.Entrance then
                        if v66.EntranceDivision ~= "Iterate" then
                            if math.floor((math.floor(#v70 * v69 + 0.5) - 1) * (v67 / (v66.EntranceDivision or 3))) == v71 and v71 ~= math.floor(#v70 * v69 + 0.5) - 1 then
                                if v66.Entrance == "Stepped" then
                                    task.wait();
                                else
                                    task.wait(v66.Entrance);
                                end;
                                v67 = v67 + 1;
                            end;
                        elseif v66.Entrance == "Stepped" then
                            task.wait();
                        else
                            task.wait(v66.Entrance);
                        end;
                    end;
                end;
            end;
        end;
        v67 = 1;
        task.wait(v56.HoldTime or 5);
        for v85 = 1, #v68 do
            l_Modes_0[v65.Exit or "Shrink"](v68[v85], v65.ExitSpeed or 0.3);
            if v66.Exit then
                if v66.ExitDivision ~= "Iterate" then
                    if math.floor(#v68 * (v67 / (v66.ExitDivision or 2))) == v85 and v85 ~= #v68 then
                        if v66.Exit == "Stepped" then
                            task.wait();
                        else
                            task.wait(v66.Exit);
                        end;
                        v67 = v67 + 1;
                    end;
                elseif v66.Exit == "Stepped" then
                    task.wait();
                else
                    task.wait(v66.Exit);
                end;
            end;
            task.spawn(function() --[[ Line: 186 ]]
                -- upvalues: v65 (copy), l_InstanceHandler_0 (ref), v68 (copy), v85 (copy)
                task.wait((v65.ExitSpeed or 0.3) + 0.15);
                l_InstanceHandler_0.returnInstance("Part", v68[v85]);
            end);
        end;
    end, 
    ChunkCrater = function(v86, v87) --[[ Line: 193 ]]
        -- upvalues: v54 (copy), v5 (copy), v43 (copy), v26 (copy), v46 (copy), l_Modes_0 (copy), l_InstanceHandler_0 (copy)
        local v88 = v87.BlockSize or {
            2, 
            3.5
        };
        local v89 = v87.PartCount or 10;
        local v90 = v87.Radius or 8;
        local v91 = v87.Range or 5;
        local v92 = v87.Angle or {
            45, 
            65
        };
        local v93 = v87.Height or {
            0, 
            0
        };
        local v94 = v87.Tilt or {
            0, 
            0
        };
        local v95 = v87.PartOffset or {
            0, 
            0
        };
        local v96 = v87.FlourishTypes or {};
        local v97 = v87.IterateSpeed or {};
        local v98 = 1;
        local v99 = {};
        local v100 = {};
        local v101 = v87.CircleComplete or 1;
        local v102 = v54(v86, v90, v89);
        for v103 = 1, math.floor(#v102 * v101 + 0.5) do
            if v102[v103 + 1] ~= nil then
                local v104 = v102[v103];
                local l_Magnitude_1 = (v104 - v102[v103 + 1]).Magnitude;
                local v106 = v88[1];
                local v107 = v88[2];
                local v108 = v5:NextNumber(v106, v107);
                v106 = Vector3.new(l_Magnitude_1 + 0.5, v108, v108);
                local v109;
                v107, v109 = v43(if typeof(v104) == "Vector3" then CFrame.new(v104) else v104, v91, (Vector3.new(l_Magnitude_1 + 0.55, 0.5, v108 + 0.05)));
                if v107 then
                    local v110 = v26("Part", {
                        Anchored = true, 
                        CanCollide = false, 
                        Material = Enum.Material.Slate, 
                        Size = v106, 
                        Color = Color3.fromRGB(90, 76, 66), 
                        CFrame = if typeof(v109) == "Vector3" then CFrame.new(v109) else v109
                    });
                    v110.CFrame = CFrame.lookAt(v110.Position, (Vector3.new(v86.X, 0, v86.Z)));
                    v107.CFrame = v110.CFrame;
                    local v111 = CFrame.lookAt(v110.Position, (Vector3.new(v86.X, 0, v86.Z)));
                    local l_new_1 = CFrame.new;
                    local v113 = 0;
                    local v114 = v93[1];
                    local v115 = v93[2];
                    local v116 = v111 * l_new_1(v113, v5:NextNumber(v114, v115), v46(v95[1], v95[2]));
                    v111 = CFrame.fromEulerAnglesXYZ;
                    local v117 = v92[1];
                    v114 = v92[2];
                    l_new_1 = math.rad((v5:NextNumber(v117, v114)));
                    v114 = v94[1];
                    v115 = v94[2];
                    local v118 = v116 * v111(l_new_1, math.rad((v5:NextNumber(v114, v115))), 0);
                    v116 = {
                        CFrame = v118
                    };
                    task.spawn(function() --[[ Line: 238 ]]
                        -- upvalues: v99 (copy), v107 (copy), v100 (copy), v110 (copy)
                        v99[#v99 + 1] = v107;
                        v100[#v100 + 1] = v110;
                    end);
                    l_Modes_0[v96.Entrance or "Enlarge"](v110, v96.EntranceSpeed or 0.3, v116);
                    l_Modes_0[v96.Entrance or "Enlarge"](v107, v96.EntranceSpeed or 0.3, {
                        CFrame = v118 * CFrame.new(0, v108 / 2 + 0.15, 0)
                    });
                    if v97.Entrance then
                        if v97.EntranceDivision ~= "Iterate" then
                            if math.floor((math.floor(#v102 * v101 + 0.5) - 1) * (v98 / (v97.EntranceDivision or 3))) == v103 and v103 ~= math.floor(#v102 * v101 + 0.5) - 1 then
                                if v97.Entrance == "Stepped" then
                                    task.wait();
                                else
                                    task.wait(v97.Entrance);
                                end;
                                v98 = v98 + 1;
                            end;
                        elseif v97.Entrance == "Stepped" then
                            task.wait();
                        else
                            task.wait(v97.Entrance);
                        end;
                    end;
                end;
            end;
        end;
        v98 = 1;
        task.wait(v87.HoldTime or 5);
        for v119 = 1, #v99 do
            l_Modes_0[v96.Exit or "Shrink"](v99[v119], v96.ExitSpeed or 0.3);
            l_Modes_0[v96.Exit or "Shrink"](v100[v119], v96.ExitSpeed or 0.3);
            if v97.Exit and math.floor(#v99 * (v98 / (v97.ExitDivision or 2))) == v119 and v119 ~= #v99 then
                if v97.Exit == "Stepped" then
                    task.wait();
                else
                    task.wait(v97.Exit);
                end;
                v98 = v98 + 1;
            end;
            task.spawn(function() --[[ Line: 282 ]]
                -- upvalues: v96 (copy), l_InstanceHandler_0 (ref), v99 (copy), v119 (copy), v100 (copy)
                task.wait((v96.ExitSpeed or 0.3) + 0.15);
                l_InstanceHandler_0.returnInstance("Part", v99[v119]);
                l_InstanceHandler_0.returnInstance("Part", v100[v119]);
            end);
        end;
    end, 
    Orbit = function(v120, v121) --[[ Line: 290 ]]
        -- upvalues: v54 (copy), v5 (copy), v43 (copy), v46 (copy), l_Modes_0 (copy), l_InstanceHandler_0 (copy)
        local v122 = v121.BlockSize or {
            2, 
            3.5
        };
        local v123 = v121.PartCount or 10;
        local v124 = v121.Radius or 8;
        local v125 = v121.Range or 5;
        local v126 = v121.Angle or {
            45, 
            65
        };
        local v127 = v121.Height or {
            0, 
            0
        };
        local v128 = v121.Tilt or {
            0, 
            0
        };
        local v129 = v121.PartOffset or {
            0, 
            0
        };
        local v130 = v121.FlourishTypes or {};
        local v131 = v121.IterateSpeed or {};
        local v132 = 1;
        local v133 = {};
        local v134 = v121.CircleComplete or 1;
        local v135 = v54(v120, v124, v123);
        for v136 = 1, math.floor(#v135 * v134 + 0.5) - 1 do
            local v137 = v135[v136];
            local v138 = v122[1];
            local v139 = v122[2];
            local v140 = v5:NextNumber(v138, v139);
            v138, v139 = v43(if typeof(v137) == "Vector3" then CFrame.new(v137) else v137, v125, (Vector3.new(v140, v140, v140)));
            if v138 then
                local v141 = CFrame.lookAt(v138.Position, (Vector3.new(v120.X, 0, v120.Z)));
                local l_new_2 = CFrame.new;
                local v143 = 0;
                local v144 = v127[1];
                local v145 = v127[2];
                local v146 = v141 * l_new_2(v143, v5:NextNumber(v144, v145), v46(v129[1], v129[2]));
                v141 = CFrame.fromEulerAnglesXYZ;
                local v147 = v126[1];
                v144 = v126[2];
                l_new_2 = math.rad((v5:NextNumber(v147, v144)));
                v144 = v128[1];
                v145 = v128[2];
                v146 = {
                    CFrame = v146 * v141(l_new_2, math.rad((v5:NextNumber(v144, v145))), 0)
                };
                v138.CFrame = CFrame.lookAt(v138.Position, (Vector3.new(v120.X, 0, v120.Z)));
                task.spawn(function() --[[ Line: 316 ]]
                    -- upvalues: v133 (copy), v138 (copy)
                    v133[#v133 + 1] = v138;
                end);
                l_Modes_0[v130.Entrance or "Enlarge"](v138, v130.EntranceSpeed or 0.3, v146);
                if v131.Entrance then
                    if v131.EntranceDivision ~= "Iterate" then
                        if math.floor((math.floor(#v135 * v134 + 0.5) - 1) * (v132 / (v131.EntranceDivision or 3))) == v136 and v136 ~= math.floor(#v135 * v134 + 0.5) - 1 then
                            if v131.Entrance == "Stepped" then
                                task.wait();
                            else
                                task.wait(v131.Entrance);
                            end;
                            v132 = v132 + 1;
                        end;
                    elseif v131.Entrance == "Stepped" then
                        task.wait();
                    else
                        task.wait(v131.Entrance);
                    end;
                end;
            end;
        end;
        v132 = 1;
        task.wait(v121.HoldTime or 5);
        for v148 = 1, #v133 do
            l_Modes_0[v130.Exit or "Shrink"](v133[v148], v130.ExitSpeed or 0.3);
            if v131.Exit then
                if v131.ExitDivision ~= "Iterate" then
                    if math.floor(#v133 * (v132 / (v131.ExitDivision or 2))) == v148 and v148 ~= #v133 then
                        if v131.Exit == "Stepped" then
                            task.wait();
                        else
                            task.wait(v131.Exit);
                        end;
                        v132 = v132 + 1;
                    end;
                elseif v131.Exit == "Stepped" then
                    task.wait();
                else
                    task.wait(v131.Exit);
                end;
            end;
            task.spawn(function() --[[ Line: 362 ]]
                -- upvalues: v130 (copy), l_InstanceHandler_0 (ref), v133 (copy), v148 (copy)
                task.wait((v130.ExitSpeed or 0.3) + 0.15);
                l_InstanceHandler_0.returnInstance("Part", v133[v148]);
            end);
        end;
    end, 
    Path = function(v149, v150) --[[ Line: 369 ]]
        -- upvalues: v43 (copy), v5 (copy), l_Modes_0 (copy), l_InstanceHandler_0 (copy)
        local v151 = v150.BlockSize or {
            1.5, 
            2
        };
        local v152 = v150.Distance or 15;
        local v153 = v150.StepSize or v151[1];
        local v154 = v150.Width or {
            1, 
            3
        };
        local v155 = v150.Range or 5;
        local v156 = v150.Angle or {
            -1000, 
            1000
        };
        local v157 = v150.Height or {
            0, 
            0
        };
        local v158 = v150.Tilt or {
            -1000, 
            1000
        };
        local v159 = v150.RightCurve and -v150.RightCurve or 0;
        local v160 = v150.LeftCurve or 0;
        local v161 = v150.RightOffset or 0;
        local v162 = v150.LeftOffset or 0;
        local v163 = v150.FlourishTypes or {};
        local v164 = v150.IterateSpeed or {};
        local v165 = 1;
        local v166 = {};
        local v167 = {};
        local v168 = v149 * CFrame.new(v154[1], 0, 0);
        local v169 = v149 * CFrame.new(v154[2], 0, -v152);
        local v170 = v149 * CFrame.new(-v154[1], 0, 0);
        local v171 = v149 * CFrame.new(-v154[2], 0, -v152);
        local v172 = (v168.Position + v169.Position) / 2;
        local v173 = (v170.Position + v171.Position) / 2;
        for v174 = 0, v152, v153 do
            local v175 = v154[1];
            local v176 = v154[2];
            local v177 = v174 / v152;
            local _ = v175 + (v176 - v175) * v177;
            v176 = v151[1];
            v177 = v151[2];
            local v179 = v174 / v152;
            v175 = v176 + (v177 - v176) * v179;
            v176 = v43;
            local v180 = v174 / v152;
            local l_Position_0 = v168.Position;
            local l_Position_1 = (CFrame.lookAt(v172, v168.Position) * CFrame.new(v159, 0, v161)).Position;
            local l_Position_2 = v169.Position;
            v179 = (1 - v180) ^ 2 * l_Position_0 + 2 * (1 - v180) * v180 * l_Position_1 + v180 ^ 2 * l_Position_2;
            v176 = v176(if typeof(v179) == "Vector3" then CFrame.new(v179) else v179, v155, (Vector3.new(v175, v175, v175)));
            v177 = v43;
            l_Position_0 = v174 / v152;
            l_Position_1 = v170.Position;
            l_Position_2 = (CFrame.lookAt(v173, v170.Position) * CFrame.new(v160, 0, v162)).Position;
            local l_Position_3 = v171.Position;
            v180 = (1 - l_Position_0) ^ 2 * l_Position_1 + 2 * (1 - l_Position_0) * l_Position_0 * l_Position_2 + l_Position_0 ^ 2 * l_Position_3;
            v177 = v177(if typeof(v180) == "Vector3" then CFrame.new(v180) else v180, v155, (Vector3.new(v175, v175, v175)));
            if v176 then
                l_Position_0 = v156[1];
                l_Position_1 = v156[2];
                v179 = v5:NextNumber(l_Position_0, l_Position_1);
                l_Position_0 = v158[1];
                l_Position_1 = v158[2];
                v180 = v5:NextNumber(l_Position_0, l_Position_1);
                l_Position_2 = v176.CFrame;
                l_Position_3 = CFrame.new;
                local v185 = 0;
                local v186 = v157[1];
                local v187 = v157[2];
                l_Position_0 = l_Position_2 * l_Position_3(v185, v5:NextNumber(v186, v187), 0) * CFrame.fromEulerAnglesXYZ(math.rad(v179), math.rad(v180), 0);
                v176.Orientation = Vector3.new(math.rad(v179), math.rad(v180), 0);
                l_Modes_0[v163.Entrance or "Enlarge"](v176, v163.EntranceSpeed or 0.3, {
                    CFrame = l_Position_0
                });
            end;
            if v177 then
                l_Position_0 = v156[1];
                l_Position_1 = v156[2];
                v179 = v5:NextNumber(l_Position_0, l_Position_1);
                l_Position_0 = v158[1];
                l_Position_1 = v158[2];
                v180 = v5:NextNumber(l_Position_0, l_Position_1);
                l_Position_2 = v177.CFrame;
                l_Position_3 = CFrame.new;
                local v188 = 0;
                local v189 = v157[1];
                local v190 = v157[2];
                l_Position_0 = l_Position_2 * l_Position_3(v188, v5:NextNumber(v189, v190), 0) * CFrame.fromEulerAnglesXYZ(math.rad(v179), math.rad(v180), 0);
                v177.Orientation = Vector3.new(math.rad(v179), math.rad(v180), 0);
                l_Modes_0[v163.Entrance or "Enlarge"](v177, v163.EntranceSpeed or 0.3, {
                    CFrame = l_Position_0
                });
            end;
            task.spawn(function() --[[ Line: 420 ]]
                -- upvalues: v166 (copy), v176 (copy), v167 (copy), v177 (copy)
                v166[#v166 + 1] = v176;
                v167[#v167 + 1] = v177;
            end);
            if v164.Entrance then
                if v164.EntranceDivision ~= "Iterate" then
                    if math.floor(v152 * (v165 / (v164.EntranceDivision or 3))) == v174 and v174 ~= v152 - 1 then
                        if v164.EntranceSpeed then
                            task.wait(v164.EntranceSpeed);
                        else
                            task.wait();
                        end;
                        v165 = v165 + 1;
                    end;
                elseif v164.EntranceSpeed then
                    task.wait(v164.EntranceSpeed);
                else
                    task.wait();
                end;
            end;
        end;
        v165 = 1;
        task.wait(v150.HoldTime or 5);
        for v191 = 1, #v166 do
            l_Modes_0[v163.Exit or "Shrink"](v166[v191], v163.ExitSpeed or 0.3);
            l_Modes_0[v163.Exit or "Shrink"](v167[v191], v163.ExitSpeed or 0.3);
            if v164.Exit then
                if v164.ExitDivision ~= "Iterate" then
                    if math.floor(#v166 * (v165 / (v164.ExitDivision or 2))) == v191 and v191 ~= #v166 then
                        if v164.Exit == "Stepped" then
                            task.wait();
                        else
                            task.wait(v164.Exit);
                        end;
                        v165 = v165 + 1;
                    end;
                elseif v164.Exit == "Stepped" then
                    task.wait();
                else
                    task.wait(v164.Exit);
                end;
            end;
            task.spawn(function() --[[ Line: 467 ]]
                -- upvalues: v163 (copy), l_InstanceHandler_0 (ref), v166 (copy), v191 (copy), v167 (copy)
                task.wait((v163.ExitSpeed or 0.3) + 0.15);
                l_InstanceHandler_0.returnInstance("Part", v166[v191]);
                l_InstanceHandler_0.returnInstance("Part", v167[v191]);
            end);
        end;
    end, 
    Break = function(v192, v193) --[[ Line: 475 ]]
        -- upvalues: v5 (copy), v46 (copy), v43 (copy), l_PhysicsService_0 (copy), l_Modes_0 (copy), l_InstanceHandler_0 (copy)
        local v194 = v193.BlockSize or {
            0.25, 
            0.5
        };
        local v195 = v193.PartCount or 10;
        local v196 = v193.Radius or 8;
        local v197 = v193.Width or {
            -8, 
            8
        };
        local v198 = v193.Range or 5;
        local v199 = v193.Angle or {
            45, 
            65
        };
        local v200 = v193.Height or {
            0, 
            0
        };
        local v201 = v193.FlourishTypes or {};
        local v202 = v193.IterateSpeed or {};
        local v203 = 1;
        local v204 = {};
        for v205 = 1, v195 do
            local v206 = v194[1];
            local v207 = v194[2];
            local v208 = v5:NextNumber(v206, v207);
            v207 = v194[1];
            local v209 = v194[2];
            local v210 = Vector3.new(v208, v5:NextNumber(v207, v209), v46(v194[1], v194[2]));
            v206 = CFrame.new;
            v209 = -v196;
            v208 = v192 * v206(v5:NextNumber(v209, v196), 0, v46(-v196, v196));
            v206, v207 = v43(v208, v198, v210);
            if v206 then
                l_PhysicsService_0:SetPartCollisionGroup(v206, "Blocks");
                v206.CFrame = v206.CFrame * CFrame.new(0, v206.Size.Y / 2, 0);
                v206.Anchored = false;
                v206.CanCollide = true;
                v204[#v204 + 1] = v206;
                l_Modes_0[v201.Entrance or "Enlarge"](v206, v201.EntranceSpeed or 0.3, {
                    CFrame = v206.CFrame
                });
                v209 = Instance.new("BodyVelocity", v206);
                v209.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
                v209.P = 100000;
                local v211 = v197[1];
                local v212 = v197[2];
                local v213 = v5:NextNumber(v211, v212);
                v212 = v200[1];
                local v214 = v200[2];
                v209.Velocity = Vector3.new(v213, v5:NextNumber(v212, v214), v46(v197[1], v197[2]));
                local v215 = Instance.new("BodyAngularVelocity", v206);
                v212 = -v199[1];
                v214 = v199[2];
                v211 = v5:NextNumber(v212, v214);
                v214 = -v199[1];
                local v216 = v199[2];
                v215.AngularVelocity = Vector3.new(v211, v5:NextNumber(v214, v216), v46(-v199[1], v199[2]));
                v215.MaxTorque = Vector3.new(1e999, 1e999, 1e999, 0);
                v215.P = 100000;
                game:GetService("Debris"):AddItem(v209, 0.25);
                game:GetService("Debris"):AddItem(v215, 0.1);
                if v202.Entrance then
                    if v202.EntranceDivision ~= "Iterate" then
                        if math.floor(v195 * (v203 / (v202.EntranceDivision or 3)) + 0.5) == v205 and v205 ~= v195 then
                            if v202.Entrance == "Stepped" then
                                task.wait();
                            else
                                task.wait(v202.Entrance);
                            end;
                            v203 = v203 + 1;
                        end;
                    elseif v202.Entrance == "Stepped" then
                        task.wait();
                    else
                        task.wait(v202.Entrance);
                    end;
                end;
            end;
        end;
        v203 = 1;
        task.wait(v193.HoldTime or 5);
        for v217 = 1, #v204 do
            l_Modes_0[v201.Exit or "Shrink"](v204[v217], v201.ExitSpeed or 0.3);
            if v202.Exit then
                if v202.ExitDivision ~= "Iterate" then
                    if math.floor(#v204 * (v203 / (v202.ExitDivision or 2))) == v217 and v217 ~= #v204 then
                        if v202.Exit == "Stepped" then
                            task.wait();
                        else
                            task.wait(v202.Exit);
                        end;
                        v203 = v203 + 1;
                    end;
                elseif v202.Exit == "Stepped" then
                    task.wait();
                else
                    task.wait(v202.Exit);
                end;
            end;
            task.spawn(function() --[[ Line: 553 ]]
                -- upvalues: v201 (copy), l_InstanceHandler_0 (ref), v204 (copy), v217 (copy)
                task.wait((v201.ExitSpeed or 0.3) + 0.15);
                l_InstanceHandler_0.returnInstance("Part", v204[v217]);
            end);
        end;
    end
};