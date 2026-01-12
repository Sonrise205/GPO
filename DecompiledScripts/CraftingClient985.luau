if _G.displayRareItem == nil then
    repeat
        task.wait();
    until _G.displayRareItem ~= nil;
end;
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_NPCs_0 = workspace:WaitForChild("NPCs");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v5 = require(l_Modules_0.Trove);
local l_Blueprints_0 = require(l_Modules_0:WaitForChild("Blueprints"));
local l_ToolDesc_0 = require(l_Modules_0:WaitForChild("ToolDesc"));
local l_Client_0 = l_Modules_0:WaitForChild("Client");
local l_ItemDisplay_0 = require(l_Client_0:WaitForChild("ItemDisplay"));
local l_Shared_0 = l_Modules_0:WaitForChild("Shared");
local l_GameUtils_0 = require(l_Shared_0:WaitForChild("GameUtils"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v13 = l_ReplicatedStorage_0:WaitForChild("CraftingRemote", 360);
local l_Main_0 = script.Parent:WaitForChild("Main");
local l_Blueprints_1 = l_Main_0:WaitForChild("Blueprints");
local l_List_0 = l_Blueprints_1:WaitForChild("List");
local l_SearchBox_0 = l_Blueprints_1:WaitForChild("SearchBox");
local l_Desc_0 = l_Main_0:WaitForChild("Description"):WaitForChild("Desc");
local l_Requirements_0 = l_Main_0:WaitForChild("Requirements");
local l_ListFrame_0 = l_Requirements_0:WaitForChild("List").ListFrame;
local l_Craft_0 = l_Requirements_0:WaitForChild("Craft");
local l_Item_0 = l_Requirements_0:WaitForChild("Item");
local v23 = {};
local v24 = {};
local v25 = {
    Craftables = 6, 
    ["Fish Baits"] = 10, 
    ["Fishing Rods"] = 15, 
    Brews = 20, 
    Misc = 99
};
local v26 = false;
local v27 = false;
local v28 = nil;
local v29 = {};
local v30 = 0;
local function _() --[[ Line: 60 ]] --[[ Name: getNPC ]]
    -- upvalues: l_NPCs_0 (copy), l_LocalPlayer_0 (copy)
    return l_NPCs_0:FindFirstChild("Blacksmith Sen") or l_LocalPlayer_0.Character;
end;
local v32 = {};
local v33 = {};
local v34 = nil;
local function v46(v35) --[[ Line: 68 ]] --[[ Name: playVoiceLine ]]
    -- upvalues: v30 (ref), l_NPCs_0 (copy), l_LocalPlayer_0 (copy), v32 (copy), v33 (copy), v34 (ref)
    v30 = tick();
    local v36 = l_NPCs_0:FindFirstChild("Blacksmith Sen") or l_LocalPlayer_0.Character;
    local l_Name_0 = v35.Name;
    if not v32[l_Name_0] then
        v32[l_Name_0] = {};
    end;
    local l_v35_Children_0 = v35:GetChildren();
    local v39 = {};
    for _, v41 in l_v35_Children_0 do
        if not v32[l_Name_0][v41.Name] then
            table.insert(v39, v41);
        end;
    end;
    if #v39 == 0 then
        v32[l_Name_0] = {};
        for _, v43 in l_v35_Children_0 do
            if v43.Name ~= v33[l_Name_0] then
                table.insert(v39, v43);
            end;
        end;
    end;
    local v44 = v39[math.random(1, #v39)];
    v32[l_Name_0][v44.Name] = true;
    v33[l_Name_0] = v44.Name;
    if v34 then
        v34:Stop();
        v34:Destroy();
    end;
    local v45 = _G.PlaySound(v36.PrimaryPart, v44);
    v45.Parent = v36.PrimaryPart;
    v34 = v45;
end;
l_SearchBox_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 111 ]] --[[ Name: UpdateSearchList ]]
    -- upvalues: l_SearchBox_0 (copy), l_List_0 (copy)
    local l_Text_0 = l_SearchBox_0.Text;
    local v48 = string.lower(l_Text_0);
    for _, v50 in pairs(l_List_0:GetChildren()) do
        if v50:IsA("ImageButton") then
            v50.Visible = string.find(string.lower(v50.Name), v48) and true or false;
        end;
    end;
end);
local l_Inventory_0 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name):WaitForChild("Inventory"):WaitForChild("Inventory");
local v52 = l_ItemDisplay_0.new({
    Gui = script.Parent, 
    UseUniqueId = false
});
v52:StartRotation();
local function _(v53, v54) --[[ Line: 129 ]] --[[ Name: tagRare ]]
    -- upvalues: l_ToolDesc_0 (copy)
    if l_ToolDesc_0[v53] == nil then
        return;
    else
        local l_RareUIGradient_0 = v54:FindFirstChild("RareUIGradient");
        if l_RareUIGradient_0 == nil then
            l_RareUIGradient_0 = Instance.new("UIGradient", v54);
            l_RareUIGradient_0.Name = "RareUIGradient";
        end;
        _G.displayRareItem(v53, l_RareUIGradient_0);
        return;
    end;
end;
SelectBlueprintItem = function(v57, v58) --[[ Line: 141 ]] --[[ Name: SelectBlueprintItem ]]
    -- upvalues: v26 (ref), l_Desc_0 (copy), l_ToolDesc_0 (copy), v24 (copy), v29 (ref), l_ListFrame_0 (copy), l_HttpService_0 (copy), l_Inventory_0 (copy), v5 (copy), l_GameUtils_0 (copy), l_LocalPlayer_0 (copy), v28 (ref), l_Blueprints_0 (copy), v52 (copy), l_Item_0 (copy)
    if v26 == true then
        return;
    else
        script.Parent.Main.Requirements.List.Visible = true;
        script.Parent.Main.Requirements.Craft.Visible = true;
        script.Parent.Main.Requirements.Item.Visible = true;
        v26 = true;
        l_Desc_0.Text = v58.Description or l_ToolDesc_0[v57].Desc;
        for _, v60 in pairs(v24) do
            v60:Destroy();
        end;
        v29 = {};
        if v58.ClipList == true then
            l_ListFrame_0.ClipsDescendants = true;
        else
            l_ListFrame_0.ClipsDescendants = false;
        end;
        for v61, v62 in pairs(v58.Requirements) do
            local v63 = script.RequirementTemplate:Clone();
            v63.Name = v61;
            v63.Parent = l_ListFrame_0;
            table.insert(v24, v63);
            v63.ItemName.Text = v61;
            v63.Amount.Text = "x" .. v62;
            local l_Select_0 = v63:WaitForChild("Select");
            local l_Selection_0 = v63:WaitForChild("Selection");
            l_Select_0.MouseButton1Click:Connect(function() --[[ Line: 176 ]]
                -- upvalues: l_Selection_0 (copy)
                l_Selection_0.Visible = not l_Selection_0.Visible;
            end);
            local v66 = l_ToolDesc_0[v61];
            local v67 = v66 and v66.BaseItem;
            if v66 == nil and v67 == nil and v58.UseRequiredItem == true then
                v67 = v61;
            end;
            if v58.IgnoreBaseItem ~= nil then
                v67 = nil;
            end;
            do
                local l_v67_0 = v67;
                if l_v67_0 then
                    local v69 = v58.RequirementsExtra and v58.RequirementsExtra[v61];
                    warn(v61, v69);
                    v63.Amount.TextColor3 = Color3.fromRGB(255, 0, 0);
                    local function v81() --[[ Line: 195 ]] --[[ Name: UpdateInventory ]]
                        -- upvalues: l_HttpService_0 (ref), l_Inventory_0 (ref), l_ToolDesc_0 (ref), l_v67_0 (ref), v62 (copy), l_Select_0 (copy), v69 (copy), v63 (copy), l_Selection_0 (copy), v29 (ref)
                        local v70 = 0;
                        local v71 = 0;
                        local v72 = nil;
                        for v73, v74 in pairs(l_HttpService_0:JSONDecode(l_Inventory_0.Value)) do
                            if l_ToolDesc_0[v73] ~= nil and l_ToolDesc_0[v73].BaseItem == l_v67_0 then
                                v70 = v70 + v74;
                                if v62 <= v70 then
                                    if l_Select_0.Visible == false then
                                        l_Select_0.Visible = true;
                                        if v69 == nil then
                                            v63.ItemName.Text = v73;
                                            local l_ItemName_0 = v63.ItemName;
                                            if l_ToolDesc_0[v73] ~= nil then
                                                local l_RareUIGradient_1 = l_ItemName_0:FindFirstChild("RareUIGradient");
                                                if l_RareUIGradient_1 == nil then
                                                    l_RareUIGradient_1 = Instance.new("UIGradient", l_ItemName_0);
                                                    l_RareUIGradient_1.Name = "RareUIGradient";
                                                end;
                                                _G.displayRareItem(v73, l_RareUIGradient_1);
                                            end;
                                        elseif v69.AllowMultiple then
                                            v63.ItemName.Text = ("Please Select %* Items"):format(v62);
                                        end;
                                    end;
                                    v63.Amount.TextColor3 = Color3.fromRGB(0, 255, 0);
                                end;
                                if not l_Selection_0:FindFirstChild(v73) then
                                    local v77 = script.SelectionTemplate:Clone();
                                    v77.Name = v73;
                                    v77.ItemName.Text = v73 .. " x" .. v74;
                                    local l_ItemName_1 = v77.ItemName;
                                    if l_ToolDesc_0[v73] ~= nil then
                                        local l_RareUIGradient_2 = l_ItemName_1:FindFirstChild("RareUIGradient");
                                        if l_RareUIGradient_2 == nil then
                                            l_RareUIGradient_2 = Instance.new("UIGradient", l_ItemName_1);
                                            l_RareUIGradient_2.Name = "RareUIGradient";
                                        end;
                                        _G.displayRareItem(v73, l_RareUIGradient_2);
                                    end;
                                    v77.Parent = l_Selection_0;
                                    if v72 == nil then
                                        v72 = v73;
                                        v71 = math.clamp(v71 + v74, 0, v62);
                                        if v69 == nil then
                                            v29[l_v67_0] = v73;
                                        else
                                            v29[v73] = l_v67_0;
                                        end;
                                        v77.BackgroundColor3 = Color3.fromRGB(0, 255, 0);
                                    end;
                                    v77.MouseButton1Click:Connect(function() --[[ Line: 263 ]]
                                        -- upvalues: v29 (ref), v73 (copy), v71 (ref), v74 (copy), v62 (ref), v77 (copy), v69 (ref), v72 (ref), l_Selection_0 (ref), l_v67_0 (ref), v63 (ref)
                                        if v29[v73] ~= nil then
                                            v29[v73] = nil;
                                            v71 = math.clamp(v71 - v74, 0, v62);
                                            v77.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                                        elseif v69 == nil then
                                            local v80 = v72 and l_Selection_0:FindFirstChild(v72);
                                            if v80 then
                                                v80.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                                            end;
                                            v29[l_v67_0] = v73;
                                            v63.ItemName.Text = v73;
                                            v72 = v73;
                                            v77.BackgroundColor3 = Color3.fromRGB(0, 255, 0);
                                        elseif v62 <= v71 then
                                            return;
                                        elseif v69.AllowMultiple and v71 < v62 then
                                            v29[v73] = l_v67_0;
                                            v71 = math.clamp(v71 + v74, 0, v62);
                                            v77.BackgroundColor3 = Color3.fromRGB(0, 255, 0);
                                        end;
                                        print("ExtraData", v29, v71);
                                    end);
                                end;
                            end;
                        end;
                    end;
                    v81();
                    local v82 = v5.new();
                    v82:Connect(l_Inventory_0.Changed, v81);
                    v82:AttachToInstance(v63);
                else
                    local l_ItemName_2 = v63.ItemName;
                    if l_ToolDesc_0[v61] ~= nil then
                        local l_RareUIGradient_3 = l_ItemName_2:FindFirstChild("RareUIGradient");
                        if l_RareUIGradient_3 == nil then
                            l_RareUIGradient_3 = Instance.new("UIGradient", l_ItemName_2);
                            l_RareUIGradient_3.Name = "RareUIGradient";
                        end;
                        _G.displayRareItem(v61, l_RareUIGradient_3);
                    end;
                    if l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v61) < v62 then
                        v63.Amount.TextColor3 = Color3.fromRGB(255, 0, 0);
                    else
                        v63.Amount.TextColor3 = Color3.fromRGB(0, 255, 0);
                    end;
                end;
            end;
        end;
        if v28 ~= nil then
            warn("selected blue display item", l_Blueprints_0[v28].GivenItem);
            v52:RemoveItem(l_Blueprints_0[v28].GivenItem);
            v28 = nil;
        end;
        warn("selected", v58.GivenItem);
        v52:AddItem(l_Item_0, v58.GivenItem, 1, 3);
        v28 = v57;
        v26 = false;
        return;
    end;
end;
l_Craft_0.MouseButton1Click:Connect(function() --[[ Line: 332 ]]
    -- upvalues: v28 (ref), v27 (ref), v13 (copy), v29 (ref), v24 (copy), l_Blueprints_0 (copy), l_ToolDesc_0 (copy), v46 (copy)
    if v28 and v27 == false then
        v27 = true;
        if v13:InvokeServer({
            Method = "Craft", 
            BlueprintItem = v28, 
            ExtraData = v29
        }) == true then
            for _, v86 in pairs(v24) do
                v86:Destroy();
            end;
            script.Parent.Main.Requirements.List.Visible = false;
            script.Parent.Main.Requirements.Craft.Visible = false;
            script.Parent.Main.Requirements.Item.Visible = false;
            script.BlackSmithCraft:Play();
            local l_NormalCraftDone_0 = script.VoiceLines.NormalCraftDone;
            local l_GivenItem_0 = l_Blueprints_0[v28].GivenItem;
            if l_GivenItem_0 then
                local v89 = l_ToolDesc_0[l_GivenItem_0];
                if v89 then
                    v89 = v89.Type;
                end;
                if v89 == "Fishing Rod" then
                    l_NormalCraftDone_0 = script.VoiceLines.FishCraftDone;
                end;
            end;
            v46(l_NormalCraftDone_0);
            local l_Value_0 = script.Crafter.Value;
            if l_Value_0 then
                l_Value_0.Humanoid:LoadAnimation(script.Animation):Play();
            end;
            v29 = {};
            SelectBlueprintItem(v28, l_Blueprints_0[v28]);
        end;
        v27 = false;
    end;
end);
local v91 = nil;
local v92 = {};
local function v104(v93, v94) --[[ Line: 390 ]] --[[ Name: AddBlueprintItem ]]
    -- upvalues: v23 (copy), v25 (copy), l_List_0 (copy), v92 (copy), l_ListFrame_0 (copy), v91 (ref), v5 (copy), l_ToolDesc_0 (copy), l_Inventory_0 (copy)
    if v23[v93] ~= nil then
        return;
    elseif v94.Disabled == true then
        return;
    else
        local v95 = script.BlueprintTemplate:Clone();
        v95.LayoutOrder = v25[v94.Type] or 10;
        v95.Name = v93;
        v95.Parent = l_List_0;
        local v96 = v92["Line" .. v95.LayoutOrder];
        if v96 then
            v96.Parent = nil;
            task.delay(0.2, function() --[[ Line: 408 ]]
                -- upvalues: v96 (copy), l_List_0 (ref)
                v96.Parent = l_List_0;
            end);
        else
            local v97 = script.Line:Clone();
            v97.LayoutOrder = v95.LayoutOrder - 1;
            v97.Name = "Line" .. v95.LayoutOrder;
            v97.LineName.Text = v94.Type;
            v97.Parent = l_List_0;
            v92[v97.Name] = v97;
        end;
        v23[v93] = v95;
        v95.Icon.Image = v94.Icon;
        v95.MouseButton1Click:Connect(function() --[[ Line: 424 ]]
            -- upvalues: l_ListFrame_0 (ref), v93 (copy), v94 (copy), v91 (ref)
            l_ListFrame_0.ClipsDescendants = false;
            SelectBlueprintItem(v93, v94);
            v91 = v93;
        end);
        local v98 = v5.new();
        local function v100() --[[ Line: 433 ]] --[[ Name: update ]]
            -- upvalues: v94 (copy), v95 (copy)
            local v99 = ("%*"):format(v94.GivenItem);
            v95.ItemName.Text = v99;
        end;
        local v101 = ("%*"):format(v94.GivenItem);
        v95.ItemName.Text = v101;
        v101 = v94.GivenItem;
        local l_ItemName_3 = v95.ItemName;
        if l_ToolDesc_0[v101] ~= nil then
            local l_RareUIGradient_4 = l_ItemName_3:FindFirstChild("RareUIGradient");
            if l_RareUIGradient_4 == nil then
                l_RareUIGradient_4 = Instance.new("UIGradient", l_ItemName_3);
                l_RareUIGradient_4.Name = "RareUIGradient";
            end;
            _G.displayRareItem(v101, l_RareUIGradient_4);
        end;
        v98:Connect(l_Inventory_0.Changed, v100);
        v98:AttachToInstance(v95);
        return;
    end;
end;
local function v114() --[[ Line: 453 ]] --[[ Name: UpdateOwnedBlueprints ]]
    -- upvalues: l_HttpService_0 (copy), l_Inventory_0 (copy), l_Blueprints_0 (copy), v104 (copy), v23 (copy), v91 (ref)
    local v105 = false;
    local v106 = l_HttpService_0:JSONDecode(l_Inventory_0.Value);
    local v107 = 0;
    local v108 = {};
    for v109, _ in pairs(v106) do
        local v111 = l_Blueprints_0[v109];
        if v111 ~= nil then
            v108[v109] = true;
            v104(v109, v111);
            v107 = v107 + 1;
        end;
    end;
    for v112, v113 in pairs(v23) do
        if v108[v112] == nil and (not l_Blueprints_0[v112] or not l_Blueprints_0[v112].Default) then
            if v113 and v113.Parent then
                v113:Destroy();
            end;
            v23[v112] = nil;
        end;
    end;
    if v107 > 0 then
        if v91 ~= nil then
            if v91 ~= nil and v23[v91] ~= nil then
                return;
            end;
        else
            v105 = true;
        end;
    end;
    if not v105 then
        script.Parent.Main.Requirements.Item.Visible = false;
        script.Parent.Main.Requirements.List.Visible = false;
        script.Parent.Main.Requirements.Craft.Visible = false;
    end;
    v105 = false;
end;
v114();
l_Inventory_0:GetPropertyChangedSignal("Value"):Connect(v114);
for v115, v116 in pairs(l_Blueprints_0) do
    if v116.Default == true then
        v104(v115, v116);
    end;
end;
script.Parent.Main.Close.MouseButton1Click:Connect(function() --[[ Line: 515 ]]
    -- upvalues: l_NPCs_0 (copy), l_LocalPlayer_0 (copy), v46 (copy)
    script.Parent.Enabled = false;
    if not l_NPCs_0:FindFirstChild("Blacksmith Sen") then
        local _ = l_LocalPlayer_0.Character;
    end;
    v46(script.VoiceLines.Bye);
end);
script.Parent:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 523 ]]
    -- upvalues: l_NPCs_0 (copy), l_LocalPlayer_0 (copy), v46 (copy)
    if script.Parent.Enabled == true then
        if not l_NPCs_0:FindFirstChild("Blacksmith Sen") then
            local _ = l_LocalPlayer_0.Character;
        end;
        v46(script.VoiceLines.Greet);
    end;
end);
local v119 = nil;
local v120 = nil;
local _ = function(v121) --[[ Line: 535 ]] --[[ Name: handleNPCLines ]]
    -- upvalues: v119 (ref), v30 (ref), v46 (copy)
    if v119 then
        task.cancel(v119);
    end;
    local _ = v121.PrimaryPart.CFrame;
    v119 = task.spawn(function() --[[ Line: 542 ]]
        -- upvalues: v30 (ref), v46 (ref)
        while true do
            warn("playing SFX");
            if tick() - v30 >= 10 then
                v46(script.VoiceLines.Idles);
                task.wait(math.random(8, 10));
            else
                task.wait(2);
            end;
        end;
    end);
end;
local function v127(v124) --[[ Line: 555 ]] --[[ Name: checkNPC ]]
    -- upvalues: v119 (ref), v30 (ref), v46 (copy), v120 (ref)
    if v124.Name == "Blacksmith Sen" then
        local l_PrimaryPart_0 = v124.PrimaryPart;
        if l_PrimaryPart_0 == nil then
            l_PrimaryPart_0 = v124:WaitForChild("HumanoidRootPart", 2);
        end;
        if l_PrimaryPart_0 then
            if v119 then
                task.cancel(v119);
            end;
            local _ = v124.PrimaryPart.CFrame;
            v119 = task.spawn(function() --[[ Line: 542 ]]
                -- upvalues: v30 (ref), v46 (ref)
                while true do
                    warn("playing SFX");
                    if tick() - v30 >= 10 then
                        v46(script.VoiceLines.Idles);
                        task.wait(math.random(8, 10));
                    else
                        task.wait(2);
                    end;
                end;
            end);
            if v120 then
                v120:Disconnect();
                v120 = nil;
            end;
            v120 = v124.AncestryChanged:Connect(function() --[[ Line: 571 ]]
                -- upvalues: v119 (ref), v120 (ref)
                if v119 then
                    task.cancel(v119);
                end;
                if v120 then
                    v120:Disconnect();
                    v120 = nil;
                end;
            end);
        end;
    end;
end;
l_NPCs_0.ChildAdded:Connect(v127);
local l_l_NPCs_0_Children_0 = l_NPCs_0:GetChildren();
for v129 = 1, #l_l_NPCs_0_Children_0 do
    v127(l_l_NPCs_0_Children_0[v129]);
end;