local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Assert);
local v3 = require(script.Parent.Parent.Event);
local l_Reliable_0 = v3.Reliable;
local l_Unreliable_0 = v3.Unreliable;
local l_Request_0 = v3.Request;
local v7 = require(script.Parent.Parent.Signal)("Warp_OnSpamSignal");
local v8 = {};
local v9 = {};
local v10 = {};
setmetatable(v10, {
    __index = v8, 
    __newindex = function(_, v12, v13) --[[ Line: 14 ]] --[[ Name: __newindex ]]
        -- upvalues: v9 (copy), v8 (copy), v7 (copy)
        if not v9[v12] then
            v9[v12] = os.clock();
        end;
        if os.clock() - v9[v12] >= 1 then
            v9[v12] = os.clock();
            v8[v12] = 1;
            return;
        elseif v13 >= 100 then
            v7:Fire(v12);
            return;
        else
            v8[v12] = v13;
            return;
        end;
    end
});
local function v16(v14) --[[ Line: 31 ]] --[[ Name: onReceived ]]
    -- upvalues: v10 (copy)
    if not v10[v14] then
        v10[v14] = 1;
        return;
    else
        local l_v10_0 = v10;
        l_v10_0[v14] = l_v10_0[v14] + 1;
        return;
    end;
end;
v0.create = function(v17, v18, v19) --[[ Line: 39 ]] --[[ Name: create ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy), l_Reliable_0 (copy)
    v2(typeof(v17) == "string", "Identifier must a string type.");
    if l_RunService_0:IsServer() then
        v2(typeof(v18) == "number", "entrance must a number type.");
        v2(v18 > 0, "entrance must above 0.");
        l_Reliable_0:SetAttribute(v17 .. "_ent", v18);
        l_Reliable_0:SetAttribute(v17 .. "_int", v19);
    else
        while not l_Reliable_0:GetAttribute(v17 .. "_ent") or not l_Reliable_0:GetAttribute(v17 .. "_int") do
            task.wait(0.1);
        end;
        v18 = tonumber(l_Reliable_0:GetAttribute(v17 .. "_ent"));
        v19 = tonumber(l_Reliable_0:GetAttribute(v17 .. "_int"));
    end;
    local v20 = 0;
    return function(v21) --[[ Line: 54 ]]
        -- upvalues: v20 (ref), v19 (ref), v18 (ref)
        if v20 == 0 then
            task.delay(v19, function() --[[ Line: 56 ]]
                -- upvalues: v20 (ref)
                v20 = 0;
            end);
        end;
        v20 = v20 + (v21 or 1);
        return v20 <= v18;
    end;
end;
v0.Protect = function() --[[ Line: 65 ]] --[[ Name: Protect ]]
    -- upvalues: l_RunService_0 (copy), l_Reliable_0 (copy), l_Unreliable_0 (copy), l_Request_0 (copy), v16 (copy)
    if not l_RunService_0:IsServer() or l_Reliable_0:GetAttribute("Protected") or l_Unreliable_0:GetAttribute("Protected") or l_Request_0:GetAttribute("Protected") then
        return;
    else
        l_Reliable_0:SetAttribute("Protected", true);
        l_Unreliable_0:SetAttribute("Protected", true);
        l_Request_0:SetAttribute("Protected", true);
        l_Reliable_0.OnServerEvent:Connect(v16);
        l_Unreliable_0.OnServerEvent:Connect(v16);
        l_Request_0.OnServerEvent:Connect(v16);
        return;
    end;
end;
return v0;