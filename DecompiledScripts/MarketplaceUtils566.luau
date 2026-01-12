local _ = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Promises_0 = script.Parent.Parent.Promises;
local v3 = require(l_Promises_0.Promise);
return {
    PromiseGetProductInfo = function(v4, v5) --[[ Line: 12 ]] --[[ Name: PromiseGetProductInfo ]]
        -- upvalues: v3 (copy), l_MarketplaceService_0 (copy)
        return v3.spawn(function(v6, v7) --[[ Line: 13 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v4 (copy), v5 (copy)
            local v8 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
                -- upvalues: v8 (ref), l_MarketplaceService_0 (ref), v4 (ref), v5 (ref)
                v8 = l_MarketplaceService_0:GetProductInfo(v4, v5 or Enum.InfoType.Asset);
            end);
            if not l_status_0 then
                v7(l_result_0);
            end;
            v6(v8);
        end);
    end, 
    convertAssetTypeIdToAssetType = function(v11) --[[ Line: 29 ]] --[[ Name: convertAssetTypeIdToAssetType ]]
        assert(type(v11) == "number", "Bad assetTypeId");
        for _, v13 in pairs(Enum.AssetType:GetEnumItems()) do
            if v13.Value == v11 then
                return v13;
            end;
        end;
        return nil;
    end, 
    convertAssetTypeIdToAvatarAssetType = function(v14) --[[ Line: 41 ]] --[[ Name: convertAssetTypeIdToAvatarAssetType ]]
        assert(type(v14) == "number", "Bad assetTypeId");
        for _, v16 in pairs(Enum.AvatarAssetType:GetEnumItems()) do
            if v16.Value == v14 then
                return v16;
            end;
        end;
        return nil;
    end, 
    promiseUserOwnsGamePass = function(v17, v18) --[[ Line: 53 ]] --[[ Name: promiseUserOwnsGamePass ]]
        -- upvalues: v3 (copy), l_MarketplaceService_0 (copy)
        assert(typeof(v17) == "number", "Bad userId");
        assert(type(v18) == "number", "Bad gamePassId");
        return v3.spawn(function(v19, v20) --[[ Line: 57 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v17 (copy), v18 (copy)
            local v21 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 59 ]]
                -- upvalues: v21 (ref), l_MarketplaceService_0 (ref), v17 (ref), v18 (ref)
                v21 = l_MarketplaceService_0:UserOwnsGamePassAsync(v17, v18);
            end);
            if not l_status_1 then
                return v20(l_result_1);
            elseif type(v21) ~= "boolean" then
                return v20("Bad result type");
            else
                return v19(v21);
            end;
        end);
    end, 
    promisePlayerOwnsAsset = function(v24, v25) --[[ Line: 72 ]] --[[ Name: promisePlayerOwnsAsset ]]
        -- upvalues: v3 (copy), l_MarketplaceService_0 (copy)
        assert(typeof(v24) == "Instance", "Bad player");
        assert(type(v25) == "number", "Bad assetId");
        return v3.spawn(function(v26, v27) --[[ Line: 76 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v24 (copy), v25 (copy)
            local v28 = nil;
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 78 ]]
                -- upvalues: v28 (ref), l_MarketplaceService_0 (ref), v24 (ref), v25 (ref)
                v28 = l_MarketplaceService_0:PlayerOwnsAsset(v24, v25);
            end);
            if not l_status_2 then
                return v27(l_result_2);
            elseif type(v28) ~= "boolean" then
                return v27("Bad result type");
            else
                return v26(v28);
            end;
        end);
    end, 
    promisePlayerOwnsBundle = function(v31, v32) --[[ Line: 91 ]] --[[ Name: promisePlayerOwnsBundle ]]
        -- upvalues: v3 (copy), l_MarketplaceService_0 (copy)
        assert(typeof(v31) == "Instance", "Bad player");
        assert(type(v32) == "number", "Bad bundleId");
        return v3.spawn(function(v33, v34) --[[ Line: 95 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v31 (copy), v32 (copy)
            local v35 = nil;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 97 ]]
                -- upvalues: v35 (ref), l_MarketplaceService_0 (ref), v31 (ref), v32 (ref)
                v35 = l_MarketplaceService_0:PlayerOwnsBundle(v31, v32);
            end);
            if not l_status_3 then
                return v34(l_result_3);
            elseif type(v35) ~= "boolean" then
                return v34("Bad result type");
            else
                return v33(v35);
            end;
        end);
    end
};