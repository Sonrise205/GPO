local v0 = require(script.Parent.loader).load(script)("Maid");
local v1 = {
    ClassName = "BaseObject"
};
v1.__index = v1;
v1.new = function(v2) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v3 = setmetatable({}, v1);
    v3._maid = v0.new();
    v3._obj = v2;
    return v3;
end;
v1.Destroy = function(v4) --[[ Line: 32 ]] --[[ Name: Destroy ]]
    v4._maid:DoCleaning();
    setmetatable(v4, nil);
end;
return v1;