local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local v2 = {
    "Five Thousand Brick Fist", 
    "Water Prison", 
    "Shark Barrage", 
    "Water Serpent", 
    "Water Bomb"
};
v0.check = function(_) --[[ Line: 5 ]] --[[ Name: check ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_FirstChild_0.Customization.Race.Value:match("Fishman") == nil then
        return {
            {
                talkname = "notRace", 
                talknumber = 1, 
                talkend = 1
            }
        };
    else
        local v7 = 0;
        for v8, v9 in (game:GetService("HttpService"):JSONDecode(l_FirstChild_0.Inventory.Inventory.Value)) do
            if v8 == "Shark Tooth" then
                v7 = v9;
            end;
        end;
        if (l_FirstChild_0.Stats.Peli.Value < 30000 or v7 < 75) and l_FirstChild_0.Stats.FightingStyle.Value ~= "FishmanKarate" then
            return {
                {
                    talkname = "nomoney", 
                    talknumber = 5, 
                    talkend = 5
                }
            };
        elseif l_FirstChild_0.Stats.FightingStyle.Value == "FishmanKarate" then
            if l_FirstChild_0.Skills.FishmanKarate.Value < #v2 then
                local v10 = v1.GetM(v2[l_FirstChild_0.Skills.FishmanKarate.Value + 1]);
                if v10.statreq and _G.MeetReq(v10.statreq, true) == false or l_FirstChild_0.Stats.Peli.Value < v10.moneyreq then
                    return {
                        {
                            talkname = "learn" .. v2[l_FirstChild_0.Skills.FishmanKarate.Value + 1], 
                            talknumber = 1, 
                            talkend = 2
                        }, 
                        {
                            talkname = "dontMeet", 
                            talknumber = 2, 
                            talkend = 2
                        }
                    };
                else
                    return {
                        {
                            talkname = "learn" .. v2[l_FirstChild_0.Skills.FishmanKarate.Value + 1], 
                            talknumber = 1, 
                            talkend = 2
                        }, 
                        {
                            talkname = "learnedSkill", 
                            talknumber = 2, 
                            talkend = 2
                        }
                    };
                end;
            else
                return {
                    {
                        talkname = "max", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            end;
        else
            return nil;
        end;
    end;
end;
return v0;