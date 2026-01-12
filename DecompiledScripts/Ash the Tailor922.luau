local v0 = require(game.ReplicatedStorage.Modules.NPCInteractions.QuestFunctions);
local _ = game.Players.LocalPlayer;
questHandle = function(...) --[[ Line: 4 ]] --[[ Name: questHandle ]]
    -- upvalues: v0 (copy)
    v0:QuestHandle(...);
end;
return {
    TalkAmmount = 2, 
    NPC = "Ash the Tailor", 
    Talk1 = {
        Text = "I can tailor the current outfit you have on, any color you want! But it will cost you <Color=Yellow>5000 Peli<Color=/>!", 
        go = "Lets do it!", 
        stop = "Not interested", 
        stoptext = "Come back when you are", 
        endtext = false
    }, 
    Talk2 = {
        Text = "Excellent choice! Move around to move the outfit!", 
        go = "Open Shop", 
        stop = "Maybe later", 
        stoptext = "", 
        endtext = true, 
        afterEnd = function(v2) --[[ Line: 24 ]] --[[ Name: afterEnd ]]
            game.ReplicatedStorage.Events:FindFirstChild("customTailor"):FireServer(v2);
        end
    }, 
    notEnoughPeli = {
        Text = "<Color=Red>You dont have enough peli!", 
        go = "Lets do it!", 
        stop = "Not interested", 
        stoptext = "*counts gold coins* Your loss, friend! I'll be swinging to another island soon!", 
        endtext = true
    }
};