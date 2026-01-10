return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_FirstChild_0.Stats.KenMastery.Value <= 0 then
            return {
                {
                    talkname = "notlearn", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif l_FirstChild_0.Skills.KenV2.Value == true then
            return {
                {
                    talkname = "masterd", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif l_FirstChild_0.Stats.Peli.Value < 25000 then
            return {
                {
                    talkname = "nomoney", 
                    talknumber = 4, 
                    talkend = 4
                }
            };
        else
            return nil;
        end;
    end
};