local v0 = require(script.Parent.loader).load(script)("Promise");
return function(v1) --[[ Line: 11 ]]
    -- upvalues: v0 (copy)
    return v0.new(function(v2, _) --[[ Line: 12 ]]
        -- upvalues: v1 (copy)
        task.delay(v1, function() --[[ Line: 13 ]]
            -- upvalues: v2 (copy)
            v2();
        end);
    end);
end;