return function(v0) --[[ Line: 1 ]]
    if v0:IsA("ParticleEmitter") or v0:IsA("Trail") or v0:IsA("Beam") then
        v0.Enabled = true;
    end;
    for _, v2 in v0:GetDescendants() do
        if v2:IsA("ParticleEmitter") or v2:IsA("Trail") or v2:IsA("Beam") then
            v2.Enabled = true;
        end;
    end;
end;