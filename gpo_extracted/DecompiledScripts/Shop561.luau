repeat
    task.wait();
until workspace.Islands:GetAttribute("ready") == true and workspace.BuyableItems:FindFirstChild("FirstSea") == nil and workspace.BuyableItems:FindFirstChild("SecondSea") == nil;
_G.HasItem = function(v0, v1) --[[ Line: 5 ]]
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    local v3 = game:GetService("HttpService"):JSONDecode(l_FirstChild_0.Inventory.Inventory.Value);
    local v4 = false;
    for v5, _ in v3 do
        if v5 == v1 then
            v4 = true;
        end;
    end;
    return v4;
end;
_G.CheckItemAmmount = function(v7, v8) --[[ Line: 17 ]]
    local v9 = 0;
    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v7.Name);
    for v11, v12 in (game:GetService("HttpService"):JSONDecode(l_FirstChild_1.Inventory.Inventory.Value)) do
        if v11 == v8 then
            v9 = v12;
        end;
    end;
    return v9;
end;
local v13 = require(game.ReplicatedStorage.Modules.NPCInteractions);
workspace:WaitForChild("BuyableItems", 50);
local l_Mouse_0 = game.Players.LocalPlayer:GetMouse();
l_Mouse_0.Icon = "http://www.roblox.com/asset/?id=4776810280";
_G.normalCur = "http://www.roblox.com/asset/?id=4776810280";
local v15 = {};
local function _(v16) --[[ Line: 37 ]] --[[ Name: setupItem ]]
    -- upvalues: v15 (copy), v13 (copy)
    if v15[v16] == true then
        return;
    else
        v15[v16] = true;
        task.spawn(function() --[[ Line: 43 ]]
            -- upvalues: v16 (copy), v13 (ref)
            repeat
                task.wait(1);
            until v16:GetModelSize() ~= Vector3.new();
            local v17 = script.Part:Clone();
            v17.Size = v16:GetModelSize();
            v17.CFrame = v16:GetModelCFrame();
            v17.Name = "ShopPart";
            v17.ClickDetector:Destroy();
            v17.Parent = v16;
            local l_Value_0 = v16.Info.Seller.Value;
            if l_Value_0 == nil then
                l_Value_0 = game.Players.LocalPlayer.Character;
            end;
            local v19 = script.ProximityPrompt:Clone();
            v19.MaxActivationDistance = 4 + v17.Size.Magnitude / 2;
            v19.ActionText = "<font color=\"rgb(255, 255, 126)\">" .. v16.Info.Price.Value .. " Peli" .. "</font>";
            v19.ObjectText = v16.Name;
            v19.HoldDuration = 0;
            v19.Parent = v17;
            v19.Triggered:Connect(function() --[[ Line: 65 ]]
                -- upvalues: v16 (ref), v13 (ref), l_Value_0 (ref)
                local l_Amount_0 = v16.Info:FindFirstChild("Amount");
                local l_Team_0 = v16.Info:FindFirstChild("Team");
                l_Amount_0 = if l_Amount_0 then l_Amount_0.Value else nil;
                l_Team_0 = if l_Team_0 then l_Team_0.Value else nil;
                warn("trying to buy item " .. v16.Name);
                v13:startchat(l_Value_0, true, v16.Name, v16.Info.Price.Value, v16, l_Amount_0, l_Team_0);
            end);
        end);
        return;
    end;
end;
local l_Children_0 = workspace.BuyableItems:GetChildren();
for v24 = 1, #l_Children_0 do
    local v25 = l_Children_0[v24];
    if v15[v25] ~= true then
        v15[v25] = true;
        task.spawn(function() --[[ Line: 43 ]]
            -- upvalues: v25 (copy), v13 (copy)
            repeat
                task.wait(1);
            until v25:GetModelSize() ~= Vector3.new();
            local v26 = script.Part:Clone();
            v26.Size = v25:GetModelSize();
            v26.CFrame = v25:GetModelCFrame();
            v26.Name = "ShopPart";
            v26.ClickDetector:Destroy();
            v26.Parent = v25;
            local l_Value_1 = v25.Info.Seller.Value;
            if l_Value_1 == nil then
                l_Value_1 = game.Players.LocalPlayer.Character;
            end;
            local v28 = script.ProximityPrompt:Clone();
            v28.MaxActivationDistance = 4 + v26.Size.Magnitude / 2;
            v28.ActionText = "<font color=\"rgb(255, 255, 126)\">" .. v25.Info.Price.Value .. " Peli" .. "</font>";
            v28.ObjectText = v25.Name;
            v28.HoldDuration = 0;
            v28.Parent = v26;
            v28.Triggered:Connect(function() --[[ Line: 65 ]]
                -- upvalues: v25 (ref), v13 (ref), l_Value_1 (ref)
                local l_Amount_1 = v25.Info:FindFirstChild("Amount");
                local l_Team_1 = v25.Info:FindFirstChild("Team");
                l_Amount_1 = if l_Amount_1 then l_Amount_1.Value else nil;
                l_Team_1 = if l_Team_1 then l_Team_1.Value else nil;
                warn("trying to buy item " .. v25.Name);
                v13:startchat(l_Value_1, true, v25.Name, v25.Info.Price.Value, v25, l_Amount_1, l_Team_1);
            end);
        end);
    end;
end;
workspace.BuyableItems.ChildAdded:Connect(function(v31) --[[ Line: 100 ]]
    -- upvalues: v15 (copy), v13 (copy)
    if v15[v31] == true then
        return;
    else
        v15[v31] = true;
        task.spawn(function() --[[ Line: 43 ]]
            -- upvalues: v31 (copy), v13 (ref)
            repeat
                task.wait(1);
            until v31:GetModelSize() ~= Vector3.new();
            local v32 = script.Part:Clone();
            v32.Size = v31:GetModelSize();
            v32.CFrame = v31:GetModelCFrame();
            v32.Name = "ShopPart";
            v32.ClickDetector:Destroy();
            v32.Parent = v31;
            local l_Value_2 = v31.Info.Seller.Value;
            if l_Value_2 == nil then
                l_Value_2 = game.Players.LocalPlayer.Character;
            end;
            local v34 = script.ProximityPrompt:Clone();
            v34.MaxActivationDistance = 4 + v32.Size.Magnitude / 2;
            v34.ActionText = "<font color=\"rgb(255, 255, 126)\">" .. v31.Info.Price.Value .. " Peli" .. "</font>";
            v34.ObjectText = v31.Name;
            v34.HoldDuration = 0;
            v34.Parent = v32;
            v34.Triggered:Connect(function() --[[ Line: 65 ]]
                -- upvalues: v31 (ref), v13 (ref), l_Value_2 (ref)
                local l_Amount_2 = v31.Info:FindFirstChild("Amount");
                local l_Team_2 = v31.Info:FindFirstChild("Team");
                l_Amount_2 = if l_Amount_2 then l_Amount_2.Value else nil;
                l_Team_2 = if l_Team_2 then l_Team_2.Value else nil;
                warn("trying to buy item " .. v31.Name);
                v13:startchat(l_Value_2, true, v31.Name, v31.Info.Price.Value, v31, l_Amount_2, l_Team_2);
            end);
        end);
        return;
    end;
end);
local v37 = {
    Grab = "http://www.roblox.com/asset/?id=4826349103", 
    Lock = "http://www.roblox.com/asset/?id=4826094125"
};
local v38 = {};
local v39 = {};
game.ReplicatedStorage.Events.ClickIcon.OnClientEvent:Connect(function(v40, v41) --[[ Line: 107 ]]
    -- upvalues: v38 (copy), l_Mouse_0 (copy), v37 (copy), v39 (copy)
    if v40 == nil then
        return;
    elseif _G.checkRenderDistance(v40.Parent.Position) == false then
        return;
    else
        if v38[v40] then
            v38[v40][1]:Disconnect();
            v38[v40][2]:Disconnect();
            v38[v40] = nil;
        end;
        local v42 = nil;
        local v43 = nil;
        v42 = v40.MouseHoverEnter:Connect(function() --[[ Line: 121 ]]
            -- upvalues: v40 (copy), l_Mouse_0 (ref), v37 (ref), v41 (copy)
            local l_Character_0 = game.Players.LocalPlayer.Character;
            if l_Character_0 == nil or (l_Character_0.HumanoidRootPart.Position - v40.Parent.Position).magnitude > v40.MaxActivationDistance then
                l_Mouse_0.Icon = "http://www.roblox.com/asset/?id=4776810280";
                return;
            else
                l_Mouse_0.Icon = v37[v41];
                return;
            end;
        end);
        v43 = v40.MouseHoverLeave:Connect(function() --[[ Line: 130 ]]
            -- upvalues: l_Mouse_0 (ref)
            l_Mouse_0.Icon = "http://www.roblox.com/asset/?id=4776810280";
        end);
        v38[v40] = {
            v42, 
            v43
        };
        local _ = v40.Parent;
        local v46 = Instance.new("BindableEvent", script);
        v46.Name = "shopEvent";
        v39[v40] = {
            v40, 
            v46
        };
        v46.Event:Wait();
        v46:Destroy();
        l_Mouse_0.Icon = "http://www.roblox.com/asset/?id=4776810280";
        v38[v40] = nil;
        v42:Disconnect();
        v43:Disconnect();
        return;
    end;
end);
local l_Descendants_0 = workspace.Jails:GetDescendants();
for v48 = 1, #l_Descendants_0 do
    if l_Descendants_0[v48]:IsA("ClickDetector") then
        l_Descendants_0[v48].MouseHoverEnter:Connect(function() --[[ Line: 151 ]]
            -- upvalues: l_Mouse_0 (copy)
            l_Mouse_0.Icon = "http://www.roblox.com/asset/?id=4826349103";
        end);
        l_Descendants_0[v48].MouseHoverLeave:Connect(function() --[[ Line: 155 ]]
            -- upvalues: l_Mouse_0 (copy)
            l_Mouse_0.Icon = "http://www.roblox.com/asset/?id=4776810280";
        end);
    end;
end;
local v49 = {};
game:GetService("ProximityPromptService").PromptShown:Connect(function(v50) --[[ Line: 161 ]]
    -- upvalues: v49 (copy)
    if v50:GetAttribute("highlight") == nil then
        return;
    else
        if (v50.Parent.Parent ~= nil and v50.Parent.Parent:IsA("Model") or v50.Parent:FindFirstChild("toolModel")) and v49[v50] == nil then
            if v50.Parent.Parent:FindFirstChild("highlightPrompt") then
                v50.Parent.Parent:FindFirstChild("highlightPrompt"):Destroy();
            end;
            local l_Highlight_0 = Instance.new("Highlight");
            l_Highlight_0.FillColor = Color3.fromRGB(255, 255, 255);
            l_Highlight_0.OutlineColor = Color3.fromRGB(255, 255, 255);
            l_Highlight_0.FillTransparency = 0.5;
            l_Highlight_0.OutlineTransparency = 0;
            l_Highlight_0.Name = "highlightPrompt";
            l_Highlight_0.Parent = v50.Parent.Parent;
            if v50.Parent:FindFirstChild("toolModel") then
                l_Highlight_0.Parent = v50.Parent:FindFirstChild("toolModel").Value;
            end;
            _G.tween(l_Highlight_0, {
                1, 
                Enum.EasingStyle.Circular, 
                Enum.EasingDirection.In, 
                -1, 
                true, 
                0
            }, {
                FillTransparency = 1
            });
            v49[v50] = l_Highlight_0;
        end;
        return;
    end;
end);
game:GetService("ProximityPromptService").PromptHidden:Connect(function(v52) --[[ Line: 187 ]]
    -- upvalues: v49 (copy)
    if v49[v52] ~= nil then
        local v53 = v49[v52];
        _G.tween(v53, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            OutlineTransparency = 1, 
            FillTransparency = 1
        }, nil, true);
        _G.destroy(v53, 0.25);
        v49[v52] = nil;
    end;
end);
local v54 = {};
local function _(v55) --[[ Line: 197 ]] --[[ Name: transNeg ]]
    if math.random(1, 2) == 1 then
        return v55 * -1;
    else
        return v55;
    end;
end;
local _ = function(v57, v58) --[[ Line: 204 ]] --[[ Name: resizeModel ]]
    local l_PrimaryPart_0 = v57.PrimaryPart;
    if l_PrimaryPart_0 == nil then
        return;
    else
        for _, v61 in pairs(v57:GetDescendants()) do
            if v61 ~= nil and v61:IsA("BasePart") then
                v61.Position = l_PrimaryPart_0.Position:Lerp(v61.Position, v58);
                v61.Size = v61.Size * v58;
            end;
        end;
        return;
    end;
end;
local _ = game:GetService("TweenService");
local function v72(v64, v65, v66, _, _) --[[ Line: 219 ]] --[[ Name: tweenModelSize ]]
    local _ = v66 - 1;
    local v70 = 0;
    local l_v64_Scale_0 = v64:GetScale();
    while v70 < 1 do
        v70 = math.min(v70 + task.wait() / v65, 1);
        v64:ScaleTo((math.clamp(l_v64_Scale_0 * (1 - v70), 0.001, l_v64_Scale_0)));
    end;
end;
game.ReplicatedStorage.spinDrop.OnClientEvent:Connect(function(v73, v74, v75) --[[ Line: 231 ]]
    -- upvalues: v72 (copy), v54 (copy)
    if not _G.awaitObject then
        repeat
            task.wait();
        until _G.awaitObject ~= nil;
    end;
    v73 = _G.awaitObject(v73);
    if typeof(v73) ~= "Instance" then
        return;
    elseif v74 ~= nil and v74 == "newCFrame" and v73 ~= nil then
        v73:PivotTo(v75);
        return;
    elseif v74 ~= nil then
        v72(v73, 0.25, 0.001, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        return;
    elseif v54[v73] then
        return;
    elseif v73 == nil then
        return;
    else
        local v76 = math.random(600, 1000);
        local v77 = (if math.random(1, 2) == 1 then v76 * -1 else v76) / 1000;
        local v78 = math.random(600, 1000);
        local v79 = (if math.random(1, 2) == 1 then v78 * -1 else v78) / 1000;
        local v80 = math.random(600, 1000);
        v54[v73] = {
            v77, 
            v79, 
            (if math.random(1, 2) == 1 then v80 * -1 else v80) / 1000, 
            {
                _G.checkRenderDistance(v73:GetPivot().Position, 200), 
                tick()
            }
        };
        return;
    end;
end);
local _ = {};
local v82 = require(game.ReplicatedStorage.Modules.ToolDesc);
local _ = function(v83, v84, v85, v86) --[[ Line: 268 ]] --[[ Name: showPrompt ]]
    -- upvalues: v82 (copy)
    local v87 = script.ProximityPrompt:Clone();
    v87.Parent = v83.PrimaryPart;
    if v85 then
        v87.MaxActivationDistance = 10;
        v87.ActionText = v85;
    end;
    v87:SetAttribute("highlight", true);
    v87:SetAttribute("itemName", "");
    local v88 = nil;
    local v89 = false;
    local v90 = {};
    local v91 = {};
    v87.PromptShown:Connect(function() --[[ Line: 281 ]]
        -- upvalues: v87 (copy), v86 (copy)
        v87.ObjectText = v86;
        v87:SetAttribute("itemName", v86);
    end);
    v87.PromptHidden:Connect(function() --[[ Line: 285 ]]
        -- upvalues: v87 (copy)
        v87.ObjectText = "";
        v87:SetAttribute("itemName", "");
    end);
    v87.PromptButtonHoldBegan:Connect(function(v92) --[[ Line: 289 ]]
        -- upvalues: v83 (copy), v87 (copy), v91 (copy)
        local l_Character_1 = v92.Character;
        if l_Character_1 == nil then
            return;
        elseif l_Character_1.PrimaryPart == nil then
            return;
        elseif (v83.PrimaryPart.Position - l_Character_1.HumanoidRootPart.Position).magnitude > v87.MaxActivationDistance * 1.1 then
            _G.displayMessage("<Color=Red>Too far to pick up!");
            v91[v92] = 0;
            return;
        else
            v91[v92] = tick();
            return;
        end;
    end);
    v87.TriggerEnded:Connect(function(v94) --[[ Line: 305 ]]
        -- upvalues: v91 (copy), v90 (copy)
        v91[v94] = 0;
        v90[v94] = nil;
    end);
    v88 = v87.Triggered:Connect(function(v95) --[[ Line: 310 ]]
        -- upvalues: v89 (ref), v90 (copy), v87 (copy), v91 (copy), v83 (copy), v82 (ref), v84 (copy)
        local l_Character_2 = v95.Character;
        if v89 == true then
            return;
        elseif l_Character_2 == nil then
            return;
        elseif l_Character_2.PrimaryPart == nil then
            return;
        elseif _G.check:inspect(l_Character_2) == false then
            _G.displayMessage("<Color=Red>You are stunned!");
            return;
        elseif v90[v95] then
            _G.displayMessage("<Color=Red>Picking up too fast!");
            return;
        elseif l_Character_2:findFirstChild("Head") == nil then
            _G.displayMessage("<Color=Red>your head is missing.........");
            return;
        elseif l_Character_2.Parent ~= workspace.PlayerCharacters then
            _G.displayMessage("<Color=Red>You are knocked out, cant pick up items!");
            return;
        elseif l_Character_2.PrimaryPart == nil then
            return;
        elseif v87.Enabled == false then
            return;
        elseif v91[v95] and tick() - v91[v95] < v87.HoldDuration * 0.6 then
            _G.displayMessage("<Color=Red>Hold entire duration...");
            return;
        elseif _G.HasItem(v95, v83.Name) and _G.CheckItemAmmount(v95, v83.Name) >= v82[v83.Name].Max then
            _G.displayMessage("<Color=Red>You've reached the max you can hold for this item!");
            return;
        else
            local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. v95.Name);
            if l_FirstChild_2 == nil then
                return;
            else
                if v82[v83.Name] then
                    local l_Type_0 = v82[v83.Name].Type;
                    if l_Type_0 then
                        local v99 = game:GetService("HttpService"):JSONDecode(l_FirstChild_2.Inventory.Inventory.Value);
                        local v100 = 0;
                        for v101, _ in v99 do
                            if v82[v101].Type == l_Type_0 then
                                v100 = v100 + 1;
                            end;
                        end;
                        if v100 >= 4 then
                            _G.displayMessage("<Color=Red>You can only hold 4 items of the same type!");
                            return;
                        end;
                    end;
                end;
                v89 = true;
                v87.Enabled = false;
                v90[v95] = true;
                v89 = false;
                v87.Enabled = true;
                if (v83.PrimaryPart.Position - l_Character_2.HumanoidRootPart.Position).magnitude > v87.MaxActivationDistance then
                    _G.displayMessage("<Color=Red>Too far to pick up!");
                    return;
                else
                    v84(v95);
                    v90[v95] = nil;
                    return;
                end;
            end;
        end;
    end);
    return v87;
end;
game.ReplicatedStorage.Events.renderChest.OnClientEvent:Connect(function(v104, _) --[[ Line: 391 ]]
    if v104 == "pickUp" then
        script.pickupItem.Pitch = math.random(90, 110) / 100;
        game.SoundService:PlayLocalSound(script.pickupItem);
        return;
    else
        return;
    end;
end);
game["Run Service"].Heartbeat:Connect(function(v106) --[[ Line: 492 ]]
    -- upvalues: v39 (copy), v54 (copy)
    for v107, v108 in v39 do
        if v107 then
            local v109, v110 = unpack(v108);
            if v109 == nil or v109:IsDescendantOf(game) == false then
                v39[v107] = nil;
                v110:Fire();
            end;
        end;
    end;
    if game.ReplicatedStorage:FindFirstChild("stopspin") then
        return;
    else
        for v111, _ in v54 do
            if v111 and v111.Parent then
                local v113, v114, v115, v116 = unpack(v54[v111]);
                local v117, v118 = unpack(v116);
                local v119 = nil;
                if tick() - v118 >= 1 then
                    v119 = v111:GetPivot();
                    v117 = _G.checkRenderDistance(v119.Position, 50);
                    v54[v111][4][2] = tick();
                end;
                v54[v111][4][1] = v117;
                if v117 ~= false then
                    if v119 == nil then
                        v119 = v111:GetPivot();
                    end;
                    v111:PivotTo(v119 * CFrame.Angles(v113 * v106, v114 * v106, v115 * v106));
                end;
            else
                v54[v111] = nil;
            end;
        end;
        return;
    end;
end);