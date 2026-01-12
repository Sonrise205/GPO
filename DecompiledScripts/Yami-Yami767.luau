local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v7 = setmetatable({}, v4);
v7.__index = v7;
v7.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v7 (copy)
    local v9 = setmetatable(v4.new(script.Name), v7);
    v9.Cooldowns = {
        hole = false, 
        burst = false, 
        pull = false, 
        lib = false, 
        blackstar = false, 
        fly = false
    };
    v9.CurrentSwipe = 1;
    return v9;
end;
v7.BlackHole = function(v10, v11) --[[ Line: 28 ]] --[[ Name: BlackHole ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.hole == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Black Hole") == true then
        local v15 = v3.GetM("Black Hole");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Black Hole") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            local v17, _, _ = _G.getRayFloor(l_Character_0.PrimaryPart.CFrame, 5);
            if v17 == nil then
                _G.displayMessage("<Color=Red>I have to touch the ground");
                return nil;
            else
                l_Cooldowns_0.hole = true;
                _G.canuse = false;
                _G.mouseLevel = true;
                _G.FaceMouse = true;
                local v20 = l_Character_0.Humanoid:LoadAnimation(script.blackhole);
                v20:Play();
                v20:AdjustWeight(2);
                v20:AdjustSpeed(1);
                _G.PauseAnim(v20, 0.6, 1.2);
                local v21 = game.ReplicatedStorage.Events.Skill:InvokeServer("Black Hole", l_Character_0.PrimaryPart.CFrame);
                local v22 = tick();
                v10:ChargeSkill(v11, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = function() --[[ Line: 65 ]] --[[ Name: checkFunction ]]
                        -- upvalues: v21 (copy), l_Character_0 (copy)
                        if v21 == nil or _G.check:inspect(l_Character_0) == false then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    EndFunction = function() --[[ Line: 71 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_0 (copy), v22 (copy), v14 (copy)
                        if not l_Character_0:FindFirstChild(script.Name) or tick() - v22 >= 3 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0 or l_Character_0:FindFirstChild("PB") ~= nil then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                _G.FaceMouse = false;
                v20:Stop();
                if v21 then
                    v21:FireServer(l_Character_0.PrimaryPart.CFrame);
                end;
                _G.mouseLevel = false;
                _G.keysetup:cooldown("Black Hole", l_cd_0);
                _G.canuse = true;
                _G.fw(l_cd_0);
                l_Cooldowns_0.hole = false;
            end;
        end;
    end;
end;
v7.CruelBurst = function(v23, v24) --[[ Line: 99 ]] --[[ Name: CruelBurst ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v27 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.burst == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Cruel Burst") == true then
        local v28 = v3.GetM("Cruel Burst");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Cruel Burst") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            l_Cooldowns_1.burst = true;
            _G.canuse = false;
            _G.mouseLevel = true;
            _G.FaceMouse = true;
            l_Character_1.HumanoidRootPart.Anchored = true;
            local v30 = l_Character_1.Humanoid:LoadAnimation(script.summonburst);
            v30:Play();
            v30:AdjustSpeed(2);
            task.wait(0.25);
            local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cruel Burst", l_Character_1.PrimaryPart.CFrame);
            v30:Stop();
            local v32 = l_Character_1.Humanoid:LoadAnimation(script.burstloop);
            v32:Play();
            local v33 = tick();
            v23:ChargeSkill(v24, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 134 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v31 (copy)
                    if v31 == nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 140 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v33 (copy), v27 (copy)
                    if not l_Character_1:FindFirstChild(script.Name) or tick() - v33 >= 4 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v27.Stamina.Value <= 0 or _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            _G.mouseLevel = false;
            v32:Stop();
            local v34 = l_Character_1.Humanoid:LoadAnimation(script.burstexplode);
            v34:Play();
            v34:AdjustWeight(2);
            v34:AdjustSpeed(2);
            if v31 then
                v31:FireServer(l_Character_1.PrimaryPart.CFrame);
            end;
            task.wait(0.5);
            l_Character_1.HumanoidRootPart.Anchored = false;
            _G.keysetup:cooldown("Cruel Burst", l_cd_1);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.burst = false;
        end;
    end;
end;
v7.BlackVortex = function(v35, v36) --[[ Line: 176 ]] --[[ Name: BlackVortex ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v35.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v39 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.pull == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Black Vortex") == true then
        local v40 = v3.GetM("Black Vortex");
        local l_cd_2 = v40.cd;
        if _G.StamCheck("Black Vortex") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_2.pull = true;
            _G.canuse = false;
            l_Character_2.PrimaryPart.Anchored = true;
            l_Character_2.Humanoid.AutoRotate = false;
            l_Character_2:PivotTo(CFrame.new(l_Character_2.PrimaryPart.Position, v35:GetMouseCFrame().p));
            local v42 = l_Character_2.Humanoid:LoadAnimation(script.kurowindup);
            v42:Play();
            v42:AdjustSpeed(2);
            task.wait(0.2);
            local v43 = game.ReplicatedStorage.Events.Skill:InvokeServer("Black Vortex", l_Character_2.PrimaryPart.CFrame);
            v42:Stop();
            local v44 = l_Character_2.Humanoid:LoadAnimation(script.kuroloop);
            v44:Play();
            local v45 = tick();
            v35:ChargeSkill(v36, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 207 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v43 (copy), l_Character_2 (copy)
                    if v43 == nil then
                        return true;
                    else
                        l_Character_2.Humanoid.AutoRotate = false;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 215 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v45 (copy), v39 (copy)
                    if not l_Character_2:FindFirstChild(script.Name) or tick() - v45 >= 2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v39.Stamina.Value <= 0 or l_Character_2:FindFirstChild("PB") ~= nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            _G.FaceMouse = false;
            v44:Stop();
            if v43 then
                v43:FireServer(l_Character_2.PrimaryPart.CFrame);
            end;
            task.wait(0.25);
            l_Character_2.Humanoid.AutoRotate = true;
            l_Character_2.PrimaryPart.Anchored = false;
            _G.keysetup:cooldown("Black Vortex", l_cd_2);
            _G.canuse = true;
            _G.fw(l_cd_2);
            l_Cooldowns_2.pull = false;
        end;
    end;
end;
v7.DarkLiberation = function(v46, v47) --[[ Line: 246 ]] --[[ Name: DarkLiberation ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v46.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v50 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.lib == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Dark Liberation") == true then
        local v51 = v3.GetM("Dark Liberation");
        local l_cd_3 = v51.cd;
        if _G.StamCheck("Dark Liberation") == false then
            return;
        elseif v51.statreq and _G.MeetReq(v51.statreq) == false then
            return;
        else
            local v53, _, _ = _G.getRayFloor(l_Character_3.PrimaryPart.CFrame, 5);
            if v53 == nil then
                return nil;
            else
                l_Cooldowns_3.lib = true;
                _G.canuse = false;
                _G.mouseLevel = true;
                _G.FaceMouse = true;
                local v56 = l_Character_3.Humanoid:LoadAnimation(script.liberation);
                v56:Play();
                v56:AdjustWeight(2);
                v56:AdjustSpeed(1);
                _G.PauseAnim(v56, 0.75, 2);
                local v57 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dark Liberation", l_Character_3.PrimaryPart.CFrame);
                local v58 = tick();
                v46:ChargeSkill(v47, {
                    Key = Enum.KeyCode.X, 
                    CheckFunction = function() --[[ Line: 280 ]] --[[ Name: checkFunction ]]
                        -- upvalues: v57 (copy)
                        if v57 == nil then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 286 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_3 (copy), v58 (copy), v50 (copy)
                        if not l_Character_3:FindFirstChild(script.Name) or tick() - v58 >= 10 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v50.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v56:Stop();
                local v59 = false;
                do
                    local l_v59_0 = v59;
                    if v57 then
                        task.spawn(function() --[[ Line: 303 ]]
                            -- upvalues: l_Character_3 (copy), v57 (copy), v46 (copy), l_v59_0 (ref)
                            local v61 = l_Character_3.Humanoid:LoadAnimation(script.liberationshopot);
                            v61:Play();
                            v61:AdjustWeight(2);
                            v61:AdjustSpeed(1);
                            while v57 do
                                v57:InvokeServer(v46:GetMouseCFrame().p);
                                task.wait();
                                if l_v59_0 == true then
                                    break;
                                end;
                            end;
                            v61:Stop();
                        end);
                        local v62 = l_Character_3.Humanoid:LoadAnimation(script.liberationwindup);
                        v62:Play();
                        v62:AdjustWeight(2);
                        v62:AdjustSpeed(1);
                        v57:InvokeServer(l_Character_3.PrimaryPart.CFrame);
                    end;
                    l_v59_0 = true;
                    _G.FaceMouse = false;
                    _G.mouseLevel = false;
                    _G.keysetup:cooldown("Dark Liberation", l_cd_3);
                    _G.canuse = true;
                    _G.fw(l_cd_3);
                    l_Cooldowns_3.lib = false;
                end;
            end;
        end;
    end;
end;
v7.BlackStar = function(v63, v64) --[[ Line: 337 ]] --[[ Name: BlackStar ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v63.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v67 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.blackstar == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Black Star") == true then
        local v68 = v3.GetM("Black Star");
        local l_cd_4 = v68.cd;
        if _G.StamCheck("Black Star") == false then
            return;
        elseif v68.statreq and _G.MeetReq(v68.statreq) == false then
            return;
        else
            l_Cooldowns_4.blackstar = true;
            _G.canuse = false;
            _G.mouseLevel = true;
            _G.FaceMouse = true;
            local v70 = l_Character_4.Humanoid:LoadAnimation(script.blacksummon);
            v70:Play();
            v70:AdjustWeight(2);
            v70:AdjustSpeed(1);
            do
                local l_v70_0 = v70;
                task.spawn(function() --[[ Line: 361 ]]
                    -- upvalues: l_v70_0 (ref), l_Character_4 (copy)
                    task.wait(0.55);
                    l_v70_0 = l_Character_4.Humanoid:LoadAnimation(script.blackcharge);
                    l_v70_0:Play();
                    l_v70_0:AdjustWeight(2);
                    l_v70_0:AdjustSpeed(1);
                end);
                local v72 = game.ReplicatedStorage.Events.Skill:InvokeServer("Black Star", l_Character_4.PrimaryPart.CFrame);
                local v73 = tick();
                v63:ChargeSkill(v64, {
                    Key = Enum.KeyCode.C, 
                    CheckFunction = function() --[[ Line: 372 ]] --[[ Name: checkFunction ]]
                        -- upvalues: v72 (copy)
                        if v72 == nil then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 378 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_4 (copy), v73 (copy), v67 (copy)
                        if not l_Character_4:FindFirstChild(script.Name) or tick() - v73 >= 10 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v67.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                local v74 = false;
                if v72 then
                    v72:FireServer(v63:GetMouseCFrame());
                    task.wait(0.8);
                    l_v70_0:Stop();
                    local v75 = l_Character_4.Humanoid:LoadAnimation(script.blackthrow);
                    v75:Play();
                    v75:AdjustWeight(2);
                    v75:AdjustSpeed(1);
                else
                    l_v70_0:Stop();
                end;
                v74 = true;
                task.wait(1);
                _G.FaceMouse = false;
                _G.mouseLevel = false;
                _G.keysetup:cooldown("Black Star", l_cd_4);
                _G.canuse = true;
                _G.fw(l_cd_4);
                l_Cooldowns_4.blackstar = false;
            end;
        end;
    end;
end;
v7.AbyssalForm = function(v76, v77) --[[ Line: 419 ]] --[[ Name: AbyssalForm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v76.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v80 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_5.fly == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Abyssal Form") == true then
        local v81 = v3.GetM("Abyssal Form");
        local l_cd_5 = v81.cd;
        if _G.StamCheck("Abyssal Form") == false then
            return;
        elseif v81.statreq and _G.MeetReq(v81.statreq) == false then
            return;
        else
            l_Cooldowns_5.fly = true;
            _G.canuse = false;
            local v83 = tick();
            l_Character_5.PrimaryPart.Anchored = true;
            local v84 = l_Character_5.Humanoid:LoadAnimation(script.fly);
            v84:Play();
            v84:AdjustSpeed(0.9);
            local v85 = game.ReplicatedStorage.Events.Skill:InvokeServer("Abyssal Form");
            local v86 = Instance.new("BodyVelocity", l_Character_5.PrimaryPart);
            v86.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
            v86.Name = "geppo";
            v86.Velocity = Vector3.new();
            local v87 = Instance.new("BodyGyro", l_Character_5.PrimaryPart);
            v87.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            v87.P = 4000000;
            v87.D = 10000;
            local _ = l_Character_5.PrimaryPart.CFrame;
            local function v90() --[[ Line: 457 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_5 (copy), v86 (copy), v87 (copy), v76 (copy)
                _G.canuse = false;
                local v89 = 1;
                if l_Character_5:FindFirstChild("inCombat") == nil then
                    v89 = 1.5;
                end;
                v86.Velocity = l_Character_5.PrimaryPart.CFrame.lookVector * (v89 * 50);
                v87.CFrame = CFrame.new(l_Character_5.PrimaryPart.Position, v76:GetMouseCFrame().p);
                l_Character_5.PrimaryPart.Velocity = Vector3.new();
            end;
            local function v91() --[[ Line: 468 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_5 (copy), v80 (copy), v83 (copy)
                if not l_Character_5:FindFirstChild(script.Name) or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v80.Stamina.Value <= 0 or tick() - v83 >= 10 then
                    return true;
                elseif _G.grounded == true then
                    return true;
                else
                    return;
                end;
            end;
            l_Character_5.PrimaryPart.Anchored = false;
            v76:ToggleSkill(v77, {
                Key = Enum.KeyCode.T, 
                CheckFunction = v90, 
                IgnoreInstantCastSetting = true, 
                EndFunction = v91
            });
            if v85 then
                v85:FireServer();
            end;
            v87:Destroy();
            v86:Destroy();
            l_Character_5:SetPrimaryPartCFrame(CFrame.new(l_Character_5.PrimaryPart.Position, v76:GetMouseCFrame().p));
            _G.canuse = true;
            _G.keysetup:cooldown("Abyssal Form", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.fly = false;
        end;
    end;
end;
return v7;