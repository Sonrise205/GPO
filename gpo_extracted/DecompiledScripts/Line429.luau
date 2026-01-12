local v0 = {};
v0.__index = v0;
v0.Init = function(v1, v2, v3, v4, v5) --[[ Line: 4 ]] --[[ Name: Init ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    v6.Ceive = v1;
    v6.Propertys = v2;
    v6.Request = v3;
    v6.Release = v4;
    v6.Retain = v5;
    return v6;
end;
v0.Draw = function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: Draw ]]
    local l_Ceive_0 = v7.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        local v11 = v8.Position + v8.LookVector * (-v9 * 0.5);
        local v12 = v8.Position + v8.LookVector * (v9 * 0.5);
        l_Ceive_0.Ray:Draw(v11, v12);
        return;
    end;
end;
v0.Create = function(v13, v14, v15) --[[ Line: 29 ]] --[[ Name: Create ]]
    local v16 = {
        Transform = v14, 
        Length = v15, 
        AlwaysOnTop = v13.Propertys.AlwaysOnTop, 
        Transparency = v13.Propertys.Transparency, 
        Color3 = v13.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v13:Retain(v16);
    return v16;
end;
v0.Update = function(v17, v18) --[[ Line: 45 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v17.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v18.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v18.Transparency);
    l_Ceive_1.PushProperty("Color3", v18.Color3);
    v17:Draw(v18.Transform, v18.Length);
end;
return v0;