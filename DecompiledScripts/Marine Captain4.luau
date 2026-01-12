return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_LocalPlayer_0.Team ~= game.Teams.Marine then
            return {
                {
                    talkname = "notMarine", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            return nil;
        end;
    end
};