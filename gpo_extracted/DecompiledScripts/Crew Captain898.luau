return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local _ = l_LocalPlayer_0.Character;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_FirstChild_0.Stats.Crew.Value == "" then
            return {
                {
                    talkname = "noCrew", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif l_FirstChild_0.Stats.Crew.Value ~= "" then
            local v4, v5 = game.ReplicatedStorage.CrewRemote:InvokeServer({
                Method = "GetOwnerId"
            });
            if not v5 then
                return nil;
            elseif v4 and v4 ~= l_LocalPlayer_0.UserId or v4 == nil then
                return {
                    {
                        talkname = "notOwner", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            else
                return;
            end;
        else
            return nil;
        end;
    end
};