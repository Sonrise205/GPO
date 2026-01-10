return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.Peli.Value < 25000 then
            return {
                {
                    talkname = "Talk5", 
                    talknumber = 3, 
                    talkend = 3
                }
            };
        else
            return nil;
        end;
    end
};