return function(v0) --[[ Line: 1 ]]
    local v1 = 700;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    if l_FirstChild_0 then
        v1 = v1 + l_FirstChild_0.Stats.Strength.Value * 1.1;
    end;
    return v1;
end;