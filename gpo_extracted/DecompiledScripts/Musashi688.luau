return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if _G.HasItem(l_LocalPlayer_0, "Book of Nitoryu") and l_FirstChild_0.Skills["2SS"].Value > 0 and l_FirstChild_0.Skills["2SS"].Value < 5 then
            return {
                {
                    talkname = "have", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            local v4 = l_FirstChild_0.Skills["2SS"].Value >= 5;
            if l_FirstChild_0.Stats.Peli.Value < 10000 then
                return {
                    {
                        talkname = "nomoney", 
                        talknumber = 4, 
                        talkend = 4
                    }
                };
            elseif (l_FirstChild_0.Skills["1SS"].Value < 5 or l_FirstChild_0.Stats.FightingStyle.Value ~= "1SS") and l_FirstChild_0.Stats.FightingStyle.Value ~= "2SS" and v4 == false then
                return {
                    {
                        talkname = "notWorth", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            elseif l_FirstChild_0.Skills["2SS"].Value >= 5 and l_FirstChild_0.Stats.FightingStyle.Value == "2SS" then
                return {
                    {
                        talkname = "max", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            elseif l_FirstChild_0.Skills["2SS"].Value >= 5 then
                return {
                    {
                        talkname = "switch1", 
                        talknumber = 1, 
                        talkend = 2
                    }, 
                    {
                        talkname = "switch2", 
                        talknumber = 2, 
                        talkend = 2
                    }
                };
            else
                return nil;
            end;
        end;
    end
};