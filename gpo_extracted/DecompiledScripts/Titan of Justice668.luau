local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
local _ = {
    "Electro Fist", 
    "Electro Dash", 
    "Electro Luna", 
    "Electro Rain", 
    "Raiju Punishment"
};
local function v9(v3, v4) --[[ Line: 5 ]] --[[ Name: questCompleted ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v3.Name);
    local v6 = false;
    local v7 = game:GetService("HttpService"):JSONDecode(l_FirstChild_0.Quest.CompletedQuests.Value);
    for v8 = 1, #v7 do
        if v7[v8] == v4 then
            return true;
        end;
    end;
    return v6;
end;
v0.check = function(_) --[[ Line: 20 ]] --[[ Name: check ]]
    -- upvalues: v9 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if _G.arena == true then
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
        local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if l_FirstChild_2.Stats.FightingStyle.Value == "Iron Fist" and l_FirstChild_2.Skills.GarpFS.Value < 4 then
            game.ReplicatedStorage.Events.Quest:InvokeServer("CorrectIronFistQuest");
        end;
        if l_FirstChild_2.Skills.GarpFS.Value >= 4 or l_FirstChild_2.Skills.GarpFS.Value == 3 and _G.HasItem(l_LocalPlayer_0, "Titan of Justice's Cape") == true or v9(l_LocalPlayer_0, "Pass the Trials of the Titan") == true then
            return {
                {
                    talkname = "learnIronFist1", 
                    talknumber = 1, 
                    talkend = 2
                }, 
                {
                    talkname = "learnIronFist2", 
                    talknumber = 2, 
                    talkend = 2
                }
            };
        else
            return;
        end;
    end;
end;
return v0;