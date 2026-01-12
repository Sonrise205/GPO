local l_HttpService_0 = game:GetService("HttpService");
local v1 = {};
v1.__index = v1;
v1.ClassName = "Signal";
v1.isSignal = function(v2) --[[ Line: 45 ]] --[[ Name: isSignal ]]
    -- upvalues: v1 (copy)
    local v3 = false;
    if type(v2) == "table" then
        v3 = getmetatable(v2) == v1;
    end;
    return v3;
end;
v1.new = function() --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = setmetatable({}, v1);
    v4._bindableEvent = Instance.new("BindableEvent");
    v4._argMap = {};
    v4._source = "";
    v4._bindableEvent.Event:Connect(function(v5) --[[ Line: 64 ]]
        -- upvalues: v4 (copy)
        v4._argMap[v5] = nil;
        if not v4._bindableEvent and not next(v4._argMap) then
            v4._argMap = nil;
        end;
    end);
    return v4;
end;
v1.Fire = function(v6, ...) --[[ Line: 82 ]] --[[ Name: Fire ]]
    -- upvalues: l_HttpService_0 (copy)
    if not v6._bindableEvent then
        warn(("Signal is already destroyed. %s"):format(v6._source));
        return;
    else
        local v7 = table.pack(...);
        local v8 = l_HttpService_0:GenerateGUID(false);
        v6._argMap[v8] = v7;
        v6._bindableEvent:Fire(v8);
        return;
    end;
end;
v1.Connect = function(v9, v10) --[[ Line: 103 ]] --[[ Name: Connect ]]
    if type(v10) ~= "function" then
        error(("connect(%s)"):format((typeof(v10))), 2);
    end;
    return v9._bindableEvent.Event:Connect(function(v11) --[[ Line: 108 ]]
        -- upvalues: v9 (copy), v10 (copy)
        local v12 = v9._argMap[v11];
        if v12 then
            v10(table.unpack(v12, 1, v12.n));
            return;
        else
            error("Missing arg data, probably due to reentrance.");
            return;
        end;
    end);
end;
v1.Wait = function(v13) --[[ Line: 126 ]] --[[ Name: Wait ]]
    local v14 = v13._bindableEvent.Event:Wait();
    local v15 = v13._argMap[v14];
    if v15 then
        return table.unpack(v15, 1, v15.n);
    else
        error("Missing arg data, probably due to reentrance.");
        return nil;
    end;
end;
v1.Destroy = function(v16) --[[ Line: 141 ]] --[[ Name: Destroy ]]
    if v16._bindableEvent then
        v16._bindableEvent:Destroy();
        v16._bindableEvent = nil;
    end;
    setmetatable(v16, nil);
end;
return v1;