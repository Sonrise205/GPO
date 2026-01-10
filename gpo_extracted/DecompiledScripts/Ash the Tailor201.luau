return {
    check = function(_) --[[ Line: 4 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.Peli.Value <= 5000 then
            return {
                {
                    talkname = "notEnoughPeli", 
                    talknumber = 2, 
                    talkend = 2
                }
            };
        else
            return nil;
        end;
    end
};