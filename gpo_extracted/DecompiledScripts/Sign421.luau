local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Marketplace_0 = l_ReplicatedStorage_0:WaitForChild("Modules").Shared.Marketplace;
local _ = require(l_Marketplace_0.MarketplaceUtils);
local v5 = require(l_Marketplace_0.Products);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v9 = setmetatable({}, v6);
    v9.Model = v7;
    v9.Parent = v9.Model.Parent;
    v9.Prompt = v9.Model.board.Prompt;
    v9.Player = nil;
    v9.Handler = v8;
    v9:_main();
    return v9;
end;
v6._main = function(v10) --[[ Line: 27 ]] --[[ Name: _main ]]
    -- upvalues: l_MarketplaceService_0 (copy), v5 (copy), l_Players_0 (copy)
    v10.Prompt.Triggered:Connect(function(v11) --[[ Line: 31 ]]
        -- upvalues: v10 (copy), l_MarketplaceService_0 (ref), v5 (ref)
        if v10.Player then
            return;
        else
            v10.Player = v11;
            l_MarketplaceService_0:PromptProductPurchase(v11, v5:GetProductIdByPlace("Rent Statue"));
            return;
        end;
    end);
    l_MarketplaceService_0.PromptProductPurchaseFinished:Connect(function(_, v13, _) --[[ Line: 39 ]]
        -- upvalues: v5 (ref), v10 (copy)
        if v5:GetProductIdByPlace("Rent Statue") == v13 then
            v10.Player = nil;
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function(v15) --[[ Line: 46 ]]
        -- upvalues: v10 (copy)
        if v15 ~= v10.Player then
            return;
        else
            v10.Player = nil;
            return;
        end;
    end);
end;
v6.invisible = function(v16, v17) --[[ Line: 52 ]] --[[ Name: invisible ]]
    if v17 then
        v16.Model.Parent = nil;
        return;
    else
        v16.Model.Parent = v16.Parent;
        return;
    end;
end;
return v6;