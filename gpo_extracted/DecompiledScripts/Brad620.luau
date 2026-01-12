return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local l_Character_0 = l_LocalPlayer_0.Character;
        if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.Peli.Value < 2000 then
            return {
                {
                    talkname = "nomoney", 
                    talknumber = 3, 
                    talkend = 3
                }
            };
        elseif l_Character_0:FindFirstChild("coatBubble") then
            return {
                {
                    talkname = "already", 
                    talknumber = 3, 
                    talkend = 3
                }
            };
        else
            return nil;
        end;
    end
};