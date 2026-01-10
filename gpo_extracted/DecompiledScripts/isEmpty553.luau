local _ = require(script.Parent.Parent.Types);
return function(v1) --[[ Line: 22 ]] --[[ Name: isEmpty ]]
    return next(v1) == nil;
end;