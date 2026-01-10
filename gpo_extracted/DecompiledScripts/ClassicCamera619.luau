local _ = Vector2.new(0, 0);
local v1 = 0;
local v2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0);
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v5 = l_FlagUtil_0.getUserFlag("UserCameraInputDt");
local v6 = l_FlagUtil_0.getUserFlag("UserFixCameraFPError");
local l_Players_0 = game:GetService("Players");
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v11 = setmetatable({}, l_BaseCamera_0);
v11.__index = v11;
v11.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v11 (copy), l_CameraUtils_0 (copy)
    local v12 = setmetatable(l_BaseCamera_0.new(), v11);
    v12.isFollowCamera = false;
    v12.isCameraToggle = false;
    v12.lastUpdate = tick();
    v12.cameraToggleSpring = l_CameraUtils_0.Spring.new(5, 0);
    return v12;
end;
v11.GetCameraToggleOffset = function(v13, v14) --[[ Line: 51 ]] --[[ Name: GetCameraToggleOffset ]]
    -- upvalues: l_CameraInput_0 (copy), l_CameraUtils_0 (copy)
    if v13.isCameraToggle then
        local l_currentSubjectDistance_0 = v13.currentSubjectDistance;
        if l_CameraInput_0.getTogglePan() then
            v13.cameraToggleSpring.goal = math.clamp(l_CameraUtils_0.map(l_currentSubjectDistance_0, 0.5, v13.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1);
        else
            v13.cameraToggleSpring.goal = 0;
        end;
        local v16 = math.clamp(l_CameraUtils_0.map(l_currentSubjectDistance_0, 0.5, 64, 0, 1), 0, 1) + 1;
        return (Vector3.new(0, v13.cameraToggleSpring:step(v14) * v16, 0));
    else
        return (Vector3.new());
    end;
end;
v11.SetCameraMovementMode = function(v17, v18) --[[ Line: 69 ]] --[[ Name: SetCameraMovementMode ]]
    -- upvalues: l_BaseCamera_0 (copy)
    l_BaseCamera_0.SetCameraMovementMode(v17, v18);
    v17.isFollowCamera = v18 == Enum.ComputerCameraMovementMode.Follow;
    v17.isCameraToggle = v18 == Enum.ComputerCameraMovementMode.CameraToggle;
end;
v11.Update = function(v19, v20) --[[ Line: 76 ]] --[[ Name: Update ]]
    -- upvalues: v5 (copy), v2 (copy), l_Players_0 (copy), l_CameraInput_0 (copy), v1 (ref), l_CameraUtils_0 (copy), v6 (copy)
    local v21 = tick();
    local v22 = v21 - v19.lastUpdate;
    if v5 then
        v22 = v20;
    end;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local v26 = nil;
    if v19.resetCameraAngle then
        local l_v19_HumanoidRootPart_0 = v19:GetHumanoidRootPart();
        v26 = if l_v19_HumanoidRootPart_0 then (l_v19_HumanoidRootPart_0.CFrame * v2).lookVector else v2.lookVector;
        v19.resetCameraAngle = false;
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_v19_Humanoid_0 = v19:GetHumanoid();
    local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
    local v31 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat");
    local v32 = l_CameraSubject_0 and l_CameraSubject_0:IsA("SkateboardPlatform");
    local v33 = l_v19_Humanoid_0 and l_v19_Humanoid_0:GetState() == Enum.HumanoidStateType.Climbing;
    if v19.lastUpdate == nil or v22 > 1 then
        v19.lastCameraTransform = nil;
    end;
    local v34 = l_CameraInput_0.getRotation(v22);
    v19:StepZoom();
    local l_v19_CameraHeight_0 = v19:GetCameraHeight();
    if v34 ~= Vector2.new() then
        v1 = 0;
        v19.lastUserPanCamera = tick();
    end;
    local v36 = v21 - v19.lastUserPanCamera < 2;
    local l_v19_SubjectPosition_0 = v19:GetSubjectPosition();
    if l_v19_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        local l_v19_CameraToSubjectDistance_0 = v19:GetCameraToSubjectDistance();
        if l_v19_CameraToSubjectDistance_0 < 0.5 then
            l_v19_CameraToSubjectDistance_0 = 0.5;
        end;
        if v19:GetIsMouseLocked() and not v19:IsInFirstPerson() then
            local v39 = v19:CalculateNewLookCFrameFromArg(v26, v34);
            local l_v19_MouseLockOffset_0 = v19:GetMouseLockOffset();
            if l_v19_Humanoid_0 then
                l_v19_MouseLockOffset_0 = l_v19_MouseLockOffset_0 + l_v19_Humanoid_0.CameraOffset;
            end;
            local v41 = l_v19_MouseLockOffset_0.X * v39.RightVector + l_v19_MouseLockOffset_0.Y * v39.UpVector + l_v19_MouseLockOffset_0.Z * v39.LookVector;
            if l_CameraUtils_0.IsFiniteVector3(v41) then
                l_v19_SubjectPosition_0 = l_v19_SubjectPosition_0 + v41;
            end;
        elseif not (v34 ~= Vector2.new()) and v19.lastCameraTransform then
            local v42 = v19:IsInFirstPerson();
            if (v31 or v32 or v19.isFollowCamera and v33) and v19.lastUpdate and l_v19_Humanoid_0 and l_v19_Humanoid_0.Torso then
                if v42 then
                    if v19.lastSubjectCFrame and (v31 or v32) and l_CameraSubject_0:IsA("BasePart") then
                        local v43 = -l_CameraUtils_0.GetAngleBetweenXZVectors(v19.lastSubjectCFrame.lookVector, l_CameraSubject_0.CFrame.lookVector);
                        if l_CameraUtils_0.IsFinite(v43) then
                            v34 = v34 + Vector2.new(v43, 0);
                        end;
                        v1 = 0;
                    end;
                elseif not v36 then
                    local l_lookVector_0 = l_v19_Humanoid_0.Torso.CFrame.lookVector;
                    v1 = math.clamp(v1 + 3.839724354387525 * v22, 0, 4.363323129985824);
                    local v45 = math.clamp(v1 * v22, 0, 1);
                    if v19:IsInFirstPerson() and (not v19.isFollowCamera or not v19.isClimbing) then
                        v45 = 1;
                    end;
                    local v46 = l_CameraUtils_0.GetAngleBetweenXZVectors(l_lookVector_0, v19:GetCameraLookVector());
                    if l_CameraUtils_0.IsFinite(v46) and math.abs(v46) > 1.0E-4 then
                        v34 = v34 + Vector2.new(v46 * v45, 0);
                    end;
                end;
            elseif v19.isFollowCamera and not v42 and not v36 then
                local v47 = -(v19.lastCameraTransform.p - l_v19_SubjectPosition_0);
                local v48 = l_CameraUtils_0.GetAngleBetweenXZVectors(v47, v19:GetCameraLookVector());
                if l_CameraUtils_0.IsFinite(v48) and math.abs(v48) > 1.0E-4 and math.abs(v48) > 0.4 * v22 then
                    v34 = v34 + Vector2.new(v48, 0);
                end;
            end;
        end;
        if not v19.isFollowCamera then
            l_Focus_0 = CFrame.new(l_v19_SubjectPosition_0);
            local l_p_0 = l_Focus_0.p;
            local v50 = v19:CalculateNewLookVectorFromArg(v26, v34);
            l_CFrame_0 = if v6 then CFrame.lookAlong(l_p_0 - l_v19_CameraToSubjectDistance_0 * v50, v50) else CFrame.new(l_p_0 - l_v19_CameraToSubjectDistance_0 * v50, l_p_0);
        else
            local v51 = v19:CalculateNewLookVectorFromArg(v26, v34);
            l_Focus_0 = CFrame.new(l_v19_SubjectPosition_0);
            l_CFrame_0 = if v6 then CFrame.lookAlong(l_Focus_0.p - l_v19_CameraToSubjectDistance_0 * v51, v51) else CFrame.new(l_Focus_0.p - l_v19_CameraToSubjectDistance_0 * v51, l_Focus_0.p) + Vector3.new(0, l_v19_CameraHeight_0, 0);
        end;
        local l_v19_CameraToggleOffset_0 = v19:GetCameraToggleOffset(v22);
        l_Focus_0 = l_Focus_0 + l_v19_CameraToggleOffset_0;
        l_CFrame_0 = l_CFrame_0 + l_v19_CameraToggleOffset_0;
        v19.lastCameraTransform = l_CFrame_0;
        v19.lastCameraFocus = l_Focus_0;
        if (v31 or v32) and l_CameraSubject_0:IsA("BasePart") then
            v19.lastSubjectCFrame = l_CameraSubject_0.CFrame;
        else
            v19.lastSubjectCFrame = nil;
        end;
    end;
    v19.lastUpdate = v21;
    return l_CFrame_0, l_Focus_0;
end;
return v11;