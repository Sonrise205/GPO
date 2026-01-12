local l_Players_0 = game:GetService("Players");
local v1 = {};
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.New = function(v4, v5) --[[ Line: 41 ]] --[[ Name: New ]]
    -- upvalues: v3 (copy), v2 (copy)
    if v4 <= 0 then
        error("[RateLimit]: Invalid rate");
    end;
    local v6 = {
        sources = {}, 
        rate_period = 1 / v4, 
        is_full_wait = v5 == true
    };
    setmetatable(v6, v3);
    v2[v6] = true;
    return v6;
end;
v3.CheckRate = function(v7, v8) --[[ Line: 58 ]] --[[ Name: CheckRate ]]
    -- upvalues: v1 (copy)
    local l_sources_0 = v7.sources;
    local v10 = os.clock();
    if v8 == nil then
        v8 = "nil";
    end;
    local v11 = l_sources_0[v8];
    if v11 ~= nil then
        if v7.is_full_wait ~= true then
            v11 = math.max(v10, v11 + v7.rate_period);
            if v11 - v10 < 1 then
                l_sources_0[v8] = v11;
                return true;
            else
                return false;
            end;
        elseif v11 <= v10 then
            l_sources_0[v8] = v10 + v7.rate_period;
            return true;
        else
            return false;
        end;
    elseif typeof(v8) == "Instance" and v8:IsA("Player") and v1[v8] == nil then
        return false;
    else
        l_sources_0[v8] = v10 + v7.rate_period;
        return true;
    end;
end;
v3.CleanSource = function(v12, v13) --[[ Line: 98 ]] --[[ Name: CleanSource ]]
    v12.sources[v13] = nil;
end;
v3.Cleanup = function(v14) --[[ Line: 102 ]] --[[ Name: Cleanup ]]
    v14.sources = {};
end;
v3.Destroy = function(v15) --[[ Line: 106 ]] --[[ Name: Destroy ]]
    -- upvalues: v2 (copy)
    v2[v15] = nil;
end;
for _, v17 in ipairs(l_Players_0:GetPlayers()) do
    v1[v17] = true;
end;
l_Players_0.PlayerAdded:Connect(function(v18) --[[ Line: 116 ]]
    -- upvalues: v1 (copy)
    v1[v18] = true;
end);
l_Players_0.PlayerRemoving:Connect(function(v19) --[[ Line: 120 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1[v19] = nil;
    for v20 in pairs(v2) do
        v20.sources[v19] = nil;
    end;
end);
return v3;