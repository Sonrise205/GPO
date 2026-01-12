local l_Terrain_0 = workspace.Terrain;
local v1 = {};
v1.__index = v1;
v1.Init = function(v2, v3, v4, v5, v6, v7) --[[ Line: 6 ]] --[[ Name: Init ]]
    -- upvalues: v1 (copy)
    local v8 = setmetatable({}, v1);
    v8.Ceive = v2;
    v8.Propertys = v3;
    v8.Request = v4;
    v8.Release = v5;
    v8.Retain = v6;
    v8.Register = v7;
    return v8;
end;
v1.Draw = function(v9, v10, v11, v12, v13, v14) --[[ Line: 19 ]] --[[ Name: Draw ]]
    -- upvalues: l_Terrain_0 (copy)
    local l_Ceive_0 = v9.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        local v16 = v9.Request("CylinderHandleAdornment");
        v16.Color3 = v9.Propertys.Color3;
        v16.Transparency = v9.Propertys.Transparency;
        v16.CFrame = v10;
        v16.Height = v12;
        v16.Radius = v11;
        v16.InnerRadius = v13 or 0;
        v16.Angle = v14 or 360;
        v16.AlwaysOnTop = v9.Propertys.AlwaysOnTop;
        v16.ZIndex = 1;
        v16.Adornee = l_Terrain_0;
        v16.Parent = l_Terrain_0;
        l_Ceive_0.ActiveInstances = l_Ceive_0.ActiveInstances + 1;
        v9.Register(v16);
        v9.Ceive.ScheduleCleaning();
        return;
    end;
end;
v1.Create = function(v17, v18, v19, v20, v21, v22) --[[ Line: 46 ]] --[[ Name: Create ]]
    local v23 = {
        Transform = v18, 
        Radius = v19, 
        Length = v20, 
        InnerRadius = v21 or 0, 
        Angle = v22 or 360, 
        AlwaysOnTop = v17.Propertys.AlwaysOnTop, 
        Transparency = v17.Propertys.Transparency, 
        Color3 = v17.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v17:Retain(v23);
    return v23;
end;
v1.Update = function(v24, v25) --[[ Line: 65 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v24.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v25.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v25.Transparency);
    l_Ceive_1.PushProperty("Color3", v25.Color3);
    v24:Draw(v25.Transform, v25.Radius, v25.Length, v25.InnerRadius, v25.Angle);
end;
return v1;