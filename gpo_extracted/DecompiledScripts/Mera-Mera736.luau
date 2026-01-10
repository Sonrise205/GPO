local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local v7 = setmetatable({}, v3);
v7.__index = v7;
v7.new = function(_) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v7 (copy), l_LocalPlayer_0 (copy)
    local v9 = setmetatable(v3.new(script.Name), v7);
    v9.Cooldowns = {
        Firefly = false, 
        Hiken = false, 
        Flight = false, 
        Pillar = false, 
        Entai = false
    };
    task.spawn(function() --[[ Line: 30 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v9 (copy)
        local l_Humanoid_0 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()).Humanoid;
        v9.fly = {
            Idle = l_Humanoid_0:LoadAnimation(script.Fly.idle), 
            Front = l_Humanoid_0:LoadAnimation(script.Fly.front), 
            Back = l_Humanoid_0:LoadAnimation(script.Fly.back), 
            Left = l_Humanoid_0:LoadAnimation(script.Fly.left), 
            Right = l_Humanoid_0:LoadAnimation(script.Fly.right)
        };
    end);
    return v9;
end;
v7.stopAll = function(v11, v12) --[[ Line: 45 ]] --[[ Name: stopAll ]]
    for v13, v14 in v11.fly do
        if v13 ~= v12 then
            v14:Stop();
        end;
    end;
end;
v7.playAnim = function(v15, v16) --[[ Line: 53 ]] --[[ Name: playAnim ]]
    if v15.fly[v16].IsPlaying == false then
        v15.fly[v16]:Play();
    end;
    v15:stopAll(v16);
end;
v7.Firefly = function(v17, _) --[[ Line: 60 ]] --[[ Name: Firefly ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v17.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.Firefly == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Firefly") == true then
        local v21 = v2.GetM("Firefly");
        local l_cd_0 = v21.cd;
        if _G.StamCheck("Firefly") == false then
            return;
        elseif v21.statreq and _G.MeetReq(v21.statreq) == false then
            return;
        else
            l_Cooldowns_0.Firefly = true;
            _G.canuse = false;
            local v23 = l_Character_0.Humanoid:LoadAnimation(script.firefly);
            v23:Play();
            v23.Priority = Enum.AnimationPriority.Action2;
            local v24 = _G.getTargetNearMouse();
            local l_v17_MouseCFrame_0 = v17:GetMouseCFrame();
            game.ReplicatedStorage.Events.Skill:InvokeServer("Firefly", {
                Target = v24, 
                cf = l_v17_MouseCFrame_0
            });
            task.wait(0.25);
            _G.canuse = true;
            v23:Stop();
            _G.keysetup:cooldown("Firefly", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.Firefly = false;
        end;
    end;
end;
v7.FlamePillar = function(v26, v27) --[[ Line: 94 ]] --[[ Name: FlamePillar ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v26.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.Pillar == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Flame Pillar") == true then
        local v30 = v2.GetM("Flame Pillar");
        local l_cd_1 = v30.cd;
        if _G.StamCheck("Flame Pillar") == false then
            return;
        elseif v30.statreq and _G.MeetReq(v30.statreq) == false then
            return;
        elseif v26.Flying then
            _G.displayMessage("<Color=Red>Cant use flame pillar while flying!");
            return;
        else
            l_Cooldowns_1.Pillar = true;
            _G.canuse = false;
            local v32 = l_Character_1.Humanoid:LoadAnimation(script.pillar);
            v32:Play();
            v32:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Flame Pillar");
            _G.PauseAnim(v32, 0.4, 0.6);
            v26:ChargeSkill(v27, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 123 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                    _G.canuse = false;
                end, 
                EndFunction = function() --[[ Line: 128 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    return not l_Character_1:FindFirstChild("Mera-Mera");
                end
            });
            v32:AdjustSpeed(1);
            spawn(function() --[[ Line: 139 ]]
                -- upvalues: v32 (copy)
                task.wait(0.25);
                v32:AdjustSpeed(0);
            end);
            task.wait(0.2);
            if v33 then
                v33:InvokeServer();
            end;
            v32:AdjustSpeed(1);
            spawn(function() --[[ Line: 148 ]]
                -- upvalues: v32 (copy)
                task.wait(1);
                v32:Stop();
            end);
            l_Character_1.Humanoid.WalkSpeed = 16;
            l_Character_1.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Flame Pillar", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.Pillar = false;
        end;
    end;
end;
v7["DaiEnkai:Entei"] = function(v34, v35) --[[ Line: 162 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v34.Cooldowns;
    local v37 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = v2.GetM("Dai Enkai: Entei").cd;
    if l_Cooldowns_2.Entai == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Dai Enkai: Entei") == true then
        local v40 = v2.GetM("Dai Enkai: Entei");
        local l_cd_3 = v40.cd;
        if _G.StamCheck("Dai Enkai: Entei") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_2.Entai = true;
            _G.canuse = false;
            local v42 = l_Character_2.Humanoid:LoadAnimation(script.enkai);
            v42:Play();
            v42:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v42, 0.5, 1);
            local v43 = tick();
            local v44 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dai Enkai: Entei");
            v34:ChargeSkill(v35, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 189 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 193 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v37 (copy), v43 (copy)
                    if not l_Character_2:FindFirstChild("Mera-Mera") or v37.Stamina.Value <= 0 or tick() - v43 >= 15 or l_Character_2:GetAttribute("meraUltMax") ~= nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v42:AdjustSpeed(1);
            task.wait(0.1);
            _G.FaceMouse = false;
            l_Character_2.HumanoidRootPart.Anchored = true;
            if v44 then
                v44:InvokeServer(v34:GetMousePosition());
            end;
            task.wait(0.25);
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Dai Enkai: Entei", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_2.Entai = false;
        end;
    end;
end;
v7.Hiken = function(v45, v46) --[[ Line: 222 ]] --[[ Name: Hiken ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v45.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.Hiken == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Hiken") == true then
        local v49 = v2.GetM("Hiken");
        local l_cd_4 = v49.cd;
        if _G.StamCheck("Hiken") == false then
            return;
        elseif v49.statreq and _G.MeetReq(v49.statreq) == false then
            return;
        else
            l_Cooldowns_3.Hiken = true;
            _G.canuse = false;
            local v51 = l_Character_3.Humanoid:LoadAnimation(script.hiken);
            v51:Play();
            v51:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v51, 0.4, 2);
            l_Character_3.Humanoid.PlatformStand = true;
            local v52 = tick();
            local v53 = game.ReplicatedStorage.Events.Skill:InvokeServer("Hiken");
            local function v54() --[[ Line: 247 ]] --[[ Name: checkFunction ]]

            end;
            local function v55() --[[ Line: 251 ]] --[[ Name: endFunction ]]
                -- upvalues: l_LocalPlayer_0 (ref), v52 (copy)
                if not l_LocalPlayer_0.Character:FindFirstChild("Mera-Mera") or tick() - v52 >= 10 then
                    return true;
                else
                    return;
                end;
            end;
            v45:ChargeSkill(v46, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = v54, 
                EndFunction = v55
            });
            _G.FaceMouse = false;
            l_Character_3.Humanoid.PlatformStand = false;
            l_Character_3.HumanoidRootPart.Anchored = true;
            v51:AdjustSpeed(1);
            task.wait(0.2);
            if v53 then
                v53:InvokeServer(l_Character_3.PrimaryPart.CFrame);
            end;
            task.wait(0.5);
            l_Character_3.HumanoidRootPart.Anchored = false;
            _G.keysetup:cooldown("Hiken", l_cd_4);
            _G.canuse = true;
            _G.fw(l_cd_4);
            l_Cooldowns_3.Hiken = false;
        end;
    end;
end;
local function v57(v56) --[[ Line: 281 ]] --[[ Name: getLargestAxis ]]
    if math.abs(v56.X) > math.abs(v56.Y) and math.abs(v56.X) > math.abs(v56.Z) then
        return v56.X > 0 and "Right" or "Left", (math.abs(v56.X));
    elseif math.abs(v56.Z) > math.abs(v56.X) and math.abs(v56.Z) > math.abs(v56.Y) then
        return v56.Z > 0 and "Down" or "Up", (math.abs(v56.Z));
    else
        return "None", 0;
    end;
end;
v7.FlameFlight = function(v58, v59) --[[ Line: 292 ]] --[[ Name: FlameFlight ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy), l_RunService_0 (copy), l_l_PlayerModule_0_Controls_0 (copy), v57 (copy)
    local l_Cooldowns_4 = v58.Cooldowns;
    local v61 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local v62 = v2.GetM("Flame Flight");
    local l_cd_5 = v62.cd;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local function v65() --[[ Line: 300 ]] --[[ Name: destroy ]]
        -- upvalues: v58 (copy), l_Character_4 (copy), l_cd_5 (copy), l_Cooldowns_4 (copy)
        if v58.Flying then
            v58.Flying:Disconnect();
            v58.Flying = nil;
        end;
        v58:stopAll();
        l_Character_4.Humanoid.PlatformStand = false;
        v58.flyBG:Destroy();
        v58.flyBV:Destroy();
        if v58.FlyRemote then
            pcall(function() --[[ Line: 312 ]]
                -- upvalues: v58 (ref)
                v58.FlyRemote:InvokeServer();
            end);
            v58.FlyRemote = nil;
        end;
        _G.keysetup:cooldown("Flame Flight", l_cd_5);
        _G.fw(l_cd_5);
        l_Cooldowns_4.Flight = false;
    end;
    if _G.grounded == false and l_Cooldowns_4.Flight == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Flame Flight") == true then
        if _G.StamCheck("Flame Flight") == false then
            return;
        elseif v62.statreq and _G.MeetReq(v62.statreq) == false then
            return;
        else
            l_Cooldowns_4.Flight = true;
            _G.canuse = false;
            local v66 = l_Character_4.Humanoid:LoadAnimation(script.flyactivation);
            v66:Play();
            v66:AdjustSpeed(1);
            v66:AdjustWeight(2);
            l_Character_4.Humanoid.WalkSpeed = 0;
            task.wait(0.4);
            if l_Character_4.HumanoidRootPart:FindFirstChild("ComboBP") == nil then
                local v67 = Instance.new("BodyVelocity", l_Character_4.LowerTorso);
                v67.Name = "geppo";
                v67.MaxForce = Vector3.new(1000000000, 1.0000000272564224E16, 1000000000, 0);
                v67.Velocity = l_Character_4.HumanoidRootPart.CFrame.upVector * 100;
                v67.P = 4324234234;
                _G.destroy(v67, 0.25);
            end;
            v58.FlyRemote = game.ReplicatedStorage.Events.Skill:InvokeServer("Flame Flight");
            task.wait(0.6);
            local v68 = Instance.new("BodyVelocity", l_Character_4.LowerTorso);
            v68.Name = "geppo";
            v68.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            v68.Velocity = Vector3.new();
            local l_BodyGyro_0 = Instance.new("BodyGyro");
            l_BodyGyro_0.P = 100000;
            l_BodyGyro_0.D = 2500;
            l_BodyGyro_0.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            l_Character_4.Humanoid.WalkSpeed = 16;
            l_BodyGyro_0.Parent = l_Character_4.LowerTorso;
            v58.flyBG = l_BodyGyro_0;
            v58.flyBV = v68;
            l_Character_4.Humanoid.PlatformStand = true;
            local v70 = 50;
            do
                local l_v70_0 = v70;
                v58.Flying = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 369 ]]
                    -- upvalues: l_Character_4 (copy), v61 (copy), v58 (copy), l_v70_0 (ref), l_l_PlayerModule_0_Controls_0 (ref), v57 (ref), v68 (copy), l_BodyGyro_0 (copy)
                    if l_Character_4.Parent ~= workspace.PlayerCharacters or v61.Stamina.Value <= 0 or v58.FlyRemote == nil or v58.FlyRemote and v58.FlyRemote.Parent == nil or _G.grounded then
                        return;
                    else
                        if l_Character_4:FindFirstChild("inCombat") == nil then
                            l_v70_0 = 50;
                        else
                            l_v70_0 = 25;
                        end;
                        local l_l_l_PlayerModule_0_Controls_0_MoveVector_0 = l_l_PlayerModule_0_Controls_0:GetMoveVector();
                        local v73 = l_v70_0 * (l_Character_4.Humanoid.Health / l_Character_4.Humanoid.MaxHealth);
                        local v74 = v57(l_l_l_PlayerModule_0_Controls_0_MoveVector_0);
                        local l_CurrentCamera_0 = workspace.CurrentCamera;
                        v68.Velocity = (l_CurrentCamera_0.CFrame.LookVector * -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z * 2 + l_CurrentCamera_0.CFrame.RightVector * l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X) * v73;
                        if _G.FaceMouse == true or l_Character_4:FindFirstChildWhichIsA("ObjectValue") or _G.canuse == false then
                            v68.Velocity = Vector3.new();
                        end;
                        if _G.FaceMouse == true then
                            l_BodyGyro_0.Parent = nil;
                            l_BodyGyro_0.MaxTorque = Vector3.new(0, 0, 0, 0);
                        else
                            if v74 == "Down" then
                                v58:playAnim("Back");
                            elseif v74 == "Left" then
                                v58:playAnim("Left");
                            elseif v74 == "Right" then
                                v58:playAnim("Right");
                            elseif v74 == "Up" then
                                v58:playAnim("Front");
                            elseif v74 == "None" then
                                v58:playAnim("Idle");
                            end;
                            l_BodyGyro_0.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                            l_BodyGyro_0.CFrame = workspace.CurrentCamera.CFrame;
                            l_BodyGyro_0.Parent = l_Character_4.LowerTorso;
                        end;
                        l_Character_4.Humanoid.PlatformStand = true;
                        local l_Tool_0 = l_Character_4:FindFirstChildWhichIsA("Tool");
                        if l_Tool_0 and l_Tool_0 ~= v58.Tool then
                            task.defer(function() --[[ Line: 426 ]]
                                -- upvalues: l_Character_4 (ref)
                                l_Character_4.Humanoid:UnequipTools();
                            end);
                        end;
                        return;
                    end;
                end);
                local v77 = tick();
                v58:DoubleCastSkill(v59, {
                    ToolName = script.Name, 
                    Button = v59, 
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 440 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_Character_4 (copy), v77 (copy), v61 (copy), v58 (copy)
                        if l_Character_4:FindFirstChild("inCombat") and tick() - v77 >= 30 then
                            return true;
                        else
                            local v78 = true;
                            if l_Character_4.Parent == workspace.PlayerCharacters then
                                v78 = true;
                                if v61.Stamina.Value > 0 then
                                    v78 = true;
                                    if v58.FlyRemote ~= nil then
                                        v78 = v58.FlyRemote and v58.FlyRemote:IsDescendantOf(game) == false or _G.grounded;
                                    end;
                                end;
                            end;
                            return v78;
                        end;
                    end, 
                    CompleteFunction = v65, 
                    SkipTap = true
                });
                _G.canuse = true;
            end;
        end;
    end;
end;
return v7;