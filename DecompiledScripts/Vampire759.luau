return function(v0) --[[ Line: 1 ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    local v2 = 800;
    if l_FirstChild_0 then
        v2 = 800 + l_FirstChild_0.Stats.FightingStyleMastery.Value * 1.5;
    end;
    return v2;
end;