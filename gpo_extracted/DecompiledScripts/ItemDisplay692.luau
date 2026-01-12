local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_ToolDesc_0 = require(l_Modules_0:WaitForChild("ToolDesc"));
local l_Module3D_0 = require(l_Modules_0:WaitForChild("Module3D"));
local l_Trove_0 = require(l_Modules_0:WaitForChild("Trove"));
local v7 = require(l_ReplicatedStorage_0.Modules.MEnterLeave);
local l_Shared_0 = l_Modules_0.Shared;
local l_GameUtils_0 = require(l_Shared_0:WaitForChild("GameUtils"));
local l_Client_0 = l_Modules_0.Client;
local l_UIUtils_0 = require(l_Client_0:WaitForChild("UIUtils"));
local l_RainbowGradient_0 = require(l_Client_0:WaitForChild("RainbowGradient"));
local l_Tools_0 = l_ReplicatedStorage_0:WaitForChild("Tools");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Gradients_0 = script:WaitForChild("Gradients");
local v16 = {
    Uncommon = l_Gradients_0:WaitForChild("Uncommon"), 
    Rare = l_Gradients_0:WaitForChild("Rare"), 
    Epic = l_Gradients_0:WaitForChild("Epic"), 
    Legendary = l_Gradients_0:WaitForChild("Legendary"), 
    Mythical = l_Gradients_0:WaitForChild("Mythical"), 
    Collectable = l_Gradients_0:WaitForChild("Collectable")
};
local v17 = {};
v17.__index = v17;
v17.new = function(v18) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy), l_Trove_0 (copy)
    assert(v18.Gui ~= nil, "Missing Gui in Arguments");
    local v19 = setmetatable({}, v17);
    v19.Name = l_HttpService_0:GenerateGUID();
    v19.Gui = v18.Gui;
    v19.Items = {};
    v19.Gradients = {};
    v19.ClickCallbacks = {};
    v19.Rotation = false;
    v19.Trade = v18.Trade or false;
    v19.TradeRemote = nil;
    v19.Thread = nil;
    v19.TotalItems = 0;
    v19.DisableAmount = v18.DisableAmount or false;
    v19.TextAlwaysOn = v18.TextAlwaysOn or false;
    v19.UseUniqueId = v18.UseUniqueId == nil or v18.UseUniqueId ~= false;
    v19.RainbowGradientFunctions = {};
    v19.RainbowGradientThreads = {};
    v19.Trove = l_Trove_0.new();
    if v19.Gui and (typeof(v19.Gui) == "Instance" or typeof(v19.Gui) == "table" and v19.Gui.Destroying ~= nil) then
        v19.Gui.Destroying:Connect(function() --[[ Line: 67 ]]
            -- upvalues: v19 (copy)
            v19:Destroy();
        end);
    end;
    return v19;
end;
v17.AddTradeRemote = function(v20, v21) --[[ Line: 75 ]] --[[ Name: AddTradeRemote ]]
    v20.TradeRemote = v21;
end;
v17.AddClickCallbacks = function(v22, v23) --[[ Line: 79 ]] --[[ Name: AddClickCallbacks ]]
    table.insert(v22.ClickCallbacks, v23);
end;
v17.EnableRotation = function(v24, v25) --[[ Line: 83 ]] --[[ Name: EnableRotation ]]
    v24.Rotation = v25;
    if v25 == true then
        v24:StartRotation();
        return;
    else
        if v25 == false then
            v24:StopRotation();
        end;
        return;
    end;
end;
v17.BindFrameToRotation = function(v26, v27, v28) --[[ Line: 92 ]] --[[ Name: BindFrameToRotation ]]
    v26.Trove:Add(v27:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 93 ]]
        -- upvalues: v27 (copy), v26 (copy)
        if v27.Visible == true and v26.Rotation == true then
            v26:StartRotation();
            return;
        else
            if v27.Visible == false then
                v26:StopRotation();
            end;
            return;
        end;
    end));
    if v28 then
        v26:StartRotation();
    end;
end;
v17.UpdateItem = function(v29, v30, v31) --[[ Line: 106 ]] --[[ Name: UpdateItem ]]
    local v32 = v29.Items[v30];
    if v32 then
        local l_Button_0 = v32.Button;
        v32.ItemAmount = v31;
        l_Button_0.Amount.Text = ("x%*"):format(v31);
        l_Button_0:SetAttribute("amountOwned", v31);
    end;
end;
v17.BindRainbowGradient = function(v34, v35, v36) --[[ Line: 116 ]] --[[ Name: BindRainbowGradient ]]
    -- upvalues: l_RainbowGradient_0 (copy)
    local v37 = v35.Parent:IsA("TextLabel") or v35.Parent:IsA("TextButton");
    local v38 = v37 and v35.Parent.Text or "SkipThis";
    local function v39() --[[ Line: 124 ]] --[[ Name: RainbowGradientCallback ]]
        -- upvalues: v36 (copy), v35 (copy), v34 (copy), v39 (copy), v37 (copy), v38 (copy), l_RainbowGradient_0 (ref)
        while true do
            if v36 then
                print("extra callback");
                v36();
            end;
            local _ = task.wait(0.02);
            if v35.Parent == nil then
                print("broke?");
                if v34.RainbowGradientFunctions[v39] ~= nil then
                    v34.RainbowGradientFunctions[v39] = nil;
                    return;
                else
                    break;
                end;
            elseif v37 and v35.Parent.Text ~= v38 then
                print("it broke?");
                if v34.RainbowGradientFunctions[v39] ~= nil then
                    v34.RainbowGradientFunctions[v39] = nil;
                    return;
                else
                    break;
                end;
            else
                v35.Color = l_RainbowGradient_0:GetColor();
            end;
        end;
    end;
    v34.RainbowGradientFunctions[v39] = v39;
    if v34.Thread ~= nil then
        v34.RainbowGradientThreads[v39] = task.spawn(v39);
    end;
end;
v17.UpdateGradientColor = function(v41, v42, v43, v44) --[[ Line: 161 ]] --[[ Name: UpdateGradientColor ]]
    -- upvalues: l_ToolDesc_0 (copy), v16 (copy)
    local v45 = l_ToolDesc_0[v42];
    local l_Rare_0 = v45.Rare;
    local v47 = v16[l_Rare_0];
    v43.Enabled = true;
    v43.Color = l_Rare_0 == "Common" and ColorSequence.new(Color3.fromRGB(255, 255, 255)) or v47.Color;
    if v45.Rare == "Legendary" or v45.Chroma ~= nil then
        v41:BindRainbowGradient(v43, v44);
    end;
end;
v17.AddItem = function(v48, v49, v50, v51, _, v53) --[[ Line: 174 ]] --[[ Name: AddItem ]]
    -- upvalues: l_GameUtils_0 (copy), l_LocalPlayer_0 (copy), l_ToolDesc_0 (copy), l_Tools_0 (copy), l_HttpService_0 (copy), l_Module3D_0 (copy), v7 (copy), l_UIUtils_0 (copy)
    if v48.Items[v50] ~= nil then
        local v54 = false;
        if v48.Items[v50].ItemAmount ~= v51 then
            v54 = true;
        end;
        local v55 = v48.Items[v50].ItemAmount < v51;
        v48:UpdateItem(v50, v51);
        return v48.Items[v50].Button, {
            updated = v54, 
            increased = v55
        };
    else
        local v56 = v51 or l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v50);
        local _ = v56 ~= 0;
        local v58 = l_ToolDesc_0[v50];
        local v59 = v58 and v58.Type;
        if v58 == nil then
            return;
        else
            local l_l_Tools_0_FirstChild_0 = l_Tools_0:FindFirstChild(v50);
            if not l_l_Tools_0_FirstChild_0 then
                warn("Missing model for itme", v50);
                return;
            else
                local v61 = v48.UseUniqueId == true and ("%*%*%*"):format(v58.Type, v50, (l_HttpService_0:GenerateGUID())) or v50;
                local v62 = script.EmptyTemplate:Clone();
                v62.Name = v61;
                v62.Parent = v49;
                v48.TotalItems = v48.TotalItems + 1;
                v48.Items[v61] = {
                    Button = v62, 
                    ItemModule3D = nil, 
                    ItemAmount = v51
                };
                local l_Border_0 = v62.Border;
                v62.ItemName.Text = v50;
                v48:UpdateGradientColor(v50, v62.ItemName.ItemRare);
                v62.Amount.Text = ("x%*"):format(v56);
                if v56 == 0 then
                    v62.Amount.Text = "";
                end;
                if v48.DisableAmount == true then
                    v62.Amount.Visible = false;
                end;
                v62:SetAttribute("FullName", v61);
                v62:SetAttribute("itemName", v50);
                v62:SetAttribute("itemType", v58.Type);
                v62:SetAttribute("amountOwned", v56);
                if v59 ~= "Grip" then
                    local v64 = l_Module3D_0:Attach3D(v62.Display, l_l_Tools_0_FirstChild_0:Clone());
                    v64:SetDepthMultiplier(1);
                    v64.Camera.FieldOfView = 50;
                    v64:SetActive(true);
                    v64:SetCFrame(CFrame.Angles(0, os.clock() % 6.283185307179586, 0) * CFrame.Angles(-0.03490658503988659, 0, 0));
                    v48.Items[v61].ItemModule3D = v64;
                end;
                if v50 == "Peli" then
                    v62.Amount.Size = UDim2.new(1, 0, 0.2, 0);
                    v62.Amount.Position = UDim2.new(1, 0, 0.975, 0);
                end;
                local l_ViewportFrame_0 = v62.Display:FindFirstChild("ViewportFrame");
                if l_ViewportFrame_0 then
                    l_ViewportFrame_0.ZIndex = 5;
                    l_ViewportFrame_0.BorderSizePixel = 0;
                    l_ViewportFrame_0.ClipsDescendants = true;
                    l_ViewportFrame_0.BackgroundColor3 = Color3.fromRGB(79, 79, 79);
                end;
                local l_UIGradient_0 = l_Border_0.UIGradient;
                v48:UpdateGradientColor(v50, l_UIGradient_0);
                v48.Gradients[v62] = l_UIGradient_0;
                local v67 = nil;
                local v68 = nil;
                if v53 == true then
                    local v69, v70 = v7.MouseEnterLeaveEvent(v62);
                    v67 = v69;
                    v68 = v70;
                end;
                if v59 ~= "Grip" then
                    if v48.TextAlwaysOn == false then
                        v62.ItemName.Visible = false;
                        if v67 == nil then
                            local v71, v72 = v7.MouseEnterLeaveEvent(v62);
                            v67 = v71;
                            v68 = v72;
                        end;
                        v67:Connect(function() --[[ Line: 279 ]]
                            -- upvalues: v62 (copy)
                            v62.ItemName.Visible = true;
                        end);
                        v68:Connect(function() --[[ Line: 283 ]]
                            -- upvalues: v62 (copy)
                            v62.ItemName.Visible = false;
                        end);
                    else
                        v62.ItemName.Visible = true;
                    end;
                else
                    v62.ItemName.Visible = true;
                end;
                if v53 == true then
                    v67:Connect(function() --[[ Line: 295 ]]
                        -- upvalues: v62 (copy)
                        v62.Unavailable.Visible = true;
                    end);
                    v68:Connect(function() --[[ Line: 299 ]]
                        -- upvalues: v62 (copy)
                        v62.Unavailable.Visible = false;
                    end);
                end;
                if v48.Trade == true then
                    v62.Active = true;
                    v62.MouseButton1Click:Connect(function() --[[ Line: 308 ]]
                        -- upvalues: l_UIUtils_0 (ref), v56 (copy), l_LocalPlayer_0 (ref), v50 (copy), v48 (copy)
                        l_UIUtils_0.ButtonEffect();
                        local v73 = nil;
                        if v56 >= 10 then
                            _G.promptQuestionSlider(l_LocalPlayer_0, {
                                DisplayText = v50, 
                                Start = 1, 
                                End = v56 - (_G.LocalOfferedItems and _G.LocalOfferedItems[v50] ~= nil and _G.LocalOfferedItems[v50] or 0), 
                                AcceptText = "Add selected", 
                                DeclineText = "Add 1", 
                                finishFunction = function(v74) --[[ Line: 320 ]] --[[ Name: finishFunction ]]
                                    -- upvalues: v73 (ref)
                                    v73 = v74;
                                    warn("client slider function", v74);
                                end
                            });
                        end;
                        if v48.TradeRemote ~= nil then
                            warn("remote fire count", v73);
                            v48.TradeRemote:FireServer({
                                addItem = v50, 
                                customCount = v73
                            });
                        end;
                        for _, v76 in pairs(v48.ClickCallbacks) do
                            v76();
                        end;
                    end);
                else
                    v62.Active = false;
                end;
                return v62, {
                    newlyMade = true, 
                    updated = true
                };
            end;
        end;
    end;
end;
v17.AddToolItem = function(v77, v78, v79, _) --[[ Line: 343 ]] --[[ Name: AddToolItem ]]
    -- upvalues: l_ToolDesc_0 (copy), l_Tools_0 (copy), l_HttpService_0 (copy), l_Module3D_0 (copy)
    local v81 = l_ToolDesc_0[v79];
    if v81 then
        local _ = v81.Type;
    end;
    if v81 == nil then
        return;
    else
        local l_l_Tools_0_FirstChild_1 = l_Tools_0:FindFirstChild(v79);
        if not l_l_Tools_0_FirstChild_1 then
            warn("Missing model for itme", v79);
            return;
        else
            local v84 = v77.UseUniqueId == true and ("%*%*%*"):format(v81.Type, v79, (l_HttpService_0:GenerateGUID())) or v79;
            local v85 = script.EmptyToolTemplate:Clone();
            v85.Name = v84;
            v85.Parent = v78;
            v77.TotalItems = v77.TotalItems + 1;
            v77.Items[v84] = {
                Button = v85, 
                ItemModule3D = nil
            };
            v85:SetAttribute("FullName", v84);
            v85:SetAttribute("itemName", v79);
            v85:SetAttribute("itemType", v81.Type);
            local v86 = l_Module3D_0:Attach3D(v85.Display, l_l_Tools_0_FirstChild_1:Clone());
            v86:SetDepthMultiplier(1);
            v86.Camera.FieldOfView = 50;
            v86:SetActive(true);
            v86:SetCFrame(CFrame.Angles(0, os.clock() % 6.283185307179586, 0) * CFrame.Angles(-0.03490658503988659, 0, 0));
            v77.Items[v84].ItemModule3D = v86;
            local l_ViewportFrame_1 = v85.Display:FindFirstChild("ViewportFrame");
            if l_ViewportFrame_1 then
                l_ViewportFrame_1.ZIndex = 5;
                l_ViewportFrame_1.ClipsDescendants = true;
                l_ViewportFrame_1.BackgroundColor3 = Color3.fromRGB(79, 79, 79);
            end;
            return v85;
        end;
    end;
end;
v17.RemoveItem = function(v88, v89) --[[ Line: 405 ]] --[[ Name: RemoveItem ]]
    local v90 = v88.Items[v89];
    if v90 then
        if v90.ItemModule3D then
            v90.ItemModule3D:Destroy();
            v90.ItemModule3D = nil;
        end;
        v90.Button:Destroy();
        v88.Items[v89] = nil;
        v88.TotalItems = v88.TotalItems - 1;
        return true;
    else
        return false;
    end;
end;
v17.RemoveAllItems = function(v91) --[[ Line: 427 ]] --[[ Name: RemoveAllItems ]]
    for v92, v93 in pairs(v91.Items) do
        if v93.ItemModule3D then
            v93.ItemModule3D:Destroy();
            v93.ItemModule3D = nil;
        end;
        v93.Button:Destroy();
        v91.Items[v92] = nil;
    end;
    v91.TotalItems = 0;
end;
v17.AddItemsWithDictionary = function(v94, v95, v96, v97) --[[ Line: 442 ]] --[[ Name: AddItemsWithDictionary ]]
    for v98, v99 in pairs(v96) do
        v94:AddItem(v95, v98, v99, v97);
    end;
end;
v17.AddItemsWithArray = function(v100, v101, v102, v103) --[[ Line: 448 ]] --[[ Name: AddItemsWithArray ]]
    for _, v105 in pairs(v102) do
        v100:AddItem(v101, v105, nil, v103);
    end;
end;
v17.StartRotation = function(v106) --[[ Line: 454 ]] --[[ Name: StartRotation ]]
    if v106.Thread ~= nil then
        return;
    else
        print(v106.Gui, "Start Rotation");
        v106.Thread = task.spawn(function() --[[ Line: 458 ]]
            -- upvalues: v106 (copy)
            local v107 = 0;
            while true do
                local _ = task.wait();
                v107 = v107 + 1;
                for _, v110 in pairs(v106.Gradients) do
                    v110.Rotation = v107;
                end;
                for _, v112 in pairs(v106.Items) do
                    if v112.ItemModule3D then
                        v112.ItemModule3D:SetCFrame(CFrame.Angles(0, os.clock() % 6.283185307179586, 0) * CFrame.Angles(-0.03490658503988659, 0, 0));
                    end;
                end;
            end;
        end);
        for _, v114 in pairs(v106.RainbowGradientFunctions) do
            if v106.RainbowGradientThreads[v114] ~= nil and coroutine.status(v106.RainbowGradientThreads[v114]) ~= "dead" then
                task.cancel(v106.RainbowGradientThreads[v114]);
                v106.RainbowGradientThreads[v114] = nil;
            end;
            v106.RainbowGradientThreads[v114] = task.spawn(v114);
        end;
        print("created rainbow threads");
        return;
    end;
end;
v17.StopRotation = function(v115) --[[ Line: 509 ]] --[[ Name: StopRotation ]]
    if v115.Thread and coroutine.status(v115.Thread) ~= "dead" then
        task.cancel(v115.Thread);
        v115.Thread = nil;
    end;
    for v116, v117 in pairs(v115.RainbowGradientThreads) do
        if coroutine.status(v117) ~= "dead" then
            task.cancel(v117);
            v115.RainbowGradientThreads[v116] = nil;
        end;
    end;
end;
v17.Destroy = function(v118) --[[ Line: 526 ]] --[[ Name: Destroy ]]
    v118:StopRotation();
    v118.Trove:Destroy();
end;
return v17;