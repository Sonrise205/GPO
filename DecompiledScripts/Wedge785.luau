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
v0.Draw = function(v7, v8, v9, v10) --[[ Line: 16 ]] --[[ Name: Draw ]]
    local l_Ceive_0 = v7.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        local l_Position_0 = v8.Position;
        local l_UpVector_0 = v8.UpVector;
        local l_RightVector_0 = v8.RightVector;
        local l_LookVector_0 = v8.LookVector;
        local v16 = v9 * 0.5;
        local v17 = l_UpVector_0 * v16.Y;
        local v18 = l_RightVector_0 * v16.X;
        local v19 = l_LookVector_0 * v16.Z;
        local v20 = nil;
        local v21 = nil;
        local v22 = nil;
        local v23 = nil;
        local function v31(v24, v25, v26) --[[ Line: 38 ]] --[[ Name: CalculateYFace ]]
            -- upvalues: l_Position_0 (copy), v20 (ref), v21 (ref), l_Ceive_0 (copy), v10 (copy)
            local v27 = l_Position_0 + (v24 - v25 + v26);
            local v28 = l_Position_0 + (v24 + v25 + v26);
            local v29 = l_Position_0 + (v24 - v25 - v26);
            local v30 = l_Position_0 + (v24 + v25 - v26);
            v20 = v27;
            v21 = v28;
            l_Ceive_0.Ray:Draw(v27, v28);
            l_Ceive_0.Ray:Draw(v27, v29);
            l_Ceive_0.Ray:Draw(v28, v30);
            if v10 ~= false then
                l_Ceive_0.Ray:Draw(v28, v29);
            end;
            l_Ceive_0.Ray:Draw(v29, v30);
        end;
        local function v39(v32, v33, v34) --[[ Line: 58 ]] --[[ Name: CalculateZFace ]]
            -- upvalues: l_Position_0 (copy), v22 (ref), v23 (ref), l_Ceive_0 (copy), v10 (copy)
            local v35 = l_Position_0 + (v32 - v33 + v34);
            local v36 = l_Position_0 + (v32 + v33 + v34);
            local v37 = l_Position_0 + (-v32 - v33 + v34);
            local v38 = l_Position_0 + (-v32 + v33 + v34);
            v22 = v35;
            v23 = v36;
            l_Ceive_0.Ray:Draw(v35, v36);
            l_Ceive_0.Ray:Draw(v35, v37);
            l_Ceive_0.Ray:Draw(v36, v38);
            if v10 ~= false then
                l_Ceive_0.Ray:Draw(v36, v37);
            end;
            l_Ceive_0.Ray:Draw(v37, v38);
        end;
        v31(-v17, v18, v19);
        v39(v17, v18, -v19);
        l_Ceive_0.Ray:Draw(v20, v22);
        l_Ceive_0.Ray:Draw(v21, v23);
        if v10 ~= false then
            l_Ceive_0.Ray:Draw(v21, v22);
        end;
        return;
    end;
end;
v0.Create = function(v40, v41, v42, v43) --[[ Line: 89 ]] --[[ Name: Create ]]
    local v44 = {
        Transform = v41, 
        Size = v42, 
        DrawTriangles = v43, 
        AlwaysOnTop = v40.Propertys.AlwaysOnTop, 
        Transparency = v40.Propertys.Transparency, 
        Color3 = v40.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v40:Retain(v44);
    return v44;
end;
v0.Update = function(v45, v46) --[[ Line: 106 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v45.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v46.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v46.Transparency);
    l_Ceive_1.PushProperty("Color3", v46.Color3);
    v45:Draw(v46.Transform, v46.Size, v46.DrawTriangles);
end;
return v0;