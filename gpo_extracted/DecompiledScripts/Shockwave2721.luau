local v0 = {};
local l_Things_0 = script.Parent.Parent.Things;
v0.start = function(_, v3, v4, v5, v6, v7, v8, v9, _, v11, v12, v13) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: l_Things_0 (copy)
    local v14 = l_Things_0.Part:Clone();
    if v13 then
        v14:Destroy();
        v14 = l_Things_0[v13]:Clone();
    end;
    v14.CFrame = v3;
    if v12 then
        v14.Material = v12;
    end;
    if v4 then
        v14.CFrame = v4;
    end;
    if typeof(v5) == "BrickColor" then
        v14.BrickColor = v5;
    else
        v14.Color = v5;
    end;
    if v7 then
        v14.Size = v7;
    end;
    if v9 == nil then
        v9 = 0;
    end;
    v14.Transparency = v9;
    _G.destroy(v14, v8);
    local v15 = {
        Size = v6, 
        CFrame = v3, 
        Transparency = 1
    };
    if v11 then
        v15.Color = v11;
    end;
    v14.Parent = workspace.Effects;
    _G.tween(v14, {
        v8, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, v15);
    return v14;
end;
return v0;