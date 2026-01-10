local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
setTwoEndPoints = function(v7, v8, v9) --[[ Line: 15 ]] --[[ Name: setTwoEndPoints ]]
    local _ = (v8 - v9).magnitude;
    v7.CFrame = CFrame.new(v8:Lerp(v9, 0.5), v9);
    return v7;
end;
local function _(v11, v12) --[[ Line: 25 ]] --[[ Name: particle ]]
    local l_v11_Children_0 = v11:GetChildren();
    for v14 = 1, #l_v11_Children_0 do
        if l_v11_Children_0[v14]:IsA("ParticleEmitter") or l_v11_Children_0[v14]:IsA("PointLight") then
            l_v11_Children_0[v14].Enabled = v12;
        end;
    end;
end;
local v16 = setmetatable({}, v4);
v16.__index = v16;
v16.new = function(_) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v16 (copy)
    local v18 = setmetatable(v4.new(script.Name), v16);
    v18.Cooldowns = {
        Pillar = false, 
        Mirror = false, 
        Kick = false, 
        Sword = false, 
        rapid = false, 
        fly = false
    };
    return v18;
end;
v16.LightLunge = function(v19, v20) --[[ Line: 54 ]] --[[ Name: LightLunge ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v19.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v23 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_0.Sword == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Light Lunge") == true then
        local v24 = v3.GetM("Light Lunge");
        local l_cd_0 = v24.cd;
        if _G.StamCheck("Light Lunge") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            l_Cooldowns_0.Sword = true;
            _G.canuse = false;
            local v26 = l_Character_0.Humanoid:LoadAnimation(script.summonSword);
            v26:Play();
            _G.FaceMouse = true;
            local v27 = game.ReplicatedStorage.Events.Skill:InvokeServer("Light Lunge");
            local v28 = tick();
            _G.PauseAnim(v26, 1.5, 1.5);
            v19:ChargeSkill(v20, {
                Key = Enum.KeyCode.E, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 78 ]] --[[ Name: endFunction ]]
                    -- upvalues: v28 (copy), l_Character_0 (copy), v23 (copy)
                    if tick() - v28 >= 10 or not l_Character_0:FindFirstChild("Pika-Pika") or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v23.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v26:Stop();
            local v29 = l_Character_0.Humanoid:LoadAnimation(script.sword);
            v29:Play();
            v29:AdjustSpeed(1);
            v29:AdjustWeight(3);
            l_Character_0.HumanoidRootPart.Anchored = true;
            task.wait(0.1);
            _G.FaceMouse = false;
            local _ = Ray.new(l_Character_0.HumanoidRootPart.CFrame.p, (v19:GetMouseCFrame().p - l_Character_0.HumanoidRootPart.CFrame.p).unit * 100);
            local _, v32 = _G.raycast:cast(l_Character_0.HumanoidRootPart.CFrame.p, (v19:GetMouseCFrame().p - l_Character_0.HumanoidRootPart.CFrame.p).unit * 100, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
            if v27 then
                l_Character_0.HumanoidRootPart.CFrame = CFrame.new(v32, l_CFrame_0.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, l_Character_0.Humanoid.HipHeight * 1.25, 2);
                v27:FireServer(l_Character_0.HumanoidRootPart.CFrame);
            end;
            task.wait(0.5);
            v29:Stop();
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Light Lunge", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.Sword = false;
        end;
    end;
end;
v16.LightKick = function(v34, v35) --[[ Line: 120 ]] --[[ Name: LightKick ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v34.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v38 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_1.Kick == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Light Kick") == true then
        local v39 = v3.GetM("Light Kick");
        local l_cd_1 = v39.cd;
        if _G.StamCheck("Light Kick") == false then
            return;
        elseif v39.statreq and _G.MeetReq(v39.statreq) == false then
            return;
        else
            l_Cooldowns_1.Kick = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v41 = l_Character_1.Humanoid:LoadAnimation(script.kick);
            v41:Play();
            v41:AdjustWeight(2);
            _G.PauseAnim(v41, 0.35, 1.5);
            local v42 = tick();
            local v43 = game.ReplicatedStorage.Events.Skill:InvokeServer("Light Kick");
            v34:ChargeSkill(v35, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 144 ]] --[[ Name: endFunction ]]
                    -- upvalues: v42 (copy), l_Character_1 (copy), v38 (copy)
                    if tick() - v42 >= 10 or not l_Character_1:FindFirstChild("Pika-Pika") or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v38.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v41:AdjustSpeed(1);
            l_Character_1.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            task.delay(0.2, function() --[[ Line: 159 ]]
                -- upvalues: v43 (copy), v34 (copy), l_Character_1 (copy)
                if v43 then
                    v43:FireServer(v34:GetMouseCFrame().p, l_Character_1.LeftFoot.CFrame);
                end;
            end);
            task.wait(0.75);
            l_Character_1.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Light Kick", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.Kick = false;
        end;
    end;
end;
v16.LightRay = function(v44, v45) --[[ Line: 174 ]] --[[ Name: LightRay ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v44.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v48 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_2.Pillar == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Light Ray") == true then
        local v49 = v3.GetM("Light Ray");
        local l_cd_2 = v49.cd;
        if _G.StamCheck("Light Ray") == false then
            return;
        elseif v49.statreq and _G.MeetReq(v49.statreq) == false then
            return;
        else
            l_Cooldowns_2.Pillar = true;
            _G.canuse = false;
            local v51 = l_Character_2.Humanoid:LoadAnimation(script.pillar);
            v51:Play();
            v51:AdjustWeight(2);
            _G.PauseAnim(v51, 0.55, 1);
            local v52 = nil;
            local v53 = nil;
            do
                local l_v52_0, l_v53_0 = v52, v53;
                pcall(function() --[[ Line: 196 ]]
                    -- upvalues: l_v52_0 (ref), l_v53_0 (ref), v44 (copy)
                    local v56, v57 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Light Ray", {
                        pos = v44:GetMousePosition()
                    }));
                    l_v52_0 = v56;
                    l_v53_0 = v57;
                end);
                local v58 = tick();
                local function v60() --[[ Line: 201 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_v53_0 (ref), v44 (copy), l_v52_0 (ref), l_Character_2 (copy)
                    if l_v53_0 == nil then
                        return false;
                    else
                        local l_p_0 = v44:GetMouseCFrame().p;
                        if l_v52_0 then
                            l_v52_0:FireServer(l_p_0);
                            l_Character_2.Humanoid.WalkSpeed = 4;
                            return;
                        else
                            return true;
                        end;
                    end;
                end;
                local function v61() --[[ Line: 214 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v58 (copy), v48 (copy), l_v53_0 (ref)
                    if l_Character_2:FindFirstChild("Stun") or l_Character_2.Humanoid.FloorMaterial == Enum.Material.Air or tick() - v58 >= 10 or not l_Character_2:FindFirstChild("Pika-Pika") or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v48.Stamina.Value <= 0 or l_v53_0 and l_v53_0.Parent == nil then
                        return true;
                    else
                        return;
                    end;
                end;
                v44:ChargeSkill(v45, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = v60, 
                    EndFunction = v61, 
                    IgnoreInstantCastSetting = true
                });
                if l_v52_0 then
                    l_v52_0:FireServer("done");
                end;
                v51:Stop(0.25);
                l_Character_2.Humanoid.WalkSpeed = 16;
                task.wait(0.25);
                _G.canuse = true;
                _G.keysetup:cooldown("Light Ray", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.Pillar = false;
            end;
        end;
    end;
end;
v16.LightFlight = function(v62, v63) --[[ Line: 242 ]] --[[ Name: LightFlight ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v62.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_Character_3.HumanoidRootPart;
    local v67 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and _G.canuse == true and l_Cooldowns_3.fly == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Light Flight") == true then
        local v68 = v3.GetM("Light Flight");
        local l_cd_3 = v68.cd;
        if _G.StamCheck("Light Flight") == false then
            return;
        elseif v68.statreq and _G.MeetReq(v68.statreq) == false then
            return;
        else
            l_Cooldowns_3.fly = true;
            _G.canuse = false;
            local v70 = Instance.new("BodyVelocity", l_Character_3.HumanoidRootPart);
            v70.Name = "geppo";
            v70.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
            v70.Velocity = Vector3.new();
            v70.P = 4324234234;
            local v71 = tick();
            local l_l_Character_3_Descendants_0 = l_Character_3:GetDescendants();
            _G.transparentCharacter(l_Character_3, nil, nil, true);
            local v73 = {};
            for v74 = 1, #l_l_Character_3_Descendants_0 do
                if l_l_Character_3_Descendants_0[v74]:IsA("BasePart") then
                    pcall(function() --[[ Line: 278 ]]
                        -- upvalues: l_l_Character_3_Descendants_0 (copy), v74 (copy), v73 (copy)
                        l_l_Character_3_Descendants_0[v74].CollisionGroup = "noclip";
                        table.insert(v73, l_l_Character_3_Descendants_0[v74]);
                    end);
                end;
            end;
            local v75 = CFrame.new(l_Character_3.HumanoidRootPart.Position, v62:GetMouseCFrame().p);
            l_Character_3.HumanoidRootPart.CFrame = v75;
            l_Character_3.Humanoid.PlatformStand = true;
            local l_CFrame_1 = l_Character_3.HumanoidRootPart.CFrame;
            local v77 = game.ReplicatedStorage.Events.Skill:InvokeServer("Light Flight");
            l_Character_3.HumanoidRootPart.CFrame = v75;
            local l_CFrame_2 = l_Character_3.HumanoidRootPart.CFrame;
            local l_Position_0 = l_CFrame_1.Position;
            local l_LookVector_0 = l_CFrame_1.LookVector;
            local _ = tick();
            do
                local l_l_CFrame_1_0, l_l_CFrame_2_0, l_l_Position_0_0, l_l_LookVector_0_0 = l_CFrame_1, l_CFrame_2, l_Position_0, l_LookVector_0;
                v62:ToggleSkill(v63, {
                    Key = Enum.KeyCode.T, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 301 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_3 (copy), l_l_CFrame_2_0 (ref), l_l_CFrame_1_0 (ref), l_l_Position_0_0 (ref), l_l_LookVector_0_0 (ref), v77 (copy), v71 (copy), v67 (copy)
                        local v86 = 5 * (60 / _G.FPS) * (l_Character_3.Humanoid.Health / l_Character_3.Humanoid.MaxHealth);
                        local v87 = Ray.new(l_l_CFrame_2_0.p, (l_l_CFrame_2_0.Position - (l_l_CFrame_1_0 * CFrame.new(0, 0, -v86)).p).unit * -v86);
                        local v88, v89, v90 = _G.raycastWhitelist(v87, {
                            workspace.Islands, 
                            workspace.Ships, 
                            workspace.Env
                        });
                        l_l_CFrame_1_0 = CFrame.new(l_l_Position_0_0:Lerp(v89, 0.5), v89);
                        if l_l_CFrame_1_0 ~= l_l_CFrame_1_0 then
                            return true;
                        else
                            l_Character_3.HumanoidRootPart.CFrame = l_l_CFrame_1_0;
                            local _ = l_l_Position_0_0;
                            l_l_Position_0_0 = v89;
                            if v88 or v89.Y <= workspace.Env.WaterStuff.Falls.Position.Y and v89.Y > workspace.Env.WaterStuff.Sand.Position.Y and l_Character_3:FindFirstChild("coatBubble") == nil then
                                if v89.Y <= workspace.Env.WaterStuff.Falls.Position.Y and v89.Y > workspace.Env.WaterStuff.Sand.Position.Y and l_Character_3:FindFirstChild("coatBubble") == nil then
                                    v90 = Vector3.new(0, 1, 0, 0);
                                    v89 = Vector3.new(v89.X, workspace.Env.WaterStuff.Falls.Position.Y + 0.25, v89.Z);
                                end;
                                if l_Character_3.HumanoidRootPart.Position.Y > workspace.Env.WaterStuff.Falls.Position.Y - 1 or v89.Y < workspace.Env.WaterStuff.Sand.Position.Y or l_Character_3:FindFirstChild("coatBubble") then
                                    l_l_LookVector_0_0 = l_l_LookVector_0_0 - 2 * l_l_LookVector_0_0:Dot(v90) * v90;
                                    if v77 then
                                        v77:FireServer("reflect", CFrame.new(v89, v89 + v90));
                                    end;
                                end;
                                l_l_CFrame_1_0 = CFrame.new(v89, v89 + l_l_LookVector_0_0);
                                if l_l_CFrame_1_0 ~= l_l_CFrame_1_0 then
                                    return true;
                                else
                                    l_Character_3.HumanoidRootPart.CFrame = l_l_CFrame_1_0;
                                end;
                            end;
                            if l_Character_3.Humanoid.SeatPart ~= nil then
                                l_Character_3.Humanoid.SeatPart:Sit(nil);
                            end;
                            l_Character_3.HumanoidRootPart.Velocity = Vector3.new();
                            l_Character_3.HumanoidRootPart.RotVelocity = Vector3.new();
                            l_l_CFrame_2_0 = l_l_CFrame_1_0;
                            if l_Character_3:FindFirstChild("inCombat") and tick() - v71 >= 7 then
                                return true;
                            elseif l_Character_3:GetAttribute("ACFlag") == true then
                                return true;
                            else
                                local v92 = true;
                                if v77 ~= nil then
                                    v92 = not l_Character_3:FindFirstChild("Pika-Pika") or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v67.Stamina.Value <= 0 or _G.check:inspect(l_Character_3) == false;
                                end;
                                return v92;
                            end;
                        end;
                    end
                });
                l_Character_3.Humanoid.PlatformStand = false;
                l_Character_3.Humanoid.AutoRotate = true;
                _G.transparentCharacter(l_Character_3, true, nil, true);
                for v93 = 1, #v73 do
                    pcall(function() --[[ Line: 360 ]]
                        -- upvalues: v73 (copy), v93 (copy)
                        v73[v93].CollisionGroup = "Players";
                    end);
                end;
                l_Character_3.HumanoidRootPart.Velocity = Vector3.new();
                l_Character_3.Humanoid.PlatformStand = false;
                if v77 then
                    v77:FireServer();
                end;
                v70:Destroy();
                _G.canuse = true;
                _G.keysetup:cooldown("Light Flight", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.fly = false;
            end;
        end;
    end;
end;
v16.MirrorKick = function(v94, _) --[[ Line: 380 ]] --[[ Name: MirrorKick ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v94.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_4.Mirror == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Mirror Kick") == true then
        local v99 = v3.GetM("Mirror Kick");
        local l_cd_4 = v99.cd;
        if _G.StamCheck("Mirror Kick") == false then
            return;
        elseif v99.statreq and _G.MeetReq(v99.statreq) == false then
            return;
        else
            l_Cooldowns_4.Mirror = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Mirror Kick", {
                pos = v94:GetMousePosition(), 
                cf = l_Character_4.HumanoidRootPart.CFrame
            });
            task.wait(0.25);
            _G.canuse = true;
            _G.keysetup:cooldown("Mirror Kick", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.Mirror = false;
        end;
    end;
end;
v16.JewelsofLight = function(v101, v102) --[[ Line: 407 ]] --[[ Name: JewelsofLight ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v101.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v105 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse == true and l_Cooldowns_5.rapid == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Jewels of Light") == true then
        local v106 = v3.GetM("Jewels of Light");
        local l_cd_5 = v106.cd;
        if _G.StamCheck("Jewels of Light") == false then
            return;
        elseif v106.statreq and _G.MeetReq(v106.statreq) == false then
            return;
        else
            l_Cooldowns_5.rapid = true;
            _G.canuse = false;
            local v108 = l_Character_5.Humanoid:LoadAnimation(script.rapid);
            v108:Play();
            local l_ComboBP_0 = l_Character_5.HumanoidRootPart:FindFirstChild("ComboBP");
            if l_ComboBP_0 then
                l_ComboBP_0:Destroy();
            end;
            local v110 = Instance.new("BodyVelocity", l_Character_5.HumanoidRootPart);
            v110.Name = "geppo";
            v110.MaxForce = Vector3.new(1000000000, 1.0000000272564224E16, 1000000000, 0);
            v110.Velocity = l_Character_5.HumanoidRootPart.CFrame.upVector * 125;
            v110.P = 4324234234;
            _G.destroy(v110, 0.25);
            v110 = nil;
            local v111 = game.ReplicatedStorage.Events.Skill:InvokeServer("Jewels of Light");
            _G.PauseAnim(v108, 0.525, 1);
            _G.FaceMouse = true;
            local v112 = tick();
            v101:ChargeSkill(v102, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 445 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_5 (copy), v105 (copy), v112 (copy)
                    if not l_Character_5:FindFirstChild("Pika-Pika") or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v105.Stamina.Value <= 0 or tick() - v112 >= 5 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            _G.FaceMouse = false;
            if v111 then
                v111:FireServer();
            end;
            v108:Stop();
            _G.canuse = true;
            _G.keysetup:cooldown("Jewels of Light", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.rapid = false;
        end;
    end;
end;
return v16;