return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local l_Character_0 = l_LocalPlayer_0.Character;
        local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_Character_0:FindFirstChild("Barrel") == nil then
            return {
                {
                    talkname = "noBarrel", 
                    talknumber = 2, 
                    talkend = 2
                }
            };
        else
            return nil;
        end;
    end
};