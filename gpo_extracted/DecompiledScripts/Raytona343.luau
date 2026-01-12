return {
    Costs = {
        Normal = 500
    }, 
    check = function(_) --[[ Line: 7 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_FirstChild_0 and l_FirstChild_0.Stats.BusoV2.Value == true then
            return {
                {
                    talkname = "alreadyTeached", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif _G.HasItem(l_LocalPlayer_0, "Spirit Essence") == false then
            return {
                {
                    talkname = "donthave", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            return;
        end;
    end
};