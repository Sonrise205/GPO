local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local v2 = {
    "Machine Gun Blows", 
    "Laser Pulsar", 
    "Cyborg Flight", 
    "Self Repair", 
    "Missle Shower", 
    "Obliteration Rush"
};
v0.check = function(_) --[[ Line: 5 ]] --[[ Name: check ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_FirstChild_0.Customization.Race.Value:match("Cyborg") == nil then
        return {
            {
                talkname = "notCyborg", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Stats.FightingStyle.Value == "Cyborg" then
        if l_FirstChild_0.Skills.Cyborg.Value < #v2 then
            local v7 = v1.GetM(v2[l_FirstChild_0.Skills.Cyborg.Value + 1]);
            if v7.statreq and (_G.MeetReq(v7.statreq, true) == false or _G.CheckItemAmmount(l_LocalPlayer_0, "Cyborg Gear") < v7.moneyreq) then
                return {
                    {
                        talkname = "learn" .. v2[l_FirstChild_0.Skills.Cyborg.Value + 1], 
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
                        talkname = "learn" .. v2[l_FirstChild_0.Skills.Cyborg.Value + 1], 
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
                    talkname = "upgrade1", 
                    talknumber = 1, 
                    talkend = 2
                }, 
                {
                    talkname = "upgrade2", 
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