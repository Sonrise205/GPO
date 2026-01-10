local function _(v0, v1, v2, v3, v4) --[[ Line: 1 ]] --[[ Name: Map ]]
    return (v0 - v1) / (v2 - v1) * (v4 - v3) + v3;
end;
local v6 = {};
v6.__index = v6;
v6.Init = function(v7, v8, v9, v10, v11) --[[ Line: 8 ]] --[[ Name: Init ]]
    -- upvalues: v6 (copy)
    local v12 = setmetatable({}, v6);
    v12.Ceive = v7;
    v12.Propertys = v8;
    v12.Request = v9;
    v12.Release = v10;
    v12.Retain = v11;
    return v12;
end;
v6.Draw = function(v13, v14, v15, v16, v17) --[[ Line: 20 ]] --[[ Name: Draw ]]
    local l_Ceive_0 = v13.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        local v19 = -1e999;
        local v20 = -1e999;
        local v21 = -1e999;
        local v22 = 1e999;
        local v23 = 1e999;
        local v24 = 1e999;
        for _, v26 in v16 do
            v19 = math.max(v19, v26.x);
            v20 = math.max(v20, v26.y);
            v21 = math.max(v21, v26.z);
            v22 = math.min(v22, v26.x);
            v23 = math.min(v23, v26.y);
            v24 = math.min(v24, v26.z);
        end;
        for v27, v28 in v16 do
            local l_x_0 = v28.x;
            local l_v22_0 = v22;
            local v31 = (l_x_0 - l_v22_0) / (v19 - l_v22_0) * 1 + -0.5;
            l_v22_0 = v28.y;
            local l_v23_0 = v23;
            l_x_0 = (l_v22_0 - l_v23_0) / (v20 - l_v23_0) * 1 + -0.5;
            l_v23_0 = v28.z;
            local l_v24_0 = v24;
            l_v22_0 = (l_v23_0 - l_v24_0) / (v21 - l_v24_0) * 1 + -0.5;
            v16[v27] = v14 * CFrame.new(Vector3.new(v31, l_x_0, l_v22_0) * v15);
        end;
        for _, v35 in v17 do
            if #v35 == 3 then
                local v36 = v16[v35[1].v];
                local v37 = v16[v35[2].v];
                local v38 = v16[v35[3].v];
                l_Ceive_0.Ray:Draw(v36.Position, v37.Position);
                l_Ceive_0.Ray:Draw(v37.Position, v38.Position);
                l_Ceive_0.Ray:Draw(v38.Position, v36.Position);
            else
                local v39 = v16[v35[1].v];
                local v40 = v16[v35[2].v];
                local v41 = v16[v35[3].v];
                local v42 = v16[v35[4].v];
                l_Ceive_0.Ray:Draw(v39.Position, v40.Position);
                l_Ceive_0.Ray:Draw(v39.Position, v42.Position);
                l_Ceive_0.Ray:Draw(v42.Position, v40.Position);
                l_Ceive_0.Ray:Draw(v41.Position, v42.Position);
                l_Ceive_0.Ray:Draw(v40.Position, v41.Position);
            end;
        end;
        return;
    end;
end;
v6.Create = function(v43, v44, v45, v46, v47) --[[ Line: 79 ]] --[[ Name: Create ]]
    local v48 = {
        Transform = v44, 
        Size = v45, 
        Vertices = v46, 
        Faces = v47, 
        AlwaysOnTop = v43.Propertys.AlwaysOnTop, 
        Transparency = v43.Propertys.Transparency, 
        Color3 = v43.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v43:Retain(v48);
    return v48;
end;
v6.Update = function(v49, v50) --[[ Line: 97 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v49.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v50.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v50.Transparency);
    l_Ceive_1.PushProperty("Color3", v50.Color3);
    v49:Draw(v50.Transform, v50.Size, v50.Vertices, v50.Faces);
end;
return v6;