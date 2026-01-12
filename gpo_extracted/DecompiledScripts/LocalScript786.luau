local l_Modules_0 = game.ReplicatedStorage.Modules;
local v1 = require(l_Modules_0.OceanModule);
v1.NoRender = true;
v1.OceanMeshes:ClearAllChildren();
v1.OceanMeshes:Destroy();
_G.getWavePosition = function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v1.HeightLookup(v2.x, v2.z);
end;