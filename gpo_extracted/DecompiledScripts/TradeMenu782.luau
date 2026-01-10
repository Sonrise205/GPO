local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_PolicyService_0 = game:GetService("PolicyService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0.Trove);
local v9 = require(l_Modules_0.NameFormID);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local v12 = require(l_Shared_0.Queues.QueueTask);
local v13 = require(l_Shared_0.SoundUtils);
local l_Client_0 = l_Modules_0.Client;
local v15 = require(l_Client_0.Notification);
local v16 = require(l_Client_0.ItemDisplay);
local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
local v18 = {
    Initialized = false
};
v18.Initialize = function(v19) --[[ Line: 28 ]] --[[ Name: Initialize ]]
    -- upvalues: v18 (copy), l_Events_0 (copy), l_PlayerGui_0 (copy), l_Players_0 (copy), v13 (copy), v15 (copy), v12 (copy), v16 (copy), v9 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy), l_PolicyService_0 (copy), l_UserInputService_0 (copy), l_ReplicatedStorage_0 (copy)
    if v18.Initialized then
        return;
    else
        local l_Settings_0 = l_Events_0:WaitForChild("Settings");
        local l_trade_0 = l_Events_0:WaitForChild("trade");
        local l_v19_StatsFolder_0 = v19:GetStatsFolder();
        local _ = l_v19_StatsFolder_0:WaitForChild("Gamepasses"):WaitForChild("FruitBag");
        local l_TradeMenu_0 = l_PlayerGui_0:WaitForChild("TradeMenu");
        local l_Main_0 = l_TradeMenu_0:WaitForChild("Main");
        local l_Menu_0 = l_Main_0:WaitForChild("Menu");
        local l_PastTrades_0 = l_Menu_0:WaitForChild("PastTrades");
        local l_List_0 = l_PastTrades_0:WaitForChild("List");
        local l_Page_0 = l_PastTrades_0:WaitForChild("Page");
        local l_Next_0 = l_Page_0:WaitForChild("Next");
        local l_Back_0 = l_Page_0:WaitForChild("Back");
        local l_Refresh_0 = l_Page_0:WaitForChild("Refresh");
        local l_List_1 = l_Menu_0:WaitForChild("PendingTrades"):WaitForChild("List");
        local l_SendTrades_0 = l_Menu_0:WaitForChild("SendTrades");
        local l_Input_0 = l_SendTrades_0:WaitForChild("User"):WaitForChild("Input");
        local l_Find_0 = l_Input_0:WaitForChild("Find");
        local l_Trade_0 = l_SendTrades_0:WaitForChild("Trade");
        local l_ShoutFrame_0 = l_Main_0:WaitForChild("ShoutFrame");
        local l_Shout_0 = l_ShoutFrame_0:WaitForChild("Shout");
        local l_ShowShout_0 = l_Menu_0:WaitForChild("ShowShout");
        local l_Input_1 = l_ShoutFrame_0:WaitForChild("InputFrame"):WaitForChild("Input");
        local l_ShowShouts_0 = l_Menu_0:WaitForChild("ShowShouts");
        local l_AcceptTrades_0 = l_Menu_0:WaitForChild("AcceptTrades");
        local l_Alert_0 = l_PlayerGui_0:WaitForChild("HUD"):WaitForChild("Main"):WaitForChild("Buttons"):WaitForChild("Trade"):WaitForChild("Alert");
        l_Main_0.Visible = false;
        local v45 = {};
        l_Players_0.PlayerRemoving:Connect(function(v46) --[[ Line: 79 ]]
            -- upvalues: v45 (copy)
            if v45[v46] ~= nil then
                v45[v46]:Destroy();
                v45[v46] = nil;
            end;
        end);
        local v47 = {};
        l_trade_0.OnClientInvoke = function(v48) --[[ Line: 87 ]]
            -- upvalues: v47 (copy), v13 (ref), v45 (copy), l_List_1 (copy), l_trade_0 (copy), v15 (ref)
            if v48 and typeof(v48) == "string" then
                if v47[v48] == nil then
                    local l_FirstChild_0 = v13:GetSoundCategory("Trade"):FindFirstChild(v48);
                    local v50 = l_FirstChild_0:GetChildren()[math.random(#l_FirstChild_0:GetChildren())];
                    v50:Play();
                    v50.Volume = 1.5;
                    v47[v48] = true;
                    task.wait(v50.TimeLength);
                    v47[v48] = nil;
                end;
                return;
            elseif v45[v48] ~= nil then
                return;
            else
                local v51 = script.PlayerTemplate:Clone();
                v51.Name = v48.Name;
                v51.Parent = l_List_1;
                v45[v48] = v51;
                v51.Username.Text = v48.Name;
                local l_currentAlerts_0 = script.currentAlerts;
                l_currentAlerts_0.Value = l_currentAlerts_0.Value + 1;
                l_currentAlerts_0 = function() --[[ Line: 119 ]] --[[ Name: click ]]
                    -- upvalues: v51 (copy), v45 (ref), v48 (copy)
                    local l_currentAlerts_1 = script.currentAlerts;
                    l_currentAlerts_1.Value = l_currentAlerts_1.Value - 1;
                    v51:Destroy();
                    if v45[v48] then
                        v45[v48] = nil;
                    end;
                end;
                v51.Accept.MouseButton1Click:Connect(function() --[[ Line: 127 ]]
                    -- upvalues: v51 (copy), v45 (ref), v48 (copy), l_trade_0 (ref)
                    local l_currentAlerts_2 = script.currentAlerts;
                    l_currentAlerts_2.Value = l_currentAlerts_2.Value - 1;
                    v51:Destroy();
                    if v45[v48] then
                        v45[v48] = nil;
                    end;
                    l_trade_0:InvokeServer({
                        tradeFeedback = true, 
                        accept = true, 
                        tradePlayer = v48
                    });
                end);
                v51.Decline.MouseButton1Click:Connect(function() --[[ Line: 134 ]]
                    -- upvalues: v51 (copy), v45 (ref), v48 (copy), l_trade_0 (ref)
                    local l_currentAlerts_3 = script.currentAlerts;
                    l_currentAlerts_3.Value = l_currentAlerts_3.Value - 1;
                    v51:Destroy();
                    if v45[v48] then
                        v45[v48] = nil;
                    end;
                    l_trade_0:InvokeServer({
                        tradeFeedback = true, 
                        tradePlayer = v48
                    });
                end);
                v13.PlaySound(("t%*"):format((math.random(4))), {
                    SoundCategory = "Trade", 
                    SubCategory = "request"
                });
                v15.DisplayMessage("<Color=Green>" .. v48.Name .. "<Color=/> has sent you a trade request!");
                return;
            end;
        end;
        script.currentAlerts.Changed:Connect(function() --[[ Line: 144 ]]
            -- upvalues: l_Alert_0 (copy)
            if script.currentAlerts.Value > 0 then
                l_Alert_0.Text = script.currentAlerts.Value;
                l_Alert_0.Visible = true;
                return;
            else
                l_Alert_0.Visible = false;
                return;
            end;
        end);
        l_Shout_0.MouseButton1Click:Connect(function() --[[ Line: 154 ]]
            -- upvalues: v19 (copy), l_trade_0 (copy), l_Input_1 (copy)
            v19.UIUtils.ButtonEffect();
            local v56 = l_trade_0:InvokeServer({
                filterText = true, 
                text = l_Input_1.Text
            });
            if v56 ~= nil and v56 ~= l_Input_1.Text then
                l_Input_1.Text = v56;
            end;
        end);
        l_ShowShout_0.MouseButton1Click:Connect(function() --[[ Line: 162 ]]
            -- upvalues: v19 (copy), l_ShoutFrame_0 (copy)
            v19.UIUtils.ButtonEffect();
            l_ShoutFrame_0.Visible = not l_ShoutFrame_0.Visible;
        end);
        local v57 = v12.new();
        local v58 = nil;
        local v59 = {};
        local v60 = nil;
        local v61 = 1;
        local v62 = false;
        local v63 = false;
        local function v71(v64) --[[ Line: 188 ]] --[[ Name: getTime ]]
            local v65 = os.time() - v64;
            local v66 = v65 % 60;
            local v67 = math.floor(v65 / 60) % 60;
            local v68 = math.floor(v65 / 3600) % 24;
            local v69 = math.floor(v65 / 86400);
            local v70 = "Days";
            if v69 < 1 then
                if v68 > 0 then
                    return v68, "Hours", v65;
                elseif v67 > 0 then
                    return v67, "Mins", v65;
                else
                    return v66, "Seconds", v65;
                end;
            else
                return v69, v70, v65;
            end;
        end;
        local function v77(v72) --[[ Line: 212 ]] --[[ Name: Paginate ]]
            -- upvalues: v58 (ref)
            if v58 == nil then
                warn("Missing Trade Data, how?");
                return;
            else
                local v73 = (v72 - 1) * 10 + 1;
                local v74 = math.min(v72 * 10, #v58);
                local v75 = {};
                for v76 = v73, v74 do
                    table.insert(v75, v58[v76]);
                end;
                return v75;
            end;
        end;
        local function _(v78) --[[ Line: 231 ]] --[[ Name: EnableCurrentPageRotation ]]
            -- upvalues: v59 (copy), v60 (ref)
            local v79 = v59[v60];
            if v79 == nil then
                return;
            elseif v78 == true then
                v79.ItemDisplay:StartRotation();
                return;
            else
                v79.ItemDisplay:StopRotation();
                return;
            end;
        end;
        local function v84() --[[ Line: 243 ]] --[[ Name: ClearOldPage ]]
            -- upvalues: v59 (copy), v60 (ref)
            local v81 = v59[v60];
            if v81 ~= nil then
                v81.ItemDisplay:Destroy();
                v81.ItemDisplay = nil;
                for v82, v83 in pairs(v81.Items) do
                    v83:Destroy();
                    v81.Items[v82] = nil;
                end;
                v59[v60] = nil;
                task.wait();
            end;
        end;
        local function v100(v85) --[[ Line: 259 ]] --[[ Name: LoadPage ]]
            -- upvalues: v60 (ref), v84 (copy), v59 (copy), v16 (ref), v18 (ref), l_Page_0 (copy), l_List_0 (copy), v77 (copy), v71 (copy), v9 (ref), l_Back_0 (copy), l_Next_0 (copy), v61 (ref)
            if v60 ~= v85 then
                v84();
                v60 = v85;
                local v86 = v59[v85] or {
                    Items = {}
                };
                if v59[v85] == nil then
                    v59[v85] = v86;
                    v86.ItemDisplay = v16.new({
                        Gui = v18, 
                        Trade = false
                    });
                    local v87 = v59[v60];
                    if v87 ~= nil then
                        v87.ItemDisplay:StartRotation();
                    end;
                end;
                l_Page_0.Text = ("Past Trades: Page %*"):format(v85);
                l_List_0.CanvasPosition = Vector2.new(0, 0);
                local v88 = 0;
                for v89, v90 in pairs(v77(v85)) do
                    if v88 == 2 then
                        task.wait();
                        v88 = 0;
                    end;
                    v88 = v88 + 1;
                    local v91, v92, v93 = v71(v90.timeStamp);
                    local _ = v90.tradeNumber;
                    local _ = v90.tradeID;
                    local l_traderID_0 = v90.traderID;
                    local l_itemsGiven_0 = v90.itemsGiven;
                    local l_itemsGot_0 = v90.itemsGot;
                    local v99 = script.PastTradeTemplate:Clone();
                    v99.Name = v89;
                    v99.LayoutOrder = v89;
                    v99.Parent = l_List_0;
                    v99.Received.Username.Text = ("<font color=\"rgb(255,165,0)\">[%*]</font> %*"):format(v89, (v9(l_traderID_0)));
                    v99.Given.Days.Text = ("%* %* ago"):format(tostring(v91), v92);
                    v99.Given.Days.TextColor3 = Color3.fromRGB(170, 255, 127):Lerp(Color3.fromRGB(255, 0, 0), (math.clamp(v93 / 2592000, 0, 1)));
                    v86.ItemDisplay:AddItemsWithDictionary(v99.Given.Items, l_itemsGiven_0);
                    v86.ItemDisplay:AddItemsWithDictionary(v99.Received.Items, l_itemsGot_0);
                    table.insert(v86.Items, v99);
                end;
                l_Back_0.Visible = v60 ~= 1;
                l_Next_0.Visible = v60 ~= v61;
            end;
        end;
        local function v105() --[[ Line: 320 ]] --[[ Name: RefreshPastTrades ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_trade_0 (copy), v58 (ref), v63 (ref), v84 (copy), v61 (ref), v60 (ref), v100 (copy)
            local l_UserId_0 = l_LocalPlayer_0.UserId;
            if _G.customTradeCheckID then
                l_UserId_0 = _G.customTradeCheckID;
            end;
            local v102 = l_trade_0:InvokeServer("getTrades", l_UserId_0);
            if v102 == nil then
                return;
            else
                if v58 ~= nil then
                    if #v58 == #v102 then
                        return;
                    else
                        v58 = nil;
                    end;
                end;
                v63 = true;
                v84();
                table.sort(v102, function(v103, v104) --[[ Line: 341 ]]
                    return v103.timeStamp > v104.timeStamp;
                end);
                v61 = math.ceil(#v102 / 10);
                if v58 == nil then
                    v60 = nil;
                    v58 = v102;
                    v100(1);
                end;
                v58 = v102;
                v63 = false;
                return;
            end;
        end;
        task.spawn(function() --[[ Line: 357 ]]
            -- upvalues: v105 (copy)
            while task.wait(2) do
                v105();
            end;
        end);
        local function v107() --[[ Line: 363 ]] --[[ Name: QueueNextPage ]]
            -- upvalues: v61 (ref), v60 (ref), v100 (copy)
            if v61 == nil then
                return;
            elseif v61 < v60 + 1 then
                warn("Compare pages", v60 + 1, v61);
                return;
            else
                local v106 = math.clamp(v60 + 1, 1, v61);
                if v60 == v106 then
                    return;
                else
                    v100(v106);
                    return;
                end;
            end;
        end;
        local function v109() --[[ Line: 382 ]] --[[ Name: QueuePreviousPage ]]
            -- upvalues: v60 (ref), v61 (ref), v100 (copy)
            local v108 = math.clamp(v60 - 1, 1, v61);
            if v60 == v108 then
                return;
            else
                v100(v108);
                return;
            end;
        end;
        l_Refresh_0.MouseButton1Click:Connect(function() --[[ Line: 392 ]]
            -- upvalues: v19 (copy), v63 (ref), v105 (copy)
            v19.UIUtils.ButtonEffect();
            if v63 == true then
                return;
            else
                v105();
                return;
            end;
        end);
        l_Next_0.MouseButton1Click:Connect(function() --[[ Line: 398 ]]
            -- upvalues: v19 (copy), v63 (ref), v57 (copy), v107 (copy)
            v19.UIUtils.ButtonEffect();
            if v63 == true then
                return;
            else
                v57:QueueTask(v107);
                return;
            end;
        end);
        l_Back_0.MouseButton1Click:Connect(function() --[[ Line: 404 ]]
            -- upvalues: v19 (copy), v63 (ref), v57 (copy), v109 (copy)
            v19.UIUtils.ButtonEffect();
            if v63 == true then
                return;
            else
                v57:QueueTask(v109);
                return;
            end;
        end);
        local function v114(v110) --[[ Line: 411 ]] --[[ Name: GetPlayerNameFromText ]]
            -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref)
            local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v110);
            if l_l_Players_0_FirstChild_0 and l_l_Players_0_FirstChild_0 ~= l_LocalPlayer_0 then
                return l_l_Players_0_FirstChild_0.Name;
            else
                for _, v113 in ipairs(l_Players_0:GetPlayers()) do
                    if v113 ~= l_LocalPlayer_0 and v113.Name:lower():sub(1, v110:len()) == v110:lower() then
                        return v113.Name;
                    end;
                end;
                return nil;
            end;
        end;
        local v115 = "";
        local v116 = nil;
        l_Input_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 431 ]]
            -- upvalues: l_Input_0 (copy), v115 (ref), l_Find_0 (copy), v116 (ref), v114 (copy)
            local l_Text_0 = l_Input_0.Text;
            if l_Text_0 == "" or l_Text_0 == v115 then
                l_Find_0.Text = "";
                return;
            else
                v116 = nil;
                local v118 = v114(l_Text_0);
                if v118 == nil then
                    l_Find_0.Text = "";
                    return;
                else
                    v116 = v118;
                    l_Find_0.Text = v118;
                    l_Input_0.Text = v118:sub(1, l_Text_0:len());
                    v115 = v118;
                    return;
                end;
            end;
        end);
        l_Input_0.FocusLost:Connect(function(_) --[[ Line: 453 ]]
            -- upvalues: v116 (ref), l_Input_0 (copy)
            if v116 then
                l_Input_0.Text = v116;
            end;
        end);
        l_Players_0.PlayerRemoving:Connect(function(v120) --[[ Line: 459 ]]
            -- upvalues: v116 (ref), l_Input_0 (copy)
            if v120.Name == v116 then
                l_Input_0.Text = "";
                v116 = nil;
            end;
        end);
        l_Trade_0.MouseButton1Click:Connect(function() --[[ Line: 466 ]]
            -- upvalues: v19 (copy), l_Players_0 (ref), v115 (ref), l_trade_0 (copy)
            v19.UIUtils.ButtonEffect();
            local l_l_Players_0_FirstChild_1 = l_Players_0:FindFirstChild(v115);
            if l_l_Players_0_FirstChild_1 then
                l_trade_0:InvokeServer({
                    invite = true, 
                    invitedPlayer = l_l_Players_0_FirstChild_1.Name
                });
            end;
        end);
        local v122 = {
            On = true, 
            Off = false, 
            [true] = "On", 
            [false] = "Off"
        };
        local v123 = Color3.fromRGB(170, 12, 1);
        local v124 = Color3.fromRGB(85, 170, 0);
        local function _(v125, v126) --[[ Line: 485 ]] --[[ Name: FastSwitch ]]
            -- upvalues: v122 (copy), v124 (copy), v123 (copy)
            local l_Select_0 = v125.Options.Select;
            l_Select_0.Position = UDim2.new(v122[v126] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_0.ImageColor3 = v122[v126] == "On" and v124 or v123;
        end;
        local v139 = {
            AcceptTradesInit = function(v129) --[[ Line: 496 ]] --[[ Name: AcceptTradesInit ]]
                -- upvalues: l_v19_StatsFolder_0 (copy), v122 (copy), v124 (copy), v123 (copy)
                local l_Value_0 = l_v19_StatsFolder_0.Settings.AcceptTrade.Value;
                local l_Select_1 = v129.Options.Select;
                l_Select_1.Position = UDim2.new(v122[l_Value_0] == "On" and 0.5 or 0, 0, 0.5, 0);
                l_Select_1.ImageColor3 = v122[l_Value_0] == "On" and v124 or v123;
                return v122[l_v19_StatsFolder_0.Settings.AcceptTrade.Value];
            end, 
            AcceptTradesOn = function(_) --[[ Line: 501 ]] --[[ Name: AcceptTradesOn ]]
                -- upvalues: l_Settings_0 (copy)
                l_Settings_0:InvokeServer("AcceptTrade", true);
            end, 
            AcceptTradesOff = function(_) --[[ Line: 505 ]] --[[ Name: AcceptTradesOff ]]
                -- upvalues: l_Settings_0 (copy)
                l_Settings_0:InvokeServer("AcceptTrade", false);
            end, 
            ShowShoutsInit = function(v134) --[[ Line: 509 ]] --[[ Name: ShowShoutsInit ]]
                -- upvalues: l_v19_StatsFolder_0 (copy), v122 (copy), v124 (copy), v123 (copy)
                local l_Value_1 = l_v19_StatsFolder_0.Settings.ShowShouts.Value;
                local l_Select_2 = v134.Options.Select;
                l_Select_2.Position = UDim2.new(v122[l_Value_1] == "On" and 0.5 or 0, 0, 0.5, 0);
                l_Select_2.ImageColor3 = v122[l_Value_1] == "On" and v124 or v123;
                return v122[l_v19_StatsFolder_0.Settings.ShowShouts.Value];
            end, 
            ShowShoutsOn = function(_) --[[ Line: 514 ]] --[[ Name: ShowShoutsOn ]]
                -- upvalues: l_Settings_0 (copy)
                l_Settings_0:InvokeServer("ShowShouts", true);
            end, 
            ShowShoutsOff = function(_) --[[ Line: 518 ]] --[[ Name: ShowShoutsOff ]]
                -- upvalues: l_Settings_0 (copy)
                l_Settings_0:InvokeServer("ShowShouts", false);
            end
        };
        local function v145(v140) --[[ Line: 522 ]] --[[ Name: SetupSettingFrame ]]
            -- upvalues: v19 (copy), v139 (copy), l_TweenService_0 (ref), v124 (copy), v123 (copy)
            local l_Options_0 = v140.Options;
            local l_Select_3 = l_Options_0.Select;
            local v143 = "On";
            local v144 = false;
            l_Options_0.Button.MouseButton1Click:Connect(function() --[[ Line: 530 ]]
                -- upvalues: v19 (ref), v144 (ref), v143 (ref), v139 (ref), v140 (copy), l_TweenService_0 (ref), l_Select_3 (copy), v124 (ref), v123 (ref)
                v19.UIUtils.ButtonEffect();
                if v144 == true then
                    return;
                else
                    v144 = true;
                    v143 = v143 == "On" and "Off" or "On";
                    if v139[v140.Name .. v143] then
                        v139[v140.Name .. v143](v140);
                    else
                        warn("Missing Functions for", v140, v143);
                    end;
                    l_TweenService_0:Create(l_Select_3, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Position = UDim2.new(v143 == "On" and 0.5 or 0, 0, 0.5, 0), 
                        ImageColor3 = v143 == "On" and v124 or v123
                    }):Play();
                    task.wait(0.25);
                    v144 = false;
                    return;
                end;
            end);
            if v139[v140.Name .. "Init"] then
                v143 = v139[v140.Name .. "Init"](v140, v143) or "On";
            end;
        end;
        v145(l_ShowShouts_0);
        v145(l_AcceptTrades_0);
        local v146 = false;
        local v147 = "Close";
        local l_Size_0 = l_Main_0.Size;
        l_Main_0.Size = UDim2.new(0, 0, 0, 0);
        l_Main_0.Visible = false;
        local v149 = {
            Open = function() --[[ Line: 576 ]] --[[ Name: Open ]]
                -- upvalues: l_Main_0 (copy), l_Size_0 (copy), v62 (ref), v105 (copy)
                l_Main_0.Visible = true;
                l_Main_0.Size = UDim2.new(l_Size_0.X.Scale / 2, 0, l_Size_0.Y.Scale / 2, 0);
                l_Main_0:TweenSize(l_Size_0, "Out", "Quad", 0.25, true);
                if v62 == false then
                    v62 = true;
                    v105();
                end;
            end, 
            Close = function() --[[ Line: 586 ]] --[[ Name: Close ]]
                -- upvalues: l_Main_0 (copy)
                l_Main_0:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true);
                task.wait(0.25);
                l_Main_0.Visible = false;
            end
        };
        local v150 = nil;
        local v151 = nil;
        local function _() --[[ Line: 595 ]] --[[ Name: GetPolicyInfo ]]
            -- upvalues: v150 (ref), v151 (ref), l_PolicyService_0 (ref), l_LocalPlayer_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 596 ]]
                -- upvalues: l_PolicyService_0 (ref), l_LocalPlayer_0 (ref)
                return l_PolicyService_0:GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
            end);
            v150 = l_status_0;
            v151 = l_result_0;
        end;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 596 ]]
            -- upvalues: l_PolicyService_0 (ref), l_LocalPlayer_0 (ref)
            return l_PolicyService_0:GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
        end);
        v150 = l_status_1;
        v151 = l_result_1;
        l_status_1 = function() --[[ Line: 603 ]] --[[ Name: SetFrameState ]]
            -- upvalues: v150 (ref), v151 (ref), v15 (ref), l_PolicyService_0 (ref), l_LocalPlayer_0 (ref), v146 (ref), v147 (ref), l_TradeMenu_0 (copy), v149 (copy)
            if v150 and v151 then
                if v151.IsPaidItemTradingAllowed == false then
                    v15.DisplayMessage("<Color=Red>You cannot access the trading system because of your country's policys");
                    return;
                elseif v146 == true then
                    return;
                else
                    v146 = true;
                    v147 = v147 == "Close" and "Open" or "Close";
                    if l_TradeMenu_0.Main.Size == UDim2.new(0, 0, 0, 0) and l_TradeMenu_0.Main.Visible == false then
                        v147 = "Open";
                    end;
                    local v157 = v149[v147];
                    if v157 then
                        v157();
                    end;
                    v146 = false;
                    return;
                end;
            else
                v15.DisplayMessage("Failed to get policy info! Please press again to retry");
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 596 ]]
                    -- upvalues: l_PolicyService_0 (ref), l_LocalPlayer_0 (ref)
                    return l_PolicyService_0:GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
                end);
                v150 = l_status_2;
                v151 = l_result_2;
                return;
            end;
        end;
        v18.SetFrameState = l_status_1;
        l_result_1 = function(v160) --[[ Line: 642 ]] --[[ Name: IsClickPositionValid ]]
            -- upvalues: v146 (ref), l_Main_0 (copy), l_status_1 (copy)
            if v146 == false then
                local l_l_Main_0_0 = l_Main_0;
                local l_Position_0 = v160.Position;
                local l_AbsoluteSize_0 = l_l_Main_0_0.AbsoluteSize;
                local l_AbsolutePosition_0 = l_l_Main_0_0.AbsolutePosition;
                if l_Position_0.X > l_AbsolutePosition_0.X and l_Position_0.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X and l_Position_0.Y > l_AbsolutePosition_0.Y and l_Position_0.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                    return;
                else
                    l_status_1();
                end;
            end;
        end;
        local v165 = {
            [Enum.UserInputType.MouseButton1] = l_result_1, 
            [Enum.UserInputType.Touch] = l_result_1
        };
        local v166 = nil;
        l_Main_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 666 ]]
            -- upvalues: v166 (ref), l_Main_0 (copy), l_UserInputService_0 (ref), v165 (copy)
            if v166 then
                v166:Disconnect();
                v166 = nil;
            end;
            if l_Main_0.Visible == true and v166 == nil then
                v166 = l_UserInputService_0.InputBegan:Connect(function(v167, v168) --[[ Line: 674 ]]
                    -- upvalues: v165 (ref)
                    if v168 then
                        return;
                    else
                        local l_UserInputType_0 = v167.UserInputType;
                        if v165[l_UserInputType_0] then
                            v165[l_UserInputType_0](v167);
                        end;
                        return;
                    end;
                end);
            end;
        end);
        l_ReplicatedStorage_0.tradeCheck.OnClientInvoke = function() --[[ Line: 684 ]]
            return true;
        end;
        v18.Initialized = true;
        return;
    end;
end;
return v18;