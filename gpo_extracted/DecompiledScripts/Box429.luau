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
        local function v27(v20, v21, v22) --[[ Line: 32 ]] --[[ Name: CalculateYFace ]]
            -- upvalues: l_Position_0 (copy), l_Ceive_0 (copy), v10 (copy)
            local v23 = l_Position_0 + (v20 - v21 + v22);
            local v24 = l_Position_0 + (v20 + v21 + v22);
            local v25 = l_Position_0 + (v20 - v21 - v22);
            local v26 = l_Position_0 + (v20 + v21 - v22);
            l_Ceive_0.Ray:Draw(v23, v24);
            l_Ceive_0.Ray:Draw(v23, v25);
            l_Ceive_0.Ray:Draw(v24, v26);
            if v10 ~= false then
                l_Ceive_0.Ray:Draw(v24, v25);
            end;
            l_Ceive_0.Ray:Draw(v25, v26);
        end;
        local function v35(v28, v29, v30) --[[ Line: 49 ]] --[[ Name: CalculateZFace ]]
            -- upvalues: l_Position_0 (copy), l_Ceive_0 (copy), v10 (copy)
            local v31 = l_Position_0 + (v28 - v29 + v30);
            local v32 = l_Position_0 + (v28 + v29 + v30);
            local v33 = l_Position_0 + (-v28 - v29 + v30);
            local v34 = l_Position_0 + (-v28 + v29 + v30);
            l_Ceive_0.Ray:Draw(v31, v32);
            l_Ceive_0.Ray:Draw(v31, v33);
            l_Ceive_0.Ray:Draw(v32, v34);
            if v10 ~= false then
                l_Ceive_0.Ray:Draw(v32, v33);
            end;
            l_Ceive_0.Ray:Draw(v33, v34);
        end;
        local function v43(v36, v37, v38) --[[ Line: 66 ]] --[[ Name: CalculateXFace ]]
            -- upvalues: l_Position_0 (copy), l_Ceive_0 (copy), v10 (copy)
            local v39 = l_Position_0 + (v36 - v37 - v38);
            local v40 = l_Position_0 + (v36 - v37 + v38);
            local v41 = l_Position_0 + (-v36 - v37 - v38);
            local v42 = l_Position_0 + (-v36 - v37 + v38);
            l_Ceive_0.Ray:Draw(v39, v40);
            l_Ceive_0.Ray:Draw(v39, v41);
            l_Ceive_0.Ray:Draw(v40, v42);
            if v10 ~= false then
                l_Ceive_0.Ray:Draw(v40, v41);
            end;
            l_Ceive_0.Ray:Draw(v41, v42);
        end;
        v43(v17, v18, v19);
        v43(v17, -v18, v19);
        v27(v17, v18, v19);
        v27(-v17, v18, v19);
        v35(v17, v18, v19);
        v35(v17, v18, -v19);
        return;
    end;
end;
v0.Create = function(v44, v45, v46, v47) --[[ Line: 93 ]] --[[ Name: Create ]]
    local v48 = {
        Transform = v45, 
        Size = v46, 
        DrawTriangles = v47, 
        AlwaysOnTop = v44.Propertys.AlwaysOnTop, 
        Transparency = v44.Propertys.Transparency, 
        Color3 = v44.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v44:Retain(v48);
    return v48;
end;
v0.Update = function(v49, v50) --[[ Line: 110 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v49.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v50.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v50.Transparency);
    l_Ceive_1.PushProperty("Color3", v50.Color3);
    v49:Draw(v50.Transform, v50.Size, v50.DrawTriangles);
end;
return v0;