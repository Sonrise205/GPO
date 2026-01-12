local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_PolicyService_0 = game:GetService("PolicyService");
local l_AdService_0 = game:GetService("AdService");
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local v8 = {
    Enum.AdAvailabilityResult.PlayerIneligible, 
    Enum.AdAvailabilityResult.DeviceIneligible, 
    Enum.AdAvailabilityResult.PublisherIneligible, 
    Enum.AdAvailabilityResult.ExperienceIneligible
};
local l_Modules_0 = l_ReplicatedStorage_1:WaitForChild("Modules");
local _ = require(l_Modules_0.Leveling);
local l_Shared_0 = l_Modules_0.Shared;
local l_Utils_0 = l_Shared_0:WaitForChild("Utils");
local l_PlayerUtils_0 = require(l_Utils_0:WaitForChild("PlayerUtils"));
local _ = require(l_Shared_0:WaitForChild("GameUtils"));
local _ = require(l_Shared_0:WaitForChild("SoundUtils"));
local v16 = require(l_ReplicatedStorage_1.Modules.Shared.Signals.GoodSignal);
local l_Marketplace_0 = l_Shared_0:WaitForChild("Marketplace");
local l_Products_0 = require(l_Marketplace_0:WaitForChild("Products"));
local l_MarketplaceUtils_0 = require(l_Marketplace_0:WaitForChild("MarketplaceUtils"));
local l_Client_0 = l_Modules_0.Client;
local l_Notification_0 = require(l_Client_0:WaitForChild("Notification"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_ADShop_0 = l_ReplicatedStorage_1:WaitForChild("Events").ADShop;
local v25 = {
    Initialized = false
};
local v26 = v16.new();
local v27 = false;
local _ = function(v28) --[[ Line: 49 ]] --[[ Name: isIneligibleForAds ]]
    -- upvalues: v8 (copy)
    for _, v30 in ipairs(v8) do
        if v28 == v30 then
            return true;
        end;
    end;
    return false;
end;
local function v44() --[[ Line: 59 ]] --[[ Name: checkForAds ]]
    -- upvalues: l_LocalPlayer_0 (copy), v27 (ref), v26 (copy), l_AdService_0 (copy), v8 (copy), l_Products_0 (copy), l_ReplicatedStorage_1 (copy)
    local v32 = false;
    if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.Level.Value < 125 then
        v27 = false;
        v26:Fire();
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 68 ]]
            -- upvalues: l_AdService_0 (ref)
            return l_AdService_0:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo);
        end);
        local l_AdAvailabilityResult_0 = l_result_0.AdAvailabilityResult;
        local v36;
        for _, v38 in ipairs(v8) do
            if l_AdAvailabilityResult_0 == v38 then
                v36 = true;
                v32 = true;
            end;
            if v32 then
                break;
            end;
        end;
        if not v32 then
            v36 = false;
        end;
        v32 = false;
        if v36 then
            v27 = false;
            v26:Fire();
            return;
        elseif l_status_0 and l_result_0.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
            if v27 == false then
                v27 = true;
                v36 = l_Products_0:GetProductsByName();
                l_AdAvailabilityResult_0 = {};
                local l_l_ReplicatedStorage_1_FirstChild_0 = l_ReplicatedStorage_1:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
                local v40 = "";
                for v41, v42 in v36 do
                    local _ = 0;
                    if v42.Ads ~= nil and (v42.Ads.LevelRequirement or 0) <= l_l_ReplicatedStorage_1_FirstChild_0.Stats.Level.Value then
                        table.insert(l_AdAvailabilityResult_0, v41);
                        v40 = v40 .. "\n<Rare=Rare><" .. v41 .. "><Rare=/>";
                    end;
                end;
                _G.displayMessage((("<Color=Orange>AD<Color=/> available in the <Color=Green>ROBUX SHOP<Color=/> for free products!\nEligible Products: %*"):format(v40)));
                script.ADNotification:Play();
            end;
            v26:Fire();
            return;
        else
            v27 = false;
            v26:Fire();
            return;
        end;
    end;
end;
local function v50(v45) --[[ Line: 119 ]] --[[ Name: formatNumber ]]
    local v46 = tostring(v45);
    local v47 = 1;
    while v47 ~= 0 do
        local v48, v49 = string.gsub(v46, "^(-?%d+)(%d%d%d)", "%1,%2");
        v46 = v48;
        v47 = v49;
    end;
    return v46;
end;
l_ADShop_0.OnClientEvent:Connect(function(_, v52) --[[ Line: 128 ]]
    -- upvalues: v44 (copy)
    if v52 == Enum.ShowAdResult.ShowCompleted then
        v44();
    end;
end);
v25.Initialize = function(v53) --[[ Line: 134 ]] --[[ Name: Initialize ]]
    -- upvalues: v25 (copy), l_ReplicatedStorage_1 (copy), l_PlayerGui_0 (copy), l_Products_0 (copy), l_PolicyService_0 (copy), l_LocalPlayer_0 (copy), v50 (copy), l_MarketplaceUtils_0 (copy), l_Notification_0 (copy), l_ADShop_0 (copy), v27 (ref), v26 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), l_PlayerUtils_0 (copy), v44 (copy)
    if v25.Initialized then
        return;
    else
        local l_Events_0 = l_ReplicatedStorage_1:WaitForChild("Events");
        local v55 = l_Events_0:WaitForChild("ProductsRemote", 120);
        local l_v53_StatsFolder_0 = v53:GetStatsFolder();
        local l_FightingStyle_0 = l_v53_StatsFolder_0:WaitForChild("Stats"):WaitForChild("FightingStyle");
        local v58 = nil;
        local v59 = {};
        local v60 = l_PlayerGui_0:WaitForChild("Shop", 360);
        local l_Main_0 = v60:WaitForChild("Main");
        local l_List_0 = l_Main_0:WaitForChild("List");
        local l_Products_1 = l_List_0:WaitForChild("Products");
        local l_Boosts_0 = l_List_0:WaitForChild("Boosts");
        local l_RaceRerolls_0 = l_List_0:WaitForChild("RaceRerolls");
        local l_Gamepasses_0 = l_List_0:WaitForChild("Gamepasses");
        local l_Bundles_0 = l_List_0:WaitForChild("Bundles");
        local l_GiftButton_0 = l_Main_0:WaitForChild("GiftButton");
        local l_GiftingTo_0 = l_Main_0:WaitForChild("GiftingTo");
        local l_Stop_0 = l_GiftingTo_0:WaitForChild("Stop");
        local l_Gift_0 = l_Main_0:WaitForChild("Gift");
        local l_List_1 = l_Gift_0:WaitForChild("List");
        local l_Input_0 = l_List_0:WaitForChild("Codes"):WaitForChild("Redeem"):WaitForChild("Input");
        local l_l_Products_0_ProductsByName_0 = l_Products_0:GetProductsByName();
        local _ = game.GameId == 2097989947;
        local v76 = {
            ["Reroll Sulong Fur Color"] = function() --[[ Line: 173 ]]
                -- upvalues: l_FightingStyle_0 (copy)
                if l_FightingStyle_0.Value ~= "Moonlit Electro" then
                    return false;
                else
                    return true;
                end;
            end
        };
        local v79 = {
            ["Reroll Sulong Fur Color"] = function(v77) --[[ Line: 184 ]]
                -- upvalues: l_FightingStyle_0 (copy)
                local function v78() --[[ Line: 186 ]] --[[ Name: FightingStyleChanged ]]
                    -- upvalues: l_FightingStyle_0 (ref), v77 (copy)
                    if l_FightingStyle_0.Value ~= "Moonlit Electro" then
                        v77.Visible = false;
                        return;
                    elseif script:GetAttribute("Gifting") == true then
                        v77.Visible = false;
                        return;
                    else
                        v77.Visible = true;
                        return;
                    end;
                end;
                if l_FightingStyle_0.Value ~= "Moonlit Electro" then
                    v77.Visible = false;
                elseif script:GetAttribute("Gifting") == true then
                    v77.Visible = false;
                else
                    v77.Visible = true;
                end;
                l_FightingStyle_0:GetPropertyChangedSignal("Value"):Connect(v78);
            end
        };
        local _, l_result_1 = pcall(function() --[[ Line: 205 ]]
            -- upvalues: l_PolicyService_0 (ref), l_LocalPlayer_0 (ref)
            return l_PolicyService_0:GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
        end);
        local v82 = {};
        local v83 = false;
        local l_InvisFix_0 = l_List_1:WaitForChild("InvisFix");
        v60:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 214 ]]
            -- upvalues: l_InvisFix_0 (copy), v60 (copy)
            l_InvisFix_0.Visible = v60.Enabled;
        end);
        l_Main_0:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 218 ]]
            -- upvalues: l_Main_0 (copy), v83 (ref), v82 (copy)
            if l_Main_0.Size.X.Scale >= 0.89 then
                if v83 then
                    return;
                else
                    v83 = true;
                    for _, v86 in pairs(v82) do
                        v86.Visible = false;
                        task.delay(0.05, function() --[[ Line: 226 ]]
                            -- upvalues: v86 (copy)
                            v86.Visible = true;
                        end);
                    end;
                    task.wait(0.05);
                    v83 = false;
                end;
            end;
        end);
        l_Input_0.FocusLost:Connect(function() --[[ Line: 237 ]]
            -- upvalues: l_Events_0 (copy), l_Input_0 (copy)
            local v87 = l_Events_0.RedeemCode:InvokeServer(l_Input_0.Text);
            if v87 then
                l_Input_0.Text = v87;
            end;
            task.wait(0.5);
            l_Input_0.Text = "";
        end);
        local function v108(v88) --[[ Line: 247 ]] --[[ Name: UpdateTopSellerItem ]]
            -- upvalues: l_l_Products_0_ProductsByName_0 (copy), v50 (ref), l_MarketplaceUtils_0 (ref), l_Products_0 (ref), l_v53_StatsFolder_0 (copy), l_LocalPlayer_0 (ref), v58 (ref), l_Notification_0 (ref), l_result_1 (copy), v55 (copy)
            local v89 = l_l_Products_0_ProductsByName_0[v88.Name];
            if v89 == nil then
                warn("Missing ProductData for", v89);
                return;
            else
                local l_hasDeal_0 = v89.hasDeal;
                local l_RobuxPrice_0 = v88.PriceBox.RobuxPrice;
                local v92 = false;
                local function _(v93) --[[ Line: 259 ]] --[[ Name: UpdatePriceText ]]
                    -- upvalues: v92 (ref), l_RobuxPrice_0 (copy), v50 (ref)
                    if v92 == true then
                        return;
                    else
                        l_RobuxPrice_0.Text = ("%*"):format(v50(v93) or "?");
                        return;
                    end;
                end;
                if v92 ~= true then
                    l_RobuxPrice_0.Text = ("%*"):format(v50(nil) or "?");
                end;
                local function v95() --[[ Line: 268 ]] --[[ Name: PromiseProductInfo ]]
                    -- upvalues: l_MarketplaceUtils_0 (ref), l_Products_0 (ref), v88 (copy), v92 (ref), l_RobuxPrice_0 (copy), v50 (ref), v95 (copy)
                    l_MarketplaceUtils_0.PromiseGetProductInfo(l_Products_0:GetProductIdByPlace(v88.Name), Enum.InfoType.Product):Then(function(v96) --[[ Line: 269 ]]
                        -- upvalues: v92 (ref), l_RobuxPrice_0 (ref), v50 (ref), v95 (ref)
                        local l_PriceInRobux_0 = v96.PriceInRobux;
                        if v92 ~= true then
                            l_RobuxPrice_0.Text = ("%*"):format(v50(l_PriceInRobux_0) or "?");
                        end;
                        task.wait(120 + math.random(60));
                        v95();
                    end):Catch(function(v98) --[[ Line: 275 ]]
                        -- upvalues: v95 (ref)
                        warn(v98);
                        task.wait(30);
                        v95();
                    end);
                end;
                if l_hasDeal_0 ~= nil and l_hasDeal_0.Active == true then
                    local l_PurchaseCount_0 = l_hasDeal_0.PurchaseCount;
                    local v100 = script.Deal:Clone();
                    v100.Parent = v88;
                    v100.Position = UDim2.new(0.75, 0, 0.5, 0);
                    v100.Size = UDim2.new(0.2, 0, 1, 0);
                    v100.Desc.Text = ("BUY %*, GET %* FREE!"):format(l_PurchaseCount_0, l_hasDeal_0.bonusCount);
                    local l_l_PurchaseCount_0_0 = l_PurchaseCount_0 --[[ copy: 8 -> 11 ]];
                    local function v105() --[[ Line: 289 ]] --[[ Name: updateProgress ]]
                        -- upvalues: v88 (copy), l_v53_StatsFolder_0 (ref), l_l_PurchaseCount_0_0 (copy), v92 (ref), l_RobuxPrice_0 (copy), v95 (copy), v100 (copy)
                        local l_Name_0 = v88.Name;
                        local v103 = game:GetService("HttpService"):JSONDecode(l_v53_StatsFolder_0.Products.PurchaseDeals.Value);
                        local v104 = 0;
                        if v103 and v103[l_Name_0] then
                            v104 = v103[l_Name_0];
                        end;
                        if l_l_PurchaseCount_0_0 <= v104 then
                            v92 = true;
                            l_RobuxPrice_0.Text = "FREE";
                        elseif v92 == true then
                            v92 = false;
                            task.spawn(v95);
                        end;
                        v100.Progress.Text = v104 .. "/" .. l_l_PurchaseCount_0_0;
                    end;
                    v105();
                    l_v53_StatsFolder_0.Products.PurchaseDeals.Changed:Connect(v105);
                end;
                task.spawn(v95);
                local function v107() --[[ Line: 315 ]] --[[ Name: OnPressed ]]
                    -- upvalues: l_LocalPlayer_0 (ref), v58 (ref), l_Notification_0 (ref), v89 (copy), l_result_1 (ref), v92 (ref), v55 (ref), v88 (copy)
                    script["RBLX UI Purchase (SFX)"]:Play();
                    local l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("GiftTo");
                    if l_l_LocalPlayer_0_Attribute_0 ~= nil and v58 ~= nil then
                        if v58.Name ~= l_l_LocalPlayer_0_Attribute_0 then
                            l_Notification_0.DisplayMessage("<Color=Red> An issue occured. Please reselect a player to gift!");
                            return;
                        elseif v58:GetAttribute("ProcessPromptPurchase") == true then
                            l_Notification_0.DisplayMessage("<Color=Red>Can not gift Player that is in shop prompt!");
                            return;
                        end;
                    end;
                    if v89.isPaidRandomItem == true and l_result_1.ArePaidRandomItemsRestricted == true then
                        l_Notification_0.DisplayMessage("<Color=Red>Your region policies do not allow you to buy this product!");
                        return;
                    elseif v92 == true then
                        v55:FireServer("dealQualify", v88.Name);
                        return;
                    else
                        if v89.Callback(l_LocalPlayer_0, v58) then
                            v55:FireServer("PromptPurchase", {});
                        end;
                        return;
                    end;
                end;
                v88.MouseButton1Click:Connect(v107);
                return;
            end;
        end;
        for _, v110 in ipairs(l_List_0:GetChildren()) do
            if v110:GetAttribute("isTopSeller") == true then
                v108(v110);
            end;
        end;
        for _, v112 in ipairs(l_Bundles_0:GetChildren()) do
            if v112:IsA("ImageButton") then
                v108(v112);
            end;
        end;
        local function v144(v113) --[[ Line: 363 ]] --[[ Name: SetupShopCategory ]]
            -- upvalues: v82 (copy), l_l_Products_0_ProductsByName_0 (copy), l_Products_0 (ref), v50 (ref), l_MarketplaceUtils_0 (ref), l_v53_StatsFolder_0 (copy), l_ADShop_0 (ref), v27 (ref), v26 (ref), v76 (copy), v79 (copy), l_LocalPlayer_0 (ref), v58 (ref), l_Notification_0 (ref), l_result_1 (copy), v55 (copy)
            for _, v115 in ipairs(v113:GetChildren()) do
                if v115:IsA("Frame") then
                    if v115.Name:find("Ignore") then
                        table.insert(v82, v115);
                    else
                        local v116 = l_l_Products_0_ProductsByName_0[v115.Name];
                        if v116 == nil then
                            warn("Missing ProductData for", v116);
                        else
                            local l_hasDeal_1 = v116.hasDeal;
                            local l_Main_1 = v115.Main;
                            local l_Button_0 = l_Main_1.Button;
                            local l_RobuxPrice_1 = l_Main_1.PriceBox.RobuxPrice;
                            local v121 = false;
                            local l_l_Products_0_ProductIdByPlace_0 = l_Products_0:GetProductIdByPlace(v115.Name);
                            do
                                local l_v121_0 = v121;
                                local function _(v124) --[[ Line: 388 ]] --[[ Name: UpdatePriceText ]]
                                    -- upvalues: l_v121_0 (ref), l_RobuxPrice_1 (copy), v50 (ref)
                                    if l_v121_0 == true then
                                        return;
                                    else
                                        l_RobuxPrice_1.Text = ("%*"):format(v50(v124) or "?");
                                        return;
                                    end;
                                end;
                                if l_v121_0 ~= true then
                                    l_RobuxPrice_1.Text = ("%*"):format(v50(nil) or "?");
                                end;
                                local function v126() --[[ Line: 398 ]] --[[ Name: PromiseProductInfo ]]
                                    -- upvalues: l_MarketplaceUtils_0 (ref), l_l_Products_0_ProductIdByPlace_0 (copy), v115 (copy), l_v121_0 (ref), l_RobuxPrice_1 (copy), v50 (ref), v126 (copy)
                                    l_MarketplaceUtils_0.PromiseGetProductInfo(l_l_Products_0_ProductIdByPlace_0, Enum.InfoType.Product):Then(function(v127) --[[ Line: 399 ]]
                                        -- upvalues: v115 (ref), l_v121_0 (ref), l_RobuxPrice_1 (ref), v50 (ref), v126 (ref)
                                        if v127.PriceInRobux >= 999999 then
                                            v115.Visible = false;
                                            return;
                                        else
                                            local l_PriceInRobux_1 = v127.PriceInRobux;
                                            if l_v121_0 ~= true then
                                                l_RobuxPrice_1.Text = ("%*"):format(v50(l_PriceInRobux_1) or "?");
                                            end;
                                            task.wait(120 + math.random(60));
                                            v126();
                                            return;
                                        end;
                                    end):Catch(function(v129) --[[ Line: 409 ]]
                                        -- upvalues: v126 (ref)
                                        warn(v129);
                                        task.wait(30);
                                        v126();
                                    end);
                                end;
                                task.spawn(v126);
                                if l_hasDeal_1 ~= nil and l_hasDeal_1.Active == true then
                                    local l_PurchaseCount_1 = l_hasDeal_1.PurchaseCount;
                                    local v131 = script.Deal:Clone();
                                    v131.Parent = l_Main_1;
                                    v131.Desc.Text = ("BUY %*, GET %* FREE!"):format(l_PurchaseCount_1, l_hasDeal_1.bonusCount);
                                    local l_l_PurchaseCount_1_0 = l_PurchaseCount_1 --[[ copy: 16 -> 19 ]];
                                    local l_v131_0 = v131 --[[ copy: 17 -> 20 ]];
                                    local function v137() --[[ Line: 423 ]] --[[ Name: updateProgress ]]
                                        -- upvalues: v115 (copy), l_v53_StatsFolder_0 (ref), l_l_PurchaseCount_1_0 (copy), l_v121_0 (ref), l_RobuxPrice_1 (copy), v126 (copy), l_v131_0 (copy)
                                        local l_Name_1 = v115.Name;
                                        local v135 = game:GetService("HttpService"):JSONDecode(l_v53_StatsFolder_0.Products.PurchaseDeals.Value);
                                        local v136 = 0;
                                        if v135 and v135[l_Name_1] then
                                            v136 = v135[l_Name_1];
                                        end;
                                        if l_l_PurchaseCount_1_0 <= v136 then
                                            l_v121_0 = true;
                                            l_RobuxPrice_1.Text = "FREE";
                                        elseif l_v121_0 == true then
                                            l_v121_0 = false;
                                            task.spawn(v126);
                                        end;
                                        l_v131_0.Progress.Text = v136 .. "/" .. l_l_PurchaseCount_1_0;
                                    end;
                                    v137();
                                    l_v53_StatsFolder_0.Products.PurchaseDeals.Changed:Connect(v137);
                                end;
                                task.spawn(function() --[[ Line: 445 ]]
                                    -- upvalues: v116 (copy), l_Main_1 (copy), l_v53_StatsFolder_0 (ref), l_ADShop_0 (ref), l_l_Products_0_ProductIdByPlace_0 (copy), v27 (ref), v26 (ref)
                                    if v116.Ads ~= nil then
                                        warn("HAS ADS HERE");
                                        local v138 = script.AD:Clone();
                                        v138.Parent = l_Main_1;
                                        v138.TextButton.MouseButton1Click:Connect(function() --[[ Line: 452 ]]
                                            -- upvalues: v116 (ref), l_v53_StatsFolder_0 (ref), l_ADShop_0 (ref), l_l_Products_0_ProductIdByPlace_0 (ref)
                                            local v139 = 0;
                                            if v116.Ads.LevelRequirement then
                                                v139 = v116.Ads.LevelRequirement;
                                            end;
                                            if l_v53_StatsFolder_0.Stats.Level.Value < v139 then
                                                _G.displayMessage((("<Color=Red>You need to be Level %* to redeem this!"):format(v139)));
                                                return;
                                            else
                                                l_ADShop_0:FireServer(l_l_Products_0_ProductIdByPlace_0);
                                                return;
                                            end;
                                        end);
                                        task.spawn(function() --[[ Line: 466 ]]
                                            -- upvalues: v27 (ref), v138 (copy), v26 (ref)
                                            while true do
                                                if v27 == false then
                                                    v138.Visible = false;
                                                    v26:Wait();
                                                end;
                                                if v27 == true then
                                                    v138.Visible = true;
                                                else
                                                    v138.Visible = false;
                                                end;
                                                v26:Wait();
                                                task.wait();
                                            end;
                                        end);
                                    end;
                                end);
                                if v116.CanGift == false then
                                    script:GetAttributeChangedSignal("Gifting"):Connect(function() --[[ Line: 489 ]]
                                        -- upvalues: v115 (copy), v76 (ref)
                                        if script:GetAttribute("Gifting") == true then
                                            v115.Visible = false;
                                            return;
                                        else
                                            local v140 = v76[v115.Name];
                                            if v140 == nil then
                                                v115.Visible = true;
                                                return;
                                            else
                                                v115.Visible = v140();
                                                return;
                                            end;
                                        end;
                                    end);
                                end;
                                local v141 = v79[v115.Name];
                                if v141 then
                                    v141(v115);
                                end;
                                local function v143() --[[ Line: 509 ]] --[[ Name: OnPressed ]]
                                    -- upvalues: l_LocalPlayer_0 (ref), v58 (ref), l_Notification_0 (ref), v116 (copy), l_result_1 (ref), l_v121_0 (ref), v55 (ref), v115 (copy)
                                    script["RBLX UI Purchase (SFX)"]:Play();
                                    local l_l_LocalPlayer_0_Attribute_1 = l_LocalPlayer_0:GetAttribute("GiftTo");
                                    if l_l_LocalPlayer_0_Attribute_1 ~= nil and v58 ~= nil then
                                        if v58.Name ~= l_l_LocalPlayer_0_Attribute_1 then
                                            l_Notification_0.DisplayMessage("<Color=Red> An issue occured. Please reselect a player to gift!");
                                            return;
                                        elseif v58:GetAttribute("ProcessPromptPurchase") == true then
                                            l_Notification_0.DisplayMessage("<Color=Red>Can not gift Player that is in shop prompt!");
                                            return;
                                        end;
                                    end;
                                    if v116.isPaidRandomItem == true and l_result_1.ArePaidRandomItemsRestricted == true then
                                        l_Notification_0.DisplayMessage("<Color=Red>Your region policies do not allow you to buy this product!");
                                        return;
                                    elseif l_v121_0 == true then
                                        v55:FireServer("dealQualify", v115.Name);
                                        return;
                                    else
                                        if v116.Callback(l_LocalPlayer_0, v58) then
                                            v55:FireServer("PromptPurchase", {});
                                        end;
                                        return;
                                    end;
                                end;
                                l_Button_0.MouseButton1Click:Connect(v143);
                                task.wait();
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v144(l_Products_1);
        v144(l_Boosts_0);
        v144(l_RaceRerolls_0);
        (function(v145) --[[ Line: 550 ]] --[[ Name: SetupGamepassCategory ]]
            -- upvalues: v82 (copy), l_MarketplaceUtils_0 (ref), v79 (copy), l_Notification_0 (ref), l_LocalPlayer_0 (ref), l_MarketplaceService_0 (ref)
            for _, v147 in ipairs(v145:GetChildren()) do
                if v147:IsA("Frame") then
                    if v147.Name:find("Ignore") then
                        table.insert(v82, v147);
                    else
                        local l_Main_2 = v147.Main;
                        local l_Button_1 = l_Main_2.Button;
                        local l_RobuxPrice_2 = l_Main_2.PriceBox.RobuxPrice;
                        local function _(v151) --[[ Line: 566 ]] --[[ Name: UpdatePriceText ]]
                            -- upvalues: l_RobuxPrice_2 (copy)
                            l_RobuxPrice_2.Text = ("%*"):format(v151 or "?");
                        end;
                        l_RobuxPrice_2.Text = "?";
                        local l_v147_Attribute_0 = v147:GetAttribute("GamepassId");
                        if l_v147_Attribute_0 == nil then
                            warn("Missing GamepassId");
                        else
                            local function v154() --[[ Line: 578 ]] --[[ Name: PromiseProductInfo ]]
                                -- upvalues: l_MarketplaceUtils_0 (ref), l_v147_Attribute_0 (copy), l_RobuxPrice_2 (copy), v154 (copy)
                                l_MarketplaceUtils_0.PromiseGetProductInfo(l_v147_Attribute_0, Enum.InfoType.GamePass):Then(function(v155) --[[ Line: 580 ]]
                                    -- upvalues: l_RobuxPrice_2 (ref), v154 (ref)
                                    l_RobuxPrice_2.Text = ("%*"):format(v155.PriceInRobux or "?");
                                    task.wait(120 + math.random(60));
                                    v154();
                                end):Catch(function(v156) --[[ Line: 586 ]]
                                    -- upvalues: v154 (ref)
                                    warn(v156);
                                    task.wait(30);
                                    v154();
                                end);
                            end;
                            task.spawn(v154);
                            local v157 = v79[v147.Name];
                            if v157 then
                                v157(v147);
                            end;
                            script:GetAttributeChangedSignal("Gifting"):Connect(function() --[[ Line: 601 ]]
                                -- upvalues: v147 (copy)
                                if script:GetAttribute("Gifting") == true then
                                    v147.Visible = false;
                                    return;
                                else
                                    v147.Visible = true;
                                    return;
                                end;
                            end);
                            local v158 = false;
                            do
                                local l_v158_0 = v158;
                                local function v163() --[[ Line: 610 ]] --[[ Name: OnPressed ]]
                                    -- upvalues: l_v158_0 (ref), l_Notification_0 (ref), v147 (copy), l_MarketplaceUtils_0 (ref), l_LocalPlayer_0 (ref), l_v147_Attribute_0 (copy), l_MarketplaceService_0 (ref)
                                    if l_v158_0 then
                                        l_Notification_0.DisplayMessage((("<Color=Red>You already own %*!"):format(v147.Name)));
                                        return;
                                    else
                                        local v160 = l_MarketplaceUtils_0.promiseUserOwnsGamePass(l_LocalPlayer_0.UserId, l_v147_Attribute_0);
                                        v160:Yield();
                                        local l_v160_Results_0, v162 = v160:GetResults();
                                        if not l_v160_Results_0 then
                                            return;
                                        else
                                            if v162 == false then
                                                l_MarketplaceService_0:PromptGamePassPurchase(l_LocalPlayer_0, l_v147_Attribute_0);
                                            else
                                                l_v158_0 = true;
                                                l_Notification_0.DisplayMessage((("<Color=Red>You already own %*!"):format(v147.Name)));
                                            end;
                                            script["RBLX UI Purchase (SFX)"]:Play();
                                            return;
                                        end;
                                    end;
                                end;
                                l_Button_1.MouseButton1Click:Connect(v163);
                                task.wait();
                            end;
                        end;
                    end;
                end;
            end;
        end)(l_Gamepasses_0);
        local function v165(v164) --[[ Line: 645 ]] --[[ Name: SelectPlayerToGift ]]
            -- upvalues: v58 (ref), l_GiftingTo_0 (copy), l_GiftButton_0 (copy), l_Gift_0 (copy), v55 (copy)
            script:SetAttribute("Gifting", true);
            v58 = v164;
            l_GiftingTo_0.Text = "Gifting " .. v164.DisplayName;
            l_GiftingTo_0.Visible = true;
            l_GiftButton_0.Visible = false;
            l_Gift_0.Visible = false;
            v55:FireServer("SetGiftedPlayer", {
                GiftTo = v164.Name
            });
        end;
        local function _() --[[ Line: 660 ]] --[[ Name: ExitGifting ]]
            -- upvalues: v58 (ref), l_GiftButton_0 (copy), l_GiftingTo_0 (copy), v55 (copy)
            script:SetAttribute("Gifting", false);
            v58 = nil;
            l_GiftButton_0.Visible = true;
            l_GiftingTo_0.Visible = false;
            v55:FireServer("UnsetGiftedPlayer", {});
        end;
        l_GiftButton_0.MouseButton1Click:Connect(function() --[[ Line: 672 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Notification_0 (ref), l_Gift_0 (copy)
            if l_LocalPlayer_0:GetAttribute("ProcessPromptPurchase") == true then
                l_Notification_0.DisplayMessage("<Color=Red> Please wait for previous purchase to process before gifting!");
                return;
            else
                l_Gift_0.Visible = not l_Gift_0.Visible;
                return;
            end;
        end);
        l_Stop_0.MouseButton1Click:Connect(function() --[[ Line: 682 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Notification_0 (ref), v58 (ref), l_GiftButton_0 (copy), l_GiftingTo_0 (copy), v55 (copy)
            if l_LocalPlayer_0:GetAttribute("ProcessPromptPurchase") == true then
                l_Notification_0.DisplayMessage("<Color=Red> Please wait for previous purchase to process!");
                return;
            else
                script:SetAttribute("Gifting", false);
                v58 = nil;
                l_GiftButton_0.Visible = true;
                l_GiftingTo_0.Visible = false;
                v55:FireServer("UnsetGiftedPlayer", {});
                return;
            end;
        end);
        local function _(v167) --[[ Line: 693 ]] --[[ Name: CleanStoredPlayer ]]
            -- upvalues: v59 (copy)
            if v59[v167] ~= nil then
                v59[v167]:Destroy();
                v59[v167] = nil;
            end;
        end;
        local function v176(v169) --[[ Line: 700 ]] --[[ Name: PlayerAdded ]]
            -- upvalues: l_LocalPlayer_0 (ref), v59 (copy), l_Players_0 (ref), l_List_1 (copy), l_PlayerUtils_0 (ref), l_ReplicatedStorage_1 (ref), l_Notification_0 (ref), v165 (copy)
            if v169 == l_LocalPlayer_0 then
                return;
            else
                if v59[v169] ~= nil then
                    v59[v169]:Destroy();
                    v59[v169] = nil;
                end;
                if not v169:IsDescendantOf(l_Players_0) then
                    return;
                else
                    local v170 = script.TemplateGreen:Clone();
                    v170.Name = v169.Name;
                    v170.Parent = l_List_1;
                    local l_PlayerName_0 = v170:WaitForChild("PlayerName");
                    local l_PlayerDisplayName_0 = v170:WaitForChild("PlayerDisplayName");
                    local l_AvatarIcon_0 = v170:WaitForChild("AvatarBox"):WaitForChild("AvatarIcon");
                    l_PlayerName_0.Text = ("@%*"):format(v169.Name);
                    l_PlayerDisplayName_0.Text = v169.DisplayName;
                    l_PlayerUtils_0.PromiseUserThumbnail(v169.UserId):Then(function(v174) --[[ Line: 722 ]]
                        -- upvalues: l_AvatarIcon_0 (copy)
                        l_AvatarIcon_0.Image = v174;
                    end):Catch(function(v175) --[[ Line: 724 ]]
                        warn(v175);
                    end);
                    v170.MouseButton1Up:Connect(function() --[[ Line: 728 ]]
                        -- upvalues: l_ReplicatedStorage_1 (ref), v169 (copy), l_Notification_0 (ref), v165 (ref)
                        if not l_ReplicatedStorage_1:FindFirstChild("Stats" .. v169.Name) then
                            l_Notification_0.DisplayMessage("<Color=Red> This player has not loaded yet!");
                            return;
                        else
                            v165(v169);
                            return;
                        end;
                    end);
                    v59[v169] = v170;
                    return;
                end;
            end;
        end;
        local function v178(v177) --[[ Line: 740 ]] --[[ Name: PlayerRemoving ]]
            -- upvalues: v58 (ref), l_Notification_0 (ref), l_GiftButton_0 (copy), l_GiftingTo_0 (copy), v55 (copy), v59 (copy)
            if v58 ~= nil and v58 == v177 then
                l_Notification_0.DisplayMessage("<Color=Red> The player you were gifting left the game!");
                script:SetAttribute("Gifting", false);
                v58 = nil;
                l_GiftButton_0.Visible = true;
                l_GiftingTo_0.Visible = false;
                v55:FireServer("UnsetGiftedPlayer", {});
            end;
            if v59[v177] ~= nil then
                v59[v177]:Destroy();
                v59[v177] = nil;
            end;
        end;
        for _, v180 in pairs(l_Players_0:GetPlayers()) do
            task.spawn(v176, v180);
        end;
        l_Players_0.PlayerAdded:Connect(v176);
        l_Players_0.PlayerRemoving:Connect(v178);
        task.delay(5, function() --[[ Line: 759 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v44 (ref)
            if l_LocalPlayer_0.Character == nil then
                l_LocalPlayer_0.CharacterAdded:Wait();
            end;
            while _G.arena ~= true do
                v44();
                task.wait(3);
            end;
            warn("Is in arena, breaking ads");
        end);
        v25.Initialized = true;
        return;
    end;
end;
return v25;