local l_HttpService_0 = game:GetService("HttpService");
local l_Dependencies_0 = script.Parent.Parent.Parent:WaitForChild("Dependencies");
local l_Colliders_0 = script.Parent:WaitForChild("Colliders");
local l_Box_0 = require(l_Colliders_0:WaitForChild("Box"));
local l_Capsule_0 = require(l_Colliders_0:WaitForChild("Capsule"));
local l_Cylinder_0 = require(l_Colliders_0:WaitForChild("Cylinder"));
local l_Sphere_0 = require(l_Colliders_0:WaitForChild("Sphere"));
local l_SB_VERBOSE_LOG_0 = require(script.Parent.Parent.Parent:WaitForChild("Dependencies"):WaitForChild("Utilities")).SB_VERBOSE_LOG;
local l_Gizmo_0 = require(l_Dependencies_0:WaitForChild("Debug"):WaitForChild("Gizmo"));
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 70 ]] --[[ Name: new ]]
    -- upvalues: l_HttpService_0 (copy), v9 (copy)
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
    }, v9));
end;
v9.SetObject = function(v10, v11) --[[ Line: 99 ]] --[[ Name: SetObject ]]
    v10.m_Object = v11;
    v10:UpdateTransform();
end;
v9.UpdateTransform = function(v12) --[[ Line: 106 ]] --[[ Name: UpdateTransform ]]
    local l_m_Object_0 = v12.m_Object;
    local l_CFrame_0 = l_m_Object_0.CFrame;
    local l_Size_0 = l_m_Object_0.Size;
    local l_Scale_0 = v12.Scale;
    local l_Offset_0 = v12.Offset;
    local l_Rotation_0 = v12.Rotation;
    local v19 = l_Size_0 * l_Offset_0;
    local v20 = l_Size_0 * l_Scale_0;
    local v21 = CFrame.Angles(l_Rotation_0.X * 0.017453, l_Rotation_0.Y * 0.017453, l_Rotation_0.Z * 0.017453);
    v12.Transform = l_CFrame_0 * CFrame.new(v19) * v21;
    v12.Size = v20;
    v12.Radius = math.sqrt((math.max(v20.X, v20.Y, v20.Z) * 0.5) ^ 2 * 2);
end;
v9.GetClosestPoint = function(v22, v23, v24) --[[ Line: 131 ]] --[[ Name: GetClosestPoint ]]
    -- upvalues: l_Box_0 (copy), l_Capsule_0 (copy), l_Sphere_0 (copy), l_Cylinder_0 (copy)
    if v22.m_Object == nil then
        return;
    else
        v22.InNarrowphase = false;
        if (v23 - v22.Transform.Position).Magnitude - v24 > v22.Radius then
            return;
        else
            v22.InNarrowphase = true;
            local l_Type_0 = v22.Type;
            local v26 = nil;
            local v27 = nil;
            local v28 = nil;
            if l_Type_0 == "Box" then
                local v29, v30, v31 = l_Box_0(v22.Transform, v22.Size, v23, v24);
                v26 = v29;
                v27 = v30;
                v28 = v31;
            end;
            if l_Type_0 == "Capsule" then
                local v32, v33, v34 = l_Capsule_0(v22.Transform, v22.Size, v23, v24);
                v26 = v32;
                v27 = v33;
                v28 = v34;
            end;
            if l_Type_0 == "Sphere" then
                local v35, v36, v37 = l_Sphere_0(v22.Transform, v22.Size, v23, v24);
                v26 = v35;
                v27 = v36;
                v28 = v37;
            end;
            if l_Type_0 == "Cylinder" then
                local v38, v39, v40 = l_Cylinder_0(v22.Transform, v22.Size, v23, v24);
                v26 = v38;
                v27 = v39;
                v28 = v40;
            end;
            return v26, v27, v28;
        end;
    end;
end;
v9.Step = function(v41) --[[ Line: 176 ]] --[[ Name: Step ]]
    v41:UpdateTransform();
end;
v9.DrawDebug = function(v42, v43, v44, v45, v46, v47) --[[ Line: 188 ]] --[[ Name: DrawDebug ]]
    -- upvalues: l_Gizmo_0 (copy)
    local v48 = Color3.new(0.509803, 0.933333, 0.42745);
    local v49 = Color3.new(0.90196, 0.784313, 0.513725);
    local v50 = Color3.new(1, 0, 1);
    local v51 = Color3.new(0, 1, 1);
    local v52 = Color3.new(1, 0.3, 0.3);
    local l_Type_1 = v42.Type;
    local l_Transform_0 = v42.Transform;
    local l_Size_1 = v42.Size;
    if not v43.m_Awake and v46 then
        v48 = v50;
    end;
    if v42.InNarrowphase == false and v47 then
        v49 = v51;
    end;
    if v45 then
        l_Gizmo_0.SetStyle(v52, 0, false);
        l_Gizmo_0.Sphere:Draw(l_Transform_0, v42.Radius, 25, 360);
    end;
    if l_Type_1 == "Box" then
        l_Gizmo_0.SetStyle(v48, 0, false);
        l_Gizmo_0.Box:Draw(l_Transform_0, l_Size_1);
        if v44 then
            l_Gizmo_0.SetStyle(v49, 0.75, false);
            l_Gizmo_0.VolumeBox:Draw(l_Transform_0, l_Size_1);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    elseif l_Type_1 == "Capsule" then
        local v56 = (l_Size_1.Y < l_Size_1.Z and l_Size_1.Y or l_Size_1.Z) * 0.5;
        local l_X_0 = l_Size_1.X;
        local v58 = l_Transform_0 * CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0);
        l_Gizmo_0.SetStyle(v48, 0, false);
        l_Gizmo_0.Capsule:Draw(v58, v56, l_X_0, 15);
        if v44 then
            local v59 = v58.Position + v58.UpVector * (l_X_0 * 0.5);
            local v60 = v58.Position - v58.UpVector * (l_X_0 * 0.5);
            l_Gizmo_0.SetStyle(v49, 0.75, false);
            l_Gizmo_0.VolumeCylinder:Draw(l_Transform_0, v56, l_X_0);
            l_Gizmo_0.VolumeSphere:Draw(CFrame.new(v59), v56);
            l_Gizmo_0.VolumeSphere:Draw(CFrame.new(v60), v56);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    elseif l_Type_1 == "Sphere" then
        local v61 = math.min(l_Size_1.X, l_Size_1.Y, l_Size_1.Z) * 0.5;
        l_Gizmo_0.SetStyle(v48, 0, false);
        l_Gizmo_0.Sphere:Draw(l_Transform_0, v61, 15, 360);
        if v44 then
            l_Gizmo_0.SetStyle(v49, 0.75, false);
            l_Gizmo_0.VolumeSphere:Draw(l_Transform_0, v61);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    elseif l_Type_1 == "Cylinder" then
        local v62 = (l_Size_1.Y < l_Size_1.Z and l_Size_1.Y or l_Size_1.Z) * 0.5;
        l_Gizmo_0.SetStyle(v48, 0, false);
        l_Gizmo_0.Cylinder:Draw(l_Transform_0 * CFrame.Angles(0, 0, 1.5707963267948966), v62, l_Size_1.X, 15);
        if v44 then
            l_Gizmo_0.SetStyle(v49, 0.75, false);
            l_Gizmo_0.VolumeCylinder:Draw(l_Transform_0 * CFrame.Angles(0, -1.5707963267948966, 0), v62, l_Size_1.X, 0, 360);
            l_Gizmo_0.PushProperty("Transparency", 0);
        end;
        return;
    else
        return;
    end;
end;
v9.Destroy = function(v63) --[[ Line: 280 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    l_SB_VERBOSE_LOG_0((("Collider destroying, object: %*"):format(v63.m_Object)));
    setmetatable(v63, nil);
end;
return v9;