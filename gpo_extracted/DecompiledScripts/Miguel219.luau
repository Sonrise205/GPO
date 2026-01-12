local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
v0.check = function(_) --[[ Line: 4 ]] --[[ Name: check ]]
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local v6 = l_FirstChild_0.Skills["Abyssal Karate"].Value > 0;
    if l_FirstChild_0.Customization.Race.Value:match("Fishman") == nil then
        return {
            {
                talkname = "NotFishman", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Stats.FightingStyle.Value == "Abyssal Karate" then
        return {
            {
                talkname = "AlreadyGave", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Stats.FightingStyle.Value ~= "FishmanKarate" and v6 == false then
        return {
            {
                talkname = "NotFishmanKarate", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Skills.FishmanKarate.Value < 5 and v6 == false then
        return {
            {
                talkname = "NotMaxFishmanKarate", 
                talknumber = 1, 
                talkend = 1
            }
        };
    else
        if _G.arena == false then
            local v7 = _G.CheckItemAmmount(game.Players.LocalPlayer, "Megalodon Teeth");
            if v6 == false and v7 >= 10 then
                return {
                    {
                        talkname = "GiveTeeth", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            end;
        end;
        local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if v6 == true and _G.arena == false then
            return {
                {
                    talkname = "learnAbyssalKarate1", 
                    talknumber = 1, 
                    talkend = 2
                }, 
                {
                    talkname = "learnAbyssalKarate2", 
                    talknumber = 2, 
                    talkend = 2
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
end;
return v0;