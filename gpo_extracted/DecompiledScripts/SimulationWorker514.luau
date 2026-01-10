local v0 = CFrame.new((Vector3.new(0, 0, 0, 0)));
local l_OceanSimulator_0 = game:GetService("ReplicatedStorage").OceanSimulator.OceanSimulator;
local v2 = require(l_OceanSimulator_0.GerstnerCalculation);
local v3 = require(l_OceanSimulator_0.WaveSettings);
return function(v4, v5, v6, v7, v8, v9, v10) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v0 (copy), v2 (copy)
    if v9 then
        v3._UpdateTree(v9);
    end;
    local v11 = {};
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    for v13 = v5, v6 do
        local v14 = v4[v13];
        if v14 then
            v11[#v11 + 1] = v14;
        end;
    end;
    local v15 = v8 or l_CurrentCamera_0.CFrame.Position;
    for _, v17 in ipairs(v11) do
        local l_WorldPosition_0 = v17.WorldPosition;
        local v19 = (v15 - l_WorldPosition_0).Magnitude or 0;
        if v19 <= 10 then
            local v20 = v3.GetWaveSettings(l_WorldPosition_0.X, l_WorldPosition_0.Z);
            local v21 = 1 - v19 / 10;
            v10[v17] = v0 + v21 * v2.GetWaveTransform(l_WorldPosition_0, v20, v7);
        end;
    end;
end;