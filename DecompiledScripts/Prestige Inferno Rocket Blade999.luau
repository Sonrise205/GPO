return function(v0) --[[ Line: 1 ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    local v2 = 800;
    if l_FirstChild_0 then
        v2 = math.ceil(150 + l_FirstChild_0.Stats.Defense.Value * 0.75 + l_FirstChild_0.Stats.GunMastery.Value * 1.25);
    end;
    return v2;
end;