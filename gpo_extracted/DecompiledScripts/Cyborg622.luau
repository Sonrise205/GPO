local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local v7 = setmetatable({}, v3);
v7.__index = v7;
local _ = game:GetService("UserInputService");
v7.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v7 (copy), l_LocalPlayer_0 (copy)
    local v10 = setmetatable(v3.new(script.Name), v7);
    local l_Character_0 = l_LocalPlayer_0.Character;
    v10.Cooldowns = {
        blows = false, 
        laser = false, 
        missle = false, 
        air = false, 
        Flight = false, 
        rush = false
    };
    v10.stopAnims = function(v12) --[[ Line: 28 ]]
        for v13 = 1, #v12 do
            if v12[v13].IsPlaying ~= false then
                v12[v13]:Stop();
            end;
        end;
    end;
    v10.playAnimation = function(v14, v15, v16) --[[ Line: 37 ]]
        -- upvalues: l_Character_0 (copy)
        local v17 = {};
        local l_l_Character_0_Descendants_0 = l_Character_0:GetDescendants();
        for v19 = 1, #l_l_Character_0_Descendants_0 do
            if (l_l_Character_0_Descendants_0[v19]:IsA("Humanoid") or l_l_Character_0_Descendants_0[v19]:IsA("AnimationController")) and (not l_l_Character_0_Descendants_0[v19]:IsA("AnimationController") or l_l_Character_0_Descendants_0[v19].Parent:GetAttribute("cyborgModel") ~= nil) then
                local v20 = l_l_Character_0_Descendants_0[v19]:LoadAnimation(v14);
                v20:AdjustWeight(2);
                if v15 == nil then
                    v20:Play();
                    v20.Priority = Enum.AnimationPriority.Action3;
                end;
                if v16 then
                    v20.Priority = v16;
                end;
                table.insert(v17, v20);
            end;
        end;
        return v17;
    end;
    local v21 = {
        Idle = v10.playAnimation(script.Fly.idle, true, Enum.AnimationPriority.Action2), 
        Front = v10.playAnimation(script.Fly.front, true), 
        Back = v10.playAnimation(script.Fly.back, true), 
        Left = v10.playAnimation(script.Fly.left, true), 
        Right = v10.playAnimation(script.Fly.right, true)
    };
    v10.fly = v21;
    v10.stopAll = function(v22) --[[ Line: 67 ]]
        -- upvalues: v21 (copy), v10 (copy)
        for v23, v24 in v21 do
            if v23 ~= v22 then
                v10.stopAnims(v24);
            end;
        end;
    end;
    v10.playAnim = function(v25, v26) --[[ Line: 75 ]]
        -- upvalues: l_Character_0 (copy), v10 (copy), v21 (copy)
        if _G.check:inspect(l_Character_0) == false and v26 == nil then
            v10.stopAll(nil);
            return;
        else
            if v21[v25][1].IsPlaying == false then
                for v27 = 1, #v21[v25] do
                    v21[v25][v27]:Play();
                end;
            end;
            if v26 == nil then
                v10.stopAll(v25);
            end;
            return;
        end;
    end;
    v10.adjustWeight = function(v28, v29) --[[ Line: 90 ]]
        -- upvalues: v21 (copy)
        for v30 = 1, #v21[v28] do
            v21[v28][v30]:AdjustWeight(v29);
        end;
    end;
    return v10;
end;
local _ = Color3.new(0.333333, 0.333333, 1);
local function _(v32) --[[ Line: 103 ]] --[[ Name: stopAnims ]]
    for v33 = 1, #v32 do
        if v32[v33].IsPlaying ~= false then
            v32[v33]:Stop();
        end;
    end;
end;
local function _(v35) --[[ Line: 112 ]] --[[ Name: removeComboBP ]]
    local l_v35_FirstChild_0 = v35:FindFirstChild("ComboBP", true);
    if l_v35_FirstChild_0 then
        l_v35_FirstChild_0:Destroy();
    end;
end;
v7.MachineGunBlows = function(v38, _) --[[ Line: 119 ]] --[[ Name: MachineGunBlows ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v38.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.blows == false and _G.StamCheck("Machine Gun Blows") == true and _G.canuse == true and _G.check:inspect(l_Character_1) == true then
        local v43 = v2.GetM("Machine Gun Blows");
        local l_cd_0 = v43.cd;
        if _G.StamCheck("Machine Gun Blows") == false then
            return;
        elseif v43.statreq and _G.MeetReq(v43.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v45 = game.ReplicatedStorage.Events.Skill:InvokeServer("Machine Gun Blows", {
                cf = v38:GetMouseCFrame()
            });
            l_Cooldowns_0.blows = true;
            local _ = v38.playAnimation(script.mechwindup);
            _G.canuse = false;
            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild("ComboBP", true);
            if l_l_Character_1_FirstChild_0 then
                l_l_Character_1_FirstChild_0:Destroy();
            end;
            l_l_Character_1_FirstChild_0 = nil;
            do
                local l_l_l_Character_1_FirstChild_0_0 = l_l_Character_1_FirstChild_0;
                task.delay(0.3, function() --[[ Line: 149 ]]
                    -- upvalues: l_l_l_Character_1_FirstChild_0_0 (ref), l_Character_1 (copy)
                    l_l_l_Character_1_FirstChild_0_0 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
                    l_l_l_Character_1_FirstChild_0_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                    l_l_l_Character_1_FirstChild_0_0.Velocity = l_Character_1.PrimaryPart.CFrame.lookVector * -35 + Vector3.new(0, 35, 0, 0);
                end);
                task.wait(0.48);
                l_l_l_Character_1_FirstChild_0_0:Destroy();
                _G.FaceMouse = true;
                task.wait(0.52);
                local v49 = v38.playAnimation(script.mechloop);
                local _ = tick();
                local _ = tick();
                if v45 ~= nil then
                    task.wait(2);
                end;
                v38.stopAnims(v49);
                _G.FaceMouse = false;
                l_Character_1.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Machine Gun Blows", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.blows = false;
            end;
        end;
    end;
end;
v7.LaserPulsar = function(v52, v53) --[[ Line: 183 ]] --[[ Name: LaserPulsar ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v52.Cooldowns;
    local v55 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.laser == false and _G.StamCheck("Laser Pulsar") == true and _G.canuse == true and _G.check:inspect(l_Character_2) == true then
        local v57 = v2.GetM("Laser Pulsar");
        local l_cd_1 = v57.cd;
        if _G.StamCheck("Laser Pulsar") == false then
            return;
        elseif v57.statreq and _G.MeetReq(v57.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v59 = game.ReplicatedStorage.Events.Skill:InvokeServer("Laser Pulsar", {
                cf = v52:GetMouseCFrame()
            });
            l_Cooldowns_1.laser = true;
            local v60 = v52.playAnimation(script.laserStart);
            _G.canuse = false;
            _G.FaceMouse = true;
            task.wait(0.4);
            v52.stopAnims(v60);
            local v61 = tick();
            local v62 = v52.playAnimation(script.laserCharge);
            v52:ChargeSkill(v53, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 217 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v61 (copy), v55 (copy)
                    if l_Character_2:FindFirstChild(script.Name) == nil or tick() - v61 >= 10 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v55.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            if tick() - v61 <= 0.25 then
                task.wait(0.25 - (tick() - v61));
            end;
            _G.FaceMouse = false;
            l_Character_2.PrimaryPart.Anchored = true;
            if v59 then
                v59:FireServer(l_Character_2.PrimaryPart.CFrame);
            end;
            v52.stopAnims(v62);
            local _ = v52.playAnimation(script.laserFire);
            task.wait(0.4);
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Laser Pulsar", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.laser = false;
        end;
    end;
end;
v7.MissleShower = function(v64, v65) --[[ Line: 252 ]] --[[ Name: MissleShower ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v64.Cooldowns;
    local v67 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.missle == false and _G.StamCheck("Missle Shower") == true and _G.canuse == true and _G.check:inspect(l_Character_3) == true then
        local v69 = v2.GetM("Missle Shower");
        local l_cd_2 = v69.cd;
        if _G.StamCheck("Missle Shower") == false then
            return;
        elseif v69.statreq and _G.MeetReq(v69.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_2.missle = true;
            local v71 = v64.playAnimation(script.ultWindup);
            _G.canuse = false;
            task.wait(0.4);
            local v72 = game.ReplicatedStorage.Events.Skill:InvokeServer("Missle Shower", v64:GetMouseCFrame());
            local v73 = nil;
            v73 = Instance.new("BodyVelocity", l_Character_3.HumanoidRootPart);
            v73.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
            v73.Velocity = l_Character_3.PrimaryPart.CFrame.lookVector * -5 + Vector3.new(0, 60, 0, 0);
            v73.Name = "geppo";
            task.wait(0.55);
            _G.FaceMouse = true;
            v73:Destroy();
            v64.stopAnims(v71);
            local v74 = tick();
            local v75 = v64.playAnimation(script.ultLoop);
            for v76 = 1, #v75 do
                v75[v76]:AdjustSpeed(2);
            end;
            local v77 = 0;
            do
                local l_v77_0 = v77;
                local function v79() --[[ Line: 295 ]] --[[ Name: endFunction ]]
                    -- upvalues: v72 (copy), l_v77_0 (ref), v64 (copy), l_Character_3 (copy), v74 (copy), v67 (copy)
                    if v72 and tick() - l_v77_0 >= 0.09 then
                        v72:FireServer(v64:GetMouseCFrame());
                        l_v77_0 = tick();
                    end;
                    if l_Character_3:FindFirstChild(script.Name) == nil or v72 == nil or l_Character_3:FindFirstChild("PB") or tick() - v74 >= 10 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v67.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                v64:ChargeSkill(v65, {
                    Key = Enum.KeyCode.X, 
                    EndFunction = v79, 
                    IgnoreInstantCastSetting = true
                });
                if v72 then
                    v72:FireServer();
                end;
                v64.stopAnims(v75);
                _G.FaceMouse = false;
                l_Character_3.PrimaryPart.Anchored = true;
                task.wait(0.4);
                l_Character_3.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Missle Shower", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.missle = false;
            end;
        end;
    end;
end;
v7.SelfRepair = function(v80, v81) --[[ Line: 328 ]] --[[ Name: SelfRepair ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v80.Cooldowns;
    local v83 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.air == false and _G.StamCheck("Self Repair") == true and _G.canuse == true and _G.check:inspect(l_Character_4) == true then
        local v85 = v2.GetM("Self Repair");
        local l_cd_3 = v85.cd;
        if _G.StamCheck("Self Repair") == false then
            return;
        elseif v85.statreq and _G.MeetReq(v85.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v87 = game.ReplicatedStorage.Events.Skill:InvokeServer("Self Repair", {
                cf = v80:GetMouseCFrame()
            });
            l_Cooldowns_3.air = true;
            local v88 = l_Character_4.Humanoid:LoadAnimation(script.selfRepair);
            v88:Play();
            v88:AdjustWeight(2);
            v88.Priority = Enum.AnimationPriority.Action4;
            _G.canuse = false;
            local v89 = tick();
            v80:ChargeSkill(v81, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 362 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_4 (copy), v89 (copy), v83 (copy)
                    if l_Character_4:FindFirstChild(script.Name) == nil or tick() - v89 >= 10 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v83.Stamina.Value <= 0 then
                        return true;
                    elseif _G.check:inspect(l_Character_4) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true, 
                CheckFunction = function() --[[ Line: 358 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_4 (copy)
                    l_Character_4.Humanoid.WalkSpeed = 1;
                end
            });
            l_Character_4.Humanoid.WalkSpeed = 16;
            if v87 then
                v87:FireServer(CFrame.new(l_Character_4.UpperTorso.Position));
            end;
            v88:Stop();
            _G.canuse = true;
            _G.keysetup:cooldown("Self Repair", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.air = false;
        end;
    end;
end;
local function _(v90) --[[ Line: 391 ]] --[[ Name: getLargestAxis ]]
    if math.abs(v90.X) > math.abs(v90.Y) and math.abs(v90.X) > math.abs(v90.Z) then
        return v90.X > 0 and "Right" or "Left", (math.abs(v90.X));
    elseif math.abs(v90.Z) > math.abs(v90.X) and math.abs(v90.Z) > math.abs(v90.Y) then
        return v90.Z > 0 and "Down" or "Up", (math.abs(v90.Z));
    else
        return "None", 0;
    end;
end;
v7.CyborgFlight = function(v92, v93) --[[ Line: 401 ]] --[[ Name: CyborgFlight ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy), l_l_PlayerModule_0_Controls_0 (copy)
    local l_Cooldowns_4 = v92.Cooldowns;
    local v95 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_5 = l_LocalPlayer_0.Character;
    if _G.grounded == false and l_Character_5.LowerTorso:FindFirstChild("flightBV") == nil and l_Cooldowns_4.Flight == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Cyborg Flight") == true then
        local v97 = v2.GetM("Cyborg Flight");
        local l_cd_4 = v97.cd;
        if _G.StamCheck("Cyborg Flight") == false then
            return;
        elseif v97.statreq and _G.MeetReq(v97.statreq) == false then
            return;
        elseif l_Character_5:GetAttribute("flyMode") then
            return;
        else
            l_Cooldowns_4.Flight = true;
            l_Character_5.Humanoid.WalkSpeed = 0;
            local v99 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cyborg Flight");
            local l_l_Character_5_FirstChild_0 = l_Character_5:FindFirstChild("ComboBP", true);
            if l_l_Character_5_FirstChild_0 then
                l_l_Character_5_FirstChild_0:Destroy();
            end;
            l_l_Character_5_FirstChild_0 = Instance.new("BodyVelocity", l_Character_5.LowerTorso);
            l_l_Character_5_FirstChild_0.Name = "geppo";
            l_l_Character_5_FirstChild_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            l_l_Character_5_FirstChild_0.Velocity = Vector3.new();
            local v101 = Instance.new("BodyGyro", l_Character_5.LowerTorso);
            v101.P = 100000;
            v101.D = 2500;
            v101.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            l_Character_5.Humanoid.WalkSpeed = 16;
            local v102 = false;
            do
                local l_v102_0 = v102;
                v92:DoubleCastSkill(v93, {
                    Key = Enum.KeyCode.T, 
                    SkipTap = true, 
                    CompleteFunction = function() --[[ Line: 439 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: l_v102_0 (ref)
                        l_v102_0 = true;
                    end, 
                    CancelFunction = function() --[[ Line: 442 ]] --[[ Name: CancelFunction ]]
                        -- upvalues: l_Character_5 (copy), v95 (copy), v99 (copy)
                        local v104 = true;
                        if l_Character_5.Parent == workspace.PlayerCharacters then
                            v104 = true;
                            if v95.Stamina.Value > 0 then
                                v104 = true;
                                if v99 ~= nil then
                                    v104 = v99 and v99:IsDescendantOf(game) == false;
                                end;
                            end;
                        end;
                        return v104;
                    end, 
                    PassFunction = function() --[[ Line: 445 ]] --[[ Name: PassFunction ]]
                        -- upvalues: v92 (copy), l_Character_5 (copy)
                        return v92.Tool.Parent == l_Character_5;
                    end
                });
                l_Character_5.Humanoid.PlatformStand = true;
                local v105 = Instance.new("NumberValue", game.ReplicatedStorage);
                v105.Value = 125;
                l_Character_5:PivotTo(CFrame.new(l_Character_5.HumanoidRootPart.Position, workspace.CurrentCamera.CFrame * CFrame.new(0, 0, 1000).p) * CFrame.Angles(0, 3.141592653589793, 0));
                _G.tween(v105, {
                    0.5, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Value = 35
                });
                local v106 = 0;
                for _, v108 in pairs(v92.fly) do
                    for v109 = 1, #v108 do
                        v108[v109]:Play();
                    end;
                end;
                local v110 = 0;
                while true do
                    v106 = v105.Value * (l_Character_5.Humanoid.Health / l_Character_5.Humanoid.MaxHealth);
                    if l_Character_5:FindFirstChild("Blocking") then
                        v106 = v106 * 0.2;
                    end;
                    local l_l_l_PlayerModule_0_Controls_0_MoveVector_0 = l_l_PlayerModule_0_Controls_0:GetMoveVector();
                    local l_CFrame_0 = l_Character_5.PrimaryPart.CFrame;
                    local _, _, _ = l_CFrame_0:ToOrientation();
                    local v116 = l_CFrame_0 * CFrame.new(0, 0, -100);
                    local v117 = CFrame.new(l_CFrame_0.Position, (Vector3.new(v116.X, l_CFrame_0.Y, v116.Z)));
                    local v118 = v117.LookVector:Dot(l_Character_5.Humanoid.MoveDirection);
                    local v119 = v117.RightVector:Dot(l_Character_5.Humanoid.MoveDirection);
                    if l_Character_5.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0, 0) then
                        local l_CurrentCamera_0 = workspace.CurrentCamera;
                        l_l_Character_5_FirstChild_0.Velocity = (l_CurrentCamera_0.CFrame.LookVector * -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z + l_CurrentCamera_0.CFrame.RightVector * l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X) * v106;
                        if l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z == 1 or l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z == -1 then
                            l_l_Character_5_FirstChild_0.Velocity = Vector3.new(l_l_Character_5_FirstChild_0.Velocity.X, l_l_Character_5_FirstChild_0.Velocity.Y * 2, l_l_Character_5_FirstChild_0.Velocity.Z);
                        end;
                    else
                        l_l_Character_5_FirstChild_0.Velocity = Vector3.new();
                    end;
                    if _G.FaceMouse == true or l_Character_5:FindFirstChildWhichIsA("ObjectValue") or _G.canuse == false then
                        l_l_Character_5_FirstChild_0.Velocity = Vector3.new();
                    end;
                    if _G.FaceMouse == true then
                        v101.Parent = nil;
                        v101.MaxTorque = Vector3.new(0, 0, 0, 0);
                    else
                        if l_Character_5.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0, 0) then
                            for v121, v122 in pairs(v92.fly) do
                                if v121 == "Idle" then
                                    for v123 = 1, #v122 do
                                        if v122[v123].IsPlaying == true then
                                            v122[v123]:Stop();
                                        end;
                                    end;
                                else
                                    for v124 = 1, #v122 do
                                        if v122[v124].IsPlaying == false then
                                            v122[v124]:Play();
                                        end;
                                    end;
                                end;
                            end;
                            if tick() - v110 >= 0.016666666666666666 then
                                v92.adjustWeight("Front", (math.clamp(v118, 0, 3)));
                                v92.adjustWeight("Back", (math.clamp(-v118, 0, 3)));
                                v92.adjustWeight("Right", (math.clamp(v119, 0, 3)));
                                v92.adjustWeight("Left", (math.clamp(-v119, 0, 3)));
                                v110 = tick();
                            end;
                        else
                            v92.playAnim("Idle", true);
                        end;
                        v101.Parent = l_Character_5.HumanoidRootPart;
                        v101.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                        v101.CFrame = CFrame.new(l_Character_5.HumanoidRootPart.Position, workspace.CurrentCamera.CFrame * CFrame.new(0, 0, 1000).p) * CFrame.Angles(0, 3.141592653589793, 0);
                    end;
                    l_Character_5.Humanoid.PlatformStand = true;
                    l_Character_5.Humanoid.AutoRotate = false;
                    local l_Tool_0 = l_Character_5:FindFirstChildWhichIsA("Tool");
                    if l_Tool_0 and l_Tool_0 ~= v92.Tool then
                        task.defer(function() --[[ Line: 544 ]]
                            -- upvalues: l_Character_5 (copy)
                            l_Character_5.Humanoid:UnequipTools();
                        end);
                    end;
                    if _G.grounded ~= true then
                        game["Run Service"].RenderStepped:Wait();
                        if l_v102_0 == true then
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                v92.stopAll();
                v105:Destroy();
                l_Character_5.Humanoid.AutoRotate = true;
                l_Character_5.Humanoid.PlatformStand = false;
                l_l_Character_5_FirstChild_0:Destroy();
                v101:Destroy();
                if v99 then
                    pcall(function() --[[ Line: 564 ]]
                        -- upvalues: v99 (copy)
                        v99:InvokeServer();
                    end);
                end;
                _G.keysetup:cooldown("Cyborg Flight", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.Flight = false;
            end;
        end;
    end;
end;
v7.ObliterationRush = function(v126, _) --[[ Line: 575 ]] --[[ Name: ObliterationRush ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_5 = v126.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_6 = l_LocalPlayer_0.Character;
    if l_Cooldowns_5.rush == false and _G.StamCheck("Obliteration Rush") == true and _G.canuse == true and _G.check:inspect(l_Character_6) == true then
        local v131 = v2.GetM("Obliteration Rush");
        local l_cd_5 = v131.cd;
        if _G.StamCheck("Obliteration Rush") == false then
            return;
        elseif v131.statreq and _G.MeetReq(v131.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v133 = _G.getTargetNearMouse();
            if v133 and (v133.Position - l_Character_6.PrimaryPart.Position).Magnitude >= 250 then
                v133 = nil;
            end;
            if v133 == nil then
                script.CyNoTarget:Play();
                task.wait(0.1);
                _G.canuse = true;
                return;
            else
                script.CyLockOn:Play();
                l_Cooldowns_5.rush = true;
                local v134 = "Ground";
                local v135, _, _ = _G.getRayFloor(v133.CFrame, 10);
                if v135 == nil then
                    v134 = "Air";
                end;
                local v138 = if v134 ~= "Air" then v126.playAnimation(script.GroundGrab.attempt) else v126.playAnimation(script.attemptAir);
                v138 = game.ReplicatedStorage.Events.Skill:InvokeServer("Obliteration Rush", {
                    v133, 
                    v134
                });
                _G.canuse = true;
                _G.keysetup:cooldown("Obliteration Rush", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.rush = false;
            end;
        end;
    end;
end;
return v7;