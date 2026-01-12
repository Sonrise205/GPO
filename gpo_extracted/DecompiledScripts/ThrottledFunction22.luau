local v0 = {
    ClassName = "ThrottledFunction"
};
v0.__index = v0;
v0.new = function(v1, v2, v3) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v4 = setmetatable({}, v0);
    v4._nextCallTimeStamp = 0;
    v4._timeout = v1 or error("No timeoutInSeconds");
    v4._func = v2 or error("No func");
    v4._trailingValue = nil;
    v4._callLeading = true;
    v4._callTrailing = true;
    v4:_configureOrError(v3);
    return v4;
end;
v0.Call = function(v5, ...) --[[ Line: 27 ]] --[[ Name: Call ]]
    if v5._trailingValue then
        v5._trailingValue = table.pack(...);
        return;
    elseif v5._nextCallTimeStamp <= tick() then
        if v5._callLeading or v5._callLeadingFirstTime then
            v5._callLeadingFirstTime = false;
            v5._nextCallTimeStamp = tick() + v5._timeout;
            v5._func(...);
            return;
        elseif v5._callTrailing then
            v5._trailingValue = table.pack(...);
            task.delay(v5._timeout, function() --[[ Line: 40 ]]
                -- upvalues: v5 (copy)
                if v5.Destroy then
                    v5:_dispatch();
                end;
            end);
            return;
        else
            error("[ThrottledFunction.Cleanup] - Trailing and leading are both disabled");
            return;
        end;
    else
        if v5._callLeading or v5._callTrailing or v5._callLeadingFirstTime then
            v5._callLeadingFirstTime = false;
            local v6 = v5._nextCallTimeStamp - tick();
            v5._trailingValue = table.pack(...);
            task.delay(v6, function() --[[ Line: 54 ]]
                -- upvalues: v5 (copy)
                if v5.Destroy then
                    v5:_dispatch();
                end;
            end);
        end;
        return;
    end;
end;
v0._dispatch = function(v7) --[[ Line: 62 ]] --[[ Name: _dispatch ]]
    v7._nextCallTimeStamp = tick() + v7._timeout;
    local l__trailingValue_0 = v7._trailingValue;
    if l__trailingValue_0 then
        v7._trailingValue = nil;
        v7._func(unpack(l__trailingValue_0, 1, l__trailingValue_0.n));
    end;
end;
v0._configureOrError = function(v9, v10) --[[ Line: 73 ]] --[[ Name: _configureOrError ]]
    if v10 == nil then
        return;
    else
        assert(type(v10) == "table", "Bad throttleConfig");
        for v11, v12 in pairs(v10) do
            assert(type(v12) == "boolean", "Bad throttleConfig entry");
            if v11 == "leading" then
                v9._callLeading = v12;
            elseif v11 == "trailing" then
                v9._callTrailing = v12;
            elseif v11 == "leadingFirstTimeOnly" then
                v9._callLeadingFirstTime = v12;
            else
                error(("Bad key %q in config"):format((tostring(v11))));
            end;
        end;
        assert(v9._callLeading or v9._callTrailing, "Cannot configure both leading and trailing disabled");
        return;
    end;
end;
v0.Destroy = function(v13) --[[ Line: 97 ]] --[[ Name: Destroy ]]
    v13._trailingValue = nil;
    v13._func = nil;
    setmetatable(v13, nil);
end;
return v0;