local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local v8 = RaycastParams.new();
v8.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
v8.FilterType = Enum.RaycastFilterType.Include;
local _ = l_LocalPlayer_0:GetMouse();
local v10 = setmetatable({}, v4);
v10.__index = v10;
v10.new = function(_) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v10 (copy), l_LocalPlayer_0 (copy)
    local v12 = setmetatable(v4.new(script.Name), v10);
    v12.Cooldowns = {
        ["Hellfire Ring"] = false
    };
    local _ = l_LocalPlayer_0.Character;
    return v12;
end;
v10.SoulSwap = function(v14, _) --[[ Line: 36 ]] --[[ Name: SoulSwap ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v14.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_1) == true then
        if l_Cooldowns_0["Soul Swap"] == true then
            return;
        else
            local v19 = v3.GetM("Soul Swap");
            local l_cd_0 = v19.cd;
            if _G.StamCheck("Soul Swap") == false then
                return;
            elseif v19.statreq and _G.MeetReq(v19.statreq) == false then
                return;
            else
                l_Cooldowns_0["Soul Swap"] = true;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Swap");
                _G.keysetup:cooldown("Soul Swap", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0["Soul Swap"] = false;
            end;
        end;
    end;
end;
v10.ThunderDrop = function(v22, v23) --[[ Line: 69 ]] --[[ Name: ThunderDrop ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v22.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v26 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_2) == true then
        if l_Cooldowns_1["Thunder Drop"] == true then
            return;
        else
            local v27 = v3.GetM("Thunder Drop");
            local l_cd_1 = v27.cd;
            if _G.StamCheck("Thunder Drop") == false then
                return;
            elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
                return;
            elseif l_Character_2:GetAttribute("ZeusBusy") then
                return;
            else
                l_Cooldowns_1["Thunder Drop"] = true;
                if v22.Flying == nil then
                    _G.mouseLevel = true;
                    _G.FaceMouse = true;
                end;
                local v29 = tick();
                local v30 = nil;
                if v22.Flying == nil then
                    v30 = l_Character_2.Humanoid:LoadAnimation(script.BoltCharge);
                    v30:Play();
                end;
                _G.canuse = false;
                local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunder Drop", v22:GetMouseCFrame().Position);
                local v32 = nil;
                local v33 = nil;
                if v31 then
                    local v34, v35 = unpack(v31);
                    v32 = v34;
                    v33 = v35;
                end;
                do
                    local l_v33_0 = v33;
                    local function v38() --[[ Line: 121 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_v33_0 (ref), v22 (copy), l_Character_2 (copy), v29 (copy), v26 (copy)
                        if l_v33_0 then
                            local l_Position_0 = v22:GetMouseCFrame().Position;
                            if v22.Flying ~= nil then
                                l_Position_0 = l_Character_2.PrimaryPart.Position;
                            end;
                            l_v33_0:FireServer(l_Position_0);
                        end;
                        if tick() - v29 >= 3 or v22.Tool.Parent ~= l_Character_2 or _G.check:inspect(l_Character_2) == false or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v26.Stamina.Value <= 0 or l_Character_2:FindFirstChild("PB") then
                            return true;
                        else
                            return;
                        end;
                    end;
                    v22:ChargeSkill(v23, {
                        Key = Enum.KeyCode.R, 
                        EndFunction = v38, 
                        HoldDuration = 0.25
                    });
                    if v30 then
                        v30:Stop();
                        l_Character_2.Humanoid:LoadAnimation(script.BoltStrike):Play();
                    end;
                    if v32 ~= nil then
                        local l_ZeusRoot_0 = workspace.Effects:FindFirstChild(l_LocalPlayer_0.Name .. "'s Clouds").ZeusRoot;
                        v32:SetAttribute("Released", true);
                        v32:FireServer(l_ZeusRoot_0.Position);
                        if v22.Flying == nil then
                            _G.mouseLevel = false;
                            _G.FaceMouse = false;
                            l_Character_2.PrimaryPart.Anchored = true;
                            task.wait(0.75);
                            l_Character_2.PrimaryPart.Anchored = false;
                        end;
                    end;
                    _G.mouseLevel = false;
                    _G.FaceMouse = false;
                    _G.canuse = true;
                    _G.keysetup:cooldown("Thunder Drop", l_cd_1);
                    _G.fw(l_cd_1);
                    l_Cooldowns_1["Thunder Drop"] = false;
                end;
            end;
        end;
    end;
end;
v10.StormCircuit = function(v40, _) --[[ Line: 173 ]] --[[ Name: StormCircuit ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v40.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_3) == true then
        if l_Cooldowns_2["Storm Circuit"] == true then
            return;
        elseif workspace.Effects:FindFirstChild((("%*'s Clouds"):format(l_LocalPlayer_0.Name))).Zeus:GetAttribute("CustomMover") then
            _G.displayMessage("<Color=Red>Cant use this while flying!");
            return;
        else
            local v45 = v3.GetM("Storm Circuit");
            local l_cd_2 = v45.cd;
            warn(v45);
            if v45.customCDInfo.FunctionCheck(l_LocalPlayer_0, l_Character_3) == false then
                return;
            elseif _G.StamCheck("Storm Circuit") == false then
                return;
            elseif v45.statreq and _G.MeetReq(v45.statreq) == false then
                return;
            elseif l_Character_3:GetAttribute("ZeusBusy") then
                return;
            else
                l_Cooldowns_2["Storm Circuit"] = true;
                local l_Position_1 = workspace.CurrentCamera.CFrame.Position;
                local l_v40_MouseCFrame_0 = v40:GetMouseCFrame();
                local l_Unit_0 = (l_v40_MouseCFrame_0.Position - l_Position_1).Unit;
                local v50 = RaycastParams.new();
                v50.FilterDescendantsInstances = {
                    workspace.Islands, 
                    workspace.Env, 
                    workspace.Ships
                };
                v50.FilterType = Enum.RaycastFilterType.Include;
                local v51 = workspace:Raycast(l_Position_1, l_Unit_0 * 200, v50);
                local v52 = nil;
                v52 = if v51 then v51.Position + v51.Normal * 5 else l_Position_1 + (l_v40_MouseCFrame_0.Position - l_Position_1).Unit * 200;
                _G.canuse = false;
                game.ReplicatedStorage.Events.Skill:InvokeServer("Storm Circuit", CFrame.new(v52));
                _G.canuse = true;
                if v45.customCDInfo.FunctionCheck(l_LocalPlayer_0, l_Character_3) == false and l_cd_2 >= 0.2 then
                    l_cd_2 = v45.customCDInfo.FullCooldown;
                end;
                _G.keysetup:cooldown("Storm Circuit", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2["Storm Circuit"] = false;
            end;
        end;
    end;
end;
v10.StormChaser = function(v53, _) --[[ Line: 246 ]] --[[ Name: StormChaser ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v53.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_4) == true then
        if l_Cooldowns_3["Storm Chaser"] == true then
            return;
        elseif workspace.Effects:FindFirstChild((("%*'s Clouds"):format(l_LocalPlayer_0.Name))).Zeus:GetAttribute("CustomMover") then
            _G.displayMessage("<Color=Red>Cant use this while flying!");
            return;
        else
            local v58 = v3.GetM("Storm Chaser");
            local l_cd_3 = v58.cd;
            if _G.StamCheck("Storm Chaser") == false then
                return;
            elseif v58.statreq and _G.MeetReq(v58.statreq) == false then
                return;
            elseif l_Character_4:GetAttribute("ZeusBusy") then
                return;
            else
                local v60 = _G.getTargetNearMouse(300);
                if v60 == nil then
                    _G.displayMessage("<Color=Red>No targets");
                    return;
                else
                    l_Cooldowns_3["Storm Chaser"] = true;
                    _G.canuse = false;
                    l_Character_4:SetPrimaryPartCFrame(CFrame.new(l_Character_4.PrimaryPart.Position, v60.Position));
                    l_Character_4.Humanoid:LoadAnimation(script.SendZeus):Play();
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Storm Chaser", {
                        target = v60, 
                        startCFrame = l_Character_4.PrimaryPart.CFrame
                    });
                    task.wait(0.35);
                    _G.canuse = true;
                    _G.keysetup:cooldown("Storm Chaser", l_cd_3);
                    _G.fw(l_cd_3);
                    l_Cooldowns_3["Storm Chaser"] = false;
                end;
            end;
        end;
    end;
end;
v10.ProminenceRay = function(v61, v62) --[[ Line: 306 ]] --[[ Name: ProminenceRay ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v61.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v65 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_5) == true and _G.StamCheck("Prominence Ray") == true then
        local l_cd_4 = v3.GetM("Prominence Ray").cd;
        if l_Cooldowns_4["Prominence Ray"] == true then
            return;
        elseif l_Character_5:GetAttribute("SunBusy") then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_4["Prominence Ray"] = true;
            local v67 = os.clock();
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v68 = game.ReplicatedStorage.Events.Skill:InvokeServer("Prominence Ray", v61:GetMouseCFrame().Position);
            local v69 = nil;
            local v70 = nil;
            if v68 then
                local v71, v72 = unpack(v68);
                v69 = v71;
                v70 = v72;
            end;
            local _ = v61.Tool:FindFirstChild("UpdateHomies", true);
            do
                local l_v69_0, l_v70_0 = v69, v70;
                local function v77(_) --[[ Line: 341 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_5 (copy), l_v70_0 (ref), v61 (copy), l_v69_0 (ref), v65 (copy), v67 (copy)
                    l_Character_5.Humanoid.WalkSpeed = 4;
                    if l_v70_0 then
                        l_v70_0:FireServer(v61:GetMouseCFrame().Position);
                    end;
                    if not l_v69_0 then
                        return true;
                    elseif v61.Tool.Parent ~= l_Character_5 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v65.Stamina.Value <= 0 or os.clock() - v67 >= 5 or _G.check:inspect(l_Character_5) == false then
                        return true;
                    else
                        return;
                    end;
                end;
                v61:ChargeSkill(v62, {
                    Key = Enum.KeyCode.Z, 
                    EndFunction = v77, 
                    IgnoreInstantCastSetting = true
                });
                l_Character_5.Humanoid.WalkSpeed = 16;
                if l_v69_0 then
                    l_v69_0:FireServer("Finished");
                end;
                _G.FaceMouse = false;
                _G.mouseLevel = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Prominence Ray", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4["Prominence Ray"] = false;
            end;
        end;
    end;
end;
v10["Bon-BonFireball"] = function(v78, _) --[[ Line: 377 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v78.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_6) == true then
        if l_Cooldowns_5["Bon-Bon Fireball"] == true then
            return;
        else
            local v83 = v3.GetM("Bon-Bon Fireball");
            local l_cd_5 = v83.cd;
            if _G.StamCheck("Bon-Bon Fireball") == false then
                return;
            elseif v83.statreq and _G.MeetReq(v83.statreq) == false then
                return;
            elseif l_Character_6:GetAttribute("SunBusy") then
                return;
            else
                local l_FirstChild_1 = workspace.Effects:FindFirstChild((("%*'s Clouds"):format(l_LocalPlayer_0.Name)));
                local l_Prometheus_0 = l_FirstChild_1.Prometheus;
                local l_PrometheusRoot_0 = l_FirstChild_1.PrometheusRoot;
                local _ = l_Prometheus_0.PrimaryPart;
                l_Cooldowns_5["Bon-Bon Fireball"] = true;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Bon-Bon Fireball", {
                    MousePosition = v78:GetMouseCFrame().Position, 
                    SunCFrame = l_PrometheusRoot_0.CFrame
                });
                _G.keysetup:cooldown("Bon-Bon Fireball", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5["Bon-Bon Fireball"] = false;
            end;
        end;
    end;
end;
v10["Bon-BonBomb"] = function(v90, v91) --[[ Line: 417 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_RunService_0 (copy)
    local l_Cooldowns_6 = v90.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local v94 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = l_Character_7.RightHand;
    if _G.check:inspect(l_Character_7) == true and _G.StamCheck("Bon-Bon Bomb") == true then
        if l_Cooldowns_6["Bon-Bon Bomb"] == true then
            return;
        elseif l_Character_7:GetAttribute("SunBusy") then
            return;
        else
            local l_cd_6 = v3.GetM("Bon-Bon Bomb").cd;
            local l_FirstChild_2 = workspace.Effects:FindFirstChild((("%*'s Clouds"):format(l_LocalPlayer_0.Name)));
            local l_RootPart_0 = l_FirstChild_2.Prometheus.RootPart;
            local l_PrometheusRoot_1 = l_FirstChild_2.PrometheusRoot;
            local v100 = l_Character_7.Humanoid.Animator:LoadAnimation(script.BombCharge);
            v100:Play();
            _G.FaceMouse = true;
            _G.canuse = false;
            l_Cooldowns_6["Bon-Bon Bomb"] = true;
            local v101 = os.clock();
            local v102 = game.ReplicatedStorage.Events.Skill:InvokeServer("Bon-Bon Bomb");
            local v103 = os.clock();
            local v109 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 450 ]]
                -- upvalues: v103 (copy), l_Character_7 (copy), l_PrometheusRoot_1 (copy)
                local v105 = math.clamp((os.clock() - v103) * 3, 0, 1);
                local v106 = 1 - v105;
                local v107 = CFrame.new(l_Character_7.RightHand.CFrame * CFrame.Angles(0, math.rad(v105 * 360), 0) * CFrame.new(0, v106 * -2, v106 * 5).Position, l_Character_7.PrimaryPart.CFrame * CFrame.new(0, 5, 25).Position);
                local v108 = l_PrometheusRoot_1.CFrame:Lerp(v107, v105);
                l_PrometheusRoot_1.BodyPosition.Position = v108.Position;
                l_PrometheusRoot_1.BodyGyro.CFrame = v108;
                l_PrometheusRoot_1.CFrame = v108;
            end);
            v90:ChargeSkill(v91, {
                Key = Enum.KeyCode.X, 
                EndFunction = function(_) --[[ Line: 462 ]] --[[ Name: endFunction ]]
                    -- upvalues: v102 (copy), v90 (copy), l_Character_7 (copy), v94 (copy), v101 (copy)
                    if not v102 then
                        return true;
                    elseif v90.Tool.Parent ~= l_Character_7 or l_Character_7.Parent == nil or l_Character_7.Parent ~= workspace.PlayerCharacters or v94.Stamina.Value <= 0 or os.clock() - v101 >= 5 or _G.check:inspect(l_Character_7) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.3
            });
            v100:Stop();
            l_Character_7.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            l_Character_7.Humanoid.Animator:LoadAnimation(script.BombThrow):Play();
            task.wait(0.15);
            if v102 then
                v102:FireServer(v90:GetMouseCFrame().Position, l_RootPart_0.CFrame);
            end;
            v109:Disconnect();
            v109 = nil;
            task.wait(0.3);
            l_Character_7.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Bon-Bon Bomb", l_cd_6);
            _G.fw(l_cd_6);
            l_Cooldowns_6["Bon-Bon Bomb"] = false;
        end;
    end;
end;
v10.NimbusRide = function(v111, v112) --[[ Line: 505 ]] --[[ Name: NimbusRide ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_RunService_0 (copy), l_l_PlayerModule_0_Controls_0 (copy)
    local l_Cooldowns_7 = v111.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local v115 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = l_Character_8.RightHand;
    if _G.check:inspect(l_Character_8) == true and _G.StamCheck("Nimbus Ride") == true then
        if l_Cooldowns_7["Nimbus Ride"] == true then
            return;
        elseif l_Character_8:GetAttribute("ZeusBusy") then
            return;
        else
            local l_cd_7 = v3.GetM("Nimbus Ride").cd;
            local l_FirstChild_3 = workspace.Effects:FindFirstChild((("%*'s Clouds"):format(l_LocalPlayer_0.Name)));
            local l_Zeus_0 = l_FirstChild_3.Zeus;
            local _ = l_Zeus_0.RootPart;
            local l_ZeusRoot_1 = l_FirstChild_3.ZeusRoot;
            l_Cooldowns_7["Nimbus Ride"] = true;
            _G.canM1 = false;
            _G.canuse = false;
            local v122 = game.ReplicatedStorage.Events.Skill:InvokeServer("Nimbus Ride");
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local l_Humanoid_0 = l_Character_8.Humanoid;
            local l_BodyPosition_0 = l_ZeusRoot_1.BodyPosition;
            local l_BodyGyro_0 = l_ZeusRoot_1.BodyGyro;
            l_Humanoid_0.PlatformStand = true;
            local l_PrimaryPart_1 = l_Character_8.PrimaryPart;
            local l_AssemblyMass_0 = l_PrimaryPart_1.AssemblyMass;
            local v129 = Vector3.new(0, 1, 0, 0) * l_AssemblyMass_0 * workspace.Gravity;
            local l_VectorForce_0 = Instance.new("VectorForce");
            l_VectorForce_0.Attachment0 = l_PrimaryPart_1:FindFirstChild("RootRigAttachment");
            l_VectorForce_0.RelativeTo = Enum.ActuatorRelativeTo.World;
            l_VectorForce_0.Parent = l_PrimaryPart_1;
            local l_AlignOrientation_0 = Instance.new("AlignOrientation");
            l_AlignOrientation_0.Attachment0 = l_VectorForce_0.Attachment0;
            l_AlignOrientation_0.CFrame = CFrame.new();
            l_AlignOrientation_0.MaxTorque = 50000;
            l_AlignOrientation_0.Mode = Enum.OrientationAlignmentMode.OneAttachment;
            l_AlignOrientation_0.Parent = l_PrimaryPart_1;
            l_AlignOrientation_0.CFrame = CFrame.lookAlong(l_CurrentCamera_0.CFrame.Position, Vector3.new(0, 1, 0, 0):Cross(l_CurrentCamera_0.CFrame.RightVector));
            local v132 = l_Zeus_0.AnimationController:LoadAnimation(script.FlyAnims.ZeusFly);
            v132:Play();
            v132.Priority = Enum.AnimationPriority.Action3;
            local v133 = l_Character_8.Humanoid:LoadAnimation(script.FlyAnims.CharFly);
            v133:Play();
            v133.Priority = Enum.AnimationPriority.Action3;
            v111.Flying = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 570 ]]
                -- upvalues: l_l_PlayerModule_0_Controls_0 (ref), l_CurrentCamera_0 (copy), l_Character_8 (copy), l_AssemblyMass_0 (copy), l_PrimaryPart_1 (copy), l_Zeus_0 (copy), l_BodyPosition_0 (copy), l_BodyGyro_0 (copy), l_Humanoid_0 (copy), l_AlignOrientation_0 (copy), l_VectorForce_0 (copy), v129 (copy), v111 (copy)
                local l_l_l_PlayerModule_0_Controls_0_MoveVector_0 = l_l_PlayerModule_0_Controls_0:GetMoveVector();
                local v136 = l_CurrentCamera_0.CFrame.RightVector * l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X + l_CurrentCamera_0.CFrame.LookVector * -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z;
                local v137 = 125;
                local v138 = 1;
                local v139 = l_Character_8.Humanoid.Health / l_Character_8.Humanoid.MaxHealth;
                if v139 <= 0.25 then
                    v138 = v139;
                end;
                v137 = v137 * v138;
                if l_Character_8:FindFirstChild("Blocking") then
                    v137 = v137 / 7;
                end;
                if _G.check:inspect(l_Character_8) == false then
                    v137 = v137 / 10;
                end;
                if _G.canuse == false then
                    v137 = 0;
                end;
                local v140 = v136 * l_AssemblyMass_0 * v137;
                local v141 = l_PrimaryPart_1.AssemblyLinearVelocity * l_AssemblyMass_0 * 2;
                local v142 = l_Zeus_0:GetScale() or 1;
                local v143 = l_PrimaryPart_1.CFrame * CFrame.new(0, -3 * v142, 0);
                l_BodyPosition_0.Position = v143.Position;
                l_BodyGyro_0.CFrame = v143;
                if l_Humanoid_0.MoveDirection ~= Vector3.new() then
                    l_AlignOrientation_0.CFrame = CFrame.lookAlong(l_CurrentCamera_0.CFrame.Position, Vector3.new(0, 1, 0, 0):Cross(l_CurrentCamera_0.CFrame.RightVector));
                end;
                l_VectorForce_0.Force = v129 + v140 - v141;
                l_Humanoid_0.PlatformStand = true;
                _G.canM1 = false;
                local l_Tool_0 = l_Character_8:FindFirstChildWhichIsA("Tool");
                if l_Tool_0 and l_Tool_0 ~= v111.Tool then
                    task.defer(function() --[[ Line: 611 ]]
                        -- upvalues: l_Character_8 (ref)
                        l_Character_8.Humanoid:UnequipTools();
                    end);
                end;
            end);
            local v145 = tick();
            local function v146() --[[ Line: 619 ]] --[[ Name: finishFunction ]]
                -- upvalues: v111 (copy), v122 (copy), v132 (copy), v133 (copy), l_Character_8 (copy), l_AlignOrientation_0 (copy), l_VectorForce_0 (copy), l_cd_7 (copy), l_Cooldowns_7 (copy)
                if v111.Flying then
                    v111.Flying:Disconnect();
                    v111.Flying = nil;
                end;
                if v122 then
                    v122:FireServer();
                end;
                v132:Stop();
                v133:Stop();
                l_Character_8.Humanoid.PlatformStand = false;
                l_AlignOrientation_0:Destroy();
                l_VectorForce_0:Destroy();
                _G.keysetup:cooldown("Nimbus Ride", l_cd_7);
                _G.canM1 = true;
                _G.fw(l_cd_7);
                l_Cooldowns_7["Nimbus Ride"] = false;
            end;
            _G.canuse = true;
            v111:DoubleCastSkill(v112, {
                ToolName = script.Name, 
                Button = v112, 
                Key = Enum.KeyCode.T, 
                CheckFunction = function() --[[ Line: 647 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_8 (copy), v145 (copy), v115 (copy)
                    if l_Character_8:FindFirstChild("inCombat") and tick() - v145 >= 30 then
                        return true;
                    else
                        local v147 = true;
                        if l_Character_8.Parent == workspace.PlayerCharacters then
                            v147 = true;
                            if v115.Stamina.Value > 0 then
                                v147 = true;
                                if _G.grounded ~= true then
                                    v147 = l_Character_8:GetAttribute("ZeusFlying") == nil;
                                end;
                            end;
                        end;
                        return v147;
                    end;
                end, 
                CompleteFunction = v146, 
                SkipTap = true
            });
        end;
    end;
end;
v10.SoulRage = function(v148, _) --[[ Line: 661 ]] --[[ Name: SoulRage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_8 = v148.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_9) == true then
        if l_Cooldowns_8["Soul Rage"] == true then
            return;
        else
            local v153 = v3.GetM("Soul Rage");
            local l_cd_8 = v153.cd;
            if _G.StamCheck("Soul Rage") == false then
                return;
            elseif v153.statreq and _G.MeetReq(v153.statreq) == false then
                return;
            else
                l_Cooldowns_8["Soul Rage"] = true;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Rage");
                _G.keysetup:cooldown("Soul Rage", l_cd_8);
                _G.fw(l_cd_8);
                l_Cooldowns_8["Soul Rage"] = false;
            end;
        end;
    end;
end;
v10["Bon-BonTorch"] = function(v156, v157) --[[ Line: 694 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_9 = v156.Cooldowns;
    local l_Character_10 = l_LocalPlayer_0.Character;
    local v160 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_10) == true and _G.StamCheck("Bon-Bon Torch") == true then
        local l_cd_9 = v3.GetM("Bon-Bon Torch").cd;
        if l_Cooldowns_9["Bon-Bon Torch"] == true then
            return;
        elseif l_Character_10:GetAttribute("SunBusy") then
            return;
        else
            local v162 = os.clock();
            l_Cooldowns_9["Bon-Bon Torch"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v163 = game.ReplicatedStorage.Events.Skill:InvokeServer("Bon-Bon Torch");
            v156:ChargeSkill(v157, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function(_) --[[ Line: 718 ]] --[[ Name: endFunction ]]
                    -- upvalues: v163 (copy), v156 (copy), l_Character_10 (copy), v160 (copy), v162 (copy)
                    if not v163 then
                        return true;
                    elseif v156.Tool.Parent ~= l_Character_10 or l_Character_10.Parent == nil or l_Character_10.Parent ~= workspace.PlayerCharacters or v160.Stamina.Value <= 0 or os.clock() - v162 >= 5 or _G.check:inspect(l_Character_10) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true, 
                HoldDuration = 0.35
            });
            if v163 then
                v163:FireServer("Finished");
            end;
            _G.FaceMouse = false;
            l_Character_10.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Bon-Bon Torch", l_cd_9);
            _G.fw(l_cd_9);
            l_Cooldowns_9["Bon-Bon Torch"] = nil;
        end;
    end;
end;
v10.SunfallCataclysm = function(v165, v166) --[[ Line: 750 ]] --[[ Name: SunfallCataclysm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_10 = v165.Cooldowns;
    local l_Character_11 = l_LocalPlayer_0.Character;
    local v169 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_11) == true and _G.StamCheck("Sunfall Cataclysm") == true then
        local l_cd_10 = v3.GetM("Sunfall Cataclysm").cd;
        if l_Cooldowns_10["Sunfall Cataclysm"] == true then
            return;
        elseif l_Character_11:GetAttribute("SunBusy") then
            return;
        else
            local v171 = os.clock();
            l_Cooldowns_10["Sunfall Cataclysm"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v172 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sunfall Cataclysm");
            local v173 = l_Character_11.Humanoid:LoadAnimation(script.SunUlt.Loop);
            v173:Play();
            local function v175(_) --[[ Line: 778 ]] --[[ Name: endFunction ]]
                -- upvalues: v172 (copy), v165 (copy), l_Character_11 (copy), v169 (copy), v171 (copy)
                if not v172 then
                    return true;
                elseif v165.Tool.Parent ~= l_Character_11 or l_Character_11.Parent == nil or l_Character_11.Parent ~= workspace.PlayerCharacters or v169.Stamina.Value <= 0 or os.clock() - v171 >= 4 or _G.check:inspect(l_Character_11) == false then
                    return true;
                else
                    return;
                end;
            end;
            local l_Prometheus_1 = workspace.Effects[l_Character_11.Name .. "'s Clouds"].Prometheus;
            v165:ChargeSkill(v166, {
                Key = Enum.KeyCode.X, 
                EndFunction = v175, 
                IgnoreInstantCastSetting = true
            });
            v173:Stop();
            l_Character_11.Humanoid:LoadAnimation(script.SunUlt.Release):Play();
            if v172 then
                v172:FireServer(v165:GetMouseCFrame().Position, l_Prometheus_1:GetScale(), l_Prometheus_1.PrimaryPart.CFrame);
            end;
            _G.FaceMouse = false;
            l_Character_11.PrimaryPart.Anchored = true;
            task.wait(0.75);
            l_Character_11.PrimaryPart.Anchored = false;
            l_Character_11.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Sunfall Cataclysm", l_cd_10);
            _G.fw(l_cd_10);
            l_Cooldowns_10["Sunfall Cataclysm"] = nil;
        end;
    end;
end;
local function v184(v177, v178) --[[ Line: 819 ]] --[[ Name: getCelingCFrame ]]
    local l_Position_2 = v177.PrimaryPart.Position;
    local v180 = Vector3.new(0, v178, 0);
    local v181 = RaycastParams.new();
    v181.FilterDescendantsInstances = {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships
    };
    v181.FilterType = Enum.RaycastFilterType.Include;
    v181.RespectCanCollide = true;
    local v182 = workspace:Raycast(l_Position_2, v180, v181);
    if v182 and v182.Instance then
        local _ = math.min(v178, (v182.Position - l_Position_2).Magnitude - 0.5);
        return v177.PrimaryPart.CFrame;
    else
        return v177.PrimaryPart.CFrame * CFrame.new(0, v178, 0);
    end;
end;
v10.ZigzagBolt = function(v185, v186) --[[ Line: 839 ]] --[[ Name: ZigzagBolt ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v184 (copy)
    local l_Cooldowns_11 = v185.Cooldowns;
    local l_Character_12 = l_LocalPlayer_0.Character;
    local v189 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_12) == true and _G.StamCheck("Zigzag Bolt") == true then
        local l_cd_11 = v3.GetM("Zigzag Bolt").cd;
        if l_Cooldowns_11["Zigzag Bolt"] == true then
            return;
        elseif l_Character_12:GetAttribute("ZeusBusy") then
            return;
        else
            local v191 = os.clock();
            l_Cooldowns_11["Zigzag Bolt"] = true;
            _G.canuse = false;
            local l_FirstChild_4 = workspace.Effects:FindFirstChild((("%*'s Clouds"):format(l_LocalPlayer_0.Name)));
            local l_Zeus_1 = l_FirstChild_4.Zeus;
            local l_ZeusRoot_2 = l_FirstChild_4.ZeusRoot;
            l_Zeus_1:SetAttribute("CustomMovement", true);
            l_Character_12.PrimaryPart.CFrame = v184(l_Character_12, 5);
            local _ = l_Character_12.PrimaryPart;
            local l_Humanoid_1 = l_Character_12.Humanoid;
            l_Humanoid_1.PlatformStand = true;
            local v197 = l_Humanoid_1:LoadAnimation(script.ZigzagCharge);
            v197:Play();
            v197.Priority = Enum.AnimationPriority.Action2;
            local v198 = l_Zeus_1.RageModel.AnimationController:LoadAnimation(l_ReplicatedStorage_0.Assets.SoulHomies.Animations.ZeusRageIdle);
            v198:Play();
            v198.Priority = Enum.AnimationPriority.Action2;
            _G.FaceMouse = true;
            local v199 = game.ReplicatedStorage.Events.Skill:InvokeServer("Zigzag Bolt", l_Character_12.PrimaryPart.CFrame);
            local function v201(_) --[[ Line: 885 ]] --[[ Name: endFunction ]]
                -- upvalues: v199 (copy), l_ZeusRoot_2 (copy), l_Character_12 (copy), v185 (copy), v189 (copy), v191 (copy)
                if not v199 then
                    return true;
                else
                    l_ZeusRoot_2.CFrame = l_Character_12.PrimaryPart.CFrame * CFrame.new(0, -4, 0);
                    if v185.Tool.Parent ~= l_Character_12 or l_Character_12.Parent == nil or l_Character_12.Parent ~= workspace.PlayerCharacters or v189.Stamina.Value <= 0 or os.clock() - v191 >= 5 or _G.check:inspect(l_Character_12) == false then
                        return true;
                    else
                        return;
                    end;
                end;
            end;
            local _ = workspace.Effects[l_Character_12.Name .. "'s Clouds"].Prometheus;
            v185:ChargeSkill(v186, {
                Key = Enum.KeyCode.Z, 
                EndFunction = v201, 
                HoldDuration = 0.15
            });
            l_Humanoid_1.PlatformStand = false;
            if v199 then
                v199:InvokeServer(v185:GetMouseCFrame().Position);
            end;
            v197:Stop();
            v198:Stop();
            _G.FaceMouse = false;
            l_Character_12.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Zigzag Bolt", l_cd_11);
            _G.fw(l_cd_11);
            l_Cooldowns_11["Zigzag Bolt"] = nil;
        end;
    end;
end;
v10.RaijinPlunge = function(v203, v204) --[[ Line: 925 ]] --[[ Name: RaijinPlunge ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v184 (copy)
    local l_Cooldowns_12 = v203.Cooldowns;
    local l_Character_13 = l_LocalPlayer_0.Character;
    local v207 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_13) == true and _G.StamCheck("Raijin Plunge") == true then
        local l_cd_12 = v3.GetM("Raijin Plunge").cd;
        if l_Cooldowns_12["Raijin Plunge"] == true then
            return;
        elseif l_Character_13:GetAttribute("ZeusBusy") then
            return;
        else
            local v209 = os.clock();
            l_Cooldowns_12["Raijin Plunge"] = true;
            l_Character_13.PrimaryPart.CFrame = v184(l_Character_13, 5);
            _G.canuse = false;
            _G.FaceMouse = true;
            local v210 = game.ReplicatedStorage.Events.Skill:InvokeServer("Raijin Plunge", l_Character_13.PrimaryPart.CFrame);
            local function v212(_) --[[ Line: 951 ]] --[[ Name: endFunction ]]
                -- upvalues: v210 (copy), v203 (copy), l_Character_13 (copy), v207 (copy), v209 (copy)
                if not v210 then
                    return true;
                elseif v203.Tool.Parent ~= l_Character_13 or l_Character_13.Parent == nil or l_Character_13.Parent ~= workspace.PlayerCharacters or v207.Stamina.Value <= 0 or os.clock() - v209 >= 5 or _G.check:inspect(l_Character_13) == false then
                    return true;
                else
                    return;
                end;
            end;
            local _ = workspace.Effects[l_Character_13.Name .. "'s Clouds"].Prometheus;
            v203:ChargeSkill(v204, {
                Key = Enum.KeyCode.R, 
                EndFunction = v212, 
                HoldDuration = 0.1
            });
            _G.FaceMouse = false;
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            l_BodyVelocity_0.Velocity = Vector3.new();
            l_BodyVelocity_0.Parent = l_Character_13.PrimaryPart;
            l_Character_13.Humanoid.AutoRotate = false;
            if v210 then
                v210:InvokeServer(v203:GetMouseCFrame().Position);
            end;
            l_BodyVelocity_0:Destroy();
            l_Character_13.Humanoid.AutoRotate = true;
            l_Character_13.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Raijin Plunge", l_cd_12);
            _G.fw(l_cd_12);
            l_Cooldowns_12["Raijin Plunge"] = nil;
        end;
    end;
end;
v10.DivineThunderfall = function(v215, v216) --[[ Line: 993 ]] --[[ Name: DivineThunderfall ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_13 = v215.Cooldowns;
    local l_Character_14 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_14) == true and _G.StamCheck("Divine Thunderfall") == true then
        local l_cd_13 = v3.GetM("Divine Thunderfall").cd;
        if l_Cooldowns_13["Divine Thunderfall"] == true then
            return;
        elseif l_Character_14:GetAttribute("ZeusBusy") then
            return;
        else
            local v221 = os.clock();
            l_Cooldowns_13["Divine Thunderfall"] = true;
            _G.canuse = false;
            local _ = os.clock();
            local v223 = workspace.Effects[l_Character_14.Name .. "'s Clouds"];
            local _ = v223.Zeus;
            local l_ZeusRoot_3 = v223.ZeusRoot;
            local l_HumanoidRootPart_0 = l_Character_14.HumanoidRootPart;
            local _ = l_ZeusRoot_3.BodyPosition;
            if l_Character_14.HumanoidRootPart:FindFirstChild("ComboBP") == nil then
                local v228 = Instance.new("BodyVelocity", l_Character_14.LowerTorso);
                v228.Name = "geppo";
                v228.MaxForce = Vector3.new(1000000000, 1.0000000272564224E16, 1000000000, 0);
                v228.Velocity = l_Character_14.HumanoidRootPart.CFrame.upVector * 100;
                v228.P = 4324234234;
                _G.destroy(v228, 0.25);
                task.delay(0.2, function() --[[ Line: 1035 ]]
                    _G.FaceMouse = true;
                end);
            end;
            local v229 = game.ReplicatedStorage.Events.Skill:InvokeServer("Divine Thunderfall");
            local v230 = nil;
            local v231 = nil;
            if v229 then
                local v232, v233 = unpack(v229);
                v230 = v232;
                v231 = v233;
            end;
            local v234 = 200;
            local v235 = 0;
            do
                local l_v230_0, l_v235_0 = v230, v235;
                local v253 = task.spawn(function() --[[ Line: 1050 ]]
                    -- upvalues: l_ZeusRoot_3 (copy), l_v235_0 (ref), v215 (copy), l_HumanoidRootPart_0 (copy)
                    local v238 = Vector3.new(0, 0, 0, 0);
                    local l_CFrame_0 = l_ZeusRoot_3.CFrame;
                    local l_Position_3 = l_CFrame_0.Position;
                    local v241 = 0.5;
                    local v242 = 10;
                    while true do
                        local v243 = task.wait();
                        local v244 = math.min(l_v235_0 / 2, 1);
                        local v245 = v244 >= 1;
                        local v246 = Vector3.new(math.sin(18.84955592153876 * v244), 0, (math.cos(18.84955592153876 * v244))) * math.sin(v244 * 3.141592653589793) * 25;
                        local l_v215_MousePosition_0 = v215:GetMousePosition();
                        local v248 = Vector3.new(0, 50, 0, 0) * v244;
                        l_v235_0 = l_v235_0 + v243;
                        local v249 = v245 and 1.5 or 0.5;
                        local v250 = v245 and 11 or 10;
                        v241 = v241 + (v249 - v241) * v243 * 2;
                        v242 = v242 + (v250 - v242) * v243 * 2;
                        local v251 = Vector3.new(l_v215_MousePosition_0.X, l_HumanoidRootPart_0.Position.Y, l_v215_MousePosition_0.Z) - l_HumanoidRootPart_0.Position;
                        if v251.Magnitude > 200 then
                            v251 = v251.Unit * 200;
                        end;
                        v238 = v238:Lerp(v251, v243 * v241);
                        local v252 = l_HumanoidRootPart_0.Position + v246 + v238 + v248;
                        if (v252 - l_Position_3).Magnitude > 0.1 then
                            l_CFrame_0 = l_CFrame_0:Lerp(CFrame.new(l_Position_3, (Vector3.new(v252.X, l_Position_3.Y, v252.Z))), v243 * v242);
                        end;
                        l_ZeusRoot_3.BodyGyro.CFrame = l_CFrame_0;
                        l_ZeusRoot_3.BodyPosition.Position = v252;
                        l_Position_3 = v252;
                    end;
                end);
                l_v230_0.OnClientInvoke = function() --[[ Line: 1099 ]]
                    -- upvalues: v253 (copy)
                    task.defer(task.cancel, v253);
                end;
                local function v255(_) --[[ Line: 1103 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_v230_0 (ref), v215 (copy), l_Character_14 (copy), v221 (copy)
                    if not l_v230_0 then
                        return true;
                    elseif v215.Tool.Parent ~= l_Character_14 or l_Character_14.Parent == nil or l_Character_14.Parent ~= workspace.PlayerCharacters or os.clock() - v221 >= 5 then
                        return true;
                    else
                        return;
                    end;
                end;
                v215:ChargeSkill(v216, {
                    Key = Enum.KeyCode.X, 
                    EndFunction = v255, 
                    IgnoreInstantCastSetting = true
                });
                v234 = 100;
                task.spawn(function() --[[ Line: 1121 ]]
                    -- upvalues: l_v230_0 (ref)
                    if l_v230_0 then
                        l_v230_0:InvokeServer("Finished");
                    end;
                end);
                if v231 and v231:GetAttribute("ThunderStart") == nil then
                    repeat
                        task.wait();
                    until v231:GetAttribute("ThunderStart");
                end;
                if v231 and v231:GetAttribute("Ended") == nil then
                    repeat
                        task.wait();
                    until v231:GetAttribute("Ended") or v231:IsDescendantOf(game) == false;
                end;
                _G.FaceMouse = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Divine Thunderfall", l_cd_13);
                _G.fw(l_cd_13);
                l_Cooldowns_13["Divine Thunderfall"] = nil;
            end;
        end;
    end;
end;
v10.ProminencePunch = function(v256, v257) --[[ Line: 1148 ]] --[[ Name: ProminencePunch ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_14 = v256.Cooldowns;
    local l_Character_15 = l_LocalPlayer_0.Character;
    local v260 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = l_Character_15.RightHand;
    if _G.check:inspect(l_Character_15) == true and _G.StamCheck("Prominence Punch") == true then
        local l_cd_14 = v3.GetM("Prominence Punch").cd;
        if l_Cooldowns_14["Prominence Punch"] == true then
            return;
        elseif l_Character_15:GetAttribute("SunBusy") then
            return;
        else
            local _ = workspace.Effects[l_Character_15.Name .. "'s Clouds"].Prometheus.RootPart;
            local v264 = os.clock();
            l_Cooldowns_14["Prominence Punch"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v265 = l_Character_15.Humanoid:LoadAnimation(script.CharPunch);
            v265:Play();
            local v266 = game.ReplicatedStorage.Events.Skill:InvokeServer("Prominence Punch");
            v256:ChargeSkill(v257, {
                Key = Enum.KeyCode.R, 
                EndFunction = function(_) --[[ Line: 1183 ]] --[[ Name: endFunction ]]
                    -- upvalues: v266 (copy), v256 (copy), l_Character_15 (copy), v260 (copy), v264 (copy)
                    if not v266 then
                        return true;
                    elseif v256.Tool.Parent ~= l_Character_15 or l_Character_15.Parent == nil or l_Character_15.Parent ~= workspace.PlayerCharacters or v260.Stamina.Value <= 0 or os.clock() - v264 >= 5 or _G.check:inspect(l_Character_15) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.3
            });
            v265:Stop();
            l_Character_15.Humanoid:LoadAnimation(script.CharPunchRelease):Play();
            _G.FaceMouse = false;
            if v266 then
                l_Character_15.PrimaryPart.Anchored = true;
                v266:FireServer(v256:GetMousePosition());
                task.wait(0.6);
                l_Character_15.PrimaryPart.Anchored = false;
            end;
            task.wait();
            _G.canuse = true;
            _G.keysetup:cooldown("Prominence Punch", l_cd_14);
            _G.fw(l_cd_14);
            l_Cooldowns_14["Prominence Punch"] = nil;
        end;
    end;
end;
v10.SoulSummoning = function(v268, _) --[[ Line: 1221 ]] --[[ Name: SoulSummoning ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_15 = v268.Cooldowns;
    local l_Character_16 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_16) == true then
        if l_Cooldowns_15["Soul Summoning"] == true then
            return;
        else
            local v273 = v3.GetM("Soul Summoning");
            local l_cd_15 = v273.cd;
            if _G.StamCheck("Soul Summoning") == false then
                return;
            elseif v273.statreq and _G.MeetReq(v273.statreq) == false then
                return;
            else
                l_Cooldowns_15["Soul Summoning"] = true;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Summoning");
                if l_Character_16:GetAttribute("SoulSummonMode") == true then
                    if v268.SoulSummonUI == nil then
                        v268.SoulSummonUI = script.SoulSummonUI:Clone();
                        v268.SoulSummonUI.ImageLabel.ImageTransparency = 1;
                        v268.SoulSummonUI.Parent = l_LocalPlayer_0.PlayerGui;
                        _G.tween(v268.SoulSummonUI.ImageLabel, {
                            0.25, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            ImageTransparency = script.SoulSummonUI.ImageLabel.ImageTransparency
                        });
                    end;
                elseif v268.SoulSummonUI then
                    _G.tween(v268.SoulSummonUI.ImageLabel, {
                        0.25, 
                        Enum.EasingStyle.Quad, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        ImageTransparency = 1
                    });
                    _G.destroy(v268.SoulSummonUI, 0.25);
                    v268.SoulSummonUI = nil;
                end;
                _G.keysetup:cooldown("Soul Summoning", l_cd_15);
                _G.fw(l_cd_15);
                l_Cooldowns_15["Soul Summoning"] = false;
            end;
        end;
    end;
end;
for _, v277 in ipairs({
    "Lick, the Lollipop", 
    "Crumbleshot, the Cake", 
    "Gloomroot, the Tree"
}) do
    v10[v277:gsub("%s", "")] = function(v278) --[[ Line: 1280 ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v277 (copy), v3 (copy)
        local l_Cooldowns_16 = v278.Cooldowns;
        local l_Character_17 = l_LocalPlayer_0.Character;
        local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
        if _G.check:inspect(l_Character_17) == true then
            local l_v277_0 = v277;
            if l_Cooldowns_16[l_v277_0] == true then
                return;
            else
                local v283 = v3.GetM(l_v277_0);
                local l_cd_16 = v283.cd;
                if _G.StamCheck(l_v277_0) == false then
                    return;
                elseif v283.statreq and _G.MeetReq(v283.statreq) == false then
                    return;
                else
                    l_Cooldowns_16[l_v277_0] = true;
                    _G.canuse = false;
                    l_Character_17.Humanoid.WalkSpeed = 4;
                    local _ = game.ReplicatedStorage.Events.Skill:InvokeServer(l_v277_0, {
                        SpawnCFrame = v278:GetMouseCFrame()
                    });
                    _G.canuse = true;
                    l_Character_17.Humanoid.WalkSpeed = 16;
                    _G.keysetup:cooldown(l_v277_0, l_cd_16);
                    _G.fw(l_cd_16);
                    l_Cooldowns_16[l_v277_0] = false;
                end;
            end;
        end;
    end;
end;
return v10;