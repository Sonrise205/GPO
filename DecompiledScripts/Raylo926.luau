local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
v0.check = function(_) --[[ Line: 4 ]] --[[ Name: check ]]
    -- upvalues: v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local v6 = v1.GetM("Gear 2 Transformation");
    if l_FirstChild_0.Stats.Gear2.Value < v6.statreq.Gear2 - 1 or l_FirstChild_0.Stats.DF.Value ~= "Gomu-Gomu" then
        return {
            {
                talkname = "noTalk", 
                talknumber = 1, 
                talkend = 1
            }
        };
    else
        return nil;
    end;
end;
return v0;