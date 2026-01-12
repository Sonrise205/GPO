local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
local function v8(v2, v3) --[[ Line: 4 ]] --[[ Name: questCompleted ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v2.Name);
    local v5 = false;
    local v6 = game:GetService("HttpService"):JSONDecode(l_FirstChild_0.Quest.CompletedQuests.Value);
    for v7 = 1, #v6 do
        if v6[v7] == v3 then
            return true;
        end;
    end;
    return v5;
end;
v0.check = function(_) --[[ Line: 19 ]] --[[ Name: check ]]
    -- upvalues: v8 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_FirstChild_2.Skills["3SS"].Value >= 4 or v8(l_LocalPlayer_0, "Pass the Trials of Zorana") == true then
        if l_FirstChild_2.Inventory.Claimed3SSReward.Value == false then
            game.ReplicatedStorage.Events.Quest:InvokeServer("3SSQuestReward");
        end;
        if l_FirstChild_2.Stats.FightingStyle.Value ~= "3SS" then
            return {
                {
                    talkname = "learn3SS1", 
                    talknumber = 1, 
                    talkend = 2
                }, 
                {
                    talkname = "learn3SS2", 
                    talknumber = 2, 
                    talkend = 2
                }
            };
        else
            return {
                {
                    talkname = "max", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        end;
    elseif l_FirstChild_2.Skills["2SS"].Value < 5 or l_FirstChild_2.Stats.FightingStyle.Value ~= "2SS" then
        return {
            {
                talkname = "notWorth", 
                talknumber = 1, 
                talkend = 1
            }
        };
    else
        return;
    end;
end;
return v0;