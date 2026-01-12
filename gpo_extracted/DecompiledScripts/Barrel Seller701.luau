local v0 = {
    Costs = {
        Normal = 500
    }
};
v0.check = function(_) --[[ Line: 7 ]] --[[ Name: check ]]
    -- upvalues: v0 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.Peli.Value < v0.Costs.Normal then
        return {
            {
                talkname = "nomoney", 
                talknumber = 2, 
                talkend = 2
            }
        };
    elseif l_Character_0:FindFirstChild("Barrel") then
        return {
            {
                talkname = "haveBarrel", 
                talknumber = 2, 
                talkend = 2
            }
        };
    else
        return nil;
    end;
end;
return v0;