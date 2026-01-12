local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _voxelSize = v1 or 50, 
        _voxels = {}
    }, v0));
end;
v0._debugDrawVoxel = function(v2, v3) --[[ Line: 13 ]] --[[ Name: _debugDrawVoxel ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = tostring(v3);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(1, 1, 1, 0) * v2._voxelSize;
    l_Part_0.Position = v3 * v2._voxelSize + Vector3.new(1, 1, 1, 0) * (v2._voxelSize / 2);
    l_Part_0.Parent = workspace;
    local l_SelectionBox_0 = Instance.new("SelectionBox");
    l_SelectionBox_0.Color3 = Color3.new(0, 0, 1);
    l_SelectionBox_0.Adornee = l_Part_0;
    l_SelectionBox_0.Parent = l_Part_0;
    task.delay(0.03333333333333333, l_Part_0.Destroy, l_Part_0);
end;
v0.AddObject = function(v6, v7, v8) --[[ Line: 31 ]] --[[ Name: AddObject ]]
    local l_ClassName_0 = v8.ClassName;
    local l__voxelSize_0 = v6._voxelSize;
    local v11 = Vector3.new(math.floor(v7.X / l__voxelSize_0), math.floor(v7.Y / l__voxelSize_0), (math.floor(v7.Z / l__voxelSize_0)));
    local v12 = v6._voxels[v11];
    if v12 == nil then
        v6._voxels[v11] = {
            [l_ClassName_0] = {
                v8
            }
        };
        return v11;
    elseif v12[l_ClassName_0] == nil then
        v12[l_ClassName_0] = {
            v8
        };
        return v11;
    else
        table.insert(v12[l_ClassName_0], v8);
        return v11;
    end;
end;
v0.RemoveObject = function(v13, v14, v15) --[[ Line: 56 ]] --[[ Name: RemoveObject ]]
    local v16 = v13._voxels[v14];
    if v16 == nil then
        return;
    else
        local l_ClassName_1 = v15.ClassName;
        if v16[l_ClassName_1] == nil then
            return;
        else
            local v18 = v16[l_ClassName_1];
            for v19, v20 in v18 do
                if v20 == v15 then
                    local v21 = #v18;
                    v18[v19] = v18[v21];
                    v18[v21] = nil;
                    break;
                end;
            end;
            if #v18 == 0 then
                v16[l_ClassName_1] = nil;
                if next(v16) == nil then
                    v13._voxels[v14] = nil;
                end;
            end;
            return;
        end;
    end;
end;
v0.GetVoxel = function(v22, v23) --[[ Line: 90 ]] --[[ Name: GetVoxel ]]
    return v22._voxels[v23];
end;
v0.ForEachObjectInRegion = function(v24, v25, v26, v27) --[[ Line: 94 ]] --[[ Name: ForEachObjectInRegion ]]
    local l__voxelSize_1 = v24._voxelSize;
    local v29 = math.min(v26.X, v25.X);
    local v30 = math.min(v26.Y, v25.Y);
    local v31 = math.min(v26.Z, v25.Z);
    local v32 = math.max(v26.X, v25.X);
    local v33 = math.max(v26.Y, v25.Y);
    local v34 = math.max(v26.Z, v25.Z);
    for v35 = math.floor(v29 / l__voxelSize_1), math.floor(v32 / l__voxelSize_1) do
        for v36 = math.floor(v31 / l__voxelSize_1), math.floor(v34 / l__voxelSize_1) do
            for v37 = math.floor(v30 / l__voxelSize_1), math.floor(v33 / l__voxelSize_1) do
                local v38 = v24._voxels[Vector3.new(v35, v37, v36)];
                if v38 then
                    for v39, v40 in v38 do
                        for _, v42 in v40 do
                            v27(v39, v42);
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v0.ForEachObjectInView = function(v43, v44, v45, v46) --[[ Line: 117 ]] --[[ Name: ForEachObjectInView ]]
    local l__voxelSize_2 = v43._voxelSize;
    local l_CFrame_0 = v44.CFrame;
    local l_Position_0 = l_CFrame_0.Position;
    local l_RightVector_0 = l_CFrame_0.RightVector;
    local l_UpVector_0 = l_CFrame_0.UpVector;
    local v52 = v45 / 2;
    local v53 = math.tan((math.rad((v44.FieldOfView + 5) / 2))) * v45;
    local v54 = v53 * (v44.ViewportSize.X / v44.ViewportSize.Y);
    local v55 = l_CFrame_0 * CFrame.new(0, 0, -v45);
    local v56 = v55 * Vector3.new(-v54, v53, 0);
    local v57 = v55 * Vector3.new(v54, v53, 0);
    local v58 = v55 * Vector3.new(-v54, -v53, 0);
    local v59 = v55 * Vector3.new(v54, -v53, 0);
    local v60 = (l_CFrame_0 * CFrame.new(0, 0, -v52)):Inverse();
    local l_Unit_0 = l_UpVector_0:Cross(v59 - l_Position_0).Unit;
    local l_Unit_1 = l_UpVector_0:Cross(v58 - l_Position_0).Unit;
    local l_Unit_2 = l_RightVector_0:Cross(l_Position_0 - v57).Unit;
    local l_Unit_3 = l_RightVector_0:Cross(l_Position_0 - v59).Unit;
    local v65 = l_Position_0:Min(v56):Min(v57):Min(v58):Min(v59);
    local v66 = l_Position_0:Max(v56):Max(v57):Max(v58):Max(v59);
    v65 = Vector3.new(math.floor(v65.X / l__voxelSize_2), math.floor(v65.Y / l__voxelSize_2), (math.floor(v65.Z / l__voxelSize_2)));
    v66 = Vector3.new(math.floor(v66.X / l__voxelSize_2), math.floor(v66.Y / l__voxelSize_2), (math.floor(v66.Z / l__voxelSize_2)));
    local function v70(v67) --[[ Line: 155 ]] --[[ Name: isPointInView ]]
        -- upvalues: v60 (copy), v54 (copy), v53 (copy), v52 (copy), l_Position_0 (copy), l_Unit_0 (copy), l_Unit_1 (copy), l_Unit_2 (copy), l_Unit_3 (copy)
        local v68 = v60 * v67;
        if v68.X > v54 or v68.X < -v54 or v68.Y > v53 or v68.Y < -v53 or v68.Z > v52 or v68.Z < -v52 then
            return false;
        else
            local v69 = v67 - l_Position_0;
            if l_Unit_0:Dot(v69) < 0 or l_Unit_1:Dot(v69) > 0 or l_Unit_2:Dot(v69) < 0 or l_Unit_3:Dot(v69) > 0 then
                return false;
            else
                return true;
            end;
        end;
    end;
    for v71 = v65.X, v66.X do
        local v72 = v71 * l__voxelSize_2;
        local v73 = v72 + l__voxelSize_2;
        local v74 = math.clamp(v55.X, v72, v73);
        for v75 = v65.Y, v66.Y do
            local v76 = v75 * l__voxelSize_2;
            local v77 = v76 + l__voxelSize_2;
            local v78 = math.clamp(v55.Y, v76, v77);
            for v79 = v65.Z, v66.Z do
                local v80 = v79 * l__voxelSize_2;
                local v81 = v80 + l__voxelSize_2;
                if v70((Vector3.new(v74, v78, (math.clamp(v55.Z, v80, v81))))) then
                    local l_v79_0 = v79;
                    local v83 = v65.Z - 1;
                    local l_v79_1 = v79;
                    local l_Z_0 = v66.Z;
                    while l_v79_1 <= l_Z_0 do
                        local v86 = math.floor((l_v79_1 + l_Z_0) / 2);
                        if v70((Vector3.new(v74, v78, (math.clamp(v55.Z, v86 * l__voxelSize_2, v86 * l__voxelSize_2 + l__voxelSize_2))))) then
                            v83 = v86;
                            l_v79_1 = v86 + 1;
                        else
                            l_Z_0 = v86 - 1;
                        end;
                    end;
                    for v87 = l_v79_0, v83 do
                        local v88 = v43._voxels[Vector3.new(v71, v75, v87)];
                        if v88 then
                            for v89, v90 in v88 do
                                for _, v92 in v90 do
                                    v46(v89, v92);
                                end;
                            end;
                        end;
                    end;
                    break;
                end;
            end;
        end;
    end;
end;
v0.ClearAll = function(v93) --[[ Line: 238 ]] --[[ Name: ClearAll ]]
    v93._voxels = {};
end;
return v0;