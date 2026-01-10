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
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        ["Burning Power Mochi"] = false, 
        ["Zigzag Power Pummel"] = false, 
        ["Spiked Donut Roll"] = false, 
        ["Mochi Blitz Barrage"] = false, 
        ["Burning Chestnut Mochi"] = false, 
        ["Burning Mochi Rocket"] = false, 
        ["Supreme Mochi Buzzcut"] = false
    };
    v10.usingChesetnut = false;
    v10.rollingDonut = false;
    return v10;
end;
v8.BurningPowerMochi = function(v11, v12) --[[ Line: 30 ]] --[[ Name: BurningPowerMochi ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0["Burning Power Mochi"] == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Burning Power Mochi") == true and v11.usingChesetnut == false then
        local v16 = v3.GetM("Burning Power Mochi");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Burning Power Mochi") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0["Burning Power Mochi"] = true;
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.punch2);
            v18:Play();
            v18:AdjustWeight(5);
            v18.Priority = Enum.AnimationPriority.Action4;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Burning Power Mochi");
            _G.PauseAnim(v18, 0.217, 0.36);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 60 ]] --[[ Name: endFunction ]]
                    -- upvalues: v11 (copy), l_Character_0 (copy), v15 (copy), v20 (copy)
                    if v11.Tool.Parent ~= l_Character_0 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v15.Stamina.Value <= 0 or tick() - v20 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
            l_Character_0.Humanoid.AutoRotate = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            task.delay(0.45, function() --[[ Line: 76 ]]
                -- upvalues: v18 (copy)
                v18:AdjustSpeed(0);
            end);
            task.wait(0.2);
            l_Character_0.Humanoid.AutoRotate = false;
            if v19 then
                v19:InvokeServer(l_CFrame_0);
            end;
            _G.FaceMouse = false;
            v18:Stop();
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Burning Power Mochi", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0["Burning Power Mochi"] = false;
        end;
    end;
end;
v8.ZigzagPowerPummel = function(v22, _) --[[ Line: 99 ]] --[[ Name: ZigzagPowerPummel ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v22.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1["Zigzag Power Pummel"] == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Zigzag Power Pummel") == true and v22.usingChesetnut == false then
        local v27 = v3.GetM("Zigzag Power Pummel");
        local l_cd_1 = v27.cd;
        if _G.StamCheck("Zigzag Power Pummel") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            l_Cooldowns_1["Zigzag Power Pummel"] = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Zigzag Power Pummel", l_Character_1.PrimaryPart.CFrame);
            _G.canuse = true;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Zigzag Power Pummel", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1["Zigzag Power Pummel"] = false;
        end;
    end;
end;
v8.SpikedDonutRoll = function(v30, v31) --[[ Line: 128 ]] --[[ Name: SpikedDonutRoll ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v30.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v34 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2["Spiked Donut Roll"] == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Spiked Donut Roll") == true and v30.usingChesetnut == false then
        local v35 = v3.GetM("Spiked Donut Roll");
        local l_cd_2 = v35.cd;
        if _G.StamCheck("Spiked Donut Roll") == false then
            return;
        elseif v35.statreq and _G.MeetReq(v35.statreq) == false then
            return;
        else
            l_Cooldowns_2["Spiked Donut Roll"] = true;
            local _ = workspace.CurrentCamera;
            local v38 = l_Character_2.Humanoid:LoadAnimation(script.wheelStart);
            v38:Play(0);
            v38:AdjustSpeed(1.35);
            v38:AdjustWeight(2);
            _G.allowJumpWhileStunned = true;
            _G.canuse = false;
            l_Character_2.Humanoid.AutoRotate = false;
            task.wait(0.2);
            local v39 = game.ReplicatedStorage.Events.Skill:InvokeServer("Spiked Donut Roll");
            if v39 then
                v30.rollingDonut = true;
            end;
            local v40 = tick();
            local v41 = false;
            do
                local l_v41_0 = v41;
                v30:DoubleCastSkill(v31, {
                    ToolName = script.Name, 
                    Button = v31, 
                    Key = Enum.KeyCode.T, 
                    IgnoreInstantCastSetting = true, 
                    CheckFunction = function() --[[ Line: 167 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_Character_2 (copy), l_v41_0 (ref), v40 (copy), v30 (copy), v34 (copy)
                        l_Character_2.Humanoid.WalkSpeed = 0;
                        l_Character_2.Humanoid.AutoRotate = false;
                        if l_Character_2:GetAttribute("usingSupremeBuzzcut") == true then
                            l_v41_0 = true;
                        end;
                        _G.allowJumpWhileStunned = true;
                        if tick() - v40 >= 10 or l_Character_2:GetAttribute("spikedMochiRolling") == nil or v30.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_v41_0 == true or l_Character_2.Parent ~= workspace.PlayerCharacters or v34.Stamina.Value <= 0 or _G.check:inspect(l_Character_2) == false and l_Character_2:FindFirstChild("GrabTag") == nil or l_Character_2:FindFirstChild("PB") then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    CompleteFunction = function() --[[ Line: 180 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: v39 (copy), l_v41_0 (ref), l_Character_2 (copy), v30 (copy), l_cd_2 (copy), l_Cooldowns_2 (copy)
                        if v39 then
                            v39:FireServer(l_v41_0);
                        end;
                        if l_Character_2:GetAttribute("usingSupremeBuzzcut") == nil then
                            local v43 = l_Character_2.Humanoid:LoadAnimation(script.wheelEnd);
                            v43:Play(0);
                            v43:AdjustWeight(2);
                        end;
                        v30.rollingDonut = false;
                        local _ = tick();
                        task.wait(0.75);
                        _G.allowJumpWhileStunned = nil;
                        if l_Character_2:GetAttribute("usingSupremeBuzzcut") == nil then
                            _G.canuse = true;
                        end;
                        l_Character_2.Humanoid.AutoRotate = true;
                        l_Character_2.Humanoid.WalkSpeed = 16;
                        _G.keysetup:cooldown("Spiked Donut Roll", l_cd_2);
                        _G.fw(l_cd_2);
                        l_Cooldowns_2["Spiked Donut Roll"] = false;
                    end, 
                    PassFunction = function() --[[ Line: 210 ]] --[[ Name: PassFunction ]]
                        return true;
                    end, 
                    SkipTap = true
                });
            end;
        end;
    end;
end;
v8.MochiBlitzBarrage = function(v45, v46) --[[ Line: 219 ]] --[[ Name: MochiBlitzBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v45.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v49 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3["Mochi Blitz Barrage"] == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Mochi Blitz Barrage") == true and v45.usingChesetnut == false then
        local v50 = v3.GetM("Mochi Blitz Barrage");
        local l_cd_3 = v50.cd;
        if _G.StamCheck("Mochi Blitz Barrage") == false then
            return;
        elseif v50.statreq and _G.MeetReq(v50.statreq) == false then
            return;
        else
            local v52 = tick();
            local v53 = tick();
            _G.canuse = false;
            do
                local l_v53_0 = v53;
                v45:ChargeSkill(v46, {
                    Key = Enum.KeyCode.E, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 245 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_v53_0 (ref), v52 (copy)
                        l_v53_0 = tick() - v52;
                        return l_v53_0 > 0.2;
                    end, 
                    canUse = false
                });
                local v55 = nil;
                if tick() - v52 < 0.2 then
                    v55 = true;
                    warn("long range", tick() - v52, 0.2);
                else
                    warn("close range");
                end;
                l_Cooldowns_3["Mochi Blitz Barrage"] = true;
                local v56 = nil;
                if v55 == nil then
                    v56 = l_Character_3.Humanoid:LoadAnimation(script.barrage);
                    v56:Play();
                    v56:AdjustSpeed(2);
                else
                    v56 = l_Character_3.Humanoid:LoadAnimation(script.barragelong);
                    v56:Play();
                    v56:AdjustWeight(2);
                    v56:AdjustSpeed(2);
                    task.wait(0.375);
                end;
                local v57 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mochi Blitz Barrage", {
                    MousePosition = v45:GetMouseCFrame(), 
                    longRange = v55
                });
                if v55 == nil then
                    local v58 = nil;
                    local v59 = nil;
                    if v57 then
                        local v60, v61 = unpack(v57);
                        v58 = v60;
                        v59 = v61;
                    end;
                    local v62 = tick();
                    local v63 = 0;
                    do
                        local l_v58_0, l_v63_0 = v58, v63;
                        local function v69(_, _) --[[ Line: 288 ]] --[[ Name: endFunction ]]
                            -- upvalues: v45 (copy), l_Character_3 (copy), v49 (copy), v62 (copy), l_v58_0 (ref), l_v63_0 (ref)
                            if v45.Tool.Parent ~= l_Character_3 or l_Character_3.Humanoid:GetAttribute("isRagdolled") == true or _G.check:inspect(l_Character_3) == false or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v49.Stamina.Value <= 0 or tick() - v62 >= 3 or l_Character_3:FindFirstChild("PB") then
                                return true;
                            else
                                l_Character_3.Humanoid.WalkSpeed = 4;
                                local l_p_0 = v45:GetMouseCFrame().p;
                                l_Character_3.Humanoid.Jump = false;
                                l_Character_3.Humanoid.AutoRotate = false;
                                l_Character_3.PrimaryPart.CFrame = l_Character_3.PrimaryPart.CFrame:Lerp(CFrame.new(l_Character_3.PrimaryPart.Position, (Vector3.new(l_p_0.X, l_Character_3.PrimaryPart.Position.Y, l_p_0.Z))), 0.5);
                                if l_v58_0 and tick() - l_v63_0 >= 0.05 then
                                    l_v58_0:FireServer(l_p_0);
                                    l_v63_0 = tick();
                                end;
                                return;
                            end;
                        end;
                        v45:ChargeSkill(v46, {
                            Key = Enum.KeyCode.E, 
                            EndFunction = v69, 
                            IgnoreInstantCastSetting = true, 
                            RunServiceType = game["Run Service"].Stepped
                        });
                        v56:Stop();
                        l_Character_3.HumanoidRootPart.Anchored = true;
                        if l_v58_0 then
                            local v70 = nil;
                            local l_CFrame_1 = l_Character_3.PrimaryPart.CFrame;
                            l_v58_0:FireServer(v70, l_CFrame_1);
                        end;
                        if v59 then
                            v59:InvokeServer();
                        end;
                    end;
                else
                    v56:AdjustSpeed(0.25);
                end;
                l_Character_3.Humanoid.AutoRotate = true;
                l_Character_3.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Mochi Blitz Barrage", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3["Mochi Blitz Barrage"] = false;
            end;
        end;
    end;
end;
v8.BurningChestnutMochi = function(v72, v73) --[[ Line: 336 ]] --[[ Name: BurningChestnutMochi ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v72.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v76 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4["Burning Chestnut Mochi"] == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Burning Chestnut Mochi") == true and v72.usingChesetnut == false then
        local v77 = v3.GetM("Burning Chestnut Mochi");
        local l_cd_4 = v77.cd;
        if _G.StamCheck("Burning Chestnut Mochi") == false then
            return;
        elseif v77.statreq and _G.MeetReq(v77.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v79 = tick();
            local v80 = tick();
            _G.canuse = false;
            do
                local l_v80_0 = v80;
                v72:ChargeSkill(v73, {
                    Key = Enum.KeyCode.Z, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 362 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_v80_0 (ref), v79 (copy)
                        l_v80_0 = tick() - v79;
                        return l_v80_0 > 0.25;
                    end, 
                    canUse = false
                });
                local v82 = nil;
                if tick() - v79 < 0.25 then
                    v82 = true;
                end;
                l_Cooldowns_4["Burning Chestnut Mochi"] = true;
                l_Character_4.Humanoid:LoadAnimation(script.chestnutStart):Play(0);
                local v83 = game.ReplicatedStorage.Events.Skill:InvokeServer("Burning Chestnut Mochi", {
                    MousePosition = v72:GetMouseCFrame(), 
                    tappedVersion = v82
                });
                task.wait(1.75);
                _G.canuse = true;
                local v84 = tick();
                local v85 = 0;
                local function v89(_, _) --[[ Line: 389 ]] --[[ Name: endFunction ]]
                    -- upvalues: v72 (copy), l_Character_4 (copy), v76 (copy), v84 (copy), v83 (copy), v85 (ref)
                    if v72.Tool.Parent ~= l_Character_4 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v76.Stamina.Value <= 0 or tick() - v84 >= 5 or l_Character_4:FindFirstChild("PB") then
                        return true;
                    else
                        local l_p_1 = v72:GetMouseCFrame().p;
                        if v83 and tick() - v85 >= 0.05 then
                            v83:FireServer(l_p_1);
                            v85 = tick();
                        end;
                        return;
                    end;
                end;
                v72.usingChesetnut = true;
                if v82 == nil then
                    v72:ChargeSkill(v73, {
                        Key = Enum.KeyCode.Z, 
                        EndFunction = v89, 
                        IgnoreInstantCastSetting = true, 
                        RunServiceType = game["Run Service"].Stepped, 
                        canUse = false
                    });
                else
                    repeat
                        task.wait();
                    until v89() == true;
                end;
                v72.usingChesetnut = false;
                l_Character_4.HumanoidRootPart.Anchored = true;
                if v83 then
                    v83:FireServer(nil, l_Character_4.PrimaryPart.CFrame);
                end;
                l_Character_4.HumanoidRootPart.Anchored = false;
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Burning Chestnut Mochi", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4["Burning Chestnut Mochi"] = false;
            end;
        end;
    end;
end;
v8.BurningMochiRocket = function(v90, v91) --[[ Line: 436 ]] --[[ Name: BurningMochiRocket ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v90.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v94 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5["Burning Mochi Rocket"] == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Burning Mochi Rocket") == true and v90.usingChesetnut == false then
        local v95 = v3.GetM("Burning Mochi Rocket");
        local l_cd_5 = v95.cd;
        if _G.StamCheck("Burning Mochi Rocket") == false then
            return;
        elseif v95.statreq and _G.MeetReq(v95.statreq) == false then
            return;
        else
            l_Cooldowns_5["Burning Mochi Rocket"] = true;
            _G.canuse = false;
            local v97 = game.ReplicatedStorage.Events.Skill:InvokeServer("Burning Mochi Rocket");
            local v98 = l_Character_5.Humanoid:LoadAnimation(script.punch3);
            v98:Play(0);
            v98:AdjustWeight(5);
            v98.Priority = Enum.AnimationPriority.Action4;
            l_Character_5.Humanoid.WalkSpeed = 4;
            _G.FaceMouse = true;
            _G.PauseAnim(v98, 0.15, 0.8);
            local v99 = tick();
            v90:ChargeSkill(v91, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 467 ]] --[[ Name: endFunction ]]
                    -- upvalues: v90 (copy), l_Character_5 (copy), v94 (copy), v99 (copy)
                    if v90.Tool.Parent ~= l_Character_5 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v94.Stamina.Value <= 0 or tick() - v99 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v98:AdjustSpeed(1);
            local _ = l_Character_5.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5);
            _G.FaceMouse = false;
            l_Character_5.HumanoidRootPart.Anchored = true;
            l_Character_5.Humanoid.AutoRotate = false;
            if v97 then
                v97:InvokeServer(v90:GetMouseCFrame(), l_Character_5.PrimaryPart.CFrame, workspace:GetServerTimeNow() + 0.5499999999999999);
            end;
            l_Character_5.Humanoid.AutoRotate = true;
            l_Character_5.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Burning Mochi Rocket", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5["Burning Mochi Rocket"] = false;
        end;
    end;
end;
v8.SupremeMochiBuzzcut = function(v101, v102) --[[ Line: 500 ]] --[[ Name: SupremeMochiBuzzcut ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_6 = v101.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v105 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_6["Supreme Mochi Buzzcut"] == false and (_G.check:inspect(l_Character_6) == true or l_Character_6:GetAttribute("spikedMochiRolling") == true) and _G.StamCheck("Supreme Mochi Buzzcut", true) == true and v101.usingChesetnut == false then
        local v106 = v3.GetM("Supreme Mochi Buzzcut");
        local l_cd_6 = v106.cd;
        if _G.StamCheck("Supreme Mochi Buzzcut", true) == false then
            return;
        elseif v106.statreq and _G.MeetReq(v106.statreq) == false then
            return;
        else
            l_Cooldowns_6["Supreme Mochi Buzzcut"] = true;
            l_Character_6.Humanoid.WalkSpeed = 4;
            _G.canuse = false;
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            l_CurrentCamera_1.CameraSubject = l_Character_6.UpperTorso;
            l_Character_6:SetAttribute("usingSupremeBuzzcut", true);
            local v109 = game.ReplicatedStorage.Events.Skill:InvokeServer("Supreme Mochi Buzzcut");
            local v110 = tick();
            v101:ChargeSkill(v102, {
                Key = Enum.KeyCode.C, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 525 ]] --[[ Name: endFunction ]]
                    -- upvalues: v101 (copy), l_Character_6 (copy), v105 (copy), v110 (copy)
                    if v101.Tool.Parent ~= l_Character_6 or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v105.Stamina.Value <= 0 or tick() - v110 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            if v109 then
                v109:InvokeServer();
            end;
            l_Character_6:SetAttribute("usingSupremeBuzzcut", nil);
            l_CurrentCamera_1.CameraSubject = l_Character_6.Humanoid;
            l_Character_6.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            l_Character_6.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Supreme Mochi Buzzcut", l_cd_6);
            _G.fw(l_cd_6);
            l_Cooldowns_6["Supreme Mochi Buzzcut"] = false;
        end;
    end;
end;
return v8;