local v0 = {};
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Sparks];
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.RockDebs];
v0.start = function(_, v4) --[[ Line: 6 ]] --[[ Name: start ]]
    local l_Beam_0 = v4.Beam;
    for v6 = v4.reps, 0, -v4.int do
        game["Run Service"].RenderStepped:Wait();
        l_Beam_0:SetTextureOffset(v6);
    end;
    l_Beam_0.Enabled = false;
end;
return v0;