local v0 = {};
local function _(v1) --[[ Line: 3 ]] --[[ Name: removeNumbersFromString ]]
    return (v1:gsub("%d", ""));
end;
local v3 = {
    Vampire = 0.1
};
v0.Apply = function(_, v5) --[[ Line: 12 ]] --[[ Name: Apply ]]
    -- upvalues: v3 (copy)
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v5.Name);
    local l_Character_0 = v5.Character;
    if l_Character_0 and l_Character_0:FindFirstChild("Humanoid") then
        local v8 = math.clamp(l_FirstChild_0.Stats.Level.Value * 1, 0, 100);
        local v9 = 100 + l_FirstChild_0.Stats.Defense.Value * script.stat.Value + v8;
        local v10 = false;
        local l_Humanoid_0 = l_Character_0.Humanoid;
        local v12 = l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth;
        if l_Humanoid_0.Health ~= 0 and l_Humanoid_0.Health >= l_Humanoid_0.MaxHealth then
            v10 = true;
        end;
        local v13 = 1 + require(game.ReplicatedStorage.Modules.Leveling):GetBountyDefenseBuff(v5);
        local v14 = l_FirstChild_0.Customization.Race.Value:gsub("%d", "");
        if _G.BattleRoyale == nil then
            if v14 == "Cyborg" then
                if l_FirstChild_0.Skills.CyborgUpgrade.Value == "Defense" then
                    v13 = v13 + 0.1;
                end;
            elseif v14 == "Fishman" then
                v13 = v13 + 0.1;
            end;
            if v3[v14] then
                v13 = v13 + v3[v14];
            end;
        end;
        v9 = v9 * v13 + l_Character_0.Boosts.HP.Value;
        l_Humanoid_0.MaxHealth = v9;
        if v10 == true then
            l_Humanoid_0.Health = v9;
        end;
        l_Humanoid_0.Health = l_Humanoid_0.MaxHealth * v12;
    end;
end;
return v0;