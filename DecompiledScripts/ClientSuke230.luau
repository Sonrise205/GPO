local v0 = {};
local v1 = require(script.Parent.SukeTrans);
v0.start = function(_, v3, v4) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    local v5 = v1:start(v3);
    repeat
        game["Run Service"].Heartbeat:Wait();
    until v4.Parent ~= v3 or v4.Parent == nil;
    v5:Fire();
end;
return v0;