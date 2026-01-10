local l_Players_0 = game:GetService("Players");
return {
    TalkAmmount = 2, 
    NPC = "Fish Buyer", 
    Talk1 = {
        Text = "If you have any <Color=Blue>fishes<Color=/> I would be happy to take them", 
        go = "Sure", 
        stop = "No thanks", 
        stoptext = "...", 
        endtext = false
    }, 
    Talk2 = {
        Text = "Lets see what you got!", 
        go = "Ok", 
        stop = "I changed my mind", 
        stoptext = "Come back if you change your mind again", 
        endtext = true, 
        excu = function(_) --[[ Line: 19 ]] --[[ Name: excu ]]
            -- upvalues: l_Players_0 (copy)
            l_Players_0.LocalPlayer.PlayerGui.FishSellerGui.Enabled = true;
        end
    }
};