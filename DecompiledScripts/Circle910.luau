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
        local v14 = math.floor(v11 / v10);
        local v15 = nil;
        local v16 = nil;
        local v17 = 0;
        for v18 = 0, v11, v14 do
            local v19 = math.sin((math.rad(v18))) * v9;
            local v20 = math.cos((math.rad(v18))) * v9;
            local v21 = v8.Position + (v8.UpVector * v20 + v8.RightVector * v19);
            if v15 == nil then
                v15 = v21;
                v16 = v21;
                v17 = v18;
            else
                l_Ceive_0.Ray:Draw(v15, v21);
                v15 = v21;
                v17 = v18;
            end;
        end;
        if v17 ~= v11 then
            local v22 = math.sin((math.rad(v11))) * v9;
            local v23 = math.cos((math.rad(v11))) * v9;
            local v24 = v8.Position + (v8.UpVector * v23 + v8.RightVector * v22);
            l_Ceive_0.Ray:Draw(v15, v24);
        end;
        if v12 ~= false then
            l_Ceive_0.Ray:Draw(v15, v16);
        end;
        return v15;
    end;
end;
v0.Create = function(v25, v26, v27, v28, v29, v30) --[[ Line: 64 ]] --[[ Name: Create ]]
    local v31 = {
        Transform = v26, 
        Radius = v27, 
        Subdivisions = v28, 
        Angle = v29, 
        ConnectToStart = v30, 
        AlwaysOnTop = v25.Propertys.AlwaysOnTop, 
        Transparency = v25.Propertys.Transparency, 
        Color3 = v25.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v25:Retain(v31);
    return v31;
end;
v0.Update = function(v32, v33) --[[ Line: 83 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v32.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v33.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v33.Transparency);
    l_Ceive_1.PushProperty("Color3", v33.Color3);
    v32:Draw(v33.Transform, v33.Radius, v33.Subdivisions, v33.Angle, v33.ConnectToStart);
end;
return v0;