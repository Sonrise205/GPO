local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.OceanSimulator);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_LowWaveResolution_0 = v2.LowWaveResolution;
_G.getWavePosition = function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy)
    return v2.GetWaveHeightAtPosition(v5);
end;
_G.getWaveNormal = function(v6) --[[ Line: 13 ]]
    -- upvalues: v2 (copy)
    return v2.GetWaveHeightAtPosition(v6), v2.GetWaveNormalAtPosition(v6);
end;
v2.SetOceanHeight(workspace.Terrain:GetAttribute("SeaLevel"));
v2.InitializeChunkManager(l_LocalPlayer_0, 3, l_LowWaveResolution_0);
v2.SetEnabled(true);