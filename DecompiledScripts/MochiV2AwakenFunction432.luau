return function(v0) --[[ Line: 1 ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    if _G.BattleRoyale == nil then
        if not l_FirstChild_0 then
            return;
        elseif l_FirstChild_0.FruitsAwakened.MochiV2.Value < 4 then
            return;
        else
            game.ReplicatedStorage.Events.note:FireClient(v0, "<Color=White>You have awakened MOCHI!");
            _G.setFruit(v0, "MochiV2");
            _G.saveQuestComplete(v0, "MochiV2");
        end;
    end;
    local l_Character_0 = v0.Character;
    if l_Character_0 and l_Character_0.PrimaryPart then
        local v3 = script.HitVFX:Clone();
        v3.CFrame = l_Character_0.PrimaryPart.CFrame;
        v3.Parent = workspace.Effects;
        _G.customEmit(v3);
        _G.destroy(v3, 3);
        _G.PlaySound(l_Character_0.PrimaryPart, script.unlockSFX).Parent = l_Character_0.PrimaryPart;
    end;
end;