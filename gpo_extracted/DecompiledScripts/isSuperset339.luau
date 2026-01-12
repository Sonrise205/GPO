local v0 = require(script.Parent.isSubset);
return function(v1, v2) --[[ Line: 21 ]] --[[ Name: isSuperset ]]
    -- upvalues: v0 (copy)
    return v0(v2, v1);
end;