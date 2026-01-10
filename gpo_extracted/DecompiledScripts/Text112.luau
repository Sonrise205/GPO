local l_CurrentCamera_0 = workspace.CurrentCamera;
local v1 = {};
v1.__index = v1;
v1.Init = function(v2, v3, v4, v5, v6) --[[ Line: 9 ]] --[[ Name: Init ]]
    -- upvalues: v1 (copy)
    local v7 = setmetatable({}, v1);
    v7.Ceive = v2;
    v7.Propertys = v3;
    v7.Request = v4;
    v7.Release = v5;
    v7.Retain = v6;
    return v7;
end;
v1.Draw = function(v8, v9, v10, v11) --[[ Line: 21 ]] --[[ Name: Draw ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    local l_Ceive_0 = v8.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        if v8.Propertys.AlwaysOnTop then
            local l_Magnitude_0 = (v9 - l_CurrentCamera_0.CFrame.Position).Magnitude;
            local v14 = l_Ceive_0.PopProperty("Color3");
            l_Ceive_0.PushProperty("Color3", Color3.new());
            local v15 = -Vector3.new(1, 1, 0, 0).Unit;
            l_Ceive_0.AOTWireframeHandle:AddText(v9 + v15 * (l_Magnitude_0 * 0.00175), v10, v11);
            l_Ceive_0.PushProperty("Color3", v14);
            l_Ceive_0.AOTWireframeHandle:AddText(v9, v10, v11);
        else
            local l_Magnitude_1 = (v9 - l_CurrentCamera_0.CFrame.Position).Magnitude;
            local v17 = l_Ceive_0.PopProperty("Color3");
            l_Ceive_0.PushProperty("Color3", Color3.new());
            local v18 = -Vector3.new(1, 1, 0, 0).Unit;
            l_Ceive_0.WireframeHandle:AddText(v9 + v18 * (l_Magnitude_1 * 0.00175), v10, v11);
            l_Ceive_0.PushProperty("Color3", v17);
            l_Ceive_0.WireframeHandle:AddText(v9, v10, v11);
        end;
        v8.Ceive.ScheduleCleaning();
        return;
    end;
end;
v1.Create = function(v19, v20, v21, v22) --[[ Line: 60 ]] --[[ Name: Create ]]
    local v23 = {
        Origin = v20, 
        Text = v21, 
        Size = v22, 
        AlwaysOnTop = v19.Propertys.AlwaysOnTop, 
        Transparency = v19.Propertys.Transparency, 
        Color3 = v19.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v19:Retain(v23);
    return v23;
end;
v1.Update = function(v24, v25) --[[ Line: 77 ]] --[[ Name: Update ]]
    local l_Ceive_1 = v24.Ceive;
    l_Ceive_1.PushProperty("AlwaysOnTop", v25.AlwaysOnTop);
    l_Ceive_1.PushProperty("Transparency", v25.Transparency);
    l_Ceive_1.PushProperty("Color3", v25.Color3);
    v24:Draw(v25.Origin, v25.Text, v25.Size);
end;
return v1;