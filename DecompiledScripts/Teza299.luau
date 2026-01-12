local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
v0.check = function(_) --[[ Line: 4 ]] --[[ Name: check ]]
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_FirstChild_0.Skills.SkypianFlight.Value == true then
        return {
            {
                talkname = "got", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Customization.Race.Value:match("Skypian") == nil then
        return {
            {
                talkname = "NotWings", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Stats.Peli.Value < 10000 then
        return {
            {
                talkname = "nomoney", 
                talknumber = 3, 
                talkend = 3
            }
        };
    else
        return;
    end;
end;
return v0;