local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), v3 (copy), l_LocalPlayer_0 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        ["Pteranodon Transform"] = false, 
        ["Sonic Screech"] = false, 
        ["Vermillion Bow"] = false, 
        ["Winged Flight"] = false, 
        ["Dive Bomb"] = false, 
        ["Pteranodon Carry"] = false
    };
    v10.hasRequirements = function(v11) --[[ Line: 33 ]]
        -- upvalues: v10 (copy), v3 (ref), l_LocalPlayer_0 (ref)
        if v10.Cooldowns[v11] then
            warn("on cd");
            return;
        else
            local v12 = v3.GetM(v11);
            local l_cd_0 = v12.cd;
            if not _G.StamCheck(v11) then
                warn("stam");
                return;
            elseif v12.statreq and not _G.MeetReq(v12.statreq) then
                warn("stat req");
                return;
            elseif _G.canuse == false or _G.check:inspect(l_LocalPlayer_0.Character) == false then
                return;
            else
                return v11, l_cd_0;
            end;
        end;
    end;
    return v10;
end;
v8.SonicScreech = function(v14, v15) --[[ Line: 52 ]] --[[ Name: SonicScreech ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_0 = v14.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v18 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v19, v20 = v14.hasRequirements("Sonic Screech");
    if not v19 then
        return;
    else
        _G.canuse = false;
        local v21 = game.ReplicatedStorage.Events.Skill:InvokeServer(v19, {
            cf = v14:GetMouseCFrame()
        });
        l_Cooldowns_0[v19] = true;
        local v22 = l_Character_0:GetAttribute("FormType") == "Hybrid";
        local v23 = (v22 and l_Character_0.Humanoid or l_Character_0:FindFirstChild("FormAnimator", true)):LoadAnimation(script[l_Character_0:GetAttribute("FormType")].SonicScreech);
        v23:Play();
        _G.FaceMouse = true;
        if v22 == true then
            _G.mouseLevel = true;
        end;
        if v22 then
            _G.PauseAnim(v23, 0.1, 1);
        else
            _G.PauseAnim(v23, 0.598, 1);
        end;
        local v24 = os.clock();
        v14:ChargeSkill(v15, {
            Key = Enum.KeyCode.E, 
            EndFunction = function() --[[ Line: 82 ]]
                -- upvalues: v21 (copy), v24 (copy), v14 (copy), l_Character_0 (copy), v18 (copy)
                local v25 = true;
                if v21 ~= nil then
                    v25 = true;
                    if os.clock() - v24 < 3 then
                        v25 = true;
                        if v14.Tool.Parent == l_Character_0 then
                            v25 = true;
                            if l_Character_0.Parent ~= nil then
                                v25 = true;
                                if l_Character_0.Parent == workspace.PlayerCharacters then
                                    v25 = v18.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                end;
                return v25;
            end
        });
        _G.FaceMouse = false;
        _G.mouseLevel = nil;
        l_Character_0.PrimaryPart.Anchored = true;
        if v22 then
            v23:AdjustSpeed(1);
            task.wait(0.2);
        else
            v23:AdjustSpeed(1);
            task.wait(0.15);
        end;
        if v21 then
            v21:FireServer(v14:GetMouseCFrame());
        end;
        if v22 then
            task.wait(2.25);
        else
            local v26 = tick();
            repeat
                if v21 then
                    v21:FireServer(v14:GetMouseCFrame());
                end;
                task.wait();
            until tick() - v26 >= 0.9;
            v23:Stop();
        end;
        l_Character_0.PrimaryPart.Anchored = false;
        _G.canuse = true;
        _G.keysetup:cooldown(v19, v20);
        _G.fw(v20);
        l_Cooldowns_0[v19] = false;
        return;
    end;
end;
v8.VermillionBow = function(v27, v28) --[[ Line: 131 ]] --[[ Name: VermillionBow ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v31 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v32, v33 = v27.hasRequirements("Vermillion Bow");
    if not v32 then
        return;
    else
        _G.canuse = false;
        local v34 = game.ReplicatedStorage.Events.Skill:InvokeServer(v32, {
            cf = v27:GetMouseCFrame()
        });
        l_Cooldowns_1[v32] = true;
        local v35 = l_Character_1:GetAttribute("FormType") == "Hybrid";
        local v36 = (v35 and l_Character_1.Humanoid or l_Character_1:FindFirstChild("FormAnimator", true)):LoadAnimation(script[l_Character_1:GetAttribute("FormType")].VermillionBow);
        v36:Play();
        _G.FaceMouse = true;
        _G.PauseAnim(v36, 0.2, 1);
        local v37 = os.clock();
        v27:ChargeSkill(v28, {
            Key = Enum.KeyCode.R, 
            EndFunction = function() --[[ Line: 151 ]]
                -- upvalues: v34 (copy), v37 (copy), v27 (copy), l_Character_1 (copy), v31 (copy)
                local v38 = true;
                if v34 ~= nil then
                    v38 = true;
                    if os.clock() - v37 < 3 then
                        v38 = true;
                        if v27.Tool.Parent == l_Character_1 then
                            v38 = true;
                            if l_Character_1.Parent ~= nil then
                                v38 = true;
                                if l_Character_1.Parent == workspace.PlayerCharacters then
                                    v38 = v31.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                end;
                return v38;
            end
        });
        v36:AdjustSpeed(1);
        if v35 == false then
            v36:AdjustSpeed(1.5);
        end;
        task.wait(0.2);
        _G.FaceMouse = false;
        if v35 == true then
            v36:Stop();
        end;
        if v34 then
            v34:InvokeServer(l_Character_1.PrimaryPart.CFrame, v27:GetMouseCFrame());
        end;
        task.wait(0.25);
        _G.canuse = true;
        _G.keysetup:cooldown(v32, v33);
        _G.fw(v33);
        l_Cooldowns_1[v32] = false;
        return;
    end;
end;
v8.RelentlessStrikes = function(v39, v40) --[[ Line: 184 ]] --[[ Name: RelentlessStrikes ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_2 = v39.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v43 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v44, v45 = v39.hasRequirements("Relentless Strikes");
    if not v44 then
        return;
    else
        _G.canuse = false;
        local v46 = game.ReplicatedStorage.Events.Skill:InvokeServer(v44, {
            cf = v39:GetMouseCFrame()
        });
        l_Cooldowns_2[v44] = true;
        local v47 = l_Character_2.Humanoid:LoadAnimation(script.Hybrid.RelentlessStrikes);
        v47:Play();
        _G.FaceMouse = true;
        _G.mouseLevel = true;
        _G.PauseAnim(v47, 0.1, 1);
        local v48 = os.clock();
        v39:ChargeSkill(v40, {
            Key = Enum.KeyCode.C, 
            EndFunction = function() --[[ Line: 205 ]]
                -- upvalues: v46 (copy), v48 (copy), v39 (copy), l_Character_2 (copy), v43 (copy)
                local v49 = true;
                if v46 ~= nil then
                    v49 = true;
                    if os.clock() - v48 < 10 then
                        v49 = true;
                        if v39.Tool.Parent == l_Character_2 then
                            v49 = true;
                            if l_Character_2.Parent ~= nil then
                                v49 = true;
                                if l_Character_2.Parent == workspace.PlayerCharacters then
                                    v49 = v43.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                end;
                return v49;
            end
        });
        v47:AdjustSpeed(1);
        _G.FaceMouse = false;
        _G.mouseLevel = nil;
        task.wait(0.2);
        if v46 then
            v46:FireServer(l_Character_2.HumanoidRootPart.CFrame);
        end;
        task.wait(2.25);
        _G.canuse = true;
        _G.keysetup:cooldown(v44, v45);
        _G.fw(v45);
        l_Cooldowns_2[v44] = false;
        return;
    end;
end;
v8.WingedFlight = function(v50, v51) --[[ Line: 233 ]] --[[ Name: WingedFlight ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_3 = v50.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v55, v56 = v50.hasRequirements("Winged Flight");
    if not v55 then
        return;
    elseif _G.grounded == true then
        return;
    else
        _G.canuse = false;
        l_Cooldowns_3[v55] = true;
        local v57 = game.ReplicatedStorage.Events.Skill:InvokeServer(v55);
        _G.canuse = true;
        if v57 then
            v50:DoubleCastSkill(v51, {
                Key = Enum.KeyCode.T, 
                SkipTap = true, 
                CompleteFunction = function() --[[ Line: 253 ]] --[[ Name: CompleteFunction ]]
                    -- upvalues: v57 (copy)
                    if v57 then
                        warn("client end fly");
                        v57:FireServer("end");
                    end;
                end, 
                PassFunction = function() --[[ Line: 259 ]] --[[ Name: PassFunction ]]
                    -- upvalues: v50 (copy), l_Character_3 (copy)
                    if v50.Tool.Parent == l_Character_3 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            repeat
                task.wait();
            until l_Character_3:GetAttribute("PetraFlying") == nil;
        end;
        _G.keysetup:cooldown(v55, v56);
        _G.fw(v56);
        l_Cooldowns_3[v55] = false;
        return;
    end;
end;
v8.SkyborneSlam = function(v58, v59) --[[ Line: 292 ]] --[[ Name: SkyborneSlam ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_4 = v58.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v62 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v63, v64 = v58.hasRequirements("Skyborne Slam");
    if not v63 then
        return;
    else
        _G.canuse = false;
        l_Cooldowns_4[v63] = true;
        local v65 = l_Character_4.Humanoid:LoadAnimation(script.Hybrid.grabWindup);
        v65:Play();
        l_Character_4.Humanoid.WalkSpeed = 4;
        _G.PauseAnim(v65, 0.22, 1);
        local v66 = tick();
        v58:ChargeSkill(v59, {
            Key = Enum.KeyCode.X, 
            EndFunction = function() --[[ Line: 311 ]]
                -- upvalues: l_Character_4 (copy), v66 (copy), v58 (copy), v62 (copy)
                l_Character_4.Humanoid.WalkSpeed = 4;
                local v67 = true;
                if tick() - v66 < 5 then
                    v67 = true;
                    if v58.Tool.Parent == l_Character_4 then
                        v67 = true;
                        if l_Character_4.Parent ~= nil then
                            v67 = true;
                            if l_Character_4.Parent == workspace.PlayerCharacters then
                                v67 = v62.Stamina.Value <= 0;
                            end;
                        end;
                    end;
                end;
                return v67;
            end
        });
        v65:AdjustSpeed(2);
        task.wait(0.1);
        game.ReplicatedStorage.Events.Skill:InvokeServer(v63, {
            cf = v58:GetMouseCFrame()
        });
        l_Character_4.Humanoid.WalkSpeed = 16;
        _G.canuse = true;
        _G.keysetup:cooldown(v63, v64);
        _G.fw(v64);
        l_Cooldowns_4[v63] = false;
        return;
    end;
end;
v8.PteranodonTransform = function(v68, _) --[[ Line: 334 ]] --[[ Name: PteranodonTransform ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_5 = v68.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v73, v74 = v68.hasRequirements("Pteranodon Transform");
    if not v73 then
        return;
    elseif l_Character_5:GetAttribute("FormType") == "Hybrid" then
        local v75 = 0;
        if l_Character_5:GetAttribute("pteranodonDamage") then
            v75 = math.ceil((l_Character_5:GetAttribute("pteranodonDamage")));
        end;
        if v75 < require(game.ReplicatedStorage.Modules.Skills.Modes.Pteranodon)(l_LocalPlayer_0) * v68.Tool:GetAttribute("modePercent") then
            _G.displayMessage((("<Color=/>I need <Color=Purple>%*%%<Color=/> mode bar for full form."):format(v68.Tool:GetAttribute("modePercent") * 100)));
            return;
        else
            _G.canuse = false;
            l_Cooldowns_5[v73] = true;
            l_Character_5.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Pteranodon Transform", "Full");
            _G.canuse = true;
            l_Cooldowns_5[v73] = true;
            _G.keysetup:cooldown(v73, v74);
            _G.fw(v74);
            l_Cooldowns_5[v73] = false;
            return;
        end;
    else
        game.ReplicatedStorage.Events.Skill:InvokeServer("Pteranodon Transform");
        return;
    end;
end;
v8.FlameForm = function(v76, _) --[[ Line: 372 ]] --[[ Name: FlameForm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_6 = v76.Cooldowns;
    local _ = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v81, v82 = v76.hasRequirements("Flame Form");
    if not v81 then
        return;
    elseif l_Cooldowns_6[v81] then
        return;
    else
        _G.canuse = false;
        game.ReplicatedStorage.Events.Skill:InvokeServer(v81, {
            cf = v76:GetMouseCFrame()
        });
        _G.canuse = true;
        l_Cooldowns_6[v81] = true;
        _G.keysetup:cooldown(v81, v82);
        _G.fw(v82);
        l_Cooldowns_6[v81] = false;
        return;
    end;
end;
v8.BarrelRoll = function(v83, _) --[[ Line: 391 ]] --[[ Name: BarrelRoll ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_7 = v83.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v88, v89 = v83.hasRequirements("Barrel Roll");
    if not v88 then
        return;
    else
        _G.canuse = false;
        local v90 = l_Character_7:FindFirstChild("FormAnimator", true):LoadAnimation(script.Full.Roll);
        v90:Play();
        v90.Priority = Enum.AnimationPriority.Action4;
        game.ReplicatedStorage.Events.Skill:InvokeServer("Barrel Roll");
        _G.canuse = true;
        l_Cooldowns_7[v88] = true;
        _G.keysetup:cooldown(v88, v89);
        _G.fw(v89);
        l_Cooldowns_7[v88] = false;
        return;
    end;
end;
v8.ImperialDiveBomb = function(v91, v92) --[[ Line: 414 ]] --[[ Name: ImperialDiveBomb ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_8 = v91.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local v95 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v96, v97 = v91.hasRequirements("Imperial Dive Bomb");
    if not v96 then
        return;
    else
        _G.canuse = false;
        local v98 = game.ReplicatedStorage.Events.Skill:InvokeServer(v96, {
            cf = v91:GetMouseCFrame()
        });
        l_Cooldowns_8[v96] = true;
        local v99 = l_Character_8:FindFirstChild("FormAnimator", true):LoadAnimation(script.Full.ultHold);
        v99:Play();
        _G.FaceMouse = true;
        local v100 = os.clock();
        v91:ChargeSkill(v92, {
            Key = Enum.KeyCode.C, 
            EndFunction = function() --[[ Line: 435 ]]
                -- upvalues: v98 (copy), v100 (copy), v91 (copy), l_Character_8 (copy), v95 (copy)
                local v101 = true;
                if v98 ~= nil then
                    v101 = true;
                    if os.clock() - v100 < 4 then
                        v101 = true;
                        if v91.Tool.Parent == l_Character_8 then
                            v101 = true;
                            if l_Character_8.Parent ~= nil then
                                v101 = true;
                                if l_Character_8.Parent == workspace.PlayerCharacters then
                                    v101 = v95.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                end;
                return v101;
            end
        });
        v99:Stop();
        if v98 then
            v98:InvokeServer(v91:GetMouseCFrame());
        end;
        _G.FaceMouse = false;
        task.wait(0.5);
        _G.canuse = true;
        _G.keysetup:cooldown(v96, v97);
        _G.fw(v97);
        l_Cooldowns_8[v96] = false;
        return;
    end;
end;
v8.ImperialStorm = function(v102, v103) --[[ Line: 464 ]] --[[ Name: ImperialStorm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_9 = v102.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local v106 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v107, v108 = v102.hasRequirements("Imperial Storm");
    if not v107 then
        return;
    else
        _G.canuse = false;
        _G.FaceMouse = true;
        local v109 = game.ReplicatedStorage.Events.Skill:InvokeServer(v107, {
            cf = v102:GetMouseCFrame()
        });
        l_Cooldowns_9[v107] = true;
        local function _() --[[ Line: 480 ]]

        end;
        local v111 = tick();
        v102:ChargeSkill(v103, {
            Key = Enum.KeyCode.X, 
            EndFunction = function() --[[ Line: 482 ]]
                -- upvalues: v109 (copy), v111 (copy), v102 (copy), l_Character_9 (copy), v106 (copy)
                local v112 = true;
                if v109 ~= nil then
                    v112 = true;
                    if tick() - v111 < 10 then
                        v112 = true;
                        if v102.Tool.Parent == l_Character_9 then
                            v112 = true;
                            if l_Character_9.Parent ~= nil then
                                v112 = true;
                                if l_Character_9.Parent == workspace.PlayerCharacters then
                                    v112 = true;
                                    if v106.Stamina.Value > 0 then
                                        v112 = not l_Character_9:GetAttribute("Shooting");
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                return v112;
            end, 
            IgnoreInstantCastSetting = true
        });
        task.wait(0.2);
        if v109 then
            v109:FireServer();
        end;
        _G.FaceMouse = false;
        _G.canuse = true;
        _G.keysetup:cooldown(v107, v108);
        _G.fw(v108);
        l_Cooldowns_9[v107] = false;
        return;
    end;
end;
v8.PteranodonCarry = function(v113, v114) --[[ Line: 507 ]] --[[ Name: PteranodonCarry ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Cooldowns_10 = v113.Cooldowns;
    local _ = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v118, v119 = v113.hasRequirements("Pteranodon Carry");
    if not v118 then
        return;
    else
        local v120 = game.ReplicatedStorage.Events.Skill:InvokeServer(v118);
        if v120 then
            v113:DoubleCastSkill(v114, {
                Key = Enum.KeyCode.T, 
                SkipTap = true, 
                CompleteFunction = function() --[[ Line: 522 ]] --[[ Name: CompleteFunction ]]
                    -- upvalues: v120 (copy)
                    if v120 then
                        v120:FireServer();
                    end;
                end, 
                PassFunction = function() --[[ Line: 527 ]] --[[ Name: PassFunction ]]
                    return true;
                end
            });
            repeat
                task.wait();
            until v120:IsDescendantOf(game) == false;
        end;
        _G.keysetup:cooldown(v118, v119);
        _G.fw(v119);
        l_Cooldowns_10[v118] = false;
        return;
    end;
end;
return v8;