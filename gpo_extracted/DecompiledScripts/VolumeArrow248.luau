local v0 = {};
v0.__index = v0;
v0.Init = function(v1, v2, v3, v4, v5, v6) --[[ Line: 4 ]] --[[ Name: Init ]]
    -- upvalues: v0 (copy)
    local v7 = setmetatable({}, v0);
    v7.Ceive = v1;
    v7.Propertys = v2;
    v7.Request = v3;
    v7.Release = v4;
    v7.Retain = v5;
    v7.Register = v6;
    return v7;
end;
v0.Draw = function(v8, v9, v10, v11, v12, v13, v14) --[[ Line: 17 ]] --[[ Name: Draw ]]
    local l_Ceive_0 = v8.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        local v16 = CFrame.lookAt(v10 - (v10 - v9).Unit * (v13 * 0.5), v10);
        if v14 == true then
            local l_Position_0 = v16.Position;
            local l_Magnitude_0 = (l_Position_0 - v9).Magnitude;
            local v19 = CFrame.lookAt((v9 + l_Position_0) * 0.5, v10);
            l_Ceive_0.VolumeCylinder:Draw(v19, v11, l_Magnitude_0);
        else
            l_Ceive_0.Ray:Draw(v9, v10);
        end;
        l_Ceive_0.VolumeCone:Draw(v16, v12, v13);
        v8.Ceive.ScheduleCleaning();
        return;
    end;
end;
v0.Create = function(v20, v21, v22, v23, v24, v25, v26) --[[ Line: 40 ]] --[[ Name: Create ]]
    local v27 = {
        Origin = v21, 
        End = v22, 
        CylinderRadius = v23, 
        ConeRadius = v24, 
        Length = v25, 
        UseCylinder = v26, 
        AlwaysOnTop = v20.Propertys.AlwaysOnTop, 
        Transparency = v20.Propertys.Transparency, 
        Color3 = v20.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v20:Retain(v27);
    return v27;
end;
v0.Update = function(v28, v29) --[[ Line: 60 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v28.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v29.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v29.Transparency);
    l_Ceive_1.PushProperty("Color3", v29.Color3);
    v28:Draw(v29.Origin, v29.End, v29.Radius, v29.Length, v29.UseCylinder);
end;
return v0;