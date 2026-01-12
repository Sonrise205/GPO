local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.FrustumCulling);
local v2 = require(script.Parent.SimulationManager);
local v3 = require(script.Parent.TextureSync);
local v4 = require(script.Parent.WaveSettings);
local l_WavesStorage_0 = workspace:FindFirstChild("WavesStorage");
if not l_WavesStorage_0 and l_RunService_0:IsClient() then
    l_WavesStorage_0 = Instance.new("Folder");
    l_WavesStorage_0.Name = "WavesStorage";
    l_WavesStorage_0.Parent = workspace;
end;
local v6 = script.Parent:GetAttribute("PlaneSize") or 100;
local v7 = script.Parent:GetAttribute("MaxRenderDistance") or 512;
local v8 = script.Parent:GetAttribute("ActorsAmount") or 1;
local l_Simulation_0 = script.Simulation;
local v10 = {};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 85 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v8 (copy), l_Simulation_0 (copy), v6 (copy), l_WavesStorage_0 (ref)
    local v12 = nil;
    v12 = if v11.type == "WaveSimulationUltraHighWaveResolution" then script.Wave4:Clone() else if v11.type == "WaveSimulationHighWaveResolution" then script.Wave3:Clone() else if v11.type == "WaveSimulationMediumWaveResolution" then script.Wave2:Clone() else if v11.type == "WaveSimulationNoBoneResolution" then script.NoBone:Clone() else script.Wave1:Clone();
    local v13 = {
        wavePlane = v12, 
        bonesList = {}, 
        actorsList = {}, 
        isReset = true, 
        isInFrustum = false, 
        isActive = false, 
        treeVersion = 0
    };
    local v14 = setmetatable(v13, v10);
    if v11.type ~= "WaveSimulationNoBoneResolution" then
        for _, v16 in (v12:GetChildren()) do
            if v16:IsA("Bone") then
                table.insert(v13.bonesList, v16);
            end;
        end;
        for _ = 1, v8 do
            local l_Actor_0 = Instance.new("Actor");
            l_Simulation_0:Clone().Parent = l_Actor_0;
            table.insert(v14.actorsList, l_Actor_0);
        end;
        for _, v20 in v14.actorsList do
            v20.Parent = v14.wavePlane;
            local l_v20_FirstChild_0 = v20:FindFirstChild(l_Simulation_0.Name);
            if l_v20_FirstChild_0 and l_v20_FirstChild_0:IsA("Script") then
                l_v20_FirstChild_0.Enabled = true;
            end;
        end;
    end;
    v14:UpdateMeshSize((Vector3.new(v6, 0.001, v6)));
    v12.Parent = l_WavesStorage_0;
    v12.Transparency = 0;
    return v14;
end;
v10.Destroy = function(v22) --[[ Line: 142 ]] --[[ Name: Destroy ]]
    v22:Deactivate();
    v22.wavePlane:Destroy();
    table.clear(v22.bonesList);
end;
v10.UpdateMeshSize = function(v23, v24) --[[ Line: 151 ]] --[[ Name: UpdateMeshSize ]]
    local l_Size_0 = v23.wavePlane.Size;
    v23.wavePlane.Size = v24;
    for _, v27 in ipairs(v23.bonesList) do
        local l_Position_0 = v27.Position;
        local v29 = Vector3.new((l_Position_0.X + l_Size_0.X / 2) / l_Size_0.X, (l_Position_0.Y + l_Size_0.Y / 2) / l_Size_0.Y, (l_Position_0.Z + l_Size_0.Z / 2) / l_Size_0.Z);
        v27.Position = Vector3.new(v29.X * v24.X - v24.X / 2, v29.Y * v24.Y - v24.Y / 2, v29.Z * v24.Z - v24.Z / 2);
    end;
end;
v10.PivotTo = function(v30, v31) --[[ Line: 178 ]] --[[ Name: PivotTo ]]
    v30.wavePlane:PivotTo(v31);
end;
v10.MoveTo = function(v32, v33) --[[ Line: 186 ]] --[[ Name: MoveTo ]]
    v32.wavePlane.Position = v33;
end;
v10.UpdateSimulation = function(v34, v35, v36, v37) --[[ Line: 194 ]] --[[ Name: UpdateSimulation ]]
    -- upvalues: v1 (copy), v6 (copy), v4 (copy)
    local v38 = v1.findInFrustum(v36, v34.wavePlane.Position, v6);
    v34.isInFrustum = v38;
    if v38 then
        v34.isReset = false;
        local v39 = nil;
        if v34.treeVersion ~= v4.GetVersion() then
            v34.treeVersion = v4.GetVersion();
            v39 = v4.GetSerializedTree();
        end;
        for _, v41 in v34.actorsList do
            v41:SendMessage("Simulate", v35, v37, v39);
        end;
        return;
    else
        if not v34.isReset then
            v34:Reset();
        end;
        return;
    end;
end;
v10.Activate = function(v42) --[[ Line: 215 ]] --[[ Name: Activate ]]
    -- upvalues: v2 (copy), v3 (copy), v7 (copy)
    if v42.isActive then
        return false;
    else
        v42.isActive = true;
        v2.AddWavePlane(v42);
        v3.AddWavePlane(v42);
        local v43 = #v42.actorsList;
        local v44 = #v42.bonesList;
        if v43 <= 0 or v44 <= 0 then
            return false;
        else
            task.defer(function() --[[ Line: 225 ]]
                -- upvalues: v42 (copy), v44 (copy), v43 (copy), v7 (ref)
                for v45, v46 in v42.actorsList do
                    local v47 = v44 / v43;
                    local v48 = math.floor((v45 - 1) * v47) + 1;
                    local v49 = math.floor(v47 * v45);
                    v46:SendMessage("PrepareSimulation", v42.bonesList, v48, v49, v7);
                end;
            end);
            return true;
        end;
    end;
end;
v10.Deactivate = function(v50) --[[ Line: 241 ]] --[[ Name: Deactivate ]]
    -- upvalues: v2 (copy), v3 (copy)
    if not v50.isActive then
        return false;
    else
        v50.isActive = false;
        v2.RemoveWavePlane(v50);
        v3.RemoveWavePlane(v50);
        return true;
    end;
end;
v10.Reset = function(v51) --[[ Line: 252 ]] --[[ Name: Reset ]]
    v51.isReset = true;
    for _, v53 in ipairs(v51.bonesList) do
        v53.Transform = CFrame.new();
    end;
end;
v10.LowWaveResolution = {
    type = "WaveSimulationLowWaveResolution"
};
v10.MediumWaveResolution = {
    type = "WaveSimulationMediumWaveResolution"
};
v10.HighWaveResolution = {
    type = "WaveSimulationHighWaveResolution"
};
v10.UltraHighWaveResolution = {
    type = "WaveSimulationUltraHighWaveResolution"
};
v10.NoBoneResolution = {
    type = "WaveSimulationNoBoneResolution"
};
return table.freeze(v10);