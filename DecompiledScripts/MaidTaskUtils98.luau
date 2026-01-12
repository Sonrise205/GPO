local v3 = {
    isValidTask = function(v0) --[[ Line: 25 ]] --[[ Name: isValidTask ]]
        local v1 = true;
        if type(v0) ~= "function" then
            v1 = true;
            if typeof(v0) ~= "RBXScriptConnection" then
                v1 = type(v0) == "table" and type(v0.Destroy) == "function" or typeof(v0) == "Instance";
            end;
        end;
        return v1;
    end, 
    doTask = function(v2) --[[ Line: 37 ]] --[[ Name: doTask ]]
        if type(v2) == "function" then
            v2();
            return;
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
            return;
        end;
    end
};
v3.delayed = function(v4, v5) --[[ Line: 64 ]] --[[ Name: delayed ]]
    -- upvalues: v3 (copy)
    assert(type(v4) == "number", "Bad time");
    assert(v3.isValidTask(v5), "Bad job");
    return function() --[[ Line: 68 ]]
        -- upvalues: v4 (copy), v3 (ref), v5 (copy)
        task.delay(v4, function() --[[ Line: 69 ]]
            -- upvalues: v3 (ref), v5 (ref)
            v3.doTask(v5);
        end);
    end;
end;
return v3;