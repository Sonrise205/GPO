--!native
local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        fn = v2, 
        root = v1
    }, v0));
end;
v0.Disconnect = function(v3) --[[ Line: 14 ]] --[[ Name: Disconnect ]]
    table.clear(v3);
    setmetatable(v3, nil);
end;
return v0.new;