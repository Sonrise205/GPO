local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.ModelResize);
v0.start = function(_, v3) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    v1:TweenResize(unpack(v3));
end;
return v0;