local l_HttpService_0 = game:GetService("HttpService");
local l_Dependencies_0 = script.Parent.Parent.Parent:WaitForChild("Dependencies");
local l_Colliders_0 = script.Parent:WaitForChild("Colliders");
local l_Box_0 = require(l_Colliders_0:WaitForChild("Box"));
local l_Capsule_0 = require(l_Colliders_0:WaitForChild("Capsule"));
local l_Cylinder_0 = require(l_Colliders_0:WaitForChild("Cylinder"));
local l_Sphere_0 = require(l_Colliders_0:WaitForChild("Sphere"));
local l_Config_0 = require(script.Parent.Parent.Parent:WaitForChild("Dependencies"):WaitForChild("Config"));
local l_SB_VERBOSE_LOG_0 = require(script.Parent.Parent.Parent:WaitForChild("Dependencies"):WaitForChild("Utilities")).SB_VERBOSE_LOG;
local l_Gizmo_0 = require(l_Dependencies_0:WaitForChild("Gizmo"));
if game:GetService("RunService"):IsStudio() or l_Config_0.ALLOW_LIVE_GAME_DEBUG or l_Config_0.ALLOW_LIVE_GAME_DEBUG then
    l_Gizmo_0.Init();
end;
local v10 = {};
v10.__index = v10;
v10.new = function() --[[ Line: 76 ]] --[[ Name: new ]]
    -- upvalues: l_HttpService_0 (copy), v10 (copy)
    return (setmetatable({
        Type = "Box", 
        Scale = Vector3.new(0, 0, 0, 0), 
        Offset = Vector3.new(0, 0, 0, 0), 
        Rotation = Vector3.new(0, 0, 0, 0), 
        Radius = 0, 
        PreviousScale = Vector3.new(0, 0, 0, 0), 
        PreviousOffset = Vector3.new(0, 0, 0, 0), 
        PreviousRotation = Vector3.new(0, 0, 0, 0), 
        PreviousObjectPosition = Vector3.new(0, 0, 0, 0), 
        PreviousObjectRotation = Vector3.new(0, 0, 0, 0), 
        m_Object = nil, 
        InNarrowphase = false, 
        Transform = CFrame.identity, 
        Size = Vector3.new(0, 0, 0, 0), 
        GUID = l_HttpService_0:GenerateGUID(false)
    }, v10));
end;
v10.SetObject = function(v11, v12) --[[ Line: 105 ]] --[[ Name: SetObject ]]
    v11.m_Object = v12;
    v11:UpdateTransform();
end;
v10.UpdateTransform = function(v13) --[[ Line: 112 ]] --[[ Name: UpdateTransform ]]
    debug.profilebegin("Update Transform");
    local l_m_Object_0 = v13.m_Object;
    local l_CFrame_0 = l_m_Object_0.CFrame;
    local l_Size_0 = l_m_Object_0.Size;
    local l_Scale_0 = v13.Scale;
    local l_Offset_0 = v13.Offset;
    local l_Rotation_0 = v13.Rotation;
    local v20 = l_Size_0 * l_Offset_0;
    local v21 = l_Size_0 * l_Scale_0;
    local v22 = CFrame.Angles(l_Rotation_0.X * 0.017453, l_Rotation_0.Y * 0.017453, l_Rotation_0.Z * 0.017453);
    v13.Transform = l_CFrame_0 * CFrame.new(v20) * v22;
    v13.Size = v21;
    v13.Radius = math.sqrt((math.max(v21.X, v21.Y, v21.Z) * 0.5) ^ 2 * 2);
    debug.profileend();
end;
v10.GetClosestPoint = function(v23, v24, v25) --[[ Line: 137 ]] --[[ Name: GetClosestPoint ]]
    -- upvalues: l_Box_0 (copy), l_Capsule_0 (copy), l_Sphere_0 (copy), l_Cylinder_0 (copy)
    if v23.m_Object == nil then
        return;
    else
        v23.InNarrowphase = false;
        if (v24 - v23.Transform.Position).Magnitude - v25 > v23.Radius then
            return;
        else
            debug.profilebegin("Narrowphase");
            v23.InNarrowphase = true;
            local l_Type_0 = v23.Type;
            local v27 = nil;
            local v28 = nil;
            local v29 = nil;
            if l_Type_0 == "Box" then
                local v30, v31, v32 = l_Box_0(v23.Transform, v23.Size, v24, v25);
                v27 = v30;
                v28 = v31;
                v29 = v32;
            end;
            if l_Type_0 == "Capsule" then
                local v33, v34, v35 = l_Capsule_0(v23.Transform, v23.Size, v24, v25);
                v27 = v33;
                v28 = v34;
                v29 = v35;
            end;
            if l_Type_0 == "Sphere" then
                local v36, v37, v38 = l_Sphere_0(v23.Transform, v23.Size, v24, v25);
                v27 = v36;
                v28 = v37;
                v29 = v38;
            end;
            if l_Type_0 == "Cylinder" then
                local v39, v40, v41 = l_Cylinder_0(v23.Transform, v23.Size, v24, v25);
                v27 = v39;
                v28 = v40;
                v29 = v41;
            end;
            debug.profileend();
            return v27, v28, v29;
        end;
    end;
end;
v10.Step = function(v42) --[[ Line: 182 ]] --[[ Name: Step ]]
    debug.profilebegin("Collider::Step");
    v42:UpdateTransform();
    debug.profileend();
end;
v10.DrawDebug = function(v43, v44, v45, v46, v47, v48) --[[ Line: 194 ]] --[[ Name: DrawDebug ]]
    -- upvalues: l_Gizmo_0 (copy)
    local v49 = Color3.new(0.509803, 0.933333, 0.42745);
    local v50 = Color3.new(0.90196, 0.784313, 0.513725);
    local v51 = Color3.new(1, 0, 1);
    local v52 = Color3.new(0, 1, 1);
    local v53 = Color3.new(1, 0.3, 0.3);
    local l_Type_1 = v43.Type;
    local l_Transform_0 = v43.Transform;
    local l_Size_1 = v43.Size;
    if not v44.m_Awake and v47 then
        v49 = v51;
    end;
    if v43.InNarrowphase == false and v48 then
        v50 = v52;
    end;
    if v46 then
        l_Gizmo_0.SetStyle(v53, 0, false);
        l_Gizmo_0.Sphere:Draw(l_Transform_0, v43.Radius, 25, 360);
    end;
    if l_Type_1 == "Box" then
        l_Gizmo_0.SetStyle(v49, 0, false);
        l_Gizmo_0.Box:Draw(l_Transform_0, l_Size_1);
        if v45 then
            l_Gizmo_0.SetStyle(v50, 0.75, false);
            l_Gizmo_0.VolumeBox:Draw(l_Transform_0, l_Size_1);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    elseif l_Type_1 == "Capsule" then
        local v57 = math.min(l_Size_1.Y, l_Size_1.Z) * 0.5;
        local l_X_0 = l_Size_1.X;
        local v59 = l_Transform_0 * CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0);
        l_Gizmo_0.SetStyle(v49, 0, false);
        l_Gizmo_0.Capsule:Draw(v59, v57, l_X_0, 15);
        if v45 then
            local v60 = v59.Position + v59.UpVector * (l_X_0 * 0.5);
            local v61 = v59.Position - v59.UpVector * (l_X_0 * 0.5);
            l_Gizmo_0.SetStyle(v50, 0.75, false);
            l_Gizmo_0.VolumeCylinder:Draw(l_Transform_0, v57, l_X_0);
            l_Gizmo_0.VolumeSphere:Draw(CFrame.new(v60), v57);
            l_Gizmo_0.VolumeSphere:Draw(CFrame.new(v61), v57);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    elseif l_Type_1 == "Sphere" then
        local v62 = math.min(l_Size_1.X, l_Size_1.Y, l_Size_1.Z) * 0.5;
        l_Gizmo_0.SetStyle(v49, 0, false);
        l_Gizmo_0.Sphere:Draw(l_Transform_0, v62, 15, 360);
        if v45 then
            l_Gizmo_0.SetStyle(v50, 0.75, false);
            l_Gizmo_0.VolumeSphere:Draw(l_Transform_0, v62);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    elseif l_Type_1 == "Cylinder" then
        local v63 = math.min(l_Size_1.Y, l_Size_1.Z) * 0.5;
        l_Gizmo_0.SetStyle(v49, 0, false);
        l_Gizmo_0.Cylinder:Draw(l_Transform_0 * CFrame.Angles(0, 0, 1.5707963267948966), v63, l_Size_1.X, 15);
        if v45 then
            l_Gizmo_0.SetStyle(v50, 0.75, false);
            l_Gizmo_0.VolumeCylinder:Draw(l_Transform_0 * CFrame.Angles(0, -1.5707963267948966, 0), v63, l_Size_1.X, 0, 360);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    else
        return;
    end;
end;
v10.Destroy = function(v64) --[[ Line: 286 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    l_SB_VERBOSE_LOG_0((("Collider destroying, object: %*"):format(v64.m_Object)));
    setmetatable(v64, nil);
end;
return v10;