local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local v2 = {
    "B-Shot", 
    "Coiller", 
    "Sky Walk", 
    "Concasser", 
    "Party Table Kick Course", 
    "Anti-Manner Kick Course"
};
v0.check = function(_) --[[ Line: 5 ]] --[[ Name: check ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_FirstChild_0.Stats.Peli.Value < 9000 and l_FirstChild_0.Stats.FightingStyle.Value ~= "BlackLeg" then
        return {
            {
                talkname = "nomoney", 
                talknumber = 3, 
                talkend = 3
            }
        };
    elseif l_FirstChild_0.Stats.FightingStyle.Value == "BlackLeg" then
        if l_FirstChild_0.Skills.BlackLeg.Value < #v2 then
            local v7 = v1.GetM(v2[l_FirstChild_0.Skills.BlackLeg.Value + 1]);
            if v7.statreq and _G.MeetReq(v7.statreq, true) == false or l_FirstChild_0.Stats.Peli.Value < v7.moneyreq then
                return {
                    {
                        talkname = "learn" .. v2[l_FirstChild_0.Skills.BlackLeg.Value + 1], 
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
                        talkname = "learn" .. v2[l_FirstChild_0.Skills.BlackLeg.Value + 1], 
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