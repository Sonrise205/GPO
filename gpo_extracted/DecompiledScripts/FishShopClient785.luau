local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_ToolDescUtils_0 = require(l_Modules_0:WaitForChild("ToolDesc"):WaitForChild("ToolDescUtils"));
local l_Client_0 = l_Modules_0:WaitForChild("Client");
local l_ItemDisplay_0 = require(l_Client_0:WaitForChild("ItemDisplay"));
local l_Shared_0 = l_Modules_0:WaitForChild("Shared");
local l_GameUtils_0 = require(l_Shared_0:WaitForChild("GameUtils"));
local v8 = require(l_Client_0.UIController);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_GameUtils_0.GetStatsFolder(l_LocalPlayer_0);
local l_Parent_0 = script.Parent;
local l_Main_0 = l_Parent_0:WaitForChild("Main");
local l_List_0 = l_Main_0:WaitForChild("Items"):WaitForChild("List");
local l_Close_0 = l_Main_0:WaitForChild("Close");
local v15 = l_ItemDisplay_0.new({
    Gui = l_Parent_0, 
    Trade = false, 
    UseUniqueId = false
});
local l_Inventory_0 = v8:GetStatsFolder():WaitForChild("Inventory"):WaitForChild("Inventory");
local l_FishingShopRemote_0 = l_ReplicatedStorage_0:WaitForChild("FishingShopRemote");
local v18 = {};
local v19 = false;
local function v27() --[[ Line: 36 ]] --[[ Name: UpdateList ]]
    -- upvalues: l_Parent_0 (copy), l_ToolDescUtils_0 (copy), v18 (copy), l_GameUtils_0 (copy), l_LocalPlayer_0 (copy), l_List_0 (copy), v15 (copy), v19 (ref), l_FishingShopRemote_0 (copy)
    if l_Parent_0.Enabled == false then
        return;
    else
        for v20, v21 in pairs(l_ToolDescUtils_0.GetAllFishes()) do
            local v22 = v18[v20] or script.Template:Clone();
            local function _(v23) --[[ Line: 43 ]] --[[ Name: UpdateAvailibility ]]
                -- upvalues: v22 (copy)
                v22.Visible = v23 > 0;
            end;
            local v25 = l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v20);
            if v18[v20] == nil and _G.HasItem(l_LocalPlayer_0, v20) == true then
                v22.Name = v20;
                v22.LayoutOrder = _G.layoutMulti[v21.Rare];
                v22.Price.Text = ("%* Peli"):format(v21.Price);
                v22.Parent = l_List_0;
                v18[v20] = v22;
                v15:AddItem(v22.Display, v20, v25 or 0, 3);
                v22.Visible = v25 > 0;
                v22.Sell.MouseButton1Click:Connect(function() --[[ Line: 60 ]]
                    -- upvalues: v19 (ref), l_LocalPlayer_0 (ref), v20 (copy), v21 (copy), l_FishingShopRemote_0 (ref)
                    if v19 == true then
                        return;
                    else
                        v19 = true;
                        _G.promptQuestion(l_LocalPlayer_0, ("Sell 1 <font color=\"rgb(170, 255, 255)\">%*</font> for <font color=\"rgb(255, 255, 126)\">%* Peli</font>?"):format(v20, v21.Price), {
                            [true] = function() --[[ Line: 65 ]]
                                -- upvalues: l_FishingShopRemote_0 (ref), v20 (ref), v19 (ref)
                                l_FishingShopRemote_0:InvokeServer({
                                    Method = "SellFish", 
                                    Fish = v20, 
                                    All = false
                                });
                                v19 = false;
                            end, 
                            [false] = function() --[[ Line: 70 ]]
                                -- upvalues: v19 (ref)
                                v19 = false;
                            end
                        });
                        return;
                    end;
                end);
                v22.SellAll.MouseButton1Click:Connect(function() --[[ Line: 78 ]]
                    -- upvalues: v19 (ref), l_GameUtils_0 (ref), l_LocalPlayer_0 (ref), v20 (copy), v21 (copy), l_FishingShopRemote_0 (ref)
                    if v19 == true then
                        return;
                    else
                        v19 = true;
                        local v26 = l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v20);
                        _G.promptQuestion(l_LocalPlayer_0, ("Sell <b><font color=\"rgb(247,52,71)\">ALL [%*]</font></b> <font color=\"rgb(170, 255, 255)\">%*s</font> for <font color=\"rgb(255, 255, 126)\">%* Peli</font>?"):format(v26, v20, v21.Price * v26), {
                            [true] = function() --[[ Line: 84 ]]
                                -- upvalues: l_FishingShopRemote_0 (ref), v20 (ref), v19 (ref)
                                l_FishingShopRemote_0:InvokeServer({
                                    Method = "SellFish", 
                                    Fish = v20, 
                                    All = true
                                });
                                v19 = false;
                            end, 
                            [false] = function() --[[ Line: 89 ]]
                                -- upvalues: v19 (ref)
                                v19 = false;
                            end
                        });
                        return;
                    end;
                end);
            end;
            v15:UpdateItem(v20, v25);
            v22.Visible = v25 > 0;
        end;
        return;
    end;
end;
l_Inventory_0:GetPropertyChangedSignal("Value"):Connect(v27);
l_Close_0.MouseButton1Down:Connect(function() --[[ Line: 105 ]]
    -- upvalues: l_Parent_0 (copy)
    l_Parent_0.Enabled = false;
end);
l_Parent_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 109 ]]
    -- upvalues: l_Parent_0 (copy), v15 (copy), v27 (copy)
    if l_Parent_0.Enabled == false then
        v15:StopRotation();
        return;
    else
        v15:StartRotation();
        v27();
        return;
    end;
end);