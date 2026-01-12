local v0 = require(script.Parent.loader).load(script);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = v0("ResourceConstants");
if not l_RunService_0:IsRunning() then
    return function(v4) --[[ Line: 51 ]]
        local l_RemoteFunction_0 = Instance.new("RemoteFunction");
        l_RemoteFunction_0.Name = "Mock" .. v4;
        l_RemoteFunction_0.Archivable = false;
        return l_RemoteFunction_0;
    end;
elseif l_RunService_0:IsServer() then
    return function(v6) --[[ Line: 59 ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v3 (copy)
        assert(type(v6) == "string", "Bad name");
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild(v3.REMOTE_FUNCTION_STORAGE_NAME);
        if not l_l_ReplicatedStorage_0_FirstChild_0 then
            l_l_ReplicatedStorage_0_FirstChild_0 = Instance.new("Folder");
            l_l_ReplicatedStorage_0_FirstChild_0.Name = v3.REMOTE_FUNCTION_STORAGE_NAME;
            l_l_ReplicatedStorage_0_FirstChild_0.Archivable = false;
            l_l_ReplicatedStorage_0_FirstChild_0.Parent = l_ReplicatedStorage_0;
        end;
        local l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0 = l_l_ReplicatedStorage_0_FirstChild_0:FindFirstChild(v6);
        if l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0 then
            return l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0;
        else
            l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0 = Instance.new("RemoteFunction");
            l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0.Name = v6;
            l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0.Archivable = false;
            l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0.Parent = l_l_ReplicatedStorage_0_FirstChild_0;
            return l_l_l_ReplicatedStorage_0_FirstChild_0_FirstChild_0;
        end;
    end;
else
    return function(v9) --[[ Line: 83 ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v3 (copy)
        assert(type(v9) == "string", "Bad name");
        return l_ReplicatedStorage_0:WaitForChild(v3.REMOTE_FUNCTION_STORAGE_NAME):WaitForChild(v9);
    end;
end;