return function(v0) --[[ Line: 1 ]]
    if _G.BattleRoyale == nil then
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
        if not l_FirstChild_0 then
            return;
        elseif l_FirstChild_0.FruitsAwakened.PikaV2.Value < 5 then
            return;
        else
            game.ReplicatedStorage.Events.note:FireClient(v0, "<Color=Yellow>You have awakened PIKA!");
            _G.setFruit(v0, "PikaV2");
            _G.saveQuestComplete(v0, "PikaV2");
        end;
    end;
    local l_Character_0 = v0.Character;
    if l_Character_0 and l_Character_0.PrimaryPart then
        local v3 = script.reflect:Clone();
        v3.CFrame = l_Character_0.PrimaryPart.CFrame;
        v3.Parent = workspace.Effects;
        _G.customEmit(v3);
        _G.tween(v3.PointLight, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Range = 15, 
            Brightness = 0
        });
        _G.destroy(v3, 3);
        _G.PlaySound(l_Character_0.PrimaryPart, script.PikaV2Unlock).Parent = l_Character_0.PrimaryPart;
    end;
end;