return function(v0) --[[ Line: 1 ]]
    local v1 = 900;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    if l_FirstChild_0 then
        v1 = v1 + l_FirstChild_0.Stats.FightingStyleMastery.Value * 1.25;
    end;
    return v1;
end;