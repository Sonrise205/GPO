local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local v2 = {
    "Electro Fist", 
    "Electro Dash", 
    "Electro Luna", 
    "Electro Rain", 
    "Raiju Punishment"
};
v0.check = function(_) --[[ Line: 5 ]] --[[ Name: check ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Customization.Race.Value:match("Mink") == nil then
        return {
            {
                talkname = "NotMink", 
                talknumber = 1, 
                talkend = 1
            }
        };
    else
        local v6 = 0;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        for v8, v9 in (game:GetService("HttpService"):JSONDecode(l_FirstChild_0.Inventory.Inventory.Value)) do
            if v8 == "Carrot" then
                v6 = v9;
            end;
        end;
        if l_FirstChild_0.Stats.FightingStyle.Value ~= "Electro" and (l_FirstChild_0.Stats.Peli.Value < 15000 or v6 < 25) then
            return {
                {
                    talkname = "nomoney", 
                    talknumber = 4, 
                    talkend = 4
                }
            };
        elseif l_FirstChild_0.Stats.FightingStyle.Value == "Electro" then
            if l_FirstChild_0.Skills.Electro.Value < #v2 then
                local v10 = v1.GetM(v2[l_FirstChild_0.Skills.Electro.Value + 1]);
                if v10.statreq and _G.MeetReq(v10.statreq, true) == false or l_FirstChild_0.Stats.Peli.Value < v10.moneyreq then
                    print("not meat");
                    return {
                        {
                            talkname = "learn" .. v2[l_FirstChild_0.Skills.Electro.Value + 1], 
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
                    print("learningignigngigng" .. v2[l_FirstChild_0.Skills.Electro.Value + 1]);
                    return {
                        {
                            talkname = "learn" .. v2[l_FirstChild_0.Skills.Electro.Value + 1], 
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