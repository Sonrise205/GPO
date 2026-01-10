local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local _ = l_LocalPlayer_0:GetMouse();
local v9 = setmetatable({}, v4);
v9.__index = v9;
v9.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v9 (copy), l_LocalPlayer_0 (copy)
    local v11 = setmetatable(v4.new(script.Name), v9);
    v11.Cooldowns = {
        bury = false, 
        Flight = false, 
        spada = false, 
        pesado = false, 
        slash = false, 
        frenzy = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v13 = {
        Idle = l_Character_0.Humanoid:LoadAnimation(script.Fly.idle), 
        Front = l_Character_0.Humanoid:LoadAnimation(script.Fly.front), 
        Back = l_Character_0.Humanoid:LoadAnimation(script.Fly.back), 
        Left = l_Character_0.Humanoid:LoadAnimation(script.Fly.left), 
        Right = l_Character_0.Humanoid:LoadAnimation(script.Fly.right)
    };
    v11.stopAll = function(_, v15) --[[ Line: 31 ]]
        -- upvalues: v13 (copy)
        for v16, v17 in v13 do
            if v16 ~= v15 then
                v17:Stop();
            end;
        end;
    end;
    v11.playAnim = function(_, v19) --[[ Line: 39 ]]
        -- upvalues: l_Character_0 (copy), v11 (copy), v13 (copy)
        if _G.check:inspect(l_Character_0) == false then
            v11:stopAll(nil);
            return;
        else
            if v13[v19] and v13[v19].IsPlaying == false then
                v13[v19]:Play();
            end;
            v11:stopAll(v19);
            return;
        end;
    end;
    return v11;
end;
v9.DesertStorm = function(v20, v21) --[[ Line: 53 ]] --[[ Name: DesertStorm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v24 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.bury == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Desert Storm") == true then
        local v25 = v3.GetM("Desert Storm");
        local l_cd_0 = v25.cd;
        if _G.StamCheck("Desert Storm") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_0.bury = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v27 = l_Character_1.Humanoid:LoadAnimation(script.sables);
            v27:Play();
            v27:AdjustWeight(2);
            _G.PauseAnim(v27, 0.35, 0.75);
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Desert Storm", {
                cf = v20:GetMouseCFrame()
            });
            local v29 = tick();
            task.wait(0.25);
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 81 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v29 (copy), v24 (copy)
                    if _G.check:inspect(l_Character_1) == false or tick() - v29 >= 4 or l_Character_1:FindFirstChild(script.Name) == nil or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v24.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v27:AdjustSpeed(2);
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            task.wait(0.1);
            if v28 then
                v28:FireServer({
                    cf = v20:GetMouseCFrame()
                });
            end;
            task.wait(0.25);
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.PlatformStand = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Desert Storm", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.bury = false;
        end;
    end;
end;
local function v31(v30) --[[ Line: 110 ]] --[[ Name: getLargestAxis ]]
    if math.abs(v30.X) > math.abs(v30.Y) and math.abs(v30.X) > math.abs(v30.Z) then
        return v30.X > 0 and "Right" or "Left", (math.abs(v30.X));
    elseif math.abs(v30.Z) > math.abs(v30.X) and math.abs(v30.Z) > math.abs(v30.Y) then
        return v30.Z > 0 and "Down" or "Up", (math.abs(v30.Z));
    else
        return "None", 0;
    end;
end;
v9.DesertFlight = function(v32, v33) --[[ Line: 120 ]] --[[ Name: DesertFlight ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_l_PlayerModule_0_Controls_0 (copy), v31 (copy)
    local l_Cooldowns_1 = v32.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v36 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_1.Flight == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Desert Flight") == true then
        local v37 = v3.GetM("Desert Flight");
        local l_cd_1 = v37.cd;
        if _G.StamCheck("Desert Flight") == false then
            return;
        elseif v37.statreq and _G.MeetReq(v37.statreq) == false then
            return;
        else
            l_Cooldowns_1.Flight = true;
            l_Character_2.Humanoid.WalkSpeed = 0;
            local v39 = game.ReplicatedStorage.Events.Skill:InvokeServer("Desert Flight");
            local v40 = Instance.new("BodyVelocity", l_Character_2.LowerTorso);
            v40.Name = "geppo";
            v40.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            v40.Velocity = Vector3.new();
            local v41 = Instance.new("BodyGyro", l_Character_2.HumanoidRootPart);
            v41.P = 100000;
            v41.D = 2500;
            v41.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            l_Character_2.Humanoid.WalkSpeed = 16;
            local v42 = false;
            do
                local l_v42_0 = v42;
                v32:DoubleCastSkill(v33, {
                    ToolName = script.Name, 
                    Button = v33, 
                    Key = Enum.KeyCode.T, 
                    PassFunction = function() --[[ Line: 156 ]] --[[ Name: PassFunction ]]
                        -- upvalues: l_Character_2 (copy)
                        return l_Character_2:FindFirstChild(script.Name) ~= nil;
                    end, 
                    CancelFunction = function() --[[ Line: 159 ]] --[[ Name: CancelFunction ]]
                        -- upvalues: l_Character_2 (copy), v36 (copy), v39 (copy)
                        local v44 = true;
                        if l_Character_2.Parent == workspace.PlayerCharacters then
                            v44 = true;
                            if v36.Stamina.Value > 0 then
                                v44 = true;
                                if v39 ~= nil then
                                    v44 = v39 and v39:IsDescendantOf(game) == false;
                                end;
                            end;
                        end;
                        return v44;
                    end, 
                    CompleteFunction = function() --[[ Line: 162 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: l_v42_0 (ref)
                        l_v42_0 = true;
                    end, 
                    SkipTap = true
                });
                l_Character_2.Humanoid.PlatformStand = true;
                local v45 = tick();
                local _ = 25;
                while true do
                    local v47 = (l_Character_2:FindFirstChild("inCombat") == nil and 50 or 25) * (l_Character_2.Humanoid.Health / l_Character_2.Humanoid.MaxHealth);
                    local l_l_l_PlayerModule_0_Controls_0_MoveVector_0 = l_l_PlayerModule_0_Controls_0:GetMoveVector();
                    local v49 = v31(l_l_l_PlayerModule_0_Controls_0_MoveVector_0);
                    v40.Velocity = (workspace.CurrentCamera.CFrame.LookVector * -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z * 2 + workspace.CurrentCamera.CFrame.RightVector * l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X) * v47;
                    if _G.FaceMouse == true or l_Character_2:FindFirstChildWhichIsA("ObjectValue") or _G.canuse == false then
                        v40.Velocity = Vector3.new();
                    end;
                    if _G.FaceMouse == true then
                        v41.Parent = nil;
                        v41.MaxTorque = Vector3.new(0, 0, 0, 0);
                    else
                        if v49 == "Down" then
                            v32:playAnim("Back");
                        elseif v49 == "Left" then
                            v32:playAnim("Left");
                        elseif v49 == "Right" then
                            v32:playAnim("Right");
                        elseif v49 == "Up" then
                            v32:playAnim("Front");
                        elseif v49 == "None" then
                            v32:playAnim("Idle");
                        end;
                        v41.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                        v41.CFrame = workspace.CurrentCamera.CFrame;
                        v41.Parent = l_Character_2.LowerTorso;
                    end;
                    l_Character_2.Humanoid.PlatformStand = true;
                    local l_Tool_0 = l_Character_2:FindFirstChildWhichIsA("Tool");
                    if l_Tool_0 and l_Tool_0 ~= v32.Tool then
                        task.defer(function() --[[ Line: 215 ]]
                            -- upvalues: l_Character_2 (copy)
                            l_Character_2.Humanoid:UnequipTools();
                        end);
                    end;
                    if not l_Character_2:FindFirstChild("inCombat") or tick() - v45 < 30 then
                        game["Run Service"].RenderStepped:Wait();
                        if l_v42_0 == true then
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                v32.stopAll();
                l_Character_2.Humanoid.AutoRotate = true;
                l_Character_2.Humanoid.PlatformStand = false;
                v40:Destroy();
                v41:Destroy();
                if v39 then
                    pcall(function() --[[ Line: 236 ]]
                        -- upvalues: v39 (copy)
                        v39:InvokeServer();
                    end);
                end;
                _G.keysetup:cooldown("Desert Flight", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.Flight = false;
            end;
        end;
    end;
end;
v9.DesertSpada = function(v51, v52) --[[ Line: 246 ]] --[[ Name: DesertSpada ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v51.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v55 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.spada == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Desert Spada") == true then
        local v56 = v3.GetM("Desert Spada");
        local l_cd_2 = v56.cd;
        if _G.StamCheck("Desert Spada") == false then
            return;
        elseif v56.statreq and _G.MeetReq(v56.statreq) == false then
            return;
        else
            l_Cooldowns_2.spada = true;
            _G.canuse = false;
            _G.mouseLevel = true;
            _G.FaceMouse = true;
            local v58 = l_Character_3.Humanoid:LoadAnimation(script.spada);
            v58:Play();
            v58:AdjustWeight(2);
            _G.PauseAnim(v58, 0.4, 1);
            local v59 = game.ReplicatedStorage.Events.Skill:InvokeServer("Desert Spada", {
                cf = v51:GetMouseCFrame()
            });
            local _ = tick();
            v51:ChargeSkill(v52, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 276 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), v55 (copy)
                    if l_Character_3:FindFirstChild(script.Name) == nil or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v55.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            l_Character_3.HumanoidRootPart.Anchored = true;
            v58:AdjustSpeed(1);
            task.wait(0.1);
            _G.FaceMouse = false;
            _G.mouseLevel = nil;
            l_Character_3.Humanoid.AutoRotate = false;
            if v59 then
                v59:FireServer(l_Character_3.HumanoidRootPart.CFrame);
            end;
            task.wait(0.4);
            l_Character_3.HumanoidRootPart.Anchored = false;
            l_Character_3.Humanoid.AutoRotate = true;
            l_Character_3.Humanoid.PlatformStand = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Desert Spada", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.spada = false;
        end;
    end;
end;
v9.DesertRailgun = function(v61, v62) --[[ Line: 310 ]] --[[ Name: DesertRailgun ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v61.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v65 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.pesado == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Desert Railgun") == true then
        local v66 = v3.GetM("Desert Railgun");
        local l_cd_3 = v66.cd;
        if _G.StamCheck("Desert Railgun") == false then
            return;
        elseif v66.statreq and _G.MeetReq(v66.statreq) == false then
            return;
        else
            l_Cooldowns_3.pesado = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v68 = l_Character_4.Humanoid:LoadAnimation(script.pesado);
            v68:Play();
            v68:AdjustWeight(2);
            local v69 = game.ReplicatedStorage.Events.Skill:InvokeServer("Desert Railgun", {
                cf = v61:GetMouseCFrame()
            });
            _G.PauseAnim(v68, 0.5, 1);
            task.wait(0.7);
            local _ = tick();
            v61:ChargeSkill(v62, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 340 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_4 (copy), v69 (copy), v65 (copy)
                    if l_Character_4:FindFirstChild(script.Name) == nil or v69 == nil or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v65.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            l_Character_4.HumanoidRootPart.Anchored = true;
            v68:AdjustSpeed(1);
            local l_v61_MouseCFrame_0 = v61:GetMouseCFrame();
            task.wait(0.27);
            _G.FaceMouse = false;
            l_Character_4.Humanoid.AutoRotate = false;
            if v69 then
                v69:FireServer(l_v61_MouseCFrame_0);
            end;
            task.wait(0.4);
            l_Character_4.HumanoidRootPart.Anchored = false;
            l_Character_4.Humanoid.AutoRotate = true;
            l_Character_4.Humanoid.PlatformStand = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Desert Railgun", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.pesado = false;
        end;
    end;
end;
v9.DesertCutlass = function(v72, v73) --[[ Line: 374 ]] --[[ Name: DesertCutlass ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v72.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v76 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.slash == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Desert Cutlass") == true then
        local v77 = v3.GetM("Desert Cutlass");
        local l_cd_4 = v77.cd;
        if _G.StamCheck("Desert Cutlass") == false then
            return;
        elseif v77.statreq and _G.MeetReq(v77.statreq) == false then
            return;
        else
            l_Cooldowns_4.slash = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v79 = l_Character_5.Humanoid:LoadAnimation(script.slash);
            v79:Play();
            v79:AdjustWeight(2);
            local v80 = game.ReplicatedStorage.Events.Skill:InvokeServer("Desert Cutlass", {
                cf = v72:GetMouseCFrame()
            });
            if l_Character_5:WaitForChild("SandBlade2", 5) == nil then
                _G.canuse = true;
                l_Cooldowns_4.slash = false;
                _G.FaceMouse = false;
                v79:Stop();
                return;
            else
                local v81 = l_Character_5.SandBlade2.AnimationController:LoadAnimation(script.slash);
                v81:Play();
                v81:AdjustWeight(2);
                _G.PauseAnim(v79, 0.4, 1.25);
                v81:AdjustSpeed(0);
                local v82 = tick();
                v72:ChargeSkill(v73, {
                    Key = Enum.KeyCode.E, 
                    EndFunction = function() --[[ Line: 414 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_5 (copy), v82 (copy), v76 (copy)
                        if l_Character_5:FindFirstChild(script.Name) == nil or tick() - v82 >= 5 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v76.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v79:AdjustSpeed(0.75);
                v81:AdjustSpeed(0.75);
                _G.FaceMouse = false;
                local _ = l_Character_5.HumanoidRootPart.CFrame;
                l_Character_5.Humanoid.AutoRotate = false;
                l_Character_5.HumanoidRootPart.Anchored = true;
                task.wait(0.1);
                if v80 then
                    v80:FireServer(v72:GetMouseCFrame());
                end;
                task.wait(0.35);
                l_Character_5.Humanoid.AutoRotate = true;
                l_Character_5.Humanoid.PlatformStand = false;
                l_Character_5.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Desert Cutlass", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.slash = false;
            end;
        end;
    end;
end;
v9["DesertCutlass:Frenzy"] = function(v84, v85) --[[ Line: 452 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v84.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v88 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.frenzy == false and _G.check:inspect(l_Character_6) == true and _G.StamCheck("Desert Cutlass: Frenzy") == true then
        local v89 = v3.GetM("Desert Cutlass: Frenzy");
        local l_cd_5 = v89.cd;
        if _G.StamCheck("Desert Cutlass: Frenzy") == false then
            return;
        elseif v89.statreq and _G.MeetReq(v89.statreq) == false then
            return;
        else
            l_Cooldowns_5.frenzy = true;
            _G.canuse = false;
            local v91 = l_Character_6.Humanoid:LoadAnimation(script.frenzyHold);
            v91:Play();
            v91:AdjustWeight(2);
            l_Character_6.Humanoid.WalkSpeed = 4;
            local v92 = game.ReplicatedStorage.Events.Skill:InvokeServer("Desert Cutlass: Frenzy", {
                cf = v84:GetMouseCFrame()
            });
            if l_Character_6:WaitForChild("SandBlade2", 5) == nil then
                _G.canuse = true;
                l_Cooldowns_5.frenzy = false;
                v91:Stop();
                return;
            else
                local v93 = l_Character_6.SandBlade2.AnimationController:LoadAnimation(script.frenzyHold);
                v93:Play();
                v93:AdjustWeight(2);
                _G.PauseAnim(v91, 0.4, 1);
                v93:AdjustSpeed(0);
                local _ = tick();
                v84:ChargeSkill(v85, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 490 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_6 (copy)
                        l_Character_6.Humanoid.WalkSpeed = 4;
                    end, 
                    EndFunction = function() --[[ Line: 495 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_6 (copy), v88 (copy)
                        if l_Character_6:FindFirstChild(script.Name) == nil or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v88.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v91:AdjustSpeed(1.5);
                v93:AdjustSpeed(1.5);
                local _ = l_Character_6.HumanoidRootPart.CFrame;
                local v96 = Instance.new("BodyVelocity", l_Character_6.HumanoidRootPart);
                v96.MaxForce = Vector3.new(1000000, 0, 1000000, 0);
                v96.Velocity = l_Character_6.HumanoidRootPart.CFrame.lookVector * 100;
                _G.destroy(v96, 0.1);
                if v92 then
                    v92:FireServer(l_Character_6.HumanoidRootPart.CFrame);
                end;
                task.wait(0.35);
                l_Character_6.Humanoid.PlatformStand = false;
                l_Character_6.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Desert Cutlass: Frenzy", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.frenzy = false;
            end;
        end;
    end;
end;
return v9;