local v0 = {
    Costs = {
        Normal = 500
    }
};
local v1 = workspace.Islands["Reverse Mountain"];
v0.check = function(_) --[[ Line: 8 ]] --[[ Name: check ]]
    -- upvalues: v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.Level.Value < 325 then
        return {
            {
                talkname = "notReady", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif _G.HasItem(l_LocalPlayer_0, "World Scroll") == true and v1.Gate.Barrier.CastShadow == true then
        return {
            {
                talkname = "opengate", 
                talknumber = 1, 
                talkend = 1
            }
        };
    elseif v1.Gate.Barrier.CastShadow == false then
        return {
            {
                talkname = "gateAlreadyOpen", 
                talknumber = 1, 
                talkend = 1
            }
        };
    else
        return;
    end;
end;
return v0;