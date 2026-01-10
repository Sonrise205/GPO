return {
    check = function(_) --[[ Line: 3 ]] --[[ Name: check ]]
        local _ = game.Players.LocalPlayer.Character;
        if workspace.Env.SantaSlay.ready.Value == true then
            return {
                {
                    talkname = "ready", 
                    talknumber = 1, 
                    talkend = 1
                }
            };
        else
            return nil;
        end;
    end
};