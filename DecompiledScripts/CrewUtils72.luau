local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v9 = {
    GetMemberCount = function(v3) --[[ Line: 7 ]] --[[ Name: GetMemberCount ]]
        local v4 = 0;
        for _, v6 in pairs(v3.Members) do
            for _, _ in pairs(v6) do
                v4 = v4 + 1;
            end;
        end;
        return v4;
    end
};
local v10 = {};
v9.IsImageIdValid = function(v11) --[[ Line: 20 ]] --[[ Name: IsImageIdValid ]]
    -- upvalues: v10 (copy), l_MarketplaceService_0 (copy)
    if v10[v11] ~= nil then
        return v10[v11].Success, v10[v11].Result;
    else
        local v12 = nil;
        local l_status_0, _ = pcall(function() --[[ Line: 28 ]]
            -- upvalues: v12 (ref), l_MarketplaceService_0 (ref), v11 (copy)
            v12 = l_MarketplaceService_0:GetProductInfo(v11, Enum.InfoType.Asset);
        end);
        if not l_status_0 then
            return false, "Roblox error has occured";
        else
            local v15 = {
                [1] = true, 
                [13] = true
            };
            if l_status_0 and v12 and v15[v12.AssetTypeId] ~= true then
                v10[v11] = {
                    Success = false, 
                    Result = "Invalid Image Id"
                };
                return false, "Invalid Image Id";
            else
                v10[v11] = {
                    Success = true, 
                    Result = v12
                };
                return l_status_0, v12;
            end;
        end;
    end;
end;
v9.IsPositiveInteger = function(v16) --[[ Line: 52 ]] --[[ Name: IsPositiveInteger ]]
    if type(v16) ~= "number" then
        return false;
    elseif v16 ~= v16 or v16 <= 0 then
        return false;
    else
        return v16 % 1 == 0;
    end;
end;
v9.WaitForStatsFolder = function(v17, v18) --[[ Line: 64 ]] --[[ Name: WaitForStatsFolder ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Players_0 (copy)
    v18 = v18 or 1.5;
    local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. v17.Name);
    if l_l_ReplicatedStorage_0_FirstChild_0 == nil then
        while l_l_ReplicatedStorage_0_FirstChild_0 == nil and v17:IsDescendantOf(l_Players_0) do
            l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. v17.Name);
            if l_l_ReplicatedStorage_0_FirstChild_0 == nil then
                task.wait(v18);
            else
                break;
            end;
        end;
    end;
    return l_l_ReplicatedStorage_0_FirstChild_0;
end;
v9.GetLowestRankInCrew = function(v20) --[[ Line: 88 ]] --[[ Name: GetLowestRankInCrew ]]
    local l_Ranks_0 = v20.Ranks;
    local v22 = nil;
    local v23 = 1e999;
    for v24, v25 in pairs(l_Ranks_0) do
        if v25.Id < v23 then
            v23 = v25.Id;
            v22 = v24;
        end;
    end;
    return v22;
end;
v9.GetDefaultRank = function(v26) --[[ Line: 104 ]] --[[ Name: GetDefaultRank ]]
    local l_Ranks_1 = v26.Ranks;
    local v28 = nil;
    for v29, v30 in pairs(l_Ranks_1) do
        if v30.IsDefault == true then
            return v29;
        end;
    end;
    return v28;
end;
v9.GetRankInCrew = function(v31, v32) --[[ Line: 118 ]] --[[ Name: GetRankInCrew ]]
    local v33 = v32.Members or nil;
    if v33 == nil then
        return "Unable to get rank (Invalid Members)";
    else
        local v34 = nil;
        for v35, v36 in pairs(v33) do
            if v36[tostring(v31.UserId)] ~= nil then
                return v35;
            end;
        end;
        return v34;
    end;
end;
v9.GetRankInCrewById = function(v37, v38) --[[ Line: 136 ]] --[[ Name: GetRankInCrewById ]]
    local v39 = v38.Members or nil;
    if v39 == nil then
        return "Unable to get rank (Invalid Members)";
    else
        local v40 = nil;
        local v41 = nil;
        for v42, v43 in pairs(v39) do
            if v43[tostring(v37)] ~= nil then
                return v42, v43[tostring(v37)];
            end;
        end;
        return v40, v41;
    end;
end;
return v9;