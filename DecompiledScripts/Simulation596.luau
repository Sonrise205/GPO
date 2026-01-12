local l_OceanSimulator_0 = game:GetService("ReplicatedStorage").OceanSimulator;
local v1 = require(l_OceanSimulator_0.GerstnerCalculation);
local v2 = require(l_OceanSimulator_0.WaveSettings);
local l_script_Actor_0 = script:GetActor();
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v5 = {};
local v6 = 10;
local v7 = CFrame.new((Vector3.new(0, 0, 0, 0)));
l_script_Actor_0:BindToMessage("PrepareSimulation", function(v8, v9, v10, v11) --[[ Line: 14 ]]
    -- upvalues: v6 (ref), v5 (copy)
    v6 = v11 or v6;
    for v12 = v9, v10 do
        local v13 = v8[v12];
        if v13 then
            v5[#v5 + 1] = v13;
        end;
    end;
end);
l_script_Actor_0:BindToMessageParallel("Simulate", function(v14, v15, v16) --[[ Line: 24 ]]
    -- upvalues: v2 (copy), l_CurrentCamera_0 (copy), v5 (copy), v6 (ref), v7 (copy), v1 (copy)
    if v16 then
        v2._UpdateTree(v16);
    end;
    local v17 = {};
    local v18 = v15 or l_CurrentCamera_0.CFrame.Position;
    for _, v20 in ipairs(v5) do
        local l_WorldPosition_0 = v20.WorldPosition;
        local v22 = (v18 - l_WorldPosition_0).Magnitude or 0;
        if v22 <= v6 then
            local v23 = v2.GetWaveSettings(l_WorldPosition_0.X, l_WorldPosition_0.Z);
            local v24 = 1 - v22 / v6;
            v17[v20] = v7 + v24 * v1.GetWaveTransform(l_WorldPosition_0, v23, v14);
        end;
    end;
    task.synchronize();
    for v25, v26 in v17 do
        v25.Transform = v26;
    end;
end);