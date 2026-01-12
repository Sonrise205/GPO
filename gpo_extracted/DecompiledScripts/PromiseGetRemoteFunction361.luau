local v0 = require(script.Parent.loader).load(script);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = v0("GetRemoteFunction");
local v4 = v0("Promise");
local v5 = v0("ResourceConstants");
if not l_RunService_0:IsRunning() then
    return function(v6) --[[ Line: 26 ]]
        -- upvalues: v4 (copy), v3 (copy)
        return v4.resolved(v3(v6));
    end;
elseif l_RunService_0:IsServer() then
    return function(v7) --[[ Line: 30 ]]
        -- upvalues: v4 (copy), v3 (copy)
        return v4.resolved(v3(v7));
    end;
else
    return function(v8) --[[ Line: 34 ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v5 (copy), v4 (copy), v3 (copy)
        assert(type(v8) == "string", "Bad name");
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild(v5.REMOTE_FUNCTION_STORAGE_NAME);
        if l_l_ReplicatedStorage_0_FirstChild_0 then
            local l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0 = l_l_ReplicatedStorage_0_FirstChild_0:FindFirstChild(v8);
            if l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0 then
                return v4.resolved(l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0);
            end;
        end;
        return v4.spawn(function(v11, _) --[[ Line: 45 ]]
            -- upvalues: v3 (ref), v8 (copy)
            v11(v3(v8));
        end);
    end;
end;