local v4 = {
    isValidTask = function(v0) --[[ Line: 25 ]] --[[ Name: isValidTask ]]
        local v1 = true;
        if type(v0) ~= "function" then
            v1 = true;
            if type(v0) ~= "thread" then
                v1 = true;
                if typeof(v0) ~= "RBXScriptConnection" then
                    v1 = type(v0) == "table" and type(v0.Destroy) == "function" or typeof(v0) == "Instance";
                end;
            end;
        end;
        return v1;
    end, 
    doTask = function(v2) --[[ Line: 38 ]] --[[ Name: doTask ]]
        if type(v2) == "function" then
            v2();
            return;
        else
            if type(v2) == "thread" then
                local v3 = nil;
                if coroutine.running() ~= v2 then
                    v3 = pcall(function() --[[ Line: 44 ]]
                        -- upvalues: v2 (copy)
                        task.cancel(v2);
                    end);
                end;
                if not v3 then
                    task.defer(function() --[[ Line: 50 ]]
                        -- upvalues: v2 (copy)
                        task.cancel(v2);
                    end);
                    return;
                end;
            elseif typeof(v2) == "RBXScriptConnection" then
                v2:Disconnect();
                return;
            elseif type(v2) == "table" and type(v2.Destroy) == "function" then
                v2:Destroy();
                return;
            elseif typeof(v2) == "Instance" then
                v2:Destroy();
                return;
            else
                error("Bad job");
            end;
            return;
        end;
    end
};
v4.delayed = function(v5, v6) --[[ Line: 78 ]] --[[ Name: delayed ]]
    -- upvalues: v4 (copy)
    assert(type(v5) == "number", "Bad time");
    assert(v4.isValidTask(v6), "Bad job");
    return function() --[[ Line: 82 ]]
        -- upvalues: v5 (copy), v4 (ref), v6 (copy)
        task.delay(v5, function() --[[ Line: 83 ]]
            -- upvalues: v4 (ref), v6 (ref)
            v4.doTask(v6);
        end);
    end;
end;
return v4;