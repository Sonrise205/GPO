local l_UserInputService_0 = game:GetService("UserInputService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local v4 = l_FlagUtil_0.getUserFlag("UserFixCameraFPError");
local v5 = {};
v5.__index = v5;
local v6 = CFrame.new();
local function v10(v7) --[[ Line: 18 ]] --[[ Name: cframeToAxis ]]
    local v8, v9 = v7:ToAxisAngle();
    return v8 * v9;
end;
local l_v6_0 = v6 --[[ copy: 6 -> 13 ]];
local function v14(v12) --[[ Line: 23 ]] --[[ Name: axisToCFrame ]]
    -- upvalues: l_v6_0 (copy)
    local l_Magnitude_0 = v12.Magnitude;
    if l_Magnitude_0 > 1.0E-5 then
        return CFrame.fromAxisAngle(v12, l_Magnitude_0);
    else
        return l_v6_0;
    end;
end;
local function v28(v15) --[[ Line: 31 ]] --[[ Name: extractRotation ]]
    local _, _, _, v19, v20, v21, v22, v23, v24, v25, v26, v27 = v15:GetComponents();
    return CFrame.new(0, 0, 0, v19, v20, v21, v22, v23, v24, v25, v26, v27);
end;
v5.new = function() --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        lastCFrame = nil
    }, v5));
end;
v5.Step = function(v29, v30, v31) --[[ Line: 42 ]] --[[ Name: Step ]]
    -- upvalues: l_v6_0 (copy)
    local v32 = v29.lastCFrame or v31;
    v29.lastCFrame = v31;
    local l_Position_0 = v31.Position;
    local l_v31_Components_0, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45 = v31:GetComponents();
    local v46 = CFrame.new(0, 0, 0, v37, v38, v39, v40, v41, v42, v43, v44, v45);
    l_v31_Components_0 = v32.p;
    local v47, v48;
    v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v47, v48 = v32:GetComponents();
    v35 = CFrame.new(0, 0, 0, v39, v40, v41, v42, v43, v44, v45, v47, v48);
    v36 = (l_Position_0 - l_v31_Components_0) / v30;
    v40, v41 = (v46 * v35:inverse()):ToAxisAngle();
    v37 = v40 * v41 / v30;
    return {
        extrapolate = function(v49) --[[ Line: 57 ]] --[[ Name: extrapolate ]]
            -- upvalues: v36 (copy), l_Position_0 (copy), v37 (copy), l_v6_0 (ref), v46 (copy)
            local v50 = v36 * v49 + l_Position_0;
            local v51 = v37 * v49;
            local l_Magnitude_1 = v51.Magnitude;
            return (if l_Magnitude_1 > 1.0E-5 then CFrame.fromAxisAngle(v51, l_Magnitude_1) else l_v6_0) * v46 + v50;
        end, 
        posVelocity = v36, 
        rotVelocity = v37
    };
end;
v5.Reset = function(v53) --[[ Line: 70 ]] --[[ Name: Reset ]]
    v53.lastCFrame = nil;
end;
v6 = require(script.Parent:WaitForChild("BaseOcclusion"));
v10 = setmetatable({}, v6);
v10.__index = v10;
v10.new = function() --[[ Line: 80 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v10 (copy), v5 (copy)
    local v54 = setmetatable(v6.new(), v10);
    v54.focusExtrapolator = v5.new();
    return v54;
end;
v10.GetOcclusionMode = function(_) --[[ Line: 86 ]] --[[ Name: GetOcclusionMode ]]
    return Enum.DevCameraOcclusionMode.Zoom;
end;
v10.Enable = function(v56, _) --[[ Line: 90 ]] --[[ Name: Enable ]]
    v56.focusExtrapolator:Reset();
end;
v14 = nil;
v28 = 0;
local v58 = false;
local v59 = 0;
local v60 = RaycastParams.new();
v60.FilterType = Enum.RaycastFilterType.Exclude;
v60.IgnoreWater = true;
v10.Update = function(v61, v62, v63, v64, _) --[[ Line: 105 ]] --[[ Name: Update ]]
    -- upvalues: l_UserInputService_0 (copy), v4 (copy), l_ZoomController_0 (copy), v28 (ref), v14 (ref), v60 (copy), v58 (ref), v59 (ref)
    local l_Position_1 = v64.Position;
    local v67 = l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter;
    local l_CameraSubject_0 = workspace.CurrentCamera.CameraSubject;
    local l_l_Position_1_0 = l_Position_1;
    local v70 = nil;
    if l_CameraSubject_0 then
        if l_CameraSubject_0:IsA("Humanoid") and l_CameraSubject_0.RootPart then
            l_l_Position_1_0 = l_CameraSubject_0.RootPart.Position + Vector3.new(0, l_CameraSubject_0.HipHeight + l_CameraSubject_0.RootPart.Size.Y / 2, 0);
            v70 = l_CameraSubject_0.RootPart.Parent;
        elseif l_CameraSubject_0:IsA("BasePart") then
            l_l_Position_1_0 = l_CameraSubject_0.Position;
            v70 = l_CameraSubject_0;
        end;
    end;
    local v71 = if v4 then CFrame.lookAlong(l_Position_1, -v63.LookVector) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1) else CFrame.new(l_Position_1, v63.Position) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1);
    local v72 = v61.focusExtrapolator:Step(v62, v71);
    local v73 = l_ZoomController_0.Update(v62, v71, v72);
    local v74 = v71 * CFrame.new(0, 0, v73);
    local l_v64_0 = v64;
    local v76 = false;
    local v77 = nil;
    if v67 and v70 then
        local v78 = l_Position_1 - l_l_Position_1_0;
        if v78.Magnitude > 0.1 then
            v28 = v28 + 1;
            if v28 >= 3 or v14 then
                v28 = 0;
                v60.FilterDescendantsInstances = {
                    workspace.Effects, 
                    workspace.CurrentCamera, 
                    workspace.NPCs, 
                    workspace.PlayerCharacters
                };
                local v79 = workspace:Spherecast(l_l_Position_1_0, 0.3, v78, v60);
                if v79 and v79.Instance.CanCollide and v79.Instance:GetAttribute("ThinWall") == true then
                    v58 = true;
                    v59 = (v79.Position - l_l_Position_1_0).Magnitude;
                else
                    v58 = false;
                end;
            end;
            if v58 then
                v76 = true;
                v77 = math.max(0.5, v59 - 0.5);
            end;
        end;
    end;
    if v77 and (v14 == nil or v77 < v14) then
        v14 = v77;
    end;
    if v14 and not v76 then
        v14 = v14 + (v73 - v14) * math.min(1, v62 * 15);
        if v14 >= v73 - 0.1 then
            v14 = nil;
        end;
    end;
    if v14 then
        local v80 = l_l_Position_1_0 + -v63.LookVector * v14;
        v74 = v63.Rotation + v80;
        l_v64_0 = CFrame.new(l_l_Position_1_0);
    end;
    return v74, l_v64_0;
end;
v10.CharacterAdded = function(_, _, _) --[[ Line: 199 ]] --[[ Name: CharacterAdded ]]

end;
v10.CharacterRemoving = function(_, _, _) --[[ Line: 203 ]] --[[ Name: CharacterRemoving ]]

end;
v10.OnCameraSubjectChanged = function(_, _) --[[ Line: 206 ]] --[[ Name: OnCameraSubjectChanged ]]

end;
return v10;