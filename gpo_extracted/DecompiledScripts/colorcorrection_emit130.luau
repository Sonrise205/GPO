local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
local l_Lighting_0 = game:GetService("Lighting");
return function(v3, v4, v5, v6, v7) --[[ Line: 5 ]]
    -- upvalues: l_Lighting_0 (copy), l_TweenService_0 (copy), l_Debris_0 (copy)
    local v8 = v7 or 0.2;
    local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_0.Brightness = v3;
    l_ColorCorrectionEffect_0.Saturation = v4;
    l_ColorCorrectionEffect_0.Contrast = v5;
    l_ColorCorrectionEffect_0.TintColor = v6 or Color3.fromRGB(255, 255, 255);
    l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
    local v10 = TweenInfo.new(v8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v11 = {
        Brightness = 0, 
        Saturation = 0, 
        Contrast = 0, 
        TintColor = Color3.fromRGB(255, 255, 255)
    };
    l_TweenService_0:Create(l_ColorCorrectionEffect_0, v10, v11):Play();
    l_Debris_0:AddItem(l_ColorCorrectionEffect_0, v8);
end;