local v0 = require(game.ReplicatedStorage.Modules.NPCInteractions.QuestFunctions);
local _ = game.Players.LocalPlayer;
questHandle = function(...) --[[ Line: 4 ]] --[[ Name: questHandle ]]
    -- upvalues: v0 (copy)
    v0:QuestHandle(...);
end;
return {
    TalkAmmount = 2, 
    NPC = "Romi", 
    Talk1 = {
        Text = "I can convert your <Color=Blue>Race Rerolls<Color=/> into <Color=Blue>Race Reroll Tokens<Color=/> which are tradeable. You can also redeem them to get your rerolls back.", 
        go = "Lets do it!", 
        stop = "Not interested", 
        stoptext = "Come back when you are", 
        endtext = false
    }, 
    Talk2 = {
        Text = "Excellent choice!", 
        go = "Open Shop", 
        stop = "Maybe later", 
        stoptext = "", 
        endtext = true, 
        afterEnd = function(_) --[[ Line: 24 ]] --[[ Name: afterEnd ]]
            game.ReplicatedStorage.Events:FindFirstChild("RaceRerollConversion"):FireServer();
        end
    }
};