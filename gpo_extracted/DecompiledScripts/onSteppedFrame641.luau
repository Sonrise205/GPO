local l_RunService_0 = game:GetService("RunService");
return function(v1) --[[ Line: 15 ]]
    -- upvalues: l_RunService_0 (copy)
    assert(type(v1) == "function", "Bad func");
    local v2 = nil;
    v2 = l_RunService_0.Stepped:Connect(function() --[[ Line: 19 ]]
        -- upvalues: v2 (ref), v1 (copy)
        v2:Disconnect();
        v1();
    end);
    return v2;
end;