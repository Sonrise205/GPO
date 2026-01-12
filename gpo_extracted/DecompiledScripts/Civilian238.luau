local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
v0.check = function(_) --[[ Line: 4 ]] --[[ Name: check ]]
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    return {
        {
            talkname = "Talk" .. math.random(1, 98), 
            talknumber = 1, 
            talkend = 1
        }
    };
end;
return v0;