local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = l_RunService_0:IsStudio();
local v3 = l_RunService_0:IsServer();
local v4 = {};
local v5 = nil;
local v6 = nil;
if v3 == true then
    v5 = l_ReplicatedStorage_0:FindFirstChild("RemoteEvents");
    if v5 ~= nil then
        if v2 == true then
            warn((("[%*]: ReplicatedStorage \"RemoteEvents\" container was already defined"):format(script.Name)));
        end;
    else
        v5 = Instance.new("Folder");
        v5.Name = "RemoteEvents";
        v5.Parent = l_ReplicatedStorage_0;
    end;
else
    v5 = l_ReplicatedStorage_0:FindFirstChild("RemoteEvents");
    if v5 == nil then
        v6 = Instance.new("BindableEvent");
        task.spawn(function() --[[ Line: 50 ]]
            -- upvalues: v5 (ref), l_ReplicatedStorage_0 (copy), v6 (ref)
            while true do
                if task.wait() then
                    v5 = l_ReplicatedStorage_0:FindFirstChild("RemoteEvents");
                    if v5 ~= nil then
                        v6:Fire();
                        return;
                    end;
                else
                    return;
                end;
            end;
        end);
    end;
end;
local v7 = {};
v7.__index = v7;
v7.New = function(v8) --[[ Line: 71 ]] --[[ Name: New ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        fn = v8, 
        is_disconnected = false, 
        real_connection = nil
    }, v7));
end;
v7.Disconnect = function(v9) --[[ Line: 79 ]] --[[ Name: Disconnect ]]
    v9.is_disconnected = true;
    if v9.real_connection ~= nil then
        v9.real_connection:Disconnect();
    end;
end;
local v10 = {};
v10.__index = v10;
v10.New = function(v11, v12) --[[ Line: 89 ]] --[[ Name: New ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (ref), v7 (copy), v10 (copy), v6 (ref)
    if type(v11) ~= "string" then
        error((("[%*]: name must be a string"):format(script.Name)));
    end;
    if v3 == true then
        if v4[v11] ~= nil then
            error((("[%*]: RemoteEvent %* was already defined"):format(script.Name, v11)));
        end;
        v4[v11] = true;
        local v13 = Instance.new(v12 == true and "UnreliableRemoteEvent" or "RemoteEvent");
        v13.Name = v11;
        v13.Parent = v5;
        return v13;
    else
        local v14 = v5 and v5:FindFirstChild(v11);
        if v14 ~= nil then
            return v14;
        else
            local v15 = {};
            local v19 = setmetatable({
                OnClientEvent = {
                    Connect = function(_, v17) --[[ Line: 121 ]] --[[ Name: Connect ]]
                        -- upvalues: v14 (ref), v7 (ref), v15 (ref)
                        if v14 ~= nil then
                            return v14.OnClientEvent:Connect(v17);
                        else
                            local v18 = v7.New(v17);
                            table.insert(v15, v18);
                            return v18;
                        end;
                    end
                }, 
                OnServerEvent = {
                    Connect = function() --[[ Line: 134 ]] --[[ Name: Connect ]]
                        error((("[%*]: Can't connect to \"OnServerEvent\" client-side"):format(script.Name)));
                    end
                }, 
                RemoteEvent = nil
            }, v10);
            local function v23() --[[ Line: 141 ]] --[[ Name: on_container_ready ]]
                -- upvalues: v14 (ref), v5 (ref), v11 (copy), v15 (ref), v19 (copy)
                local v20 = os.clock();
                while true do
                    v14 = v5:FindFirstChild(v11);
                    if v14 == nil then
                        if v20 ~= nil and os.clock() - v20 > 20 then
                            v20 = nil;
                            warn((("[%*]: RemoteEvent \"%*\" hasn't been defined server-side"):format(script.Name, v11)));
                        end;
                        task.wait();
                    else
                        break;
                    end;
                end;
                for _, v22 in ipairs(v15) do
                    if v22.is_disconnected == false then
                        v22.real_connection = v14.OnClientEvent:Connect(v22.fn);
                    end;
                end;
                v19.RemoteEvent = v14;
                v15 = nil;
            end;
            if v5 ~= nil then
                task.spawn(v23);
            else
                local v24 = nil;
                do
                    local l_v24_0 = v24;
                    l_v24_0 = v6.Event:Connect(function() --[[ Line: 173 ]]
                        -- upvalues: l_v24_0 (ref), v23 (copy)
                        l_v24_0:Disconnect();
                        v23();
                    end);
                end;
            end;
            return v19;
        end;
    end;
end;
v10.FireServer = function(v26, ...) --[[ Line: 185 ]] --[[ Name: FireServer ]]
    if v26.RemoteEvent ~= nil then
        v26.RemoteEvent:FireServer(...);
    end;
end;
v10.FireClient = function(_) --[[ Line: 191 ]] --[[ Name: FireClient ]]
    error((("[%*]: Can't use \"FireClient\" client-side"):format(script.Name)));
end;
v10.FireAllClients = function(_) --[[ Line: 195 ]] --[[ Name: FireAllClients ]]
    error((("[%*]: Can't use \"FireAllClients\" client-side"):format(script.Name)));
end;
return v10;