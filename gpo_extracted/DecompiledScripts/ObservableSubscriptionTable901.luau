local v0 = require(script.Parent.loader).load(script)("Observable");
local v1 = {
    ClassName = "ObservableSubscriptionTable"
};
v1.__index = v1;
v1.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = setmetatable({}, v1);
    v2._subMap = {};
    return v2;
end;
v1.Fire = function(v3, v4, ...) --[[ Line: 28 ]] --[[ Name: Fire ]]
    assert(v4 ~= nil, "Bad key");
    local v5 = v3._subMap[v4];
    if not v5 then
        return;
    else
        for _, v7 in pairs(table.clone(v5)) do
            task.spawn(v7.Fire, v7, ...);
        end;
        return;
    end;
end;
v1.Complete = function(v8, v9, ...) --[[ Line: 42 ]] --[[ Name: Complete ]]
    local v10 = v8._subMap[v9];
    if not v10 then
        return;
    else
        local v11 = table.clone(v10);
        v8._subMap[v9] = nil;
        for _, v13 in pairs(v11) do
            task.spawn(v13.Complete, v13, ...);
        end;
        return;
    end;
end;
v1.Observe = function(v14, v15) --[[ Line: 61 ]] --[[ Name: Observe ]]
    -- upvalues: v0 (copy)
    assert(v15 ~= nil, "Bad key");
    return v0.new(function(v16) --[[ Line: 64 ]]
        -- upvalues: v14 (copy), v15 (copy)
        if not v14._subMap[v15] then
            v14._subMap[v15] = {
                v16
            };
        else
            table.insert(v14._subMap[v15], v16);
        end;
        return function() --[[ Line: 71 ]]
            -- upvalues: v14 (ref), v15 (ref), v16 (copy)
            if not v14._subMap[v15] then
                return;
            else
                local v17 = v14._subMap[v15];
                local v18 = table.find(v17, v16);
                if not v18 then
                    return;
                else
                    table.remove(v17, v18);
                    if #v17 == 0 then
                        v14._subMap[v15] = nil;
                    end;
                    if v16:IsPending() then
                        task.spawn(function() --[[ Line: 89 ]]
                            -- upvalues: v16 (ref)
                            v16:Complete();
                        end);
                    end;
                    return;
                end;
            end;
        end;
    end);
end;
v1.Destroy = function(v19) --[[ Line: 100 ]] --[[ Name: Destroy ]]
    while next(v19._subMap) do
        local v20, v21 = next(v19._subMap);
        v19._subMap[v20] = nil;
        for _, v23 in pairs(v21) do
            if v23:IsPending() then
                task.spawn(function() --[[ Line: 107 ]]
                    -- upvalues: v23 (copy)
                    v23:Complete();
                end);
            end;
        end;
    end;
end;
return v1;