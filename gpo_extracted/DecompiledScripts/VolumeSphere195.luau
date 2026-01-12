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
v1.Draw = function(v9, v10, v11) --[[ Line: 19 ]] --[[ Name: Draw ]]
    -- upvalues: l_Terrain_0 (copy)
    local l_Ceive_0 = v9.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        local v13 = v9.Request("SphereHandleAdornment");
        v13.Color3 = v9.Propertys.Color3;
        v13.Transparency = v9.Propertys.Transparency;
        v13.CFrame = v10;
        v13.Radius = v11;
        v13.AlwaysOnTop = v9.Propertys.AlwaysOnTop;
        v13.ZIndex = 1;
        v13.Adornee = l_Terrain_0;
        v13.Parent = l_Terrain_0;
        l_Ceive_0.ActiveInstances = l_Ceive_0.ActiveInstances + 1;
        v9.Register(v13);
        v9.Ceive.ScheduleCleaning();
        return;
    end;
end;
v1.Create = function(v14, v15, v16) --[[ Line: 43 ]] --[[ Name: Create ]]
    local v17 = {
        Transform = v15, 
        Radius = v16, 
        AlwaysOnTop = v14.Propertys.AlwaysOnTop, 
        Transparency = v14.Propertys.Transparency, 
        Color3 = v14.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v14:Retain(v17);
    return v17;
end;
v1.Update = function(v18, v19) --[[ Line: 59 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v18.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v19.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v19.Transparency);
    l_Ceive_1.PushProperty("Color3", v19.Color3);
    v18:Draw(v19.Transform, v19.Radius);
end;
return v1;