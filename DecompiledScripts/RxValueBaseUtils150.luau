local v0 = require(script.Parent.loader).load(script);
local v1 = v0("RxInstanceUtils");
local v2 = v0("RxBrioUtils");
local v3 = {};
v3.observe = function(v4, v5, v6) --[[ Line: 24 ]] --[[ Name: observe ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    warn("[RxValueBaseUtils.observe] - Deprecated since 4.0.0. Use RxValueBaseUtils.observeBrio");
    return v1.observeLastNamedChildBrio(v4, v5, v6):Pipe({
        v2.switchMap(function(v7) --[[ Line: 29 ]]
            -- upvalues: v3 (ref)
            return v3.observeValue(v7);
        end)
    });
end;
v3.observeBrio = function(v8, v9, v10) --[[ Line: 43 ]] --[[ Name: observeBrio ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.observeLastNamedChildBrio(v8, v9, v10):Pipe({
        v2.switchMapBrio(function(v11) --[[ Line: 46 ]]
            -- upvalues: v3 (ref)
            return v3.observeValue(v11);
        end)
    });
end;
v3.observeValue = function(v12) --[[ Line: 58 ]] --[[ Name: observeValue ]]
    -- upvalues: v1 (copy)
    return v1.observeProperty(v12, "Value");
end;
return v3;