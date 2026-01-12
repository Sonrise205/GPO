local v0 = require(game.ReplicatedStorage.Modules.NPCInteractions.QuestFunctions);
questHandle = function(...) --[[ Line: 2 ]] --[[ Name: questHandle ]]
    -- upvalues: v0 (copy)
    v0:QuestHandle(...);
end;
return {
    TalkAmmount = 2, 
    NPC = "Blacksmith Sen", 
    Talk1 = {
        Text = "If you have <Color=Blue>Blueprints<Color=/> i can craft you items, are you interested?", 
        go = "Yes", 
        stop = "No", 
        stoptext = "...", 
        endtext = false
    }, 
    Talk2 = {
        Text = "Take a look!", 
        go = "Ok", 
        stop = "Bye", 
        stoptext = "Bye", 
        endtext = true, 
        excu = function(v1) --[[ Line: 21 ]] --[[ Name: excu ]]
            game.Players.LocalPlayer.PlayerGui.Crafting.Enabled = true;
            game.Players.LocalPlayer.PlayerGui.Crafting.CraftingClient.Crafter.Value = v1;
        end
    }
};