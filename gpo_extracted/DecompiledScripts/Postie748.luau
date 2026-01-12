local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("ReplicatedStorage");
if not script:FindFirstChild("Sent") then
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "Sent";
    l_RemoteEvent_0.Parent = script;
end;
if not script:FindFirstChild("Received") then
    local l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "Received";
    l_RemoteEvent_1.Parent = script;
end;
local l_Sent_0 = script.Sent;
local l_Received_0 = script.Received;
local v7 = l_RunService_0:IsServer();
local v8 = {};
local v9 = {};
local function v13(v10, ...) --[[ Line: 97 ]] --[[ Name: spawnNow ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v12 = table.pack(...);
    l_BindableEvent_0.Event:Connect(function() --[[ Line: 100 ]]
        -- upvalues: v10 (copy), v12 (copy)
        v10(table.unpack(v12, 1, v12.n));
    end);
    l_BindableEvent_0:Fire();
    l_BindableEvent_0:Destroy();
end;
local v33 = {
    InvokeClient = function(v14, v15, v16, ...) --[[ Line: 112 ]] --[[ Name: InvokeClient ]]
        -- upvalues: v7 (copy), v9 (copy), l_HttpService_0 (copy), v13 (copy), l_Sent_0 (copy)
        assert(v7, "Postie.InvokeClient can only be called from the server");
        assert(typeof(v14) == "string", "bad argument #1 to Postie.InvokeClient, expects string");
        local v17 = false;
        if typeof(v15) == "Instance" then
            v17 = v15:IsA("Player");
        end;
        assert(v17, "bad argument #2 to Postie.InvokeClient, expects Instance<Player>");
        assert(typeof(v16) == "number", "bad argument #3 to Postie.InvokeClient, expects number");
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        v17 = false;
        local v19 = #v9 + 1;
        local v20 = l_HttpService_0:GenerateGUID(false);
        v9[v19] = function(v21, v22, ...) --[[ Line: 123 ]]
            -- upvalues: v15 (copy), v20 (copy), v17 (ref), v9 (ref), v19 (copy), l_BindableEvent_1 (copy)
            if v21 ~= v15 or v22 ~= v20 then
                return false;
            else
                v17 = true;
                table.remove(v9, v19);
                l_BindableEvent_1:Fire(true, ...);
                return true;
            end;
        end;
        v13(function() --[[ Line: 131 ]]
            -- upvalues: v16 (copy), v17 (ref), v9 (ref), v19 (copy), l_BindableEvent_1 (copy)
            task.wait(v16);
            if v17 then
                return;
            else
                table.remove(v9, v19);
                l_BindableEvent_1:Fire(false);
                return;
            end;
        end);
        l_Sent_0:FireClient(v15, v14, v20, ...);
        return l_BindableEvent_1.Event:Wait();
    end, 
    InvokeServer = function(v23, v24, ...) --[[ Line: 143 ]] --[[ Name: InvokeServer ]]
        -- upvalues: v7 (copy), v9 (copy), l_HttpService_0 (copy), v13 (copy), l_Sent_0 (copy)
        assert(not v7, "Postie.InvokeServer can only be called from the client");
        assert(typeof(v23) == "string", "bad argument #1 to Postie.InvokeServer, expects string");
        assert(typeof(v24) == "number", "bad argument #2 to Postie.InvokeServer, expects number");
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        local v26 = false;
        local v27 = #v9 + 1;
        local v28 = l_HttpService_0:GenerateGUID(false);
        v9[v27] = function(v29, ...) --[[ Line: 153 ]]
            -- upvalues: v28 (copy), v26 (ref), v9 (ref), v27 (copy), l_BindableEvent_2 (copy)
            if v29 ~= v28 then
                return false;
            else
                v26 = true;
                table.remove(v9, v27);
                l_BindableEvent_2:Fire(true, ...);
                return true;
            end;
        end;
        v13(function() --[[ Line: 161 ]]
            -- upvalues: v24 (copy), v26 (ref), v9 (ref), v27 (copy), l_BindableEvent_2 (copy)
            task.wait(v24);
            if v26 then
                return;
            else
                table.remove(v9, v27);
                l_BindableEvent_2:Fire(false);
                return;
            end;
        end);
        l_Sent_0:FireServer(v23, v28, ...);
        return l_BindableEvent_2.Event:Wait();
    end, 
    SetCallback = function(v30, v31) --[[ Line: 173 ]] --[[ Name: SetCallback ]]
        -- upvalues: v8 (copy)
        assert(typeof(v30) == "string", "bad argument #1 to Postie.SetCallback, expects string");
        v8[v30] = v31;
    end, 
    GetCallback = function(v32) --[[ Line: 179 ]] --[[ Name: GetCallback ]]
        -- upvalues: v8 (copy)
        assert(typeof(v32) == "string", "bad argument #1 to Postie.GetCallback, expects string");
        return v8[v32];
    end
};
if v7 then
    l_Received_0.OnServerEvent:Connect(function(...) --[[ Line: 189 ]]
        -- upvalues: v9 (copy)
        for _, v35 in v9 do
            if v35(...) then
                return;
            end;
        end;
    end);
    l_Sent_0.OnServerEvent:Connect(function(v36, v37, v38, ...) --[[ Line: 195 ]]
        -- upvalues: v8 (copy), l_Received_0 (copy)
        local v39 = v8[v37];
        l_Received_0:FireClient(v36, v38, v39 and v39(v36, ...));
    end);
    return v33;
else
    l_Received_0.OnClientEvent:Connect(function(...) --[[ Line: 201 ]]
        -- upvalues: v9 (copy)
        for _, v41 in v9 do
            if v41(...) then
                return;
            end;
        end;
    end);
    l_Sent_0.OnClientEvent:Connect(function(v42, v43, ...) --[[ Line: 207 ]]
        -- upvalues: v8 (copy), l_Received_0 (copy)
        local v44 = v8[v42];
        l_Received_0:FireServer(v43, v44 and v44(...));
    end);
    return v33;
end;