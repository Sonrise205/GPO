local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
v0.check = function(_) --[[ Line: 4 ]] --[[ Name: check ]]
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local v6 = l_FirstChild_0.Skills.Kamishiki.Value > 0;
    if l_FirstChild_0.Stats.FightingStyle.Value ~= "Rokushiki" and (v6 == false or _G.arena == true) then
        return {
            {
                talkname = "NotRokushiki", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif l_FirstChild_0.Skills.Rokushiki.Value < 5 and v6 == false then
        return {
            {
                talkname = "NotMax", 
                talknumber = 1, 
                talkend = 1
            }
        };
    else
        local v7 = _G.CheckItemAmmount(game.Players.LocalPlayer, "Soul King's Guitar");
        if _G.arena == false and v6 == false and v7 >= 1 then
            return {
                {
                    talkname = "GiveGuitar1", 
                    talknumber = 1, 
                    talkend = 2
                }, 
                {
                    talkname = "GiveGuitar2", 
                    talknumber = 2, 
                    talkend = 2
                }
            };
        else
            local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
            if _G.arena == false and v6 == true then
                return {
                    {
                        talkname = "learnRokuV21", 
                        talknumber = 1, 
                        talkend = 2
                    }, 
                    {
                        talkname = "learnRokuV22", 
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
end;
return v0;