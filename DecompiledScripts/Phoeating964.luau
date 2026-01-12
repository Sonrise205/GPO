return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if (script:GetAttribute("req") or 2) > _G.CheckItemAmmount(l_LocalPlayer_0, "Life Essence") then
            return {
                {
                    talkname = "notenough", 
                    talknumber = 3, 
                    talkend = 3
                }
            };
        else
            return nil;
        end;
    end
};