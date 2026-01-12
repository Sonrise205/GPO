local l_TweenService_0 = game:GetService("TweenService");
return function(v1, v2, v3) --[[ Line: 3 ]]
    -- upvalues: l_TweenService_0 (copy)
    for _, v5 in v1:GetDescendants() do
        if v5:IsA("ParticleEmitter") then
            v5:SetAttribute("TimeScale", v5.TimeScale);
            l_TweenService_0:Create(v5, v2, {
                TimeScale = v3
            }):Play();
        end;
    end;
end;