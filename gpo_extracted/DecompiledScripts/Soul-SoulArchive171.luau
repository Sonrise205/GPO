local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local _ = Random.new();
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v10 = setmetatable({}, v4);
v10.__index = v10;
v10.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v10 (copy), l_LocalPlayer_0 (copy)
    local v12 = setmetatable(v4.new(script.Name), v10);
    v12.Cooldowns = {
        SoulSwap = false, 
        HungerRage = false, 
        SunRay = false, 
        BonBon = false, 
        BonBonBomb = false, 
        PrometheusPunch = false, 
        PrometheusCrash = false, 
        LightningDrop = false, 
        BatteryAssault = false, 
        Raitei = false, 
        ThunderFlash = false, 
        Raigeki = false, 
        Indra = false, 
        ZeusFly = false
    };
    print("soul soul");
    v12.Info = workspace.Effects:WaitForChild((("%*'s Homies"):format(l_LocalPlayer_0)));
    v12:_main();
    return v12;
end;
v10.SoulSwap = function(v13) --[[ Line: 51 ]] --[[ Name: SoulSwap ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local _ = v13.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_0) == true and _G.StamCheck("Soul Swap") == true then
        game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Swap");
    end;
end;
v10.HungerRage = function(v17) --[[ Line: 62 ]] --[[ Name: HungerRage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy)
    local _ = v17.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_1) == true and _G.StamCheck("Hunger Rage") == true then
        game.ReplicatedStorage.Events.Skill:InvokeServer("Hunger Rage");
    end;
end;
v10.LifeorTreat = function(v21, v22) --[[ Line: 73 ]] --[[ Name: LifeorTreat ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v21.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v25 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = l_Character_2.HumanoidRootPart;
    local _ = l_Character_2.Humanoid;
    if _G.check:inspect(l_Character_2) == true and _G.StamCheck("Life or Treat") == true and not l_Cooldowns_2.LifeorTreat then
        local l_cd_0 = v3.GetM("Life or Treat").cd;
        local _ = v21.Info.Homies.Prometheus.RootPart;
        local _ = os.clock();
        l_Cooldowns_2.LifeorTreat = true;
        _G.canuse = false;
        local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Life or Treat");
        v21:ChargeSkill(v22, {
            Key = Enum.KeyCode.T, 
            EndFunction = function(_) --[[ Line: 96 ]] --[[ Name: endFunction ]]
                -- upvalues: v31 (copy), v21 (copy), l_Character_2 (copy), v25 (copy)
                if not v31 then
                    return true;
                elseif v21.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v25.Stamina.Value <= 0 or _G.check:inspect(l_Character_2) == false then
                    return true;
                else
                    return;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        if v31 then
            v31:FireServer();
        end;
        _G.canuse = true;
        _G.keysetup:cooldown("Life or Treat", l_cd_0);
        _G.fw(l_cd_0);
        l_Cooldowns_2.LifeorTreat = false;
    end;
end;
v10.ZeusFly = function(v33, v34) --[[ Line: 123 ]] --[[ Name: ZeusFly ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_CurrentCamera_0 (copy), l_l_PlayerModule_0_Controls_0 (copy)
    local l_Cooldowns_3 = v33.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v37 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_HumanoidRootPart_1 = l_Character_3.HumanoidRootPart;
    local l_Humanoid_1 = l_Character_3.Humanoid;
    if _G.check:inspect(l_Character_3) == true and _G.StamCheck("Zeus Fly") == true and not l_Cooldowns_3.ZeusFly then
        local l_cd_1 = v3.GetM("Zeus Fly").cd;
        local _ = v33.Info.Homies.Prometheus.RootPart;
        local _ = os.clock();
        l_Cooldowns_3.ZeusFly = true;
        _G.canuse = false;
        local v43 = game.ReplicatedStorage.Events.Skill:InvokeServer("Zeus Fly");
        local l_BodyPosition_0 = Instance.new("BodyPosition");
        l_BodyPosition_0.MaxForce = Vector3.new(2000000000, 2000000000, 2000000000, 0);
        l_BodyPosition_0.Position = l_HumanoidRootPart_1.Position;
        l_BodyPosition_0.Parent = l_HumanoidRootPart_1;
        local l_BodyGyro_0 = Instance.new("BodyGyro");
        l_BodyGyro_0.MaxTorque = Vector3.new(2000000000, 2000000000, 2000000000, 0);
        l_BodyGyro_0.CFrame = l_HumanoidRootPart_1.CFrame;
        l_BodyGyro_0.Parent = l_HumanoidRootPart_1;
        l_Humanoid_1.AutoRotate = false;
        local v46 = Vector3.new(0, 0, 0, 0);
        do
            local l_v46_0 = v46;
            local function v51(v48) --[[ Line: 162 ]] --[[ Name: endFunction ]]
                -- upvalues: v43 (copy), l_v46_0 (ref), l_Humanoid_1 (copy), l_CurrentCamera_0 (ref), l_l_PlayerModule_0_Controls_0 (ref), l_BodyPosition_0 (copy), l_BodyGyro_0 (copy), v33 (copy), l_Character_3 (copy), v37 (copy)
                if not v43 then
                    return true;
                else
                    l_v46_0 = l_v46_0:Lerp(l_Humanoid_1.MoveDirection, v48);
                    local v49 = l_CurrentCamera_0.CFrame:VectorToWorldSpace(l_l_PlayerModule_0_Controls_0:GetMoveVector());
                    local l_l_BodyPosition_0_0 = l_BodyPosition_0;
                    l_l_BodyPosition_0_0.Position = l_l_BodyPosition_0_0.Position + v49 * v48 * 30;
                    l_BodyGyro_0.CFrame = CFrame.new(Vector3.new(0, 0, 0, 0), Vector3.new(0, 1, 0, 0):Cross(l_CurrentCamera_0.CFrame.RightVector));
                    if v33.Tool.Parent ~= l_Character_3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v37.Stamina.Value <= 0 or _G.check:inspect(l_Character_3) == false then
                        return true;
                    else
                        return;
                    end;
                end;
            end;
            v33:ChargeSkill(v34, {
                Key = Enum.KeyCode.R, 
                EndFunction = v51, 
                IgnoreInstantCastSetting = true
            });
            if v43 then
                v43:FireServer();
            end;
            task.wait();
            l_BodyPosition_0:Destroy();
            l_BodyGyro_0:Destroy();
            l_Humanoid_1.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Zeus Fly", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_3.ZeusFly = false;
        end;
    end;
end;
v10.PrometheusCrash = function(v52, v53) --[[ Line: 202 ]] --[[ Name: PrometheusCrash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_CurrentCamera_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy)
    local l_Cooldowns_4 = v52.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v56 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = l_Character_4.RightHand;
    if _G.check:inspect(l_Character_4) == true and _G.StamCheck("Prometheus Crash") == true and not l_Cooldowns_4.PrometheusCrash then
        local l_cd_2 = v3.GetM("Prometheus Crash").cd;
        local l_RootPart_2 = v52.Info.Homies.Prometheus.RootPart;
        local l_HumanoidRootPart_2 = l_Character_4.HumanoidRootPart;
        local v61 = os.clock();
        l_Cooldowns_4.PrometheusCrash = true;
        _G.canuse = false;
        local function _() --[[ Line: 222 ]] --[[ Name: GetStartCFrame ]]
            -- upvalues: l_HumanoidRootPart_2 (copy), l_CurrentCamera_0 (ref)
            return l_HumanoidRootPart_2.CFrame + l_CurrentCamera_0.CFrame.RightVector * 10 + Vector3.new(0, 3, 0, 0);
        end;
        local v63 = l_Character_4.Humanoid.Animator:LoadAnimation(script.LightningDropPlayer);
        v63:Play();
        task.wait(0.1);
        v63:AdjustSpeed(0);
        local l_CFrame_0 = l_RootPart_2.CFrame;
        local v65 = game.ReplicatedStorage.Events.Skill:InvokeServer("Prometheus Crash");
        do
            local l_l_CFrame_0_0 = l_CFrame_0;
            local function v68(v67) --[[ Line: 236 ]] --[[ Name: endFunction ]]
                -- upvalues: v65 (copy), l_l_CFrame_0_0 (ref), l_HumanoidRootPart_2 (copy), l_CurrentCamera_0 (ref), v61 (copy), l_RootPart_2 (copy), l_l_LocalPlayer_0_Mouse_0 (ref), v52 (copy), l_Character_4 (copy), v56 (copy)
                if not v65 then
                    return true;
                else
                    l_l_CFrame_0_0 = l_l_CFrame_0_0:Lerp(l_HumanoidRootPart_2.CFrame + l_CurrentCamera_0.CFrame.RightVector * 10 + Vector3.new(0, 3, 0, 0) + Vector3.new(0, 3.5, 0, 0) * (os.clock() - v61), v67);
                    l_RootPart_2.BodyGyro.CFrame = l_RootPart_2.BodyGyro.CFrame:Lerp(CFrame.new(l_RootPart_2.Position, l_l_LocalPlayer_0_Mouse_0.Hit.Position), v67 * 2);
                    l_RootPart_2.BodyPosition.Position = l_l_CFrame_0_0.Position;
                    if v52.Tool.Parent ~= l_Character_4 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v56.Stamina.Value <= 0 or os.clock() - v61 >= 5 or _G.check:inspect(l_Character_4) == false then
                        return true;
                    else
                        return;
                    end;
                end;
            end;
            v52:ChargeSkill(v53, {
                Key = Enum.KeyCode.C, 
                EndFunction = v68, 
                IgnoreInstantCastSetting = true
            });
            if v65 then
                v65:FireServer(v52:GetMousePosition());
            end;
            v63:AdjustSpeed(1);
            task.wait();
            _G.canuse = true;
            _G.keysetup:cooldown("Prometheus Crash", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_4.PrometheusCrash = false;
        end;
    end;
end;
v10.PrometheusPunch = function(v69, v70) --[[ Line: 272 ]] --[[ Name: PrometheusPunch ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v69.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v73 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = l_Character_5.RightHand;
    if _G.check:inspect(l_Character_5) == true and _G.StamCheck("Prometheus Punch") == true and not l_Cooldowns_5.PrometheusPunch then
        local l_cd_3 = v3.GetM("Prometheus Punch").cd;
        local _ = v69.Info.Homies.Prometheus.RootPart;
        local v77 = os.clock();
        l_Cooldowns_5.PrometheusPunch = true;
        _G.canuse = false;
        _G.FaceMouse = true;
        local v78 = game.ReplicatedStorage.Events.Skill:InvokeServer("Prometheus Punch");
        v69:ChargeSkill(v70, {
            Key = Enum.KeyCode.Z, 
            EndFunction = function(_) --[[ Line: 295 ]] --[[ Name: endFunction ]]
                -- upvalues: v78 (copy), v69 (copy), l_Character_5 (copy), v73 (copy), v77 (copy)
                if not v78 then
                    return true;
                elseif v69.Tool.Parent ~= l_Character_5 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v73.Stamina.Value <= 0 or os.clock() - v77 >= 5 or _G.check:inspect(l_Character_5) == false then
                    return true;
                else
                    return;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        if v78 then
            v78:FireServer(v69:GetMousePosition());
        end;
        task.wait();
        _G.FaceMouse = false;
        _G.canuse = true;
        _G.keysetup:cooldown("Prometheus Punch", l_cd_3);
        _G.fw(l_cd_3);
        l_Cooldowns_5.PrometheusPunch = false;
    end;
end;
v10.BonBonTorch = function(v80, v81) --[[ Line: 325 ]] --[[ Name: BonBonTorch ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_6 = v80.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v84 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_6) == true and _G.StamCheck("Bon Bon Torch") == true and not l_Cooldowns_6.BonBonTorch then
        local l_cd_4 = v3.GetM("Bon Bon Torch").cd;
        local v86 = os.clock();
        l_Cooldowns_6.BonBonTorch = true;
        _G.canuse = false;
        local v87 = os.clock();
        local l_RootPart_4 = v80.Info.Homies.Prometheus.RootPart;
        local l_HumanoidRootPart_3 = l_Character_6.HumanoidRootPart;
        local v90 = Vector3.new(0, 0, 0, 0);
        local v91 = Vector3.new(0, 0, 0, 0);
        local v92 = Vector3.new(0, 0, 0, 0);
        local v93 = Vector3.new(0, 1, 0, 0):Cross(l_HumanoidRootPart_3.CFrame.RightVector);
        local l_BodyPosition_1 = Instance.new("BodyPosition");
        l_BodyPosition_1.MaxForce = Vector3.new(2000000000, 2000000000, 2000000000, 0);
        l_BodyPosition_1.Position = l_HumanoidRootPart_3.Position;
        l_BodyPosition_1.Parent = l_HumanoidRootPart_3;
        local l_BodyGyro_1 = Instance.new("BodyGyro");
        l_BodyGyro_1.P = 50000;
        l_BodyGyro_1.D = 250;
        l_BodyGyro_1.MaxTorque = Vector3.new(2000000000, 2000000000, 2000000000, 0);
        l_BodyGyro_1.CFrame = CFrame.new(Vector3.new(0, 0, 0, 0), v93);
        l_BodyGyro_1.Parent = l_HumanoidRootPart_3;
        local l_Humanoid_2 = l_Character_6.Humanoid;
        l_Humanoid_2.AutoRotate = false;
        l_Humanoid_2.PlatformStand = true;
        local v97 = true;
        do
            local l_v90_0, l_v91_0, l_v92_0, l_v97_0 = v90, v91, v92, v97;
            local _ = task.spawn(function() --[[ Line: 372 ]]
                -- upvalues: v87 (copy), l_v92_0 (ref), l_HumanoidRootPart_3 (copy), l_v90_0 (ref), l_v91_0 (ref), l_RootPart_4 (copy), l_v97_0 (ref), l_BodyGyro_1 (copy), v80 (copy)
                local v102 = false;
                while true do
                    local v103 = task.wait();
                    local v104 = os.clock() - v87;
                    local v105 = math.min(v104 / 0.5, 1);
                    l_v92_0 = l_HumanoidRootPart_3.Position:Lerp(l_HumanoidRootPart_3.Position + l_HumanoidRootPart_3.CFrame.LookVector * 5, v105);
                    local v106 = l_v92_0 + l_v90_0 + l_v91_0;
                    if v104 <= 0.5 then
                        l_v90_0 = l_HumanoidRootPart_3.CFrame * CFrame.new(Vector3.new(math.sin(3.141592653589793 * v105), 0, (math.cos(3.141592653589793 * v105))) * math.sin(v105 * 3.141592653589793) * 25).Position - l_HumanoidRootPart_3.Position;
                        l_v91_0 = Vector3.new(0, 15, 0, 0) * math.sin(v105 * 3.141592653589793);
                        l_RootPart_4.BodyGyro.CFrame = l_RootPart_4.CFrame:Lerp(CFrame.new(l_RootPart_4.Position, v106), v103 * 3);
                        v102 = true;
                    end;
                    if not v102 then
                        if l_v97_0 then
                            l_BodyGyro_1.CFrame = l_BodyGyro_1.CFrame:Lerp(CFrame.new(l_HumanoidRootPart_3.Position, v80:GetMousePosition()), v103);
                        else
                            break;
                        end;
                    end;
                    v102 = false;
                    l_RootPart_4.BodyPosition.Position = v106;
                end;
            end);
            local v108 = game.ReplicatedStorage.Events.Skill:InvokeServer("Bon Bon Torch");
            v80:ChargeSkill(v81, {
                Key = Enum.KeyCode.X, 
                EndFunction = function(_) --[[ Line: 397 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_6 (copy), v108 (copy), v87 (copy), v80 (copy), v84 (copy), v86 (copy)
                    l_Character_6.Humanoid.WalkSpeed = 4;
                    if not v108 then
                        return true;
                    elseif os.clock() - v87 <= 0.5 then
                        return;
                    elseif v80.Tool.Parent ~= l_Character_6 or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v84.Stamina.Value <= 0 or os.clock() - v86 >= 15 or _G.check:inspect(l_Character_6) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_BodyPosition_1:Destroy();
            l_BodyGyro_1:Destroy();
            if v108 then
                v108:FireServer("Finished");
            end;
            task.wait();
            l_v97_0 = false;
            l_Humanoid_2.AutoRotate = true;
            l_Humanoid_2.PlatformStand = false;
            l_Character_6.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Bon Bon Torch", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_6.BonBonTorch = false;
        end;
    end;
end;
v10.Raigeki = function(v110, v111) --[[ Line: 439 ]] --[[ Name: Raigeki ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_7 = v110.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local v114 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_7) == true and _G.StamCheck("Raigeki") == true and not l_Cooldowns_7.Raigeki then
        local l_cd_5 = v3.GetM("Raigeki").cd;
        local v116 = os.clock();
        l_Cooldowns_7.Raigeki = true;
        _G.canuse = false;
        local v117 = os.clock();
        local l_RootPart_5 = v110.Info.Homies.Zeus.RootPart;
        local l_HumanoidRootPart_4 = l_Character_7.HumanoidRootPart;
        local _ = l_RootPart_5.BodyPosition;
        local v121 = game.ReplicatedStorage.Events.Skill:InvokeServer("Raigeki");
        local v129 = task.spawn(function() --[[ Line: 468 ]]
            -- upvalues: v117 (copy), l_HumanoidRootPart_4 (copy), v110 (copy), l_RootPart_5 (copy)
            local v122 = Vector3.new(0, 0, 0, 0);
            while true do
                local v123 = task.wait();
                local v124 = math.min((os.clock() - v117) / 2, 1);
                local v125 = Vector3.new(math.sin(18.84955592153876 * v124), 0, (math.cos(18.84955592153876 * v124))) * math.sin(v124 * 3.141592653589793) * 25;
                local v126 = CFrame.new(l_HumanoidRootPart_4.Position, v110:GetMousePosition());
                v122 = v122:Lerp(Vector3.new(0, 1, 0, 0):Cross(v126.RightVector) * 40 * v124, v123 * 0.5);
                local v127 = Vector3.new(0, 65, 0, 0) * v124;
                local v128 = l_HumanoidRootPart_4.Position + v125 + v122 + v127;
                l_RootPart_5.BodyGyro.CFrame = CFrame.new(l_RootPart_5.Position, v128);
                l_RootPart_5.BodyPosition.Position = v128;
            end;
        end);
        v121.OnClientInvoke = function() --[[ Line: 488 ]]
            -- upvalues: v129 (copy)
            task.cancel(v129);
        end;
        v110:ChargeSkill(v111, {
            Key = Enum.KeyCode.C, 
            EndFunction = function(_) --[[ Line: 492 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_7 (copy), v121 (copy), v110 (copy), v114 (copy), v116 (copy)
                l_Character_7.Humanoid.WalkSpeed = 4;
                if not v121 then
                    return true;
                elseif v110.Tool.Parent ~= l_Character_7 or l_Character_7.Parent == nil or l_Character_7.Parent ~= workspace.PlayerCharacters or v114.Stamina.Value <= 0 or os.clock() - v116 >= 5 or _G.check:inspect(l_Character_7) == false then
                    return true;
                else
                    return;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        if v121 then
            v121:InvokeServer("Finished");
        end;
        task.wait();
        l_Character_7.Humanoid.WalkSpeed = 16;
        _G.canuse = true;
        _G.keysetup:cooldown("Raigeki", l_cd_5);
        _G.fw(l_cd_5);
        l_Cooldowns_7.Raigeki = false;
    end;
end;
v10.LightningDrop = function(v131, v132) --[[ Line: 524 ]] --[[ Name: LightningDrop ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_8 = v131.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local v135 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_8) == true and _G.StamCheck("Lightning Drop") == true and not l_Cooldowns_8.LightningDrop then
        local l_cd_6 = v3.GetM("Lightning Drop").cd;
        local v137 = os.clock();
        l_Cooldowns_8.LightningDrop = true;
        _G.canuse = false;
        local l_RootPart_6 = v131.Info.Homies.Zeus.RootPart;
        local l_HumanoidRootPart_5 = l_Character_8.HumanoidRootPart;
        local v140 = 0;
        local l_Position_0 = l_RootPart_6.Position;
        local v142 = l_Character_8.Humanoid.Animator:LoadAnimation(script.LightningDropPlayer);
        v142:Play();
        local v143 = game.ReplicatedStorage.Events.Skill:InvokeServer("Lightning Drop");
        task.wait(0.1);
        v142:AdjustSpeed(0);
        do
            local l_v140_0 = v140;
            local function v156(v145) --[[ Line: 561 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_8 (copy), v143 (copy), v131 (copy), l_HumanoidRootPart_5 (copy), l_Position_0 (copy), l_v140_0 (ref), l_RootPart_6 (copy), v135 (copy), v137 (copy)
                l_Character_8.Humanoid.WalkSpeed = 4;
                if not v143 then
                    return true;
                else
                    local l_v131_MouseCFrame_0 = v131:GetMouseCFrame();
                    local l_Position_1 = l_HumanoidRootPart_5.Position;
                    local v148 = l_v131_MouseCFrame_0.Position - l_Position_1;
                    local v149 = nil;
                    v149 = if v148.Magnitude < 50 then l_v131_MouseCFrame_0.Position else v148.Unit * 50 + l_Position_1;
                    local _, v151, _ = _G.getRayFloor(CFrame.new(v149) + Vector3.new(0, 2, 0, 0), 200);
                    if v151 then
                        local v153 = v151 + Vector3.new(0, 45, 0, 0);
                        local l_Position_2 = (CFrame.new(l_Position_0, v153) * CFrame.new(-25, 0, -(v153 - l_Position_0) / 2)).Position;
                        l_v140_0 = math.min(1, l_v140_0 + v145 / 1);
                        local v155 = l_Position_0:Lerp(l_Position_2, l_v140_0):Lerp(l_Position_2:Lerp(v153, l_v140_0), l_v140_0);
                        l_RootPart_6.BodyPosition.Position = l_RootPart_6.BodyPosition.Position:Lerp(v155, v145 * 5);
                        l_RootPart_6.BodyGyro.CFrame = CFrame.new(l_RootPart_6.Position * Vector3.new(1, 0, 1, 0), l_HumanoidRootPart_5.Position * Vector3.new(1, 0, 1, 0));
                    end;
                    if v131.Tool.Parent ~= l_Character_8 or l_Character_8.Parent == nil or l_Character_8.Parent ~= workspace.PlayerCharacters or v135.Stamina.Value <= 0 or os.clock() - v137 >= 5 or _G.check:inspect(l_Character_8) == false then
                        return true;
                    else
                        return;
                    end;
                end;
            end;
            v131:ChargeSkill(v132, {
                Key = Enum.KeyCode.Z, 
                EndFunction = v156, 
                IgnoreInstantCastSetting = true
            });
            if v143 then
                v143:FireServer("Finished", v131:GetMouseCFrame());
            end;
            v142:AdjustSpeed(1);
            task.wait();
            l_Character_8.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Lightning Drop", l_cd_6);
            _G.fw(l_cd_6);
            l_Cooldowns_8.LightningDrop = false;
        end;
    end;
end;
v10.Indra = function(v157) --[[ Line: 622 ]] --[[ Name: Indra ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_9 = v157.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_9) == true and _G.StamCheck("Indra") == true and not l_Cooldowns_9.Indra then
        local l_cd_7 = v3.GetM("Indra").cd;
        l_Cooldowns_9.Indra = true;
        game.ReplicatedStorage.Events.Skill:InvokeServer("Indra", v157:GetMouseCFrame());
        _G.keysetup:cooldown("Indra", l_cd_7);
        _G.fw(l_cd_7);
        l_Cooldowns_9.Indra = false;
    end;
end;
v10.SunRay = function(v162, v163) --[[ Line: 642 ]] --[[ Name: SunRay ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_10 = v162.Cooldowns;
    local l_Character_10 = l_LocalPlayer_0.Character;
    local v166 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_10) == true and _G.StamCheck("Sun Ray") == true and not l_Cooldowns_10.SunRay then
        local l_cd_8 = v3.GetM("Sun Ray").cd;
        _G.canuse = false;
        l_Cooldowns_10.SunRay = true;
        local v168 = os.clock();
        local v169 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sun Ray");
        local l_RootPart_7 = v162.Info.Homies.Prometheus.RootPart;
        local v171 = CFrame.new();
        local l_CFrame_1 = l_RootPart_7.CFrame;
        local v173 = os.clock();
        do
            local l_v171_0, l_l_CFrame_1_0 = v171, l_CFrame_1;
            local function v185(v176) --[[ Line: 670 ]] --[[ Name: endFunction ]]
                -- upvalues: v169 (copy), v162 (copy), v173 (copy), l_l_CFrame_1_0 (ref), l_v171_0 (ref), l_RootPart_7 (copy), l_Character_10 (copy), v166 (copy), v168 (copy)
                if not v169 then
                    return true;
                else
                    local l_Position_3 = v162:GetMouseCFrame().Position;
                    local v178 = os.clock() - v173;
                    local _ = l_l_CFrame_1_0 * l_v171_0;
                    l_RootPart_7.BodyPosition.Position = (l_l_CFrame_1_0 * l_v171_0).Position;
                    l_l_CFrame_1_0 = l_l_CFrame_1_0:Lerp(CFrame.new(l_Position_3), 2 * v176);
                    if v178 <= 0.5 then
                        local v180 = math.min(1, v178 / 0.5);
                        local _ = 1 - v180;
                        l_v171_0 = l_v171_0:Lerp(CFrame.Angles(0, 6.283185307179586 * v180, 0) * CFrame.new(0, 0, math.sin(v180 * 3.141592653589793) * 25) + Vector3.new(0, 55, 0, 0) * v180, v180);
                    else
                        local _, v183, _ = _G.getRayFloor(CFrame.new(l_RootPart_7.Position), 200);
                        if v183 then
                            v169:InvokeServer("Position", v183);
                        end;
                    end;
                    if v162.Tool.Parent ~= l_Character_10 or l_Character_10.Parent == nil or l_Character_10.Parent ~= workspace.PlayerCharacters or v166.Stamina.Value <= 0 or os.clock() - v168 >= 5 or _G.check:inspect(l_Character_10) == false then
                        return true;
                    else
                        return;
                    end;
                end;
            end;
            v162:ChargeSkill(v163, {
                Key = Enum.KeyCode.X, 
                EndFunction = v185, 
                IgnoreInstantCastSetting = true
            });
            if v169 then
                task.wait(0.1);
                v169:InvokeServer("Finished");
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Sun Ray", l_cd_8);
            _G.fw(l_cd_8);
            l_Cooldowns_10.SunRay = false;
        end;
    end;
end;
v10.BonBon = function(v186, v187) --[[ Line: 723 ]] --[[ Name: BonBon ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_11 = v186.Cooldowns;
    local l_Character_11 = l_LocalPlayer_0.Character;
    local v190 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_11) == true and _G.StamCheck("Bon Bon") == true and not l_Cooldowns_11.BonBon then
        local l_cd_9 = v3.GetM("Bon Bon").cd;
        local _ = v186.Info.Homies.Zeus.RootPart;
        _G.FaceMouse = true;
        _G.canuse = false;
        l_Cooldowns_11.BonBon = true;
        local v193 = os.clock();
        local v194 = game.ReplicatedStorage.Events.Skill:InvokeServer("Bon Bon");
        v186:ChargeSkill(v187, {
            Key = Enum.KeyCode.Z, 
            EndFunction = function(_) --[[ Line: 746 ]] --[[ Name: endFunction ]]
                -- upvalues: v186 (copy), l_Character_11 (copy), v190 (copy), v193 (copy)
                if v186.Tool.Parent ~= l_Character_11 or l_Character_11.Parent == nil or l_Character_11.Parent ~= workspace.PlayerCharacters or v190.Stamina.Value <= 0 or os.clock() - v193 >= 5 or _G.check:inspect(l_Character_11) == false then
                    return true;
                else
                    return;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        if v194 then
            _G.FaceMouse = false;
            task.wait(0.1);
            v194:FireServer(v186:GetMouseCFrame().Position);
        end;
        _G.canuse = true;
        _G.keysetup:cooldown("Bon Bon", l_cd_9);
        _G.fw(l_cd_9);
        l_Cooldowns_11.BonBon = false;
    end;
end;
v10.ThunderFlash = function(v196, v197) --[[ Line: 772 ]] --[[ Name: ThunderFlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_12 = v196.Cooldowns;
    local l_Character_12 = l_LocalPlayer_0.Character;
    local v200 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_HumanoidRootPart_6 = l_Character_12.HumanoidRootPart;
    if _G.check:inspect(l_Character_12) == true and _G.StamCheck("Thunder Flash") == true and not l_Cooldowns_12.ThunderFlash then
        local l_cd_10 = v3.GetM("Thunder Flash").cd;
        local l_RootPart_9 = v196.Info.Homies.Zeus.RootPart;
        _G.canuse = false;
        local l_BodyPosition_3 = Instance.new("BodyPosition");
        l_BodyPosition_3.MaxForce = Vector3.new(100000, 100000, 100000, 0);
        l_BodyPosition_3.Position = l_HumanoidRootPart_6.Position + Vector3.new(0, 7.5, 0, 0);
        l_BodyPosition_3.Parent = l_HumanoidRootPart_6;
        local l_BodyGyro_2 = Instance.new("BodyGyro");
        l_BodyGyro_2.MaxTorque = Vector3.new(2000000000, 2000000000, 2000000000, 0);
        l_BodyGyro_2.P = 2000;
        l_BodyGyro_2.CFrame = CFrame.new(l_HumanoidRootPart_6.Position, v196:GetMouseCFrame().Position);
        l_BodyGyro_2.Parent = l_HumanoidRootPart_6;
        l_Cooldowns_12.ThunderFlash = true;
        local v206 = os.clock();
        local v207 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunder Flash");
        v196:ChargeSkill(v197, {
            Key = Enum.KeyCode.X, 
            EndFunction = function(_) --[[ Line: 806 ]] --[[ Name: endFunction ]]
                -- upvalues: v207 (copy), l_RootPart_9 (copy), l_HumanoidRootPart_6 (copy), l_BodyGyro_2 (copy), v196 (copy), l_Character_12 (copy), v200 (copy), v206 (copy)
                if not v207 then
                    return true;
                else
                    l_RootPart_9.BodyPosition.Position = l_HumanoidRootPart_6.Position + l_HumanoidRootPart_6.CFrame.UpVector * -3;
                    l_RootPart_9.BodyGyro.CFrame = l_HumanoidRootPart_6.CFrame;
                    l_BodyGyro_2.CFrame = CFrame.new(l_HumanoidRootPart_6.Position, v196:GetMouseCFrame().Position);
                    if v196.Tool.Parent ~= l_Character_12 or l_Character_12.Parent == nil or l_Character_12.Parent ~= workspace.PlayerCharacters or v200.Stamina.Value <= 0 or os.clock() - v206 >= 5 or _G.check:inspect(l_Character_12) == false then
                        return true;
                    else
                        return;
                    end;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        l_BodyGyro_2:Destroy();
        l_BodyPosition_3:Destroy();
        if v207 then
            v207:InvokeServer(v196:GetMouseCFrame().Position);
        end;
        _G.canuse = true;
        _G.keysetup:cooldown("Thunder Flash", l_cd_10);
        _G.fw(l_cd_10);
        l_Cooldowns_12.ThunderFlash = false;
    end;
end;
v10.Raitei = function(v209, v210) --[[ Line: 841 ]] --[[ Name: Raitei ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_13 = v209.Cooldowns;
    local l_Character_13 = l_LocalPlayer_0.Character;
    local v213 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_13) == true and _G.StamCheck("Raitei") == true and not l_Cooldowns_13.Raitei then
        local l_cd_11 = v3.GetM("Raitei").cd;
        local _ = v209.Info.Homies.Zeus.RootPart;
        _G.FaceMouse = true;
        _G.canuse = false;
        l_Cooldowns_13.Raitei = true;
        local v216 = os.clock();
        local v217 = game.ReplicatedStorage.Events.Skill:InvokeServer("Raitei");
        v209:ChargeSkill(v210, {
            Key = Enum.KeyCode.Z, 
            EndFunction = function(_) --[[ Line: 864 ]] --[[ Name: endFunction ]]
                -- upvalues: v217 (copy), v209 (copy), l_Character_13 (copy), v213 (copy), v216 (copy)
                if not v217 then
                    return true;
                elseif v209.Tool.Parent ~= l_Character_13 or l_Character_13.Parent == nil or l_Character_13.Parent ~= workspace.PlayerCharacters or v213.Stamina.Value <= 0 or os.clock() - v216 >= 5 or _G.check:inspect(l_Character_13) == false then
                    return true;
                else
                    return;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        _G.FaceMouse = false;
        if v217 then
            v217:FireServer(v209:GetMouseCFrame().Position);
        end;
        _G.canuse = true;
        _G.keysetup:cooldown("Raitei", l_cd_11);
        _G.fw(l_cd_11);
        l_Cooldowns_13.Raitei = false;
    end;
end;
v10.BonBonBomb = function(v219, v220) --[[ Line: 894 ]] --[[ Name: BonBonBomb ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_14 = v219.Cooldowns;
    local l_Character_14 = l_LocalPlayer_0.Character;
    local v223 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_RightHand_2 = l_Character_14.RightHand;
    if _G.check:inspect(l_Character_14) == true and _G.StamCheck("Bon Bon Bomb") == true and not l_Cooldowns_14.BonBonBomb then
        local l_cd_12 = v3.GetM("Bon Bon Bomb").cd;
        local l_RootPart_11 = v219.Info.Homies.Prometheus.RootPart;
        local v227 = l_Character_14.Humanoid.Animator:LoadAnimation(script.BonBonBombPlayer);
        v227:Play();
        _G.FaceMouse = true;
        _G.canuse = false;
        l_Cooldowns_14.BonBonBomb = true;
        local v228 = os.clock();
        local v229 = game.ReplicatedStorage.Events.Skill:InvokeServer("Bon Bon Bomb");
        task.wait(0.1);
        v227:AdjustSpeed(0);
        v219:ChargeSkill(v220, {
            Key = Enum.KeyCode.C, 
            EndFunction = function(_) --[[ Line: 925 ]] --[[ Name: endFunction ]]
                -- upvalues: v229 (copy), l_RootPart_11 (copy), l_RightHand_2 (copy), v219 (copy), l_Character_14 (copy), v223 (copy), v228 (copy)
                if not v229 then
                    return true;
                else
                    l_RootPart_11.BodyPosition.Position = l_RightHand_2.Position;
                    l_RootPart_11.BodyGyro.CFrame = l_RightHand_2.CFrame;
                    if v219.Tool.Parent ~= l_Character_14 or l_Character_14.Parent == nil or l_Character_14.Parent ~= workspace.PlayerCharacters or v223.Stamina.Value <= 0 or os.clock() - v228 >= 5 or _G.check:inspect(l_Character_14) == false then
                        return true;
                    else
                        return;
                    end;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        if v229 then
            _G.FaceMouse = false;
            task.wait(0.1);
            v229:FireServer(v219:GetMouseCFrame().Position);
        end;
        v227:AdjustSpeed(1);
        _G.canuse = true;
        _G.keysetup:cooldown("Bon Bon Bomb", l_cd_12);
        _G.fw(l_cd_12);
        l_Cooldowns_14.BonBonBomb = false;
    end;
end;
v10.BatteryAssault = function(v231, v232) --[[ Line: 959 ]] --[[ Name: BatteryAssault ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_15 = v231.Cooldowns;
    local l_Character_15 = l_LocalPlayer_0.Character;
    local v235 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = l_Character_15.RightHand;
    if _G.check:inspect(l_Character_15) == true and _G.StamCheck("Battery Assault") == true and not l_Cooldowns_15.BatteryAssault then
        local l_cd_13 = v3.GetM("Battery Assault").cd;
        local _ = v231.Info.Homies.Zeus.RootPart;
        _G.FaceMouse = true;
        _G.canuse = false;
        l_Cooldowns_15.BatteryAssault = true;
        local v239 = l_Character_15.Humanoid.Animator:LoadAnimation(script.BatteryAssaultPlayer);
        v239:Play();
        task.wait(0.1);
        v239:AdjustSpeed(0);
        local v240 = os.clock();
        local v241 = game.ReplicatedStorage.Events.Skill:InvokeServer("Battery Assault");
        v231:ChargeSkill(v232, {
            Key = Enum.KeyCode.C, 
            EndFunction = function(_) --[[ Line: 990 ]] --[[ Name: endFunction ]]
                -- upvalues: v241 (copy), v231 (copy), l_Character_15 (copy), v235 (copy), v240 (copy)
                if not v241 then
                    return true;
                elseif v231.Tool.Parent ~= l_Character_15 or l_Character_15.Parent == nil or l_Character_15.Parent ~= workspace.PlayerCharacters or v235.Stamina.Value <= 0 or os.clock() - v240 >= 5 or _G.check:inspect(l_Character_15) == false then
                    return true;
                else
                    return;
                end;
            end, 
            IgnoreInstantCastSetting = true
        });
        v239:AdjustSpeed(1);
        if v241 then
            _G.FaceMouse = false;
            task.wait(0.1);
            v241:InvokeServer();
        end;
        _G.canuse = true;
        _G.keysetup:cooldown("Battery Assault", l_cd_13);
        _G.fw(l_cd_13);
        l_Cooldowns_15.BatteryAssault = false;
    end;
end;
v10._main = function(v243) --[[ Line: 1022 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Homies_0 = v243.Info.Homies;
    local l_RageMode_0 = v243.Info.RageMode;
    local l_HumanoidRootPart_7 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()).HumanoidRootPart;
    l_RageMode_0.Prometheus.AnimationController.Animator:LoadAnimation(script.PrometheusRageIdle):Play();
    for v247, v248 in {
        [l_Homies_0.Prometheus] = {
            Offset = CFrame.new(5, 0, 3)
        }, 
        [l_Homies_0.Zeus] = {
            Offset = CFrame.new(-5, 0, 3)
        }
    } do
        (function(v249) --[[ Line: 1042 ]] --[[ Name: RootPartAdded ]]
            -- upvalues: v247 (copy), l_HumanoidRootPart_7 (copy), v248 (copy)
            if v249.Name ~= "RootPart" then
                return;
            else
                local l_BodyPosition_4 = Instance.new("BodyPosition");
                l_BodyPosition_4.MaxForce = Vector3.new(2000000000, 2000000000, 2000000000, 0);
                l_BodyPosition_4.P = 20000;
                l_BodyPosition_4.D = 500;
                l_BodyPosition_4.Parent = v249;
                local l_BodyGyro_3 = Instance.new("BodyGyro");
                l_BodyGyro_3.MaxTorque = Vector3.new(2000000000, 2000000000, 2000000000, 0);
                l_BodyGyro_3.P = 10000;
                l_BodyGyro_3.D = 500;
                l_BodyGyro_3.Parent = l_BodyPosition_4.Parent;
                local l_BodyPosition_5 = v249.BodyPosition;
                local l_BodyGyro_4 = v249.BodyGyro;
                local v254 = os.clock();
                local v255 = math.random() * 0.5;
                local function v257(v256) --[[ Line: 1063 ]] --[[ Name: MoverChanged ]]
                    -- upvalues: l_BodyPosition_5 (copy), l_BodyGyro_4 (copy)
                    l_BodyPosition_5.MaxForce = if v256 then Vector3.new(2000000000, 2000000000, 2000000000, 0) else Vector3.new(0, 0, 0, 0);
                    l_BodyGyro_4.MaxTorque = l_BodyPosition_5.MaxForce;
                end;
                l_BodyPosition_5.MaxForce = if v247.EnableMover.Value then Vector3.new(2000000000, 2000000000, 2000000000, 0) else Vector3.new(0, 0, 0, 0);
                l_BodyGyro_4.MaxTorque = l_BodyPosition_5.MaxForce;
                v247.EnableMover.Changed:Connect(v257);
                task.spawn(function() --[[ Line: 1071 ]]
                    -- upvalues: v247 (ref), l_BodyPosition_5 (copy), v254 (copy), l_HumanoidRootPart_7 (ref), v248 (ref), v255 (copy), l_BodyGyro_4 (copy)
                    while v247.Parent and l_BodyPosition_5.Parent do
                        local _ = task.wait();
                        if not v247.CustomMovement.Value then
                            local v259 = os.clock() - v254;
                            l_BodyPosition_5.Position = (l_HumanoidRootPart_7.CFrame * v248.Offset).Position + Vector3.new(0, 1, 0, 0) * math.sin(v259 + v255);
                            l_BodyGyro_4.CFrame = l_HumanoidRootPart_7.CFrame;
                        end;
                    end;
                end);
                return;
            end;
        end)(v247:WaitForChild("RootPart"));
    end;
end;
return v10;