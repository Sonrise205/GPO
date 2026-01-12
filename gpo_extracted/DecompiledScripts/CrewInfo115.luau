local v0 = {};
local v1 = {};
v0.AddInfo = function(_, v3, v4) --[[ Line: 3 ]] --[[ Name: AddInfo ]]
    -- upvalues: v1 (copy)
    if v4 then
        if type(v4) == "string" then
            v1[v3] = nil;
            return;
        else
            v1[v3] = v4;
            if game:GetService("RunService"):IsServer() == true then
                script.RemoteEvent:FireAllClients(v3, v4);
            end;
        end;
    end;
end;
v0.Get = function(_, v6) --[[ Line: 17 ]] --[[ Name: Get ]]
    -- upvalues: v1 (copy)
    if v1[v6] then
        return v1[v6];
    else
        return;
    end;
end;
v0.UpdateCache = function(_, v8, v9) --[[ Line: 23 ]] --[[ Name: UpdateCache ]]
    -- upvalues: v1 (copy)
    if game:GetService("RunService"):IsServer() == true then
        script.RemoteEvent:FireAllClients(v8, v9);
        if v9 == "offload" then
            v1[v8] = nil;
            return;
        else
            v1[v8] = v9;
            return;
        end;
    else
        if v1[v8] then
            v1[v8] = nil;
        end;
        if v9 == "offload" then
            return;
        else
            v1[v8] = v9;
            return;
        end;
    end;
end;
if game:GetService("RunService"):IsServer() == false then
    script.RemoteEvent.OnClientEvent:Connect(function(v10, v11) --[[ Line: 43 ]]
        -- upvalues: v0 (copy)
        v0:UpdateCache(v10, v11);
    end);
end;
return v0;