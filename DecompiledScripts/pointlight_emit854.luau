local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
return function(v2, v3, v4, v5, v6, v7) --[[ Line: 4 ]]
    -- upvalues: l_TweenService_0 (copy), l_Debris_0 (copy)
    local v8 = v4 or 1;
    local l_PointLight_0 = Instance.new("PointLight");
    l_PointLight_0.Enabled = true;
    l_PointLight_0.Color = v3 or Color3.fromRGB(105, 195, 255);
    l_PointLight_0.Range = v5 or 10;
    l_PointLight_0.Brightness = v7 or 2;
    l_PointLight_0.Shadows = false;
    l_PointLight_0.Parent = v2;
    local v10 = TweenInfo.new(v8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v11 = {
        Brightness = 0, 
        Range = v6 or (v5 or 10) * 1.5
    };
    l_TweenService_0:Create(l_PointLight_0, v10, v11):Play();
    l_Debris_0:AddItem(l_PointLight_0, v8);
    return l_PointLight_0;
end;