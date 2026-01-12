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
        Kick = false, 
        rapid = false, 
        ray = false, 
        sword = false, 
        ult = false, 
        fly = false
    };
    return v9;
end;
v7.RadiantKick = function(v10, v11) --[[ Line: 33 ]] --[[ Name: RadiantKick ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_0.Kick == false and _G.check:inspect(l_Character_0) == true then
        local v15 = v3.GetM("Radiant Kick");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Radiant Kick") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.Kick = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v17 = l_Character_0.Humanoid:LoadAnimation(script.kickStart);
            v17:Play();
            v17:AdjustSpeed(1.142857142857143);
            v17:AdjustWeight(2);
            task.wait(0.35);
            v17:Stop();
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.kickHold);
            v18:Play(0);
            v18:AdjustWeight(2);
            local v19 = tick();
            local v20 = game.ReplicatedStorage.Events.Skill:InvokeServer("Radiant Kick");
            local v21 = false;
            do
                local l_v21_0 = v21;
                local function v23() --[[ Line: 65 ]] --[[ Name: endFunction ]]
                    -- upvalues: v20 (copy), v19 (copy), l_v21_0 (ref), v10 (copy), l_Character_0 (copy), v14 (copy)
                    if v20 == nil then
                        return true;
                    else
                        if tick() - v19 >= 1.0499999999999998 and l_v21_0 == false then
                            l_v21_0 = true;
                            if v20 then
                                v20:FireServer("charged");
                            end;
                        end;
                        if tick() - v19 >= 10 or v10.Tool.Parent ~= l_Character_0 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end;
                end;
                v10:ChargeSkill(v11, {
                    Key = Enum.KeyCode.R, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = v23
                });
                l_Character_0.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                v18:Stop();
                local v24 = l_Character_0.Humanoid:LoadAnimation(script.kickShoot);
                v24:Play(0);
                v24:AdjustWeight(2);
                task.delay(0.2, function() --[[ Line: 95 ]]
                    -- upvalues: v20 (copy), l_Character_0 (copy), v10 (copy), l_v21_0 (ref)
                    if v20 then
                        v20:FireServer(l_Character_0.RightFoot.CFrame, v10:GetMouseCFrame(), l_v21_0);
                    end;
                end);
                task.wait(0.75);
                l_Character_0.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Radiant Kick", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.Kick = false;
            end;
        end;
    end;
end;
v7.RadiantJewels = function(v25, v26) --[[ Line: 111 ]] --[[ Name: RadiantJewels ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v25.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v29 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_1.rapid == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Radiant Jewels") == true then
        local v30 = v3.GetM("Radiant Jewels");
        local l_cd_1 = v30.cd;
        if _G.StamCheck("Radiant Jewels") == false then
            return;
        elseif v30.statreq and _G.MeetReq(v30.statreq) == false then
            return;
        else
            l_Cooldowns_1.rapid = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v32 = l_Character_1.Humanoid:LoadAnimation(script.rapid);
            v32:Play();
            v32:AdjustSpeed(0.5);
            task.wait(0.532);
            local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Radiant Jewels");
            local v34 = tick();
            v25:ChargeSkill(v26, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 140 ]] --[[ Name: endFunction ]]
                    -- upvalues: v33 (copy), v25 (copy), l_Character_1 (copy), v29 (copy), v34 (copy)
                    if v33 == nil then
                        return true;
                    elseif v25.Tool.Parent ~= l_Character_1 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v29.Stamina.Value <= 0 or tick() - v34 >= 3 or _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            _G.FaceMouse = false;
            if v33 then
                v33:FireServer();
            end;
            v32:Stop(0.3);
            _G.canuse = true;
            _G.keysetup:cooldown("Radiant Jewels", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.rapid = false;
        end;
    end;
end;
v7.RadiantRay = function(v35, v36) --[[ Line: 169 ]] --[[ Name: RadiantRay ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v35.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v39 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_2.ray == false and _G.check:inspect(l_Character_2) == true then
        local v40 = v3.GetM("Radiant Ray");
        local l_cd_2 = v40.cd;
        if _G.StamCheck("Radiant Ray") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_2.ray = true;
            _G.canuse = false;
            local v42 = l_Character_2.Humanoid:LoadAnimation(script.rayStart);
            v42:Play();
            task.wait(0.433);
            v42:Stop();
            local v43 = l_Character_2.Humanoid:LoadAnimation(script.rayHold);
            v43:Play();
            local v44 = game.ReplicatedStorage.Events.Skill:InvokeServer("Radiant Ray", v35:GetMouseCFrame());
            local v45 = tick();
            v35:ChargeSkill(v36, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 199 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v44 (copy), v35 (copy), v39 (copy), v45 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                    if v44 == nil then
                        return true;
                    else
                        v44:FireServer({
                            "update", 
                            v35:GetMouseCFrame()
                        });
                        if v35.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v39.Stamina.Value <= 0 or tick() - v45 >= 5 or _G.check:inspect(l_Character_2) == false then
                            return true;
                        else
                            return;
                        end;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v43:Stop();
            l_Character_2.Humanoid:LoadAnimation(script.rayEnd):Play();
            if v44 then
                v44:FireServer();
            end;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Radiant Ray", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.ray = false;
        end;
    end;
end;
local v46 = RaycastParams.new();
v46.FilterDescendantsInstances = {
    workspace.Env, 
    workspace.Islands, 
    workspace.Ships
};
v46.FilterType = Enum.RaycastFilterType.Include;
v7["StarlightRapier:Blitzstrike"] = function(v47, v48) --[[ Line: 238 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v46 (copy)
    local l_Cooldowns_3 = v47.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v51 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_3.sword == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Starlight Rapier: Blitzstrike") == true then
        local v52 = v3.GetM("Starlight Rapier: Blitzstrike");
        local l_cd_3 = v52.cd;
        if _G.StamCheck("Starlight Rapier: Blitzstrike") == false then
            return;
        elseif v52.statreq and _G.MeetReq(v52.statreq) == false then
            return;
        else
            l_Cooldowns_3.sword = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v54 = game.ReplicatedStorage.Events.Skill:InvokeServer("Starlight Rapier: Blitzstrike");
            local v55 = l_Character_3.Humanoid:LoadAnimation(script.swordStart);
            v55:Play();
            _G.PauseAnim(v55, 0.4, 1.8);
            local v56 = tick();
            v47:ChargeSkill(v48, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 266 ]] --[[ Name: endFunction ]]
                    -- upvalues: v54 (copy), v47 (copy), l_Character_3 (copy), v51 (copy), v56 (copy)
                    if v54 == nil then
                        return true;
                    elseif v47.Tool.Parent ~= l_Character_3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v51.Stamina.Value <= 0 or tick() - v56 >= 5 or _G.check:inspect(l_Character_3) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_3.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            v55:AdjustSpeed(1);
            local l_CFrame_0 = l_Character_3.PrimaryPart.CFrame;
            task.wait(0.25);
            if v54 then
                local v58 = l_Character_3.PrimaryPart.CFrame * CFrame.new(0, 0, -100);
                local v59 = CFrame.new(l_CFrame_0.Position, v58.Position);
                local v60 = (v58.Position - v59.Position).Unit * 40;
                local v61 = workspace:Raycast(v59.Position, v60, v46);
                local l_Position_0 = v59.Position;
                if v61 then
                    local l_Magnitude_0 = (l_Position_0 - v61.Position).Magnitude;
                    v58 = CFrame.new(l_Position_0, v61.Position) * CFrame.new(0, 0, -(l_Magnitude_0 - 5));
                else
                    v58 = CFrame.new(l_Position_0, v58.Position) * CFrame.new(0, 0, -40);
                end;
                l_Character_3:SetPrimaryPartCFrame(v58);
                _G.PlayEffect("Light BlitzV2", nil, "Dash", nil, v59);
                v54:FireServer(v58);
            else
                l_Character_3.PrimaryPart.Anchored = false;
            end;
            task.wait(0.1);
            _G.canuse = true;
            _G.keysetup:cooldown("Starlight Rapier: Blitzstrike", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.sword = false;
        end;
    end;
end;
v7["StarlightRapier:Excalibur"] = function(v64, v65) --[[ Line: 317 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v64.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v68 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_4.ult == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Starlight Rapier: Excalibur") == true then
        local v69 = v3.GetM("Starlight Rapier: Excalibur");
        local l_cd_4 = v69.cd;
        if l_Character_4.Humanoid.FloorMaterial == Enum.Material.Air then
            _G.displayMessage("<Color=Red>I have to touch the ground");
            return nil;
        elseif _G.StamCheck("Starlight Rapier: Excalibur") == false then
            return;
        elseif v69.statreq and _G.MeetReq(v69.statreq) == false then
            return;
        else
            l_Cooldowns_4.ult = true;
            _G.canuse = false;
            _G.mouseLevel = true;
            _G.FaceMouse = true;
            local v71 = game.ReplicatedStorage.Events.Skill:InvokeServer("Starlight Rapier: Excalibur", l_Character_4.PrimaryPart.CFrame);
            local v72 = l_Character_4.Humanoid:LoadAnimation(script.ultWindup);
            v72:Play();
            task.wait(1.2);
            v72:Stop();
            local v73 = l_Character_4.Humanoid:LoadAnimation(script.ultHold);
            v73:Play(0);
            local v74 = tick();
            v64:ChargeSkill(v65, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 354 ]] --[[ Name: endFunction ]]
                    -- upvalues: v71 (copy), v64 (copy), l_Character_4 (copy), v68 (copy), v74 (copy)
                    if v71 == nil then
                        return true;
                    elseif v64.Tool.Parent ~= l_Character_4 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v68.Stamina.Value <= 0 or tick() - v74 >= 5 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v73:Stop();
            l_Character_4.Humanoid:LoadAnimation(script.ultRelease):Play();
            if v71 then
                task.delay(1.8, function() --[[ Line: 376 ]]
                    -- upvalues: v71 (copy), l_Character_4 (copy)
                    if v71 then
                        v71:InvokeServer("updateCFrame", l_Character_4.PrimaryPart.CFrame);
                    end;
                end);
                task.spawn(function() --[[ Line: 381 ]]
                    -- upvalues: l_Character_4 (copy)
                    repeat
                        task.wait();
                    until l_Character_4:GetAttribute("PikaV2UltSwordHold") == nil;
                    _G.mouseLevel = nil;
                    _G.FaceMouse = false;
                    l_Character_4.PrimaryPart.Anchored = true;
                end);
                v71:InvokeServer("release", l_Character_4.PrimaryPart.CFrame);
            end;
            l_Character_4.PrimaryPart.Anchored = false;
            _G.mouseLevel = nil;
            _G.FaceMouse = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Starlight Rapier: Excalibur", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.ult = false;
        end;
    end;
end;
v7.RadiantFlight = function(v75, v76) --[[ Line: 403 ]] --[[ Name: RadiantFlight ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v75.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_Character_5.HumanoidRootPart;
    local v80 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and _G.canuse == true and l_Cooldowns_5.fly == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Radiant Flight") == true then
        local v81 = v3.GetM("Radiant Flight");
        local l_cd_5 = v81.cd;
        if _G.StamCheck("Radiant Flight") == false then
            return;
        elseif v81.statreq and _G.MeetReq(v81.statreq) == false then
            return;
        else
            l_Cooldowns_5.fly = true;
            _G.canuse = false;
            local v83 = Instance.new("BodyVelocity", l_Character_5.HumanoidRootPart);
            v83.Name = "geppo";
            v83.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
            v83.Velocity = Vector3.new();
            v83.P = 4324234234;
            local _ = tick();
            local l_l_Character_5_Descendants_0 = l_Character_5:GetDescendants();
            _G.transparentCharacter(l_Character_5, nil, nil, true);
            local v86 = CFrame.new(l_Character_5.HumanoidRootPart.Position, v75:GetMouseCFrame().p);
            l_Character_5.HumanoidRootPart.CFrame = v86;
            l_Character_5.Humanoid.PlatformStand = true;
            local l_CFrame_1 = l_Character_5.HumanoidRootPart.CFrame;
            local v88 = {};
            for v89 = 1, #l_l_Character_5_Descendants_0 do
                if l_l_Character_5_Descendants_0[v89]:IsA("BasePart") then
                    pcall(function() --[[ Line: 443 ]]
                        -- upvalues: l_l_Character_5_Descendants_0 (copy), v89 (copy), v88 (copy)
                        l_l_Character_5_Descendants_0[v89].CollisionGroup = "noclip";
                        table.insert(v88, l_l_Character_5_Descendants_0[v89]);
                    end);
                end;
            end;
            local v90 = game.ReplicatedStorage.Events.Skill:InvokeServer("Radiant Flight");
            l_Character_5.HumanoidRootPart.CFrame = v86;
            local l_CFrame_2 = l_Character_5.HumanoidRootPart.CFrame;
            local l_Position_1 = l_CFrame_1.Position;
            local l_LookVector_0 = l_CFrame_1.LookVector;
            local v94 = 0;
            local v95 = tick();
            do
                local l_l_CFrame_1_0, l_l_CFrame_2_0, l_l_Position_1_0, l_l_LookVector_0_0, l_v94_0 = l_CFrame_1, l_CFrame_2, l_Position_1, l_LookVector_0, v94;
                v75:ToggleSkill(v76, {
                    Key = Enum.KeyCode.T, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function(_) --[[ Line: 463 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_5 (copy), l_l_CFrame_1_0 (ref), l_l_CFrame_2_0 (ref), l_l_Position_1_0 (ref), l_l_LookVector_0_0 (ref), v90 (copy), l_v94_0 (ref), v95 (copy), v75 (copy), v80 (copy)
                        local v102 = 8 * (60 / _G.FPS) * (l_Character_5.Humanoid.Health / l_Character_5.Humanoid.MaxHealth);
                        local v103 = l_l_CFrame_1_0 * CFrame.new(0, 0, -v102);
                        local v104 = Ray.new(l_l_CFrame_2_0.p, (l_l_CFrame_2_0.Position - v103.p).unit * -v102);
                        local v105, v106, v107 = _G.raycastWhitelist(v104, {
                            workspace.Islands, 
                            workspace.Ships, 
                            workspace.Env
                        });
                        l_l_CFrame_1_0 = CFrame.new(l_l_Position_1_0:Lerp(v106, 0.5), v106);
                        if l_l_CFrame_1_0 ~= l_l_CFrame_1_0 then
                            return true;
                        else
                            l_Character_5.HumanoidRootPart.CFrame = l_l_CFrame_1_0;
                            local _ = l_l_Position_1_0;
                            l_l_Position_1_0 = v106;
                            if v105 or v106.Y <= workspace.Env.WaterStuff.Falls.Position.Y and v106.Y > workspace.Env.WaterStuff.Sand.Position.Y and l_Character_5:FindFirstChild("coatBubble") == nil then
                                if v106.Y <= workspace.Env.WaterStuff.Falls.Position.Y and v106.Y > workspace.Env.WaterStuff.Sand.Position.Y and l_Character_5:FindFirstChild("coatBubble") == nil then
                                    v107 = Vector3.new(0, 1, 0, 0);
                                    v106 = Vector3.new(v106.X, workspace.Env.WaterStuff.Falls.Position.Y + 0.1, v106.Z);
                                end;
                                if l_Character_5.HumanoidRootPart.Position.Y > workspace.Env.WaterStuff.Falls.Position.Y - 1 or v106.Y < workspace.Env.WaterStuff.Sand.Position.Y or l_Character_5:FindFirstChild("coatBubble") then
                                    l_l_LookVector_0_0 = l_l_LookVector_0_0 - 2 * l_l_LookVector_0_0:Dot(v107) * v107;
                                    if v90 then
                                        v90:FireServer("reflect", CFrame.new(v106, v106 + v107));
                                    end;
                                end;
                                l_l_CFrame_1_0 = CFrame.new(v106, v106 + l_l_LookVector_0_0);
                                if l_l_CFrame_1_0 ~= l_l_CFrame_1_0 then
                                    return true;
                                else
                                    l_Character_5.HumanoidRootPart.CFrame = l_l_CFrame_1_0;
                                end;
                            end;
                            if l_Character_5.Humanoid.SeatPart ~= nil then
                                l_Character_5.Humanoid.SeatPart:Sit(nil);
                            end;
                            l_Character_5.HumanoidRootPart.Velocity = Vector3.new();
                            l_Character_5.HumanoidRootPart.RotVelocity = Vector3.new();
                            if v90 and tick() - l_v94_0 >= 0.05 and tick() - v95 >= 0.1 then
                                v90:FireServer("dmg", l_l_CFrame_1_0);
                                l_v94_0 = tick();
                            end;
                            if l_Character_5:FindFirstChild("inCombat") and tick() - v95 >= 7 then
                                return true;
                            else
                                l_l_CFrame_2_0 = l_l_CFrame_1_0;
                                local v109 = true;
                                if v90 ~= nil then
                                    v109 = true;
                                    if v75.Tool.Parent == l_Character_5 then
                                        v109 = true;
                                        if l_Character_5.Parent ~= nil then
                                            v109 = true;
                                            if l_Character_5.Parent == workspace.PlayerCharacters then
                                                v109 = true;
                                                if v80.Stamina.Value > 0 then
                                                    v109 = _G.check:inspect(l_Character_5) == false;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                return v109;
                            end;
                        end;
                    end
                });
                l_Character_5.Humanoid.PlatformStand = false;
                l_Character_5.Humanoid.AutoRotate = true;
                _G.transparentCharacter(l_Character_5, true, nil, true);
                l_Character_5.HumanoidRootPart.Velocity = Vector3.new();
                l_Character_5.Humanoid.PlatformStand = false;
                for v110 = 1, #v88 do
                    pcall(function() --[[ Line: 530 ]]
                        -- upvalues: v88 (copy), v110 (copy)
                        v88[v110].CollisionGroup = "Players";
                    end);
                end;
                if v90 then
                    v90:FireServer();
                end;
                v83:Destroy();
                _G.canuse = true;
                _G.keysetup:cooldown("Radiant Flight", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.fly = false;
            end;
        end;
    end;
end;
return v7;