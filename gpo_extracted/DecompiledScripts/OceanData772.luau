local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local function v2() --[[ Line: 4 ]]

end;
local v3 = {};
local function v8(v4, v5, v6) --[[ Line: 7 ]] --[[ Name: GetWaveData ]]
    -- upvalues: v2 (copy)
    local v7 = {
        Direction = v6:GetAttribute("Direction"), 
        Steepness = v6:GetAttribute("Steepness"), 
        Length = v6:GetAttribute("Length"), 
        WaveUpdated = v2
    };
    v6:GetAttributeChangedSignal("Direction"):Connect(function() --[[ Line: 15 ]]
        -- upvalues: v7 (copy), v6 (copy), v5 (copy)
        v7.Direction = v6:GetAttribute("Direction");
        v5.WaveUpdated(v7);
    end);
    v6:GetAttributeChangedSignal("Steepness"):Connect(function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v6 (copy), v5 (copy)
        v7.Steepness = v6:GetAttribute("Steepness");
        v5.WaveUpdated(v7);
    end);
    v6:GetAttributeChangedSignal("Length"):Connect(function() --[[ Line: 23 ]]
        -- upvalues: v7 (copy), v6 (copy), v5 (copy)
        v7.Length = v6:GetAttribute("Length");
        v5.WaveUpdated(v7);
    end);
    table.insert(v4, v7);
end;
local function v14(v9, v10) --[[ Line: 30 ]] --[[ Name: UnpackWavesData ]]
    -- upvalues: v8 (copy)
    local v11 = {};
    for _, v13 in next, v9:GetChildren() do
        if v13:IsA("Configuration") then
            v8(v11, v10, v13);
        end;
    end;
    return v11;
end;
local function v17(v15) --[[ Line: 40 ]] --[[ Name: GetRegionData ]]
    -- upvalues: v14 (copy)
    local v16 = {
        Name = v15.Name, 
        P0 = {
            Position = v15.P0.Position
        }, 
        P1 = {
            Position = v15.P1.Position
        }
    };
    v16.Waves = v14(v15, v16);
    return v16;
end;
if l_ReplicatedStorage_0.Assets.StreamingObjects.OceanRegions:GetAttribute("ready") == nil then
    repeat
        task.wait();
    until l_ReplicatedStorage_0.Assets.StreamingObjects.OceanRegions:GetAttribute("ready") ~= nil;
end;
for _, v19 in next, l_ReplicatedStorage_0.Assets.StreamingObjects.OceanRegions:GetChildren() do
    v3[v19.Name] = v17(v19);
end;
v3.DefaultRegionData = v17(l_ReplicatedStorage_0.Assets.StreamingObjects.DefaultOceanRegion);
return v3;