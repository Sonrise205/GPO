return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local l_Character_0 = l_LocalPlayer_0.Character;
        local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        local v4 = nil;
        if l_Character_0:FindFirstChild("ragcarry") then
            v4 = l_Character_0:FindFirstChild("ragcarry").Value;
        end;
        if l_Character_0:FindFirstChild("ragcarry") == nil then
            return nil;
        elseif l_Character_0:FindFirstChild("ragcarry") and v4 and (l_Character_0:FindFirstChild(v4.Name .. "'s Poster") or l_LocalPlayer_0.Backpack:FindFirstChild(v4.Name .. "'s Poster")) then
            local _ = l_Character_0.ragcarry.Value;
            return {
                {
                    talkname = "TalkStart", 
                    talknumber = 1, 
                    talkend = 2
                }
            };
        else
            return nil;
        end;
    end
};