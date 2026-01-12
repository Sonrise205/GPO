local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v7 = require(l_Modules_0.Leveling);
local l_Client_0 = l_Modules_0:WaitForChild("Client");
local l_Notification_0 = require(l_Client_0:WaitForChild("Notification"));
local l_Shared_0 = l_Modules_0:WaitForChild("Shared");
local l_GameUtils_0 = require(l_Shared_0:WaitForChild("GameUtils"));
local l_SoundUtils_0 = require(l_Shared_0:WaitForChild("SoundUtils"));
local l_stats_0 = l_ReplicatedStorage_0:WaitForChild("Events"):WaitForChild("stats");
local v14 = {
    Initialized = false
};
v14.Initialize = function(v15) --[[ Line: 25 ]] --[[ Name: Initialize ]]
    -- upvalues: v14 (copy), l_ReplicatedStorage_0 (copy), l_PlayerGui_0 (copy), v7 (copy), l_LocalPlayer_0 (copy), l_SoundUtils_0 (copy), l_stats_0 (copy), l_GameUtils_0 (copy), l_Notification_0 (copy), l_MarketplaceService_0 (copy)
    if v14.Initialized then
        return;
    else
        local l_reservedCode_0 = l_ReplicatedStorage_0:WaitForChild("reservedCode");
        local l_v15_StatsFolder_0 = v15:GetStatsFolder();
        local l_Stats_0 = l_v15_StatsFolder_0:WaitForChild("Stats");
        local l_SkillPoints_0 = l_Stats_0:WaitForChild("SkillPoints");
        local l_FightingStyle_0 = l_Stats_0:WaitForChild("FightingStyle");
        local l_DamageOutput_0 = l_v15_StatsFolder_0:WaitForChild("Settings"):WaitForChild("DamageOutput");
        local l_DF_0 = l_Stats_0:WaitForChild("DF");
        local l_Bounty_0 = l_Stats_0:WaitForChild("Bounty");
        local l_Main_0 = l_PlayerGui_0:WaitForChild("Statistics", 360):WaitForChild("Main");
        local l_TopOptions_0 = l_Main_0:WaitForChild("TopOptions");
        local l_Reset_0 = l_TopOptions_0:WaitForChild("Reset");
        local l_AvailableSP_0 = l_TopOptions_0:WaitForChild("AvailableSP");
        local l_Input_0 = l_TopOptions_0:WaitForChild("Base"):WaitForChild("Input");
        local l_Stats_1 = l_Main_0:WaitForChild("Stats");
        local l_BountyBuff_0 = l_Main_0:WaitForChild("BountyBuff");
        local l_DMGWarning_0 = l_Main_0:WaitForChild("DMGWarning");
        local v32 = nil;
        l_Input_0.Focused:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v32 (ref), l_Input_0 (copy)
            if v32 ~= nil then
                return;
            else
                v32 = task.spawn(function() --[[ Line: 58 ]]
                    -- upvalues: l_Input_0 (ref)
                    while task.wait(0.1) do
                        l_Input_0.Text = l_Input_0.Text:gsub("%D+", "");
                    end;
                end);
                return;
            end;
        end);
        l_Input_0.FocusLost:Connect(function() --[[ Line: 65 ]]
            -- upvalues: v32 (ref)
            if v32 ~= nil and coroutine.status(v32) ~= "dead" then
                task.cancel(v32);
                v32 = nil;
            end;
        end);
        local v33 = false;
        local function v38() --[[ Line: 73 ]] --[[ Name: SkillPointsUpdated ]]
            -- upvalues: l_AvailableSP_0 (copy), l_SkillPoints_0 (copy), v33 (ref), l_Stats_1 (copy)
            l_AvailableSP_0.Text = ("Skill Points: %*"):format(l_SkillPoints_0.Value);
            if l_SkillPoints_0.Value > 0 then
                if v33 == false then
                    v33 = true;
                    for _, v35 in pairs(l_Stats_1:GetChildren()) do
                        if v35:IsA("ImageLabel") then
                            v35.Add.Visible = true;
                        end;
                    end;
                    return;
                end;
            else
                v33 = false;
                for _, v37 in pairs(l_Stats_1:GetChildren()) do
                    if v37:IsA("ImageLabel") then
                        v37.Add.Visible = false;
                    end;
                end;
            end;
        end;
        local l_FightingStyleMastery_0 = l_Stats_1.FightingStyleMastery;
        local function v40() --[[ Line: 96 ]] --[[ Name: FightingStyleUpdated ]]
            -- upvalues: l_FightingStyle_0 (copy), l_FightingStyleMastery_0 (copy)
            if l_FightingStyle_0.Value ~= "" then
                l_FightingStyleMastery_0.Visible = true;
                return;
            else
                l_FightingStyleMastery_0.Visible = false;
                return;
            end;
        end;
        local l_DevilFruitMastery_0 = l_Stats_1.DevilFruitMastery;
        l_DF_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 105 ]] --[[ Name: DevilFruitUpdated ]]
            -- upvalues: l_DF_0 (copy), l_DevilFruitMastery_0 (copy)
            if l_DF_0.Value ~= "" then
                l_DevilFruitMastery_0.Visible = true;
                return;
            else
                if l_DF_0.Value == "" then
                    l_DevilFruitMastery_0.Visible = false;
                end;
                return;
            end;
        end);
        if l_DF_0.Value ~= "" then
            l_DevilFruitMastery_0.Visible = true;
        elseif l_DF_0.Value == "" then
            l_DevilFruitMastery_0.Visible = false;
        end;
        l_FightingStyle_0:GetPropertyChangedSignal("Value"):Connect(v40);
        if l_FightingStyle_0.Value ~= "" then
            l_FightingStyleMastery_0.Visible = true;
        else
            l_FightingStyleMastery_0.Visible = false;
        end;
        l_SkillPoints_0:GetPropertyChangedSignal("Value"):Connect(v38);
        v38();
        local function _(v42, v43) --[[ Line: 122 ]] --[[ Name: roundNumber ]]
            return math.floor(v42 * 10 ^ v43) / 10 ^ v43;
        end;
        local function v46() --[[ Line: 126 ]] --[[ Name: BountyUpdated ]]
            -- upvalues: l_reservedCode_0 (copy), l_BountyBuff_0 (copy), v7 (ref), l_LocalPlayer_0 (ref)
            if l_reservedCode_0.Value == "arena" then
                l_BountyBuff_0.Visible = false;
                return;
            else
                l_BountyBuff_0.Visible = true;
                local v45 = math.floor(v7:GetBountyDefenseBuff(l_LocalPlayer_0) * 100 * 100) / 100;
                l_BountyBuff_0.Text = "You are gaining <font color=\"rgb(255,176,0)\">+" .. math.floor(v7:GetBountyDMGBuff(l_LocalPlayer_0) * 100 * 100) / 100 .. "% damage</font> and <font color=\"rgb(0,255,0)\">+" .. v45 .. "% HP</font> from your bounty";
                return;
            end;
        end;
        v46();
        l_Bounty_0:GetPropertyChangedSignal("Value"):Connect(v46);
        local function v47() --[[ Line: 142 ]] --[[ Name: DamageWarning ]]
            -- upvalues: l_DamageOutput_0 (copy), l_DMGWarning_0 (copy)
            if l_DamageOutput_0.Value < 1 then
                l_DMGWarning_0.Visible = true;
                l_DMGWarning_0.Text = ("<b><font color=\"#ff0000\">%*%%</font></b> less damage due to <b><font color=\"#ff0000\">DAMAGE OUTPUT RATIO</font></b> setting."):format((math.floor((1 - l_DamageOutput_0.Value) * 100)));
                return;
            else
                l_DMGWarning_0.Visible = false;
                return;
            end;
        end;
        if l_DamageOutput_0.Value < 1 then
            l_DMGWarning_0.Visible = true;
            l_DMGWarning_0.Text = ("<b><font color=\"#ff0000\">%*%%</font></b> less damage due to <b><font color=\"#ff0000\">DAMAGE OUTPUT RATIO</font></b> setting."):format((math.floor((1 - l_DamageOutput_0.Value) * 100)));
        else
            l_DMGWarning_0.Visible = false;
        end;
        l_DamageOutput_0:GetPropertyChangedSignal("Value"):Connect(v47);
        for _, v49 in pairs(l_Stats_1:GetChildren()) do
            if v49:IsA("ImageLabel") then
                local l_Amount_0 = v49.Amount;
                v49.Add.MouseButton1Click:Connect(function() --[[ Line: 160 ]]
                    -- upvalues: l_SoundUtils_0 (ref), l_Input_0 (copy), l_stats_0 (ref), v49 (copy)
                    l_SoundUtils_0.PlaySound("MenuClick", {
                        SoundCategory = "UI"
                    });
                    local v51 = tonumber(l_Input_0.Text);
                    if v51 == nil then
                        v51 = 1;
                    end;
                    if v51 < 0 then
                        v51 = 1;
                    end;
                    l_stats_0:FireServer(v49.Name, nil, v51);
                end);
                local v52 = l_Stats_0:WaitForChild(v49.Name);
                v52:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 180 ]] --[[ Name: StatObjectUpdated ]]
                    -- upvalues: l_Amount_0 (copy), v52 (copy)
                    l_Amount_0.Text = v52.Value;
                end);
                l_Amount_0.Text = v52.Value;
            end;
        end;
        l_Reset_0.MouseButton1Click:Connect(function() --[[ Line: 189 ]]
            -- upvalues: l_reservedCode_0 (copy), l_GameUtils_0 (ref), l_LocalPlayer_0 (ref), l_stats_0 (ref), l_Notification_0 (ref), l_MarketplaceService_0 (ref)
            if l_reservedCode_0.Value == "arena" then
                if l_GameUtils_0.PlayerHasItem(l_LocalPlayer_0, "SP Reset Essence") == true then
                    l_stats_0:FireServer("BattleRoyaleSPReset");
                    return;
                else
                    l_Notification_0.DisplayMessage("You need a <Color=Red>SP Reset Essence<Color=/> to reset your skill points!");
                    return;
                end;
            elseif l_GameUtils_0.PlayerHasItem(l_LocalPlayer_0, "SP Reset Essence") == true then
                l_stats_0:FireServer("BattleRoyaleSPReset");
                return;
            else
                l_MarketplaceService_0:PromptProductPurchase(l_LocalPlayer_0, 699566079);
                return;
            end;
        end);
        v14.Initialized = true;
        return;
    end;
end;
return v14;