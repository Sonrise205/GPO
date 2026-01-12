--!native
local v0 = Random.new(1029410295159813);
local l_Lighting_0 = game:GetService("Lighting");
local l_Dependencies_0 = script.Parent.Parent:WaitForChild("Dependencies");
local _ = require(script.Parent:WaitForChild("Bone"));
local l_Config_0 = require(l_Dependencies_0:WaitForChild("Config"));
local l_DefaultObjectSettings_0 = require(l_Dependencies_0:WaitForChild("DefaultObjectSettings"));
local l_Gizmo_0 = require(l_Dependencies_0:WaitForChild("Gizmo"));
local l_Utilities_0 = require(l_Dependencies_0:WaitForChild("Utilities"));
if game:GetService("RunService"):IsStudio() or l_Config_0.ALLOW_LIVE_GAME_DEBUG then
    l_Gizmo_0.Init();
end;
local l_SB_VERBOSE_LOG_0 = l_Utilities_0.SB_VERBOSE_LOG;
local function _(v9) --[[ Line: 49 ]] --[[ Name: SafeUnit ]]
    if v9.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v9.Unit;
    end;
end;
local function _(v11, v12, v13, v14, v15, v16) --[[ Line: 58 ]] --[[ Name: map ]]
    local v17 = (v11 - v12) / (v13 - v12) * (v15 - v14) + v14;
    if not v16 then
        return v17;
    elseif v14 < v15 then
        return v14 < (v17 < v15 and v17 or v15) and (v17 < v15 and v17 or v15) or v14;
    else
        return v15 < (v17 < v14 and v17 or v14) and (v17 < v14 and v17 or v14) or v15;
    end;
end;
local v19 = {};
v19.__index = v19;
v19.new = function(v20, v21) --[[ Line: 160 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v19 (copy), l_DefaultObjectSettings_0 (copy)
    local v22 = setmetatable({
        WindOffset = v0:NextNumber(0, 1000000), 
        Root = v20:IsA("Bone") and v20 or nil, 
        RootPart = v21, 
        RootPartSize = v21.Size, 
        Bones = {}, 
        Settings = {}, 
        UpdateRate = 0, 
        InView = true, 
        AccumulatedDelta = 0, 
        BoundingBoxCFrame = v21.CFrame, 
        BoundingBoxSize = v21.Size, 
        Destroyed = false, 
        FirstSkipUpdate = false, 
        Force = Vector3.new(0, 0, 0, 0), 
        ObjectMove = Vector3.new(0, 0, 0, 0), 
        ObjectVelocity = Vector3.new(0, 0, 0, 0), 
        ObjectAcceleration = Vector3.new(0, 0, 0, 0), 
        ObjectPreviousPosition = v21.Position
    }, v19);
    v22.DestroyConnection = v21.AncestryChanged:Connect(function() --[[ Line: 184 ]]
        -- upvalues: v21 (copy), v22 (copy)
        if not v21:IsDescendantOf(game) then
            v22.Destroyed = true;
        end;
    end);
    v22.AttributeConnection = v21.AttributeChanged:Connect(function(v23) --[[ Line: 190 ]]
        -- upvalues: v22 (copy), v21 (copy), l_DefaultObjectSettings_0 (ref)
        v22.Settings[v23] = v21:GetAttribute(v23) or l_DefaultObjectSettings_0[v23];
    end);
    return v22;
end;
v19.UpdateBoundingBox = function(v24) --[[ Line: 201 ]] --[[ Name: UpdateBoundingBox ]]
    debug.profilebegin("BoneTree::UpdateBoundingBox");
    if not v24.InView then
        v24.BoundingBoxCFrame = v24.RootPart.CFrame;
        v24.BoundingBoxSize = v24.RootPart.Size;
        debug.profileend();
        return;
    else
        local v25 = Vector3.new(1e999, 1e999, 1e999, 0);
        local v26 = Vector3.new(-1e999, -1e999, -1e999, -0);
        debug.profilebegin("Max Min Bones");
        for _, v28 in v24.Bones do
            debug.profilebegin("Max Min Bone");
            local l_Position_0 = v28.Position;
            v25 = v25:Min(l_Position_0);
            v26 = v26:Max(l_Position_0);
            debug.profileend();
        end;
        debug.profileend();
        local v30 = (v25 + v26) / 2;
        v24.BoundingBoxCFrame = CFrame.new(v30);
        v24.BoundingBoxSize = v24.RootPartSize:Max(v26 - v25);
        debug.profileend();
        return;
    end;
end;
v19.UpdateThrottling = function(v31, v32) --[[ Line: 237 ]] --[[ Name: UpdateThrottling ]]
    debug.profilebegin("BoneTree::UpdateThrottling");
    local l_Settings_0 = v31.Settings;
    local l_Magnitude_0 = (v32 - workspace.CurrentCamera.CFrame.Position).Magnitude;
    if l_Settings_0.ActivationDistance < l_Magnitude_0 then
        v31.UpdateRate = 0;
        debug.profileend();
        return;
    else
        local l_ThrottleDistance_0 = l_Settings_0.ThrottleDistance;
        local l_ActivationDistance_0 = l_Settings_0.ActivationDistance;
        local v37 = (l_Magnitude_0 - l_ThrottleDistance_0) / (l_ActivationDistance_0 - l_ThrottleDistance_0) * 1 + 0;
        local v38 = 1 - if (v37 < 1 and v37 or 1) > 0 then v37 < 1 and v37 or 1 else 0;
        v31.UpdateRate = l_Settings_0.UpdateRate * v38;
        debug.profileend();
        return;
    end;
end;
v19.PreUpdate = function(v39, v40) --[[ Line: 258 ]] --[[ Name: PreUpdate ]]
    debug.profilebegin("BoneTree::PreUpdate");
    local l_Position_1 = v39.RootPart.CFrame.Position;
    local l_ObjectVelocity_0 = v39.ObjectVelocity;
    v39.ObjectMove = l_Position_1 - v39.ObjectPreviousPosition;
    v39.ObjectVelocity = v39.ObjectVelocity:Lerp(v39.ObjectMove / v40 / 4, (math.min(v40 * 10, 1)));
    v39.ObjectAcceleration = (l_ObjectVelocity_0 - v39.ObjectVelocity) * v40;
    v39.ObjectPreviousPosition = l_Position_1;
    v39.RootPartSize = v39.RootPart.Size;
    v39:UpdateThrottling(l_Position_1);
    v39:UpdateBoundingBox();
    for _, v44 in v39.Bones do
        v44:PreUpdate(v39);
    end;
    debug.profileend();
end;
v19.StepPhysics = function(v45, v46) --[[ Line: 283 ]] --[[ Name: StepPhysics ]]
    -- upvalues: l_Lighting_0 (copy), l_DefaultObjectSettings_0 (copy)
    debug.profilebegin("BoneTree::StepPhysics");
    local l_Settings_1 = v45.Settings;
    local v48 = (l_Settings_1.Gravity + l_Settings_1.Force) * v46;
    if l_Settings_1.MatchWorkspaceWind == true then
        local l_GlobalWind_0 = workspace.GlobalWind;
        l_Settings_1.WindDirection = if l_GlobalWind_0.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else l_GlobalWind_0.Unit;
        l_Settings_1.WindSpeed = l_GlobalWind_0.Magnitude;
    else
        local v50 = l_Lighting_0:GetAttribute("WindDirection") or l_DefaultObjectSettings_0.WindDirection;
        local v51 = l_Lighting_0:GetAttribute("WindSpeed") or l_DefaultObjectSettings_0.WindSpeed;
        l_Settings_1.WindDirection = if v50.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v50.Unit;
        l_Settings_1.WindSpeed = v51;
    end;
    l_Settings_1.WindStrength = l_Lighting_0:GetAttribute("WindStrength") or l_DefaultObjectSettings_0.WindStrength;
    for _, v53 in v45.Bones do
        v53:StepPhysics(v45, v48, v46);
    end;
    debug.profileend();
end;
v19.Constrain = function(v54, v55, v56) --[[ Line: 315 ]] --[[ Name: Constrain ]]
    debug.profilebegin("BoneTree::Constrain");
    for _, v58 in v54.Bones do
        v58:Constrain(v54, v55, v56, v54.calculateCollisions);
    end;
    debug.profileend();
end;
v19.SkipUpdate = function(v59) --[[ Line: 325 ]] --[[ Name: SkipUpdate ]]
    debug.profilebegin("BoneTree::SkipUpdate");
    for _, v61 in v59.Bones do
        v61:SkipUpdate();
    end;
    v59.FirstSkipUpdate = true;
    debug.profileend();
end;
v19.SolveTransform = function(v62, v63) --[[ Line: 337 ]] --[[ Name: SolveTransform ]]
    debug.profilebegin("BoneTree::SolveTransform");
    for _, v65 in v62.Bones do
        v65:SolveTransform(v62, v63);
    end;
    v62.FirstSkipUpdate = false;
    debug.profileend();
end;
v19.ApplyTransform = function(v66) --[[ Line: 349 ]] --[[ Name: ApplyTransform ]]
    debug.profilebegin("BoneTree::ApplyTransform");
    for _, v68 in v66.Bones do
        v68:ApplyTransform(v66);
    end;
    debug.profileend();
end;
v19.DrawDebug = function(v69, v70, v71, v72, v73, v74, v75, v76, v77) --[[ Line: 367 ]] --[[ Name: DrawDebug ]]
    -- upvalues: l_Gizmo_0 (copy)
    debug.profilebegin("BoneTree::DrawDebug");
    local v78 = Color3.fromRGB(248, 168, 20);
    local v79 = Color3.fromRGB(76, 208, 223);
    local v80 = Color3.fromRGB(255, 89, 89);
    local v81 = Color3.new(1, 0, 0);
    local v82 = Color3.new(0, 1, 0);
    local v83 = Color3.new(0, 0, 1);
    if v77 then
        local v84 = v69.RootPart.Position + Vector3.new(0, v69.RootPart.Size.Y / 2 + 1, 0);
        l_Gizmo_0.SetStyle(v81, 0, true);
        l_Gizmo_0.Arrow:Draw(v84, v84 + v69.ObjectMove, 0.025, 0.1, 6);
        l_Gizmo_0.SetStyle(v82, 0, true);
        l_Gizmo_0.Arrow:Draw(v84, v84 + v69.ObjectVelocity, 0.025, 0.1, 6);
        l_Gizmo_0.SetStyle(v83, 0, true);
        l_Gizmo_0.Arrow:Draw(v84, v84 + v69.ObjectAcceleration, 0.025, 0.1, 6);
    end;
    l_Gizmo_0.PushProperty("AlwaysOnTop", false);
    if v75 then
        l_Gizmo_0.PushProperty("Color3", v79);
        l_Gizmo_0.Box:Draw(v69.BoundingBoxCFrame, v69.BoundingBoxSize, true);
    end;
    if v74 then
        l_Gizmo_0.PushProperty("Color3", v79);
        l_Gizmo_0.Box:Draw(v69.RootPart.CFrame, v69.RootPart.Size, true);
        l_Gizmo_0.SetStyle(v80, 0.75, false);
        l_Gizmo_0.VolumeBox:Draw(v69.RootPart.CFrame, v69.RootPart.Size);
        l_Gizmo_0.PushProperty("Transparency", 0);
    end;
    for v85, v86 in v69.Bones do
        local l_Position_2 = v86.Bone.TransformedWorldCFrame.Position;
        local v88 = v69.Bones[v86.ParentIndex];
        v86:DrawDebug(v69, v70, v71, v72, v73, v76);
        if v71 and v85 ~= 1 then
            l_Gizmo_0.PushProperty("Color3", v78);
            l_Gizmo_0.Ray:Draw(v88.Bone.TransformedWorldCFrame.Position, l_Position_2);
        end;
    end;
    debug.profileend();
end;
v19.DrawOverlay = function(v89, v90) --[[ Line: 432 ]] --[[ Name: DrawOverlay ]]
    -- upvalues: l_Config_0 (copy)
    if l_Config_0.DEBUG_OVERLAY_TREE_INFO or l_Config_0.DEBUG_OVERLAY_TREE_OBJECTS then
        v90.Text((("Root Part: %*"):format(v89.RootPart.Name)));
        v90.Text((("Root Bone: %*"):format(v89.Root.Name)));
        v90.Text((("Root Part Size: %*"):format((string.format("%.3f, %.3f, %.3f", v89.RootPart.Size.X, v89.RootPart.Size.Y, v89.RootPart.Size.Z)))));
    end;
    if l_Config_0.DEBUG_OVERLAY_TREE_INFO or l_Config_0.DEBUG_OVERLAY_TREE_NUMERICS then
        v90.Text((("Update Rate: %*"):format((string.format("%.3f", v89.UpdateRate)))));
        v90.Text((("In View: %*"):format(v89.InView)));
        v90.Text((("Accumulated Delta: %*"):format((string.format("%.3f", v89.AccumulatedDelta)))));
        v90.Text((("Force: %*"):format((string.format("%.3f, %.3f, %.3f", v89.Force.X, v89.Force.Y, v89.Force.Z)))));
    end;
    local v91 = Color3.new(0.486275, 0.431373, 1);
    local v92 = Color3.new(1, 1, 1);
    if l_Config_0.DEBUG_OVERLAY_BONE then
        for v93, v94 in v89.Bones do
            if l_Config_0.DEBUG_OVERLAY_MAX_BONES <= 0 or l_Config_0.DEBUG_OVERLAY_BONE_OFFSET + l_Config_0.DEBUG_OVERLAY_MAX_BONES > v93 then
                if v93 >= l_Config_0.DEBUG_OVERLAY_BONE_OFFSET then
                    v90.Begin(("Bone %*"):format(v93), v91, v92);
                    v94:DrawOverlay(v90);
                    v90.End();
                end;
            else
                break;
            end;
        end;
    end;
end;
v19.Destroy = function(v95) --[[ Line: 468 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    l_SB_VERBOSE_LOG_0("Destroy BoneTree");
    task.synchronize();
    v95.DestroyConnection:Disconnect();
    v95.AttributeConnection:Disconnect();
    for _, v97 in v95.Bones do
        v97:Destroy();
    end;
    setmetatable(v95, nil);
    task.desynchronize();
end;
return v19;