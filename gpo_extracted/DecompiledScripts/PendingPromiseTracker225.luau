local v0 = {
    ClassName = "PendingPromiseTracker"
};
v0.__index = v0;
v0.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1._pendingPromises = {};
    return v1;
end;
v0.Add = function(v2, v3) --[[ Line: 18 ]] --[[ Name: Add ]]
    if v3:IsPending() then
        v2._pendingPromises[v3] = true;
        v3:Finally(function() --[[ Line: 21 ]]
            -- upvalues: v2 (copy), v3 (copy)
            v2._pendingPromises[v3] = nil;
        end);
    end;
end;
v0.GetAll = function(v4) --[[ Line: 27 ]] --[[ Name: GetAll ]]
    local v5 = {};
    for v6, _ in pairs(v4._pendingPromises) do
        table.insert(v5, v6);
    end;
    return v5;
end;
return v0;