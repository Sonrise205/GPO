local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0.Leveling);
local l_Shared_0 = l_Modules_0.Shared;
local v9 = require(l_Shared_0.GameUtils);
local v10 = require(l_Shared_0.GamePlaceInfo);
local v11 = {
    Initialized = false
};
local _ = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
local function v17(v13, v14, v15) --[[ Line: 20 ]] --[[ Name: CircularBarChanged ]]
    local v16 = math.clamp(math.clamp(math.max(math.floor(v14), 0) / math.floor(v15), 0, 1) * 360, 0, 360);
    v13.Left.Bar.UIGradient.Rotation = math.clamp(v16, 180, 360);
    v13.Right.Bar.UIGradient.Rotation = math.clamp(v16, 0, 180);
    v13.Right.Bar.UIGradient.Offset = Vector2.new(-0.01, 0);
    v13.Left.Bar.UIGradient.Offset = Vector2.new(0.01, 0);
end;
local function _(v18, v19) --[[ Line: 50 ]] --[[ Name: UpdateCircularBarColor ]]
    v18.Left.Bar.ImageColor3 = v19;
    v18.Right.Bar.ImageColor3 = v19;
end;
local v21 = {
    ["Mera-Mera"] = Color3.fromRGB(255, 78, 19), 
    ["Magu-Magu"] = Color3.fromRGB(255, 12, 12), 
    ["Pika-Pika"] = Color3.fromRGB(255, 207, 33), 
    ["Hie-Hie"] = Color3.fromRGB(170, 255, 255), 
    ["Goro-Goro"] = Color3.fromRGB(190, 255, 255), 
    ["Suna-Suna"] = Color3.fromRGB(255, 213, 160), 
    ["Yami-Yami"] = Color3.fromRGB(85, 0, 255), 
    ["Tori-Tori"] = Color3.fromRGB(0, 255, 255), 
    ["Yuki-Yuki"] = Color3.fromRGB(240, 255, 253), 
    ["PikaV2-PikaV2"] = Color3.fromRGB(255, 207, 33), 
    ["Smoke-Smoke"] = Color3.fromRGB(181, 181, 181)
};
v11.Initialize = function(v22) --[[ Line: 70 ]] --[[ Name: Initialize ]]
    -- upvalues: v11 (copy), l_PlayerScripts_0 (copy), l_Modules_0 (copy), l_PlayerGui_0 (copy), l_ReplicatedStorage_0 (copy), v10 (copy), v21 (copy), l_LocalPlayer_0 (copy), v17 (copy), v9 (copy)
    if v11.Initialized then
        warn("HUD already initialized");
        return;
    else
        local l_InputHandler_0 = require(l_PlayerScripts_0:WaitForChild("InputHandler"));
        local l_GetPreferredInput_0 = require(l_PlayerScripts_0:WaitForChild("InputHandler"):WaitForChild("GetPreferredInput"));
        local v25 = require(l_Modules_0.ContextActionService);
        local l_Modes_0 = l_PlayerGui_0:WaitForChild("Modes");
        local l_Frame_0 = l_Modes_0:WaitForChild("Frame");
        local l_GeneralBars_0 = l_Frame_0:WaitForChild("GeneralBars");
        local v29 = v25:GetButtonParent("Ultimate") or l_GeneralBars_0:WaitForChild("Ultimate", 2);
        local v30 = v25:GetButtonParent("Logia") or l_GeneralBars_0:WaitForChild("Logia", 2);
        local v31 = v25:GetButtonParent("Buso") or l_GeneralBars_0:WaitForChild("Buso", 2);
        local v32 = v25:GetButtonParent("Ken") or l_GeneralBars_0:WaitForChild("Ken", 2);
        local v33 = v25:GetButtonParent("Evasive") or l_GeneralBars_0:FindFirstChild("Evasive", 2);
        local l_PVP_0 = l_Frame_0:WaitForChild("PVP");
        local l_Position_0 = l_Frame_0.Position;
        local l_v22_StatsFolder_0 = v22:GetStatsFolder();
        print("stats", l_v22_StatsFolder_0:GetChildren());
        local l_Stats_0 = l_v22_StatsFolder_0.Stats;
        local l_DF_0 = l_Stats_0.DF;
        local l_LogiaBar_0 = l_v22_StatsFolder_0.LogiaBar;
        local l_LogiaMastery_0 = l_Stats_0.LogiaMastery;
        local l_Background_0 = v30:WaitForChild("Background");
        local l_ActionIcon_0 = l_Background_0:WaitForChild("ActionIcon");
        local l_BusoMastery_0 = l_Stats_0.BusoMastery;
        local l_BusoBar_0 = l_v22_StatsFolder_0.BusoBar;
        local l_KenMastery_0 = l_Stats_0.KenMastery;
        local l_KenBar_0 = l_v22_StatsFolder_0.KenBar;
        local l_reservedCode_0 = l_ReplicatedStorage_0.reservedCode;
        local v48 = v10:GetPlaceIds()[game.PlaceId];
        if v48 ~= nil and v48 == "Trade Hub" then
            l_Modes_0.Enabled = false;
            return;
        else
            local function v54() --[[ Line: 115 ]] --[[ Name: OnLogiaChanged ]]
                -- upvalues: l_DF_0 (copy), v21 (ref), l_LogiaMastery_0 (copy), l_LocalPlayer_0 (ref), v30 (copy), v17 (ref), l_LogiaBar_0 (copy), l_v22_StatsFolder_0 (copy)
                local v49 = v21[l_DF_0.Value];
                if l_LogiaMastery_0.Value > 0 and v49 and _G.playerFruitPassiveEnabled(l_LocalPlayer_0) == true then
                    local _, _, _ = v49:ToHSV();
                    local l_v30_0 = v30;
                    l_v30_0.Left.Bar.ImageColor3 = v49;
                    l_v30_0.Right.Bar.ImageColor3 = v49;
                    v17(v30, l_LogiaBar_0.Value, l_LogiaBar_0.MaxValue);
                    if l_v22_StatsFolder_0.Stats.DF.Value == "Tori-Tori" then
                        v30.Display.Text = "Passive";
                    else
                        v30.Display.Text = "Logia";
                    end;
                    if l_LogiaBar_0.Value >= l_LogiaBar_0.MaxValue then
                        script.LogiaCharge:Play();
                    elseif l_LogiaBar_0.Value <= 0 then
                        script.LogiaRunOut:Play();
                    end;
                    v30.Visible = true;
                    return;
                else
                    v30.Visible = false;
                    return;
                end;
            end;
            l_DF_0:GetPropertyChangedSignal("Value"):Connect(v54);
            l_LogiaBar_0.Changed:Connect(v54);
            v54();
            local function _() --[[ Line: 145 ]] --[[ Name: updateLogiaButton ]]
                -- upvalues: l_v22_StatsFolder_0 (copy), l_ActionIcon_0 (copy)
                if l_v22_StatsFolder_0.Settings.Logia.Value == true then
                    l_ActionIcon_0.ImageColor3 = Color3.fromRGB(255, 255, 255);
                    return;
                else
                    l_ActionIcon_0.ImageColor3 = Color3.fromRGB(255, 0, 0);
                    return;
                end;
            end;
            if l_v22_StatsFolder_0.Settings.Logia.Value == true then
                l_ActionIcon_0.ImageColor3 = Color3.fromRGB(255, 255, 255);
            else
                l_ActionIcon_0.ImageColor3 = Color3.fromRGB(255, 0, 0);
            end;
            l_Background_0.MouseButton1Click:Connect(function() --[[ Line: 155 ]]
                -- upvalues: l_ReplicatedStorage_0 (ref), l_v22_StatsFolder_0 (copy), l_ActionIcon_0 (copy)
                l_ReplicatedStorage_0.Events.Settings:InvokeServer("Logia", not l_v22_StatsFolder_0.Settings.Logia.Value);
                if l_v22_StatsFolder_0.Settings.Logia.Value == true then
                    l_ActionIcon_0.ImageColor3 = Color3.fromRGB(255, 255, 255);
                else
                    l_ActionIcon_0.ImageColor3 = Color3.fromRGB(255, 0, 0);
                end;
                local v56 = "";
                local l_Value_0 = l_v22_StatsFolder_0.Stats.DF.Value;
                if l_v22_StatsFolder_0.Settings.Logia.Value == false then
                    if l_Value_0 == "Hie-Hie" or l_Value_0 == "Magu-Magu" then
                        v56 = "Your ability to walk on water has also been disabled.";
                    end;
                    _G.displayMessage("<Color=Red>Your Logia reflex has been disabled. " .. v56);
                    return;
                else
                    if l_Value_0 == "Hie-Hie" or l_Value_0 == "Magu-Magu" then
                        v56 = "Your ability to walk on water has also been enabled.";
                    end;
                    _G.displayMessage("<Color=Green>Your Logia reflex has been enabled. " .. v56);
                    return;
                end;
            end);
            local function v58() --[[ Line: 175 ]] --[[ Name: OnKenChanged ]]
                -- upvalues: l_KenMastery_0 (copy), v17 (ref), v32 (copy), l_KenBar_0 (copy), l_v22_StatsFolder_0 (copy)
                if l_KenMastery_0.Value > 0 then
                    v17(v32, l_KenBar_0.Value, l_KenBar_0.MaxValue);
                    if l_KenBar_0.Value >= l_KenBar_0.MaxValue then
                        script.KenCharge:Play();
                    elseif l_KenBar_0.Value <= 0 then
                        script.KenRunOut:Play();
                    end;
                    v32.Visible = true;
                else
                    v32.Visible = false;
                end;
                v32.Left.Bar.ImageColor3 = l_v22_StatsFolder_0.Customization.KenColor.Value;
                v32.Right.Bar.ImageColor3 = l_v22_StatsFolder_0.Customization.KenColor.Value;
            end;
            l_KenBar_0:GetPropertyChangedSignal("Value"):Connect(v58);
            l_KenBar_0:GetPropertyChangedSignal("MaxValue"):Connect(v58);
            v58();
            local function v59() --[[ Line: 198 ]] --[[ Name: OnBusoChanged ]]
                -- upvalues: l_BusoMastery_0 (copy), v17 (ref), v31 (copy), l_BusoBar_0 (copy), l_v22_StatsFolder_0 (copy)
                if l_BusoMastery_0.Value > 0 then
                    v17(v31, l_BusoBar_0.Value, l_BusoBar_0.MaxValue);
                    if l_BusoBar_0.Value >= l_BusoBar_0.MaxValue then
                        script.BusoCharged:Play();
                    elseif l_BusoBar_0.Value <= 0 then
                        script.BusoRunOut:Play();
                    end;
                    v31.Visible = true;
                else
                    v31.Visible = false;
                end;
                v31.Left.Bar.ImageColor3 = l_v22_StatsFolder_0.Customization.BusoColor.Value;
                v31.Right.Bar.ImageColor3 = l_v22_StatsFolder_0.Customization.BusoColor.Value;
            end;
            l_BusoBar_0:GetPropertyChangedSignal("Value"):Connect(v59);
            l_BusoBar_0:GetPropertyChangedSignal("MaxValue"):Connect(v59);
            v59();
            l_v22_StatsFolder_0.Settings.PVPMode:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 219 ]] --[[ Name: OnPVPChanged ]]
                -- upvalues: l_PVP_0 (copy), l_v22_StatsFolder_0 (copy)
                if game.ReplicatedStorage.reservedCode.Value == "arena" then
                    l_PVP_0.Visible = false;
                    return;
                elseif l_v22_StatsFolder_0.Settings.PVPMode.Value == false then
                    l_PVP_0.Visible = true;
                    return;
                else
                    l_PVP_0.Visible = false;
                    return;
                end;
            end);
            if game.ReplicatedStorage.reservedCode.Value == "arena" then
                l_PVP_0.Visible = false;
            elseif l_v22_StatsFolder_0.Settings.PVPMode.Value == false then
                l_PVP_0.Visible = true;
            else
                l_PVP_0.Visible = false;
            end;
            local function v74() --[[ Line: 236 ]] --[[ Name: SetupUltBar ]]
                -- upvalues: l_InputHandler_0 (copy), v29 (copy), l_reservedCode_0 (copy), l_LocalPlayer_0 (ref), l_Stats_0 (copy), v9 (ref), v17 (ref)
                local _ = l_InputHandler_0:GetCurrentInput();
                v29.Visible = false;
                if l_reservedCode_0.Value ~= "arena" then
                    v29.Visible = false;
                    return;
                else
                    local _ = l_LocalPlayer_0:WaitForChild("UltsUsed");
                    local l_leaderstats_0 = l_LocalPlayer_0:WaitForChild("leaderstats");
                    local l_UltBar_0 = l_leaderstats_0:FindFirstChild("UltBar");
                    local _ = l_Stats_0:WaitForChild("SkillPoints");
                    l_leaderstats_0:WaitForChild("Damage");
                    local v65 = v9.CheckUltDamage(l_LocalPlayer_0);
                    local v66 = false;
                    local function v73() --[[ Line: 257 ]] --[[ Name: UltUpdated ]]
                        -- upvalues: l_UltBar_0 (ref), l_leaderstats_0 (copy), v29 (ref), v65 (ref), v9 (ref), l_LocalPlayer_0 (ref), v66 (ref), v17 (ref)
                        l_UltBar_0 = l_leaderstats_0:FindFirstChild("UltBar");
                        if l_UltBar_0 == nil then
                            return;
                        else
                            v29.Visible = true;
                            v65 = v9.CheckUltDamage(l_LocalPlayer_0);
                            local v67 = 1;
                            local l_Value_1 = l_UltBar_0.Value;
                            local v69 = math.clamp(l_Value_1 / v65, 0, 1);
                            local v70 = os.clock() % v67 / v67;
                            local v71 = Color3.fromHSV(v70, 1, 1);
                            if v69 >= 1 then
                                v67 = 0.5;
                                v29.Display.Text = "Ultimate Ready";
                                if v66 == false then
                                    v66 = true;
                                    script.UltBarFull:Play();
                                end;
                                local l_v29_0 = v29;
                                l_v29_0.Left.Bar.ImageColor3 = v71;
                                l_v29_0.Right.Bar.ImageColor3 = v71;
                            else
                                v66 = false;
                                v29.Display.Text = "Ultimate";
                            end;
                            v17(v29, l_Value_1, v65);
                            return;
                        end;
                    end;
                    game["Run Service"].Heartbeat:Connect(v73);
                    return;
                end;
            end;
            if l_reservedCode_0.Value ~= "checking" then
                v74();
            else
                local v75 = nil;
                do
                    local l_v75_0 = v75;
                    l_v75_0 = l_reservedCode_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 299 ]]
                        -- upvalues: l_reservedCode_0 (copy), l_v75_0 (ref), v74 (copy)
                        if l_reservedCode_0.Value ~= "checking" then
                            l_v75_0:Disconnect();
                            l_v75_0 = nil;
                            v74();
                        end;
                    end);
                end;
            end;
            local v77 = "None";
            local v78 = nil;
            local function v87() --[[ Line: 311 ]] --[[ Name: UpdateModeButtonSizes ]]
                -- upvalues: l_GetPreferredInput_0 (copy), v77 (ref), v25 (copy), l_GeneralBars_0 (copy), l_Frame_0 (copy), l_Position_0 (copy), v78 (ref)
                if l_GetPreferredInput_0.Current == "Mobile" and v77 ~= "Mobile" then
                    v77 = "Mobile";
                    local _, _, v81 = v25:GetMobileUI();
                    print("MODE BARS SHOULD BE LOADED");
                    local function v86() --[[ Line: 318 ]] --[[ Name: Update ]]
                        -- upvalues: v25 (ref), l_GeneralBars_0 (ref), v81 (copy), l_Frame_0 (ref), l_Position_0 (ref)
                        local l_v25_PositionAndSize_0, _ = v25:GetPositionAndSize();
                        for _, v85 in ipairs(l_GeneralBars_0:GetChildren()) do
                            if v85:IsA("Frame") then
                                v85.Size = UDim2.fromOffset(v81.AbsoluteSize.X * 0.85, v81.AbsoluteSize.Y * 0.85);
                            end;
                        end;
                        l_Frame_0.Position = UDim2.new(0, 0, l_Position_0.Y.Scale, -l_v25_PositionAndSize_0.Y.Offset / 2);
                    end;
                    v86();
                    if v78 then
                        return;
                    else
                        v78 = v81:GetPropertyChangedSignal("AbsoluteSize"):Connect(v86);
                    end;
                end;
            end;
            v87();
            local v88 = nil;
            v88 = l_GetPreferredInput_0.Observe(function(_) --[[ Line: 338 ]]
                -- upvalues: v87 (copy)
                v87();
            end);
            print("is this getting reached?");
            _G.BusoRed = function(_) --[[ Line: 347 ]]

            end;
            local v91 = nil;
            local function v97(v92) --[[ Line: 373 ]] --[[ Name: CharacterAdded ]]
                -- upvalues: v91 (ref), v17 (ref), v33 (copy)
                local l_Humanoid_0 = v92:WaitForChild("Humanoid");
                if v91 then
                    v91:Disconnect();
                    v91 = nil;
                end;
                local function v95() --[[ Line: 382 ]] --[[ Name: OnEvasiveChanged ]]
                    -- upvalues: l_Humanoid_0 (copy), v92 (copy), v17 (ref), v33 (ref)
                    local v94 = l_Humanoid_0.MaxHealth * v92:GetAttribute("healthPercentEvasive") + v92:GetAttribute("baseEvasiveReq");
                    v17(v33, v92:GetAttribute("evasiveBar"), v94);
                end;
                v91 = v92:GetAttributeChangedSignal("evasiveBar"):Connect(v95);
                local v96 = l_Humanoid_0.MaxHealth * v92:GetAttribute("healthPercentEvasive") + v92:GetAttribute("baseEvasiveReq");
                v17(v33, v92:GetAttribute("evasiveBar"), v96);
            end;
            v97(l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait());
            l_LocalPlayer_0.CharacterAdded:Connect(v97);
            v11.Initialized = true;
            return;
        end;
    end;
end;
return v11;