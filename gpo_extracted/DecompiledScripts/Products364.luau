local l_RunService_0 = game:GetService("RunService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v4 = require(game.ReplicatedStorage.Modules.ToolDesc);
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {
    ListByName = {
        ["2x EXP (15 Minutes)"] = {
            Main = 606947457, 
            Test = 1687289602, 
            CanGift = true
        }, 
        ["2x EXP (5 Minutes)"] = {
            Main = 3457788725, 
            Test = 3457774650, 
            CanGift = true, 
            Ads = {
                Limit = -1
            }
        }, 
        ["Devil Fruit Remover"] = {
            Main = 1031589075, 
            Test = 1687293618, 
            CanGift = true, 
            hasDeal = {
                PurchaseCount = 3, 
                bonusCount = 2, 
                Active = true
            }
        }, 
        ["Devil Fruit Notifier (1 Hour)"] = {
            Main = 1059644849, 
            Test = 1687294663, 
            CanGift = true
        }, 
        ["2x Drop Rates (1 Hour)"] = {
            Main = 1114835757, 
            Test = 1687296109, 
            CanGift = true
        }, 
        ["2x Drop Rates (5 Mins)"] = {
            Main = 3457789187, 
            Test = 3457783012, 
            CanGift = true, 
            Ads = {
                Limit = -1
            }
        }, 
        ["Custom Observation Color"] = {
            Main = 1129612721, 
            Test = 1687302350, 
            CanGift = true
        }, 
        Hoverboard = {
            Main = 1149063054, 
            Test = 1148100236, 
            CanGift = true
        }, 
        ["Coffin Boat"] = {
            Main = 1173741141, 
            Test = 1172091385, 
            CanGift = true
        }, 
        Striker = {
            Main = 1173741065, 
            Test = 1172091340, 
            CanGift = true
        }, 
        ["Trading Sign"] = {
            Main = 1173741227, 
            Test = 1172565068, 
            CanGift = true
        }, 
        ["Custom Spirit Color"] = {
            Main = 1203263798, 
            Test = 1201491213, 
            CanGift = true
        }, 
        ["Golden Hammer"] = {
            Main = 1204758257, 
            Test = 1687303320, 
            CanGift = true
        }, 
        ["Fruit Bag"] = {
            Main = 1219019424, 
            Test = 1210163773, 
            CanGift = true
        }, 
        ["SP Reset Essence"] = {
            Main = 1221504949, 
            Test = 1221358507, 
            CanGift = true, 
            hasDeal = {
                PurchaseCount = 3, 
                bonusCount = 2, 
                Active = true
            }
        }, 
        ["Devil Fruit Journal"] = {
            Main = 1276740776, 
            Test = 1263521933, 
            CanGift = true
        }, 
        ["Bomi's Log Pose"] = {
            Main = 1276740934, 
            Test = 1271710564, 
            CanGift = true
        }, 
        ["All Seeing Eye"] = {
            Main = 1276737886, 
            Test = 1272696393, 
            CanGift = true, 
            hasDeal = {
                PurchaseCount = 2, 
                bonusCount = 1, 
                Active = false
            }
        }, 
        ["Thrilled Ship"] = {
            Main = 1276737887, 
            Test = 1273313185, 
            CanGift = true
        }, 
        ["Drippy Fit V2"] = {
            Main = 1279587844, 
            Test = 1279382524, 
            CanGift = true
        }, 
        ["Hollow's Great Sword"] = {
            Main = 1690202836, 
            Test = 1686450992, 
            CanGift = true
        }, 
        ["Hollow's Halberd"] = {
            Main = 1690204815, 
            Test = 1686450991, 
            CanGift = true
        }, 
        ["Hollow Bundle"] = {
            Main = 1690205795, 
            Test = 1686451243, 
            CanGift = true
        }, 
        ["Ani Bundle"] = {
            Main = 1714245752, 
            Test = 1713084224, 
            CanGift = true
        }, 
        ["Reroll Impel Shop"] = {
            Main = 1690206194, 
            Test = 1672430317, 
            CanGift = false
        }, 
        ["Impel Revive"] = {
            Main = 1690206370, 
            Test = 1684462487, 
            CanGift = false
        }, 
        ["Roll Grip"] = {
            Ignore = true, 
            Main = 0, 
            Test = 1383839888, 
            CanGift = false
        }, 
        ["Roll Grip x10"] = {
            Main = 1561375720, 
            Test = 1384435588, 
            CanGift = false
        }, 
        ["Reroll Crew Shop"] = {
            Main = 1745354421, 
            Test = 1744530126, 
            CanGift = false
        }, 
        ["Create Crew"] = {
            Main = 1746145258, 
            Test = 1746144519, 
            CanGift = false
        }, 
        ["Karoo Mount"] = {
            Main = 1203263569, 
            Test = 1194261894, 
            CanGift = false
        }, 
        ["Race Reroll x1"] = {
            Main = 940683010, 
            Test = 1772098502, 
            CanGift = true, 
            isPaidRandomItem = true, 
            Ads = {
                Limit = -1, 
                LevelRequirement = 50
            }
        }, 
        ["Race Reroll x5"] = {
            Main = 1173707665, 
            Test = 1772098568, 
            CanGift = true, 
            isPaidRandomItem = true
        }, 
        ["Race Reroll x10"] = {
            Main = 1170438674, 
            Test = 1772098688, 
            CanGift = true, 
            isPaidRandomItem = true
        }, 
        ["Race Reroll x50"] = {
            Main = 1170438820, 
            Test = 1772098795, 
            CanGift = true, 
            isPaidRandomItem = true
        }, 
        ["SP Reset"] = {
            Main = 699566079, 
            Test = 1687838557, 
            CanGift = false
        }, 
        Shout = {
            Main = 1690224383, 
            Test = 1688464804, 
            CanGift = false
        }, 
        ["Myth Chest"] = {
            Main = 1561376503, 
            Test = 1546543569, 
            CanGift = false, 
            isPaidRandomItem = true
        }, 
        ["Myth Chest (Discount)"] = {
            Main = 1561376165, 
            Test = 1688055658, 
            CanGift = false, 
            isPaidRandomItem = true
        }, 
        ["Rent Statue"] = {
            Main = 1690205584, 
            Test = 1688991516, 
            CanGift = false
        }, 
        ["Reroll Sulong Fur Color"] = {
            Main = 1772126612, 
            Test = 1767619010, 
            CanGift = false
        }, 
        ["Flower Sword"] = {
            Main = 1772126056, 
            Test = 1770044820, 
            CanGift = true
        }, 
        ["Mini Bunny"] = {
            Main = 1792833152, 
            Test = 1791904719, 
            CanGift = true
        }, 
        ["Egg Phone"] = {
            Main = 3275829701, 
            Test = 3274619899, 
            CanGift = true
        }, 
        ["Yukio The Bunny"] = {
            Main = 1808123676, 
            Test = 1808117682, 
            CanGift = true
        }, 
        ["Mythical Fruit Chest"] = {
            Main = 1792833338, 
            Test = 1841951511, 
            CanGift = true, 
            isPaidRandomItem = true, 
            hasDeal = {
                PurchaseCount = 2, 
                bonusCount = 1, 
                Active = true
            }
        }, 
        ["Nightfall Shroud"] = {
            Main = 2529637068, 
            Test = 2528590257, 
            CanGift = false
        }, 
        ["Legendary Fruit Chest Blueprint"] = {
            Main = 2318978315, 
            Test = 2155410101, 
            CanGift = true, 
            isPaidRandomItem = true
        }, 
        ["Cupid's Bow"] = {
            Main = 3033042858, 
            Test = 3033003160, 
            CanGift = true
        }, 
        ["Mega-Pow"] = {
            Main = 3229667746, 
            Test = 3227767705, 
            CanGift = true
        }, 
        ["Blo's Sledgehammer"] = {
            Main = 3275829420, 
            Test = 3274066137, 
            CanGift = true
        }, 
        ["Nightfall Half Shroud"] = {
            Main = 3434369141, 
            Test = 3418858695, 
            CanGift = false
        }, 
        ["Special Tailor Token"] = {
            Main = 3434369970, 
            Test = 3428454551, 
            CanGift = true
        }, 
        ["Blood Scythe"] = {
            Main = 3434369619, 
            Test = 3432417248, 
            CanGift = true
        }, 
        ["Hollow's World Ender"] = {
            Main = 3440321359, 
            Test = 3440138981, 
            CanGift = true
        }, 
        ["Extra Loadout Slot"] = {
            Main = 3445112053, 
            Test = 3443645867, 
            CanGift = true
        }, 
        ["All Seeing Ba'al"] = {
            Main = 3445112306, 
            Test = 3444445734, 
            CanGift = true, 
            hasDeal = {
                PurchaseCount = 2, 
                bonusCount = 1, 
                Active = true
            }
        }, 
        ["Iceborn Gunblade"] = {
            Main = 2679077976, 
            Test = 2679017342, 
            CanGift = true
        }, 
        ["Iceborn Katana"] = {
            Main = 3488363893, 
            Test = 3484838284, 
            CanGift = true
        }, 
        ["Iceborn Blade"] = {
            Main = 1714246497, 
            Test = 3484838826, 
            CanGift = true
        }, 
        ["Iceborn Daggers"] = {
            Main = 3488365077, 
            Test = 3484879430, 
            CanGift = true
        }, 
        ["Iceborn Rapier"] = {
            Main = 3488365301, 
            Test = 3487749471, 
            CanGift = true
        }, 
        ["All Seeing Holly"] = {
            Main = 3488363171, 
            Test = 3484879431, 
            CanGift = true, 
            hasDeal = {
                PurchaseCount = 2, 
                bonusCount = 1, 
                Active = true
            }
        }
    }, 
    ListById = {}
};
for v7, v8 in pairs(v6.ListByName) do
    if v8.Ignore ~= true then
        for v9, v10 in pairs(v8) do
            if v10 == 0 then
                print("ProductId Not Set for", v7, "in", v9);
            else
                v6.ListById[v10] = v7;
            end;
        end;
    end;
end;
v6.GetProductsByName = function(_) --[[ Line: 133 ]] --[[ Name: GetProductsByName ]]
    -- upvalues: v6 (copy)
    return v6.ListByName;
end;
v6.GetProducts = v6.GetProductsByName;
v6.GetProductsById = function(_) --[[ Line: 139 ]] --[[ Name: GetProductsById ]]
    -- upvalues: v6 (copy)
    return v6.ListById;
end;
v6.GetProductIdByPlace = function(_, v14) --[[ Line: 143 ]] --[[ Name: GetProductIdByPlace ]]
    -- upvalues: v6 (copy)
    local v15 = v6:GetProductsByName()[v14];
    return game.GameId == 648454481 == true and v15.Main or v15.Test;
end;
v6.AddCallbackTo = function(v16, v17) --[[ Line: 152 ]] --[[ Name: AddCallbackTo ]]
    if v16 then
        v16.Callback = v17;
    end;
end;
if l_RunService_0:IsClient() then
    local l_v6_ProductsByName_0 = v6:GetProductsByName();
    local function _(v19) --[[ Line: 167 ]] --[[ Name: IsGiftedPlayerLoaded ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy)
        if not v19:IsDescendantOf(l_Players_0) then
            return false;
        else
            local l_Loaded_0 = v19:FindFirstChild("Loaded");
            if not l_Loaded_0 then
                return false;
            elseif l_Loaded_0.Value == false then
                return false;
            elseif not l_ReplicatedStorage_0:FindFirstChild("Stats" .. v19.Name) then
                return false;
            else
                return true;
            end;
        end;
    end;
    local function _() --[[ Line: 190 ]] --[[ Name: IsServerReady ]]
        if script:GetAttribute("ServerLoaded") == true then
            return true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            return false;
        end;
    end;
    local function _(v23, v24) --[[ Line: 202 ]] --[[ Name: returnBasicCallback ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        if v24 == nil then
            v24 = v23;
        end;
        return function(v25, v26) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (ref), l_ReplicatedStorage_0 (ref), v23 (copy), v4 (ref), l_MarketplaceService_0 (ref), v6 (ref), v24 (ref)
            local v27;
            if script:GetAttribute("ServerLoaded") == true then
                v27 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v27 = false;
            end;
            if v27 == false then
                return;
            else
                if v26 then
                    if not v26:IsDescendantOf(l_Players_0) then
                        v27 = false;
                    else
                        local l_Loaded_1 = v26:FindFirstChild("Loaded");
                        v27 = not not l_Loaded_1 and not (l_Loaded_1.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v26.Name) and true or false);
                    end;
                    if v27 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v27 = v26 or v25;
                if _G.CheckItemAmmount(v27, v23) < v4[v23].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v25, v6:GetProductIdByPlace(v24));
                    return true;
                else
                    local v29 = v26 and "<Color=Red>" .. v26.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v29);
                    return false;
                end;
            end;
        end;
    end;
    local function _(v31) --[[ Line: 232 ]] --[[ Name: bundleCallback ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v6_ProductsByName_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        return function(v32, v33) --[[ Line: 233 ]]
            -- upvalues: l_Players_0 (ref), l_ReplicatedStorage_0 (ref), l_v6_ProductsByName_0 (ref), v31 (copy), v4 (ref), l_MarketplaceService_0 (ref), v6 (ref)
            local v34;
            if script:GetAttribute("ServerLoaded") == true then
                v34 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v34 = false;
            end;
            if v34 == false then
                return;
            else
                if v33 then
                    if not v33:IsDescendantOf(l_Players_0) then
                        v34 = false;
                    else
                        local l_Loaded_2 = v33:FindFirstChild("Loaded");
                        v34 = not not l_Loaded_2 and not (l_Loaded_2.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v33.Name) and true or false);
                    end;
                    if v34 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v34 = v33 or v32;
                local l_Items_0 = l_v6_ProductsByName_0[v31].Items;
                for v37, v38 in pairs(l_Items_0) do
                    local l_Max_0 = v4[v37].Max;
                    if l_Max_0 <= _G.CheckItemAmmount(v34, v37) or l_Max_0 < _G.CheckItemAmmount(v34, v37) + v38 then
                        _G.displayMessage("<Color=Red>Already have max for " .. v37);
                        return false;
                    end;
                end;
                l_MarketplaceService_0:PromptProductPurchase(v32, v6:GetProductIdByPlace(v31));
                return true;
            end;
        end;
    end;
    local v41 = l_v6_ProductsByName_0["Race Reroll x1"];
    local function v46(v42, v43) --[[ Line: 264 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v44;
        if script:GetAttribute("ServerLoaded") == true then
            v44 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v44 = false;
        end;
        if v44 == false then
            return;
        else
            if v43 then
                if not v43:IsDescendantOf(l_Players_0) then
                    v44 = false;
                else
                    local l_Loaded_3 = v43:FindFirstChild("Loaded");
                    v44 = not not l_Loaded_3 and not (l_Loaded_3.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v43.Name) and true or false);
                end;
                if v44 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v42, v6:GetProductIdByPlace("Race Reroll x1"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Race Reroll x5"];
    v46 = function(v47, v48) --[[ Line: 277 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v49;
        if script:GetAttribute("ServerLoaded") == true then
            v49 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v49 = false;
        end;
        if v49 == false then
            return;
        else
            if v48 then
                if not v48:IsDescendantOf(l_Players_0) then
                    v49 = false;
                else
                    local l_Loaded_4 = v48:FindFirstChild("Loaded");
                    v49 = not not l_Loaded_4 and not (l_Loaded_4.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v48.Name) and true or false);
                end;
                if v49 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v47, v6:GetProductIdByPlace("Race Reroll x5"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Race Reroll x10"];
    v46 = function(v51, v52) --[[ Line: 290 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v53;
        if script:GetAttribute("ServerLoaded") == true then
            v53 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v53 = false;
        end;
        if v53 == false then
            return;
        else
            if v52 then
                if not v52:IsDescendantOf(l_Players_0) then
                    v53 = false;
                else
                    local l_Loaded_5 = v52:FindFirstChild("Loaded");
                    v53 = not not l_Loaded_5 and not (l_Loaded_5.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v52.Name) and true or false);
                end;
                if v53 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v51, v6:GetProductIdByPlace("Race Reroll x10"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Race Reroll x50"];
    v46 = function(v55, v56) --[[ Line: 303 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v57;
        if script:GetAttribute("ServerLoaded") == true then
            v57 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v57 = false;
        end;
        if v57 == false then
            return;
        else
            if v56 then
                if not v56:IsDescendantOf(l_Players_0) then
                    v57 = false;
                else
                    local l_Loaded_6 = v56:FindFirstChild("Loaded");
                    v57 = not not l_Loaded_6 and not (l_Loaded_6.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v56.Name) and true or false);
                end;
                if v57 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v55, v6:GetProductIdByPlace("Race Reroll x50"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["2x EXP (15 Minutes)"];
    v46 = function(v59, v60) --[[ Line: 316 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v61;
        if script:GetAttribute("ServerLoaded") == true then
            v61 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v61 = false;
        end;
        if v61 == false then
            return;
        else
            if v60 then
                if not v60:IsDescendantOf(l_Players_0) then
                    v61 = false;
                else
                    local l_Loaded_7 = v60:FindFirstChild("Loaded");
                    v61 = not not l_Loaded_7 and not (l_Loaded_7.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v60.Name) and true or false);
                end;
                if v61 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v59, v6:GetProductIdByPlace("2x EXP (15 Minutes)"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["2x EXP (5 Minutes)"];
    v46 = function(v63, v64) --[[ Line: 329 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v65;
        if script:GetAttribute("ServerLoaded") == true then
            v65 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v65 = false;
        end;
        if v65 == false then
            return;
        else
            if v64 then
                if not v64:IsDescendantOf(l_Players_0) then
                    v65 = false;
                else
                    local l_Loaded_8 = v64:FindFirstChild("Loaded");
                    v65 = not not l_Loaded_8 and not (l_Loaded_8.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v64.Name) and true or false);
                end;
                if v65 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v63, v6:GetProductIdByPlace("2x EXP (5 Minutes)"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Devil Fruit Remover"];
    v46 = function(v67, v68) --[[ Line: 342 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v69;
        if script:GetAttribute("ServerLoaded") == true then
            v69 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v69 = false;
        end;
        if v69 == false then
            return;
        else
            if v68 then
                if not v68:IsDescendantOf(l_Players_0) then
                    v69 = false;
                else
                    local l_Loaded_9 = v68:FindFirstChild("Loaded");
                    v69 = not not l_Loaded_9 and not (l_Loaded_9.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v68.Name) and true or false);
                end;
                if v69 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v69 = v68 or v67;
            if _G.CheckItemAmmount(v69, "Dark Root") < v4["Dark Root"].Max then
                l_MarketplaceService_0:PromptProductPurchase(v67, v6:GetProductIdByPlace("Devil Fruit Remover"));
                return true;
            else
                local v71 = v68 and "<Color=Red>" .. v68.Name .. " already has the maximum Dark Roots" or "<Color=Red>You already have the maximum Dark Roots";
                _G.displayMessage(v71);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Devil Fruit Notifier (1 Hour)"];
    v46 = function(v72, v73) --[[ Line: 365 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v74;
        if script:GetAttribute("ServerLoaded") == true then
            v74 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v74 = false;
        end;
        if v74 == false then
            return;
        else
            if v73 then
                if not v73:IsDescendantOf(l_Players_0) then
                    v74 = false;
                else
                    local l_Loaded_10 = v73:FindFirstChild("Loaded");
                    v74 = not not l_Loaded_10 and not (l_Loaded_10.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v73.Name) and true or false);
                end;
                if v74 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v72, v6:GetProductIdByPlace("Devil Fruit Notifier (1 Hour)"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["2x Drop Rates (1 Hour)"];
    v46 = function(v76, v77) --[[ Line: 378 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v78;
        if script:GetAttribute("ServerLoaded") == true then
            v78 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v78 = false;
        end;
        if v78 == false then
            return;
        else
            if v77 then
                if not v77:IsDescendantOf(l_Players_0) then
                    v78 = false;
                else
                    local l_Loaded_11 = v77:FindFirstChild("Loaded");
                    v78 = not not l_Loaded_11 and not (l_Loaded_11.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v77.Name) and true or false);
                end;
                if v78 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v76, v6:GetProductIdByPlace("2x Drop Rates (1 Hour)"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["2x Drop Rates (5 Mins)"];
    v46 = function(v80, v81) --[[ Line: 391 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v82;
        if script:GetAttribute("ServerLoaded") == true then
            v82 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v82 = false;
        end;
        if v82 == false then
            return;
        else
            if v81 then
                if not v81:IsDescendantOf(l_Players_0) then
                    v82 = false;
                else
                    local l_Loaded_12 = v81:FindFirstChild("Loaded");
                    v82 = not not l_Loaded_12 and not (l_Loaded_12.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v81.Name) and true or false);
                end;
                if v82 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            l_MarketplaceService_0:PromptProductPurchase(v80, v6:GetProductIdByPlace("2x Drop Rates (5 Mins)"));
            return true;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Custom Observation Color"];
    v46 = function(v84, v85) --[[ Line: 404 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v86;
        if script:GetAttribute("ServerLoaded") == true then
            v86 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v86 = false;
        end;
        if v86 == false then
            return;
        else
            if v85 then
                if not v85:IsDescendantOf(l_Players_0) then
                    v86 = false;
                else
                    local l_Loaded_13 = v85:FindFirstChild("Loaded");
                    v86 = not not l_Loaded_13 and not (l_Loaded_13.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v85.Name) and true or false);
                end;
                if v86 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v86 = v85 or v84;
            if l_ReplicatedStorage_0:FindFirstChild("Stats" .. v86.Name).Stats.KenMastery.Value > 0 then
                l_MarketplaceService_0:PromptProductPurchase(v84, v6:GetProductIdByPlace("Custom Observation Color"));
                return true;
            else
                local v88 = v85 and "<Color=Red>" .. v85.Name .. " needs to unlock observation haki before buying this!" or "<Color=Red>You need to unlock observation haki before buying this!";
                _G.displayMessage(v88);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0.Hoverboard;
    v46 = function(v89, v90) --[[ Line: 428 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v91;
        if script:GetAttribute("ServerLoaded") == true then
            v91 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v91 = false;
        end;
        if v91 == false then
            return;
        else
            if v90 then
                if not v90:IsDescendantOf(l_Players_0) then
                    v91 = false;
                else
                    local l_Loaded_14 = v90:FindFirstChild("Loaded");
                    v91 = not not l_Loaded_14 and not (l_Loaded_14.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v90.Name) and true or false);
                end;
                if v91 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v91 = v90 or v89;
            if _G.HasItem(v91, "Hoverboard") == false then
                l_MarketplaceService_0:PromptProductPurchase(v89, v6:GetProductIdByPlace("Hoverboard"));
                return true;
            else
                local v93 = v90 and "<Color=Red>" .. v90.Name .. " already owns this item!" or "<Color=Red>You already own this item!";
                _G.displayMessage(v93);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Coffin Boat"];
    v46 = function(v94, v95) --[[ Line: 451 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v96;
        if script:GetAttribute("ServerLoaded") == true then
            v96 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v96 = false;
        end;
        if v96 == false then
            return;
        else
            if v95 then
                if not v95:IsDescendantOf(l_Players_0) then
                    v96 = false;
                else
                    local l_Loaded_15 = v95:FindFirstChild("Loaded");
                    v96 = not not l_Loaded_15 and not (l_Loaded_15.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v95.Name) and true or false);
                end;
                if v96 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v96 = v95 or v94;
            if _G.HasItem(v96, "Coffin Boat") == false then
                l_MarketplaceService_0:PromptProductPurchase(v94, v6:GetProductIdByPlace("Coffin Boat"));
                return true;
            else
                local v98 = v95 and "<Color=Red>" .. v95.Name .. " already owns this item!" or "<Color=Red>You already own this item!";
                _G.displayMessage(v98);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0.Striker;
    v46 = function(v99, v100) --[[ Line: 474 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v101;
        if script:GetAttribute("ServerLoaded") == true then
            v101 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v101 = false;
        end;
        if v101 == false then
            return;
        else
            if v100 then
                if not v100:IsDescendantOf(l_Players_0) then
                    v101 = false;
                else
                    local l_Loaded_16 = v100:FindFirstChild("Loaded");
                    v101 = not not l_Loaded_16 and not (l_Loaded_16.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v100.Name) and true or false);
                end;
                if v101 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v101 = v100 or v99;
            if _G.HasItem(v101, "Striker") == false then
                l_MarketplaceService_0:PromptProductPurchase(v99, v6:GetProductIdByPlace("Striker"));
                return true;
            else
                local v103 = v100 and "<Color=Red>" .. v100.Name .. " already owns this item!" or "<Color=Red>You already own this item!";
                _G.displayMessage(v103);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Trading Sign"];
    v46 = function(v104, v105) --[[ Line: 497 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v106;
        if script:GetAttribute("ServerLoaded") == true then
            v106 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v106 = false;
        end;
        if v106 == false then
            return;
        else
            if v105 then
                if not v105:IsDescendantOf(l_Players_0) then
                    v106 = false;
                else
                    local l_Loaded_17 = v105:FindFirstChild("Loaded");
                    v106 = not not l_Loaded_17 and not (l_Loaded_17.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v105.Name) and true or false);
                end;
                if v106 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v106 = v105 or v104;
            if _G.HasItem(v106, "Trading Sign") == false then
                l_MarketplaceService_0:PromptProductPurchase(v104, v6:GetProductIdByPlace("Trading Sign"));
                return true;
            else
                local v108 = v105 and "<Color=Red>" .. v105.Name .. " already owns this item!" or "<Color=Red>You already own this item!";
                _G.displayMessage(v108);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Custom Spirit Color"];
    v46 = function(v109, v110) --[[ Line: 520 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v111;
        if script:GetAttribute("ServerLoaded") == true then
            v111 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v111 = false;
        end;
        if v111 == false then
            return;
        else
            if v110 then
                if not v110:IsDescendantOf(l_Players_0) then
                    v111 = false;
                else
                    local l_Loaded_18 = v110:FindFirstChild("Loaded");
                    v111 = not not l_Loaded_18 and not (l_Loaded_18.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v110.Name) and true or false);
                end;
                if v111 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v111 = v110 or v109;
            local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. v111.Name);
            if _G.CheckItemAmmount(v109, "Spirit Color Essence") > v4["Spirit Color Essence"].Max then
                _G.displayMessage("<Color=Red>You have the max of this item!");
                return false;
            elseif v109.PlayerGui:FindFirstChild("hakiColor") == nil and l_l_ReplicatedStorage_0_FirstChild_0.Stats.BusoV2.Value == true then
                l_MarketplaceService_0:PromptProductPurchase(v109, v6:GetProductIdByPlace("Custom Spirit Color"));
                return true;
            else
                local v114 = v110 and "<Color=Red>" .. v110.Name .. " can't receive this!" or "<Color=Red>You're not ready to buy this!";
                _G.displayMessage(v114);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Golden Hammer"];
    v46 = function(v115, v116) --[[ Line: 547 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v117;
        if script:GetAttribute("ServerLoaded") == true then
            v117 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v117 = false;
        end;
        if v117 == false then
            return;
        else
            if v116 then
                if not v116:IsDescendantOf(l_Players_0) then
                    v117 = false;
                else
                    local l_Loaded_19 = v116:FindFirstChild("Loaded");
                    v117 = not not l_Loaded_19 and not (l_Loaded_19.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v116.Name) and true or false);
                end;
                if v117 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v117 = v116 or v115;
            if _G.HasItem(v117, "Golden Hammer") == false then
                l_MarketplaceService_0:PromptProductPurchase(v115, v6:GetProductIdByPlace("Golden Hammer"));
                return true;
            else
                local v119 = v116 and "<Color=Red>" .. v116.Name .. " already owns this item!" or "<Color=Red>You already own this item!";
                _G.displayMessage(v119);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Fruit Bag"];
    v46 = function(v120, v121) --[[ Line: 570 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v122;
        if script:GetAttribute("ServerLoaded") == true then
            v122 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v122 = false;
        end;
        if v122 == false then
            return;
        else
            if v121 then
                if not v121:IsDescendantOf(l_Players_0) then
                    v122 = false;
                else
                    local l_Loaded_20 = v121:FindFirstChild("Loaded");
                    v122 = not not l_Loaded_20 and not (l_Loaded_20.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v121.Name) and true or false);
                end;
                if v122 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v122 = v121 or v120;
            if _G.CheckItemAmmount(v122, "Spare Fruit Bag") < v4["Spare Fruit Bag"].Max then
                l_MarketplaceService_0:PromptProductPurchase(v120, v6:GetProductIdByPlace("Fruit Bag"));
                return true;
            else
                local v124 = v121 and "<Color=Red>" .. v121.Name .. " already has the maximum amount of Fruit Bags" or "<Color=Red>You already have the maximum amount of Fruit Bags";
                _G.displayMessage(v124);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["SP Reset Essence"];
    v46 = function(v125, v126) --[[ Line: 593 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v127;
        if script:GetAttribute("ServerLoaded") == true then
            v127 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v127 = false;
        end;
        if v127 == false then
            return;
        else
            if v126 then
                if not v126:IsDescendantOf(l_Players_0) then
                    v127 = false;
                else
                    local l_Loaded_21 = v126:FindFirstChild("Loaded");
                    v127 = not not l_Loaded_21 and not (l_Loaded_21.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v126.Name) and true or false);
                end;
                if v127 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v127 = v126 or v125;
            if _G.CheckItemAmmount(v127, "SP Reset Essence") < v4["SP Reset Essence"].Max then
                l_MarketplaceService_0:PromptProductPurchase(v125, v6:GetProductIdByPlace("SP Reset Essence"));
                return true;
            else
                local v129 = v126 and "<Color=Red>" .. v126.Name .. " already has the maximum amount of SP Reset Essence" or "<Color=Red>You already have the maximum amount of SP Reset Essence";
                _G.displayMessage(v129);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Devil Fruit Journal"];
    v46 = function(v130, v131) --[[ Line: 616 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v132;
        if script:GetAttribute("ServerLoaded") == true then
            v132 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v132 = false;
        end;
        if v132 == false then
            return;
        else
            if v131 then
                if not v131:IsDescendantOf(l_Players_0) then
                    v132 = false;
                else
                    local l_Loaded_22 = v131:FindFirstChild("Loaded");
                    v132 = not not l_Loaded_22 and not (l_Loaded_22.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v131.Name) and true or false);
                end;
                if v132 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v132 = v131 or v130;
            if _G.CheckItemAmmount(v132, "Devil Fruit Journal") < v4["Devil Fruit Journal"].Max then
                l_MarketplaceService_0:PromptProductPurchase(v130, v6:GetProductIdByPlace("Devil Fruit Journal"));
                return true;
            else
                local v134 = v131 and "<Color=Red>" .. v131.Name .. " already has the maximum Devil Fruit Journals" or "<Color=Red>You already own the max for this item!";
                _G.displayMessage(v134);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Bomi's Log Pose"];
    v46 = function(v135, v136) --[[ Line: 639 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v137;
        if script:GetAttribute("ServerLoaded") == true then
            v137 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v137 = false;
        end;
        if v137 == false then
            return;
        else
            if v136 then
                if not v136:IsDescendantOf(l_Players_0) then
                    v137 = false;
                else
                    local l_Loaded_23 = v136:FindFirstChild("Loaded");
                    v137 = not not l_Loaded_23 and not (l_Loaded_23.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v136.Name) and true or false);
                end;
                if v137 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v137 = v136 or v135;
            if _G.CheckItemAmmount(v137, "Bomi's Log Pose") < 3 then
                l_MarketplaceService_0:PromptProductPurchase(v135, v6:GetProductIdByPlace("Bomi's Log Pose"));
                return true;
            else
                local v139 = v136 and "<Color=Red>" .. v136.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                _G.displayMessage(v139);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["All Seeing Eye"];
    v46 = function(v140, v141) --[[ Line: 662 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v142;
        if script:GetAttribute("ServerLoaded") == true then
            v142 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v142 = false;
        end;
        if v142 == false then
            return;
        else
            if v141 then
                if not v141:IsDescendantOf(l_Players_0) then
                    v142 = false;
                else
                    local l_Loaded_24 = v141:FindFirstChild("Loaded");
                    v142 = not not l_Loaded_24 and not (l_Loaded_24.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v141.Name) and true or false);
                end;
                if v142 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v142 = v141 or v140;
            if _G.CheckItemAmmount(v142, "All Seeing Eye") < 3 then
                l_MarketplaceService_0:PromptProductPurchase(v140, v6:GetProductIdByPlace("All Seeing Eye"));
                return true;
            else
                local v144 = v141 and "<Color=Red>" .. v141.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                _G.displayMessage(v144);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Thrilled Ship"];
    v46 = function(v145, v146) --[[ Line: 685 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v147;
        if script:GetAttribute("ServerLoaded") == true then
            v147 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v147 = false;
        end;
        if v147 == false then
            return;
        else
            if v146 then
                if not v146:IsDescendantOf(l_Players_0) then
                    v147 = false;
                else
                    local l_Loaded_25 = v146:FindFirstChild("Loaded");
                    v147 = not not l_Loaded_25 and not (l_Loaded_25.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v146.Name) and true or false);
                end;
                if v147 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v147 = v146 or v145;
            if _G.CheckItemAmmount(v147, "Thrilled Ship") < 3 then
                l_MarketplaceService_0:PromptProductPurchase(v145, v6:GetProductIdByPlace("Thrilled Ship"));
                return true;
            else
                local v149 = v146 and "<Color=Red>" .. v146.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                _G.displayMessage(v149);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Drippy Fit V2"];
    v46 = function(v150, v151) --[[ Line: 708 ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v152;
        if script:GetAttribute("ServerLoaded") == true then
            v152 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v152 = false;
        end;
        if v152 == false then
            return;
        else
            if v151 then
                if not v151:IsDescendantOf(l_Players_0) then
                    v152 = false;
                else
                    local l_Loaded_26 = v151:FindFirstChild("Loaded");
                    v152 = not not l_Loaded_26 and not (l_Loaded_26.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v151.Name) and true or false);
                end;
                if v152 == false then
                    _G.displayMessage("<Color=Red>This player has not loaded yet!");
                    return false;
                end;
            end;
            v152 = v151 or v150;
            if _G.CheckItemAmmount(v152, "Drippy Fit V2") < 3 then
                l_MarketplaceService_0:PromptProductPurchase(v150, v6:GetProductIdByPlace("Drippy Fit V2"));
                return true;
            else
                local v154 = v151 and "<Color=Red>" .. v151.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                _G.displayMessage(v154);
                return false;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Reroll Sulong Fur Color"];
    v46 = function(v155, _) --[[ Line: 731 ]]
        -- upvalues: l_MarketplaceService_0 (copy), v6 (copy)
        local v157;
        if script:GetAttribute("ServerLoaded") == true then
            v157 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v157 = false;
        end;
        if v157 == false then
            return;
        else
            v157 = game.ReplicatedStorage:FindFirstChild("Stats" .. v155.Name);
            if not v157 then
                _G.displayMessage("<Color=Red>You cant buy this!");
                return false;
            elseif v157.Stats.FightingStyle.Value ~= "Moonlit Electro" then
                _G.displayMessage("<Color=Red>You cant buy this!");
                return false;
            else
                l_MarketplaceService_0:PromptProductPurchase(v155, v6:GetProductIdByPlace("Reroll Sulong Fur Color"));
                return true;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Mythical Fruit Chest"];
    local v158 = nil;
    if v158 == nil then
        v158 = "Mythical Fruit Chest";
    end;
    local v159 = "Mythical Fruit Chest";
    local l_v159_0 = v159 --[[ copy: 17 -> 18 ]];
    do
        local l_v158_0 = v158;
        v46 = function(v162, v163) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_0 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_0 (ref)
            local v164;
            if script:GetAttribute("ServerLoaded") == true then
                v164 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v164 = false;
            end;
            if v164 == false then
                return;
            else
                if v163 then
                    if not v163:IsDescendantOf(l_Players_0) then
                        v164 = false;
                    else
                        local l_Loaded_27 = v163:FindFirstChild("Loaded");
                        v164 = not not l_Loaded_27 and not (l_Loaded_27.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v163.Name) and true or false);
                    end;
                    if v164 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v164 = v163 or v162;
                if _G.CheckItemAmmount(v164, l_v159_0) < v4[l_v159_0].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v162, v6:GetProductIdByPlace(l_v158_0));
                    return true;
                else
                    local v166 = v163 and "<Color=Red>" .. v163.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v166);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Legendary Fruit Chest Blueprint"];
    v158 = nil;
    if v158 == nil then
        v158 = "Legendary Fruit Chest Blueprint";
    end;
    v159 = "Legendary Fruit Chest Blueprint";
    local l_v159_1 = v159 --[[ copy: 17 -> 19 ]];
    do
        local l_v158_1 = v158;
        v46 = function(v169, v170) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_1 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_1 (ref)
            local v171;
            if script:GetAttribute("ServerLoaded") == true then
                v171 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v171 = false;
            end;
            if v171 == false then
                return;
            else
                if v170 then
                    if not v170:IsDescendantOf(l_Players_0) then
                        v171 = false;
                    else
                        local l_Loaded_28 = v170:FindFirstChild("Loaded");
                        v171 = not not l_Loaded_28 and not (l_Loaded_28.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v170.Name) and true or false);
                    end;
                    if v171 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v171 = v170 or v169;
                if _G.CheckItemAmmount(v171, l_v159_1) < v4[l_v159_1].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v169, v6:GetProductIdByPlace(l_v158_1));
                    return true;
                else
                    local v173 = v170 and "<Color=Red>" .. v170.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v173);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Iceborn Gunblade"];
    v158 = nil;
    if v158 == nil then
        v158 = "Iceborn Gunblade";
    end;
    v159 = "Iceborn Gunblade";
    local l_v159_2 = v159 --[[ copy: 17 -> 20 ]];
    do
        local l_v158_2 = v158;
        v46 = function(v176, v177) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_2 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_2 (ref)
            local v178;
            if script:GetAttribute("ServerLoaded") == true then
                v178 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v178 = false;
            end;
            if v178 == false then
                return;
            else
                if v177 then
                    if not v177:IsDescendantOf(l_Players_0) then
                        v178 = false;
                    else
                        local l_Loaded_29 = v177:FindFirstChild("Loaded");
                        v178 = not not l_Loaded_29 and not (l_Loaded_29.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v177.Name) and true or false);
                    end;
                    if v178 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v178 = v177 or v176;
                if _G.CheckItemAmmount(v178, l_v159_2) < v4[l_v159_2].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v176, v6:GetProductIdByPlace(l_v158_2));
                    return true;
                else
                    local v180 = v177 and "<Color=Red>" .. v177.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v180);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Cupid's Bow"];
    v158 = nil;
    if v158 == nil then
        v158 = "Cupid's Bow";
    end;
    v159 = "Cupid's Bow";
    local l_v159_3 = v159 --[[ copy: 17 -> 21 ]];
    do
        local l_v158_3 = v158;
        v46 = function(v183, v184) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_3 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_3 (ref)
            local v185;
            if script:GetAttribute("ServerLoaded") == true then
                v185 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v185 = false;
            end;
            if v185 == false then
                return;
            else
                if v184 then
                    if not v184:IsDescendantOf(l_Players_0) then
                        v185 = false;
                    else
                        local l_Loaded_30 = v184:FindFirstChild("Loaded");
                        v185 = not not l_Loaded_30 and not (l_Loaded_30.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v184.Name) and true or false);
                    end;
                    if v185 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v185 = v184 or v183;
                if _G.CheckItemAmmount(v185, l_v159_3) < v4[l_v159_3].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v183, v6:GetProductIdByPlace(l_v158_3));
                    return true;
                else
                    local v187 = v184 and "<Color=Red>" .. v184.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v187);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Mega-Pow"];
    v158 = nil;
    if v158 == nil then
        v158 = "Mega-Pow";
    end;
    v159 = "Mega-Pow";
    local l_v159_4 = v159 --[[ copy: 17 -> 22 ]];
    do
        local l_v158_4 = v158;
        v46 = function(v190, v191) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_4 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_4 (ref)
            local v192;
            if script:GetAttribute("ServerLoaded") == true then
                v192 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v192 = false;
            end;
            if v192 == false then
                return;
            else
                if v191 then
                    if not v191:IsDescendantOf(l_Players_0) then
                        v192 = false;
                    else
                        local l_Loaded_31 = v191:FindFirstChild("Loaded");
                        v192 = not not l_Loaded_31 and not (l_Loaded_31.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v191.Name) and true or false);
                    end;
                    if v192 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v192 = v191 or v190;
                if _G.CheckItemAmmount(v192, l_v159_4) < v4[l_v159_4].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v190, v6:GetProductIdByPlace(l_v158_4));
                    return true;
                else
                    local v194 = v191 and "<Color=Red>" .. v191.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v194);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Blo's Sledgehammer"];
    v158 = nil;
    if v158 == nil then
        v158 = "Blo's Sledgehammer";
    end;
    v159 = "Blo's Sledgehammer";
    local l_v159_5 = v159 --[[ copy: 17 -> 23 ]];
    do
        local l_v158_5 = v158;
        v46 = function(v197, v198) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_5 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_5 (ref)
            local v199;
            if script:GetAttribute("ServerLoaded") == true then
                v199 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v199 = false;
            end;
            if v199 == false then
                return;
            else
                if v198 then
                    if not v198:IsDescendantOf(l_Players_0) then
                        v199 = false;
                    else
                        local l_Loaded_32 = v198:FindFirstChild("Loaded");
                        v199 = not not l_Loaded_32 and not (l_Loaded_32.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v198.Name) and true or false);
                    end;
                    if v199 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v199 = v198 or v197;
                if _G.CheckItemAmmount(v199, l_v159_5) < v4[l_v159_5].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v197, v6:GetProductIdByPlace(l_v158_5));
                    return true;
                else
                    local v201 = v198 and "<Color=Red>" .. v198.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v201);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Egg Phone"];
    v158 = nil;
    if v158 == nil then
        v158 = "Egg Phone";
    end;
    v159 = "Egg Phone";
    local l_v159_6 = v159 --[[ copy: 17 -> 24 ]];
    do
        local l_v158_6 = v158;
        v46 = function(v204, v205) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_6 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_6 (ref)
            local v206;
            if script:GetAttribute("ServerLoaded") == true then
                v206 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v206 = false;
            end;
            if v206 == false then
                return;
            else
                if v205 then
                    if not v205:IsDescendantOf(l_Players_0) then
                        v206 = false;
                    else
                        local l_Loaded_33 = v205:FindFirstChild("Loaded");
                        v206 = not not l_Loaded_33 and not (l_Loaded_33.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v205.Name) and true or false);
                    end;
                    if v206 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v206 = v205 or v204;
                if _G.CheckItemAmmount(v206, l_v159_6) < v4[l_v159_6].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v204, v6:GetProductIdByPlace(l_v158_6));
                    return true;
                else
                    local v208 = v205 and "<Color=Red>" .. v205.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v208);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Blood Scythe"];
    v158 = nil;
    if v158 == nil then
        v158 = "Blood Scythe";
    end;
    v159 = "Blood Scythe";
    local l_v159_7 = v159 --[[ copy: 17 -> 25 ]];
    do
        local l_v158_7 = v158;
        v46 = function(v211, v212) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_7 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_7 (ref)
            local v213;
            if script:GetAttribute("ServerLoaded") == true then
                v213 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v213 = false;
            end;
            if v213 == false then
                return;
            else
                if v212 then
                    if not v212:IsDescendantOf(l_Players_0) then
                        v213 = false;
                    else
                        local l_Loaded_34 = v212:FindFirstChild("Loaded");
                        v213 = not not l_Loaded_34 and not (l_Loaded_34.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v212.Name) and true or false);
                    end;
                    if v213 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v213 = v212 or v211;
                if _G.CheckItemAmmount(v213, l_v159_7) < v4[l_v159_7].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v211, v6:GetProductIdByPlace(l_v158_7));
                    return true;
                else
                    local v215 = v212 and "<Color=Red>" .. v212.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v215);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Hollow's Halberd"];
    v158 = nil;
    if v158 == nil then
        v158 = "Hollow's Halberd";
    end;
    v159 = "Hollow's Halberd";
    local l_v159_8 = v159 --[[ copy: 17 -> 26 ]];
    do
        local l_v158_8 = v158;
        v46 = function(v218, v219) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_8 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_8 (ref)
            local v220;
            if script:GetAttribute("ServerLoaded") == true then
                v220 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v220 = false;
            end;
            if v220 == false then
                return;
            else
                if v219 then
                    if not v219:IsDescendantOf(l_Players_0) then
                        v220 = false;
                    else
                        local l_Loaded_35 = v219:FindFirstChild("Loaded");
                        v220 = not not l_Loaded_35 and not (l_Loaded_35.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v219.Name) and true or false);
                    end;
                    if v220 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v220 = v219 or v218;
                if _G.CheckItemAmmount(v220, l_v159_8) < v4[l_v159_8].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v218, v6:GetProductIdByPlace(l_v158_8));
                    return true;
                else
                    local v222 = v219 and "<Color=Red>" .. v219.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v222);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Hollow's Great Sword"];
    v158 = nil;
    if v158 == nil then
        v158 = "Hollow's Great Sword";
    end;
    v159 = "Hollow's Great Sword";
    local l_v159_9 = v159 --[[ copy: 17 -> 27 ]];
    do
        local l_v158_9 = v158;
        v46 = function(v225, v226) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_9 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_9 (ref)
            local v227;
            if script:GetAttribute("ServerLoaded") == true then
                v227 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v227 = false;
            end;
            if v227 == false then
                return;
            else
                if v226 then
                    if not v226:IsDescendantOf(l_Players_0) then
                        v227 = false;
                    else
                        local l_Loaded_36 = v226:FindFirstChild("Loaded");
                        v227 = not not l_Loaded_36 and not (l_Loaded_36.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v226.Name) and true or false);
                    end;
                    if v227 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v227 = v226 or v225;
                if _G.CheckItemAmmount(v227, l_v159_9) < v4[l_v159_9].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v225, v6:GetProductIdByPlace(l_v158_9));
                    return true;
                else
                    local v229 = v226 and "<Color=Red>" .. v226.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v229);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Special Tailor Token"];
    v46 = function(v230, v231) --[[ Line: 763 ]]
        -- upvalues: v4 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v232;
        if script:GetAttribute("ServerLoaded") == true then
            v232 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v232 = false;
        end;
        if v232 == false then
            return;
        else
            v232 = v231 or v230;
            if _G.CheckItemAmmount(v232, "Special Tailor Token") + 10 > v4["Special Tailor Token"].Max then
                _G.displayMessage("<Color=Red>You will go over the max for this item if you purchase this.");
                return false;
            else
                l_MarketplaceService_0:PromptProductPurchase(v230, v6:GetProductIdByPlace("Special Tailor Token"));
                return true;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Nightfall Half Shroud"];
    v158 = nil;
    if v158 == nil then
        v158 = "Nightfall Half Shroud";
    end;
    v159 = "Nightfall Half Shroud";
    local l_v159_10 = v159 --[[ copy: 17 -> 28 ]];
    do
        local l_v158_10 = v158;
        v46 = function(v235, v236) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_10 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_10 (ref)
            local v237;
            if script:GetAttribute("ServerLoaded") == true then
                v237 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v237 = false;
            end;
            if v237 == false then
                return;
            else
                if v236 then
                    if not v236:IsDescendantOf(l_Players_0) then
                        v237 = false;
                    else
                        local l_Loaded_37 = v236:FindFirstChild("Loaded");
                        v237 = not not l_Loaded_37 and not (l_Loaded_37.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v236.Name) and true or false);
                    end;
                    if v237 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v237 = v236 or v235;
                if _G.CheckItemAmmount(v237, l_v159_10) < v4[l_v159_10].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v235, v6:GetProductIdByPlace(l_v158_10));
                    return true;
                else
                    local v239 = v236 and "<Color=Red>" .. v236.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v239);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Hollow's World Ender"];
    v158 = nil;
    if v158 == nil then
        v158 = "Hollow's World Ender";
    end;
    v159 = "Hollow's World Ender";
    local l_v159_11 = v159 --[[ copy: 17 -> 29 ]];
    do
        local l_v158_11 = v158;
        v46 = function(v242, v243) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_11 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_11 (ref)
            local v244;
            if script:GetAttribute("ServerLoaded") == true then
                v244 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v244 = false;
            end;
            if v244 == false then
                return;
            else
                if v243 then
                    if not v243:IsDescendantOf(l_Players_0) then
                        v244 = false;
                    else
                        local l_Loaded_38 = v243:FindFirstChild("Loaded");
                        v244 = not not l_Loaded_38 and not (l_Loaded_38.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v243.Name) and true or false);
                    end;
                    if v244 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v244 = v243 or v242;
                if _G.CheckItemAmmount(v244, l_v159_11) < v4[l_v159_11].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v242, v6:GetProductIdByPlace(l_v158_11));
                    return true;
                else
                    local v246 = v243 and "<Color=Red>" .. v243.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v246);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Extra Loadout Slot"];
    v46 = function(v247, v248) --[[ Line: 784 ]]
        -- upvalues: l_HttpService_0 (copy), l_MarketplaceService_0 (copy), v6 (copy)
        local v249;
        if script:GetAttribute("ServerLoaded") == true then
            v249 = true;
        else
            _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
            v249 = false;
        end;
        if v249 == false then
            return;
        else
            v249 = v248 or v247;
            local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v249.Name);
            if not l_FirstChild_0 then
                return;
            else
                local v251 = l_HttpService_0:JSONDecode(l_FirstChild_0.Inventory.LoadoutSlotsTable.Value);
                local v252 = 0;
                for _, _ in pairs(v251) do
                    v252 = v252 + 1;
                end;
                if v252 >= 10 then
                    _G.displayMessage("<Color=Red>You already have the max loadout slots!");
                    return false;
                else
                    l_MarketplaceService_0:PromptProductPurchase(v247, v6:GetProductIdByPlace("Extra Loadout Slot"));
                    return true;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["All Seeing Holly"];
    v158 = nil;
    if v158 == nil then
        v158 = "All Seeing Holly";
    end;
    v159 = "All Seeing Holly";
    local l_v159_12 = v159 --[[ copy: 17 -> 30 ]];
    do
        local l_v158_12 = v158;
        v46 = function(v257, v258) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_12 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_12 (ref)
            local v259;
            if script:GetAttribute("ServerLoaded") == true then
                v259 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v259 = false;
            end;
            if v259 == false then
                return;
            else
                if v258 then
                    if not v258:IsDescendantOf(l_Players_0) then
                        v259 = false;
                    else
                        local l_Loaded_39 = v258:FindFirstChild("Loaded");
                        v259 = not not l_Loaded_39 and not (l_Loaded_39.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v258.Name) and true or false);
                    end;
                    if v259 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v259 = v258 or v257;
                if _G.CheckItemAmmount(v259, l_v159_12) < v4[l_v159_12].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v257, v6:GetProductIdByPlace(l_v158_12));
                    return true;
                else
                    local v261 = v258 and "<Color=Red>" .. v258.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v261);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Iceborn Blade"];
    v158 = nil;
    if v158 == nil then
        v158 = "Iceborn Blade";
    end;
    v159 = "Iceborn Blade";
    local l_v159_13 = v159 --[[ copy: 17 -> 31 ]];
    do
        local l_v158_13 = v158;
        v46 = function(v264, v265) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_13 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_13 (ref)
            local v266;
            if script:GetAttribute("ServerLoaded") == true then
                v266 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v266 = false;
            end;
            if v266 == false then
                return;
            else
                if v265 then
                    if not v265:IsDescendantOf(l_Players_0) then
                        v266 = false;
                    else
                        local l_Loaded_40 = v265:FindFirstChild("Loaded");
                        v266 = not not l_Loaded_40 and not (l_Loaded_40.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v265.Name) and true or false);
                    end;
                    if v266 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v266 = v265 or v264;
                if _G.CheckItemAmmount(v266, l_v159_13) < v4[l_v159_13].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v264, v6:GetProductIdByPlace(l_v158_13));
                    return true;
                else
                    local v268 = v265 and "<Color=Red>" .. v265.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v268);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Iceborn Katana"];
    v158 = nil;
    if v158 == nil then
        v158 = "Iceborn Katana";
    end;
    v159 = "Iceborn Katana";
    local l_v159_14 = v159 --[[ copy: 17 -> 32 ]];
    do
        local l_v158_14 = v158;
        v46 = function(v271, v272) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_14 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_14 (ref)
            local v273;
            if script:GetAttribute("ServerLoaded") == true then
                v273 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v273 = false;
            end;
            if v273 == false then
                return;
            else
                if v272 then
                    if not v272:IsDescendantOf(l_Players_0) then
                        v273 = false;
                    else
                        local l_Loaded_41 = v272:FindFirstChild("Loaded");
                        v273 = not not l_Loaded_41 and not (l_Loaded_41.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v272.Name) and true or false);
                    end;
                    if v273 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v273 = v272 or v271;
                if _G.CheckItemAmmount(v273, l_v159_14) < v4[l_v159_14].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v271, v6:GetProductIdByPlace(l_v158_14));
                    return true;
                else
                    local v275 = v272 and "<Color=Red>" .. v272.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v275);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Iceborn Rapier"];
    v158 = nil;
    if v158 == nil then
        v158 = "Iceborn Rapier";
    end;
    v159 = "Iceborn Rapier";
    local l_v159_15 = v159 --[[ copy: 17 -> 33 ]];
    do
        local l_v158_15 = v158;
        v46 = function(v278, v279) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_v159_15 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_15 (ref)
            local v280;
            if script:GetAttribute("ServerLoaded") == true then
                v280 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v280 = false;
            end;
            if v280 == false then
                return;
            else
                if v279 then
                    if not v279:IsDescendantOf(l_Players_0) then
                        v280 = false;
                    else
                        local l_Loaded_42 = v279:FindFirstChild("Loaded");
                        v280 = not not l_Loaded_42 and not (l_Loaded_42.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v279.Name) and true or false);
                    end;
                    if v280 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v280 = v279 or v278;
                if _G.CheckItemAmmount(v280, l_v159_15) < v4[l_v159_15].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v278, v6:GetProductIdByPlace(l_v158_15));
                    return true;
                else
                    local v282 = v279 and "<Color=Red>" .. v279.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v282);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
    v41 = l_v6_ProductsByName_0["Iceborn Daggers"];
    v158 = nil;
    if v158 == nil then
        v158 = "Iceborn Daggers";
    end;
    v159 = "Iceborn Daggers";
    do
        local l_v158_16 = v158;
        v46 = function(v284, v285) --[[ Line: 206 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v159 (copy), v4 (copy), l_MarketplaceService_0 (copy), v6 (copy), l_v158_16 (ref)
            local v286;
            if script:GetAttribute("ServerLoaded") == true then
                v286 = true;
            else
                _G.displayMessage("<Color=Red>Marketplace has not been setup yet, please wait");
                v286 = false;
            end;
            if v286 == false then
                return;
            else
                if v285 then
                    if not v285:IsDescendantOf(l_Players_0) then
                        v286 = false;
                    else
                        local l_Loaded_43 = v285:FindFirstChild("Loaded");
                        v286 = not not l_Loaded_43 and not (l_Loaded_43.Value == false) and (l_ReplicatedStorage_0:FindFirstChild("Stats" .. v285.Name) and true or false);
                    end;
                    if v286 == false then
                        _G.displayMessage("<Color=Red>This player has not loaded yet!");
                        return false;
                    end;
                end;
                v286 = v285 or v284;
                if _G.CheckItemAmmount(v286, v159) < v4[v159].Max then
                    l_MarketplaceService_0:PromptProductPurchase(v284, v6:GetProductIdByPlace(l_v158_16));
                    return true;
                else
                    local v288 = v285 and "<Color=Red>" .. v285.Name .. " already owns the max for this item!" or "<Color=Red>You already own the max for this item!";
                    _G.displayMessage(v288);
                    return false;
                end;
            end;
        end;
    end;
    if v41 then
        v41.Callback = v46;
    end;
end;
return v6;