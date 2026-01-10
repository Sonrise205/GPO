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
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        transform = false, 
        plamStrike = false, 
        heavShock = false, 
        risingFist = false, 
        impactLeap = false, 
        impactFloor = false, 
        light = false, 
        ult = false, 
        spineBreaker = false, 
        fullGrab = false
    };
    v10.InFormBool = false;
    v10.fullFormMode = false;
    local l_Character_0 = l_LocalPlayer_0.Character;
    v10.Anims = {
        Walk = l_Character_0.Humanoid.Animator:LoadAnimation(script.Walk), 
        Idle = l_Character_0.Humanoid.Animator:LoadAnimation(script.Idle)
    };
    local l_Idle_0 = v10.Anims.Idle;
    local l_Walk_0 = v10.Anims.Walk;
    l_Idle_0.Priority = Enum.AnimationPriority.Action;
    l_Walk_0.Priority = Enum.AnimationPriority.Action;
    l_Walk_0.KeyframeReached:Connect(function(v14) --[[ Line: 40 ]]
        -- upvalues: l_Character_0 (copy), v10 (copy)
        local l_RightFoot_0 = l_Character_0.RightFoot;
        if v14 == "buddhaStompLeft" then
            l_RightFoot_0 = l_Character_0.LeftFoot;
        end;
        if _G.canuse == false or _G.check:inspect(l_Character_0) == false or _G.blocking == true or _G.instantDash == false then
            return;
        else
            v10.Tool.stomp:FireServer(l_RightFoot_0.CFrame);
            return;
        end;
    end);
    v10.HeartbeatConnection = game["Run Service"].RenderStepped:Connect(function() --[[ Line: 51 ]]
        -- upvalues: v10 (copy), l_Character_0 (copy), l_Walk_0 (copy), l_Idle_0 (copy)
        v10.fullFormMode = l_Character_0:GetAttribute("BeastType") == "Full";
        local l_InFormBool_0 = v10.InFormBool;
        local l_fullFormMode_0 = v10.fullFormMode;
        if l_InFormBool_0 == true and l_fullFormMode_0 == true then
            _G.toolLocked = v10.Tool;
            local l_Tool_0 = l_Character_0:FindFirstChildWhichIsA("Tool");
            if l_Tool_0 and l_Tool_0 ~= v10.Tool then
                task.defer(function() --[[ Line: 60 ]]
                    -- upvalues: l_Character_0 (ref)
                    l_Character_0.Humanoid:UnequipTools();
                end);
            end;
        elseif _G.toolLocked == v10.Tool then
            _G.toolLocked = nil;
        end;
        if l_fullFormMode_0 == true and l_InFormBool_0 == true then
            if l_Character_0.Humanoid.MoveDirection ~= Vector3.new() and l_Character_0.Humanoid.FloorMaterial ~= Enum.Material.Air then
                if l_Walk_0.IsPlaying == false then
                    l_Walk_0:Play();
                end;
                if l_Idle_0.IsPlaying == true then
                    l_Idle_0:Stop();
                    return;
                end;
            elseif l_Character_0.Humanoid.FloorMaterial ~= Enum.Material.Air then
                if l_Walk_0.IsPlaying == true then
                    l_Walk_0:Stop();
                end;
                if l_Idle_0.IsPlaying == false then
                    l_Idle_0:Play();
                    return;
                end;
            else
                if l_Walk_0.IsPlaying == true then
                    l_Walk_0:Stop();
                end;
                if l_Idle_0.IsPlaying == true then
                    l_Idle_0:Stop();
                    return;
                end;
            end;
        else
            if l_Walk_0.IsPlaying == true then
                l_Walk_0:Stop();
            end;
            if l_Idle_0.IsPlaying == true then
                l_Idle_0:Stop();
            end;
        end;
    end);
    l_Character_0:GetAttributeChangedSignal("InForm"):Connect(function() --[[ Line: 104 ]]
        -- upvalues: v10 (copy), l_Character_0 (copy)
        v10.InFormBool = l_Character_0:GetAttribute("InForm");
    end);
    return v10;
end;
v8.BuddhaTransformation = function(v19, v20) --[[ Line: 115 ]] --[[ Name: BuddhaTransformation ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.transform == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Buddha Transformation") == true then
        local v24 = v3.GetM("Buddha Transformation");
        local l_cd_0 = v24.cd;
        if _G.StamCheck("Buddha Transformation") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            local v26 = 0;
            if l_Character_1:GetAttribute("buddhaDamage") then
                v26 = math.ceil((l_Character_1:GetAttribute("buddhaDamage")));
            end;
            if l_Character_1:FindFirstChild("Aura") == nil and v26 < require(game.ReplicatedStorage.Modules.Skills.Modes.Buddha)(l_LocalPlayer_0) * 0.2 then
                _G.displayMessage("<Color=/>I need <Color=Yellow>20%<Color=/> Karma for half mode.");
                return;
            else
                l_Cooldowns_0.transform = true;
                _G.canuse = false;
                local v27 = tick();
                local v28 = tick();
                do
                    local l_v28_0 = v28;
                    v19:ChargeSkill(v20, {
                        Key = Enum.KeyCode.T, 
                        IgnoreInstantCastSetting = true, 
                        EndFunction = function() --[[ Line: 153 ]] --[[ Name: EndFunction ]]
                            -- upvalues: l_v28_0 (ref), v27 (copy)
                            l_v28_0 = tick() - v27;
                            return l_v28_0 > 1;
                        end
                    });
                    local v30 = l_v28_0 > 1;
                    local v31 = true;
                    if v30 == true then
                        if v26 < require(game.ReplicatedStorage.Modules.Skills.Modes.Buddha)(l_LocalPlayer_0) * v19.Tool:GetAttribute("modePercent") then
                            v30 = false;
                            _G.displayMessage((("<Color=/>I need <Color=Yellow>%*%%<Color=/> Karma for full mode."):format(v19.Tool:GetAttribute("modePercent") * 100)));
                            v31 = false;
                        else
                            local v32, _, _ = _G.getRayFloor(l_Character_1.PrimaryPart.CFrame, -75);
                            if v32 then
                                _G.displayMessage("I cant transform here, ceiling is too low!");
                                v31 = false;
                            end;
                        end;
                    end;
                    if v31 == true then
                        game.ReplicatedStorage.Events.Skill:InvokeServer("Buddha Transformation", {
                            v30, 
                            l_Character_1.PrimaryPart.CFrame
                        });
                    end;
                    task.wait(0.5);
                    _G.canuse = true;
                    _G.keysetup:cooldown("Buddha Transformation", l_cd_0);
                    _G.fw(l_cd_0);
                    l_Cooldowns_0.transform = false;
                end;
            end;
        end;
    end;
end;
v8.BuddhaESkill = function(v35, v36) --[[ Line: 187 ]] --[[ Name: BuddhaESkill ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v35.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v39 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_2) == true then
        local v40 = "Palm Strike";
        local v41 = "plamStrike";
        v35.InFormBool = l_Character_2:GetAttribute("InForm");
        if v35.InFormBool == true then
            v40 = "Heavenly Shockwave";
            v41 = "heavShock";
        end;
        if l_Cooldowns_1[v41] == true then
            return;
        else
            local v42 = v3.GetM(v40);
            local l_cd_1 = v42.cd;
            if _G.StamCheck(v40) == false then
                return;
            elseif v42.statreq and _G.MeetReq(v42.statreq) == false then
                return;
            else
                _G.canuse = false;
                local v44 = game.ReplicatedStorage.Events.Skill:InvokeServer(v40, {
                    cf = v35:GetMouseCFrame()
                });
                if v44 == nil then
                    _G.canuse = true;
                    return;
                else
                    l_Cooldowns_1[v41] = true;
                    _G.canuse = false;
                    _G.FaceMouse = true;
                    local v45 = nil;
                    v45 = l_Character_2.Humanoid:LoadAnimation(script.Base.strike);
                    v45:Play();
                    v45:AdjustWeight(2);
                    v45.Priority = Enum.AnimationPriority.Action4;
                    _G.PauseAnim(v45, 0.4, 1);
                    local v46 = tick();
                    local function _() --[[ Line: 242 ]] --[[ Name: checkFunction ]]

                    end;
                    v35:ChargeSkill(v36, {
                        Key = Enum.KeyCode.E, 
                        EndFunction = function() --[[ Line: 245 ]] --[[ Name: endFunction ]]
                            -- upvalues: v46 (copy), v35 (copy), l_Character_2 (copy), v39 (copy)
                            if tick() - v46 >= 10 or v35.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v39.Stamina.Value <= 0 then
                                return true;
                            else
                                return;
                            end;
                        end
                    });
                    l_Character_2.HumanoidRootPart.Anchored = true;
                    _G.FaceMouse = false;
                    if v45 then
                        v45:AdjustSpeed(1);
                    end;
                    l_Character_2.Humanoid.AutoRotate = false;
                    l_Character_2.HumanoidRootPart.Anchored = true;
                    task.wait(0.1);
                    if v44 then
                        v44:FireServer(l_Character_2.HumanoidRootPart.CFrame);
                    end;
                    task.wait(0.7);
                    l_Character_2.Humanoid.AutoRotate = true;
                    l_Character_2.HumanoidRootPart.Anchored = false;
                    _G.canuse = true;
                    _G.keysetup:cooldown(v40, l_cd_1);
                    _G.fw(l_cd_1);
                    l_Cooldowns_1[v41] = false;
                end;
            end;
        end;
    end;
end;
v8.JudgementImpact = function(v48, v49) --[[ Line: 278 ]] --[[ Name: JudgementImpact ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v48.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v52 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v48.InFormBool == false and l_Cooldowns_2.risingFist == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Judgement Impact") == true then
        local v53 = v3.GetM("Judgement Impact");
        local l_cd_2 = v53.cd;
        if _G.StamCheck("Judgement Impact") == false then
            return;
        elseif v53.statreq and _G.MeetReq(v53.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_2.risingFist = true;
            local v55 = game.ReplicatedStorage.Events.Skill:InvokeServer("Judgement Impact", {
                cf = v48:GetMouseCFrame()
            });
            local v56 = tick();
            v48:ChargeSkill(v49, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 303 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 50;
                end, 
                EndFunction = function() --[[ Line: 307 ]] --[[ Name: endFunction ]]
                    -- upvalues: v56 (copy), v48 (copy), l_Character_3 (copy), v52 (copy)
                    if tick() - v56 >= 1 or v48.Tool.Parent ~= l_Character_3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v52.Stamina.Value <= 0 or _G.check:inspect(l_Character_3) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_3.Humanoid.WalkSpeed = 16;
            if v55 then
                v55:FireServer(l_Character_3.HumanoidRootPart.CFrame);
            end;
            task.wait(0.5);
            _G.canuse = true;
            _G.keysetup:cooldown("Judgement Impact", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.risingFist = false;
        end;
    end;
end;
v8.BuddhaRSkill = function(v57, v58) --[[ Line: 334 ]] --[[ Name: BuddhaRSkill ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v57.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v61 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v57.InFormBool == true then
        local v62 = "Heaven-sent Impact Leap";
        local v63 = "impactLeap";
        v57.InFormBool = l_Character_4:GetAttribute("InForm");
        if v57.fullFormMode == true then
            v62 = "Heaven-sent Impact";
            v63 = "impactFloor";
        end;
        if l_Cooldowns_3[v63] == true then
            return;
        else
            local v64 = v3.GetM(v62);
            local l_cd_3 = v64.cd;
            if _G.StamCheck(v62) == false then
                return;
            elseif v64.statreq and _G.MeetReq(v64.statreq) == false then
                return;
            else
                _G.canuse = false;
                local v66 = game.ReplicatedStorage.Events.Skill:InvokeServer(v62, {
                    cf = v57:GetMouseCFrame()
                });
                if v66 == nil then
                    _G.canuse = true;
                    return;
                else
                    l_Cooldowns_3[v63] = true;
                    _G.canuse = false;
                    _G.FaceMouse = true;
                    local v67 = nil;
                    if v57.fullFormMode == false then
                        v67 = l_Character_4.Humanoid:LoadAnimation(script.Half.leapCharge);
                        v67:Play();
                        v67.Priority = Enum.AnimationPriority.Action4;
                    else
                        v67 = l_Character_4.Humanoid:LoadAnimation(script.Full.shockwave);
                        v67:Play();
                        v67.Priority = Enum.AnimationPriority.Action4;
                        _G.mouseLevel = true;
                        _G.PauseAnim(v67, 0.1, 1);
                    end;
                    local v68 = tick();
                    v57:ChargeSkill(v58, {
                        Key = Enum.KeyCode.R, 
                        EndFunction = function() --[[ Line: 394 ]] --[[ Name: endFunction ]]
                            -- upvalues: v68 (copy), v57 (copy), l_Character_4 (copy), v61 (copy)
                            if tick() - v68 >= 10 or v57.Tool.Parent ~= l_Character_4 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v61.Stamina.Value <= 0 then
                                return true;
                            else
                                return;
                            end;
                        end
                    });
                    _G.FaceMouse = false;
                    if v66 then
                        if v57.fullFormMode == false then
                            v67:Stop();
                            local v69 = false;
                            local v70 = l_Character_4.Humanoid:LoadAnimation(script.Half.leapLoop);
                            v70:Play();
                            v70.Priority = Enum.AnimationPriority.Action4;
                            do
                                local l_v69_0 = v69;
                                task.delay(1, function() --[[ Line: 419 ]]
                                    -- upvalues: l_v69_0 (ref), v67 (ref)
                                    if l_v69_0 == false then
                                        v67:AdjustSpeed(0);
                                    end;
                                end);
                                l_Character_4:SetAttribute("impactLeapLand", nil);
                                l_Character_4.PrimaryPart.Anchored = true;
                                l_Character_4:PivotTo(CFrame.new(l_Character_4.PrimaryPart.Position, v57:GetMouseCFrame().p));
                                v66:FireServer(l_Character_4.HumanoidRootPart.CFrame, v57:GetMouseCFrame());
                                l_Character_4.HumanoidRootPart.Anchored = false;
                                repeat
                                    task.wait();
                                until l_Character_4:GetAttribute("impactLeapLand") ~= nil;
                                l_v69_0 = true;
                                v70:Stop();
                                task.wait(0.9);
                                l_Character_4.HumanoidRootPart.Anchored = false;
                            end;
                        else
                            v67:AdjustSpeed(1);
                            _G.mouseLevel = nil;
                            l_Character_4.PrimaryPart.Anchored = true;
                            v66:FireServer(l_Character_4.HumanoidRootPart.CFrame, v57:GetMouseCFrame());
                            task.wait(2.1);
                            l_Character_4.PrimaryPart.Anchored = false;
                        end;
                    else
                        v67:AdjustSpeed(1);
                    end;
                    _G.canuse = true;
                    _G.keysetup:cooldown(v62, l_cd_3);
                    _G.fw(l_cd_3);
                    l_Cooldowns_3[v63] = false;
                    return;
                end;
            end;
        end;
    else
        v57:JudgementImpact(v58);
        return;
    end;
end;
v8.Enlightenment = function(v72, v73) --[[ Line: 460 ]] --[[ Name: Enlightenment ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v72.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v76 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v72.InFormBool == true and l_Cooldowns_4.light == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Enlightenment") == true then
        local v77 = v3.GetM("Enlightenment");
        local l_cd_4 = v77.cd;
        if _G.StamCheck("Enlightenment") == false then
            return;
        elseif v77.statreq and _G.MeetReq(v77.statreq) == false then
            return;
        else
            local v79 = game.ReplicatedStorage.Events.Skill:InvokeServer("Enlightenment", {
                cf = v72:GetMouseCFrame()
            });
            _G.canuse = false;
            l_Cooldowns_4.light = true;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v80 = tick();
            v72:ChargeSkill(v73, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 487 ]] --[[ Name: endFunction ]]
                    -- upvalues: v80 (copy), v72 (copy), l_Character_5 (copy), v76 (copy)
                    if tick() - v80 >= 3 or v72.Tool.Parent ~= l_Character_5 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v76.Stamina.Value <= 0 or _G.check:inspect(l_Character_5) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.FaceMouse = false;
            _G.mouseLevel = nil;
            l_Character_5.PrimaryPart.Anchored = true;
            if v79 then
                v79:FireServer(l_Character_5.HumanoidRootPart.CFrame);
            end;
            task.wait(1);
            _G.canuse = true;
            _G.keysetup:cooldown("Enlightenment", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.light = false;
        end;
    end;
end;
v8.DivineRetribution = function(v81, v82) --[[ Line: 514 ]] --[[ Name: DivineRetribution ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v81.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v85 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.ult == false and _G.check:inspect(l_Character_6) == true and _G.StamCheck("Divine Retribution") == true then
        local v86 = v3.GetM("Divine Retribution");
        local l_cd_5 = v86.cd;
        if v81.fullFormMode == false then
            _G.displayMessage("<Color=Red>I need to be in full form to use this.");
            return;
        elseif _G.StamCheck("Divine Retribution") == false then
            return;
        elseif v86.statreq and _G.MeetReq(v86.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_5.ult = true;
            l_Character_6.PrimaryPart.Anchored = true;
            local v88 = game.ReplicatedStorage.Events.Skill:InvokeServer("Divine Retribution", {
                cf = v81:GetMouseCFrame()
            });
            local v89 = tick();
            local function v90() --[[ Line: 546 ]] --[[ Name: endFunction ]]
                -- upvalues: v89 (copy), v81 (copy), l_Character_6 (copy), v85 (copy)
                if tick() - v89 >= 10 or v81.Tool.Parent ~= l_Character_6 or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v85.Stamina.Value <= 0 then
                    return true;
                else
                    return;
                end;
            end;
            task.wait(1.26);
            _G.FaceMouse = true;
            l_Character_6.PrimaryPart.Anchored = false;
            v81:ChargeSkill(v82, {
                Key = Enum.KeyCode.C, 
                EndFunction = v90, 
                IgnoreInstantCastSetting = true
            });
            _G.FaceMouse = false;
            l_Character_6.PrimaryPart.Anchored = true;
            l_Character_6.Humanoid.WalkSpeed = 16;
            if v88 then
                v88:FireServer(l_Character_6.HumanoidRootPart.CFrame, v81:GetMouseCFrame());
            end;
            task.wait(1.25);
            l_Character_6.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Divine Retribution", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.ult = false;
        end;
    end;
end;
v8.BuddhaZSkill = function(v91, v92) --[[ Line: 581 ]] --[[ Name: BuddhaZSkill ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_6 = v91.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local v95 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_7) == true then
        local v96 = "Spine Breaker";
        local v97 = "spineBreaker";
        if v91.fullFormMode == true then
            v96 = "Heaven Fall";
            v97 = "fullGrab";
        end;
        if l_Cooldowns_6[v97] == true then
            return;
        else
            local v98 = v3.GetM(v96);
            local l_cd_6 = v98.cd;
            if _G.StamCheck(v96) == false then
                return;
            elseif v98.statreq and _G.MeetReq(v98.statreq) == false then
                return;
            else
                _G.canuse = false;
                l_Cooldowns_6[v97] = true;
                local v100 = nil;
                if v91.fullFormMode == false then
                    v100 = l_Character_7.Humanoid:LoadAnimation(script.grab);
                    v100:Play();
                    v100:AdjustWeight(2);
                else
                    v100 = l_Character_7.Humanoid:LoadAnimation(script.grabFull);
                    v100:Play();
                    v100:AdjustWeight(2);
                end;
                _G.canuse = false;
                l_Character_7.Humanoid.WalkSpeed = 4;
                local v101 = nil;
                if v91.fullFormMode == false then
                    _G.PauseAnim(v100, 0.1, 1.2);
                else
                    v101 = game.ReplicatedStorage.Events.Skill:InvokeServer(v96, {
                        cf = l_Character_7.HumanoidRootPart.CFrame
                    });
                    _G.PauseAnim(v100, 0.18, 1.2);
                end;
                local v102 = tick();
                v91:ChargeSkill(v92, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = function() --[[ Line: 634 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_7 (copy)
                        l_Character_7.Humanoid.WalkSpeed = 4;
                    end, 
                    EndFunction = function() --[[ Line: 638 ]] --[[ Name: endFunction ]]
                        -- upvalues: v102 (copy), v91 (copy), l_Character_7 (copy), v95 (copy)
                        if tick() - v102 >= 10 or v91.Tool.Parent ~= l_Character_7 or l_Character_7.Parent == nil or l_Character_7.Parent ~= workspace.PlayerCharacters or v95.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                if v101 then
                    v101:FireServer(l_Character_7.PrimaryPart.CFrame);
                    v100:AdjustSpeed(1);
                elseif v91.fullFormMode == false then
                    v100:AdjustSpeed(1);
                    game.ReplicatedStorage.Events.Skill:InvokeServer(v96, {
                        cf = l_Character_7.HumanoidRootPart.CFrame
                    });
                end;
                l_Character_7.Humanoid.WalkSpeed = 16;
                task.wait(0.36);
                _G.canuse = true;
                _G.keysetup:cooldown(v96, l_cd_6);
                _G.fw(l_cd_6);
                l_Cooldowns_6[v97] = false;
            end;
        end;
    end;
end;
v8.PalmStrike = v8.BuddhaESkill;
v8.HeavenlyShockwave = v8.BuddhaESkill;
v8["Heaven-sentImpactLeap"] = v8.BuddhaRSkill;
v8["Heaven-sentImpact"] = v8.BuddhaRSkill;
v8.SpineBreaker = v8.BuddhaZSkill;
v8.HeavenFall = v8.BuddhaZSkill;
return v8;