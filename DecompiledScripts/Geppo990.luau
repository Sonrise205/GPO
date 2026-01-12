local v0 = {};
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Sparks];
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.RockDebs];
v0.start = function(_, ...) --[[ Line: 4 ]] --[[ Name: start ]]
    _G.PlayEffect("Geppo", nil, ...);
end;
return v0;