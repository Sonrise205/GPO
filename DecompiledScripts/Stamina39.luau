local v0 = {};
local function _(v1) --[[ Line: 3 ]] --[[ Name: removeNumbersFromString ]]
    return (v1:gsub("%d", ""));
end;
local _ = {
    Dullahan = 1.15, 
    Mink = 1.1
};
v0.Apply = function(_, v5) --[[ Line: 14 ]] --[[ Name: Apply ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v5.Name);
    local l_Character_0 = v5.Character;
    if l_Character_0 and l_Character_0:FindFirstChild("Humanoid") then
        local v8 = math.clamp(l_FirstChild_0.Stats.Level.Value, 0, 100);
        local v9 = 100 + l_FirstChild_0.Stats.Stamina.Value * script.stat.Value + v8;
        local v10 = false;
        if l_FirstChild_0.Stamina.Value >= l_FirstChild_0.Stamina.MaxValue then
            v10 = true;
        end;
        local v11 = l_FirstChild_0.Customization.Race.Value:gsub("%d", "");
        if _G.BattleRoyale == nil then
            if l_FirstChild_0 and v11 == "Mink" then
                v9 = v9 * 1.1;
            end;
            if v11 == "Cyborg" and l_FirstChild_0.Skills.CyborgUpgrade.Value == "Stamina" then
                v9 = v9 * 1.1;
            end;
            if v11 == "Dullahan" then
                v9 = v9 * 1.15;
            end;
        end;
        v9 = v9 + l_Character_0.Boosts.MaxStam.Value;
        l_FirstChild_0.Stamina.MaxValue = v9;
        if v10 == true then
            l_FirstChild_0.Stamina.Value = v9;
        end;
    end;
end;
return v0;