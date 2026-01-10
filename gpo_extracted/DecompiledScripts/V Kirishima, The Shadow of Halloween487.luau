local v0 = {};
local v1 = {
    "Will O' Wisp", 
    "Fear Inducement", 
    "Head Throw", 
    "Resurrection", 
    "Onslaught of Shadows"
};
local v2 = require(game.ReplicatedStorage.Modules.Skills);
v0.check = function(_) --[[ Line: 6 ]] --[[ Name: check ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_FirstChild_0.Customization.Race.Value:match("Dullahan") == nil then
        return {
            {
                talkname = "notRace", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Stats.FightingStyle.Value == "Dullahan" then
        if l_FirstChild_0.Skills.Dullahan.Value < #v1 then
            local v7 = v2.GetM(v1[l_FirstChild_0.Skills.Dullahan.Value + 1]);
            if v7.statreq and (_G.MeetReq(v7.statreq, true) == false or _G.CheckItemAmmount(l_LocalPlayer_0, "Wandering Soul") < v7.moneyreq) then
                return {
                    {
                        talkname = "learn" .. v1[l_FirstChild_0.Skills.Dullahan.Value + 1], 
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
                        talkname = "learn" .. v1[l_FirstChild_0.Skills.Dullahan.Value + 1], 
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
return v0;