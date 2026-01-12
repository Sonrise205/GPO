local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
local v4 = {};
local v5 = l_Players_0.LocalPlayer or l_Players_0.PlayerAdded:Wait();
local l_ToolDesc_0 = require(l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("ToolDesc"));
local l_Module3D_0 = require(l_ReplicatedStorage_0.Modules:WaitForChild("Module3D"));
local v8 = require(l_ReplicatedStorage_0.Modules.MEnterLeave);
local _ = require(l_ReplicatedStorage_0.Modules.LayoutUtil);
local _ = require(l_ReplicatedStorage_0.Modules.Trove);
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {
    Uncommon = Color3.fromRGB(170, 255, 127), 
    Rare = Color3.fromRGB(0, 255, 255), 
    Legendary = Color3.fromRGB(170, 0, 255), 
    Mythical = Color3.fromRGB(170, 0, 255)
};
local v15 = nil;
local v16 = {};
local function v20(v17, v18) --[[ Line: 31 ]] --[[ Name: setOutter ]]
    -- upvalues: l_ToolDesc_0 (copy), v14 (copy), v12 (copy)
    local l_Rare_0 = l_ToolDesc_0[v18].Rare;
    if l_Rare_0 ~= "Common" then
        v17.Outter.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), v14[l_Rare_0]);
        if l_Rare_0 == "Legendary" then
            v17.Outter.UIGradient.Color = script.Legend.Color;
        elseif l_Rare_0 == "Mythical" then
            v17.Outter.UIGradient.Color = script.Myth.Color;
        elseif l_Rare_0 == "Collectable" then
            v17.Outter.UIGradient.Color = script.Collectable.Color;
        elseif l_Rare_0 == "Epic" then
            v17.Outter.UIGradient.Color = script.Epic.Color;
        end;
        v12[v17.Outter.UIGradient] = v17.Outter.UIGradient;
    end;
end;
local function _(v21) --[[ Line: 48 ]] --[[ Name: closeInventory ]]
    v21.Items.Visible = true;
    v21.Inventory.Visible = false;
    v21.Outline.Outter.ImageColor3 = Color3.fromRGB(255, 255, 255);
    v21.SearchBar.Visible = false;
end;
local function v30(v23, v24) --[[ Line: 55 ]] --[[ Name: update ]]
    if v24 == nil then
        v24 = 1;
    end;
    local v25 = Vector2.new(0.025, 0.025);
    local v26 = Vector2.new(0.315, 0.315) * v24;
    local l_UIGridLayout_0 = v23.UIGridLayout;
    local v28 = v26 * v23.AbsoluteSize;
    local v29 = v25 * v23.AbsoluteSize;
    v29 = UDim2.new(0, v29.X, 0, v29.Y);
    v28 = UDim2.new(0, v28.X, 0, v28.Y);
    if v23:IsA("ScrollingFrame") then
        l_UIGridLayout_0.CellPadding = v29;
        l_UIGridLayout_0.CellSize = v28;
        v23.CanvasSize = UDim2.new(0, l_UIGridLayout_0.AbsoluteContentSize.X, 0, l_UIGridLayout_0.AbsoluteContentSize.Y);
    end;
end;
local function v40(v31) --[[ Line: 73 ]] --[[ Name: updateInventory ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v5 (copy), l_ToolDesc_0 (copy), v13 (ref)
    local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. v5.Name);
    local v33 = nil;
    v33 = if v31 == nil then l_l_ReplicatedStorage_0_FirstChild_0.Inventory.Inventory.Value else v31;
    local v34 = nil;
    v34 = if typeof(v33) == "string" then game:GetService("HttpService"):JSONDecode(v33) else v31;
    if v31 == nil then

    end;
    local v35 = {};
    local v36 = {};
    for v37, v38 in pairs(v34) do
        if l_ToolDesc_0[v37] then
            local l_Type_0 = l_ToolDesc_0[v37].Type;
            if _G.notAllowed[l_Type_0] == nil and _G.bannedItems[v37] == nil and l_ToolDesc_0[v37].Untradeable == nil then
                v36[v37] = v38;
                table.insert(v35, v37);
            end;
        end;
    end;
    if v31 == nil then
        v13 = v35;
    end;
    return v36, v34;
end;
local function v46(v41, v42) --[[ Line: 119 ]] --[[ Name: getItemFrame ]]
    local v43 = nil;
    local l_v41_Children_0 = v41:GetChildren();
    for v45 = 1, #l_v41_Children_0 do
        if l_v41_Children_0[v45]:IsA("Frame") and l_v41_Children_0[v45]:GetAttribute("realItemName") == v42 then
            return l_v41_Children_0[v45];
        end;
    end;
    return v43;
end;
_G.targetPlayerInventory = {};
_G.targetPlayer = nil;
local function v73(v47, v48, v49, v50, v51) --[[ Line: 133 ]] --[[ Name: addItemsToFrame ]]
    -- upvalues: v40 (copy), l_ToolDesc_0 (copy), l_ReplicatedStorage_0 (copy), v16 (ref), v46 (copy), l_Module3D_0 (copy), v8 (copy), v20 (copy), v11 (copy), v30 (copy)
    if _G.displayRareItem == nil then
        repeat
            task.wait();
        until _G.displayRareItem ~= nil;
    end;
    local v52 = nil;
    if v48 == nil then
        local v53, v54 = v40();
        v52 = v53;
        v48 = v54;
    else
        v52 = v40(v48);
    end;
    for v55, v56 in pairs(v48) do
        if l_ToolDesc_0[v55] == nil or l_ToolDesc_0[v55] ~= nil and _G.notAllowed[l_ToolDesc_0[v55].Type] ~= nil or l_ReplicatedStorage_0.Tools:FindFirstChild(v55) == nil or _G.targetPlayerInventory[v55] ~= nil and v49 ~= nil then
            local v57 = false;
            if l_ToolDesc_0[v55] and l_ToolDesc_0[v55].Type == "Grip" then
                v57 = true;
            end;
            if v57 == false then
                warn("skipping", v55);
                continue;
            end;
        end;
        if v49 and v16 ~= nil and v16[v55] ~= nil then
            if v47:FindFirstChild(v55) then
                v47:FindFirstChild(v55).Visible = false;
            end;
        else
            local v58 = v46(v47, v55);
            if v58 ~= nil then
                v58.Ammount.Text = "x" .. v56;
                v58.Visible = true;
            else
                local v59 = script.Frame:Clone();
                v59.Name = l_ToolDesc_0[v55].Type;
                v59:SetAttribute("realItemName", v55);
                local v60 = nil;
                local v61 = l_ReplicatedStorage_0.Tools[v55]:Clone();
                v60 = l_Module3D_0:Attach3D(v59.ItemFrame, v61);
                v60:SetDepthMultiplier(1);
                v60.Camera.FieldOfView = 50;
                v60:SetActive(true);
                local v62 = v59.ItemFrame:WaitForChild("ViewportFrame", 1);
                if v62 then
                    v62.ZIndex = 5;
                    v62.ClipsDescendants = true;
                    v62.BackgroundColor3 = Color3.fromRGB(79, 79, 79);
                end;
                if v51 == nil then
                    v51 = v59;
                end;
                v59.Ammount.Text = "x" .. v56;
                v59.Parent = v47;
                if v49 == true and _G.targetPlayer ~= nil then
                    local v63 = l_ReplicatedStorage_0:WaitForChild("Stats" .. _G.targetPlayer.Name, 3);
                    if l_ToolDesc_0[v55].tradeLevel ~= nil and v63.Stats.Level.Value < l_ToolDesc_0[v55].tradeLevel or _G.bannedItems[v55] ~= nil or l_ToolDesc_0[v55].Untradeable ~= nil then
                        v59.lock.Visible = true;
                        if _G.bannedItems[v55] == nil and l_ToolDesc_0[v55].Untradeable == nil then
                            v59.lock.levelreq.Text = l_ToolDesc_0[v55].tradeLevel;
                        else
                            v59.lock.levelreq.Text = "X";
                        end;
                    end;
                end;
                local v64, v65 = v8.MouseEnterLeaveEvent(v59);
                v59.itemName.Text = v55;
                _G.displayRareItem(v55, v59.itemName.ItemRare);
                if l_ToolDesc_0[v55].Type ~= "Grip" then
                    v64:Connect(function() --[[ Line: 208 ]]
                        -- upvalues: v59 (copy)
                        v59.itemName.Visible = true;
                    end);
                    v65:Connect(function() --[[ Line: 211 ]]
                        -- upvalues: v59 (copy)
                        v59.itemName.Visible = false;
                    end);
                else
                    v59.itemName.Visible = true;
                end;
                v20(v59, v55);
                if v49 == true then
                    local v66 = false;
                    do
                        local l_v66_0 = v66;
                        v59.FrameButton.InputBegan:Connect(function() --[[ Line: 221 ]]
                            -- upvalues: l_v66_0 (ref)
                            l_v66_0 = true;
                        end);
                        v59.FrameButton.InputEnded:Connect(function() --[[ Line: 225 ]]
                            -- upvalues: l_v66_0 (ref)
                            l_v66_0 = false;
                        end);
                        local _ = function(_) --[[ Line: 228 ]] --[[ Name: click ]]
                            -- upvalues: v55 (copy), v59 (copy)
                            _G.tradeRemote:FireServer({
                                addItem = v55
                            });
                            circleclick:Activate(v59.FrameButton);
                        end;
                        v59.FrameButton.Activated:Connect(function() --[[ Line: 233 ]]
                            -- upvalues: v55 (copy), v59 (copy), v47 (copy)
                            _G.tradeRemote:FireServer({
                                addItem = v55
                            });
                            circleclick:Activate(v59.FrameButton);
                            local l_Parent_0 = v47.Parent;
                            l_Parent_0.Items.Visible = true;
                            l_Parent_0.Inventory.Visible = false;
                            l_Parent_0.Outline.Outter.ImageColor3 = Color3.fromRGB(255, 255, 255);
                            l_Parent_0.SearchBar.Visible = false;
                        end);
                    end;
                end;
                v11[v59] = {
                    v60, 
                    v51
                };
                v59.AncestryChanged:Connect(function() --[[ Line: 249 ]]
                    -- upvalues: v59 (copy), v11 (ref)
                    if not v59:IsDescendantOf(game) then
                        v11[v59] = nil;
                    end;
                end);
            end;
        end;
    end;
    v30(v47, v50);
    for _, v72 in v47:GetChildren() do
        if v72:IsA("Frame") and v48[v72:GetAttribute("realItemName")] == nil then
            v72:Destroy();
        end;
    end;
end;
v4.displayTrade = function(_, v75, v76, v77, v78) --[[ Line: 263 ]] --[[ Name: displayTrade ]]
    -- upvalues: v73 (copy)
    v73(v75, v76, nil, v77, v78);
end;
v4.openZhensBalls = function(_, v80) --[[ Line: 267 ]] --[[ Name: openZhensBalls ]]
    -- upvalues: v73 (copy), v15 (ref), l_UserInputService_0 (copy)
    if v80.Inventory.Visible then
        return;
    else
        v80.Items.Visible = false;
        v80.Inventory.Visible = true;
        v80.Outline.Outter.ImageColor3 = Color3.fromRGB(170, 170, 255);
        v73(v80.Inventory, nil, true);
        if v15 then
            v15:Disconnect();
            v15 = nil;
        end;
        v80.SearchBar.Visible = true;
        v15 = l_UserInputService_0.InputBegan:Connect(function(v81, v82) --[[ Line: 280 ]]
            -- upvalues: v80 (copy)
            if v82 then
                return;
            else
                if v81.UserInputType == Enum.UserInputType.MouseButton1 or v81.UserInputType == Enum.UserInputType.Touch then
                    local l_v80_0 = v80;
                    l_v80_0.Items.Visible = true;
                    l_v80_0.Inventory.Visible = false;
                    l_v80_0.Outline.Outter.ImageColor3 = Color3.fromRGB(255, 255, 255);
                    l_v80_0.SearchBar.Visible = false;
                end;
                return;
            end;
        end);
        return;
    end;
end;
v4.setupFrame = function(_, v85) --[[ Line: 290 ]] --[[ Name: setupFrame ]]
    -- upvalues: v4 (copy)
    for _ = 1, 40 - (#v85.Items:GetChildren() - 1) do
        local v87 = script.Add:Clone();
        v87.FrameButton.Activated:Connect(function() --[[ Line: 294 ]]
            -- upvalues: v4 (ref), v85 (copy), v87 (copy)
            v4:openZhensBalls(v85);
            circleclick:Activate(v87.FrameButton);
        end);
        v87.Parent = v85.Items;
    end;
end;
v4.updateItems = function(_, v89, v90) --[[ Line: 302 ]] --[[ Name: updateItems ]]
    -- upvalues: v16 (ref), l_ReplicatedStorage_0 (copy), l_Module3D_0 (copy), v11 (copy), v20 (copy), l_ToolDesc_0 (copy), v8 (copy), v4 (copy)
    local v91 = {};
    local v92 = 0;
    v16 = v90;
    for v93, v94 in pairs(v90) do
        v92 = v92 + 1;
        v91[v93] = v94;
    end;
    if v92 > 40 then
        warn("max slots reached");
        return;
    else
        for v95, _ in pairs(v90) do
            if v89.Items:FindFirstChild(v95) then
                v89.Items:FindFirstChild(v95).Ammount.Text = "x" .. v91[v95];
            else
                local v97 = script.Frame:Clone();
                v97.Name = v95;
                local v98 = nil;
                local v99 = l_ReplicatedStorage_0.Tools[v95]:Clone();
                v98 = l_Module3D_0:Attach3D(v97.ItemFrame, v99);
                v98:SetDepthMultiplier(1);
                v98.Camera.FieldOfView = 50;
                v98:SetActive(true);
                local v100 = v97.ItemFrame:WaitForChild("ViewportFrame", 1);
                if v100 then
                    v100.ZIndex = 5;
                    v100.BackgroundColor3 = Color3.fromRGB(79, 79, 79);
                end;
                v97.Ammount.Text = "x" .. v91[v95];
                v97.Parent = v89.Items;
                v11[v97] = {
                    v98, 
                    v97
                };
                v97.AncestryChanged:Connect(function() --[[ Line: 336 ]]
                    -- upvalues: v97 (copy), v11 (ref)
                    if not v97:IsDescendantOf(game) then
                        v11[v97] = nil;
                    end;
                end);
                v20(v97, v95);
                if l_ToolDesc_0[v95].Type == "Grip" then
                    v97.itemName.Visible = true;
                    v97.itemName.Text = v95;
                    _G.displayRareItem(v95, v97.itemName.ItemRare);
                end;
                local v101, v102 = v8.MouseEnterLeaveEvent(v97);
                v101:Connect(function() --[[ Line: 353 ]]
                    -- upvalues: v97 (copy), v89 (copy)
                    v97.takeoff.Visible = true;
                    local l_Children_0 = v89.Items:GetChildren();
                    for v104 = 1, #l_Children_0 do
                        if l_Children_0[v104]:IsA("Frame") and l_Children_0[v104]:FindFirstChild("takeoff") and l_Children_0[v104] ~= v97 then
                            l_Children_0[v104].takeoff.Visible = false;
                        end;
                    end;
                end);
                v102:Connect(function() --[[ Line: 362 ]]
                    -- upvalues: v97 (copy)
                    v97.takeoff.Visible = false;
                end);
                v97.FrameButton.Activated:Connect(function() --[[ Line: 365 ]]
                    -- upvalues: v95 (copy), v97 (copy)
                    _G.tradeRemote:FireServer({
                        removeItem = v95
                    });
                    circleclick:Activate(v97.FrameButton);
                end);
            end;
        end;
        for _, v106 in v89.Items:GetChildren() do
            if v91[v106.Name] == nil and v106:IsA("Frame") then
                v106:Destroy();
            end;
        end;
        for _ = 1, v92 do
            if v89.Items:FindFirstChild("Add") then
                v89.Items:FindFirstChild("Add"):Destroy();
            end;
        end;
        v4:setupFrame(v89);
        return;
    end;
end;
v4.clearAll = function(_) --[[ Line: 390 ]] --[[ Name: clearAll ]]
    -- upvalues: v5 (copy), v11 (copy), v16 (ref)
    local l_TradeGUI_0 = v5.PlayerGui:FindFirstChild("TradeGUI");
    if l_TradeGUI_0 == nil then
        return;
    else
        for v110, v111 in pairs(v11) do
            if v110:IsDescendantOf(l_TradeGUI_0) then
                v111[1]:End();
                v11[v110] = nil;
            else
                v11[v110] = nil;
            end;
        end;
        v16 = {};
        return;
    end;
end;
local v112 = 0;
local _ = {};
local v114 = {};
local function v120(v115) --[[ Line: 414 ]] --[[ Name: TrulyVisible ]]
    -- upvalues: v114 (copy)
    if v114[v115] and v114[v115].Visible == false then
        return false;
    else
        local l_v115_FirstAncestorWhichIsA_0 = v115:FindFirstAncestorWhichIsA("ScreenGui");
        if l_v115_FirstAncestorWhichIsA_0 and l_v115_FirstAncestorWhichIsA_0.Enabled == false then
            return false;
        else
            local function _(v117) --[[ Line: 427 ]] --[[ Name: destroySeq ]]
                -- upvalues: v114 (ref)
                if v117 == nil then
                    return;
                elseif v114[v117] then
                    return;
                else
                    v114[v117] = v117;
                    v117.Destroying:Connect(function() --[[ Line: 435 ]]
                        -- upvalues: v114 (ref), v117 (copy)
                        if v114[v117] then
                            v114[v117] = nil;
                        end;
                    end);
                    return;
                end;
            end;
            local l_v115_0 = v115;
            while l_v115_0 ~= l_v115_FirstAncestorWhichIsA_0 do
                if l_v115_0 and l_v115_0:IsA("GuiObject") and l_v115_0.Visible == false then
                    if v115 ~= nil and not v114[v115] then
                        v114[v115] = v115;
                        v115.Destroying:Connect(function() --[[ Line: 435 ]]
                            -- upvalues: v114 (ref), v115 (copy)
                            if v114[v115] then
                                v114[v115] = nil;
                            end;
                        end);
                    end;
                    return false;
                elseif l_v115_0 ~= nil then
                    l_v115_0 = l_v115_0.Parent;
                else
                    break;
                end;
            end;
            if l_v115_0 == nil then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
if _G.TradingRotationRS then
    _G.TradingRotationRS:Disconnect();
    _G.TradingRotationRS = nil;
end;
local v121 = CFrame.Angles(-0.03490658503988659, 0, 0);
_G.TradingRotationRS = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 469 ]]
    -- upvalues: v11 (copy), v120 (copy), v121 (copy), v112 (ref), v12 (copy)
    if not _G.itemRotation then
        return;
    else
        for v122, v123 in v11 do
            if v122.Visible then
                local v124, v125 = unpack(v123);
                if not v125 or not v125:IsDescendantOf(game) or not v122:IsDescendantOf(game) then
                    v11[v122] = nil;
                elseif not v125 or v120(v125) then
                    v124:SetCFrame(CFrame.Angles(0, tick() % 6.283185307179586, 0) * v121);
                end;
            end;
        end;
        v112 = v112 + 1;
        for v126, v127 in v12 do
            if v127 then
                if v127:IsDescendantOf(game) then
                    v127.Rotation = v112;
                else
                    v12[v126] = nil;
                end;
            else
                v12[v126] = nil;
            end;
        end;
        return;
    end;
end);
l_ReplicatedStorage_0.tradeCheck.OnClientInvoke = function() --[[ Line: 503 ]]
    return true;
end;
return v4;