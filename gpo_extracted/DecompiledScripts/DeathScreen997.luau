return {
    start = function(_, v1) --[[ Line: 3 ]] --[[ Name: start ]]
        local v2 = script.Death:Clone();
        local l_Main_0 = v2.Main;
        v2.killerName.Value = if typeof(v1) == "Instance" then v1.Name else v1;
        v2.Parent = game.Players.LocalPlayer.PlayerGui;
        v2.Enabled = true;
        l_Main_0.Enabled = true;
    end
};