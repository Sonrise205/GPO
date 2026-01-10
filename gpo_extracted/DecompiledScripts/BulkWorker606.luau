--!native
local _ = game:GetService("ReplicatedStorage").Modules;
local _ = CFrame.Angles(0, 1.5707963267948966, 0);
local l_sin_0 = math.sin;
local _ = math.sqrt;
local _ = math.abs;
local l_new_0 = Vector3.new;
local l_insert_0 = table.insert;
local l_NoWaterRegions_0 = game.ReplicatedStorage.Assets.StreamingObjects.NoWaterRegions;
local v8 = {};
local l_l_NoWaterRegions_0_Descendants_0 = l_NoWaterRegions_0:GetDescendants();
for v10 = 1, #l_l_NoWaterRegions_0_Descendants_0 do
    if l_l_NoWaterRegions_0_Descendants_0[v10]:IsA("BasePart") then
        table.insert(v8, {
            CFrame = l_l_NoWaterRegions_0_Descendants_0[v10].CFrame, 
            Size = l_l_NoWaterRegions_0_Descendants_0[v10].Size
        });
    end;
end;
l_NoWaterRegions_0.ChildAdded:Connect(function(v11) --[[ Line: 26 ]]
    -- upvalues: v8 (copy)
    table.insert(v8, {
        CFrame = v11.CFrame, 
        Size = v11.Size
    });
end);
local function v20(v12) --[[ Line: 30 ]] --[[ Name: IsWithinNoUpdateRegion ]]
    -- upvalues: v8 (copy)
    local v13 = Vector3.new(v12.X, 0, v12.Y);
    for _, v15 in ipairs(v8) do
        local l_CFrame_0 = v15.CFrame;
        local l_Size_0 = v15.Size;
        local v18 = l_CFrame_0:PointToObjectSpace(v13);
        local v19 = false;
        if math.abs(v18.X) <= l_Size_0.X / 2 then
            v19 = math.abs(v18.Z) <= l_Size_0.Z / 2;
        end;
        if v19 == true then
            return true;
        end;
    end;
    return false;
end;
return function(v21, v22, v23, v24, v25) --[[ Line: 49 ]]
    -- upvalues: v20 (copy), l_sin_0 (copy), l_new_0 (copy), l_insert_0 (copy)
    debug.profilebegin("NoMoveWorker");
    debug.profilebegin("Grab properties");
    local l_SeaLevel_0 = v24.SeaLevel;
    local l_SteepKA_0 = v24.SteepKA;
    local l_WaveAk_0 = v24.WaveAk;
    local l_WaveAXDir_0 = v24.WaveAXDir;
    local l_WaveAZDir_0 = v24.WaveAZDir;
    local l_ctA_0 = v24.ctA;
    local l_SteepKB_0 = v24.SteepKB;
    local l_WaveBk_0 = v24.WaveBk;
    local l_WaveBXDir_0 = v24.WaveBXDir;
    local l_WaveBZDir_0 = v24.WaveBZDir;
    local l_ctB_0 = v24.ctB;
    local _ = v24.WaveAc;
    local _ = v24.WaveBc;
    local l_VertexGrid_0 = v24.VertexGrid;
    local l_DefaultRegionData_0 = v24.DefaultRegionData;
    debug.profileend();
    debug.profilebegin("Calculate height");
    for _, v42 in ipairs(v22.Vertices) do
        local v43 = v42[1];
        local v44 = v42[2];
        l_VertexGrid_0:MoveNode(v42, v43, v44);
        v42[4] = v23;
        local l_l_SeaLevel_0_0 = l_SeaLevel_0;
        local v46 = v42[8];
        local v47 = not v20((Vector3.new(v43, v44)));
        if v47 then
            if v46 == nil then
                l_l_SeaLevel_0_0 = l_SeaLevel_0 + l_SteepKA_0 * l_sin_0(l_WaveAk_0 * (l_WaveAXDir_0 * v43 + l_WaveAZDir_0 * v44 - l_ctA_0)) + l_SteepKB_0 * l_sin_0(l_WaveBk_0 * (l_WaveBXDir_0 * v43 + l_WaveBZDir_0 * v44 - l_ctB_0));
            else
                for _, v49 in ipairs(v46) do
                    l_l_SeaLevel_0_0 = l_l_SeaLevel_0_0 + v49[5] * l_sin_0(v49[3] * (v49[1] * v43 + v49[2] * v44 - v49[4] * v23));
                end;
            end;
            v42[8] = v25:GetPointData(v43, v44) or l_DefaultRegionData_0;
        else
            l_l_SeaLevel_0_0 = 0;
        end;
        l_insert_0(v21, {
            v42[3], 
            l_new_0(v43, l_l_SeaLevel_0_0, v44), 
            v47
        });
    end;
    for _, v51 in ipairs(v22.EdgeVertices) do
        l_insert_0(v21, {
            v51[3], 
            l_new_0(v51[1], l_SeaLevel_0, v51[2]), 
            not v20((Vector3.new(v51[1], v51[2])))
        });
    end;
    debug.profileend();
    debug.profileend();
end;