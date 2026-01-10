local v0 = require(script.Parent.loader).load(script)("Promise");
return function(v1, v2) --[[ Line: 12 ]]
    -- upvalues: v0 (copy)
    assert(typeof(v1) == "Instance", "Bad instance");
    assert(type(v2) == "string", "Bad propertyName");
    local v3 = v1[v2];
    if v3 then
        return v0.resolved(v3);
    else
        local v4 = v0.new();
        local v5 = nil;
        v4:Finally(function() --[[ Line: 24 ]]
            -- upvalues: v5 (ref)
            if v5 then
                v5:Disconnect();
            end;
        end);
        v5 = v1:GetPropertyChangedSignal(v2):Connect(function() --[[ Line: 30 ]]
            -- upvalues: v1 (copy), v2 (copy), v4 (copy)
            if v1[v2] then
                v4:Resolve(v1[v2]);
            end;
        end);
        return v4;
    end;
end;