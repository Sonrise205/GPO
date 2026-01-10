--!native
local v0 = {};
local v1 = game:GetService("RunService"):IsServer();
local l_Util_0 = script.Util;
local l_Server_0 = script.Server;
local l_Client_0 = script.Client;
local _ = require(script.Type);
local v6 = require(l_Util_0.Assert);
local v7 = require(script.Signal);
local v8 = require(l_Util_0.Buffer);
local v9 = v7("Warp_OnSpamSignal");
if v1 then
    require(l_Server_0.ServerProcess).start();
else
    require(l_Client_0.ClientProcess).start();
end;
v0.OnSpamSignal = v9;
v0.Server = function(v10, v11) --[[ Line: 28 ]] --[[ Name: Server ]]
    -- upvalues: v6 (copy), v1 (copy), l_Server_0 (copy)
    v6(v1, (("[Warp]: Calling .Server(%*) on client side (expected server side)"):format(v10)));
    v6(typeof(v10) == "string", (("[Warp]: Identifier must be a string type, got %*"):format((typeof(v10)))));
    return (require(l_Server_0.Index)(v10, v11));
end;
v0.Client = function(v12, v13) --[[ Line: 33 ]] --[[ Name: Client ]]
    -- upvalues: v6 (copy), v1 (copy), l_Client_0 (copy)
    v6(not v1, (("[Warp]: Calling .Client(%*) on server side (expected client side)"):format(v12)));
    v6(typeof(v12) == "string", (("[Warp]: Identifier must be a string type, got %*"):format((typeof(v12)))));
    return (require(l_Client_0.Index)(v12, v13));
end;
v0.fromServerArray = function(v14) --[[ Line: 39 ]] --[[ Name: fromServerArray ]]
    -- upvalues: v6 (copy), v1 (copy), v0 (copy)
    v6(v1, (("[Warp]: Calling .fromServerArray(%*) on client side (expected server side)"):format(v14)));
    v6(typeof(v14) == "table", "[Warp]: Array must be a table type, got {typeof(arrays)}");
    local v15 = {};
    for v16, v17 in v14 do
        if typeof(v17) == "table" then
            v15[v16] = v0.Server(v16, v17);
        else
            v15[v17] = v0.Server(v17);
        end;
    end;
    return v15;
end;
v0.fromClientArray = function(v18) --[[ Line: 53 ]] --[[ Name: fromClientArray ]]
    -- upvalues: v6 (copy), v1 (copy), v0 (copy)
    v6(not v1, (("[Warp]: Calling .fromClientArray(%*) on server side (expected client side)"):format(v18)));
    v6(typeof(v18) == "table", (("[Warp]: Array must be a table type, got %*"):format((typeof(v18)))));
    local v19 = {};
    for v20, v21 in v18 do
        if typeof(v21) == "table" then
            v19[v20] = v0.Client(v20, v21);
        else
            v19[v21] = v0.Client(v21);
        end;
    end;
    return v19;
end;
v0.Signal = function(v22) --[[ Line: 67 ]] --[[ Name: Signal ]]
    -- upvalues: v7 (copy)
    return v7(v22);
end;
v0.fromSignalArray = function(v23) --[[ Line: 71 ]] --[[ Name: fromSignalArray ]]
    -- upvalues: v6 (copy), v0 (copy)
    v6(typeof(v23) == "table", (("[Warp]: Array must be a table type, got %*"):format((typeof(v23)))));
    local v24 = {};
    for _, v26 in v23 do
        v24[v26] = v0.Signal(v26);
    end;
    return v24;
end;
v0.buffer = function() --[[ Line: 80 ]] --[[ Name: buffer ]]
    -- upvalues: v8 (copy)
    return v8.new();
end;
return (table.freeze(v0));