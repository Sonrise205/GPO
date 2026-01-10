local _ = {
    InitialDistance = 25, 
    MinDistance = 10, 
    MaxDistance = 100, 
    InitialElevation = 35, 
    MinElevation = 35, 
    MaxElevation = 35, 
    ReferenceAzimuth = -45, 
    CWAzimuthTravel = 90, 
    CCWAzimuthTravel = 90, 
    UseAzimuthLimits = false
};
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_Players_0 = game:GetService("Players");
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v5 = setmetatable({}, l_BaseCamera_0);
v5.__index = v5;
v5.new = function() --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v5 (copy)
    local v6 = setmetatable(l_BaseCamera_0.new(), v5);
    v6.lastUpdate = tick();
    v6.changedSignalConnections = {};
    v6.refAzimuthRad = nil;
    v6.curAzimuthRad = nil;
    v6.minAzimuthAbsoluteRad = nil;
    v6.maxAzimuthAbsoluteRad = nil;
    v6.useAzimuthLimits = nil;
    v6.curElevationRad = nil;
    v6.minElevationRad = nil;
    v6.maxElevationRad = nil;
    v6.curDistance = nil;
    v6.minDistance = nil;
    v6.maxDistance = nil;
    v6.gamepadDollySpeedMultiplier = 1;
    v6.lastUserPanCamera = tick();
    v6.externalProperties = {};
    v6.externalProperties.InitialDistance = 25;
    v6.externalProperties.MinDistance = 10;
    v6.externalProperties.MaxDistance = 100;
    v6.externalProperties.InitialElevation = 35;
    v6.externalProperties.MinElevation = 35;
    v6.externalProperties.MaxElevation = 35;
    v6.externalProperties.ReferenceAzimuth = -45;
    v6.externalProperties.CWAzimuthTravel = 90;
    v6.externalProperties.CCWAzimuthTravel = 90;
    v6.externalProperties.UseAzimuthLimits = false;
    v6:LoadNumberValueParameters();
    return v6;
end;
v5.LoadOrCreateNumberValueParameter = function(v7, v8, v9, v10) --[[ Line: 81 ]] --[[ Name: LoadOrCreateNumberValueParameter ]]
    local l_script_FirstChild_0 = script:FindFirstChild(v8);
    if l_script_FirstChild_0 and l_script_FirstChild_0:IsA(v9) then
        v7.externalProperties[v8] = l_script_FirstChild_0.Value;
    elseif v7.externalProperties[v8] ~= nil then
        l_script_FirstChild_0 = Instance.new(v9);
        l_script_FirstChild_0.Name = v8;
        l_script_FirstChild_0.Parent = script;
        l_script_FirstChild_0.Value = v7.externalProperties[v8];
    else
        return;
    end;
    if v10 then
        if v7.changedSignalConnections[v8] then
            v7.changedSignalConnections[v8]:Disconnect();
        end;
        v7.changedSignalConnections[v8] = l_script_FirstChild_0.Changed:Connect(function(v12) --[[ Line: 101 ]]
            -- upvalues: v7 (copy), v8 (copy), v10 (copy)
            v7.externalProperties[v8] = v12;
            v10(v7);
        end);
    end;
end;
v5.SetAndBoundsCheckAzimuthValues = function(v13) --[[ Line: 108 ]] --[[ Name: SetAndBoundsCheckAzimuthValues ]]
    v13.minAzimuthAbsoluteRad = math.rad(v13.externalProperties.ReferenceAzimuth) - math.abs((math.rad(v13.externalProperties.CWAzimuthTravel)));
    v13.maxAzimuthAbsoluteRad = math.rad(v13.externalProperties.ReferenceAzimuth) + math.abs((math.rad(v13.externalProperties.CCWAzimuthTravel)));
    v13.useAzimuthLimits = v13.externalProperties.UseAzimuthLimits;
    if v13.useAzimuthLimits then
        v13.curAzimuthRad = math.max(v13.curAzimuthRad, v13.minAzimuthAbsoluteRad);
        v13.curAzimuthRad = math.min(v13.curAzimuthRad, v13.maxAzimuthAbsoluteRad);
    end;
end;
v5.SetAndBoundsCheckElevationValues = function(v14) --[[ Line: 118 ]] --[[ Name: SetAndBoundsCheckElevationValues ]]
    local v15 = math.max(v14.externalProperties.MinElevation, -80);
    local v16 = math.min(v14.externalProperties.MaxElevation, 80);
    v14.minElevationRad = math.rad((math.min(v15, v16)));
    v14.maxElevationRad = math.rad((math.max(v15, v16)));
    v14.curElevationRad = math.max(v14.curElevationRad, v14.minElevationRad);
    v14.curElevationRad = math.min(v14.curElevationRad, v14.maxElevationRad);
end;
v5.SetAndBoundsCheckDistanceValues = function(v17) --[[ Line: 134 ]] --[[ Name: SetAndBoundsCheckDistanceValues ]]
    v17.minDistance = v17.externalProperties.MinDistance;
    v17.maxDistance = v17.externalProperties.MaxDistance;
    v17.curDistance = math.max(v17.curDistance, v17.minDistance);
    v17.curDistance = math.min(v17.curDistance, v17.maxDistance);
end;
v5.LoadNumberValueParameters = function(v18) --[[ Line: 142 ]] --[[ Name: LoadNumberValueParameters ]]
    v18:LoadOrCreateNumberValueParameter("InitialElevation", "NumberValue", nil);
    v18:LoadOrCreateNumberValueParameter("InitialDistance", "NumberValue", nil);
    v18:LoadOrCreateNumberValueParameter("ReferenceAzimuth", "NumberValue", v18.SetAndBoundsCheckAzimuthValue);
    v18:LoadOrCreateNumberValueParameter("CWAzimuthTravel", "NumberValue", v18.SetAndBoundsCheckAzimuthValues);
    v18:LoadOrCreateNumberValueParameter("CCWAzimuthTravel", "NumberValue", v18.SetAndBoundsCheckAzimuthValues);
    v18:LoadOrCreateNumberValueParameter("MinElevation", "NumberValue", v18.SetAndBoundsCheckElevationValues);
    v18:LoadOrCreateNumberValueParameter("MaxElevation", "NumberValue", v18.SetAndBoundsCheckElevationValues);
    v18:LoadOrCreateNumberValueParameter("MinDistance", "NumberValue", v18.SetAndBoundsCheckDistanceValues);
    v18:LoadOrCreateNumberValueParameter("MaxDistance", "NumberValue", v18.SetAndBoundsCheckDistanceValues);
    v18:LoadOrCreateNumberValueParameter("UseAzimuthLimits", "BoolValue", v18.SetAndBoundsCheckAzimuthValues);
    v18.curAzimuthRad = math.rad(v18.externalProperties.ReferenceAzimuth);
    v18.curElevationRad = math.rad(v18.externalProperties.InitialElevation);
    v18.curDistance = v18.externalProperties.InitialDistance;
    v18:SetAndBoundsCheckAzimuthValues();
    v18:SetAndBoundsCheckElevationValues();
    v18:SetAndBoundsCheckDistanceValues();
end;
v5.GetModuleName = function(_) --[[ Line: 167 ]] --[[ Name: GetModuleName ]]
    return "OrbitalCamera";
end;
v5.SetInitialOrientation = function(v20, v21) --[[ Line: 171 ]] --[[ Name: SetInitialOrientation ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if not v21 or not v21.RootPart then
        warn("OrbitalCamera could not set initial orientation due to missing humanoid");
        return;
    else
        assert(v21.RootPart, "");
        local l_Unit_0 = (v21.RootPart.CFrame.LookVector - Vector3.new(0, 0.23000000417232513, 0, 0)).Unit;
        local v23 = l_CameraUtils_0.GetAngleBetweenXZVectors(l_Unit_0, v20:GetCameraLookVector());
        local v24 = math.asin(v20:GetCameraLookVector().Y) - math.asin(l_Unit_0.Y);
        if not l_CameraUtils_0.IsFinite(v23) then
            v23 = 0;
        end;
        if not l_CameraUtils_0.IsFinite(v24) then
            v24 = 0;
        end;
        return;
    end;
end;
v5.GetCameraToSubjectDistance = function(v25) --[[ Line: 189 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v25.curDistance;
end;
v5.SetCameraToSubjectDistance = function(v26, v27) --[[ Line: 193 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.LocalPlayer then
        v26.currentSubjectDistance = math.clamp(v27, v26.minDistance, v26.maxDistance);
        v26.currentSubjectDistance = math.max(v26.currentSubjectDistance, v26.FIRST_PERSON_DISTANCE_THRESHOLD);
    end;
    v26.inFirstPerson = false;
    v26:UpdateMouseBehavior();
    return v26.currentSubjectDistance;
end;
v5.CalculateNewLookVector = function(v28, v29, v30) --[[ Line: 206 ]] --[[ Name: CalculateNewLookVector ]]
    local v31 = v29 or v28:GetCameraLookVector();
    local v32 = math.asin(v31.Y);
    local v33 = math.clamp(v30.Y, v32 - 1.3962634015954636, v32 - -1.3962634015954636);
    local v34 = Vector2.new(v30.X, v33);
    local v35 = CFrame.new(Vector3.new(0, 0, 0, 0), v31);
    return (CFrame.Angles(0, -v34.X, 0) * v35 * CFrame.Angles(-v34.Y, 0, 0)).LookVector;
end;
v5.Update = function(v36, v37) --[[ Line: 217 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraInput_0 (copy), l_Players_0 (copy)
    local v38 = tick();
    local v39 = v38 - v36.lastUpdate;
    local v40 = l_CameraInput_0.getRotation(v37) ~= Vector2.new();
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v45 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    local v46 = v45 and v45:IsA("VehicleSeat");
    local v47 = v45 and v45:IsA("SkateboardPlatform");
    if v36.lastUpdate == nil or v39 > 1 then
        v36.lastCameraTransform = nil;
    end;
    if v40 then
        v36.lastUserPanCamera = tick();
    end;
    local l_v36_SubjectPosition_0 = v36:GetSubjectPosition();
    if l_v36_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        if v36.gamepadDollySpeedMultiplier ~= 1 then
            v36:SetCameraToSubjectDistance(v36.currentSubjectDistance * v36.gamepadDollySpeedMultiplier);
        end;
        l_Focus_0 = CFrame.new(l_v36_SubjectPosition_0);
        local v49 = l_CameraInput_0.getRotation(v37);
        v36.curAzimuthRad = v36.curAzimuthRad - v49.X;
        if v36.useAzimuthLimits then
            v36.curAzimuthRad = math.clamp(v36.curAzimuthRad, v36.minAzimuthAbsoluteRad, v36.maxAzimuthAbsoluteRad);
        else
            v36.curAzimuthRad = v36.curAzimuthRad ~= 0 and math.sign(v36.curAzimuthRad) * (math.abs(v36.curAzimuthRad) % 6.283185307179586) or 0;
        end;
        v36.curElevationRad = math.clamp(v36.curElevationRad + v49.Y, v36.minElevationRad, v36.maxElevationRad);
        local v50 = l_v36_SubjectPosition_0 + v36.currentSubjectDistance * (CFrame.fromEulerAnglesYXZ(-v36.curElevationRad, v36.curAzimuthRad, 0) * Vector3.new(0, 0, 1, 0));
        l_CFrame_0 = CFrame.new(v50, l_v36_SubjectPosition_0);
        v36.lastCameraTransform = l_CFrame_0;
        v36.lastCameraFocus = l_Focus_0;
        if (v46 or v47) and v45:IsA("BasePart") then
            v36.lastSubjectCFrame = v45.CFrame;
        else
            v36.lastSubjectCFrame = nil;
        end;
    end;
    v36.lastUpdate = v38;
    return l_CFrame_0, l_Focus_0;
end;
return v5;