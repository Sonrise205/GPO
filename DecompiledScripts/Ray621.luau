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
v0.Draw = function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: Draw ]]
    local l_Ceive_0 = v7.Ceive;
    if not l_Ceive_0.Enabled then
        return;
    else
        if v7.Propertys.AlwaysOnTop then
            l_Ceive_0.AOTWireframeHandle:AddLine(v8, v9);
        else
            l_Ceive_0.WireframeHandle:AddLine(v8, v9);
        end;
        local l_Ceive_1 = v7.Ceive;
        l_Ceive_1.ActiveRays = l_Ceive_1.ActiveRays + 1;
        v7.Ceive.ScheduleCleaning();
        return;
    end;
end;
v0.Create = function(v12, v13, v14) --[[ Line: 34 ]] --[[ Name: Create ]]
    local v15 = {
        Origin = v13, 
        End = v14, 
        AlwaysOnTop = v12.Propertys.AlwaysOnTop, 
        Transparency = v12.Propertys.Transparency, 
        Color3 = v12.Propertys.Color3, 
        Enabled = true, 
        Destroy = false
    };
    v12:Retain(v15);
    return v15;
end;
v0.Update = function(v16, v17) --[[ Line: 50 ]] --[[ Name: Update ]]
    local l_Ceive_2 = v16.Ceive;
    l_Ceive_2.PushProperty("AlwaysOnTop", v17.AlwaysOnTop);
    l_Ceive_2.PushProperty("Transparency", v17.Transparency);
    l_Ceive_2.PushProperty("Color3", v17.Color3);
    v16:Draw(v17.Origin, v17.End);
end;
return v0;