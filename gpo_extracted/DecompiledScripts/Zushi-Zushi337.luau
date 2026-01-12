local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(game.ReplicatedStorage.Modules.Skills);
local v5 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v5);
v8.__index = v8;
v8.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v8 (copy)
    local v10 = setmetatable(v5.new(script.Name), v8);
    v10.Cooldowns = {
        meator = false, 
        fly = false, 
        fury = false, 
        dom = false, 
        push = false, 
        pull = false
    };
    return v10;
end;
v8.GravityFly = function(v11, v12) --[[ Line: 36 ]] --[[ Name: GravityFly ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_UserInputService_0 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_0.fly == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Gravity Fly") == true then
        local v16 = v4.GetM("Gravity Fly");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Gravity Fly") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.fly = true;
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.summon);
            v18:Play();
            _G.canGlide = false;
            _G.canuse = false;
            task.wait(0.5);
            local v19 = tick();
            local v20 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gravity Fly", {
                cf = v11:GetMouseCFrame()
            });
            _G.canuse = true;
            v18:Stop();
            local v21 = l_Character_0.Humanoid:LoadAnimation(script.fly);
            local v22 = l_Character_0.Humanoid:LoadAnimation(script.foward);
            v21:Play();
            local v23 = Instance.new("BodyVelocity", l_Character_0.LowerTorso);
            v23.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            v23.Velocity = Vector3.new(0, 10, 0, 0);
            v23.Name = "flightBV";
            local _ = workspace.CurrentCamera;
            local _ = l_Character_0.Humanoid.HipHeight;
            local v26 = false;
            local v27 = nil;
            local v28 = nil;
            do
                local l_v26_0, l_v27_0 = v26, v27;
                v28 = l_UserInputService_0.JumpRequest:Connect(function() --[[ Line: 81 ]]
                    -- upvalues: l_v26_0 (ref), l_v27_0 (ref)
                    l_v26_0 = true;
                    if l_v27_0 and coroutine.status(l_v27_0) ~= "dead" then
                        task.cancel(l_v27_0);
                    end;
                    l_v27_0 = task.delay(0.25, function() --[[ Line: 88 ]]
                        -- upvalues: l_v26_0 (ref)
                        l_v26_0 = false;
                    end);
                end);
                local v31 = false;
                v11:DoubleCastSkill(v12, {
                    ToolName = script.Name, 
                    Button = v12, 
                    Key = Enum.KeyCode.T, 
                    CheckFunction = function() --[[ Line: 98 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_v26_0 (ref), l_Character_0 (copy), v23 (copy), v22 (copy), v21 (copy), v19 (copy), v20 (copy), v15 (copy)
                        local v32 = 5;
                        v32 = l_v26_0 and 20 or -10;
                        local v33 = CFrame.new(l_Character_0.HumanoidRootPart.Position);
                        local v34 = Ray.new(v33.Position, v33.UpVector * -9);
                        local v35, v36 = _G.raycastWhitelist(v34, {
                            workspace.Islands, 
                            workspace.Ships, 
                            workspace.Env
                        });
                        if v35 and v32 < 0 or v36.Y < workspace.Env.WaterStuff.Falls.Position.Y and v36.Y > workspace.Env.WaterStuff.Sand.Position.Y then
                            v32 = 5;
                        end;
                        local v37 = nil;
                        local l_MoveDirection_0 = l_Character_0.Humanoid.MoveDirection;
                        v37 = if _G.FaceMouse == false and _G.canuse == true then if l_MoveDirection_0.Magnitude > 0 then l_Character_0.Humanoid.MoveDirection * 35 + Vector3.new(0, v32, 0) else Vector3.new(0, v32, 0) else Vector3.new();
                        v23.Velocity = v23.Velocity:Lerp(v37, 0.1);
                        if l_MoveDirection_0.Magnitude == 0 then
                            if v22.IsPlaying == true then
                                v22:Stop();
                            end;
                            if v21.IsPlaying == false then
                                v21:Play();
                            end;
                        else
                            if v21.IsPlaying == true then
                                v21:Stop();
                            end;
                            if v22.IsPlaying == false then
                                v22:Play();
                            end;
                        end;
                        if l_Character_0:FindFirstChild("inCombat") and tick() - v19 >= 30 then
                            return true;
                        else
                            local v39 = true;
                            if l_Character_0.Parent ~= nil then
                                v39 = true;
                                if v20 ~= nil then
                                    v39 = true;
                                    if l_Character_0.Parent == workspace.PlayerCharacters then
                                        v39 = true;
                                        if v15.Stamina.Value > 0 then
                                            v39 = _G.grounded or l_Character_0:FindFirstChild("Stun") or v20 and v20:IsDescendantOf(game) == false;
                                        end;
                                    end;
                                end;
                            end;
                            return v39;
                        end;
                    end, 
                    CompleteFunction = function() --[[ Line: 151 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: v31 (ref)
                        v31 = true;
                    end, 
                    SkipTap = true
                });
                repeat
                    task.wait();
                until v31 == true;
                v23:Destroy();
                v21:Stop();
                v22:Stop();
                _G.canGlide = true;
                v28 = nil;
                if v20 then
                    v20:FireServer();
                end;
                v18:Stop();
                _G.keysetup:cooldown("Gravity Fly", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.fly = false;
            end;
        end;
    end;
end;
v8.MeteorStrike = function(v40, v41) --[[ Line: 176 ]] --[[ Name: MeteorStrike ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_1 = v40.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v44 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.meator == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Meteor Strike") == true then
        local v45 = v4.GetM("Meteor Strike");
        local l_cd_1 = v45.cd;
        if _G.StamCheck("Meteor Strike") == false then
            return;
        elseif v45.statreq and _G.MeetReq(v45.statreq) == false then
            return;
        else
            l_Cooldowns_1.meator = true;
            _G.canuse = false;
            local v47 = l_Character_1.Humanoid:LoadAnimation(script.rock);
            v47:Play();
            v47:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v47, 0.3, 0.8);
            local v48 = tick();
            local v49 = 0;
            do
                local l_v49_0 = v49;
                v40:ChargeSkill(v41, {
                    Key = Enum.KeyCode.X, 
                    CheckFunction = function() --[[ Line: 205 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_v49_0 (ref)
                        if tick() - l_v49_0 >= 0.2 then
                            l_v49_0 = tick();
                        end;
                    end, 
                    EndFunction = function() --[[ Line: 210 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_1 (copy), v48 (copy), v44 (copy)
                        return not l_Character_1:FindFirstChild(script.Name) or tick() - v48 >= 10 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v44.Stamina.Value <= 0;
                    end
                });
                l_Character_1.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                _G.mouseLevel = nil;
                task.delay(0.5, function() --[[ Line: 219 ]]
                    -- upvalues: v47 (copy)
                    v47:AdjustSpeed(1.5);
                end);
                game.ReplicatedStorage.Events.Skill:InvokeServer("Meteor Strike", {
                    cf = v40:GetMouseCFrame()
                });
                l_Character_1.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Meteor Strike", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.meator = false;
            end;
        end;
    end;
end;
v8.MeteorFury = function(v51, v52) --[[ Line: 233 ]] --[[ Name: MeteorFury ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_2 = v51.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v55 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.fury == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Meteor Fury") == true then
        local v56 = v4.GetM("Meteor Fury");
        local l_cd_2 = v56.cd;
        if _G.StamCheck("Meteor Fury") == false then
            return;
        elseif v56.statreq and _G.MeetReq(v56.statreq) == false then
            return;
        else
            l_Cooldowns_2.fury = true;
            _G.canuse = false;
            local v58 = l_Character_2.Humanoid:LoadAnimation(script.fury);
            v58:Play();
            v58:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v58, 0.55, 1);
            local v59 = tick();
            local v60 = game.ReplicatedStorage.Events.Skill:InvokeServer("Meteor Fury", {
                cf = v51:GetMouseCFrame()
            });
            v51:ChargeSkill(v52, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 263 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v60 (copy), v51 (copy), l_Character_2 (copy), v59 (copy), v55 (copy)
                    if v60 then
                        v60:FireServer(v51:GetMouseCFrame());
                        return not l_Character_2:FindFirstChild(script.Name) or tick() - v59 >= 5.6000000000000005 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v55.Stamina.Value <= 0;
                    else
                        return true;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            task.wait(0.4);
            l_Character_2.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            v58:Stop();
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Meteor Fury", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.fury = false;
        end;
    end;
end;
v8.GravityDominance = function(v61, v62) --[[ Line: 286 ]] --[[ Name: GravityDominance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_3 = v61.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v65 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.dom == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Gravity Dominance") == true then
        local v66 = v4.GetM("Gravity Dominance");
        local l_cd_3 = v66.cd;
        if _G.StamCheck("Gravity Dominance") == false then
            return;
        elseif v66.statreq and _G.MeetReq(v66.statreq) == false then
            return;
        else
            local l_CFrame_0 = l_Character_3.PrimaryPart.CFrame;
            local v69 = CFrame.new(l_CFrame_0.Position);
            local v70, _, _ = _G.raycastWithLand(v69.Position, v69.UpVector * -8);
            if v70 == nil then
                return;
            else
                l_Cooldowns_3.dom = true;
                _G.canuse = false;
                local v73 = tick();
                l_Character_3.HumanoidRootPart.Anchored = true;
                local v74 = l_Character_3.Humanoid:LoadAnimation(script.force);
                v74:Play();
                v74:AdjustWeight(2);
                _G.PauseAnim(v74, 0.6, 1.02);
                local v75 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gravity Dominance", {
                    cf = l_Character_3.HumanoidRootPart.CFrame
                });
                v61:ChargeSkill(v62, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = function() --[[ Line: 322 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_Character_3 (copy)
                        l_Character_3.Humanoid.WalkSpeed = 4;
                    end, 
                    EndFunction = function() --[[ Line: 326 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v75 (copy), l_Character_3 (copy), v73 (copy), v65 (copy)
                        if v75 == nil then
                            return true;
                        else
                            return not l_Character_3:FindFirstChild(script.Name) or tick() - v73 >= 3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v65.Stamina.Value <= 0;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                if v75 then
                    v75:FireServer(v61:GetMouseCFrame());
                end;
                v74:Stop();
                l_Character_3.HumanoidRootPart.Anchored = false;
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Gravity Dominance", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.dom = false;
            end;
        end;
    end;
end;
v8.GravityPush = function(v76, v77) --[[ Line: 349 ]] --[[ Name: GravityPush ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_4 = v76.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v80 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.push == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Gravity Push") == true then
        local v81 = v4.GetM("Gravity Push");
        local l_cd_4 = v81.cd;
        if _G.StamCheck("Gravity Push") == false then
            return;
        elseif v81.statreq and _G.MeetReq(v81.statreq) == false then
            return;
        else
            l_Cooldowns_4.push = true;
            _G.canuse = false;
            local v83 = tick();
            _G.FaceMouse = true;
            local v84 = l_Character_4.Humanoid:LoadAnimation(script.push);
            v84:Play();
            v84:AdjustWeight(2);
            _G.PauseAnim(v84, 0.4, 1);
            v76:ChargeSkill(v77, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 377 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_4 (copy), v83 (copy), v80 (copy)
                    return not l_Character_4:FindFirstChild(script.Name) or tick() - v83 >= 10 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v80.Stamina.Value <= 0;
                end
            });
            v84:AdjustSpeed(1);
            _G.FaceMouse = false;
            l_Character_4.HumanoidRootPart.Anchored = true;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Gravity Push", {
                cf = l_Character_4.HumanoidRootPart.CFrame
            });
            task.wait(0.5);
            l_Character_4.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Gravity Push", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.push = false;
        end;
    end;
end;
v8.GravityPull = function(v85, v86) --[[ Line: 397 ]] --[[ Name: GravityPull ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_5 = v85.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v89 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.pull == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Gravity Pull") == true then
        local v90 = v4.GetM("Gravity Pull");
        local l_cd_5 = v90.cd;
        if _G.StamCheck("Gravity Pull") == false then
            return;
        elseif v90.statreq and _G.MeetReq(v90.statreq) == false then
            return;
        else
            l_Cooldowns_5.pull = true;
            _G.canuse = false;
            local v92 = tick();
            _G.FaceMouse = true;
            local v93 = l_Character_5.Humanoid:LoadAnimation(script.pull);
            v93:Play();
            v93:AdjustWeight(2);
            _G.PauseAnim(v93, 0.42, 1);
            v85:ChargeSkill(v86, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 425 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_5 (copy), v92 (copy), v89 (copy)
                    return not l_Character_5:FindFirstChild(script.Name) or tick() - v92 >= 10 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v89.Stamina.Value <= 0;
                end
            });
            v93:AdjustSpeed(1);
            _G.FaceMouse = false;
            l_Character_5.HumanoidRootPart.Anchored = true;
            task.wait(0.1);
            pcall(function() --[[ Line: 435 ]]
                -- upvalues: l_Character_5 (copy)
                game.ReplicatedStorage.Events.Skill:InvokeServer("Gravity Pull", {
                    cf = l_Character_5.HumanoidRootPart.CFrame
                });
            end);
            task.wait(0.4);
            l_Character_5.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Gravity Pull", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.pull = false;
        end;
    end;
end;
return v8;