--!native
local _ = CFrame.Angles(0, 1.5707963267948966, 0);
local l_sin_0 = math.sin;
local _ = math.sqrt;
local _ = math.abs;
local _ = table.insert;
local l_new_0 = Vector3.new;
local l_NoWaterRegions_0 = game.ReplicatedStorage.Assets.StreamingObjects.NoWaterRegions;
local v7 = {};
local l_l_NoWaterRegions_0_Descendants_0 = l_NoWaterRegions_0:GetDescendants();
for v9 = 1, #l_l_NoWaterRegions_0_Descendants_0 do
    if l_l_NoWaterRegions_0_Descendants_0[v9]:IsA("BasePart") then
        table.insert(v7, {
            CFrame = l_l_NoWaterRegions_0_Descendants_0[v9].CFrame, 
            Size = l_l_NoWaterRegions_0_Descendants_0[v9].Size
        });
    end;
end;
l_NoWaterRegions_0.ChildAdded:Connect(function(v10) --[[ Line: 20 ]]
    -- upvalues: v7 (copy)
    table.insert(v7, {
        CFrame = v10.CFrame, 
        Size = v10.Size
    });
end);
local _ = function(v11) --[[ Line: 23 ]] --[[ Name: IsWithinNoUpdateRegion ]]
    -- upvalues: v7 (copy)
    local v12 = Vector3.new(v11.X, 0, v11.Y);
    for _, v14 in ipairs(v7) do
        local l_CFrame_0 = v14.CFrame;
        local l_Size_0 = v14.Size;
        local v17 = l_CFrame_0:PointToObjectSpace(v12);
        local v18 = false;
        if math.abs(v17.X) <= l_Size_0.X / 2 then
            v18 = math.abs(v17.Z) <= l_Size_0.Z / 2;
        end;
        if v18 == true then
            return true;
        end;
    end;
    return false;
end;
return function(v20, v21, v22, _, v24, v25) --[[ Line: 42 ]]
    -- upvalues: l_sin_0 (copy), l_new_0 (copy)
    debug.profilebegin("Worker");
    debug.profilebegin("Grab properties");
    local l_SeaLevel_0 = v24.SeaLevel;
    local l_SteepKA_0 = v24.SteepKA;
    local l_WaveAk_0 = v24.WaveAk;
    local l_WaveAXDir_0 = v24.WaveAXDir;
    local l_WaveAZDir_0 = v24.WaveAZDir;
    local l_SteepKB_0 = v24.SteepKB;
    local l_WaveBk_0 = v24.WaveBk;
    local l_WaveBXDir_0 = v24.WaveBXDir;
    local l_WaveBZDir_0 = v24.WaveBZDir;
    local l_ctA_0 = v24.ctA;
    local l_ctB_0 = v24.ctB;
    debug.profileend();
    debug.profilebegin("Calculate height");
    for v37, v38 in ipairs(v21) do
        local v39 = v38[1];
        local v40 = v38[2];
        v38[4] = v22;
        local l_l_SeaLevel_0_0 = l_SeaLevel_0;
        local v42 = v38[8];
        if v38[3]:GetAttribute("noRender") == nil then
            if v42 == nil then
                l_l_SeaLevel_0_0 = l_SeaLevel_0 + l_SteepKA_0 * l_sin_0(l_WaveAk_0 * (l_WaveAXDir_0 * v39 + l_WaveAZDir_0 * v40 - l_ctA_0)) + l_SteepKB_0 * l_sin_0(l_WaveBk_0 * (l_WaveBXDir_0 * v39 + l_WaveBZDir_0 * v40 - l_ctB_0));
            else
                for _, v44 in ipairs(v42) do
                    l_l_SeaLevel_0_0 = l_l_SeaLevel_0_0 + v44[5] * l_sin_0(v44[3] * (v44[1] * v39 + v44[2] * v40 - v44[4] * v22));
                end;
            end;
        else
            l_l_SeaLevel_0_0 = 0;
        end;
        v20[v37 + v25] = {
            v38[3], 
            (l_new_0(v39, l_l_SeaLevel_0_0, v40))
        };
    end;
    debug.profileend();
    debug.profileend();
end;