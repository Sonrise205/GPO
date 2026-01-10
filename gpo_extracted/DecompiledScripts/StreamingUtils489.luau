local l_Workspace_0 = game:GetService("Workspace");
local l_Promises_0 = script.Parent.Parent.Promises;
local v2 = require(l_Promises_0.Promise);
return {
    PromiseStreamAround = function(v3, v4, v5) --[[ Line: 11 ]] --[[ Name: PromiseStreamAround ]]
        -- upvalues: l_Workspace_0 (copy), v2 (copy)
        assert(typeof(v3) == "Instance", "Bad player");
        assert(typeof(v4) == "Vector3", "Bad position");
        local v6 = true;
        if type(v5) ~= "number" then
            v6 = v5 == nil;
        end;
        assert(v6, "Bad timeOut");
        if not l_Workspace_0.StreamingEnabled then
            return v2.resolved();
        else
            return v2.spawn(function(v7, v8) --[[ Line: 20 ]]
                -- upvalues: v3 (copy), v4 (copy), v5 (copy)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
                    -- upvalues: v3 (ref), v4 (ref), v5 (ref)
                    v3:RequestStreamAroundAsync(v4, v5);
                end);
                if not l_status_0 then
                    return v8(l_result_0);
                else
                    return v7();
                end;
            end);
        end;
    end
};