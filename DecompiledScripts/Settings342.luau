local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("RunService");
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_1:WaitForChild("Modules");
local _ = require(l_Modules_0.Leveling);
local l_Client_0 = l_Modules_0.Client;
local l_Slider_0 = require(l_Client_0:WaitForChild("Slider"));
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local _ = require(l_Shared_0:WaitForChild("SoundUtils"));
local v15 = require(l_ReplicatedStorage_1.Modules.Trove);
local v16 = require(l_Modules_0.Client.Notification);
local l_Events_0 = l_ReplicatedStorage_1:WaitForChild("Events");
local v18 = {
    Initialized = false
};
v18.Initialize = function(v19) --[[ Line: 29 ]] --[[ Name: Initialize ]]
    -- upvalues: v18 (copy), l_Events_0 (copy), l_ReplicatedStorage_1 (copy), l_PlayerGui_0 (copy), v16 (copy), l_Lighting_0 (copy), v15 (copy), l_TweenService_0 (copy), l_Slider_0 (copy)
    if v18.Initialized then
        return;
    else
        local l_Settings_0 = l_Events_0:WaitForChild("Settings");
        local l_reservedCode_0 = l_ReplicatedStorage_1:WaitForChild("reservedCode");
        local l_v19_StatsFolder_0 = v19:GetStatsFolder();
        local l_MobileButtonScale_0 = l_v19_StatsFolder_0:WaitForChild("Settings"):WaitForChild("MobileButtonScale");
        local l_Main_0 = l_PlayerGui_0:WaitForChild("Settings", 360):WaitForChild("Main");
        local l_List_0 = l_Main_0:WaitForChild("List");
        local l_Code_0 = l_Main_0:WaitForChild("Code");
        local l_Toggle_0 = l_Main_0.Toggle;
        local v28 = Color3.fromRGB(170, 12, 1);
        local v29 = Color3.fromRGB(85, 170, 0);
        local v30 = {
            On = true, 
            Off = false, 
            [true] = "On", 
            [false] = "Off"
        };
        local v31 = {
            "M1Button", 
            "HapticFeedback", 
            "MobileBlockToggle"
        };
        local v32 = {};
        local function _(v33, v34) --[[ Line: 62 ]] --[[ Name: FastSwitch ]]
            -- upvalues: v30 (copy), v29 (copy), v28 (copy)
            local l_Select_0 = v33.Options.Select;
            l_Select_0.Position = UDim2.new(v30[v34] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_0.ImageColor3 = v30[v34] == "On" and v29 or v28;
        end;
        local function v40(v37) --[[ Line: 71 ]] --[[ Name: RemoveTextures ]]
            for _, v39 in ipairs(v37:GetChildren()) do
                if v39:IsA("Texture") then
                    v39:Destroy();
                end;
            end;
        end;
        v32.FastModeInit = function(v41) --[[ Line: 79 ]] --[[ Name: FastModeInit ]]
            -- upvalues: v30 (copy), v29 (copy), v28 (copy)
            local l_fastmode_0 = _G.fastmode;
            local l_Select_1 = v41.Options.Select;
            l_Select_1.Position = UDim2.new(v30[l_fastmode_0] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_1.ImageColor3 = v30[l_fastmode_0] == "On" and v29 or v28;
            return "Off";
        end;
        v32.FastModeCheck = function(_, _) --[[ Line: 84 ]] --[[ Name: FastModeCheck ]]
            if _G.fastmode == true then
                return false, "<Color=Red>You must rejoin to disable FastMode!";
            else
                return true;
            end;
        end;
        v32.FastModeOn = function(_) --[[ Line: 93 ]] --[[ Name: FastModeOn ]]
            -- upvalues: v16 (ref), l_Lighting_0 (ref), v40 (copy)
            v16.DisplayMessage("Transitioning to FastMode...");
            _G.fastmode = true;
            local v47 = os.clock();
            l_Lighting_0.GlobalShadows = false;
            local function _(v48) --[[ Line: 102 ]] --[[ Name: processPart ]]
                -- upvalues: v40 (ref)
                if v48.Material == Enum.Material.ForceField then
                    return;
                else
                    v48.Material = Enum.Material.SmoothPlastic;
                    if v48:FindFirstChildWhichIsA("Texture") then
                        v40(v48);
                    end;
                    return;
                end;
            end;
            workspace.Islands.DescendantAdded:Connect(function(v50) --[[ Line: 114 ]]
                -- upvalues: v40 (ref)
                if v50:IsA("BasePart") then
                    if v50.Material == Enum.Material.ForceField then
                        return;
                    else
                        v50.Material = Enum.Material.SmoothPlastic;
                        if v50:FindFirstChildWhichIsA("Texture") then
                            v40(v50);
                        end;
                    end;
                end;
            end);
            local v51 = 0;
            local l_Descendants_0 = workspace.Islands:GetDescendants();
            for v53 = 1, #l_Descendants_0 do
                if l_Descendants_0[v53]:IsA("BasePart") and l_Descendants_0[v53].Material ~= Enum.Material.ForceField then
                    v51 = v51 + 1;
                    local v54 = l_Descendants_0[v53];
                    if v54.Material ~= Enum.Material.ForceField then
                        v54.Material = Enum.Material.SmoothPlastic;
                        if v54:FindFirstChildWhichIsA("Texture") then
                            v40(v54);
                        end;
                    end;
                    if v51 >= 50 then
                        v51 = 0;
                        task.wait();
                    end;
                end;
            end;
            v16.DisplayMessage((("Finalized FastMode in %*s"):format((math.floor(os.clock() - v47)))));
        end;
        v32.AllowJoinsInit = function(v55) --[[ Line: 138 ]] --[[ Name: AllowJoinsInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy)
            local l_Value_0 = l_v19_StatsFolder_0.Settings.AllowJoins.Value;
            local l_Select_2 = v55.Options.Select;
            l_Select_2.Position = UDim2.new(v30[l_Value_0] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_2.ImageColor3 = v30[l_Value_0] == "On" and v29 or v28;
            return v30[l_v19_StatsFolder_0.Settings.AllowJoins.Value];
        end;
        v32.AllowJoinsOn = function(_) --[[ Line: 143 ]] --[[ Name: AllowJoinsOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("AllowJoins", true);
        end;
        v32.AllowJoinsOff = function(_) --[[ Line: 147 ]] --[[ Name: AllowJoinsOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("AllowJoins", false);
        end;
        v32.ShadowsInit = function(v60) --[[ Line: 151 ]] --[[ Name: ShadowsInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy), l_Lighting_0 (ref)
            local l_Value_1 = l_v19_StatsFolder_0.Settings.Shadows.Value;
            local l_Select_3 = v60.Options.Select;
            l_Select_3.Position = UDim2.new(v30[l_Value_1] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_3.ImageColor3 = v30[l_Value_1] == "On" and v29 or v28;
            l_Lighting_0.GlobalShadows = l_v19_StatsFolder_0.Settings.Shadows.Value;
            return v30[l_v19_StatsFolder_0.Settings.Shadows.Value];
        end;
        v32.ShadowsOn = function(_) --[[ Line: 157 ]] --[[ Name: ShadowsOn ]]
            -- upvalues: l_Settings_0 (copy), l_Lighting_0 (ref)
            l_Settings_0:InvokeServer("Shadows", true);
            l_Lighting_0.GlobalShadows = true;
        end;
        v32.ShadowsOff = function(_) --[[ Line: 162 ]] --[[ Name: ShadowsOff ]]
            -- upvalues: l_Settings_0 (copy), l_Lighting_0 (ref)
            l_Settings_0:InvokeServer("Shadows", false);
            l_Lighting_0.GlobalShadows = false;
        end;
        v32.MusicInit = function(v65) --[[ Line: 167 ]] --[[ Name: MusicInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy)
            _G.music = l_v19_StatsFolder_0.Settings.Music.Value;
            local l_Value_2 = l_v19_StatsFolder_0.Settings.Music.Value;
            local l_Select_4 = v65.Options.Select;
            l_Select_4.Position = UDim2.new(v30[l_Value_2] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_4.ImageColor3 = v30[l_Value_2] == "On" and v29 or v28;
            return v30[l_v19_StatsFolder_0.Settings.Music.Value];
        end;
        v32.MusicOn = function(_) --[[ Line: 173 ]] --[[ Name: MusicOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("Music", true);
            _G.music = true;
        end;
        v32.MusicOff = function(_) --[[ Line: 178 ]] --[[ Name: MusicOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("Music", false);
            _G.music = false;
        end;
        v32.RadioInit = function(v70) --[[ Line: 183 ]] --[[ Name: RadioInit ]]
            -- upvalues: v30 (copy), v29 (copy), v28 (copy)
            _G.music2 = true;
            local l_music2_0 = _G.music2;
            local l_Select_5 = v70.Options.Select;
            l_Select_5.Position = UDim2.new(v30[l_music2_0] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_5.ImageColor3 = v30[l_music2_0] == "On" and v29 or v28;
            return v30[_G.music2];
        end;
        v32.RadioOn = function(_) --[[ Line: 189 ]] --[[ Name: RadioOn ]]
            _G.music2 = true;
        end;
        v32.RadioOff = function(_) --[[ Line: 193 ]] --[[ Name: RadioOff ]]
            _G.music2 = false;
        end;
        v32.LocalOverheadInit = function(v75) --[[ Line: 197 ]] --[[ Name: LocalOverheadInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy)
            local l_Value_3 = l_v19_StatsFolder_0.Settings.ShowLocalPlayerBar.Value;
            local l_Select_6 = v75.Options.Select;
            l_Select_6.Position = UDim2.new(v30[l_Value_3] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_6.ImageColor3 = v30[l_Value_3] == "On" and v29 or v28;
            return v30[l_v19_StatsFolder_0.Settings.ShowLocalPlayerBar.Value];
        end;
        v32.LocalOverheadOn = function(_) --[[ Line: 202 ]] --[[ Name: LocalOverheadOn ]]
            -- upvalues: l_Settings_0 (copy), v16 (ref)
            l_Settings_0:InvokeServer("ShowLocalPlayerBar", true);
            v16.DisplayMessage("<Color=Orange>A respawn is required to apply changes.");
        end;
        v32.LocalOverheadOff = function(_) --[[ Line: 207 ]] --[[ Name: LocalOverheadOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("ShowLocalPlayerBar", false);
        end;
        v32.AnimatedAccessoriesInit = function(v80) --[[ Line: 211 ]] --[[ Name: AnimatedAccessoriesInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy)
            local l_Value_4 = l_v19_StatsFolder_0.Settings.AnimatedHats.Value;
            local l_Select_7 = v80.Options.Select;
            l_Select_7.Position = UDim2.new(v30[l_Value_4] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_7.ImageColor3 = v30[l_Value_4] == "On" and v29 or v28;
            return v30[l_v19_StatsFolder_0.Settings.AnimatedHats.Value];
        end;
        v32.AnimatedAccessoriesOn = function(_) --[[ Line: 216 ]] --[[ Name: AnimatedAccessoriesOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("AnimatedHats", true);
        end;
        v32.AnimatedAccessoriesOff = function(_) --[[ Line: 220 ]] --[[ Name: AnimatedAccessoriesOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("AnimatedHats", false);
        end;
        v32.PVPModeInit = function(v85) --[[ Line: 224 ]] --[[ Name: PVPModeInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy)
            local l_Value_5 = l_v19_StatsFolder_0.Settings.PVPMode.Value;
            local l_Select_8 = v85.Options.Select;
            l_Select_8.Position = UDim2.new(v30[l_Value_5] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_8.ImageColor3 = v30[l_Value_5] == "On" and v29 or v28;
            return v30[l_v19_StatsFolder_0.Settings.PVPMode.Value];
        end;
        v32.PVPModeOn = function(_) --[[ Line: 229 ]] --[[ Name: PVPModeOn ]]
            -- upvalues: l_Settings_0 (copy)
            return l_Settings_0:InvokeServer("PVPMode", true);
        end;
        v32.PVPModeOff = function(_) --[[ Line: 233 ]] --[[ Name: PVPModeOff ]]
            -- upvalues: l_Settings_0 (copy)
            return l_Settings_0:InvokeServer("PVPMode", false);
        end;
        v32.HapticFeedbackInit = function(v90) --[[ Line: 237 ]] --[[ Name: HapticFeedbackInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy)
            local l_Value_6 = l_v19_StatsFolder_0.Settings.PVPMode.Value;
            local l_Select_9 = v90.Options.Select;
            l_Select_9.Position = UDim2.new(v30[l_Value_6] == "On" and 0.5 or 0, 0, 0.5, 0);
            l_Select_9.ImageColor3 = v30[l_Value_6] == "On" and v29 or v28;
            return v30[l_v19_StatsFolder_0.Settings.HapticFeedback.Value];
        end;
        v32.HapticFeedbackOn = function(_) --[[ Line: 242 ]] --[[ Name: HapticFeedbackOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("HapticFeedback", true);
        end;
        v32.HapticFeedbackOff = function(_) --[[ Line: 246 ]] --[[ Name: HapticFeedbackOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("HapticFeedback", false);
        end;
        v32.OverrideDashOn = function(_) --[[ Line: 250 ]] --[[ Name: OverrideDashOn ]]
            -- upvalues: l_Settings_0 (copy)
            _G.displayMessage("<Color=Orange>Your special dashes have been switched to normal roll dash");
            return l_Settings_0:InvokeServer("OverrideDash", true);
        end;
        v32.OverrideDashOff = function(_) --[[ Line: 255 ]] --[[ Name: OverrideDashOff ]]
            -- upvalues: l_Settings_0 (copy)
            _G.displayMessage("<Color=Orange>Your special dashes have been enabled");
            return l_Settings_0:InvokeServer("OverrideDash", false);
        end;
        v32.InstantCastSkillsOn = function(_) --[[ Line: 260 ]] --[[ Name: InstantCastSkillsOn ]]
            -- upvalues: l_Settings_0 (copy)
            _G.displayMessage("<Color=Orange>Your holdable skills will now instantly cast instead of waiting for your input.");
            if _G.mobile == true then
                _G.displayMessage("<Color=Orange>Shift Lock is recommend for this setting on mobile.");
            end;
            return l_Settings_0:InvokeServer("InstantCastSkills", true);
        end;
        v32.InstantCastSkillsOff = function(_) --[[ Line: 268 ]] --[[ Name: InstantCastSkillsOff ]]
            -- upvalues: l_Settings_0 (copy)
            _G.displayMessage("<Color=Orange>Your holdable skills will now wait for your input.");
            return l_Settings_0:InvokeServer("InstantCastSkills", false);
        end;
        v32.M1ButtonOn = function(_) --[[ Line: 273 ]] --[[ Name: M1ButtonOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("M1Button", true);
        end;
        v32.M1ButtonOff = function(_) --[[ Line: 277 ]] --[[ Name: M1ButtonOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("M1Button", false);
        end;
        v32.MobileBlockToggleOn = function(_) --[[ Line: 281 ]] --[[ Name: MobileBlockToggleOn ]]
            -- upvalues: l_Settings_0 (copy), v16 (ref)
            l_Settings_0:InvokeServer("MobileBlockToggle", true);
            v16.DisplayMessage("<Color=Orange>Blocking now requires you to tap 2 times, one time to block, and another to unblock.");
        end;
        v32.MobileBlockToggleOff = function(_) --[[ Line: 287 ]] --[[ Name: MobileBlockToggleOff ]]
            -- upvalues: l_Settings_0 (copy), v16 (ref)
            l_Settings_0:InvokeServer("MobileBlockToggle", false);
            v16.DisplayMessage("<Color=Orange>Blocking now is now holdable,hold the button to start blocking and release to unblock.");
        end;
        v32.AutoRunOn = function(_) --[[ Line: 293 ]] --[[ Name: AutoRunOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("AutoRun", true);
        end;
        v32.AutoRunOff = function(_) --[[ Line: 297 ]] --[[ Name: AutoRunOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("AutoRun", false);
        end;
        v32.MobileUIScaleInit = function(_, v106, _) --[[ Line: 303 ]] --[[ Name: MobileUIScaleInit ]]
            -- upvalues: l_MobileButtonScale_0 (copy)
            v106:OverrideValue(l_MobileButtonScale_0.Value);
        end;
        v32.MobileUIScaleUpdated = function(_, v109, _) --[[ Line: 307 ]] --[[ Name: MobileUIScaleUpdated ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("MobileButtonScale", v109:GetValue());
        end;
        v32.ShowCapturePointsOn = function(_) --[[ Line: 313 ]] --[[ Name: ShowCapturePointsOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("ShowCapturePoints", true);
        end;
        v32.ShowCapturePointsOff = function(_) --[[ Line: 317 ]] --[[ Name: ShowCapturePointsOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("ShowCapturePoints", false);
        end;
        local _ = function(v113) --[[ Line: 321 ]] --[[ Name: setupBasicSliderFunctions ]]
            -- upvalues: v32 (copy), l_v19_StatsFolder_0 (copy), l_Settings_0 (copy)
            v32[v113 .. "Init"] = function(_, v115, _) --[[ Line: 322 ]]
                -- upvalues: l_v19_StatsFolder_0 (ref), v113 (copy)
                v115:OverrideValue(l_v19_StatsFolder_0.Settings[v113].Value);
            end;
            v32[v113 .. "Updated"] = function(_, v118, _) --[[ Line: 326 ]]
                -- upvalues: l_Settings_0 (ref), v113 (copy)
                l_Settings_0:InvokeServer(v113, v118:GetValue());
            end;
        end;
        local v121 = "ParticleEmitRate";
        local l_v121_0 = v121 --[[ copy: 20 -> 32 ]];
        v32.ParticleEmitRateInit = function(_, v124, _) --[[ Line: 322 ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), l_v121_0 (copy)
            v124:OverrideValue(l_v19_StatsFolder_0.Settings[l_v121_0].Value);
        end;
        v121 = "ParticleEmitRate";
        local l_v121_1 = v121 --[[ copy: 20 -> 33 ]];
        v32.ParticleEmitRateUpdated = function(_, v128, _) --[[ Line: 326 ]]
            -- upvalues: l_Settings_0 (copy), l_v121_1 (copy)
            l_Settings_0:InvokeServer(l_v121_1, v128:GetValue());
        end;
        v121 = "ParticleRate";
        local l_v121_2 = v121 --[[ copy: 20 -> 34 ]];
        v32.ParticleRateInit = function(_, v132, _) --[[ Line: 322 ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), l_v121_2 (copy)
            v132:OverrideValue(l_v19_StatsFolder_0.Settings[l_v121_2].Value);
        end;
        v121 = "ParticleRate";
        local l_v121_3 = v121 --[[ copy: 20 -> 35 ]];
        v32.ParticleRateUpdated = function(_, v136, _) --[[ Line: 326 ]]
            -- upvalues: l_Settings_0 (copy), l_v121_3 (copy)
            l_Settings_0:InvokeServer(l_v121_3, v136:GetValue());
        end;
        v121 = "DamageOutput";
        local l_v121_4 = v121 --[[ copy: 20 -> 36 ]];
        v32.DamageOutputInit = function(_, v140, _) --[[ Line: 322 ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), l_v121_4 (copy)
            v140:OverrideValue(l_v19_StatsFolder_0.Settings[l_v121_4].Value);
        end;
        v121 = "DamageOutput";
        local l_v121_5 = v121 --[[ copy: 20 -> 37 ]];
        v32.DamageOutputUpdated = function(_, v144, _) --[[ Line: 326 ]]
            -- upvalues: l_Settings_0 (copy), l_v121_5 (copy)
            l_Settings_0:InvokeServer(l_v121_5, v144:GetValue());
        end;
        (function(v146) --[[ Line: 335 ]] --[[ Name: setupBasicToggle ]]
            -- upvalues: v32 (copy), l_v19_StatsFolder_0 (copy), v30 (copy), v29 (copy), v28 (copy), l_Settings_0 (copy)
            v32[v146 .. "Init"] = function(v147) --[[ Line: 336 ]]
                -- upvalues: l_v19_StatsFolder_0 (ref), v146 (copy), v30 (ref), v29 (ref), v28 (ref)
                local l_Value_7 = l_v19_StatsFolder_0.Settings[v146].Value;
                local l_Select_10 = v147.Options.Select;
                l_Select_10.Position = UDim2.new(v30[l_Value_7] == "On" and 0.5 or 0, 0, 0.5, 0);
                l_Select_10.ImageColor3 = v30[l_Value_7] == "On" and v29 or v28;
                return v30[l_v19_StatsFolder_0.Settings[v146].Value];
            end;
            v32[v146 .. "On"] = function(_) --[[ Line: 341 ]]
                -- upvalues: l_Settings_0 (ref), v146 (copy)
                l_Settings_0:InvokeServer(v146, true);
            end;
            v32[v146 .. "Off"] = function(_) --[[ Line: 345 ]]
                -- upvalues: l_Settings_0 (ref), v146 (copy)
                l_Settings_0:InvokeServer(v146, false);
            end;
        end)("PartyPings");
        v32.CameraShakeOn = function(_) --[[ Line: 354 ]] --[[ Name: CameraShakeOn ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("CameraShake", true);
            _G.cameraShakeEnabled = true;
        end;
        v32.CameraShakeOff = function(_) --[[ Line: 359 ]] --[[ Name: CameraShakeOff ]]
            -- upvalues: l_Settings_0 (copy)
            l_Settings_0:InvokeServer("CameraShake", false);
            _G.cameraShakeEnabled = false;
        end;
        v121 = {};
        local v154 = v15.new();
        local v155 = false;
        local function v158() --[[ Line: 370 ]] --[[ Name: clearParticleStorage ]]
            -- upvalues: v121 (ref), v154 (copy)
            for v156, v157 in pairs(v121) do
                if v157 then
                    v157:Disconnect();
                    v157 = nil;
                end;
                if v156 then
                    v121[v156] = nil;
                end;
            end;
            table.clear(v121);
            v121 = {};
            v154:Clean();
            warn("cleared particle storage");
        end;
        local function v167(v159) --[[ Line: 386 ]] --[[ Name: trackParticles ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v154 (copy), v155 (ref), v121 (ref), v158 (copy)
            if v159 == nil then
                v159 = l_v19_StatsFolder_0.Settings.ParticleRate.Value;
            end;
            if v159 >= 1 then
                v154:Clean();
                v155 = false;
                return;
            else
                v155 = true;
                v154:Clean();
                local function v166(v160) --[[ Line: 400 ]] --[[ Name: filterParticle ]]
                    -- upvalues: v121 (ref), l_v19_StatsFolder_0 (ref)
                    if v160:IsA("ParticleEmitter") and v121[v160] == nil then
                        local l_Value_8 = l_v19_StatsFolder_0.Settings.ParticleRate.Value;
                        local l_v160_Attribute_0 = v160:GetAttribute("OrgParticleRateSetting");
                        if l_v160_Attribute_0 == nil then
                            v160:SetAttribute("OrgParticleRateSetting", v160.Rate);
                            l_v160_Attribute_0 = v160.Rate;
                        end;
                        if l_v160_Attribute_0 <= 0 then
                            return;
                        else
                            local v163 = 4;
                            if l_v160_Attribute_0 < v163 then
                                v163 = l_v160_Attribute_0;
                            end;
                            v160.Rate = math.max(l_v160_Attribute_0 * l_Value_8, v163);
                            local v164 = nil;
                            do
                                local l_v164_0 = v164;
                                l_v164_0 = v160.Destroying:Once(function() --[[ Line: 424 ]]
                                    -- upvalues: l_v164_0 (ref), v121 (ref), v160 (copy)
                                    l_v164_0:Disconnect();
                                    l_v164_0 = nil;
                                    v121[v160] = nil;
                                end);
                                v121[v160] = l_v164_0;
                            end;
                        end;
                    end;
                end;
                v154:Add(workspace.Effects.DescendantAdded:Connect(v166));
                v154:Add(workspace.NPCs.DescendantAdded:Connect(v166));
                v154:Add(workspace.PlayerCharacters.DescendantAdded:Connect(v166));
                v154:Add(v158);
                v154:Add(function() --[[ Line: 460 ]]
                    -- upvalues: v155 (ref)
                    v155 = false;
                end);
                return;
            end;
        end;
        v32.ParticleRateInit = function(_, v169, _) --[[ Line: 465 ]] --[[ Name: ParticleRateInit ]]
            -- upvalues: l_v19_StatsFolder_0 (copy), v167 (copy)
            v169:OverrideValue(l_v19_StatsFolder_0.Settings.ParticleRate.Value);
            v167();
        end;
        v32.ParticleRateUpdated = function(_, v172, _) --[[ Line: 471 ]] --[[ Name: ParticleRateUpdated ]]
            -- upvalues: v155 (ref), v121 (ref), v154 (copy), v167 (copy), l_Settings_0 (copy)
            local l_v172_Value_0 = v172:GetValue();
            if v155 == true then
                for v175, _ in pairs(v121) do
                    if v175 ~= nil then
                        local l_v175_Attribute_0 = v175:GetAttribute("OrgParticleRateSetting");
                        if l_v175_Attribute_0 then
                            v175.Rate = math.max(l_v175_Attribute_0 * l_v172_Value_0, 4);
                        end;
                    end;
                end;
            end;
            warn("new rate", l_v172_Value_0);
            if l_v172_Value_0 >= 1 then
                v155 = false;
                v154:Clean();
            elseif v155 == false then
                v167(l_v172_Value_0);
            end;
            l_Settings_0:InvokeServer("ParticleRate", l_v172_Value_0);
        end;
        local v202 = {
            ["On/Off"] = function(v178) --[[ Line: 503 ]]
                -- upvalues: v32 (copy), v16 (ref), l_TweenService_0 (ref), v29 (copy), v28 (copy), l_v19_StatsFolder_0 (copy), v30 (copy)
                local l_Options_0 = v178.Options;
                local l_Select_11 = l_Options_0.Select;
                local v181 = "On";
                local v182 = false;
                l_Options_0.Button.MouseButton1Click:Connect(function() --[[ Line: 510 ]]
                    -- upvalues: v32 (ref), v178 (copy), v16 (ref), v182 (ref), v181 (ref), l_TweenService_0 (ref), l_Select_11 (copy), v29 (ref), v28 (ref)
                    local v183 = v32[v178.Name .. "Check"];
                    if v183 then
                        local v184, v185 = v183(v178);
                        if v184 == false then
                            v16.DisplayMessage(v185 or "Error Occured");
                            v182 = false;
                            return;
                        end;
                    end;
                    if v182 == true then
                        return;
                    else
                        v182 = true;
                        v181 = v181 == "On" and "Off" or "On";
                        if v32[v178.Name .. v181] then
                            local v186 = v32[v178.Name .. v181](v178);
                            if v186 then
                                if v186 == true then
                                    v181 = "On";
                                else
                                    v181 = "Off";
                                end;
                            end;
                        else
                            warn("Missing Functions for", v178, v181);
                        end;
                        l_TweenService_0:Create(l_Select_11, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            Position = UDim2.new(v181 == "On" and 0.5 or 0, 0, 0.5, 0), 
                            ImageColor3 = v181 == "On" and v29 or v28
                        }):Play();
                        task.wait(0.25);
                        v182 = false;
                        return;
                    end;
                end);
                if v32[v178.Name .. "Init"] then
                    v181 = v32[v178.Name .. "Init"](v178, v181) or "On";
                else
                    local l_Value_9 = l_v19_StatsFolder_0.Settings[v178.Name].Value;
                    local l_Select_12 = v178.Options.Select;
                    l_Select_12.Position = UDim2.new(v30[l_Value_9] == "On" and 0.5 or 0, 0, 0.5, 0);
                    l_Select_12.ImageColor3 = v30[l_Value_9] == "On" and v29 or v28;
                    v181 = v30[l_v19_StatsFolder_0.Settings[v178.Name].Value];
                end;
            end, 
            Slider = function(v189) --[[ Line: 565 ]]
                -- upvalues: l_Slider_0 (ref), v32 (copy)
                print("setup", v189, "slider");
                local l_Bar_0 = v189:WaitForChild("Bar");
                local l_UIGradient_0 = l_Bar_0:WaitForChild("UIGradient");
                local l_Value_10 = v189:WaitForChild("Value");
                local v193 = Color3.fromRGB(179, 179, 179);
                local v194 = Color3.fromRGB(100, 100, 100);
                local v195 = l_Slider_0.new(l_Bar_0, {
                    Start = v189:GetAttribute("Start") or 0, 
                    End = v189:GetAttribute("End") or 1, 
                    Increment = v189:GetAttribute("Increment") or 0.1, 
                    Default = 0
                }, TweenInfo.new(0, Enum.EasingStyle.Linear), "X", 0.25);
                v195:Track();
                local function v196() --[[ Line: 591 ]] --[[ Name: UpdateBarGradient ]]
                    -- upvalues: l_Value_10 (copy), v195 (copy), l_UIGradient_0 (copy), v193 (copy), v194 (copy)
                    l_Value_10.Text = v195:GetValue();
                    l_UIGradient_0.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v193), 
                        ColorSequenceKeypoint.new(math.clamp(v195._percent + 0.001, 0.001, 0.998), v193), 
                        ColorSequenceKeypoint.new(math.clamp(v195._percent + 0.002, 0.002, 0.999), v194), 
                        ColorSequenceKeypoint.new(1, v194)
                    });
                end;
                v195.Changed:Connect(function(_) --[[ Line: 601 ]]
                    -- upvalues: v196 (copy)
                    v196();
                end);
                local v198 = v32[("%*Updated"):format(v189.Name)];
                v195.Released:Connect(function(_) --[[ Line: 606 ]]
                    -- upvalues: v196 (copy), v198 (copy), v189 (copy), v195 (copy)
                    v196();
                    if v198 ~= nil then
                        v198(v189, v195, v196);
                    end;
                end);
                v195.OnClick:Connect(function(_) --[[ Line: 613 ]]
                    -- upvalues: v196 (copy), v198 (copy), v189 (copy), v195 (copy)
                    v196();
                    if v198 ~= nil then
                        v198(v189, v195, v196);
                    end;
                end);
                local v201 = v32[("%*Init"):format(v189.Name)];
                if v201 ~= nil then
                    v201(v189, v195, v196);
                end;
            end
        };
        for _, v204 in ipairs(l_List_0:GetChildren()) do
            if v204:IsA("ImageLabel") then
                local v205 = v202[v204:GetAttribute("Type") or ""];
                if v205 == nil then
                    warn((("Could not find setup type for %*"):format(v204.Name)));
                    continue;
                else
                    v205(v204);
                    if table.find(v31, v204.Name) and _G.mobile == false then
                        v204.Visible = false;
                    end;
                end;
            end;
            task.wait();
        end;
        local function v206() --[[ Line: 647 ]] --[[ Name: ReservedCodeUpdated ]]
            -- upvalues: l_Code_0 (copy), l_reservedCode_0 (copy), l_Toggle_0 (copy)
            l_Code_0.Text = l_reservedCode_0.Value;
            if l_reservedCode_0.Value == "" then
                l_Toggle_0.Visible = false;
            else
                l_Toggle_0.Visible = true;
            end;
            if l_reservedCode_0.Value == "" then
                l_Code_0.Text = "Public Server";
            end;
        end;
        l_Code_0.Text = l_reservedCode_0.Value;
        if l_reservedCode_0.Value == "" then
            l_Toggle_0.Visible = false;
        else
            l_Toggle_0.Visible = true;
        end;
        if l_reservedCode_0.Value == "" then
            l_Code_0.Text = "Public Server";
        end;
        l_reservedCode_0:GetPropertyChangedSignal("Value"):Connect(v206);
        l_Code_0.Visible = false;
        if l_reservedCode_0.Value == "" then
            l_Code_0.Visible = true;
        end;
        local v207 = true;
        l_Toggle_0.MouseButton1Click:Connect(function() --[[ Line: 669 ]]
            -- upvalues: v207 (ref), l_Code_0 (copy), l_Toggle_0 (copy)
            v207 = not v207;
            l_Code_0.Visible = not v207;
            l_Toggle_0.Status.Text = v207 and "SHOW" or "HIDE";
        end);
        v18.Initialized = true;
        return;
    end;
end;
return v18;