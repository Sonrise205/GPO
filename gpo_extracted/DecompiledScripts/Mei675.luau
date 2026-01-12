local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
local _ = {
    "Electro Fist", 
    "Electro Dash", 
    "Electro Luna", 
    "Electro Rain", 
    "Raiju Punishment"
};
v0.check = function(_) --[[ Line: 5 ]] --[[ Name: check ]]
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_FirstChild_0.Customization.Race.Value:match("Mink") == nil then
        return {
            {
                talkname = "NotMink", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Stats.FightingStyle.Value ~= "Electro" and l_FirstChild_0.SulongQuest.OfferingPercent.Value < 100 then
        return {
            {
                talkname = "NotElectro", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Skills.Electro.Value < 5 then
        return {
            {
                talkname = "NotMaxElectro", 
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
        local v8 = _G.CheckItemAmmount(game.Players.LocalPlayer, "Carrot");
        local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_FirstChild_1.SulongQuest.ShrineActivated.Value == true then
            if l_FirstChild_1.Stats.FightingStyle.Value ~= "Sulong" and l_FirstChild_1.SulongQuest.OfferingPercent.Value >= 100 then
                return {
                    {
                        talkname = "learnSulong1", 
                        talknumber = 1, 
                        talkend = 2
                    }, 
                    {
                        talkname = "learnSulong2", 
                        talknumber = 2, 
                        talkend = 2
                    }
                };
            else
                return {
                    {
                        talkname = "AlreadyGave", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            end;
        elseif v8 >= 100 then
            return {
                {
                    talkname = "GiveCarrots", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            return nil;
        end;
    end;
end;
return v0;