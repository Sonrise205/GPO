return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_FirstChild_0.Stats.Crew.Value ~= "" and l_FirstChild_0.Stats.Team.Value ~= "Marine" then
            return {
                {
                    talkname = "InCrew", 
                    talknumber = 4, 
                    talkend = 4
                }
            };
        else
            return nil;
        end;
    end
};