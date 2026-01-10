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
v1.Draw = function(v9, v10, v11, v12) --[[ Line: 19 ]] --[[ Name: Draw ]]
    -- upvalues: l_Terrain_0 (copy)
    local l_Ceive_0 = v9.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        local v14 = v9.Request("ConeHandleAdornment");
        v14.Color3 = v9.Propertys.Color3;
        v14.Transparency = v9.Propertys.Transparency;
        v14.CFrame = v10;
        v14.AlwaysOnTop = v9.Propertys.AlwaysOnTop;
        v14.ZIndex = 1;
        v14.Height = v12;
        v14.Radius = v11;
        v14.Adornee = l_Terrain_0;
        v14.Parent = l_Terrain_0;
        l_Ceive_0.ActiveInstances = l_Ceive_0.ActiveInstances + 1;
        v9.Register(v14);
        v9.Ceive.ScheduleCleaning();
        return;
    end;
end;
v1.Create = function(v15, v16, v17, v18) --[[ Line: 44 ]] --[[ Name: Create ]]
    local v19 = {
        Transform = v16, 
        Radius = v17, 
        Length = v18, 
        AlwaysOnTop = v15.Propertys.AlwaysOnTop, 
        Transparency = v15.Propertys.Transparency, 
        Color3 = v15.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v15:Retain(v19);
    return v19;
end;
v1.Update = function(v20, v21) --[[ Line: 61 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v20.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v21.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v21.Transparency);
    l_Ceive_1.PushProperty("Color3", v21.Color3);
    v20:Draw(v21.Transform, v21.Radius, v21.Length);
end;
return v1;