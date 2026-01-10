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
        local v13 = v8.Position + v8.UpVector * (v10 * 0.5);
        local v14 = v8.Position - v8.UpVector * (v10 * 0.5);
        v13 = CFrame.lookAt(v13, v13 + v8.UpVector);
        v14 = CFrame.lookAt(v14, v14 - v8.UpVector);
        local v15 = math.floor(360 / v11);
        local v16 = nil;
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        for v20 = 0, 360, v15 do
            local v21 = math.sin((math.rad(v20))) * v9;
            local v22 = math.cos((math.rad(v20))) * v9;
            local v23 = v8.LookVector * v22 + v8.RightVector * v21;
            local v24 = v13.Position + v23;
            local v25 = v14.Position + v23;
            l_Ceive_0.Ray:Draw(v24, v25);
            l_Ceive_0.Circle:Draw(CFrame.new(v13.Position) * v8.Rotation * CFrame.Angles(0, math.rad(v20), 0), v9, v11 * 0.5, 90, false);
            l_Ceive_0.Circle:Draw(CFrame.new(v14.Position) * v8.Rotation * CFrame.Angles(3.141592653589793, math.rad(v20), 0), v9, v11 * 0.5, 90, false);
            if not v16 then
                v16 = v24;
                v17 = v25;
                v18 = v24;
                v19 = v25;
            else
                l_Ceive_0.Ray:Draw(v16, v24);
                l_Ceive_0.Ray:Draw(v17, v25);
                v16 = v24;
                v17 = v25;
            end;
        end;
        l_Ceive_0.Ray:Draw(v16, v18);
        l_Ceive_0.Ray:Draw(v17, v19);
        return;
    end;
end;
v0.Create = function(v26, v27, v28, v29, v30) --[[ Line: 88 ]] --[[ Name: Create ]]
    local v31 = {
        Transform = v27, 
        Radius = v28, 
        Length = v29, 
        Subdivisions = v30, 
        AlwaysOnTop = v26.Propertys.AlwaysOnTop, 
        Transparency = v26.Propertys.Transparency, 
        Color3 = v26.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v26:Retain(v31);
    return v31;
end;
v0.Update = function(v32, v33) --[[ Line: 106 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v32.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v33.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v33.Transparency);
    l_Ceive_1.PushProperty("Color3", v33.Color3);
    v32:Draw(v33.Transform, v33.Radius, v33.Length, v33.Subdivisions);
end;
return v0;