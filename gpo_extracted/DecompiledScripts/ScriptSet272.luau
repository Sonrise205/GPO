local v0 = {};
local _ = game.Players.LocalPlayer;
local v2 = require(script.set);
v0.get = function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    task.wait(0.1);
    return v2:ready(v3);
end;
return v0;