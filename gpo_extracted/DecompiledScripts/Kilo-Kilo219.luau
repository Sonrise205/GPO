local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v7 = 25;
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        rise = false, 
        fall = false, 
        crash = false
    };
    v10.preFloat = tick();
    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
    l_BodyVelocity_0.Velocity = Vector3.new();
    l_BodyVelocity_0.MaxForce = Vector3.new(0, 99999997952, 0, 0);
    l_BodyVelocity_0.Name = "geppo";
    v10.bv = l_BodyVelocity_0;
    v10.floatingRemote = nil;
    v10.startFly = 0;
    v10.floatCheck = 0.5;
    v10:_main();
    return v10;
end;
v8._main = function(v12) --[[ Line: 45 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v7 (ref)
    local v13 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    v12.floatingAnim = v13.Humanoid:LoadAnimation(script.floating);
    v12.floatingAnim.Priority = Enum.AnimationPriority.Action;
    local v14 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name);
    local l_bv_0 = v12.bv;
    v12.Heartbeat = game["Run Service"].Heartbeat:Connect(function(_) --[[ Line: 53 ]]
        -- upvalues: v13 (copy), l_bv_0 (copy), v12 (copy), v7 (ref), v14 (copy)
        if v13.Parent ~= workspace.PlayerCharacters then
            l_bv_0.Velocity = Vector3.new();
        end;
        if l_bv_0.Parent ~= nil then
            if v13.Humanoid.FloorMaterial ~= Enum.Material.Air and tick() - v12.preFloat >= v12.floatCheck and tick() - v12.startFly >= 0.2 or v13:FindFirstChild("Floating") == nil then
                if v12.floatingRemote then
                    v12:endFloat();
                end;
                l_bv_0.Parent = nil;
            end;
        elseif v12.floatingRemote and tick() - v12.preFloat >= v12.floatCheck then
            v12:endFloat();
        end;
        if v13.Humanoid.FloorMaterial ~= Enum.Material.Air or _G.canuse == false then
            if v12.floatingAnim.IsPlaying == true then
                v12.floatingAnim:Stop();
            end;
        elseif v13.Humanoid.FloorMaterial == Enum.Material.Air and l_bv_0.Parent ~= nil and v12.floatingAnim.IsPlaying == false then
            v12.floatingAnim:Play();
        end;
        v7 = math.clamp(10 + v14.Stats.DevilFruitMastery.Value / 3, 0, 50) * (v13.Humanoid.Health / v13.Humanoid.MaxHealth);
    end);
    v12.Destroy = function(v17) --[[ Line: 91 ]] --[[ Name: Destroy ]]
        v17:endFloat();
    end;
end;
v8.startFloat = function(v18, _) --[[ Line: 96 ]] --[[ Name: startFloat ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    v18.preFloat = tick();
    if v18.floatingRemote == nil or l_Character_0:FindFirstChild("Floating") == nil then
        v18.floatingRemote = game.ReplicatedStorage.Events.Skill:InvokeServer("Kilo Float");
    end;
    l_Character_0:WaitForChild("Floating", 3);
end;
v8.endFloat = function(v21, _) --[[ Line: 106 ]] --[[ Name: endFloat ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local _ = l_LocalPlayer_0.Character;
    if v21.floatingRemote then
        v21.floatingRemote:FireServer();
        v21.bv.Parent = nil;
        v21.floatingRemote = nil;
    end;
end;
v8.KiloRise = function(v24, v25) --[[ Line: 116 ]] --[[ Name: KiloRise ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v7 (ref)
    local l_Cooldowns_0 = v24.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v28 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_bv_1 = v24.bv;
    if _G.grounded == false and l_Cooldowns_0.rise == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Kilo Rise") == true then
        local v30 = v3.GetM("Kilo Rise");
        local l_cd_0 = v30.cd;
        if _G.StamCheck("Kilo Rise") == false then
            return;
        elseif v30.statreq and _G.MeetReq(v30.statreq) == false then
            return;
        else
            l_Cooldowns_0.rise = true;
            _G.canuse = false;
            local v32 = game.ReplicatedStorage.Events.Skill:InvokeServer("Kilo Rise");
            local v33 = l_Character_2.Humanoid:LoadAnimation(script.rise);
            v33:Play();
            v33:AdjustWeight(2);
            l_Character_2.Humanoid.Jump = true;
            v24.startFly = tick();
            v24.bv.Velocity = Vector3.new(0, v7, 0);
            v24:startFloat();
            v24:ChargeSkill(v25, {
                Button = v25, 
                Key = Enum.KeyCode.E, 
                PCInputType = "Default", 
                MobileInputType = "Toggle", 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 170 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_bv_1 (copy), l_Character_2 (copy), v28 (copy)
                    l_bv_1.Parent = l_Character_2.HumanoidRootPart;
                    if l_Character_2:FindFirstChild("Floating") == nil or _G.check:inspect(l_Character_2) == false or not l_Character_2:FindFirstChild("Kilo-Kilo") or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v28.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v33:Stop();
            if v32 then
                v32:FireServer();
            end;
            l_Character_2.Humanoid.PlatformStand = false;
            l_bv_1.Velocity = Vector3.new();
            _G.canuse = true;
            _G.keysetup:cooldown("Kilo Rise", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.rise = false;
        end;
    end;
end;
v8.KiloDescend = function(v34, v35) --[[ Line: 197 ]] --[[ Name: KiloDescend ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v7 (ref)
    local l_Cooldowns_1 = v34.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v38 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_bv_2 = v34.bv;
    if l_Cooldowns_1.fall == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Kilo Descend") == true then
        local v40 = v3.GetM("Kilo Descend");
        local l_cd_1 = v40.cd;
        if _G.StamCheck("Kilo Descend") == false then
            return;
        else
            local v42, _, _ = _G.getRayFloor(l_Character_3.PrimaryPart.CFrame, 5);
            if v42 then
                return;
            elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
                return;
            else
                l_Cooldowns_1.fall = true;
                _G.canuse = false;
                local v45 = game.ReplicatedStorage.Events.Skill:InvokeServer("Kilo Descend");
                local v46 = l_Character_3.Humanoid:LoadAnimation(script.down);
                v46:Play();
                v46:AdjustWeight(2);
                l_bv_2.Velocity = Vector3.new(0, -v7 * 1.25, 0);
                v34:startFloat();
                v34:ChargeSkill(v35, {
                    Button = v35, 
                    Key = Enum.KeyCode.R, 
                    PCInputType = "Default", 
                    MobileInputType = "Toggle", 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 268 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_bv_2 (copy), v7 (ref), l_Character_3 (copy), v34 (copy), v38 (copy)
                        l_bv_2.Velocity = Vector3.new(0, -v7 * 1.25, 0);
                        l_bv_2.Parent = l_Character_3.HumanoidRootPart;
                        local _ = l_Character_3.Humanoid;
                        if l_Character_3.Humanoid.FloorMaterial ~= Enum.Material.Air then
                            v34:endFloat();
                            l_Character_3.Humanoid:LoadAnimation(script.land):Play();
                            return true;
                        elseif l_Character_3:FindFirstChild("Floating") == nil or not l_Character_3:FindFirstChild("Kilo-Kilo") or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v38.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v46:Stop();
                l_Character_3.Humanoid.PlatformStand = false;
                l_bv_2.Velocity = Vector3.new();
                if v45 then
                    v45:FireServer();
                end;
                _G.canuse = true;
                _G.keysetup:cooldown("Kilo Descend", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.fall = false;
            end;
        end;
    end;
end;
v8.KiloCrash = function(v48, _) --[[ Line: 306 ]] --[[ Name: KiloCrash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v48.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v52 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_bv_3 = v48.bv;
    if l_Cooldowns_2.crash == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Kilo Crash") == true then
        local v54 = v3.GetM("Kilo Crash");
        local l_cd_2 = v54.cd;
        if _G.StamCheck("Kilo Crash") == false then
            return;
        elseif v54.statreq and _G.MeetReq(v54.statreq) == false then
            return;
        else
            l_Cooldowns_2.crash = true;
            _G.canuse = false;
            local v56 = l_Character_4.Humanoid:LoadAnimation(script.loop);
            v56:Play();
            l_bv_3.Velocity = Vector3.new(0, -5, 0, 0);
            v48:endFloat();
            local l_Position_0 = l_Character_4.HumanoidRootPart.Position;
            local _ = tick();
            local v59 = tick();
            local v60 = 0;
            local v61 = false;
            local v62 = game.ReplicatedStorage.Events.Skill:InvokeServer("Kilo Crash", {
                cf = l_Character_4.HumanoidRootPart.CFrame, 
                diff = 15 + (l_Position_0 - l_Character_4.HumanoidRootPart.Position).magnitude / 2
            });
            local v63 = nil;
            local v64 = nil;
            local v65 = nil;
            while true do
                l_bv_3.MaxForce = Vector3.new(0, 0, 0, 0);
                l_bv_3.Velocity = l_bv_3.Velocity - Vector3.new(0, 0, 0, 0);
                l_bv_3.Parent = l_Character_4.HumanoidRootPart;
                local l_CFrame_0 = l_Character_4.HumanoidRootPart.CFrame;
                v60 = 50 / (l_CFrame_0.p - l_Position_0).magnitude;
                if tick() - v59 >= v60 / 200 then
                    v59 = tick();
                    local v67 = game.ReplicatedStorage.MiscModels.sphere:Clone();
                    v67.CFrame = l_Character_4.HumanoidRootPart.CFrame * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(math.random(-5, 5), math.random(-5, 5), math.random(-15, 5));
                    local v68 = (l_CFrame_0.p - l_Position_0).magnitude / 2 + 80;
                    local v69 = math.random(v68 / 2, v68) / 10;
                    local v70 = math.random(1, 5) / 10;
                    v67.Mesh.Scale = Vector3.new(v70, v70, v69);
                    v61 = not v61;
                    if v61 == true then
                        v67.Transparency = 0.5;
                        v67.Color = Color3.fromRGB(0, 0, 0);
                    end;
                    v67.Parent = workspace.Effects;
                    local v71 = math.random(100, 200) / 1000;
                    v60 = (l_CFrame_0.p - l_Position_0).magnitude / 10;
                    _G.tween(v67, {
                        v71, 
                        Enum.EasingStyle.Quad, 
                        Enum.EasingDirection.Out, 
                        0, 
                        true, 
                        0
                    }, {
                        Transparency = 1, 
                        CFrame = v67.CFrame * CFrame.new(0, 0, math.random(v60 / 2, v60))
                    });
                    _G.tween(v67.Mesh, {
                        v71, 
                        Enum.EasingStyle.Quad, 
                        Enum.EasingDirection.In, 
                        0, 
                        true, 
                        0
                    }, {
                        Scale = Vector3.new(0, 0, 0, 0)
                    });
                    _G.destroy(v67, v71);
                end;
                local v72, v73, v74 = _G.getRayFloor(l_Character_4.PrimaryPart.CFrame, 15);
                v63 = v72;
                v64 = v73;
                v65 = v74;
                if v63 == nil then
                    game["Run Service"].Stepped:Wait();
                    if l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v52.Stamina.Value <= 0 then
                        break;
                    end;
                else
                    break;
                end;
            end;
            l_Character_4.Humanoid.PlatformStand = false;
            l_bv_3.Velocity = Vector3.new();
            task.spawn(function() --[[ Line: 384 ]]
                -- upvalues: v56 (copy)
                repeat
                    game["Run Service"].Heartbeat:Wait();
                until v56 ~= nil;
                v56:Stop();
            end);
            if v63 then
                l_bv_3.Parent = nil;
                l_Character_4.HumanoidRootPart.Anchored = true;
                local v75 = l_Character_4.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5);
                local v76 = CFrame.new(l_Character_4.HumanoidRootPart.CFrame.p) * CFrame.new(0, 2, 0);
                local v77 = Ray.new(v76.p, v76.upVector * -15);
                local _, v79, v80 = _G.raycastWhitelist(v77, {
                    workspace.Islands, 
                    workspace.Env, 
                    workspace.Ships
                });
                if v80 == Vector3.new(0, 0, 0, 0) then
                    v80 = Vector3.new(0, 1, 0, 0);
                end;
                l_Character_4.HumanoidRootPart.CFrame = CFrame.new(v79, v79 + v80) * CFrame.Angles(-1.5707963267948966, 0, 0) * CFrame.new(0, l_Character_4.HumanoidRootPart.Size.Z * 2.5, 0);
                local v81 = CFrame.new(l_Character_4.HumanoidRootPart.CFrame.p, (Vector3.new(v75.X, l_Character_4.HumanoidRootPart.CFrame.p.Y + 1, v75.Z)));
                if (v81.p - l_Character_4.HumanoidRootPart.Position).magnitude < 10 then
                    l_Character_4.HumanoidRootPart.CFrame = v81;
                end;
                local v82 = l_Character_4.Humanoid:LoadAnimation(script.crash);
                v82:Play();
                v82:AdjustWeight(10);
                if v62 then
                    v62:FireServer({
                        cf = l_Character_4.HumanoidRootPart.CFrame, 
                        diff = 15 + (l_Position_0 - l_Character_4.HumanoidRootPart.Position).magnitude / 2
                    });
                end;
                task.wait(0.8);
                l_Character_4.HumanoidRootPart.Anchored = false;
            end;
            l_bv_3.MaxForce = Vector3.new(0, 99999997952, 0, 0);
            _G.canuse = true;
            _G.keysetup:cooldown("Kilo Crash", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.crash = false;
        end;
    end;
end;
return v8;