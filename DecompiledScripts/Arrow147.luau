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
v0.Draw = function(v7, v8, v9, v10, v11, v12) --[[ Line: 16 ]] --[[ Name: Draw ]]
    local l_Ceive_0 = v7.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        l_Ceive_0.Ray:Draw(v8, v9);
        local v14 = CFrame.lookAt(v9 + (v8 - v9).Unit * (v11 * 0.5), v9);
        l_Ceive_0.Cone:Draw(v14, v10, v11, v12);
        return;
    end;
end;
v0.Create = function(v15, v16, v17, v18, v19, v20) --[[ Line: 29 ]] --[[ Name: Create ]]
    local v21 = {
        Origin = v16, 
        End = v17, 
        Radius = v18, 
        Length = v19, 
        Subdivisions = v20, 
        AlwaysOnTop = v15.Propertys.AlwaysOnTop, 
        Transparency = v15.Propertys.Transparency, 
        Color3 = v15.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v15:Retain(v21);
    return v21;
end;
v0.Update = function(v22, v23) --[[ Line: 48 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v22.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v23.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v23.Transparency);
    l_Ceive_1.PushProperty("Color3", v23.Color3);
    v22:Draw(v23.Origin, v23.End, v23.Radius, v23.Length, v23.Subdivisions);
end;
return v0;