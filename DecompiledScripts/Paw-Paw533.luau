local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v7 = setmetatable({}, v4);
v7.__index = v7;
v7.new = function(_) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v7 (copy)
    local v9 = setmetatable(v4.new(script.Name), v7);
    v9.Cooldowns = {
        cannon = false, 
        repel = false, 
        teleport = false, 
        bomb = false, 
        barrage = false, 
        shock = false
    };
    return v9;
end;
v7.PawCannon = function(v10, v11) --[[ Line: 34 ]] --[[ Name: PawCannon ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.cannon == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Paw Cannon") == true then
        local v15 = v3.GetM("Paw Cannon");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Paw Cannon") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.cannon = true;
            _G.canuse = false;
            local v17 = tick();
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.cannon);
            v18:Play();
            v18:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v18, 0.28, 1);
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Paw Cannon", l_Character_0.PrimaryPart.CFrame);
            v10:ChargeSkill(v11, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 63 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_0 (copy), v17 (copy), v19 (copy)
                    return not l_Character_0:FindFirstChild("Paw-Paw") or tick() - v17 >= 5 or v19 == nil;
                end
            });
            l_Character_0.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            v18:AdjustSpeed(1);
            task.wait(0.13999999999999996);
            if v19 then
                v19:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            task.wait(0.3);
            l_Character_0.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Paw Cannon", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.cannon = false;
        end;
    end;
end;
v7.ShockRepel = function(v20, _) --[[ Line: 84 ]] --[[ Name: ShockRepel ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.repel == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Shock Repel") == true then
        local v25 = v3.GetM("Shock Repel");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Shock Repel") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.repel = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Shock Repel", v20:GetMouseCFrame());
            _G.canuse = true;
            _G.keysetup:cooldown("Shock Repel", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.repel = false;
        end;
    end;
end;
v7.Rendezvous = function(v28, v29) --[[ Line: 111 ]] --[[ Name: Rendezvous ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v28.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.teleport == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Rendezvous") == true then
        local v33 = v3.GetM("Rendezvous");
        local l_cd_2 = v33.cd;
        if _G.StamCheck("Rendezvous") == false then
            return;
        elseif v33.statreq and _G.MeetReq(v33.statreq) == false then
            return;
        else
            local v35, v36, _ = _G.getRayFloor(l_Character_2.PrimaryPart.CFrame, 10);
            if v36 and v36.Y <= _G.SeaLevel then
                _G.displayMessage("<Color=Red>Cannot place paw under water!");
                return;
            elseif v35 == nil then
                return;
            else
                l_Cooldowns_2.teleport = true;
                _G.canuse = false;
                local v38 = l_Character_2.Humanoid:LoadAnimation(script.mark);
                v38:Play();
                v38:AdjustWeight(2);
                v38:AdjustSpeed(2);
                local v39 = Instance.new("BodyVelocity", l_Character_2.HumanoidRootPart);
                v39.MaxForce = Vector3.new(1e999, 0, 1e999, 0);
                v39.Velocity = Vector3.new();
                _G.destroy(v39, 0.4);
                task.wait(0.2);
                local v40 = game.ReplicatedStorage.Events.Skill:InvokeServer("Rendezvous", {
                    l_Character_2.LeftHand.CFrame, 
                    l_Character_2.PrimaryPart.CFrame
                });
                task.wait(0.25);
                _G.canuse = true;
                local v41 = false;
                do
                    local l_v41_0 = v41;
                    v28:DoubleCastSkill(v29, {
                        Key = Enum.KeyCode.T, 
                        SkipTap = true, 
                        CompleteFunction = function() --[[ Line: 168 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: l_v41_0 (ref)
                            l_v41_0 = true;
                        end, 
                        PassFunction = function() --[[ Line: 171 ]] --[[ Name: PassFunction ]]
                            -- upvalues: l_Character_2 (copy)
                            return l_Character_2:FindFirstChild(script.Name) and _G.check:inspect(l_Character_2) == true and _G.canuse == true;
                        end
                    });
                    repeat
                        task.wait();
                    until l_v41_0 == true;
                    if v40 then
                        v40:FireServer();
                    end;
                    local v43 = l_Character_2.Humanoid:LoadAnimation(script.snap);
                    v43:Play();
                    v43:AdjustWeight(2);
                    v43:AdjustSpeed(2);
                    task.wait(0.25);
                    _G.keysetup:cooldown("Rendezvous", l_cd_2);
                    _G.fw(l_cd_2);
                    l_Cooldowns_2.teleport = false;
                end;
            end;
        end;
    end;
end;
v7.PawBomb = function(v44, v45) --[[ Line: 199 ]] --[[ Name: PawBomb ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v44.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.bomb == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Paw Bomb") == true then
        local v49 = v3.GetM("Paw Bomb");
        local l_cd_3 = v49.cd;
        if _G.StamCheck("Paw Bomb") == false then
            return;
        elseif v49.statreq and _G.MeetReq(v49.statreq) == false then
            return;
        else
            l_Cooldowns_3.bomb = true;
            _G.canuse = false;
            local v51 = l_Character_3.Humanoid:LoadAnimation(script.pawBomb);
            v51:Play();
            v51:AdjustWeight(2);
            _G.FaceMouse = true;
            local v52 = tick();
            _G.PauseAnim(v51, 0.28, 1);
            local v53 = game.ReplicatedStorage.Events.Skill:InvokeServer("Paw Bomb", v44:GetMouseCFrame());
            task.wait(0.2);
            v44:ChargeSkill(v45, {
                Key = Enum.KeyCode.Z, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 229 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_3 (copy), v52 (copy), v53 (copy)
                    return not l_Character_3:FindFirstChild("Paw-Paw") or tick() - v52 >= 4 or not v53;
                end
            });
            l_Character_3.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            v51:AdjustSpeed(2);
            task.wait(0.06999999999999998);
            if v53 then
                v53:FireServer(l_Character_3.PrimaryPart.CFrame);
            end;
            task.wait(0.3);
            l_Character_3.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Paw Bomb", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.bomb = false;
        end;
    end;
end;
v7.PawBarrage = function(v54, v55) --[[ Line: 252 ]] --[[ Name: PawBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v54.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.barrage == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Paw Barrage") == true then
        local v59 = v3.GetM("Paw Barrage");
        local l_cd_4 = v59.cd;
        if _G.StamCheck("Paw Barrage") == false then
            return;
        elseif v59.statreq and _G.MeetReq(v59.statreq) == false then
            return;
        else
            l_Cooldowns_4.barrage = true;
            _G.canuse = false;
            local v61 = l_Character_4.Humanoid:LoadAnimation(script.barrageWind);
            v61:Play();
            v61:AdjustWeight(2);
            v61.Priority = Enum.AnimationPriority.Action4;
            _G.FaceMouse = true;
            _G.PauseAnim(v61, 0.55, 1);
            v61:Stop();
            local v62 = tick();
            local v63 = game.ReplicatedStorage.Events.Skill:InvokeServer("Paw Barrage", v54:GetMouseCFrame());
            local v64 = l_Character_4.Humanoid:LoadAnimation(script.barrageLoop);
            v64:Play();
            v64:AdjustWeight(2);
            v64:AdjustSpeed(2);
            v64.Priority = Enum.AnimationPriority.Action4;
            v54:ChargeSkill(v55, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 292 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_4 (copy), v62 (copy), v63 (copy)
                    if l_Character_4:FindFirstChild("PB") then
                        return true;
                    else
                        return not l_Character_4:FindFirstChild("Paw-Paw") or tick() - v62 >= 3 or not v63;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v64:Stop();
            if v63 then
                v63:FireServer();
            end;
            _G.canuse = true;
            _G.FaceMouse = false;
            _G.keysetup:cooldown("Paw Barrage", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.barrage = false;
        end;
    end;
end;
v7.UrsusShock = function(v65, v66) --[[ Line: 315 ]] --[[ Name: UrsusShock ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v65.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.shock == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Ursus Shock") == true then
        local v70 = v3.GetM("Ursus Shock");
        local l_cd_5 = v70.cd;
        if _G.StamCheck("Ursus Shock") == false then
            return;
        elseif v70.statreq and _G.MeetReq(v70.statreq) == false then
            return;
        else
            l_Cooldowns_5.shock = true;
            _G.canuse = false;
            local v72 = tick();
            _G.FaceMouse = true;
            local v73 = game.ReplicatedStorage.Events.Skill:InvokeServer("Ursus Shock", v65:GetMouseCFrame());
            v65:ChargeSkill(v66, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 342 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: v73 (copy)
                    if v73 then
                        if v73:GetAttribute("done") == true then
                            return true;
                        else
                            return;
                        end;
                    else
                        return true;
                    end;
                end, 
                EndFunction = function() --[[ Line: 351 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_5 (copy), v72 (copy)
                    return not l_Character_5:FindFirstChild("Paw-Paw") or tick() - v72 >= 25 or l_Character_5.Parent ~= workspace.PlayerCharacters;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_5.HumanoidRootPart.CFrame = CFrame.new(l_Character_5.PrimaryPart.Position, v65:GetMouseCFrame().p);
            _G.FaceMouse = false;
            if v73 and l_Character_5.Parent == workspace.PlayerCharacters then
                l_Character_5.PrimaryPart.Anchored = true;
                v73:FireServer(l_Character_5.PrimaryPart.CFrame);
                task.wait(2.4);
                l_Character_5.PrimaryPart.Anchored = false;
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Ursus Shock", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.shock = false;
        end;
    end;
end;
return v7;