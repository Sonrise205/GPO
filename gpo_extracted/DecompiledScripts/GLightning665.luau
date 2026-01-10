local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(script:WaitForChild("Curves"));
local l_Draw_0 = require(script:WaitForChild("Draw"));
local v4 = {
    Stack = {}
};
v4.__index = v4;
v4.Initalize = function(v5) --[[ Line: 15 ]] --[[ Name: Initalize ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0.Heartbeat:Connect(function(v6) --[[ Line: 16 ]]
        -- upvalues: v5 (copy)
        v5:Step(v6);
    end);
end;
v4.new = function(v7) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy)
    local v8 = setmetatable({
        Life = 0, 
        Lifetime = v7.Lifetime, 
        Properties = v7
    }, v4);
    local v9 = Color3.new();
    local v10 = 0;
    local v11 = 0;
    local v81 = {
        Colors = function(_, _, v14) --[[ Line: 41 ]]
            -- upvalues: v7 (copy), v9 (ref)
            local function v19() --[[ Line: 42 ]] --[[ Name: ClosestAlpha ]]
                -- upvalues: v7 (ref), v14 (copy)
                local v15 = nil;
                local v16 = nil;
                for v17, v18 in v7.Colors do
                    if not v15 or math.abs(v14 - v18.Time) < v15 then
                        v15 = math.abs(v14 - v18.Time);
                        v16 = v17;
                        if v17 > 1 and v14 > v18.Time and v17 + 1 <= #v7.Colors then
                            v16 = v17 + 1;
                        end;
                    end;
                end;
                return v16;
            end;
            local function v33(v20, v21, v22) --[[ Line: 61 ]] --[[ Name: GetColor ]]
                local function _(v23, v24, v25) --[[ Line: 62 ]] --[[ Name: lerp ]]
                    return v23 * (1 - v25) + v24 * v25;
                end;
                local l_new_0 = Color3.new;
                local l_R_0 = v20.R;
                local l_R_1 = v21.R;
                local v30 = l_R_0 * (1 - v22) + l_R_1 * v22;
                l_R_1 = v20.G;
                local l_G_0 = v21.G;
                l_R_0 = l_R_1 * (1 - v22) + l_G_0 * v22;
                l_G_0 = v20.B;
                local l_B_0 = v21.B;
                return l_new_0(v30, l_R_0, l_G_0 * (1 - v22) + l_B_0 * v22);
            end;
            local v34 = v19();
            if v34 then
                local v35 = v34 == 1;
                local v36 = v35 and v34 or v34 - 1;
                local v37 = v35 and v34 + 1 or v34;
                local v38 = v7.Colors[v36];
                local v39 = v7.Colors[v37];
                local v40 = v38.Time - v39.Time;
                local v41 = math.abs((v14 - v38.Time) / v40);
                v9 = v33(v38.Value, v39.Value, v41);
            end;
        end, 
        Sizes = function(_, _, v44) --[[ Line: 93 ]]
            -- upvalues: v7 (copy), v11 (ref)
            local v49 = (function() --[[ Line: 94 ]] --[[ Name: ClosestAlpha ]]
                -- upvalues: v7 (ref), v44 (copy)
                local v45 = nil;
                local v46 = nil;
                for v47, v48 in v7.Sizes do
                    if not v45 or math.abs(v44 - v48.Time) < v45 then
                        v45 = math.abs(v44 - v48.Time);
                        v46 = v47;
                        if v47 > 1 and v44 > v48.Time and v47 + 1 <= #v7.Sizes then
                            v46 = v47 + 1;
                        end;
                    end;
                end;
                return v46;
            end)();
            if v49 then
                local v50 = v49 == 1;
                local v51 = v50 and v49 or v49 - 1;
                local v52 = v50 and v49 + 1 or v49;
                local v53 = v7.Sizes[v51];
                local v54 = v7.Sizes[v52];
                local v55 = v54.Size - v53.Size;
                local v56 = v54.Time - v53.Time;
                local v57 = math.abs((v44 - v53.Time) / v56);
                v11 = v53.Size + v55 * v57;
            end;
        end, 
        Transparency = function(_, _, v60) --[[ Line: 135 ]]
            -- upvalues: v7 (copy), v10 (ref)
            local v65 = (function() --[[ Line: 136 ]] --[[ Name: ClosestAlpha ]]
                -- upvalues: v7 (ref), v60 (copy)
                local v61 = nil;
                local v62 = nil;
                for v63, v64 in v7.Transparencies do
                    if not v61 or math.abs(v60 - v64.Time) < v61 then
                        v61 = math.abs(v60 - v64.Time);
                        v62 = v63;
                        if v63 > 1 and v60 > v64.Time and v63 + 1 <= #v7.Transparencies then
                            v62 = v63 + 1;
                        end;
                    end;
                end;
                return v62;
            end)();
            if v65 then
                local v66 = v65 == 1;
                local v67 = v66 and v65 or v65 - 1;
                local v68 = v66 and v65 + 1 or v65;
                local v69 = v7.Transparencies[v67];
                local v70 = v7.Transparencies[v68];
                local v71 = v70.Transparency - v69.Transparency;
                local v72 = v70.Time - v69.Time;
                local v73 = math.abs((v60 - v69.Time) / v72);
                v10 = v69.Transparency + v71 * v73;
            end;
        end, 
        Points = function(v74, v75, _) --[[ Line: 177 ]]
            for _, v78 in v74.Properties.Points do
                local v79 = v78.LastLockedPos and v78.LockToPart.Position - v78.LastLockedPos or Vector3.new();
                local v80 = v78.Position + v79;
                v78.Velocity = v78.Velocity:Lerp(Vector3.new(), v78.Drag * v75) + v78.Acceleration * v75;
                v78.Position = v80 + v78.Velocity * v75;
                if v78.LockToPart then
                    v78.LastLockedPos = v78.LockToPart.Position;
                end;
            end;
        end
    };
    local l_DrawType_0 = v8.Properties.DrawType;
    if l_DrawType_0 == "Singular" then
        local l_ArcSize_0 = v8.Properties.ArcSize;
        v8.SegmentHandler = v8:DrawSingularSegments(l_ArcSize_0.Min, l_ArcSize_0.Max, v10, v9, v11);
    elseif l_DrawType_0 == "Multiple" then
        v8.SegmentHandler = v8:DrawMultipleSegments(v10, v9, v11);
    end;
    local v84 = l_HttpService_0:GenerateGUID(false);
    v4.Stack[v84] = function(v85) --[[ Line: 204 ]]
        -- upvalues: v8 (copy), v81 (copy), v10 (ref), v9 (ref), v11 (ref), v4 (ref), v84 (copy)
        v8.Life = v8.Life + v85;
        if v8.Life <= v8.Lifetime then
            local v86 = v8.Life / v8.Lifetime;
            for _, v88 in v81 do
                v8:Thread(v88, v8, v85, v86);
            end;
            v8:UpdateSegments(v85, v10, v9, v11);
            return;
        else
            v8:WipeSegments();
            v4.Stack[v84] = nil;
            return;
        end;
    end;
    return v8;
end;
v4.DrawSingularSegments = function(v89, v90, v91, v92, v93, v94) --[[ Line: 226 ]] --[[ Name: DrawSingularSegments ]]
    local v95 = Random.new();
    local function v116(v96, v97, v98, v99, v100) --[[ Line: 229 ]] --[[ Name: GetSegmentData ]]
        -- upvalues: v95 (copy), v90 (copy), v91 (copy), v89 (copy)
        local v101 = v97 - v96;
        local l_Magnitude_0 = v101.Magnitude;
        local l_Unit_0 = v101.Unit;
        local v104 = v96 + 0.25 * l_Magnitude_0 * l_Unit_0;
        local v105 = v96 + 0.5 * l_Magnitude_0 * l_Unit_0;
        local v106 = v96 + 0.75 * l_Magnitude_0 * l_Unit_0;
        local l_Magnitude_1 = (v96 - v104).Magnitude;
        local l_Magnitude_2 = (v104 - v105).Magnitude;
        local l_Magnitude_3 = (v105 - v106).Magnitude;
        local v110 = v95:NextNumber(v90, v91);
        local l_ChangesSegmentOffset_0 = v89.Properties.ChangesSegmentOffset;
        if l_ChangesSegmentOffset_0 then
            local l_Bounds_0 = v89.Properties.OffsetChangePercent.Bounds;
            l_ChangesSegmentOffset_0 = v89.Properties.OffsetChangePercent.EqualOrBelow >= v95:NextNumber(unpack(l_Bounds_0));
        end;
        if not v98 or not v99 or not v100 or l_ChangesSegmentOffset_0 then
            v98 = Vector3.new(v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_1), (math.min(v110, v110 * l_Magnitude_1))), v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_1), (math.min(v110, v110 * l_Magnitude_1))), v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_1), (math.min(v110, v110 * l_Magnitude_1))));
            v99 = Vector3.new(v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_2), (math.min(v110, v110 * l_Magnitude_2))), v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_2), (math.min(v110, v110 * l_Magnitude_2))), v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_2), (math.min(v110, v110 * l_Magnitude_2))));
            v100 = Vector3.new(v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_3), (math.min(v110, v110 * l_Magnitude_3))), v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_3), (math.min(v110, v110 * l_Magnitude_3))), v95:NextNumber(math.max(-v110, -v110 * l_Magnitude_3), (math.min(v110, v110 * l_Magnitude_3))));
        end;
        local v113 = v104 + v98;
        local v114 = v105 + v99;
        local v115 = v106 + v100;
        return {
            {
                Distance = (v113 - v96).Magnitude, 
                Direction = CFrame.new(v96, v113)
            }, 
            {
                Distance = (v114 - v113).Magnitude, 
                Direction = CFrame.new(v113, v114)
            }, 
            {
                Distance = (v115 - v114).Magnitude, 
                Direction = CFrame.new(v114, v115)
            }, 
            {
                Distance = (v97 - v115).Magnitude, 
                Direction = CFrame.new(v115, v97)
            }
        }, {
            v98, 
            v99, 
            v100
        };
    end;
    local v117, v118 = v116(v89.Properties.Points.Start.Position, v89.Properties.Points.End.Position);
    local v119 = {};
    for v120, v121 in v117 do
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        l_Part_0.CastShadow = false;
        l_Part_0.Color = v93;
        l_Part_0.Transparency = v92;
        l_Part_0.Material = Enum.Material.Neon;
        l_Part_0.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        local l_SpecialMesh_0 = Instance.new("SpecialMesh");
        l_SpecialMesh_0.Name = "Mesh";
        l_SpecialMesh_0.MeshType = Enum.MeshType.Brick;
        l_SpecialMesh_0.Scale = Vector3.new(0.20000000298023224, 0.20000000298023224, 1, 0);
        l_SpecialMesh_0.Offset = Vector3.new(0, 0, 0, 0);
        l_SpecialMesh_0.VertexColor = Vector3.new(1, 1, 1, 0);
        l_SpecialMesh_0.Parent = l_Part_0;
        l_SpecialMesh_0.Scale = Vector3.new(v94, v94, v121.Distance / 1) * 5;
        l_Part_0.CFrame = v121.Direction * CFrame.new(0, 0, -0.5 * v121.Distance);
        l_Part_0.Parent = workspace.CurrentCamera;
        table.insert(v119, v120, {
            Instance = l_Part_0, 
            Mesh = l_SpecialMesh_0
        });
    end;
    local l_v118_0 = v118;
    return {
        Update = function(_, v126, v127, v128, v129, v130, v131) --[[ Line: 341 ]] --[[ Name: Update ]]
            -- upvalues: v116 (copy), v118 (copy), l_v118_0 (ref), v119 (copy)
            local v132, v133 = v116(v127, v128, unpack(v118));
            local v134 = false;
            for v135, v136 in v133 do
                if v118[v135] ~= v136 then
                    v134 = true;
                end;
            end;
            if v134 then
                l_v118_0 = v133;
                v132 = v116(v127, v128, unpack(l_v118_0));
            end;
            for v137, v138 in l_v118_0 do
                v118[v137] = v118[v137]:Lerp(v138, (math.min(v126 * 10, 1)));
            end;
            for v139, v140 in v132 do
                local v141 = v119[v139];
                v141.Mesh.Scale = Vector3.new(v131, v131, v140.Distance / 1) * 5;
                v141.Instance.Color = v130;
                v141.Instance.Transparency = v129;
                v141.Instance.CFrame = v140.Direction * CFrame.new(0, 0, -0.5 * v140.Distance);
            end;
        end, 
        Destroy = function(_) --[[ Line: 374 ]] --[[ Name: Destroy ]]
            -- upvalues: v119 (copy)
            for _, v144 in v119 do
                v144.Instance:Destroy();
            end;
        end
    };
end;
v4.DrawMultipleSegments = function(v145, v146, v147, v148) --[[ Line: 384 ]] --[[ Name: DrawMultipleSegments ]]
    -- upvalues: l_Draw_0 (copy)
    local l_Position_0 = v145.Properties.Points.Start.Position;
    local l_Position_1 = v145.Properties.Points.End.Position;
    local v151 = l_Draw_0.new(l_Position_0, l_Position_1, {
        color = v147, 
        thickness = v148, 
        transparency = v146, 
        seed = v145.Properties.Seed, 
        bends = v145.Properties.Bends, 
        fork_bends = v145.Properties.Fork_Bends, 
        fork_chance = v145.Properties.Fork_Chance, 
        max_depth = v145.Properties.Max_Depth
    });
    v151:Draw(workspace.CurrentCamera);
    return {
        Update = function(_, _, v154, v155, v156, v157, v158) --[[ Line: 403 ]] --[[ Name: Update ]]
            -- upvalues: v151 (copy)
            v151:Update(v154, v155, v156, v157, v158);
        end, 
        Destroy = function(_) --[[ Line: 407 ]] --[[ Name: Destroy ]]
            -- upvalues: v151 (copy)
            v151:Destroy();
        end
    };
end;
v4.UpdateSegments = function(v160, v161, v162, v163, v164) --[[ Line: 415 ]] --[[ Name: UpdateSegments ]]
    if v160.SegmentHandler then
        local l_Position_2 = v160.Properties.Points.Start.Position;
        local l_Position_3 = v160.Properties.Points.End.Position;
        v160.SegmentHandler:Update(v161, l_Position_2, l_Position_3, v162, v163, v164);
    end;
end;
v4.WipeSegments = function(v167) --[[ Line: 424 ]] --[[ Name: WipeSegments ]]
    if v167.SegmentHandler then
        v167.SegmentHandler:Destroy();
        v167.SegmentHandler = nil;
    end;
end;
v4.Thread = function(_, v169, ...) --[[ Line: 431 ]] --[[ Name: Thread ]]
    local v170 = table.pack(...);
    return coroutine.resume(coroutine.create(function() --[[ Line: 434 ]]
        -- upvalues: v169 (copy), v170 (copy)
        v169(table.unpack(v170));
    end));
end;
v4.Step = function(v171, v172) --[[ Line: 439 ]] --[[ Name: Step ]]
    for _, v174 in v171.Stack do
        v171:Thread(v174, v172);
    end;
end;
v4:Initalize();
return v4;