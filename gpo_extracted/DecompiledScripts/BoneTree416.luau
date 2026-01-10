--!native
local l_Lighting_0 = game:GetService("Lighting");
local l_Dependencies_0 = script.Parent.Parent:WaitForChild("Dependencies");
local _ = require(script.Parent:WaitForChild("Bone"));
local l_Config_0 = require(l_Dependencies_0:WaitForChild("Config"));
local l_DefaultObjectSettings_0 = require(l_Dependencies_0:WaitForChild("DefaultObjectSettings"));
local l_Gizmo_0 = require(l_Dependencies_0:WaitForChild("Debug"):WaitForChild("Gizmo"));
local l_Utilities_0 = require(l_Dependencies_0:WaitForChild("Utilities"));
local v7 = Random.new(1029410295159813);
local l_SB_VERBOSE_LOG_0 = l_Utilities_0.SB_VERBOSE_LOG;
local l_CollectionService_0 = game:GetService("CollectionService");
local function _(v10) --[[ Line: 51 ]] --[[ Name: SafeUnit ]]
    if v10.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v10.Unit;
    end;
end;
local function _(v12, v13, v14, v15, v16, v17) --[[ Line: 60 ]] --[[ Name: map ]]
    local v18 = (v12 - v13) / (v14 - v13) * (v16 - v15) + v15;
    if not v17 then
        return v18;
    elseif v15 < v16 then
        return v15 < (v18 < v16 and v18 or v16) and (v18 < v16 and v18 or v16) or v15;
    else
        return v16 < (v18 < v15 and v18 or v15) and (v18 < v15 and v18 or v15) or v16;
    end;
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22, v23) --[[ Line: 168 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v20 (copy), l_DefaultObjectSettings_0 (copy), l_CollectionService_0 (copy)
    local v24 = setmetatable({
        WindOffset = v7:NextNumber(0, 1000000), 
        Root = v21:IsA("Bone") and v21 or nil, 
        RootPart = v22, 
        RootPartSize = v22.Size, 
        Bones = {}, 
        Settings = v23, 
        UpdateRate = 0, 
        InView = true, 
        AccumulatedDelta = 0, 
        BoundingBoxCFrame = v22.CFrame, 
        BoundingBoxSize = v22.Size, 
        Destroyed = false, 
        IsSkippingUpdates = false, 
        InWorkspace = false, 
        Force = Vector3.new(0, 0, 0, 0), 
        ObjectMove = Vector3.new(0, 0, 0, 0), 
        ObjectVelocity = Vector3.new(0, 0, 0, 0), 
        ObjectAcceleration = Vector3.new(0, 0, 0, 0), 
        ObjectPreviousPosition = v22.Position
    }, v20);
    v24.InWorkspace = v22:IsDescendantOf(workspace);
    v24.DestroyConnection = v22.AncestryChanged:ConnectParallel(function() --[[ Line: 196 ]]
        -- upvalues: v22 (copy), v24 (copy)
        if not v22:IsDescendantOf(game) then
            v24.Destroyed = true;
        end;
        v24.InWorkspace = v22:IsDescendantOf(workspace);
    end);
    v24.AttributeConnection = v22.AttributeChanged:ConnectParallel(function(v25) --[[ Line: 204 ]]
        -- upvalues: v23 (copy), v22 (copy), l_DefaultObjectSettings_0 (ref)
        v23[v25] = v22:GetAttribute(v25) or l_DefaultObjectSettings_0[v25];
    end);
    v24.TagConnection = l_CollectionService_0:GetInstanceRemovedSignal("SmartBone"):Connect(function(v26) --[[ Line: 209 ]]
        -- upvalues: v22 (copy), v24 (copy)
        if v26 ~= v22 then
            return;
        else
            v24.Destroyed = true;
            return;
        end;
    end);
    return v24;
end;
v20.UpdateBoundingBox = function(v27) --[[ Line: 244 ]] --[[ Name: UpdateBoundingBox ]]
    if not v27.InView then
        v27.BoundingBoxCFrame = v27.RootPart.CFrame;
        v27.BoundingBoxSize = v27.RootPart.Size;
        return;
    else
        local v28 = Vector3.new(1e999, 1e999, 1e999, 0);
        local v29 = Vector3.new(-1e999, -1e999, -1e999, -0);
        for _, v31 in v27.Bones do
            local v32 = v31.Position - v31.LastPosition;
            local v33 = v31.Position + v32;
            v28 = v28:Min(v33);
            v29 = v29:Max(v33);
        end;
        local v34 = (v28 + v29) * 0.5;
        v27.BoundingBoxCFrame = CFrame.new(v34);
        v27.BoundingBoxSize = v27.RootPartSize:Max(v29 - v28);
        return;
    end;
end;
v20.UpdateThrottling = function(v35, v36) --[[ Line: 281 ]] --[[ Name: UpdateThrottling ]]
    local l_Settings_0 = v35.Settings;
    local l_Magnitude_0 = (v36 - workspace.CurrentCamera.CFrame.Position).Magnitude;
    if l_Settings_0.ActivationDistance < l_Magnitude_0 then
        v35.UpdateRate = 0;
        return;
    else
        local l_ThrottleDistance_0 = l_Settings_0.ThrottleDistance;
        local l_ActivationDistance_0 = l_Settings_0.ActivationDistance;
        local v41 = (l_Magnitude_0 - l_ThrottleDistance_0) / (l_ActivationDistance_0 - l_ThrottleDistance_0) * 1 + 0;
        local v42 = 1 - if (v41 < 1 and v41 or 1) > 0 then v41 < 1 and v41 or 1 else 0;
        v35.UpdateRate = l_Settings_0.UpdateRate * v42;
        return;
    end;
end;
v20.PreUpdate = function(v43, _) --[[ Line: 302 ]] --[[ Name: PreUpdate ]]
    local l_Position_0 = v43.RootPart.CFrame.Position;
    local l_ObjectVelocity_0 = v43.ObjectVelocity;
    v43.ObjectMove = l_Position_0 - v43.ObjectPreviousPosition;
    v43.ObjectVelocity = v43.ObjectMove;
    v43.ObjectAcceleration = l_ObjectVelocity_0 - v43.ObjectVelocity;
    v43.ObjectPreviousPosition = l_Position_0;
    v43.RootPartSize = v43.RootPart.Size;
    v43:UpdateThrottling(l_Position_0);
    v43:UpdateBoundingBox();
    for _, v48 in v43.Bones do
        v48:PreUpdate(v43);
    end;
end;
v20.StepPhysics = function(v49, v50) --[[ Line: 327 ]] --[[ Name: StepPhysics ]]
    -- upvalues: l_Lighting_0 (copy), l_DefaultObjectSettings_0 (copy)
    local l_Settings_1 = v49.Settings;
    local v52 = l_Settings_1.Gravity + l_Settings_1.Force;
    if l_Settings_1.MatchWorkspaceWind == true then
        local l_GlobalWind_0 = workspace.GlobalWind;
        l_Settings_1.WindDirection = if l_GlobalWind_0.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else l_GlobalWind_0.Unit;
        l_Settings_1.WindSpeed = l_GlobalWind_0.Magnitude;
    else
        local v54 = l_Lighting_0:GetAttribute("WindDirection") or l_DefaultObjectSettings_0.WindDirection;
        local v55 = l_Lighting_0:GetAttribute("WindSpeed") or l_DefaultObjectSettings_0.WindSpeed;
        l_Settings_1.WindDirection = if v54.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v54.Unit;
        l_Settings_1.WindSpeed = v55;
    end;
    l_Settings_1.WindStrength = l_Lighting_0:GetAttribute("WindStrength") or l_DefaultObjectSettings_0.WindStrength;
    for _, v57 in v49.Bones do
        v57:StepPhysics(v49, v52, v50);
    end;
end;
v20.Constrain = function(v58, v59, v60) --[[ Line: 357 ]] --[[ Name: Constrain ]]
    for _, v62 in v58.Bones do
        v62:Constrain(v58, v59, v60);
    end;
end;
v20.SkipUpdate = function(v63) --[[ Line: 367 ]] --[[ Name: SkipUpdate ]]
    for _, v65 in v63.Bones do
        v65:SkipUpdate();
    end;
    v63.IsSkippingUpdates = true;
end;
v20.SolveTransform = function(v66, v67) --[[ Line: 379 ]] --[[ Name: SolveTransform ]]
    for _, v69 in v66.Bones do
        v69:SolveTransform(v66, v67);
    end;
    v66.IsSkippingUpdates = false;
end;
v20.ApplyTransform = function(v70) --[[ Line: 391 ]] --[[ Name: ApplyTransform ]]
    for _, v72 in v70.Bones do
        v72:ApplyTransform(v70);
    end;
end;
v20.DrawDebug = function(v73, v74, v75, v76, v77, v78, v79, v80, v81) --[[ Line: 409 ]] --[[ Name: DrawDebug ]]
    -- upvalues: l_Gizmo_0 (copy)
    local v82 = Color3.fromRGB(248, 168, 20);
    local v83 = Color3.fromRGB(76, 208, 223);
    local v84 = Color3.fromRGB(255, 89, 89);
    local v85 = Color3.new(1, 0, 0);
    local v86 = Color3.new(0, 1, 0);
    local v87 = Color3.new(0, 0, 1);
    if v81 then
        local v88 = v73.RootPart.Position + Vector3.new(0, v73.RootPart.Size.Y * 0.5 + 1, 0);
        l_Gizmo_0.SetStyle(v85, 0, true);
        l_Gizmo_0.Arrow:Draw(v88, v88 + v73.ObjectMove, 0.025, 0.1, 6);
        l_Gizmo_0.SetStyle(v86, 0, true);
        l_Gizmo_0.Arrow:Draw(v88, v88 + v73.ObjectVelocity, 0.025, 0.1, 6);
        l_Gizmo_0.SetStyle(v87, 0, true);
        l_Gizmo_0.Arrow:Draw(v88, v88 + v73.ObjectAcceleration, 0.025, 0.1, 6);
    end;
    l_Gizmo_0.PushProperty("AlwaysOnTop", false);
    if v79 then
        l_Gizmo_0.PushProperty("Color3", v83);
        l_Gizmo_0.Box:Draw(v73.BoundingBoxCFrame, v73.BoundingBoxSize, true);
    end;
    if v78 then
        l_Gizmo_0.PushProperty("Color3", v83);
        l_Gizmo_0.Box:Draw(v73.RootPart.CFrame, v73.RootPart.Size, true);
        l_Gizmo_0.SetStyle(v84, 0.75, false);
        l_Gizmo_0.VolumeBox:Draw(v73.RootPart.CFrame, v73.RootPart.Size);
        l_Gizmo_0.PushProperty("Transparency", 0);
    end;
    for v89, v90 in v73.Bones do
        local l_Position_1 = v90.Bone.TransformedWorldCFrame.Position;
        local v92 = v73.Bones[v90.ParentIndex];
        v90:DrawDebug(v73, v74, v75, v76, v77, v80);
        if v75 and v89 ~= 1 then
            l_Gizmo_0.PushProperty("Color3", v82);
            l_Gizmo_0.Ray:Draw(v92.Bone.TransformedWorldCFrame.Position, l_Position_1);
        end;
    end;
end;
v20.DrawOverlay = function(v93, v94) --[[ Line: 474 ]] --[[ Name: DrawOverlay ]]
    -- upvalues: l_Config_0 (copy)
    if l_Config_0.DEBUG_OVERLAY_TREE_INFO or l_Config_0.DEBUG_OVERLAY_TREE_OBJECTS then
        v94.Text((("Root Part: %*"):format(v93.RootPart.Name)));
        v94.Text((("Root Bone: %*"):format(v93.Root.Name)));
        v94.Text((("Root Part Size: %*"):format((string.format("%.3f, %.3f, %.3f", v93.RootPart.Size.X, v93.RootPart.Size.Y, v93.RootPart.Size.Z)))));
    end;
    if l_Config_0.DEBUG_OVERLAY_TREE_INFO or l_Config_0.DEBUG_OVERLAY_TREE_NUMERICS then
        v94.Text((("Update Rate: %*"):format((string.format("%.3f", v93.UpdateRate)))));
        v94.Text((("In View: %*"):format(v93.InView)));
        v94.Text((("Accumulated Delta: %*"):format((string.format("%.3f", v93.AccumulatedDelta)))));
        v94.Text((("Force: %*"):format((string.format("%.3f, %.3f, %.3f", v93.Force.X, v93.Force.Y, v93.Force.Z)))));
    end;
    local v95 = Color3.new(0.486275, 0.431373, 1);
    local v96 = Color3.new(1, 1, 1);
    if l_Config_0.DEBUG_OVERLAY_BONE then
        for v97, v98 in v93.Bones do
            if l_Config_0.DEBUG_OVERLAY_MAX_BONES <= 0 or l_Config_0.DEBUG_OVERLAY_BONE_OFFSET + l_Config_0.DEBUG_OVERLAY_MAX_BONES > v97 then
                if v97 >= l_Config_0.DEBUG_OVERLAY_BONE_OFFSET then
                    v94.Begin(("Bone %*"):format(v97), v95, v96);
                    v98:DrawOverlay(v94);
                    v94.End();
                end;
            else
                break;
            end;
        end;
    end;
end;
v20.Destroy = function(v99) --[[ Line: 510 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    l_SB_VERBOSE_LOG_0("Destroy BoneTree");
    task.synchronize();
    v99.DestroyConnection:Disconnect();
    v99.AttributeConnection:Disconnect();
    v99.TagConnection:Disconnect();
    for _, v101 in v99.Bones do
        v101:Destroy();
    end;
    setmetatable(v99, nil);
    task.desynchronize();
end;
return v20;