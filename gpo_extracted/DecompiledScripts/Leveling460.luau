local v0 = {
    MaxLevel = 675, 
    MaxPeli = 1000000, 
    LowLevel = 20, 
    pointsPerLvl = 3, 
    statValues = {
        Strength = true, 
        Defense = true, 
        Stamina = true, 
        GunMastery = true, 
        SwordMastery = true, 
        RokushikiMastery = true, 
        BlackLegMastery = true, 
        ElectroMastery = true, 
        DevilFruitMastery = true, 
        FishmanKarateMastery = true, 
        DragonClawMastery = true, 
        CyborgMastery = true, 
        FightingStyleMastery = true
    }
};
local function _(v1) --[[ Line: 23 ]] --[[ Name: getxpformlvl ]]
    return (math.floor(10 * v1 ^ 0.95));
end;
v0.maxexp = function(_, v4) --[[ Line: 28 ]] --[[ Name: maxexp ]]
    return (math.floor(10 * game.ReplicatedStorage:FindFirstChild("Stats" .. v4.Name).Stats.Level.Value ^ 0.95));
end;
local function v9(v5) --[[ Line: 33 ]] --[[ Name: addAll ]]
    -- upvalues: v0 (copy)
    local l_Value_0 = v5.Stats.SkillPoints.Value;
    local l_Children_0 = v5.Stats:GetChildren();
    for v8 = 1, #l_Children_0 do
        if v0.statValues[l_Children_0[v8].Name] ~= nil then
            l_Value_0 = l_Value_0 + l_Children_0[v8].Value;
        end;
    end;
    return l_Value_0;
end;
v0.checkBoosted = function(_, v11) --[[ Line: 46 ]] --[[ Name: checkBoosted ]]
    -- upvalues: v0 (copy), v9 (copy)
    local l_v0_0 = v0;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v11.Name);
    if l_FirstChild_0 then
        if v9(l_FirstChild_0) > l_v0_0.MaxLevel * l_v0_0.pointsPerLvl then
            return true;
        else
            return false;
        end;
    else
        return;
    end;
end;
v0.lvlup = function(_, v15, v16) --[[ Line: 58 ]] --[[ Name: lvlup ]]
    -- upvalues: v0 (copy)
    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v15.Name);
    local l_Character_0 = v15.Character;
    if math.floor(10 * l_FirstChild_1.Stats.Level.Value ^ 0.95) <= l_FirstChild_1.Stats.EXP.Value and l_FirstChild_1.Stats.Level.Value < v0.MaxLevel then
        l_FirstChild_1.Stats.EXP.Value = l_FirstChild_1.Stats.EXP.Value - math.floor(10 * l_FirstChild_1.Stats.Level.Value ^ 0.95);
        l_FirstChild_1.Stats.Level.Value = l_FirstChild_1.Stats.Level.Value + 1;
        l_FirstChild_1.Stats.SkillPoints.Value = l_FirstChild_1.Stats.SkillPoints.Value + v0.pointsPerLvl;
        if l_Character_0:FindFirstChild("Head") and l_Character_0.Head.Transparency ~= 1 then
            local v19 = script.Core:Clone();
            local v20 = Instance.new("Weld", l_Character_0.HumanoidRootPart);
            v20.Part0 = v20.Parent;
            v20.Part1 = v19;
            v19.Parent = workspace.Effects;
            _G.destroy(v19, 3);
            l_Character_0.Humanoid:LoadAnimation(script.cheer):Play();
            _G.PlaySound(l_Character_0.PrimaryPart, script.Level_up).Parent = l_Character_0.PrimaryPart;
            local l_v19_0 = v19 --[[ copy: 5 -> 9 ]];
            task.spawn(function() --[[ Line: 79 ]]
                -- upvalues: l_v19_0 (copy)
                l_v19_0.Attachment.Glow:Emit(1);
                l_v19_0.Attachment.Rays:Emit(1);
                task.wait(0.3);
                l_v19_0.Attachment.Rays2:Emit(10);
                l_v19_0.Attachment.Circles:Emit(25);
                l_v19_0.Attachment.Sparkles:Emit(10);
            end);
        end;
        if l_Character_0.Humanoid.Health < l_Character_0.Humanoid.MaxHealth then
            _G.healPlayer(l_Character_0, l_Character_0.Humanoid.MaxHealth * 1, true, true);
            _G.PlayEffect("ImpelHealEffect", nil, {
                Character = l_Character_0
            });
        end;
        local l_Children_1 = script.Stats:GetChildren();
        for v23 = 1, #l_Children_1 do
            require(l_Children_1[v23]):Apply(v15);
        end;
        if v16 == nil then
            v0:lvlup(v15);
        end;
    end;
end;
v0.UpdateAll = function(_, v25) --[[ Line: 106 ]] --[[ Name: UpdateAll ]]
    local l_Children_2 = script.Stats:GetChildren();
    for v27 = 1, #l_Children_2 do
        require(l_Children_2[v27]):Apply(v25);
    end;
end;
v0.GetBountyDMGBuff = function(_, v29) --[[ Line: 115 ]] --[[ Name: GetBountyDMGBuff ]]
    local v30 = 0;
    local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. v29.Name);
    if l_FirstChild_2 and (not _G.arena or _G.raidMode) then
        v30 = l_FirstChild_2.Stats.Bounty.Value / 100000 * 0.01;
    end;
    return v30;
end;
v0.GetBountyDefenseBuff = function(_, v33) --[[ Line: 127 ]] --[[ Name: GetBountyDefenseBuff ]]
    local v34 = 0;
    local l_FirstChild_3 = game.ReplicatedStorage:FindFirstChild("Stats" .. v33.Name);
    if l_FirstChild_3 and (not _G.arena or _G.raidMode) then
        v34 = l_FirstChild_3.Stats.Bounty.Value / 100000 * 0.0125;
    end;
    return v34;
end;
return v0;