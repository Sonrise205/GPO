return function(v0) --[[ Line: 1 ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    local v2 = 900;
    if l_FirstChild_0 then
        v2 = v2 + l_FirstChild_0.Stats.DevilFruitMastery.Value * 1.3;
    end;
    return v2;
end;