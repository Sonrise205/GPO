local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        ult = false, 
        dash = false, 
        bite = false, 
        chain = false, 
        burst = false
    };
    v8.currentGroundedUI = nil;
    return v8;
end;
v6.BloodDragon = function(v9, _) --[[ Line: 26 ]] --[[ Name: BloodDragon ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.ult == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Blood Dragon") == true then
        local v14 = v2.GetM("Blood Dragon");
        local l_cd_0 = v14.cd;
        if _G.StamCheck("Blood Dragon") == false then
            return;
        elseif v14.statreq and _G.MeetReq(v14.statreq) == false then
            return;
        else
            l_Cooldowns_0.ult = true;
            _G.canuse = false;
            local v16 = _G.getTargetNearMouse();
            if v16 == nil then
                v16 = v9:GetMouseCFrame();
            end;
            local l_v16_0 = v16;
            if typeof(v16) == "Instance" then
                l_v16_0 = v16.CFrame;
            end;
            local function v18() --[[ Line: 55 ]] --[[ Name: getMouse ]]
                -- upvalues: v9 (copy)
                return v9:GetMouseCFrame();
            end;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v19 = l_Character_0.Humanoid:LoadAnimation(script.ult);
            v19:Play(0);
            v19:AdjustWeight(2);
            task.wait(0.25);
            local v20 = game.ReplicatedStorage.Events.Skill:InvokeServer("Blood Dragon", v18());
            local v21 = tick();
            repeat
                if v20 then
                    v20:FireServer(v18());
                end;
                task.wait(0.05);
            until tick() - v21 >= 1.6;
            l_Character_0.PrimaryPart.Anchored = false;
            _G.FaceMouse = false;
            _G.mouseLevel = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Blood Dragon", l_cd_0);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.ult = false;
        end;
    end;
end;
v6.BloodDash = function(v22, _) --[[ Line: 86 ]] --[[ Name: BloodDash ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v22.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.dash == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Blood Dash") == true then
        local v27 = v2.GetM("Blood Dash");
        local l_cd_1 = v27.cd;
        if _G.StamCheck("Blood Dash") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            l_Cooldowns_1.dash = true;
            _G.canuse = false;
            local v29 = l_Character_1.Humanoid:LoadAnimation(script.dash);
            v29:Play(0);
            v29:AdjustWeight(2);
            l_Character_1.Humanoid.AutoRotate = false;
            task.wait(0.25);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Blood Dash", l_Character_1.PrimaryPart.CFrame);
            l_Character_1.Humanoid.WalkSpeed = 16;
            l_Character_1.Humanoid.AutoRotate = true;
            _G.keysetup:cooldown("Blood Dash", l_cd_1);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.dash = false;
        end;
    end;
end;
v6.VampireBite = function(v31, v32) --[[ Line: 125 ]] --[[ Name: VampireBite ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v31.Cooldowns;
    local v34 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.bite == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Vampire Bite") == true then
        local v36 = v2.GetM("Vampire Bite");
        local l_cd_2 = v36.cd;
        if _G.StamCheck("Vampire Bite") == false then
            return;
        elseif v36.statreq and _G.MeetReq(v36.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v38 = game.ReplicatedStorage.Events.Skill:InvokeServer("Vampire Bite", {
                cf = v31:GetMouseCFrame()
            });
            l_Cooldowns_2.bite = true;
            local v39 = l_Character_2.Humanoid:LoadAnimation(script.bite);
            v39:Play();
            v39:AdjustWeight(5);
            _G.canuse = false;
            l_Character_2.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v39, 0.12, 1);
            local v40 = tick();
            v31:ChargeSkill(v32, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 153 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 158 ]] --[[ Name: endFunction ]]
                    -- upvalues: v40 (copy), v31 (copy), l_Character_2 (copy), v34 (copy)
                    if tick() - v40 >= 5 or v31.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v34.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v39:AdjustSpeed(1);
            local l_LinearVelocity_0 = Instance.new("LinearVelocity");
            l_LinearVelocity_0.Attachment0 = l_Character_2.PrimaryPart.RootRigAttachment;
            l_LinearVelocity_0.MaxForce = 100000000000;
            l_LinearVelocity_0.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
            l_LinearVelocity_0.VectorVelocity = l_Character_2:GetPivot().LookVector * 60;
            l_LinearVelocity_0.RelativeTo = Enum.ActuatorRelativeTo.World;
            l_LinearVelocity_0.Parent = l_Character_2;
            local l_AlignOrientation_0 = Instance.new("AlignOrientation");
            l_AlignOrientation_0.Attachment0 = l_Character_2.PrimaryPart.RootRigAttachment;
            l_AlignOrientation_0.Mode = 0;
            l_AlignOrientation_0.CFrame = l_Character_2:GetPivot();
            l_AlignOrientation_0.Responsiveness = 45;
            l_AlignOrientation_0.MaxTorque = 100000000000;
            l_AlignOrientation_0.Parent = l_Character_2;
            _G.tween(l_LinearVelocity_0, {
                0.5, 
                "Linear", 
                Enum.EasingDirection.Out
            }, {
                VectorVelocity = Vector3.new(0, 0, 0, 0)
            });
            _G.destroy(l_LinearVelocity_0, 0.5);
            _G.destroy(l_AlignOrientation_0, 0.5);
            if v38 then
                v38:FireServer("woosh");
            end;
            local v43 = nil;
            local _ = false;
            do
                local l_v43_0 = v43;
                local function v47(v46) --[[ Line: 196 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_LinearVelocity_0 (copy), v38 (copy), l_Character_2 (copy), l_v43_0 (ref)
                    l_LinearVelocity_0:Destroy();
                    if v38 then
                        v38:FireServer(l_Character_2.PrimaryPart.CFrame, v46.Parent);
                        l_v43_0 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_2, Vector3.new(8, 8, 8, 0), 0.25, CFrame.new(0, 0, -1), v47);
                task.wait(0.5);
                l_Character_2.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Vampire Bite", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.bite = false;
            end;
        end;
    end;
end;
v6.BloodChain = function(v48, v49) --[[ Line: 215 ]] --[[ Name: BloodChain ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v48.Cooldowns;
    local v51 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.chain == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Blood Chain") == true then
        local v53 = v2.GetM("Blood Chain");
        local l_cd_3 = v53.cd;
        if _G.StamCheck("Blood Chain") == false then
            return;
        elseif v53.statreq and _G.MeetReq(v53.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v55 = game.ReplicatedStorage.Events.Skill:InvokeServer("Blood Chain", {
                cf = v48:GetMouseCFrame()
            });
            l_Cooldowns_3.chain = true;
            local v56 = l_Character_3.Humanoid:LoadAnimation(script.punch);
            v56:Play();
            v56:AdjustWeight(5);
            _G.canuse = false;
            l_Character_3.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v56, 0.2, 1);
            local v57 = tick();
            v48:ChargeSkill(v49, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 243 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 248 ]] --[[ Name: endFunction ]]
                    -- upvalues: v57 (copy), v48 (copy), l_Character_3 (copy), v51 (copy)
                    if tick() - v57 >= 5 or v48.Tool.Parent ~= l_Character_3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v51.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v56:AdjustSpeed(1);
            local l_LinearVelocity_1 = Instance.new("LinearVelocity");
            l_LinearVelocity_1.Attachment0 = l_Character_3.PrimaryPart.RootRigAttachment;
            l_LinearVelocity_1.MaxForce = 100000000000;
            l_LinearVelocity_1.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
            l_LinearVelocity_1.VectorVelocity = l_Character_3:GetPivot().LookVector * 125;
            l_LinearVelocity_1.RelativeTo = Enum.ActuatorRelativeTo.World;
            l_LinearVelocity_1.Parent = l_Character_3;
            local l_AlignOrientation_1 = Instance.new("AlignOrientation");
            l_AlignOrientation_1.Attachment0 = l_Character_3.PrimaryPart.RootRigAttachment;
            l_AlignOrientation_1.Mode = 0;
            l_AlignOrientation_1.CFrame = l_Character_3:GetPivot();
            l_AlignOrientation_1.Responsiveness = 45;
            l_AlignOrientation_1.MaxTorque = 100000000000;
            l_AlignOrientation_1.Parent = l_Character_3;
            _G.tween(l_LinearVelocity_1, {
                0.5, 
                "Linear", 
                Enum.EasingDirection.Out
            }, {
                VectorVelocity = Vector3.new(0, 0, 0, 0)
            });
            _G.destroy(l_LinearVelocity_1, 0.5);
            _G.destroy(l_AlignOrientation_1, 0.5);
            if v55 then
                v55:FireServer("woosh");
            end;
            local v60 = nil;
            local _ = false;
            do
                local l_v60_0 = v60;
                local function v65(v63) --[[ Line: 287 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_LinearVelocity_1 (copy), v55 (copy), l_Character_3 (copy), l_v60_0 (ref)
                    l_LinearVelocity_1:Destroy();
                    if v55 then
                        local v64 = l_Character_3.PrimaryPart.CFrame * CFrame.new(0, 0, -5);
                        v55:FireServer(CFrame.new(l_Character_3.PrimaryPart.Position, (Vector3.new(v64.X, l_Character_3.PrimaryPart.Position.Y, v64.Z))), v63.Parent);
                        l_v60_0 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_3, Vector3.new(8, 8, 8, 0), 0.25, CFrame.new(0, 0, -1), v65);
                task.wait(0.5);
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Blood Chain", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.chain = false;
            end;
        end;
    end;
end;
v6.BloodAura = function(v66, v67) --[[ Line: 307 ]] --[[ Name: BloodAura ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy), l_LocalPlayer_0 (copy)
    local l_Cooldowns_4 = v66.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.burst == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Blood Aura") == true then
        local v71 = v2.GetM("Blood Aura");
        local l_cd_4 = v71.cd;
        if _G.StamCheck("Blood Aura") == false then
            return;
        elseif v71.statreq and _G.MeetReq(v71.statreq) == false then
            return;
        else
            local l_l_Character_4_Attribute_0 = l_Character_4:GetAttribute("vampireDamage");
            if l_l_Character_4_Attribute_0 == nil or l_l_Character_4_Attribute_0 and l_l_Character_4_Attribute_0 < require(game.ReplicatedStorage.Modules.Skills.Modes.Vampire)(l_LocalPlayer_0) / 4 then
                _G.displayMessage("<Color=Red>You dont have enough blood");
                return;
            else
                l_Cooldowns_4.burst = true;
                _G.canuse = false;
                l_Character_4.Humanoid.WalkSpeed = 0;
                local v74 = l_Character_4.Humanoid:LoadAnimation(script.aura);
                v74:Play(0);
                v74:AdjustWeight(2);
                v74.Priority = Enum.AnimationPriority.Action4;
                l_Character_4.PrimaryPart.Anchored = true;
                local v75 = game.ReplicatedStorage.Events.Skill:InvokeServer("Blood Aura", l_Character_4.PrimaryPart.CFrame);
                v66.currentGroundedUI = script.AuraUI:Clone();
                v66.currentGroundedUI.ImageLabel.ImageTransparency = 1;
                v66.currentGroundedUI.Parent = l_LocalPlayer_0.PlayerGui;
                _G.tween(v66.currentGroundedUI.ImageLabel, {
                    0.25, 
                    "Cubic", 
                    Enum.EasingDirection.Out
                }, {
                    ImageTransparency = script.AuraUI.ImageLabel.ImageTransparency
                });
                local v76 = script.ColorCorrection:Clone();
                v76.Name = "bloodAuraCamera";
                v76.TintColor = Color3.fromRGB(255, 255, 255);
                v76.Parent = workspace.CurrentCamera;
                _G.tween(v76, {
                    0.25, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    TintColor = script.ColorCorrection.TintColor
                });
                task.wait(1.5);
                l_Character_4.Humanoid.WalkSpeed = 16;
                l_Character_4.PrimaryPart.Anchored = false;
                if v75 then
                    v66:DoubleCastSkill(v67, {
                        Key = Enum.KeyCode.X, 
                        SkipTap = true, 
                        CompleteFunction = function() --[[ Line: 359 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: v75 (copy), l_Character_4 (copy)
                            v75:FireServer(l_Character_4.PrimaryPart.CFrame);
                        end, 
                        PassFunction = function() --[[ Line: 362 ]] --[[ Name: PassFunction ]]
                            -- upvalues: l_Character_4 (copy)
                            return l_Character_4:GetAttribute("bloodAura") ~= nil;
                        end
                    });
                    task.spawn(function() --[[ Line: 367 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), l_Character_4 (copy), v76 (copy), v66 (copy), l_cd_4 (copy), l_Cooldowns_4 (copy)
                        local v77 = {};
                        local v78 = 0;
                        local function v81(v79, v80) --[[ Line: 371 ]] --[[ Name: fadeHighlight ]]
                            -- upvalues: v77 (copy)
                            if v79 then
                                _G.tween(v79, {
                                    0.25, 
                                    "Cubic", 
                                    Enum.EasingDirection.Out
                                }, {
                                    FillTransparency = 1, 
                                    OutlineTransparency = 1
                                });
                                _G.destroy(v79, 0.25);
                                v77[v80] = nil;
                            end;
                        end;
                        repeat
                            if tick() - v78 >= 0.1 then
                                local l_Children_0 = workspace.NPCs:GetChildren();
                                local l_Players_0 = game.Players:GetPlayers();
                                for v84 = 1, #l_Players_0 do
                                    local v85 = l_Players_0[v84];
                                    if v85 ~= l_LocalPlayer_0 and v85:FindFirstChild("Party") and (v85.Party.Value == nil or v85.Party.Value ~= l_LocalPlayer_0.Party.Value) then
                                        local l_Character_5 = v85.Character;
                                        if l_Character_5 and l_Character_5.PrimaryPart then
                                            table.insert(l_Children_0, l_Character_5);
                                        end;
                                    end;
                                end;
                                for v87 = 1, #l_Children_0 do
                                    if l_Children_0[v87].PrimaryPart ~= nil and v77[l_Children_0[v87]] == nil then
                                        local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - l_Children_0[v87].PrimaryPart.Position).Magnitude;
                                        local _, v90 = workspace.CurrentCamera:WorldToScreenPoint(l_Children_0[v87].PrimaryPart.Position);
                                        if v90 == true and l_Magnitude_0 <= 125 then
                                            local l_Highlight_0 = Instance.new("Highlight");
                                            l_Highlight_0.Name = "characterHighlight";
                                            l_Highlight_0.FillTransparency = 1;
                                            l_Highlight_0.FillColor = Color3.fromRGB(255, 0, 0);
                                            l_Highlight_0.OutlineColor = Color3.fromRGB(255, 0, 0);
                                            l_Highlight_0.OutlineTransparency = 1;
                                            l_Highlight_0.Parent = l_Children_0[v87];
                                            l_Highlight_0.Enabled = true;
                                            _G.tween(l_Highlight_0, {
                                                0.25, 
                                                "Cubic", 
                                                Enum.EasingDirection.Out
                                            }, {
                                                FillTransparency = 0.5, 
                                                OutlineTransparency = 0
                                            });
                                            v77[l_Children_0[v87]] = l_Highlight_0;
                                        end;
                                    end;
                                end;
                                for v92, v93 in pairs(v77) do
                                    if v92 == nil or v92 and v92.PrimaryPart == nil or v92.Parent == workspace.Effects then
                                        v81(v93, v92);
                                    elseif v92 and v92.PrimaryPart ~= nil then
                                        local l_Magnitude_1 = (workspace.CurrentCamera.CFrame.Position - v92.PrimaryPart.Position).Magnitude;
                                        local _, v96 = workspace.CurrentCamera:WorldToScreenPoint(v92.PrimaryPart.Position);
                                        if l_Magnitude_1 > 125 or v96 == false then
                                            v81(v93, v92);
                                        end;
                                    end;
                                end;
                                v78 = tick();
                            end;
                            task.wait();
                        until l_Character_4:GetAttribute("bloodAura") == nil;
                        _G.tween(v76, {
                            0.5, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            TintColor = Color3.fromRGB(255, 255, 255), 
                            Contrast = 0
                        });
                        _G.destroy(v76, 0.5);
                        if v66.currentGroundedUI then
                            _G.tween(v66.currentGroundedUI.ImageLabel, {
                                0.25, 
                                "Cubic", 
                                Enum.EasingDirection.Out
                            }, {
                                ImageTransparency = 1
                            });
                            _G.destroy(v66.currentGroundedUI, 0.25);
                            v66.currentGroundedUI = nil;
                        end;
                        for v97, v98 in pairs(v77) do
                            v81(v98, v97);
                        end;
                        table.clone(v77);
                        _G.keysetup:cooldown("Blood Aura", l_cd_4);
                        _G.fw(l_cd_4);
                        l_Cooldowns_4.burst = false;
                    end);
                end;
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
            end;
        end;
    end;
end;
return v6;