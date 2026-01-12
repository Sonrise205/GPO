local l_Promises_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules").Shared.Promises;
local v1 = require(l_Promises_0.Promise2);
local v2 = require(script.Parent.ReplicaClient);
local v3 = {};
local v4 = {};
local v9 = {
    GetReplica = function(_, v6) --[[ Line: 20 ]] --[[ Name: GetReplica ]]
        -- upvalues: v3 (copy), v4 (copy), v1 (copy), v2 (copy)
        if v3[v6] ~= nil then
            return v3[v6];
        else
            if not v4[v6] then
                v4[v6] = v1.new(function(v7) --[[ Line: 27 ]]
                    -- upvalues: v2 (ref), v6 (copy), v3 (ref)
                    v2.OnNew(v6, function(v8) --[[ Line: 28 ]]
                        -- upvalues: v3 (ref), v6 (ref), v7 (copy)
                        v3[v6] = v8;
                        v7(v8);
                    end);
                end);
            end;
            return v4[v6]:expect();
        end;
    end
};
v9.GetPlayerDataReplica = function(_) --[[ Line: 38 ]] --[[ Name: GetPlayerDataReplica ]]
    -- upvalues: v9 (copy)
    return v9:GetReplica("PlayerData");
end;
v9.Initialize = function() --[[ Line: 42 ]] --[[ Name: Initialize ]]
    -- upvalues: v2 (copy)
    v2.RequestData();
end;
return v9;