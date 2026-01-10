local v0 = {};
v0.__index = v0;
v0.Init = function(v1, v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: Init ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    v6.Ceive = v1;
    v6.Propertys = v2;
    v6.Request = v3;
    v6.Release = v4;
    v6.Retain = v5;
    return v6;
end;
v0.Draw = function(v7, v8, v9, v10, v11) --[[ Line: 18 ]] --[[ Name: Draw ]]
    local l_Ceive_0 = v7.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        l_Ceive_0.Circle:Draw(v8, v9, v10, v11);
        l_Ceive_0.Circle:Draw(v8 * CFrame.Angles(0, 1.5707963267948966, 0), v9, v10, v11);
        l_Ceive_0.Circle:Draw(v8 * CFrame.Angles(1.5707963267948966, 0, 0), v9, v10, v11);
        return;
    end;
end;
v0.Create = function(v13, v14, v15, v16, v17) --[[ Line: 30 ]] --[[ Name: Create ]]
    local v18 = {
        Transform = v14, 
        Radius = v15, 
        Subdivisions = v16, 
        Angle = v17, 
        AlwaysOnTop = v13.Propertys.AlwaysOnTop, 
        Transparency = v13.Propertys.Transparency, 
        Color3 = v13.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v13:Retain(v18);
    return v18;
end;
v0.Update = function(v19, v20) --[[ Line: 48 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v19.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v20.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v20.Transparency);
    l_Ceive_1.PushProperty("Color3", v20.Color3);
    v19:Draw(v20.Transform, v20.Radius, v20.Subdivisions, v20.Angle);
end;
return v0;