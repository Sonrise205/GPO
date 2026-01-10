local l_Players_0 = game:GetService("Players");
local v1 = {};
if game["Run Service"]:IsClient() == true then
    script.RemoteEvent.OnClientEvent:Connect(function(v2, v3) --[[ Line: 6 ]]
        -- upvalues: v1 (copy)
        v1[v2] = v3;
    end);
end;
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), l_Players_0 (copy)
    if v1[v4] then
        return v1[v4];
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v4);
        if l_l_Players_0_PlayerByUserId_0 then
            v1[v4] = l_l_Players_0_PlayerByUserId_0.Name;
            return l_l_Players_0_PlayerByUserId_0.Name;
        else
            local v6 = "N/A";
            local l_status_0, _ = pcall(function() --[[ Line: 21 ]]
                -- upvalues: v6 (ref), l_Players_0 (ref), v4 (copy)
                v6 = l_Players_0:GetNameFromUserIdAsync(v4);
            end);
            if l_status_0 == true then
                v1[v4] = v6;
            end;
            if game["Run Service"]:IsClient() == false and l_status_0 == true then
                pcall(function() --[[ Line: 28 ]]
                    -- upvalues: v4 (copy), v6 (ref)
                    script.RemoteEvent:FireClient(v4, v6);
                end);
            end;
            return v6;
        end;
    end;
end;