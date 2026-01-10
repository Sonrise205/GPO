local v0 = {};
local v1 = {
    "Dragon Fist", 
    "Dragon Breath", 
    "Dragon Claw Stance", 
    "Dragon Claw Slash", 
    "Dragon Rush", 
    "Reverse Dragon", 
    "Dragon Skull Crusher"
};
local v2 = require(game.ReplicatedStorage.Modules.Skills);
v0.check = function(_) --[[ Line: 5 ]] --[[ Name: check ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local v7 = game.ReplicatedStorage.Events.CheckRoyaleData:InvokeServer("Misc", "BRArenaCombinedWins");
    print(v7);
    v7 = v7 or 0;
    if l_FirstChild_0.Stats.FightingStyle.Value == "DragonClaw" then
        if l_FirstChild_0.Skills.DragonClaw.Value >= #v1 and l_FirstChild_0.Inventory.ClaimedPipe.Value == false then
            return {
                {
                    talkname = "getpipe", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif l_FirstChild_0.Skills.DragonClaw.Value >= #v1 then
            warn("maxed out");
            return {
                {
                    talkname = "maxed", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        elseif l_FirstChild_0.Skills.DragonClaw.Value < #v1 then
            warn("can learn");
            local _ = v2.GetM(v1[l_FirstChild_0.Skills.DragonClaw.Value + 1]);
            if v7 < l_FirstChild_0.Skills.DragonClaw.Value + 1 then
                return {
                    {
                        talkname = "notReq", 
                        talknumber = 1, 
                        talkend = 1
                    }
                };
            else
                warn("learning skill " .. v1[l_FirstChild_0.Skills.DragonClaw.Value + 1]);
                return {
                    {
                        talkname = "learn" .. v1[l_FirstChild_0.Skills.DragonClaw.Value + 1], 
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
        end;
    end;
end;
return v0;