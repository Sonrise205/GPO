local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
return function(v2, v3) --[[ Line: 17 ]]
    -- upvalues: l_HttpService_0 (copy), l_RunService_0 (copy)
    assert(type(v2) == "number", "Bad priority");
    assert(type(v3) == "function", "Bad callback");
    local v4 = l_HttpService_0:GenerateGUID(false) .. "_onRenderStepFrame";
    local v5 = false;
    l_RunService_0:BindToRenderStep(v4, v2, function() --[[ Line: 24 ]]
        -- upvalues: v5 (ref), l_RunService_0 (ref), v4 (copy), v3 (copy)
        if not v5 then
            l_RunService_0:UnbindFromRenderStep(v4);
            v3();
        end;
    end);
    return function() --[[ Line: 31 ]]
        -- upvalues: v5 (ref), l_RunService_0 (ref), v4 (copy)
        if not v5 then
            l_RunService_0:UnbindFromRenderStep(v4);
            v5 = true;
        end;
    end;
end;