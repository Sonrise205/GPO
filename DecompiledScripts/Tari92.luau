return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if _G.HasItem(l_LocalPlayer_0, "Karoo Mount") then
            return {
                {
                    talkname = "alreadyhave", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            return nil;
        end;
    end
};