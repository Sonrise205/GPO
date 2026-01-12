local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 21 ]] --[[ Name: has ]]
    return v1[v2] ~= nil;
end;