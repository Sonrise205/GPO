return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        warn("checking queue");
        local v4 = game.ReplicatedStorage.Events.KarooRace:InvokeServer("checkQueue");
        local v5 = game.ReplicatedStorage.Events.KarooRace:InvokeServer("checkQueue", true);
        warn("chcked queue");
        if _G.HasItem(l_LocalPlayer_0, "Karoo Mount") == false then
            warn("no karoo");
            return {
                {
                    talkname = "noKaroo", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif l_FirstChild_0.Stats.Peli.Value < 5000 then
            warn("no money");
            return {
                {
                    talkname = "nomoney", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif v4 == false then
            warn("full");
            return {
                {
                    talkname = "full", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif v5 == true then
            warn("in queue");
            return {
                {
                    talkname = "inQueue", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            return;
        end;
    end
};