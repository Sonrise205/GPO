local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
local v2 = {
    ["Pika-Pika"] = true, 
    ["Mochi-Mochi"] = true
};
v0.check = function(_) --[[ Line: 8 ]] --[[ Name: check ]]
    -- upvalues: v2 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    if v2[game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.DF.Value] == nil then
        return {
            {
                talkname = "NotValidFruit", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif _G.arena == true then
        local l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("playersEliminated");
        if l_l_LocalPlayer_0_Attribute_0 == nil then
            l_l_LocalPlayer_0_Attribute_0 = 0;
        end;
        if l_l_LocalPlayer_0_Attribute_0 < 3 then
            return {
                {
                    talkname = "NotEnoughGrips", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            return {
                {
                    talkname = "BRTalk1", 
                    talknumber = 1, 
                    talkend = 2
                }, 
                {
                    talkname = "BRTalk2", 
                    talknumber = 2, 
                    talkend = 2
                }
            };
        end;
    else
        return nil;
    end;
end;
return v0;