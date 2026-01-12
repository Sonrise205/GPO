return function(v0) --[[ Line: 1 ]]
    for _, v2 in v0:GetDescendants() do
        if v2:IsA("ParticleEmitter") then
            v2.TimeScale = v2:GetAttribute("TimeScale") or 1;
        end;
    end;
end;