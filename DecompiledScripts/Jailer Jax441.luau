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
            local v4 = false;
            if l_Character_0:FindFirstChild("ragcarry") then
                local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Character_0:FindFirstChild("ragcarry").Value.Name);
                if l_FirstChild_0 and l_FirstChild_0.Stats.Team.Value == "Marine" then
                    v4 = true;
                end;
                v3 = game.ReplicatedStorage.Events.Jail.GetCD:InvokeServer(l_Character_0:FindFirstChild("ragcarry").Value);
            end;
            if l_Character_0:FindFirstChild("ragcarry") == nil then
                return {
                    {
                        talkname = "NoCarry", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            elseif v4 == true then
                return {
                    {
                        talkname = "IsMarine", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            elseif v3 == true then
                return {
                    {
                        talkname = "JailCD", 
                        talknumber = 2, 
                        talkend = 2
                    }
                };
            elseif l_Character_0:FindFirstChild("ragcarry") and l_Character_0:FindFirstChild("ragcarry").Value and l_Character_0:FindFirstChild("ragcarry").Value:FindFirstChild("Cuffed") == nil then
                local _ = l_Character_0.ragcarry.Value;
                return {
                    {
                        talkname = "NoWork", 
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