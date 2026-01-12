local _ = game:GetService("TweenService");
local _ = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players").LocalPlayer;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.CrewUtils);
local l_Client_0 = l_Modules_0.Client;
local v8 = require(l_Client_0.ItemDisplay);
return {
    Setup = function(v9, v10) --[[ Line: 17 ]] --[[ Name: Setup ]]
        -- upvalues: v8 (copy)
        local l_CrewsUI_0 = v9.CrewsUI;
        local l_Frame_0 = v9.Frame;
        local l_Frame_1 = l_Frame_0:WaitForChild("Frame");
        local l_Items_0 = l_Frame_1:WaitForChild("Items");
        local l_ConquestPoints_0 = l_Frame_0:WaitForChild("ConquestPoints");
        local l_History_0 = l_Frame_0:WaitForChild("History");
        local l_History_1 = l_Frame_1:WaitForChild("History");
        local l_RefreshButton_0 = l_Frame_0:WaitForChild("RefreshButton");
        l_History_0.MouseButton1Click:Connect(function() --[[ Line: 28 ]]
            -- upvalues: v10 (copy), l_Items_0 (copy), l_History_1 (copy), l_History_0 (copy)
            v10.UIUtils.ButtonEffect();
            l_Items_0.Visible = not l_Items_0.Visible;
            l_History_1.Visible = not l_Items_0.Visible;
            l_History_0.TextLabel.Text = l_History_1.Visible and "Shop" or "Purchase History";
        end);
        local v19 = false;
        l_RefreshButton_0.MouseButton1Click:Connect(function() --[[ Line: 37 ]]
            -- upvalues: v10 (copy), v19 (ref), l_CrewsUI_0 (copy)
            v10.UIUtils.ButtonEffect();
            if v19 == true then
                return;
            else
                v19 = true;
                local v20 = l_CrewsUI_0.Notify("Information", "Prompting shop reroll");
                local v21, v22 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                    Method = "ShopReroll"
                });
                v19 = false;
                l_CrewsUI_0.RemoveNotification(v20, true);
                l_CrewsUI_0.Notify(v22 == nil and "Error" or "Success", v21);
                return;
            end;
        end);
        local v23 = {};
        task.spawn(function() --[[ Line: 55 ]]
            -- upvalues: l_Frame_0 (copy)
            local l_Refresh_0 = l_Frame_0:WaitForChild("Refresh");
            local function _(v25) --[[ Line: 59 ]] --[[ Name: FormatTime ]]
                return string.format("%02i", v25);
            end;
            local function _(v27) --[[ Line: 63 ]] --[[ Name: ConvertHMS ]]
                local v28 = (v27 - v27 % 60) / 60;
                v27 = v27 - v28 * 60;
                local v29 = (v28 - v28 % 60) / 60;
                v28 = v28 - v29 * 60;
                return string.format("%02i", v29) .. ":" .. string.format("%02i", v28) .. ":" .. string.format("%02i", v27);
            end;
            while true do
                local _ = os.date("!*t");
                local v32 = os.date("!*t", os.time() + 86400);
                local v33 = os.time({
                    year = v32.year, 
                    month = v32.month, 
                    day = v32.day, 
                    hour = 0, 
                    min = 0, 
                    sec = 0
                }) - os.time();
                local v34 = "\240\159\148\132 ";
                local l_v33_0 = v33;
                local v36 = (l_v33_0 - l_v33_0 % 60) / 60;
                l_v33_0 = l_v33_0 - v36 * 60;
                local v37 = (v36 - v36 % 60) / 60;
                v36 = v36 - v37 * 60;
                l_Refresh_0.Text = v34 .. string.format("%02i", v37) .. ":" .. string.format("%02i", v36) .. ":" .. string.format("%02i", l_v33_0);
                task.wait(1);
            end;
        end);
        local v38 = {};
        v9.UpdateLogs = function(_, v40) --[[ Line: 93 ]] --[[ Name: UpdateLogs ]]
            -- upvalues: v38 (copy), l_History_1 (copy)
            local l_Purchases_0 = v40.Purchases;
            if l_Purchases_0 == nil then
                return;
            else
                local l_Shop_0 = l_Purchases_0.Shop;
                if l_Shop_0 == nil then
                    return;
                else
                    for _, v44 in pairs(v38) do
                        v44:Destroy();
                    end;
                    for v45, v46 in pairs(l_Shop_0) do
                        local v47 = game.HttpService:JSONDecode(v46);
                        local v48 = script.PurchaseTemplate:Clone();
                        v48.Name = v45;
                        v48.LayoutOrder = -v45;
                        v48.Parent = l_History_1;
                        local v49 = nil;
                        v49 = if v47.Item ~= "Crew Shop Reroll" then ("<font color=\"#FF7800\"> %s (%s) </font>purchased <font color=\"rgb(255,176,0)\">%s </font><font color=\"#ddff02\">for %s Conquest Points</font> on %s"):format(v47.PurchaseName or "", v47.PurchasedBy or "", v47.Item, v47.Amount, v47.PurchasedDate) else ("<font color=\"#FF7800\"> %s (%s) </font>purchased <font color=\"rgb(255,176,0)\">%s </font>on %s"):format(v47.PurchaseName or "", v47.PurchasedBy or "", v47.Item, v47.PurchasedDate);
                        v48.PurchaseInfo.Text = v49;
                        table.insert(v38, v48);
                    end;
                    return;
                end;
            end;
        end;
        local v50 = v8.new({
            Gui = l_Frame_0.Parent.Parent.Parent, 
            Trade = false
        });
        l_Frame_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 139 ]]
            -- upvalues: l_Frame_0 (copy), v50 (copy)
            if l_Frame_0.Visible == true then
                v50:StartRotation();
                return;
            else
                v50:StopRotation();
                return;
            end;
        end);
        v9.UpdateShop = function(v51, v52) --[[ Line: 147 ]] --[[ Name: UpdateShop ]]
            -- upvalues: l_ConquestPoints_0 (copy), v23 (copy), l_Items_0 (copy), v50 (copy), v10 (copy), l_CrewsUI_0 (copy)
            if v52.Shop == nil then
                return;
            else
                v51:UpdateLogs(v52);
                l_ConquestPoints_0.Text = "<font color=\"rgb(255,176,0)\">Conquest Points: </font>" .. v52.ConquestPoints;
                for _, v54 in pairs(v23) do
                    v54:Destroy();
                end;
                for v55, v56 in pairs(v52.Shop) do
                    local v57 = script.ItemTemplate:Clone();
                    v57.Name = v55;
                    v57.ItemName.Text = v55;
                    v57.Cost.Text = "Cost - " .. v56.Price;
                    v57.Available.Text = "Available - " .. v56.Available;
                    v57.Parent = l_Items_0;
                    task.spawn(function() --[[ Line: 167 ]]
                        -- upvalues: v50 (ref), v57 (copy), v55 (copy), v56 (copy)
                        v50:AddItem(v57.Items, v55, v56.Available, 3);
                    end);
                    local v58 = false;
                    do
                        local l_v58_0 = v58;
                        v57.Buy.MouseButton1Click:Connect(function() --[[ Line: 172 ]]
                            -- upvalues: l_v58_0 (ref), v10 (ref), l_CrewsUI_0 (ref), v55 (copy)
                            if l_v58_0 == true then
                                return;
                            else
                                l_v58_0 = true;
                                v10.UIUtils.ButtonEffect();
                                local v60 = l_CrewsUI_0.Notify("Information", "Purchasing " .. v55);
                                local v61, v62 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                                    Method = "Purchase", 
                                    PurchaseType = "CrewShopItem", 
                                    Item = v55
                                });
                                l_v58_0 = false;
                                l_CrewsUI_0.RemoveNotification(v60, true);
                                l_CrewsUI_0.Notify(v62 == nil and "Error" or "Success", v61);
                                return;
                            end;
                        end);
                        table.insert(v23, v57);
                    end;
                end;
                return;
            end;
        end;
    end
};