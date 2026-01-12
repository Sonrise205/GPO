local v0 = {};
local function v1(v2, v3) --[[ Line: 3 ]] --[[ Name: Resize ]]
    -- upvalues: v1 (copy)
    for _, v5 in next, v2:GetChildren() do
        if v5:IsA("BasePart") then
            local l_CFrame_0 = v5.CFrame;
            local _, _, _, v10, v11, v12, v13, v14, v15, v16, v17, v18 = l_CFrame_0:components();
            v5.Size = v5.Size * v3;
            v5.CFrame = CFrame.new(l_CFrame_0.p * v3) * CFrame.new(0, 0, 0, v10, v11, v12, v13, v14, v15, v16, v17, v18);
            v1(v5, v3);
        elseif v5.className == "SpecialMesh" and v5.MeshType == Enum.MeshType.FileMesh then
            v5.Scale = v5.Scale * v3;
        elseif v5:IsA("Model") then
            v1(v5, v3);
        end;
    end;
end;
local v19 = require(script.MainModule);
scaleRecursive = function(v20, v21, v22) --[[ Line: 21 ]] --[[ Name: scaleRecursive ]]
    if v21:isA("Bone") then
        local l_CFrame_1 = v21.Parent.CFrame;
        local v24 = v20.CFrame:Inverse() * l_CFrame_1;
        v24 = v24 - v24.Position;
        local v25 = v24 * v21.Position * v22;
        v21.Position = v24:inverse() * v25;
    end;
    local l_v21_Children_0 = v21:GetChildren();
    for v27 = 1, #l_v21_Children_0 do
        local v28 = l_v21_Children_0[v27];
        scaleRecursive(v20, v28, v22);
    end;
end;
scaleRecursive2 = function(v29, v30, v31) --[[ Line: 38 ]] --[[ Name: scaleRecursive2 ]]
    if v30:isA("Weld") then
        local l_CFrame_2 = v30.Parent.CFrame;
        local v33 = v29.CFrame:Inverse() * l_CFrame_2;
        v33 = v33 - v33.C0;
        local v34 = v33 * v30.C0 * v31;
        v30.C0 = v33:inverse() * v34;
    end;
    local l_v30_Children_0 = v30:GetChildren();
    for v36 = 1, #l_v30_Children_0 do
        local v37 = l_v30_Children_0[v36];
        scaleRecursive(v29, v37, v31);
    end;
end;
local function _(v38) --[[ Line: 54 ]] --[[ Name: calculateTransformationMatrix ]]
    return v38.X, 0, 0, 0, v38.Y, 0, 0, 0, v38.Z;
end;
local function v88(v40, v41, v42) --[[ Line: 58 ]] --[[ Name: stretchModel ]]
    -- upvalues: v19 (copy)
    local l_v41_0 = v41;
    local l_X_0 = l_v41_0.X;
    local v45 = 0;
    local v46 = 0;
    local v47 = 0;
    local l_Y_0 = l_v41_0.Y;
    local v49 = 0;
    local v50 = 0;
    local v51 = 0;
    local l_Z_0 = l_v41_0.Z;
    l_v41_0 = {};
    local v53 = {};
    local v54 = {};
    local l_v40_Descendants_0 = v40:GetDescendants();
    table.insert(l_v40_Descendants_0, v40);
    if v40.PrimaryPart ~= nil then
        l_v41_0[v40.PrimaryPart] = v40;
    end;
    if v40:GetAttribute("bypassScale") then
        v41 = Vector3.new(1, 1, 1, 0);
    end;
    for _, v57 in ipairs(l_v40_Descendants_0) do
        if v57:IsA("Model") and v57.PrimaryPart ~= nil then
            l_v41_0[v57.PrimaryPart] = v57;
        end;
    end;
    for _, v59 in ipairs(l_v40_Descendants_0) do
        if v59:IsA("JointInstance") then
            v53[v59.Part1] = {
                Part0 = v59.Part0, 
                ClassName = v59.ClassName
            };
            v59:Destroy();
        end;
    end;
    for _, v61 in ipairs(l_v40_Descendants_0) do
        if v61:IsA("BasePart") or v61:IsA("MeshPart") then
            local l_l_X_0_0 = l_X_0;
            local l_v45_0 = v45;
            local l_v46_0 = v46;
            local l_v47_0 = v47;
            local l_l_Y_0_0 = l_Y_0;
            local l_v49_0 = v49;
            local l_v50_0 = v50;
            local l_v51_0 = v51;
            local l_l_Z_0_0 = l_Z_0;
            if v61:GetAttribute("bypassScale") then
                local l_X_1 = Vector3.new(1, 1, 1, 0).X;
                local v72 = 0;
                local v73 = 0;
                local v74 = 0;
                local l_Y_1 = Vector3.new(1, 1, 1, 0).Y;
                local v76 = 0;
                local v77 = 0;
                local v78 = 0;
                local l_Z_1 = Vector3.new(1, 1, 1, 0).Z;
                l_l_X_0_0 = l_X_1;
                l_v45_0 = v72;
                l_v46_0 = v73;
                l_v47_0 = v74;
                l_l_Y_0_0 = l_Y_1;
                l_v49_0 = v76;
                l_v50_0 = v77;
                l_v51_0 = v78;
                l_l_Z_0_0 = l_Z_1;
            end;
            local v80 = v19.GlobalOrthogonalTransform(l_l_X_0_0, l_v45_0, l_v46_0, l_v47_0, l_l_Y_0_0, l_v49_0, l_v50_0, l_v51_0, l_l_Z_0_0, v61, v42 or v61.Position, true);
            if l_v41_0[v61] then
                l_v41_0[v61].PrimaryPart = v80;
            end;
            v54[v61] = v80;
            v80.Anchored = false;
            v61:Destroy();
        end;
    end;
    for v81, v82 in pairs(v53) do
        local l_Part0_0 = v82.Part0;
        local l_ClassName_0 = v82.ClassName;
        local v85 = v54[l_Part0_0];
        local v86 = v54[v81];
        local v87 = Instance.new(l_ClassName_0);
        v87.Part0 = v85;
        v87.Part1 = v86;
        if l_ClassName_0 ~= "WeldConstraint" then
            v87.C0 = v87.Part0.CFrame:Inverse() * v87.Part1.CFrame;
        end;
        v87.Parent = v85;
    end;
    table.clear(l_v41_0);
    table.clear(v53);
    table.clear(v54);
    table.clear(l_v40_Descendants_0);
end;
v0.ScaleModel = function(_, v90, v91, v92) --[[ Line: 124 ]] --[[ Name: ScaleModel ]]
    -- upvalues: v88 (copy)
    local v93 = nil;
    local v94 = nil;
    if v90.PrimaryPart == nil then
        local l_v90_ModelCFrame_0 = v90:GetModelCFrame();
        v93 = l_v90_ModelCFrame_0;
        v94 = script.Part:Clone();
        v94.CFrame = l_v90_ModelCFrame_0;
        v90.PrimaryPart = v94;
    else
        v93 = v90.PrimaryPart.CFrame;
    end;
    v90:SetPrimaryPartCFrame(CFrame.new(-1, 0, -1));
    if v92 == true then
        scaleRecursive(v90.PrimaryPart, v90, v91);
    end;
    v88(v90, v91, (Vector3.new(1, 0, 0, 0)));
    if v94 then
        v94:Destroy();
    end;
    v90.WorldPivot = v90:GetModelCFrame();
    v90:PivotTo(v93);
end;
v0.ScaleToCharacter = function(_, v97, v98) --[[ Line: 152 ]] --[[ Name: ScaleToCharacter ]]
    -- upvalues: v0 (copy)
    v0:ScaleModel(v98, (Vector3.new(v97.Humanoid.BodyWidthScale.Value, v97.Humanoid.BodyHeightScale.Value, v97.Humanoid.BodyDepthScale.Value)));
end;
v0.ScaleSize = function(_, v100, v101, v102, v103) --[[ Line: 156 ]] --[[ Name: ScaleSize ]]
    -- upvalues: v0 (copy)
    local v104 = v100:Clone();
    v104.Name = v100.Name;
    if v102 == nil and v101.Humanoid:IsA("Humanoid") then
        v102 = Vector3.new(v101.Humanoid.BodyWidthScale.Value, v101.Humanoid.BodyHeightScale.Value, v101.Humanoid.BodyDepthScale.Value);
    elseif v101.Humanoid:IsA("Humanoid") == false and v102 == nil then
        v102 = Vector3.new(1, 1, 1, 0);
    end;
    local v105 = {};
    for _, v107 in (v104:GetChildren()) do
        if v101:FindFirstChild(v107.Name) and v107:IsA("Model") then
            local l_Middle_0 = v107:FindFirstChild("Middle");
            if l_Middle_0 == nil then
                l_Middle_0 = v107.PrimaryPart;
            end;
            local l_v107_Children_0 = v107:GetChildren();
            for v110 = 1, #l_v107_Children_0 do
                if l_v107_Children_0[v110]:IsA("BasePart") and l_v107_Children_0[v110]:FindFirstChildWhichIsA("Motor6D") == nil and l_v107_Children_0[v110]:GetAttribute("bypassScale") and not l_Middle_0:GetAttribute("bypassScale") then
                    local v111 = l_Middle_0.CFrame:ToObjectSpace(l_v107_Children_0[v110].CFrame);
                    v105[l_v107_Children_0[v110]:GetAttribute("UniqueID") or v107.Name .. "_" .. v110] = v111;
                end;
            end;
        end;
    end;
    v0:ScaleModel(v104, v102);
    for _, v113 in (v104:GetChildren()) do
        if v101:FindFirstChild(v113.Name) then
            if v113:IsA("Model") then
                local l_Middle_1 = v113:FindFirstChild("Middle");
                if l_Middle_1 == nil then
                    l_Middle_1 = v113.PrimaryPart;
                end;
                local l_v113_Children_0 = v113:GetChildren();
                for v116 = 1, #l_v113_Children_0 do
                    if l_v113_Children_0[v116]:IsA("BasePart") and l_v113_Children_0[v116]:FindFirstChildWhichIsA("Motor6D") == nil then
                        local v117 = l_v113_Children_0[v116]:GetAttribute("UniqueID") or v113.Name .. "_" .. v116;
                        if v105[v117] then
                            local v118 = v105[v117];
                            local l_Position_0 = v118.Position;
                            local v120 = CFrame.new(l_Position_0) * (v118 - v118.Position);
                            l_v113_Children_0[v116].CFrame = l_Middle_1.CFrame * v120;
                        end;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Part0 = l_Middle_1;
                        l_Weld_0.Part1 = l_v113_Children_0[v116];
                        local l_v102_0 = v102;
                        if l_v113_Children_0[v116]:GetAttribute("bypassScale") then
                            l_v102_0 = Vector3.new(1, 1, 1, 0);
                        end;
                        local v123 = CFrame.new(l_Middle_1.Position);
                        local v124 = l_Middle_1.CFrame:inverse() * v123;
                        local v125 = l_v113_Children_0[v116].CFrame:inverse() * v123;
                        l_Weld_0.C0 = v124;
                        l_Weld_0.C1 = v125;
                        l_Weld_0.Name = l_v113_Children_0[v116].Name .. "Weld";
                        l_Weld_0.Parent = l_Middle_1;
                        scaleRecursive(l_v113_Children_0[v116], l_v113_Children_0[v116], l_v102_0);
                    end;
                    if v103 == nil then
                        local l_Weld_1 = Instance.new("Weld");
                        l_Weld_1.Part0 = v101:FindFirstChild(v113.Name);
                        l_Weld_1.Part1 = l_Middle_1;
                        l_Weld_1.C0 = CFrame.new(0, 0, 0);
                        l_Weld_1.Name = l_Weld_1.Part1.Name .. " Weld";
                        l_Weld_1.Parent = l_Weld_1.Part1;
                        l_Middle_1.Transparency = 1;
                    end;
                end;
            end;
        elseif v113:IsA("BasePart") then
            local l_v113_Attribute_0 = v113:GetAttribute("OrgBodyPartName");
            if l_v113_Attribute_0 then
                local l_Weld_2 = Instance.new("Weld");
                l_Weld_2.Part0 = v101:FindFirstChild(l_v113_Attribute_0);
                l_Weld_2.Part1 = v113;
                l_Weld_2.Name = l_v113_Attribute_0 .. " Weld";
                l_Weld_2.Parent = v113;
            end;
        end;
    end;
    table.clear(v105);
    local l_v104_Descendants_0 = v104:GetDescendants();
    for v130 = 1, #l_v104_Descendants_0 do
        if l_v104_Descendants_0[v130]:IsA("BasePart") then
            l_v104_Descendants_0[v130].Anchored = false;
            l_v104_Descendants_0[v130].Massless = true;
            l_v104_Descendants_0[v130].CanCollide = false;
            l_v104_Descendants_0[v130].CanQuery = false;
        end;
    end;
    pcall(function() --[[ Line: 270 ]]
        -- upvalues: v100 (copy)
        _G.destroy(v100, 3);
    end);
    v104.Parent = v101;
    return v104;
end;
v0.ScaleSize2 = function(_, v132, v133, v134, v135) --[[ Line: 278 ]] --[[ Name: ScaleSize2 ]]
    -- upvalues: v88 (copy)
    v132.Name = v132.Name;
    v132.Parent = v133;
    pcall(function() --[[ Line: 282 ]]
        -- upvalues: v135 (copy), v132 (copy)
        if v135 == nil then
            _G.destroy(v132, 3);
        end;
    end);
    v88(v132, v134, v132:GetModelCFrame().Position);
    for _, v137 in (v132:GetChildren()) do
        local l_v137_0 = v137;
        local l_l_v137_0_Children_0 = l_v137_0:GetChildren();
        for v140 = 1, #l_l_v137_0_Children_0 do
            if l_l_v137_0_Children_0[v140]:IsA("BasePart") then
                local l_Weld_3 = Instance.new("Weld");
                l_Weld_3.Part0 = l_v137_0.Middle;
                l_Weld_3.Part1 = l_l_v137_0_Children_0[v140];
                local v142 = CFrame.new(l_v137_0.Middle.Position);
                local v143 = l_v137_0.Middle.CFrame:inverse() * v142;
                local v144 = l_l_v137_0_Children_0[v140].CFrame:inverse() * v142;
                l_Weld_3.C0 = v143;
                l_Weld_3.C1 = v144;
                l_Weld_3.Parent = l_v137_0.Middle;
            elseif l_l_v137_0_Children_0[v140]:IsA("Bone") then
                l_l_v137_0_Children_0[v140].Position = l_l_v137_0_Children_0[v140].Position * v134;
            end;
            if v135 == nil then
                local l_Weld_4 = Instance.new("Weld");
                l_Weld_4.Part0 = v133:FindFirstChild(v137.Name);
                if l_v137_0:FindFirstChild("Middle") then
                    l_Weld_4.Part1 = l_v137_0.Middle;
                elseif l_v137_0:IsA("Model") and l_v137_0.PrimaryPart ~= nil then
                    l_Weld_4.Part1 = l_v137_0.PrimaryPart;
                end;
                l_Weld_4.C0 = CFrame.new(0, 0, 0);
                l_Weld_4.Parent = l_Weld_4.Part1;
                if l_v137_0:FindFirstChild("Middle") then
                    l_v137_0.Middle.Transparency = 1;
                end;
            end;
        end;
        l_v137_0 = nil;
    end;
    local l_v132_Descendants_0 = v132:GetDescendants();
    for v147 = 1, #l_v132_Descendants_0 do
        if l_v132_Descendants_0[v147]:IsA("BasePart") then
            l_v132_Descendants_0[v147].Anchored = false;
        end;
    end;
    return v132;
end;
return v0;