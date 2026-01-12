local v0 = {};
local v1 = require(script.LODTween);
local v2 = {
    minDistance = 150, 
    maxDistance = 300, 
    minLerpInterval = 0, 
    maxLerpInterval = 0.2
};
v0.start = function(_, v4, v5, v6, _) --[[ Line: 11 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v4 == nil or v4 and v4.PrimaryPart == nil then
        return;
    else
        v1:AddTween(v4.PrimaryPart, v6, v5, v2);
        return;
    end;
end;
return v0;