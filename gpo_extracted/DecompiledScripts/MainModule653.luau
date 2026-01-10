local v0 = {};
mOVthreshold = 0.01;
globalMinThickness = 0.05;
GenerateParallelogram = function(v1, v2, v3, v4, v5) --[[ Line: 13 ]] --[[ Name: GenerateParallelogram ]]
    local v6 = v5 or globalMinThickness;
    local v7 = v2 - v1;
    local v8 = v3 - v1;
    local v9 = math.acos(v7:Dot(v8) / (v7.magnitude * v8.magnitude));
    local v10 = nil;
    local v11 = nil;
    if v9 > 1.5707963267948966 then
        v10 = v8.magnitude * math.sin(v9 - 1.5707963267948966);
        v11 = v8.magnitude * math.cos(v9 - 1.5707963267948966);
    else
        v10 = v8.magnitude * math.cos(v9);
        v11 = v8.magnitude * math.sin(v9);
    end;
    if v7.magnitude <= v10 then
        return GenerateParallelogram(v3, v1, v3 + v7, v4, v6);
    else
        local v12 = (v1 + v3) / 2;
        local v13 = (v2 + v3) / 2;
        local v14 = (v3 + v7 + v2) / 2;
        local l_Unit_0 = v7.Unit;
        local l_Unit_1 = v7:Cross(v8).Unit;
        local v17 = l_Unit_0:Cross(l_Unit_1);
        local v18 = v9 > 1.5707963267948966 and 1 or -1;
        local l_WedgePart_0 = Instance.new("WedgePart");
        l_WedgePart_0.Parent = v4;
        l_WedgePart_0.Anchored = true;
        l_WedgePart_0.Size = Vector3.new(v6, v11 < globalMinThickness and globalMinThickness or v11, v10 < globalMinThickness and globalMinThickness or v10);
        l_WedgePart_0.CFrame = CFrame.new(v12.x, v12.y, v12.z, v18 * l_Unit_1.x, v18 * v17.x, l_Unit_0.x, v18 * l_Unit_1.y, v18 * v17.y, l_Unit_0.y, v18 * l_Unit_1.z, v18 * v17.z, l_Unit_0.z);
        l_WedgePart_0.BottomSurface = 0;
        local l_WedgePart_1 = Instance.new("WedgePart");
        l_WedgePart_1.Parent = v4;
        l_WedgePart_1.Anchored = true;
        l_WedgePart_1.Size = Vector3.new(v6, v11 < globalMinThickness and globalMinThickness or v11, v10 < globalMinThickness and globalMinThickness or v10);
        l_WedgePart_1.CFrame = CFrame.new(v14.x, v14.y, v14.z, v18 * l_Unit_1.x, -v18 * v17.x, -l_Unit_0.x, v18 * l_Unit_1.y, -v18 * v17.y, -l_Unit_0.y, v18 * l_Unit_1.z, -v18 * v17.z, -l_Unit_0.z);
        l_WedgePart_1.BottomSurface = 0;
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Parent = v4;
        l_Part_0.Anchored = true;
        l_Part_0.Size = Vector3.new(v6, v11 < globalMinThickness and globalMinThickness or v11, v7.magnitude - v10 < globalMinThickness and globalMinThickness or v7.magnitude - v10);
        l_Part_0.CFrame = CFrame.new(v13.x, v13.y, v13.z, l_Unit_1.x, v17.x, l_Unit_0.x, l_Unit_1.y, v17.y, l_Unit_0.y, l_Unit_1.z, v17.z, l_Unit_0.z);
        l_Part_0.TopSurface = 0;
        l_Part_0.BottomSurface = 0;
        return l_WedgePart_0, l_WedgePart_1, l_Part_0;
    end;
end;
GenerateTriangle = function(v22, v23, v24, v25, v26) --[[ Line: 72 ]] --[[ Name: GenerateTriangle ]]
    local v27 = v26 or globalMinThickness;
    local v28 = {
        v24, 
        v22, 
        v23
    };
    local v29 = {
        v24 - v23, 
        v22 - v24, 
        v23 - v22
    };
    local v30 = {
        v29[1].magnitude, 
        v29[2].magnitude, 
        v29[3].magnitude
    };
    local v31 = math.max(unpack(v30));
    local v32 = v31 == v30[1] and 1 or v31 == v30[2] and 2 or 3;
    local v33 = v29[v32];
    local v34 = (v32 + 1) % 3 + 1;
    local v35 = v32 % 3 + 1;
    local v36 = v28[v34] - v29[v34] / 2;
    local v37 = v28[v35] - v29[v35] / 2;
    local v38 = math.abs(v29[v34]:Dot(v33) / v31);
    local v39 = math.abs(v29[v35]:Dot(v33) / v31);
    local v40 = math.sqrt(v30[v34] ^ 2 - v38 ^ 2);
    local l_WedgePart_2 = Instance.new("WedgePart");
    l_WedgePart_2.Parent = v25;
    l_WedgePart_2.Anchored = true;
    local v42 = 0;
    local v43 = 0;
    l_WedgePart_2.TopSurface = v42;
    l_WedgePart_2.BottomSurface = v43;
    v42 = l_WedgePart_2:Clone();
    v42.Parent = v25;
    v43 = Vector3.new(v27, v40 < globalMinThickness and globalMinThickness or v40, v38 < globalMinThickness and globalMinThickness or v38);
    local v44 = Vector3.new(v27, v40 < globalMinThickness and globalMinThickness or v40, v39 < globalMinThickness and globalMinThickness or v39);
    l_WedgePart_2.Size = v43;
    v42.Size = v44;
    v43 = v33:Cross(-v29[v34]).Unit;
    v44 = v33.Unit;
    local v45 = v43:Cross(v44);
    l_WedgePart_2.CFrame = CFrame.new(v36.x, v36.y, v36.z, -v43.x, v45.x, v44.x, -v43.y, v45.y, v44.y, -v43.z, v45.z, v44.z);
    v42.CFrame = CFrame.new(v37.x, v37.y, v37.z, v43.x, v45.x, -v44.x, v43.y, v45.y, -v44.y, v43.z, v45.z, -v44.z);
    return l_WedgePart_2, v42;
end;
InvertPartOutwards = function(v46) --[[ Line: 109 ]] --[[ Name: InvertPartOutwards ]]
    local v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58 = v46.CFrame:components();
    if math.abs(Vector3.new(v52, v55, v58):Dot(Vector3.new(v50, v53, v56):Cross((Vector3.new(v51, v54, v57)))) - 1) > 1.0E-4 then
        v46.CFrame = CFrame.new(v47, v48, v49, -v50, v51, v52, -v53, v54, v55, -v56, v57, v58);
        local l_LeftSurface_0 = v46.LeftSurface;
        local l_RightSurface_0 = v46.RightSurface;
        v46.RightSurface = l_LeftSurface_0;
        v46.LeftSurface = l_RightSurface_0;
    end;
end;
InvertCornerWedgeOutwards = function(v61) --[[ Line: 117 ]] --[[ Name: InvertCornerWedgeOutwards ]]
    local v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73 = v61.CFrame:components();
    if math.abs(Vector3.new(v67, v70, v73):Dot(Vector3.new(v65, v68, v71):Cross((Vector3.new(v66, v69, v72)))) - 1) > 1.0E-4 then
        v61.Size = Vector3.new(v61.Size.z, v61.Size.y, v61.Size.x);
        v61.CFrame = CFrame.new(v62, v63, v64, -v65, v66, v67, -v68, v69, v70, -v71, v72, v73) * CFrame.Angles(0, 1.5707963267948966, 0);
        local l_LeftSurface_1 = v61.LeftSurface;
        local l_RightSurface_1 = v61.RightSurface;
        v61.RightSurface = l_LeftSurface_1;
        v61.LeftSurface = l_RightSurface_1;
        l_LeftSurface_1 = v61.FrontSurface;
        l_RightSurface_1 = v61.RightSurface;
        local l_BackSurface_0 = v61.BackSurface;
        local l_LeftSurface_2 = v61.LeftSurface;
        v61.RightSurface = l_LeftSurface_1;
        v61.BackSurface = l_RightSurface_1;
        v61.LeftSurface = l_BackSurface_0;
        v61.FrontSurface = l_LeftSurface_2;
    end;
end;
GenerateCuboid = function(v78, v79, v80, v81, v82, v83) --[[ Line: 127 ]] --[[ Name: GenerateCuboid ]]
    local v84 = (v79 + v80 + v81 - v78) / 2;
    local v85 = v79 - v78;
    local v86 = v80 - v78;
    local v87 = v81 - v78;
    local v88 = v83:Clone();
    v88.Name = v83 and v83.Name or "Part";
    v88.Size = Vector3.new(v85.magnitude < globalMinThickness and globalMinThickness or v85.magnitude, v86.magnitude < globalMinThickness and globalMinThickness or v86.magnitude, v87.magnitude < globalMinThickness and globalMinThickness or v87.magnitude);
    v88.CFrame = CFrame.new(v84.x, v84.y, v84.z, v85.x, v86.x, v87.x, v85.y, v86.y, v87.y, v85.z, v86.z, v87.z);
    InvertPartOutwards(v88);
    v88.Anchored = true;
    v88.Parent = v82;
    return v88;
end;
GenerateRightAnglePrism = function(v89, v90, v91, v92, v93, v94) --[[ Line: 143 ]] --[[ Name: GenerateRightAnglePrism ]]
    local v95 = (v90 + v91 + v92 - v89) / 2;
    local v96 = v90 - v89;
    local v97 = v91 - v89;
    local v98 = v92 - v89;
    local v99 = v94:Clone();
    v99.Name = v94 and v94.Name or "Wedge";
    v99.Size = Vector3.new(v96.magnitude < globalMinThickness and globalMinThickness or v96.magnitude, v97.magnitude < globalMinThickness and globalMinThickness or v97.magnitude, v98.magnitude < globalMinThickness and globalMinThickness or v98.magnitude);
    v99.CFrame = CFrame.new(v95.x, v95.y, v95.z, v96.x, v97.x, v98.x, v96.y, v97.y, v98.y, v96.z, v97.z, v98.z);
    InvertPartOutwards(v99);
    v99.Anchored = true;
    v99.Parent = v93;
    return v99;
end;
GenerateRightAngleCornerPrism = function(v100, v101, v102, v103, v104, v105) --[[ Line: 159 ]] --[[ Name: GenerateRightAngleCornerPrism ]]
    local v106 = (v101 + v102 + v103 - v100) / 2;
    local v107 = v101 - v100;
    local v108 = v102 - v100;
    local v109 = v103 - v100;
    local v110 = v105:Clone();
    v110.Name = v105 and v105.Name or "CornerWedge";
    v110.Size = Vector3.new(v107.magnitude < globalMinThickness and globalMinThickness or v107.magnitude, v108.magnitude < globalMinThickness and globalMinThickness or v108.magnitude, v109.magnitude < globalMinThickness and globalMinThickness or v109.magnitude);
    v110.CFrame = CFrame.new(v106.x, v106.y, v106.z, v107.x, v108.x, v109.x, v107.y, v108.y, v109.y, v107.z, v108.z, v109.z);
    InvertCornerWedgeOutwards(v110);
    v110.Anchored = true;
    v110.Parent = v104;
    return v110;
end;
GenerateParallelepiped = function(v111, v112, v113, v114, v115, v116) --[[ Line: 175 ]] --[[ Name: GenerateParallelepiped ]]
    local v117 = {
        {
            "Front"
        }, 
        {
            "Left"
        }, 
        {
            "Bottom"
        }, 
        {
            "Back"
        }, 
        {
            "Right"
        }, 
        {
            "Top"
        }
    };
    local v118 = {
        v112, 
        v113, 
        v114, 
        v112
    };
    local v119 = {
        v114 - v111, 
        v112 - v111, 
        v113 - v111
    };
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = v116 and v116.Name or "Part";
    l_Model_0.Parent = v115;
    for v121 = 0, 1 do
        for v122 = 1, 3 do
            local v123, v124, v125 = GenerateParallelogram(v111 + v121 * v119[v122], v118[v122] + v121 * v119[v122], v118[v122 + 1] + v121 * v119[v122], l_Model_0);
            table.insert(v117[v122 + 3 * v121], v123);
            table.insert(v117[v122 + 3 * v121], v124);
            table.insert(v117[v122 + 3 * v121], v125);
        end;
    end;
    if v116 then
        for v126 = 1, 6 do
            for v127 = 2, 4 do
                v117[v126][v127].RightSurface = v116[v117[v126][1] .. "Surface"];
                v117[v126][v127].LeftSurface = v116[v117[v126][1] .. "Surface"];
                v117[v126][v127].Transparency = v116.Transparency;
                v117[v126][v127].Reflectance = v116.Reflectance;
                v117[v126][v127].Material = v116.Material;
                v117[v126][v127].BrickColor = v116.BrickColor;
                v117[v126][v127].Color = v116.Color;
                v117[v126][v127].CanCollide = v116.CanCollide;
            end;
        end;
    end;
    return l_Model_0;
end;
GeneratePrism = function(v128, v129, v130, v131, v132, v133) --[[ Line: 222 ]] --[[ Name: GeneratePrism ]]
    local v134 = {
        {
            "Bottom"
        }, 
        {
            "Back"
        }, 
        {
            "Front"
        }, 
        {
            "Left"
        }, 
        {
            "Right"
        }
    };
    local v135 = {
        {
            v128, 
            v129, 
            v131
        }, 
        {
            v131, 
            v131 + v129 - v128, 
            v131 + v130 - v128
        }, 
        {
            v128, 
            v129, 
            v131 + v130 - v128
        }
    };
    local v136 = {
        {
            v128, 
            v131, 
            v131 + v130 - v128
        }, 
        {
            v129, 
            v131 + v129 - v128, 
            v131 + v129 + v130 - 2 * v128
        }
    };
    local l_Model_1 = Instance.new("Model");
    l_Model_1.Name = v133 and v133.Name or "Wedge";
    l_Model_1.Parent = v132;
    for v138 = 1, 3 do
        local v139, v140, v141 = GenerateParallelogram(v135[v138][1], v135[v138][2], v135[v138][3], l_Model_1);
        table.insert(v134[v138], v139);
        table.insert(v134[v138], v140);
        table.insert(v134[v138], v141);
    end;
    for v142 = 1, 2 do
        local v143, v144 = GenerateTriangle(v136[v142][1], v136[v142][2], v136[v142][3], l_Model_1);
        table.insert(v134[v142 + 3], v143);
        table.insert(v134[v142 + 3], v144);
    end;
    if v133 then
        for v145 = 1, 5 do
            local v146 = 2;
            local v147 = v145 < 4 and 4 or 3;
            for v148 = v146, v147 do
                v134[v145][v148].RightSurface = v133[v134[v145][1] .. "Surface"];
                v134[v145][v148].LeftSurface = v133[v134[v145][1] .. "Surface"];
                v134[v145][v148].Transparency = v133.Transparency;
                v134[v145][v148].Reflectance = v133.Reflectance;
                v134[v145][v148].Material = v133.Material;
                v134[v145][v148].BrickColor = v133.BrickColor;
                v134[v145][v148].Color = v133.Color;
                v134[v145][v148].CanCollide = v133.CanCollide;
            end;
        end;
    end;
    return l_Model_1;
end;
GenerateCornerPrism = function(v149, v150, v151, v152, v153, v154) --[[ Line: 262 ]] --[[ Name: GenerateCornerPrism ]]
    local v155 = {
        {
            "Bottom"
        }, 
        {
            "Back"
        }, 
        {
            "Front"
        }, 
        {
            "Left"
        }, 
        {
            "Right"
        }
    };
    local v156 = {
        {
            v149, 
            v150, 
            v152
        }
    };
    local v157 = {
        {
            v152, 
            v152 + v150 - v149, 
            v150 + v151 - v149
        }, 
        {
            v149, 
            v150, 
            v150 + v151 - v149
        }, 
        {
            v149, 
            v152, 
            v150 + v151 - v149
        }, 
        {
            v150, 
            v150 + v152 - v149, 
            v150 + v151 - v149
        }
    };
    local l_Model_2 = Instance.new("Model");
    l_Model_2.Name = v154 and v154.Name or "CornerWedge";
    l_Model_2.Parent = v153;
    local v159, v160, v161 = GenerateParallelogram(v156[1][1], v156[1][2], v156[1][3], l_Model_2);
    table.insert(v155[1], v159);
    table.insert(v155[1], v160);
    table.insert(v155[1], v161);
    for v162 = 1, 4 do
        local v163, v164 = GenerateTriangle(v157[v162][1], v157[v162][2], v157[v162][3], l_Model_2);
        table.insert(v155[v162 + 1], v163);
        table.insert(v155[v162 + 1], v164);
    end;
    if v154 then
        for v165 = 1, 5 do
            local v166 = 2;
            local v167 = v165 < 2 and 4 or 3;
            for v168 = v166, v167 do
                v155[v165][v168].RightSurface = v154[v155[v165][1] .. "Surface"];
                v155[v165][v168].LeftSurface = v154[v155[v165][1] .. "Surface"];
                v155[v165][v168].Transparency = v154.Transparency;
                v155[v165][v168].Reflectance = v154.Reflectance;
                v155[v165][v168].Material = v154.Material;
                v155[v165][v168].BrickColor = v154.BrickColor;
                v155[v165][v168].Color = v154.Color;
                v155[v165][v168].CanCollide = v154.CanCollide;
            end;
        end;
    end;
    return l_Model_2;
end;
v0.GlobalTransform = function(v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180) --[[ Line: 300 ]]
    local v181 = v180 == nil or v180;
    local v182 = v179 or Vector3.new(0, 0, 0, 0);
    local v183 = {
        v178.CFrame:pointToWorldSpace((Vector3.new(v178.Size.X / 2 * -1, v178.Size.Y / 2 * -1, v178.Size.Z / 2 * -1))) - v182, 
        v178.CFrame:pointToWorldSpace((Vector3.new(v178.Size.X / 2 * 1, v178.Size.Y / 2 * -1, v178.Size.Z / 2 * -1))) - v182, 
        v178.CFrame:pointToWorldSpace((Vector3.new(v178.Size.X / 2 * -1, v178.Size.Y / 2 * 1, v178.Size.Z / 2 * -1))) - v182, 
        v178.CFrame:pointToWorldSpace((Vector3.new(v178.Size.X / 2 * -1, v178.Size.Y / 2 * -1, v178.Size.Z / 2 * 1))) - v182
    };
    local v184 = {};
    for v185 = 1, 4 do
        local v186 = v183[v185];
        v184[v185] = v182 + Vector3.new(v169 * v186.x + v170 * v186.y + v171 * v186.z, v172 * v186.x + v173 * v186.y + v174 * v186.z, v175 * v186.x + v176 * v186.y + v177 * v186.z);
    end;
    if v181 then
        local v187 = 0;
        for v188 = 1, 3 do
            if math.abs(((v184[v188 + 1] - v184[1]).Unit:Dot((v184[v188 % 3 + 2] - v184[1]).Unit))) < mOVthreshold then
                v187 = v187 + 1;
            end;
        end;
        if v187 == 3 then
            return GenerateCuboid(v184[1], v184[2], v184[3], v184[4], v178.Parent, v178);
        else
            local v189 = GenerateParallelepiped(v184[1], v184[2], v184[3], v184[4], v178.Parent, v178);
            local l_CFrameValue_0 = Instance.new("CFrameValue");
            l_CFrameValue_0.Parent = v189;
            l_CFrameValue_0.Name = "Block";
            local v191 = v184[1];
            local v192 = v184[2] - v191;
            local v193 = v184[3] - v191;
            local v194 = v184[4] - v191;
            l_CFrameValue_0.Value = CFrame.new(v191.x, v191.y, v191.z, v192.x, v193.x, v194.x, v192.y, v193.y, v194.y, v192.z, v193.z, v194.z);
            return v189;
        end;
    else
        return GenerateParallelepiped(v184[1], v184[2], v184[3], v184[4], v178.Parent, v178);
    end;
end;
v0.GlobalContinuousTransform = function(v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206) --[[ Line: 348 ]]
    local v207 = v205 or Vector3.new(0, 0, 0, 0);
    local v208 = {
        v206.p - v207, 
        v206.p + v206.rightVector - v207, 
        v206.p + v206.upVector - v207, 
        v206.p - v206.lookVector - v207
    };
    local v209 = {};
    for v210 = 1, 4 do
        local v211 = v208[v210];
        v209[v210] = v207 + Vector3.new(v195 * v211.x + v196 * v211.y + v197 * v211.z, v198 * v211.x + v199 * v211.y + v200 * v211.z, v201 * v211.x + v202 * v211.y + v203 * v211.z);
    end;
    local v212 = GenerateParallelepiped(v209[1], v209[2], v209[3], v209[4], v204.Parent, v204);
    local l_CFrameValue_1 = Instance.new("CFrameValue");
    l_CFrameValue_1.Parent = v212;
    l_CFrameValue_1.Name = "Block";
    local v214 = v209[1];
    local v215 = v209[2] - v214;
    local v216 = v209[3] - v214;
    local v217 = v209[4] - v214;
    l_CFrameValue_1.Value = CFrame.new(v214.x, v214.y, v214.z, v215.x, v216.x, v217.x, v215.y, v216.y, v217.y, v215.z, v216.z, v217.z);
    return v212;
end;
v0.GlobalTransformWedge = function(v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229) --[[ Line: 380 ]]
    local v230 = v229 == nil or v229;
    local v231 = v228 or Vector3.new(0, 0, 0, 0);
    local v232 = {
        v227.CFrame:pointToWorldSpace((Vector3.new(v227.Size.X / 2 * -1, v227.Size.Y / 2 * -1, v227.Size.Z / 2 * -1))) - v231, 
        v227.CFrame:pointToWorldSpace((Vector3.new(v227.Size.X / 2 * 1, v227.Size.Y / 2 * -1, v227.Size.Z / 2 * -1))) - v231, 
        v227.CFrame:pointToWorldSpace((Vector3.new(v227.Size.X / 2 * -1, v227.Size.Y / 2 * 1, v227.Size.Z / 2 * -1))) - v231, 
        v227.CFrame:pointToWorldSpace((Vector3.new(v227.Size.X / 2 * -1, v227.Size.Y / 2 * -1, v227.Size.Z / 2 * 1))) - v231
    };
    local v233 = {};
    for v234 = 1, 4 do
        local v235 = v232[v234];
        v233[v234] = v231 + Vector3.new(v218 * v235.x + v219 * v235.y + v220 * v235.z, v221 * v235.x + v222 * v235.y + v223 * v235.z, v224 * v235.x + v225 * v235.y + v226 * v235.z);
    end;
    if v230 then
        local v236 = 0;
        for v237 = 1, 3 do
            if math.abs(((v233[v237 + 1] - v233[1]).Unit:Dot((v233[v237 % 3 + 2] - v233[1]).Unit))) < mOVthreshold then
                v236 = v236 + 1;
            end;
        end;
        if v236 == 3 then
            return GenerateRightAnglePrism(v233[1], v233[2], v233[3], v233[4], v227.Parent, v227);
        else
            local v238 = GeneratePrism(v233[1], v233[2], v233[3], v233[4], v227.Parent, v227);
            local l_CFrameValue_2 = Instance.new("CFrameValue");
            l_CFrameValue_2.Parent = v238;
            l_CFrameValue_2.Name = "WedgePart";
            local v240 = v233[1];
            local v241 = v233[2] - v240;
            local v242 = v233[3] - v240;
            local v243 = v233[4] - v240;
            l_CFrameValue_2.Value = CFrame.new(v240.x, v240.y, v240.z, v241.x, v242.x, v243.x, v241.y, v242.y, v243.y, v241.z, v242.z, v243.z);
            return v238;
        end;
    else
        return GeneratePrism(v233[1], v233[2], v233[3], v233[4], v227.Parent, v227);
    end;
end;
v0.GlobalContinuousWedgeTransform = function(v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255) --[[ Line: 428 ]]
    local v256 = v254 or Vector3.new(0, 0, 0, 0);
    local v257 = {
        v255.p - v256, 
        v255.p + v255.rightVector - v256, 
        v255.p + v255.upVector - v256, 
        v255.p - v255.lookVector - v256
    };
    local v258 = {};
    for v259 = 1, 4 do
        local v260 = v257[v259];
        v258[v259] = v256 + Vector3.new(v244 * v260.x + v245 * v260.y + v246 * v260.z, v247 * v260.x + v248 * v260.y + v249 * v260.z, v250 * v260.x + v251 * v260.y + v252 * v260.z);
    end;
    local v261 = GeneratePrism(v258[1], v258[2], v258[3], v258[4], v253.Parent, v253);
    local l_CFrameValue_3 = Instance.new("CFrameValue");
    l_CFrameValue_3.Parent = v261;
    l_CFrameValue_3.Name = "WedgePart";
    local v263 = v258[1];
    local v264 = v258[2] - v263;
    local v265 = v258[3] - v263;
    local v266 = v258[4] - v263;
    l_CFrameValue_3.Value = CFrame.new(v263.x, v263.y, v263.z, v264.x, v265.x, v266.x, v264.y, v265.y, v266.y, v264.z, v265.z, v266.z);
    return v261;
end;
v0.GlobalTransformCornerWedge = function(v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278) --[[ Line: 460 ]]
    local v279 = v278 == nil or v278;
    local v280 = v277 or Vector3.new(0, 0, 0, 0);
    local v281 = {
        v276.CFrame:pointToWorldSpace((Vector3.new(v276.Size.X / 2 * -1, v276.Size.Y / 2 * -1, v276.Size.Z / 2 * -1))) - v280, 
        v276.CFrame:pointToWorldSpace((Vector3.new(v276.Size.X / 2 * 1, v276.Size.Y / 2 * -1, v276.Size.Z / 2 * -1))) - v280, 
        v276.CFrame:pointToWorldSpace((Vector3.new(v276.Size.X / 2 * -1, v276.Size.Y / 2 * 1, v276.Size.Z / 2 * -1))) - v280, 
        v276.CFrame:pointToWorldSpace((Vector3.new(v276.Size.X / 2 * -1, v276.Size.Y / 2 * -1, v276.Size.Z / 2 * 1))) - v280
    };
    local v282 = {};
    for v283 = 1, 4 do
        local v284 = v281[v283];
        v282[v283] = v280 + Vector3.new(v267 * v284.x + v268 * v284.y + v269 * v284.z, v270 * v284.x + v271 * v284.y + v272 * v284.z, v273 * v284.x + v274 * v284.y + v275 * v284.z);
    end;
    if v279 then
        local v285 = 0;
        for v286 = 1, 3 do
            if math.abs(((v282[v286 + 1] - v282[1]).Unit:Dot((v282[v286 % 3 + 2] - v282[1]).Unit))) < mOVthreshold then
                v285 = v285 + 1;
            end;
        end;
        if v285 == 3 then
            return GenerateRightAngleCornerPrism(v282[1], v282[2], v282[3], v282[4], v276.Parent, v276);
        else
            local v287 = GenerateCornerPrism(v282[1], v282[2], v282[3], v282[4], v276.Parent, v276);
            local l_CFrameValue_4 = Instance.new("CFrameValue");
            l_CFrameValue_4.Parent = v287;
            l_CFrameValue_4.Name = "CornerWedgePart";
            local v289 = v282[1];
            local v290 = v282[2] - v289;
            local v291 = v282[3] - v289;
            local v292 = v282[4] - v289;
            l_CFrameValue_4.Value = CFrame.new(v289.x, v289.y, v289.z, v290.x, v291.x, v292.x, v290.y, v291.y, v292.y, v290.z, v291.z, v292.z);
            return v287;
        end;
    else
        return GenerateCornerPrism(v282[1], v282[2], v282[3], v282[4], v276.Parent, v276);
    end;
end;
v0.GlobalContinuousCornerWedgeTransform = function(v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304) --[[ Line: 508 ]]
    local v305 = v303 or Vector3.new(0, 0, 0, 0);
    local v306 = {
        v304.p - v305, 
        v304.p + v304.rightVector - v305, 
        v304.p + v304.upVector - v305, 
        v304.p - v304.lookVector - v305
    };
    local v307 = {};
    for v308 = 1, 4 do
        local v309 = v306[v308];
        v307[v308] = v305 + Vector3.new(v293 * v309.x + v294 * v309.y + v295 * v309.z, v296 * v309.x + v297 * v309.y + v298 * v309.z, v299 * v309.x + v300 * v309.y + v301 * v309.z);
    end;
    local v310 = GenerateCornerPrism(v307[1], v307[2], v307[3], v307[4], v302.Parent, v302);
    local l_CFrameValue_5 = Instance.new("CFrameValue");
    l_CFrameValue_5.Parent = v310;
    l_CFrameValue_5.Name = "CornerWedgePart";
    local v312 = v307[1];
    local v313 = v307[2] - v312;
    local v314 = v307[3] - v312;
    local v315 = v307[4] - v312;
    l_CFrameValue_5.Value = CFrame.new(v312.x, v312.y, v312.z, v313.x, v314.x, v315.x, v313.y, v314.y, v315.y, v313.z, v314.z, v315.z);
    return v310;
end;
v0.GlobalOrthogonalTransform = function(v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327) --[[ Line: 540 ]]
    local v328 = v327 == nil or v327;
    local v329 = v326 or Vector3.new(0, 0, 0, 0);
    local v330 = {
        v325.CFrame:pointToWorldSpace((Vector3.new(v325.Size.X / 2 * -1, v325.Size.Y / 2 * -1, v325.Size.Z / 2 * -1))) - v329, 
        v325.CFrame:pointToWorldSpace((Vector3.new(v325.Size.X / 2 * 1, v325.Size.Y / 2 * -1, v325.Size.Z / 2 * -1))) - v329, 
        v325.CFrame:pointToWorldSpace((Vector3.new(v325.Size.X / 2 * -1, v325.Size.Y / 2 * 1, v325.Size.Z / 2 * -1))) - v329, 
        v325.CFrame:pointToWorldSpace((Vector3.new(v325.Size.X / 2 * -1, v325.Size.Y / 2 * -1, v325.Size.Z / 2 * 1))) - v329
    };
    local v331 = {};
    for v332 = 1, 4 do
        local v333 = v330[v332];
        v331[v332] = v329 + Vector3.new(v316 * v333.x + v317 * v333.y + v318 * v333.z, v319 * v333.x + v320 * v333.y + v321 * v333.z, v322 * v333.x + v323 * v333.y + v324 * v333.z);
    end;
    if v328 then
        return GenerateCuboid(v331[1], v331[2], v331[3], v331[4], v325.Parent, v325);
    else
        return GenerateParallelepiped(v331[1], v331[2], v331[3], v331[4], v325.Parent, v325);
    end;
end;
return v0;