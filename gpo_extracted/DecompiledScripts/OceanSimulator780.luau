local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.PartToSettingConverter);
local v2 = require(script.SimulationManager);
local v3 = require(script.ChunkManager);
local _ = require(script.WavePlane);
local v5 = require(script.TextureSync);
local v6 = require(script.WaveSettings);
local v7 = require(script.GerstnerCalculation);
local v8 = l_RunService_0:IsClient();
local v9 = nil;
local v10 = nil;
local v11 = nil;
v1.Setup();
local function v13(v12) --[[ Line: 27 ]] --[[ Name: EnableSimulation ]]
    -- upvalues: v8 (copy), v2 (copy)
    assert(v8, "Cannot run client-side function on the server.");
    v2.SetEnabled(v12);
end;
local function v17(v14, v15, v16) --[[ Line: 33 ]] --[[ Name: InitializeChunkManager ]]
    -- upvalues: v10 (ref), v3 (copy), v11 (ref)
    if v10 then
        v10:Destroy();
        v10 = nil;
    end;
    v10 = v3.new(v14, v15, v11 or 0, v16);
end;
local function v19(v18) --[[ Line: 41 ]] --[[ Name: EnableChunkManager ]]
    -- upvalues: v8 (copy), v10 (ref), v9 (ref), l_RunService_0 (copy)
    assert(v8, "Cannot run client-side function on the server.");
    assert(v10, "You must initialize the chunk manager before using this.");
    if v18 then
        if not v9 then
            v9 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 46 ]]
                -- upvalues: v10 (ref)
                v10:Update();
            end);
            return;
        end;
    elseif v9 then
        v9:Disconnect();
    end;
end;
local function v21(v20) --[[ Line: 57 ]] --[[ Name: EnableTextureSync ]]
    -- upvalues: v8 (copy), v5 (copy), v10 (ref)
    assert(v8, "Cannot run client-side function on the server.");
    v5.SetEnabled(v20);
    if v10 then
        v10:enableTexturePreload(v20);
    end;
end;
local function v23(v22) --[[ Line: 65 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v8 (copy), v19 (copy), v2 (copy)
    assert(v8, "Cannot run client-side function on the server.");
    v19(v22);
    assert(v8, "Cannot run client-side function on the server.");
    v2.SetEnabled(v22);
end;
local function v26(v24) --[[ Line: 71 ]] --[[ Name: GetWaveHeightAtPosition ]]
    -- upvalues: v6 (copy), v7 (copy), v11 (ref)
    local v25 = v6.GetWaveSettings(v24.X, v24.Z);
    return v7.GetWaveHeightAtPosition(v24, v25, workspace:GetServerTimeNow()) + (v11 or 0);
end;
local function v29(v27) --[[ Line: 76 ]] --[[ Name: GetWaveNormalAtPosition ]]
    -- upvalues: v6 (copy), v7 (copy)
    local v28 = v6.GetWaveSettings(v27.X, v27.Z);
    return v7.GetWaveNormalAtPosition(v27, v28, workspace:GetServerTimeNow());
end;
local function v31(v30) --[[ Line: 81 ]] --[[ Name: SetOceanHeight ]]
    -- upvalues: v11 (ref)
    v11 = v30;
end;
return table.freeze({
    EnableSimulation = v13, 
    InitializeChunkManager = v17, 
    EnableChunkManager = v19, 
    EnableTextureSync = v21, 
    SetEnabled = v23, 
    GetWaveHeightAtPosition = v26, 
    GetWaveNormalAtPosition = v29, 
    WaveSettings = v6, 
    SetOceanHeight = v31, 
    LowWaveResolution = {
        type = "WaveSimulationLowWaveResolution"
    }, 
    MediumWaveResolution = {
        type = "WaveSimulationMediumWaveResolution"
    }, 
    HighWaveResolution = {
        type = "WaveSimulationHighWaveResolution"
    }, 
    UltraHighWaveResolution = {
        type = "WaveSimulationUltraHighWaveResolution"
    }
});