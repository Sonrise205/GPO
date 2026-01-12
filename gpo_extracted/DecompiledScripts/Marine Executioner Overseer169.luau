return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local l_Character_0 = l_LocalPlayer_0.Character;
        if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.Team.Value ~= "Marine" then
            return {
                {
                    talkname = "PIRATE", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            local v3 = false;
            if l_Character_0:FindFirstChild("ragcarry") then
                local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Character_0:FindFirstChild("ragcarry").Value.Name);
                if l_FirstChild_0 and l_FirstChild_0.Stats.Team.Value == "Marine" then
                    v3 = true;
                end;
            end;
            if l_Character_0:FindFirstChild("ragcarry") == nil then
                return {
                    {
                        talkname = "NoCarry", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            elseif v3 == true then
                return {
                    {
                        talkname = "IsMarine", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            else
                return nil;
            end;
        end;
    end
};