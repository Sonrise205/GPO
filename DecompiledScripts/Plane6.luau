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
        v10 = v10 * Vector3.new(1, 1, 0, 0);
        local v12 = CFrame.lookAt(v8, v8 + v9);
        local l_UpVector_0 = v12.UpVector;
        local l_RightVector_0 = v12.RightVector;
        local l_LookVector_0 = v12.LookVector;
        local v16 = v10 * 0.5;
        (function(v17, v18, v19) --[[ Line: 35 ]] --[[ Name: CalculateZFace ]]
            -- upvalues: v8 (copy), l_Ceive_0 (copy)
            local v20 = v8 + (v17 - v18 + v19);
            local v21 = v8 + (v17 + v18 + v19);
            local v22 = v8 + (-v17 - v18 + v19);
            local v23 = v8 + (-v17 + v18 + v19);
            l_Ceive_0.Ray:Draw(v20, v21);
            l_Ceive_0.Ray:Draw(v20, v22);
            l_Ceive_0.Ray:Draw(v21, v23);
            l_Ceive_0.Ray:Draw(v21, v22);
            l_Ceive_0.Ray:Draw(v22, v23);
        end)(l_UpVector_0 * v16.Y, l_RightVector_0 * v16.X, l_LookVector_0 * v16.Z);
        return;
    end;
end;
v0.Create = function(v24, v25, v26, v27) --[[ Line: 53 ]] --[[ Name: Create ]]
    local v28 = {
        Position = v25, 
        Normal = v26, 
        Size = v27, 
        AlwaysOnTop = v24.Propertys.AlwaysOnTop, 
        Transparency = v24.Propertys.Transparency, 
        Color3 = v24.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v24:Retain(v28);
    return v28;
end;
v0.Update = function(v29, v30) --[[ Line: 70 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v29.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v30.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v30.Transparency);
    l_Ceive_1.PushProperty("Color3", v30.Color3);
    v29:Draw(v30.Position, v30.Normal, v30.Size);
end;
return v0;