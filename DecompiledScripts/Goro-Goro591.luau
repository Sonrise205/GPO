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
        piller = false, 
        sango = false, 
        dragon = false, 
        flash = false, 
        raigo = false, 
        fly = false
    };
    return v9;
end;
v7.LightningWrath = function(v10, v11) --[[ Line: 35 ]] --[[ Name: LightningWrath ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.piller == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Lightning Wrath") == true then
        local v15 = v3.GetM("Lightning Wrath");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Lightning Wrath") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.piller = true;
            _G.canuse = false;
            local v17 = l_Character_0.Humanoid:LoadAnimation(script.piller);
            v17:Play();
            v17:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v17, 0.42, 1);
            local v18 = tick();
            local v19 = false;
            do
                local l_v19_0 = v19;
                v10:ChargeSkill(v11, {
                    Key = Enum.KeyCode.Z, 
                    EndFunction = function() --[[ Line: 65 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v18 (copy), l_Character_0 (copy), v14 (copy), l_v19_0 (ref)
                        if tick() - v18 >= 10 or not l_Character_0:FindFirstChild("Goro-Goro") or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0 then
                            return true;
                        elseif _G.check:inspect(l_Character_0) == false then
                            l_v19_0 = true;
                            return true;
                        else
                            return;
                        end;
                    end
                });
                if l_v19_0 == false then
                    v17:AdjustSpeed(1.5);
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Lightning Wrath", {
                        cf = v10:GetMouseCFrame()
                    });
                    l_Character_0.HumanoidRootPart.Anchored = true;
                else
                    v17:Stop();
                end;
                _G.FaceMouse = false;
                task.wait(0.5);
                l_Character_0.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Lightning Wrath", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.piller = false;
            end;
        end;
    end;
end;
v7.LightningParalyzation = function(v21, v22) --[[ Line: 96 ]] --[[ Name: LightningParalyzation ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v25 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sango == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Lightning Paralyzation") == true then
        local v26 = v3.GetM("Lightning Paralyzation");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Lightning Paralyzation") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            l_Cooldowns_1.sango = true;
            _G.canuse = false;
            local v28 = l_Character_1.Humanoid:LoadAnimation(script.sango);
            v28:Play();
            v28:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v29 = game.ReplicatedStorage.MiscModels.GoroSphere:Clone();
            v29.Parent = workspace.Effects;
            local v30 = Instance.new("Weld", v29);
            v30.Part0 = l_Character_1.HumanoidRootPart;
            v30.Part1 = v29;
            _G.tween(v29.Mesh, {
                0.42, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Scale = Vector3.new(35, 35, 35, 0)
            });
            _G.PauseAnim(v28, 0.42, 1);
            local _ = tick();
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.E, 
                IgnoreInstantCastSetting = true, 
                CheckFunction = function() --[[ Line: 135 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_1 (copy), v29 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                    local _ = l_Character_1.RightHand.CFrame;
                    if v29.Mesh.Scale.X < 100 then
                        local l_Mesh_0 = v29.Mesh;
                        l_Mesh_0.Scale = l_Mesh_0.Scale + Vector3.new(0.75, 0.75, 0.75, 0) * (60 / _G.FPS);
                    end;
                    _G.canuse = false;
                end, 
                EndFunction = function() --[[ Line: 143 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_1 (copy), v25 (copy)
                    return not l_Character_1:FindFirstChild("Goro-Goro") or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v25.Stamina.Value <= 0;
                end
            });
            v28:AdjustSpeed(1.5);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Lightning Paralyzation", {
                cf = l_Character_1.PrimaryPart.CFrame, 
                size = v29.Mesh.Scale.X
            });
            _G.tween(v29, {
                0.25, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Transparency = 1
            });
            _G.destroy(v29, 0.25);
            task.wait(0.7);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Lightning Paralyzation", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.sango = false;
        end;
    end;
end;
v7.FlashSmash = function(v34, v35) --[[ Line: 161 ]] --[[ Name: FlashSmash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v34.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v38 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.flash == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Flash Smash") == true then
        local v39 = v3.GetM("Flash Smash");
        local l_cd_2 = v39.cd;
        if _G.StamCheck("Flash Smash") == false then
            return;
        elseif v39.statreq and _G.MeetReq(v39.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v41 = tick();
            local v42 = l_Character_2.Humanoid:LoadAnimation(script.dashCharge);
            v42:Play();
            _G.FaceMouse = true;
            _G.PauseAnim(v42, 0.6, 1.3);
            l_Cooldowns_2.flash = true;
            v34:ChargeSkill(v35, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 186 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_2 (copy), v41 (copy), v38 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                    local v43 = true;
                    if tick() - v41 < 10 then
                        v43 = not l_Character_2:FindFirstChild("Goro-Goro") or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v38.Stamina.Value <= 0 or l_Character_2:FindFirstChild("Stun");
                    end;
                    return v43;
                end
            });
            v42:AdjustSpeed(1);
            _G.FaceMouse = false;
            l_Character_2.Humanoid.WalkSpeed = 16;
            l_Character_2.HumanoidRootPart.Anchored = true;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Flash Smash", {
                endPos = v34:GetMouseCFrame()
            });
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Flash Smash", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.flash = false;
        end;
    end;
end;
v7.LightningDragon = function(v44, v45) --[[ Line: 207 ]] --[[ Name: LightningDragon ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v44.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v48 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.dragon == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Lightning Dragon") == true then
        local v49 = v3.GetM("Lightning Dragon");
        local l_cd_3 = v49.cd;
        if _G.StamCheck("Lightning Dragon") == false then
            return;
        elseif v49.statreq and _G.MeetReq(v49.statreq) == false then
            return;
        else
            l_Cooldowns_3.dragon = true;
            _G.canuse = false;
            local v51 = tick();
            local v52 = l_Character_3.Humanoid:LoadAnimation(script.dragon);
            v52:Play();
            v52:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v52, 0.42, 1);
            local v53 = false;
            do
                local l_v53_0 = v53;
                v44:ChargeSkill(v45, {
                    Key = Enum.KeyCode.X, 
                    EndFunction = function() --[[ Line: 250 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v51 (copy), l_Character_3 (copy), v48 (copy), l_v53_0 (ref)
                        if tick() - v51 >= 10 or not l_Character_3:FindFirstChild("Goro-Goro") or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v48.Stamina.Value <= 0 then
                            return true;
                        elseif _G.check:inspect(l_Character_3) == false then
                            l_v53_0 = true;
                            return true;
                        else
                            return;
                        end;
                    end
                });
                l_Character_3.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                if l_v53_0 == false then
                    v52:AdjustSpeed(1);
                    task.wait(0.3);
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Lightning Dragon", {
                        endPos = v44:GetMouseCFrame(), 
                        start = l_Character_3.RightHand.CFrame
                    });
                    task.wait(0.4);
                else
                    v52:Stop();
                end;
                l_Character_3.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Lightning Dragon", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.dragon = false;
            end;
        end;
    end;
end;
v7.ThunderGreeting = function(v55, v56) --[[ Line: 280 ]] --[[ Name: ThunderGreeting ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v55.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v59 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.raigo == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Thunder Greeting") == true then
        local v60 = v3.GetM("Thunder Greeting");
        local l_cd_4 = v60.cd;
        if _G.StamCheck("Thunder Greeting") == false then
            return;
        elseif v60.statreq and _G.MeetReq(v60.statreq) == false then
            return;
        else
            l_Cooldowns_4.raigo = true;
            _G.canuse = false;
            local v62 = l_Character_4.Humanoid:LoadAnimation(script.raigo);
            v62:Play();
            v62:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v62, 0.5, 1);
            local v63 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunder Greeting", {
                cf = v55:GetMouseCFrame()
            });
            local v64 = tick();
            v55:ChargeSkill(v56, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 323 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_4 (copy), v59 (copy), v64 (copy)
                    return not l_Character_4:FindFirstChild("Goro-Goro") or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v59.Stamina.Value <= 0 or tick() - v64 >= 15 or l_Character_4:GetAttribute("goroUltMax") ~= nil;
                end, 
                IgnoreInstantCastSetting = true
            });
            v62:AdjustSpeed(1.5);
            if v63 then
                v63:FireServer(v55:GetMouseCFrame());
            end;
            l_Character_4.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            task.wait(0.5);
            l_Character_4.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Thunder Greeting", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.raigo = false;
        end;
    end;
end;
v7.LightningForm = function(v65, v66) --[[ Line: 349 ]] --[[ Name: LightningForm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v65.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v69 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_5.fly == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Lightning Form") == true then
        local v70 = v3.GetM("Lightning Form");
        local l_cd_5 = v70.cd;
        if _G.StamCheck("Lightning Form") == false then
            return;
        elseif v70.statreq and _G.MeetReq(v70.statreq) == false then
            return;
        else
            l_Cooldowns_5.fly = true;
            _G.canuse = false;
            local _ = tick();
            local v73 = game.ReplicatedStorage.Events.Skill:InvokeServer("Lightning Form");
            local v74 = nil;
            if v73 then
                v74 = Instance.new("BodyVelocity", l_Character_5.LowerTorso);
                v74.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
                v74.Name = "geppo";
                v74.Velocity = Vector3.new();
            end;
            local _ = l_Character_5.PrimaryPart.CFrame;
            do
                local l_v74_0 = v74;
                local function v78() --[[ Line: 383 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_5 (copy), l_v74_0 (ref), v65 (copy)
                    _G.canuse = false;
                    local v77 = l_Character_5.Humanoid.Health / l_Character_5.Humanoid.MaxHealth;
                    if l_v74_0 then
                        l_v74_0.Velocity = (l_Character_5.HumanoidRootPart.Position - v65:GetMouseCFrame().p).unit * -(125 * v77);
                    end;
                    l_Character_5.PrimaryPart.Velocity = Vector3.new();
                end;
                v65:ChargeSkill(v66, {
                    Button = v66, 
                    Key = Enum.KeyCode.T, 
                    PCInputType = "Default", 
                    MobileInputType = "Toggle", 
                    IgnoreInstantCastSetting = true, 
                    CheckFunction = v78, 
                    EndFunction = function() --[[ Line: 392 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_5 (copy), v69 (copy), v73 (copy)
                        if l_Character_5:FindFirstChild("Goro-Goro") == nil or _G.check:inspect(l_Character_5) == false or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v69.Stamina.Value <= 0 or v73 == nil then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                if v73 then
                    v73:FireServer();
                end;
                if l_v74_0 then
                    l_v74_0:Destroy();
                end;
                l_Character_5:SetPrimaryPartCFrame(CFrame.new(l_Character_5.PrimaryPart.Position, v65:GetMouseCFrame().p));
                _G.canuse = true;
                _G.keysetup:cooldown("Lightning Form", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.fly = false;
            end;
        end;
    end;
end;
return v7;