local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("GuiService");
local _ = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v8 = require(l_Modules_0.Leveling);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local v11 = require(l_Shared_0.GamePlaceInfo);
local v12 = {
    Initialized = false
};
local function _(v13) --[[ Line: 20 ]] --[[ Name: secondsToMins ]]
    return (math.ceil(v13 / 60));
end;
local function v20(v15) --[[ Line: 24 ]] --[[ Name: addComasToNumber ]]
    local v16 = typeof(v15) == "string" and tostring(v15) or v15;
    local _ = nil;
    repeat
        local v18, v19 = string.gsub(v16, "^(-?%d+)(%d%d%d)", "%1,%2");
        v16 = v18;
    until v19 == 0;
    return v16;
end;
v12.Initialize = function(v21) --[[ Line: 33 ]] --[[ Name: Initialize ]]
    -- upvalues: v12 (copy), l_ReplicatedStorage_0 (copy), l_PlayerGui_0 (copy), v8 (copy), l_TweenService_0 (copy), v20 (copy), l_LocalPlayer_0 (copy), v11 (copy)
    if v12.Initialized then
        warn("HUD already initialized");
        return;
    else
        local l_reservedCode_0 = l_ReplicatedStorage_0:WaitForChild("reservedCode");
        local v23 = l_PlayerGui_0:WaitForChild("HUD", 360);
        local l_Main_0 = v23:WaitForChild("Main");
        local l_Bars_0 = l_Main_0:WaitForChild("Bars");
        local l_Experience_0 = l_Bars_0:WaitForChild("Experience");
        local l_Health_0 = l_Bars_0:WaitForChild("Health");
        local l_ShieldFill_0 = l_Health_0.Base.Bar.ShieldFill;
        local l_Stamina_0 = l_Bars_0:WaitForChild("Stamina");
        local l_Boosts_0 = l_Main_0:WaitForChild("Boosts");
        local l_DevilFruit_0 = l_Boosts_0:WaitForChild("DevilFruit");
        local l_Drop_0 = l_Boosts_0:WaitForChild("Drop");
        local l_Exp_0 = l_Boosts_0:WaitForChild("Exp");
        local l_Regen_0 = l_Health_0.Detail.Regen;
        local l_Regen_1 = l_Stamina_0.Detail.Regen;
        l_Regen_0.TextTransparency = 1;
        l_Regen_1.TextTransparency = 1;
        local l_Peli_0 = l_Main_0:WaitForChild("Peli");
        local l_Peli_1 = l_Peli_0:WaitForChild("Peli");
        local l_DropAmount_0 = l_Peli_0:WaitForChild("DropAmount");
        local l_Buttons_0 = l_Main_0:WaitForChild("Buttons");
        local l_v21_StatsFolder_0 = v21:GetStatsFolder();
        local l_Peli_2 = l_v21_StatsFolder_0.Stats.Peli;
        local l_Level_0 = l_v21_StatsFolder_0.Stats.Level;
        local l_EXP_0 = l_v21_StatsFolder_0.Stats.EXP;
        local l_Stamina_1 = l_v21_StatsFolder_0.Stamina;
        local l_Inventory_0 = l_v21_StatsFolder_0.Inventory.Inventory;
        local l_Boosts_1 = l_v21_StatsFolder_0.Boosts;
        local l_2XEXP_0 = l_Boosts_1["2XEXP"];
        local l_2XDROP_0 = l_Boosts_1["2XDROP"];
        local l_DFTimer_0 = l_Boosts_1.DFTimer;
        local v50 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v51 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v52 = TweenInfo.new(0.25);
        local v53 = {};
        local function v64(v54, v55, v56) --[[ Line: 85 ]] --[[ Name: UpdateBarFill ]]
            -- upvalues: l_Experience_0 (copy), l_Level_0 (copy), v8 (ref), l_TweenService_0 (ref), v50 (copy), v53 (copy), v51 (copy)
            v55 = math.max(math.floor(v55), 0);
            v56 = math.floor(v56);
            local v57 = math.clamp(v55 / v56, 0, 1);
            local l_Progress_0 = v54.Detail.Progress;
            local l_Shadow_0 = l_Progress_0.Shadow;
            local l_Bar_0 = v54.Base.Bar;
            local l_Fill_0 = l_Bar_0.Fill;
            local l_FillLag_0 = l_Bar_0.FillLag;
            local v63 = ("%* / %*"):format(v55, v56);
            l_Progress_0.Text = v63;
            l_Shadow_0.Text = v63;
            if v54 == l_Experience_0 and l_Level_0.Value >= v8.MaxLevel then
                l_Progress_0.Text = "MAX / MAX";
                l_Shadow_0.Text = "MAX / MAX";
                v57 = 1;
            end;
            l_TweenService_0:Create(l_Fill_0, v50, {
                Size = UDim2.new(v57, 0, 1, 0)
            }):Play();
            if v53[l_Bar_0] and coroutine.status(v53[l_Bar_0]) ~= "dead" then
                task.defer(task.cancel, v53[l_Bar_0]);
            end;
            v53[l_Bar_0] = task.delay(0.35, function() --[[ Line: 125 ]]
                -- upvalues: l_TweenService_0 (ref), l_FillLag_0 (copy), v51 (ref), v57 (ref)
                l_TweenService_0:Create(l_FillLag_0, v51, {
                    Size = UDim2.new(v57, 0, 1, 0)
                }):Play();
            end);
        end;
        local v65 = {};
        local function v75(v66, v67, _) --[[ Line: 137 ]] --[[ Name: UpdateRegenerationTick ]]
            -- upvalues: v65 (copy), l_TweenService_0 (ref), v52 (copy)
            local l_Regen_2 = v66.Detail.Regen;
            local v70 = v65[v66.Name];
            if not v70 then
                v65[v66.Name] = {
                    LastTick = 0, 
                    LastValue = v67, 
                    Regeneration = 0, 
                    Averages = {}
                };
                v70 = v65[v66.Name];
            end;
            local v71 = v67 - v70.LastValue;
            if os.clock() - v70.LastTick >= 1 then
                v70.LastTick = os.clock();
                table.clear(v70.Averages);
            end;
            if v71 > 0 then
                table.insert(v70.Averages, v71);
                local v72 = 0;
                for _, v74 in v70.Averages do
                    v72 = v72 + v74;
                end;
                v72 = v72 / #v70.Averages;
                l_Regen_2.TextTransparency = 0;
                l_Regen_2.Text = ("+%*"):format(v72 ~= 0 and math.floor(v72) or "");
                if v70.Thread and coroutine.status(v70.Thread) ~= "dead" then
                    task.defer(task.cancel, v70.Thread);
                end;
                v70.Thread = task.delay(2, function() --[[ Line: 176 ]]
                    -- upvalues: l_TweenService_0 (ref), l_Regen_2 (copy), v52 (ref)
                    l_TweenService_0:Create(l_Regen_2, v52, {
                        TextTransparency = 1
                    }):Play();
                end);
            end;
            v70.LastValue = v67;
        end;
        local function v79() --[[ Line: 191 ]] --[[ Name: OnPeliChanged ]]
            -- upvalues: l_Peli_0 (copy), l_Peli_2 (copy), v8 (ref), v20 (ref)
            local l_TextLabel_0 = l_Peli_0.TextLabel;
            local v77 = l_Peli_2.Value >= v8.MaxPeli;
            local v78 = ": " .. v20(l_Peli_2.Value);
            if v77 then
                v78 = v78 .. " [MAX]";
            end;
            l_TextLabel_0.Text = v78;
            l_TextLabel_0.shadow.Text = v78;
        end;
        l_Peli_1.MouseButton1Click:Connect(function() --[[ Line: 205 ]]
            -- upvalues: v21 (copy), l_DropAmount_0 (copy)
            v21.UIUtils.ButtonEffect();
            l_DropAmount_0.Visible = not l_DropAmount_0.Visible;
        end);
        l_DropAmount_0.FocusLost:Connect(function(v80, _) --[[ Line: 210 ]]
            -- upvalues: l_DropAmount_0 (copy)
            if v80 then
                local v82 = tonumber(l_DropAmount_0.Text);
                if v82 and v82 > 0 then
                    game.ReplicatedStorage.Events.MoneyDrop:FireServer(l_DropAmount_0.Text);
                end;
                l_DropAmount_0.Visible = false;
            end;
        end);
        local function v86() --[[ Line: 222 ]] --[[ Name: OnEXPChanged ]]
            -- upvalues: l_Experience_0 (copy), v64 (copy), l_EXP_0 (copy), v8 (ref), l_LocalPlayer_0 (ref), l_v21_StatsFolder_0 (copy)
            local l_Detail_0 = l_Experience_0.Detail;
            local l_Level_1 = l_Detail_0.Level;
            local _ = l_Detail_0.Progress.Shadow;
            v64(l_Experience_0, l_EXP_0.Value, v8:maxexp(l_LocalPlayer_0));
            l_Level_1.Text = "Level " .. l_v21_StatsFolder_0.Stats.Level.Value;
            l_Level_1.Shadow.Text = l_Experience_0.Detail.Level.Text;
        end;
        local function v87() --[[ Line: 235 ]] --[[ Name: OnStaminaChanged ]]
            -- upvalues: v64 (copy), l_Stamina_0 (copy), l_Stamina_1 (copy), v75 (copy)
            v64(l_Stamina_0, l_Stamina_1.Value, l_Stamina_1.MaxValue);
            v75(l_Stamina_0, l_Stamina_1.Value, l_Stamina_1.MaxValue);
        end;
        _G.StamRed = function(v88) --[[ Line: 240 ]]
            -- upvalues: l_Stamina_0 (copy), l_v21_StatsFolder_0 (copy)
            local l_l_Stamina_0_0 = l_Stamina_0;
            local v90 = l_l_Stamina_0_0.Base.Bar.Fill:Clone();
            v90.Name = "a";
            v90.ZIndex = 4;
            v90.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
            local v91 = 1 - v88 / l_v21_StatsFolder_0.Stamina.MaxValue;
            v90.Size = UDim2.new(1 - v91, 0, 1, 0);
            v90.Position = UDim2.new(0, 0, 0.5, 0);
            v90:ClearAllChildren();
            v90.Parent = l_l_Stamina_0_0.Base.Bar;
            local v92 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
            local v93 = {
                BackgroundTransparency = 1
            };
            game:GetService("TweenService"):Create(v90, v92, v93):Play();
            script.NoStam:Play();
        end;
        local function v102(v94) --[[ Line: 264 ]] --[[ Name: CharacterAdded ]]
            -- upvalues: l_ShieldFill_0 (copy), v64 (copy), l_Health_0 (copy), v75 (copy)
            print(v94, "added");
            local l_Humanoid_0 = v94:WaitForChild("Humanoid");
            local _ = l_Humanoid_0.MaxHealth;
            local _ = os.clock();
            local l_Shield_0 = v94:WaitForChild("Boosts"):WaitForChild("Shield");
            local function v99() --[[ Line: 274 ]] --[[ Name: OnShieldUpdated ]]
                -- upvalues: l_ShieldFill_0 (ref), l_Shield_0 (copy), l_Humanoid_0 (copy)
                l_ShieldFill_0.Size = UDim2.fromScale(math.min(1, l_Shield_0.Value / l_Humanoid_0.MaxHealth), 1);
                l_ShieldFill_0.Visible = l_Shield_0.Value ~= 0;
            end;
            local function v100() --[[ Line: 279 ]] --[[ Name: OnColorChanged ]]
                -- upvalues: l_Shield_0 (copy), l_ShieldFill_0 (ref)
                if l_Shield_0:GetAttribute("ShieldColor") then
                    l_ShieldFill_0.BackgroundColor3 = l_Shield_0:GetAttribute("ShieldColor");
                end;
            end;
            local function v101() --[[ Line: 285 ]] --[[ Name: OnHealthChanged ]]
                -- upvalues: v64 (ref), l_Health_0 (ref), l_Humanoid_0 (copy), v75 (ref), l_ShieldFill_0 (ref), l_Shield_0 (copy)
                v64(l_Health_0, l_Humanoid_0.Health, l_Humanoid_0.MaxHealth);
                v75(l_Health_0, l_Humanoid_0.Health, l_Humanoid_0.MaxHealth);
                l_ShieldFill_0.Size = UDim2.fromScale(math.min(1, l_Shield_0.Value / l_Humanoid_0.MaxHealth), 1);
                l_ShieldFill_0.Visible = l_Shield_0.Value ~= 0;
            end;
            l_Humanoid_0.HealthChanged:Connect(v101);
            l_Humanoid_0:GetPropertyChangedSignal("MaxHealth"):Connect(v101);
            v64(l_Health_0, l_Humanoid_0.Health, l_Humanoid_0.MaxHealth);
            v75(l_Health_0, l_Humanoid_0.Health, l_Humanoid_0.MaxHealth);
            l_ShieldFill_0.Size = UDim2.fromScale(math.min(1, l_Shield_0.Value / l_Humanoid_0.MaxHealth), 1);
            l_ShieldFill_0.Visible = l_Shield_0.Value ~= 0;
            l_Shield_0:GetAttributeChangedSignal("ShieldColor"):Connect(v100);
            l_Shield_0.Changed:Connect(v99);
            l_ShieldFill_0.Size = UDim2.fromScale(math.min(1, l_Shield_0.Value / l_Humanoid_0.MaxHealth), 1);
            l_ShieldFill_0.Visible = l_Shield_0.Value ~= 0;
            if l_Shield_0:GetAttribute("ShieldColor") then
                l_ShieldFill_0.BackgroundColor3 = l_Shield_0:GetAttribute("ShieldColor");
            end;
            _G.hideUI(false);
        end;
        local v103 = _G.HasBaseItem(l_LocalPlayer_0, "All Seeing Eye");
        local function v106() --[[ Line: 306 ]] --[[ Name: DFTimerUpdated ]]
            -- upvalues: l_DFTimer_0 (copy), v103 (ref), l_DevilFruit_0 (copy)
            local v104 = math.ceil(l_DFTimer_0.Value / 60);
            local v105 = v103 and "<b>*[2X RATES]</b> DF Notifier: INF" or ("DF Notifier: %* mins"):format(v104);
            if v104 > 0 or v103 then
                l_DevilFruit_0.Text = string.upper(v105);
                l_DevilFruit_0.Visible = true;
                return;
            else
                l_DevilFruit_0.Visible = false;
                return;
            end;
        end;
        local v107 = math.ceil(l_DFTimer_0.Value / 60);
        local v108 = v103 and "<b>*[2X RATES]</b> DF Notifier: INF" or ("DF Notifier: %* mins"):format(v107);
        if v107 > 0 or v103 then
            l_DevilFruit_0.Text = string.upper(v108);
            l_DevilFruit_0.Visible = true;
        else
            l_DevilFruit_0.Visible = false;
        end;
        l_DFTimer_0:GetPropertyChangedSignal("Value"):Connect(v106);
        v107 = function() --[[ Line: 322 ]] --[[ Name: DoubleDropUpdated ]]
            -- upvalues: l_2XDROP_0 (copy), l_Drop_0 (copy)
            local v109 = math.ceil(l_2XDROP_0.Value / 60);
            if v109 > 0 then
                l_Drop_0.Text = string.upper((("2x Drop rate: %* mins"):format(v109)));
                l_Drop_0.Visible = true;
                return;
            else
                l_Drop_0.Visible = false;
                return;
            end;
        end;
        v108 = math.ceil(l_2XDROP_0.Value / 60);
        if v108 > 0 then
            l_Drop_0.Text = string.upper((("2x Drop rate: %* mins"):format(v108)));
            l_Drop_0.Visible = true;
        else
            l_Drop_0.Visible = false;
        end;
        l_2XDROP_0:GetPropertyChangedSignal("Value"):Connect(v107);
        v108 = function() --[[ Line: 337 ]] --[[ Name: DoubleExpUpdated ]]
            -- upvalues: l_2XEXP_0 (copy), l_Exp_0 (copy)
            local v110 = math.ceil(l_2XEXP_0.Value / 60);
            if v110 > 0 then
                l_Exp_0.Text = string.upper((("2x EXP: %* mins"):format(v110)));
                l_Exp_0.Visible = true;
                return;
            else
                l_Exp_0.Visible = false;
                return;
            end;
        end;
        local v111 = math.ceil(l_2XEXP_0.Value / 60);
        if v111 > 0 then
            l_Exp_0.Text = string.upper((("2x EXP: %* mins"):format(v111)));
            l_Exp_0.Visible = true;
        else
            l_Exp_0.Visible = false;
        end;
        l_2XEXP_0:GetPropertyChangedSignal("Value"):Connect(v108);
        l_Inventory_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 353 ]]
            -- upvalues: v103 (ref), l_LocalPlayer_0 (ref), l_DFTimer_0 (copy), l_DevilFruit_0 (copy)
            if v103 == false then
                v103 = _G.HasBaseItem(l_LocalPlayer_0, "All Seeing Eye");
                local v112 = math.ceil(l_DFTimer_0.Value / 60);
                local v113 = v103 and "<b>*[2X RATES]</b> DF Notifier: INF" or ("DF Notifier: %* mins"):format(v112);
                if v112 > 0 or v103 then
                    l_DevilFruit_0.Text = string.upper(v113);
                    l_DevilFruit_0.Visible = true;
                    return;
                else
                    l_DevilFruit_0.Visible = false;
                end;
            end;
        end);
        l_Peli_2:GetPropertyChangedSignal("Value"):Connect(v79);
        v111 = l_Peli_0.TextLabel;
        local v114 = l_Peli_2.Value >= v8.MaxPeli;
        local v115 = ": " .. v20(l_Peli_2.Value);
        if v114 then
            v115 = v115 .. " [MAX]";
        end;
        v111.Text = v115;
        v111.shadow.Text = v115;
        l_EXP_0:GetPropertyChangedSignal("Value"):Connect(v86);
        l_Level_0:GetPropertyChangedSignal("Value"):Connect(v86);
        v111 = l_Experience_0.Detail;
        v114 = v111.Level;
        local l_Shadow_2 = v111.Progress.Shadow;
        v64(l_Experience_0, l_EXP_0.Value, v8:maxexp(l_LocalPlayer_0));
        v114.Text = "Level " .. l_v21_StatsFolder_0.Stats.Level.Value;
        v114.Shadow.Text = l_Experience_0.Detail.Level.Text;
        l_Stamina_1:GetPropertyChangedSignal("Value"):Connect(v87);
        l_Stamina_1:GetPropertyChangedSignal("MaxValue"):Connect(v87);
        v64(l_Stamina_0, l_Stamina_1.Value, l_Stamina_1.MaxValue);
        v75(l_Stamina_0, l_Stamina_1.Value, l_Stamina_1.MaxValue);
        v102(l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait());
        l_LocalPlayer_0.CharacterAdded:Connect(v102);
        v111 = {
            Menu = function() --[[ Line: 378 ]]
                -- upvalues: v21 (copy)
                local l_MenuWheel_0 = v21.GuiModules.MenuWheel;
                if l_MenuWheel_0 and l_MenuWheel_0.Initialized == true then
                    l_MenuWheel_0.SetMenuState();
                end;
            end, 
            Party = function() --[[ Line: 384 ]]
                -- upvalues: v21 (copy)
                local l_Party_0 = v21.GuiModules.Party;
                if l_Party_0 and l_Party_0.Initialized == true then
                    l_Party_0.SetFrameState();
                end;
            end, 
            Trade = function() --[[ Line: 390 ]]
                -- upvalues: v21 (copy)
                local l_TradeMenu_0 = v21.GuiModules.TradeMenu;
                if l_TradeMenu_0 and l_TradeMenu_0.Initialized == true then
                    l_TradeMenu_0.SetFrameState();
                end;
            end, 
            DailyRewards = function() --[[ Line: 396 ]]
                -- upvalues: l_PlayerGui_0 (ref)
                local l_DailyRewards_0 = l_PlayerGui_0:FindFirstChild("DailyRewards");
                if l_DailyRewards_0 then
                    l_DailyRewards_0.Enabled = not l_DailyRewards_0.Enabled;
                end;
            end, 
            Backpack = function() --[[ Line: 402 ]]
                -- upvalues: v21 (copy)
                local l_BackpackService_0 = v21.GuiModules.BackpackService;
                if l_BackpackService_0 and l_BackpackService_0.Initialized == true then
                    l_BackpackService_0:SetBackpackVisible();
                end;
            end
        };
        v115 = v11:GetPlaceIds()[game.PlaceId];
        l_Buttons_0.Trade.Visible = false;
        if v115 ~= nil and (v115 == "Trade Hub" or v115 == "VC Trade Hub") then
            l_Buttons_0.Trade.Visible = true;
            l_Buttons_0.UGCShop.Visible = true;
            l_Buttons_0.Party.Visible = false;
            l_Shadow_2 = l_PlayerGui_0:FindFirstChild("UGCShop");
            l_Shadow_2.shop.Enabled = true;
            local l_l_Shadow_2_0 = l_Shadow_2 --[[ copy: 47 -> 53 ]];
            l_Buttons_0.UGCShop.MouseButton1Click:Connect(function() --[[ Line: 424 ]]
                -- upvalues: l_l_Shadow_2_0 (copy)
                l_l_Shadow_2_0.Enabled = not l_l_Shadow_2_0.Enabled;
            end);
        else
            l_Buttons_0.Trade.Visible = false;
        end;
        l_Shadow_2 = function() --[[ Line: 431 ]] --[[ Name: ReservedCodeUpdated ]]
            -- upvalues: l_reservedCode_0 (copy), l_Buttons_0 (copy)
            if l_reservedCode_0.Value == "arena" then
                l_Buttons_0.Party.Visible = false;
            end;
        end;
        if l_reservedCode_0.Value == "arena" then
            l_Buttons_0.Party.Visible = false;
        end;
        l_reservedCode_0:GetPropertyChangedSignal("Value"):Connect(l_Shadow_2);
        task.spawn(function() --[[ Line: 443 ]]
            -- upvalues: l_Buttons_0 (copy)
            if _G.unclaimedDailyRewards == nil then
                while true do
                    task.wait();
                    if _G.unclaimedDailyRewards ~= nil then
                        local l_AlertNum_0 = l_Buttons_0.DailyRewards.AlertNum;
                        while true do
                            if _G.unclaimedDailyRewards > 0 then
                                l_AlertNum_0.Visible = true;
                                l_AlertNum_0.Text = tostring(_G.unclaimedDailyRewards);
                            else
                                l_AlertNum_0.Visible = false;
                            end;
                            task.wait(0.5);
                        end;
                    end;
                end;
            end;
        end);
        for _, v125 in ipairs(l_Buttons_0:GetChildren()) do
            if v125:IsA("ImageButton") then
                v125.MouseButton1Click:Connect(function() --[[ Line: 464 ]]
                    -- upvalues: v21 (copy), v111 (copy), v125 (copy)
                    v21.UIUtils.ButtonEffect();
                    local v126 = v111[v125.Name];
                    if v126 then
                        v126();
                    end;
                end);
            end;
        end;
        local l_AbsoluteSize_0 = v23.AbsoluteSize;
        local v128 = math.min(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y) <= 500;
        local l_UIAspectRatioConstraint_0 = l_Main_0:WaitForChild("UIAspectRatioConstraint");
        if v128 then
            l_UIAspectRatioConstraint_0.AspectRatio = 0.5;
        end;
        task.spawn(function() --[[ Line: 485 ]]
            -- upvalues: l_PlayerGui_0 (ref), l_UIAspectRatioConstraint_0 (copy)
            if l_PlayerGui_0:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton").Size == UDim2.new(0, 120, 0, 120) then
                l_UIAspectRatioConstraint_0.AspectRatio = 0.4;
            end;
        end);
        v12.Initialized = true;
        return;
    end;
end;
return v12;