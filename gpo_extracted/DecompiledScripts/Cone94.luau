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
        v8 = v8 * CFrame.Angles(-1.5707963267948966, 0, 0);
        local v13 = v8.Position + v8.UpVector * (v10 * 0.5);
        local v14 = v8.Position + -v8.UpVector * (v10 * 0.5);
        v13 = CFrame.lookAt(v13, v13 + v8.UpVector);
        v14 = CFrame.lookAt(v14, v14 - v8.UpVector);
        local v15 = math.floor(360 / v11);
        local v16 = nil;
        local v17 = nil;
        for v18 = 0, 360, v15 do
            local v19 = math.sin((math.rad(v18))) * v9;
            local v20 = math.cos((math.rad(v18))) * v9;
            local v21 = v8.LookVector * v20 + v8.RightVector * v19;
            local v22 = v14.Position + v21;
            if not v16 then
                v16 = v22;
                v17 = v22;
                l_Ceive_0.Ray:Draw(v22, v13.Position);
            else
                l_Ceive_0.Ray:Draw(v22, v13.Position);
                l_Ceive_0.Ray:Draw(v16, v22);
                v16 = v22;
            end;
        end;
        l_Ceive_0.Ray:Draw(v16, v17);
        return;
    end;
end;
v0.Create = function(v23, v24, v25, v26, v27) --[[ Line: 63 ]] --[[ Name: Create ]]
    local v28 = {
        Transform = v24, 
        Radius = v25, 
        Length = v26, 
        Subdivisions = v27, 
        AlwaysOnTop = v23.Propertys.AlwaysOnTop, 
        Transparency = v23.Propertys.Transparency, 
        Color3 = v23.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v23:Retain(v28);
    return v28;
end;
v0.Update = function(v29, v30) --[[ Line: 81 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v29.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v30.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v30.Transparency);
    l_Ceive_1.PushProperty("Color3", v30.Color3);
    v29:Draw(v30.Transform, v30.Radius, v30.Length, v30.Subdivisions);
end;
return v0;