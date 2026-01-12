local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local v5 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = l_LocalPlayer_0:GetMouse();
local v7 = setmetatable({}, v3);
v7.__index = v7;
v7.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v7 (copy)
    local v9 = setmetatable(v3.new(script.Name), v7);
    v9.Cooldowns = {
        ["Party Table"] = false, 
        BShot = false, 
        Con = false, 
        AntiManer = false, 
        Coiller = false, 
        transform = false, 
        strike = false, 
        spectrum = false, 
        axe = false, 
        flash = false, 
        bliz = false, 
        asend = false
    };
    return v9;
end;
local function v26(v10, v11, v12, v13) --[[ Line: 26 ]] --[[ Name: beamProjectile ]]
    local v14 = 0.5 * v10 * v13 * v13 + v11 * v13 + v12;
    local v15 = v14 - (v10 * v13 * v13 + v11 * v13) / 3;
    local v16 = (0.125 * v10 * v13 * v13 + 0.5 * v11 * v13 + v12 - 0.125 * (v12 + v14)) / 0.375 - v15;
    local l_magnitude_0 = (v16 - v12).magnitude;
    local l_magnitude_1 = (v15 - v14).magnitude;
    local l_unit_0 = (v12 - v14).unit;
    local l_unit_1 = (v16 - v12).unit;
    local l_unit_2 = l_unit_1:Cross(l_unit_0).unit;
    local l_unit_3 = (v15 - v14).unit;
    local l_unit_4 = l_unit_3:Cross(l_unit_0).unit;
    l_unit_0 = l_unit_2:Cross(l_unit_1).unit;
    local v24 = CFrame.new(v12.x, v12.y, v12.z, l_unit_1.x, l_unit_2.x, l_unit_0.x, l_unit_1.y, l_unit_2.y, l_unit_0.y, l_unit_1.z, l_unit_2.z, l_unit_0.z);
    local v25 = CFrame.new(v14.x, v14.y, v14.z, l_unit_3.x, l_unit_4.x, l_unit_0.x, l_unit_3.y, l_unit_4.y, l_unit_0.y, l_unit_3.z, l_unit_4.z, l_unit_0.z);
    return l_magnitude_0, -l_magnitude_1, v24, v25;
end;
local function _(v27, v28) --[[ Line: 62 ]] --[[ Name: getinregion ]]
    -- upvalues: v5 (copy)
    return (v5.new(v27, v28):FindPartsInRegion3WithWhiteList({
        workspace.NPCs, 
        workspace.PlayerCharacters
    }, 5000));
end;
v7.PartyTableKickCourse = function(v30, v31) --[[ Line: 68 ]] --[[ Name: PartyTableKickCourse ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v30.Cooldowns;
    local v33 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0["Party Table"] == false and _G.StamCheck("Party Table Kick Course") == true and _G.canuse == true and _G.check:inspect(l_Character_0) == true then
        local v35 = v2.GetM("Party Table Kick Course");
        local l_cd_0 = v35.cd;
        if v35.statreq and _G.MeetReq(v35.statreq) == false then
            return;
        else
            l_Cooldowns_0["Party Table"] = true;
            local v37 = l_Character_0.Humanoid:LoadAnimation(script.Party);
            v37:Play();
            v37:AdjustSpeed(2);
            local _ = {
                hold = true
            };
            local v39 = tick();
            _G.canuse = false;
            task.wait(0.65);
            v37:Stop();
            v37 = l_Character_0.Humanoid:LoadAnimation(script.PartySpin);
            v37:Play();
            v37:AdjustSpeed(2);
            local v40 = game.ReplicatedStorage.Events.Skill:InvokeServer("Party Table Kick Course");
            local v41 = tick();
            do
                local l_v37_0, l_v41_0 = v37, v41;
                local function v46() --[[ Line: 98 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), l_v37_0 (ref), l_v41_0 (ref)
                    local l_PlayingAnimationTracks_0 = l_Character_0.Humanoid:GetPlayingAnimationTracks();
                    for v45 = 1, #l_PlayingAnimationTracks_0 do
                        if l_PlayingAnimationTracks_0[v45] ~= l_v37_0 and l_PlayingAnimationTracks_0[v45].Priority == Enum.AnimationPriority.Action then
                            l_PlayingAnimationTracks_0[v45].Priority = Enum.AnimationPriority.Movement;
                        end;
                    end;
                    l_Character_0.Humanoid.WalkSpeed = 4;
                    if tick() - l_v41_0 >= 0.2 then
                        l_v41_0 = tick();
                    end;
                end;
                v30:ChargeSkill(v31, {
                    Key = Enum.KeyCode.X, 
                    CheckFunction = v46, 
                    EndFunction = function() --[[ Line: 113 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_0 (copy), v39 (copy), v33 (copy)
                        if l_Character_0:FindFirstChild("Stun") then
                            return true;
                        elseif tick() - v39 >= 4 or v33.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                if v40 then
                    v40:InvokeServer();
                end;
                l_v37_0:Stop();
                l_v37_0 = l_Character_0.Humanoid:LoadAnimation(script.PartyStop);
                l_v37_0:Play();
                l_v37_0:AdjustSpeed(1.5);
                l_Character_0.Humanoid.WalkSpeed = 0;
                task.wait(0.8666666666666667);
                l_v37_0:Stop();
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Party Table Kick Course", l_cd_0);
                _G.canuse = true;
                task.wait(l_cd_0);
                l_Cooldowns_0["Party Table"] = false;
            end;
        end;
    end;
end;
v7["B-Shot"] = function(v47, v48) --[[ Line: 148 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v47.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.BShot == false and _G.StamCheck("B-Shot") == true and _G.canuse == true and _G.check:inspect(l_Character_1) == true then
        local v52 = v2.GetM("B-Shot");
        local l_cd_1 = v52.cd;
        if v52.statreq and _G.MeetReq(v52.statreq) == false then
            return;
        else
            l_Cooldowns_1.BShot = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("B-Shot");
            local v54 = l_Character_1.Humanoid:LoadAnimation(script.BShot);
            v54:Play();
            v54:AdjustSpeed(2);
            v54:AdjustWeight(2);
            local l_HipHeight_0 = l_Character_1.Humanoid.HipHeight;
            l_Character_1.Humanoid.HipHeight = l_Character_1.Humanoid.HipHeight + 1;
            _G.PauseAnim(v54, 0.6, 1.5, function() --[[ Line: 169 ]]
                -- upvalues: l_Character_1 (copy)
                l_Character_1.Humanoid.WalkSpeed = 4;
            end);
            local v56 = tick();
            v47:ChargeSkill(v48, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 175 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 179 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v54 (copy), v56 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 8;
                    if _G.check:inspect(l_Character_1) == false then
                        v54:Stop();
                        return true;
                    elseif tick() - v56 >= 4 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v54:AdjustSpeed(2);
            local v57 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
            v57.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 15 + Vector3.new(0, 20, 0, 0);
            v57.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            _G.destroy(v57, 0.25);
            _G.PlaySound(l_Character_1.PrimaryPart, script.bwoosh);
            local _ = nil;
            local v59 = false;
            local function v61(v60) --[[ Line: 203 ]] --[[ Name: hitfound ]]
                -- upvalues: v57 (copy)
                v57:Destroy();
                game.ReplicatedStorage.Events.Skill:InvokeServer("B-Shot", {
                    Target = v60.Parent
                });
            end;
            do
                local l_v59_0 = v59;
                local function v63() --[[ Line: 207 ]] --[[ Name: hitinter ]]
                    -- upvalues: v57 (copy), l_v59_0 (ref), v54 (copy)
                    v57:Destroy();
                    l_v59_0 = true;
                    v54:Stop();
                end;
                _G.hitbox:start(l_Character_1, Vector3.new(5, 5, 7, 0), 0.3, CFrame.new(0, -1, -1), v61, v63);
                l_Character_1.Humanoid.HipHeight = l_HipHeight_0;
                task.wait(0.4);
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("B-Shot", l_cd_1);
                task.wait(l_cd_1);
                l_Cooldowns_1.BShot = false;
            end;
        end;
    end;
end;
v7.Concasser = function(v64, v65) --[[ Line: 224 ]] --[[ Name: Concasser ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy), v26 (copy)
    local l_Cooldowns_2 = v64.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.Con == false and _G.StamCheck("Concasser") == true and _G.canuse == true and _G.check:inspect(l_Character_2) == true then
        local v69 = v2.GetM("Concasser");
        local l_cd_2 = v69.cd;
        if v69.statreq and _G.MeetReq(v69.statreq) == false then
            return;
        else
            l_Cooldowns_2.Con = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Concasser");
            local v71 = l_Character_2.Humanoid:LoadAnimation(script.Conse);
            v71:Play();
            v71:AdjustSpeed(0);
            local v72 = 0;
            local v73 = tick();
            local v74 = tick();
            local v75 = Instance.new("Attachment", game.Workspace.Terrain);
            local v76 = Instance.new("Attachment", game.Workspace.Terrain);
            local v77 = script.Beam:Clone();
            v77.Attachment0 = v75;
            v77.Attachment1 = v76;
            v77.Parent = workspace.Terrain;
            local v78 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
            local v79 = {
                Width0 = 0.25, 
                Width1 = 0.25
            };
            game:GetService("TweenService"):Create(v77, v78, v79):Play();
            local v80 = nil;
            local v81 = nil;
            local v82 = nil;
            local l_v64_MouseCFrame_0 = v64:GetMouseCFrame();
            local function v84() --[[ Line: 263 ]] --[[ Name: checkFunction ]]

            end;
            do
                local l_v72_0, l_v74_0, l_v75_0, l_v76_0, l_v77_0, l_v80_0, l_v81_0, l_v82_0, l_l_v64_MouseCFrame_0_0 = v72, v74, v75, v76, v77, v80, v81, v82, l_v64_MouseCFrame_0;
                local function v101() --[[ Line: 267 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v71 (copy), l_v74_0 (ref), l_l_v64_MouseCFrame_0_0 (ref), v64 (copy), l_v72_0 (ref), l_v80_0 (ref), l_v81_0 (ref), l_v82_0 (ref), v26 (ref), l_v77_0 (ref), l_v75_0 (ref), l_v76_0 (ref), v73 (copy)
                    if l_Character_2.Humanoid.SeatPart ~= nil then
                        v71:Stop();
                        return true;
                    else
                        if tick() - l_v74_0 >= 0.2 then
                            l_v74_0 = tick();
                            game.ReplicatedStorage.Events.takestam:FireServer(2);
                        end;
                        l_l_v64_MouseCFrame_0_0 = l_l_v64_MouseCFrame_0_0:Lerp(v64:GetMouseCFrame(), 0.1);
                        local v94 = Ray.new(workspace.Camera.CFrame.Position, (workspace.Camera.CFrame.Position - l_l_v64_MouseCFrame_0_0.p).unit * -(l_v72_0 + 75));
                        local v95, v96 = _G.raycastWhitelist(v94, {
                            workspace.Islands, 
                            workspace.Env, 
                            workspace.Ships
                        });
                        l_v80_0 = v95;
                        l_v81_0 = v96;
                        v95 = l_v81_0;
                        l_v82_0 = l_Character_2.HumanoidRootPart.CFrame.p;
                        v96 = (v95 - l_v82_0 - Vector3.new(0, -98.0999984741211, 0, 0)) / 1;
                        local v97, v98, v99, v100 = v26(Vector3.new(0, -196.1999969482422, 0, 0), v96, l_v82_0, 1);
                        l_v77_0.CurveSize0 = v97;
                        l_v77_0.CurveSize1 = v98;
                        l_v75_0.CFrame = l_v75_0.Parent.CFrame:inverse() * v99;
                        l_v76_0.CFrame = l_v76_0.Parent.CFrame:inverse() * v100;
                        l_v72_0 = l_v72_0 + 0.5;
                        l_Character_2.Humanoid.WalkSpeed = 4;
                        if _G.check:inspect(l_Character_2) == false then
                            v71:Stop();
                            return true;
                        elseif tick() - v73 >= 3 then
                            return true;
                        else
                            return;
                        end;
                    end;
                end;
                v64:ChargeSkill(v65, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = v84, 
                    EndFunction = v101, 
                    IgnoreInstantCastSetting = true, 
                    RunServiceType = game["Run Service"].Stepped
                });
                local v102 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
                local v103 = {
                    Width0 = 0, 
                    Width1 = 0
                };
                game:GetService("TweenService"):Create(l_v77_0, v102, v103):Play();
                _G.destroy(l_v75_0, 0.25);
                _G.destroy(l_v76_0, 0.25);
                l_v76_0 = nil;
                l_v75_0 = nil;
                _G.destroy(l_v77_0, 0.25);
                l_v77_0 = nil;
                v71:AdjustSpeed(2);
                l_v72_0 = math.clamp(l_v72_0, 0, 80);
                task.wait(0.1);
                local v104 = false;
                if l_v81_0 == nil then
                    l_v81_0 = l_Character_2.PrimaryPart.Position;
                end;
                local v105 = Vector3.new(0, 2, 0, 0);
                local v106 = l_v81_0 + v105;
                v105 = (CFrame.new(l_v81_0, l_Character_2.HumanoidRootPart.Position) * CFrame.new(0, 0, 100)).p;
                local v107 = l_Character_2.Humanoid:LoadAnimation(script.ConseSpin);
                task.delay(0.25, function() --[[ Line: 336 ]]
                    -- upvalues: v71 (copy), v104 (ref), v107 (copy)
                    v71:Stop();
                    if v104 == false then
                        v107:Play();
                    end;
                end);
                if l_v82_0 == nil then
                    l_v82_0 = l_Character_2.HumanoidRootPart.CFrame.p;
                end;
                local v108 = (v106 - l_v82_0 - Vector3.new(0, -98.0999984741211, 0, 0)) / 1;
                local v109 = 0;
                local v110 = nil;
                local v111 = nil;
                local v112 = game.ReplicatedStorage.Events.Skill:InvokeServer("Concasser", {
                    g = Vector3.new(0, -196.1999969482422, 0, 0), 
                    char = l_Character_2, 
                    nt = v109, 
                    t = 1, 
                    v0 = v108, 
                    x0 = l_v82_0, 
                    en2 = v105, 
                    endcf = v111
                });
                local v113 = Instance.new("BoolValue", l_Character_2.HumanoidRootPart);
                v113.Name = "geppo";
                if _G.check:inspect(l_Character_2) == true then
                    v110 = game["Run Service"].Heartbeat:Connect(function(v114) --[[ Line: 356 ]]
                        -- upvalues: l_Character_2 (copy), v109 (ref), v108 (copy), l_v82_0 (ref), v105 (copy), v111 (ref), v110 (ref), v104 (ref), v107 (copy)
                        l_Character_2.HumanoidRootPart.CFrame = CFrame.new(CFrame.new(Vector3.new(0, -98.0999984741211, 0, 0) * v109 * v109 + v108 * v109 + l_v82_0).p, v105);
                        local v115 = v109 + v114;
                        local v116 = CFrame.new(Vector3.new(0, -98.0999984741211, 0, 0) * v115 * v115 + v108 * v115 + l_v82_0);
                        local v117 = Ray.new(l_Character_2.HumanoidRootPart.CFrame.p, (l_Character_2.HumanoidRootPart.CFrame.p - v116.p).unit * -(l_Character_2.HumanoidRootPart.CFrame.p - v116.p).magnitude);
                        local v118, v119 = _G.raycastIgnoreList(v117, {
                            l_Character_2, 
                            workspace.Ragdolls, 
                            workspace.Effects, 
                            workspace.Projectiles, 
                            workspace.CurrentCamera, 
                            workspace.PlayerCharacters
                        });
                        local _ = Ray.new(l_Character_2.HumanoidRootPart.CFrame.p, (l_Character_2.HumanoidRootPart.CFrame.p - v116.p).unit * (l_Character_2.HumanoidRootPart.CFrame.p - v116.p).magnitude / 2);
                        l_Character_2.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                        if v118 then
                            local v121 = v119 + Vector3.new(0, l_Character_2.Humanoid.HipHeight * 1.5);
                            l_Character_2.HumanoidRootPart.CFrame = CFrame.new(v121, (Vector3.new(v105.x, v121.y, v105.z)));
                            v111 = l_Character_2.HumanoidRootPart.CFrame;
                            l_Character_2.HumanoidRootPart.Anchored = true;
                            l_Character_2.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                            v110:Disconnect();
                            v110 = nil;
                            v104 = true;
                        end;
                        v107:AdjustSpeed(v109 * 1.5);
                        v109 = v109 + v114;
                    end);
                else
                    v104 = true;
                end;
                repeat
                    task.wait();
                until v104 == true;
                v107:Stop();
                local v122 = l_Character_2.Humanoid:LoadAnimation(script.ConEnd);
                v122:Play();
                v122:AdjustWeight(2);
                if v112 then
                    v112:InvokeServer({
                        cf = v111, 
                        cf2 = l_Character_2.RightFoot.CFrame
                    });
                end;
                task.delay(0.2, function() --[[ Line: 391 ]]
                    -- upvalues: v122 (copy)
                    v122:Stop();
                end);
                l_Character_2.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                task.wait(0.2);
                l_Character_2.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                l_Character_2.HumanoidRootPart.Anchored = false;
                task.wait(0.4);
                v113:Destroy();
                l_Character_2.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Concasser", l_cd_2);
                _G.canuse = true;
                task.wait(l_cd_2);
                l_Cooldowns_2.Con = false;
            end;
        end;
    end;
end;
v7["Anti-MannerKickCourse"] = function(v123, v124) --[[ Line: 411 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v123.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.AntiManer == false and _G.StamCheck("Anti-Manner Kick Course") == true and _G.canuse == true and _G.check:inspect(l_Character_3) == true then
        local v128 = v2.GetM("Anti-Manner Kick Course");
        local l_cd_3 = v128.cd;
        if v128.statreq and _G.MeetReq(v128.statreq) == false then
            return;
        else
            l_Cooldowns_3.AntiManer = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Anti-Manner Kick Course");
            local v130 = l_Character_3.Humanoid:LoadAnimation(script.AntiManer);
            v130:Play();
            v130:AdjustSpeed(0);
            v130:AdjustWeight(2);
            _G.PauseAnim(v130, 0.3, 0.75, function() --[[ Line: 431 ]]
                -- upvalues: l_Character_3 (copy)
                l_Character_3.Humanoid.WalkSpeed = 4;
            end);
            local v131 = tick();
            v123:ChargeSkill(v124, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 437 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), v130 (copy), v131 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_3) == false then
                        v130:Stop();
                        return true;
                    elseif tick() - v131 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v130:AdjustSpeed(2);
            _G.PlaySound(l_Character_3.PrimaryPart, script.antiwoosh);
            local _ = nil;
            local v133 = false;
            local function v135(v134) --[[ Line: 457 ]] --[[ Name: hitfound ]]
                game.ReplicatedStorage.Events.Skill:InvokeServer("Anti-Manner Kick Course", {
                    Target = v134.Parent
                });
            end;
            do
                local l_v133_0 = v133;
                local function v137() --[[ Line: 460 ]] --[[ Name: hitinter ]]
                    -- upvalues: l_v133_0 (ref), v130 (copy)
                    l_v133_0 = true;
                    v130:Stop();
                end;
                _G.hitbox:start(l_Character_3, Vector3.new(5, 5, 5, 0), 0.3, CFrame.new(0, 0, -1), v135, v137);
                task.wait(0.4);
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Anti-Manner Kick Course", l_cd_3);
                _G.canuse = true;
                task.wait(l_cd_3);
                l_Cooldowns_3.AntiManer = false;
            end;
        end;
    end;
end;
v7.Coiller = function(v138, v139) --[[ Line: 474 ]] --[[ Name: Coiller ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v138.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.Coiller == false and _G.StamCheck("Coiller") == true and _G.canuse == true and _G.check:inspect(l_Character_4) == true then
        local v143 = v2.GetM("Coiller");
        local l_cd_4 = v143.cd;
        if v143.statreq and _G.MeetReq(v143.statreq) == false then
            return;
        else
            l_Cooldowns_4.Coiller = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Coiller");
            local v145 = l_Character_4.Humanoid:LoadAnimation(script.Coiller);
            v145:Play();
            v145:AdjustSpeed(0);
            v145:AdjustWeight(2);
            _G.PauseAnim(v145, 0.25, 1, function() --[[ Line: 493 ]]
                -- upvalues: l_Character_4 (copy)
                l_Character_4.Humanoid.WalkSpeed = 4;
            end);
            local v146 = tick();
            v138:ChargeSkill(v139, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 499 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_4 (copy), v145 (copy), v146 (copy)
                    l_Character_4.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_4) == false then
                        v145:Stop();
                        return true;
                    elseif tick() - v146 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v145:AdjustSpeed(2);
            _G.PlaySound(l_Character_4.PrimaryPart, script.ColWoosh);
            local _ = nil;
            local v148 = false;
            local function v150(v149) --[[ Line: 519 ]] --[[ Name: hitfound ]]
                game.ReplicatedStorage.Events.Skill:InvokeServer("Coiller", {
                    Target = v149.Parent
                });
            end;
            do
                local l_v148_0 = v148;
                local function v152() --[[ Line: 522 ]] --[[ Name: hitinter ]]
                    -- upvalues: l_v148_0 (ref), v145 (copy)
                    l_v148_0 = true;
                    v145:Stop();
                end;
                _G.hitbox:start(l_Character_4, Vector3.new(5, 5, 7, 0), 0.3, CFrame.new(0, 0, -2), v150, v152);
                task.wait(0.225);
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Coiller", l_cd_4);
                _G.canuse = true;
                task.wait(l_cd_4);
                l_Cooldowns_4.Coiller = false;
            end;
        end;
    end;
end;
v7.DemonSpectrum = function(v153, v154) --[[ Line: 538 ]] --[[ Name: DemonSpectrum ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_5 = v153.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_5 = l_LocalPlayer_0.Character;
    if l_Cooldowns_5.spectrum == false and _G.StamCheck("Demon Spectrum") == true and _G.canuse == true and _G.check:inspect(l_Character_5) == true then
        local v158 = v2.GetM("Demon Spectrum");
        local l_cd_5 = v158.cd;
        if v158.statreq and _G.MeetReq(v158.statreq) == false then
            return;
        else
            l_Cooldowns_5.spectrum = true;
            _G.canuse = false;
            local v160 = l_Character_5.Humanoid:LoadAnimation(script.specstart);
            v160:Play();
            v160:AdjustSpeed(2);
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            l_BodyVelocity_0.Velocity = Vector3.new(0, 5, 0, 0);
            l_BodyVelocity_0.Parent = l_Character_5.LowerTorso;
            task.wait(0.4);
            v160:Stop();
            local v162 = l_Character_5.Humanoid:LoadAnimation(script.specloop);
            v162:Play();
            v162:AdjustSpeed(2);
            local v163 = game.ReplicatedStorage.Events.Skill:InvokeServer("Demon Spectrum");
            local v164 = tick();
            v153:ChargeSkill(v154, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 568 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_BodyVelocity_0 (copy), l_Character_5 (copy), v164 (copy), v163 (copy)
                    l_BodyVelocity_0.Velocity = l_Character_5.HumanoidRootPart.CFrame.lookVector * 10;
                    if tick() - v164 >= 3 or v163 == nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_BodyVelocity_0:Destroy();
            v162:Stop();
            if v163 then
                v163:FireServer();
            end;
            _G.keysetup:cooldown("Demon Spectrum", l_cd_5);
            _G.canuse = true;
            task.wait(l_cd_5);
            l_Cooldowns_5.spectrum = false;
        end;
    end;
end;
v7.DemonAxeDrop = function(v165, v166) --[[ Line: 595 ]] --[[ Name: DemonAxeDrop ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_6 = v165.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_6 = l_LocalPlayer_0.Character;
    if l_Cooldowns_6.axe == false and _G.StamCheck("Demon Axe Drop") == true and _G.canuse == true and _G.check:inspect(l_Character_6) == true then
        local v170 = v2.GetM("Demon Axe Drop");
        local l_cd_6 = v170.cd;
        if v170.statreq and _G.MeetReq(v170.statreq) == false then
            return;
        else
            l_Cooldowns_6.axe = true;
            _G.canuse = false;
            local v172 = l_Character_6.Humanoid:LoadAnimation(script.VenShot);
            v172:Play();
            v172:AdjustSpeed(1.5);
            task.wait(0.26666666666666666);
            local _ = l_Character_6.HumanoidRootPart.Position.Y;
            local l_BodyVelocity_1 = Instance.new("BodyVelocity");
            l_BodyVelocity_1.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            l_BodyVelocity_1.Velocity = l_Character_6.HumanoidRootPart.CFrame.lookVector * 15 + Vector3.new(0, 25, 0, 0);
            l_BodyVelocity_1.Parent = l_Character_6.LowerTorso;
            local v175 = nil;
            local v176 = nil;
            do
                local l_v175_0, l_v176_0 = v175, v176;
                pcall(function() --[[ Line: 619 ]]
                    -- upvalues: l_v175_0 (ref), l_v176_0 (ref)
                    local v179, v180 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Demon Axe Drop"));
                    l_v175_0 = v179;
                    l_v176_0 = v180;
                end);
                task.wait(0.36666666666666664);
                v172:Stop();
                v172 = l_Character_6.Humanoid:LoadAnimation(script.VenLoop);
                v172:Play();
                v172:AdjustSpeed(2);
                local v181 = tick();
                local function v182() --[[ Line: 630 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_BodyVelocity_1 (copy), l_Character_6 (copy), v181 (copy), l_v175_0 (ref)
                    l_BodyVelocity_1.Velocity = l_Character_6.HumanoidRootPart.CFrame.lookVector * 6;
                    if tick() - v181 >= 3 or l_v175_0 == nil then
                        return true;
                    else
                        return;
                    end;
                end;
                v165:ChargeSkill(v166, {
                    Key = Enum.KeyCode.X, 
                    EndFunction = v182, 
                    IgnoreInstantCastSetting = true
                });
                v172:Stop();
                if l_v175_0 then
                    l_v175_0:FireServer();
                end;
                if l_v175_0 then
                    local v183 = l_Character_6.Humanoid:LoadAnimation(script.endaxe);
                    v183:Play();
                    v183:AdjustSpeed(1.5);
                    v183:AdjustWeight(2);
                    l_BodyVelocity_1.Velocity = l_Character_6.HumanoidRootPart.CFrame.lookVector * 25 + Vector3.new(0, 20, 0, 0);
                    task.wait(0.19999999999999998);
                    l_BodyVelocity_1.Velocity = Vector3.new(0, 0, 0, 0);
                    l_BodyVelocity_1.MaxForce = Vector3.new(0, 0, 0, 0);
                    task.spawn(function() --[[ Line: 658 ]]
                        -- upvalues: v183 (copy)
                        task.wait(0.25000000000000006);
                        v183:AdjustSpeed(0);
                    end);
                    local v184 = tick();
                    local v185 = false;
                    while true do
                        if l_Character_6.Humanoid.FloorMaterial ~= Enum.Material.Air then
                            v185 = true;
                            local v186 = true;
                            local l_CFrame_0 = l_Character_6.HumanoidRootPart.CFrame;
                            l_v176_0:FireServer(v186, l_CFrame_0);
                            l_Character_6.HumanoidRootPart.Anchored = true;
                            break;
                        else
                            game["Run Service"].RenderStepped:Wait();
                            if v185 == true or tick() - v184 >= 3 then
                                break;
                            end;
                        end;
                    end;
                    l_BodyVelocity_1:Destroy();
                    task.wait(0.5);
                    v183:Stop();
                else
                    l_BodyVelocity_1:Destroy();
                end;
                l_Character_6.HumanoidRootPart.Anchored = false;
                _G.keysetup:cooldown("Demon Axe Drop", l_cd_6);
                _G.canuse = true;
                task.wait(l_cd_6);
                l_Cooldowns_6.axe = false;
            end;
        end;
    end;
end;
v7.DemonFlash = function(v188, _) --[[ Line: 690 ]] --[[ Name: DemonFlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_7 = v188.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_7 = l_LocalPlayer_0.Character;
    if l_Cooldowns_7.flash == false and _G.StamCheck("Demon Flash") == true and _G.canuse == true and _G.check:inspect(l_Character_7) == true then
        local v193 = v2.GetM("Demon Flash");
        local l_cd_7 = v193.cd;
        if v193.statreq and _G.MeetReq(v193.statreq) == false then
            return;
        else
            l_Cooldowns_7.flash = true;
            _G.canuse = false;
            local v195 = l_Character_7.Humanoid:LoadAnimation(script.flash);
            v195:Play();
            l_Character_7.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v195, 0.4, 1.5);
            _G.hitbox:start(l_Character_7, Vector3.new(12, 12, 12, 0), 0.35, CFrame.new(0, 0, -1.5), function(v196) --[[ Line: 708 ]] --[[ Name: hitfound ]]
                -- upvalues: v195 (copy)
                v195:AdjustSpeed(2);
                task.wait(0.14999999999999997);
                game.ReplicatedStorage.Events.Skill:InvokeServer("Demon Flash", {
                    Target = v196.Parent
                });
            end, function() --[[ Line: 713 ]] --[[ Name: hitinter ]]
                -- upvalues: v195 (copy)
                v195:Stop();
            end);
            task.wait(0.35);
            v195:Stop();
            l_Character_7.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Demon Flash", l_cd_7);
            _G.canuse = true;
            task.wait(l_cd_7);
            l_Cooldowns_7.flash = false;
        end;
    end;
end;
v7.DemonBlitz = function(v197, v198) --[[ Line: 728 ]] --[[ Name: DemonBlitz ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_8 = v197.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_8 = l_LocalPlayer_0.Character;
    if l_Cooldowns_8.bliz == false and _G.StamCheck("Demon Blitz") == true and _G.canuse == true and _G.check:inspect(l_Character_8) == true then
        local v202 = v2.GetM("Demon Blitz");
        local l_cd_8 = v202.cd;
        if v202.statreq and _G.MeetReq(v202.statreq) == false then
            return;
        else
            l_Cooldowns_8.bliz = true;
            _G.canuse = false;
            local v204 = game.ReplicatedStorage.Events.Skill:InvokeServer("Demon Blitz");
            local v205 = l_Character_8.Humanoid:LoadAnimation(script.blizStart);
            v205:Play();
            _G.FaceMouse = true;
            task.wait(0.5);
            v205:Stop();
            local v206 = l_Character_8.Humanoid:LoadAnimation(script.BlizLoop);
            v206:Play();
            local v207 = tick();
            v197:ChargeSkill(v198, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 753 ]] --[[ Name: endFunction ]]
                    -- upvalues: v207 (copy), v204 (copy)
                    if tick() - v207 >= 3 or v204 == nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            if v204 then
                v204:FireServer();
            end;
            v206:Stop();
            _G.FaceMouse = false;
            _G.keysetup:cooldown("Demon Blitz", l_cd_8);
            _G.canuse = true;
            task.wait(l_cd_8);
            l_Cooldowns_8.bliz = false;
        end;
    end;
end;
v7.DemonicSkyDriller = function(v208, v209) --[[ Line: 779 ]] --[[ Name: DemonicSkyDriller ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy), v5 (copy)
    local l_Cooldowns_9 = v208.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_9 = l_LocalPlayer_0.Character;
    if l_Cooldowns_9.asend == false and _G.StamCheck("Demonic Sky Driller") == true and _G.canuse == true and _G.check:inspect(l_Character_9) == true then
        local v213 = v2.GetM("Demonic Sky Driller");
        local l_cd_9 = v213.cd;
        if v213.statreq and _G.MeetReq(v213.statreq) == false then
            return;
        else
            l_Cooldowns_9.asend = true;
            _G.canuse = false;
            local v215 = l_Character_9.Humanoid:LoadAnimation(script.asendStart);
            v215:Play();
            v215:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v215, 0.3, 1);
            local v216 = tick();
            v208:ChargeSkill(v209, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 800 ]] --[[ Name: endFunction ]]
                    -- upvalues: v216 (copy)
                    if tick() - v216 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            v215:AdjustSpeed(1);
            task.wait(0.1);
            local l_CFrame_1 = l_Character_9.HumanoidRootPart.CFrame;
            local v218 = CFrame.new(l_Character_9.HumanoidRootPart.Position, v208:GetMouseCFrame().p);
            local _ = v208:GetMouseCFrame();
            local v220 = Ray.new(v218.p, v218.LookVector * 125);
            local _, v222 = _G.raycastIgnoreList(v220, {
                workspace.Effects, 
                workspace.Projectiles, 
                l_Character_9
            });
            local l_Magnitude_0 = (v222 - v218.Position).Magnitude;
            local v224 = CFrame.new(v222, l_Character_9.HumanoidRootPart.CFrame.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, l_Character_9.Humanoid.HipHeight * 2, 3);
            local v225 = l_Character_9.HumanoidRootPart.CFrame * CFrame.new(0, 0, -l_Magnitude_0 / 2);
            local v226 = Vector3.new(25, 25, l_Magnitude_0 + 10);
            local l_PartsInRegion3WithWhiteList_0 = v5.new(v225, v226):FindPartsInRegion3WithWhiteList({
                workspace.NPCs, 
                workspace.PlayerCharacters
            }, 5000);
            v225 = _G.getTargetByPart(_G.MouseTarget);
            if v225 == nil then
                for v228 = 1, #l_PartsInRegion3WithWhiteList_0 do
                    if l_PartsInRegion3WithWhiteList_0[v228].Parent ~= l_Character_9 and l_PartsInRegion3WithWhiteList_0[v228].Parent:FindFirstChild("Humanoid") and (not l_PartsInRegion3WithWhiteList_0[v228].Parent:FindFirstChild("Info") or not l_PartsInRegion3WithWhiteList_0[v228].Parent.Info:FindFirstChild("Hostile") or l_PartsInRegion3WithWhiteList_0[v228].Parent.Info.Hostile.Value ~= false and not l_PartsInRegion3WithWhiteList_0[v228].Parent.Info:FindFirstChild("SeaNPC")) then
                        v225 = l_PartsInRegion3WithWhiteList_0[v228].Parent;
                        break;
                    end;
                end;
            end;
            if v225 then
                v224 = CFrame.new(v225.HumanoidRootPart.CFrame.p, l_Character_9.HumanoidRootPart.CFrame.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 2);
            end;
            l_Character_9.HumanoidRootPart.Anchored = true;
            l_Character_9.HumanoidRootPart.CFrame = v224;
            v215:Stop();
            game.ReplicatedStorage.Events.Skill:InvokeServer("Demonic Sky Driller", {
                target = v225, 
                cf = v224, 
                pre = l_CFrame_1
            });
            task.wait(0.25);
            l_Character_9.HumanoidRootPart.Anchored = false;
            _G.keysetup:cooldown("Demonic Sky Driller", l_cd_9);
            _G.canuse = true;
            task.wait(l_cd_9);
            l_Cooldowns_9.asend = false;
        end;
    end;
end;
local v229 = {
    {
        "B-Shot", 
        "e"
    }, 
    {
        "Coiller", 
        "r"
    }, 
    {
        "Concasser", 
        "z"
    }, 
    {
        "Party Table Kick Course", 
        "x"
    }, 
    {
        "Anti-Manner Kick Course", 
        "c"
    }, 
    {
        "Demon Step Transformation", 
        "n"
    }
};
local v230 = {
    {
        "Demon Step Transformation", 
        "n"
    }, 
    {
        "Demon Spectrum", 
        "e"
    }, 
    {
        "Demon Flash", 
        "r"
    }, 
    {
        "Demon Blitz", 
        "z"
    }, 
    {
        "Demon Axe Drop", 
        "x"
    }, 
    {
        "Demonic Sky Driller", 
        "c"
    }
};
v7.DemonStepTransformation = function(v231, _) --[[ Line: 863 ]] --[[ Name: DemonStepTransformation ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy), v230 (copy), v229 (copy)
    local l_Cooldowns_10 = v231.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_10 = l_LocalPlayer_0.Character;
    if l_Cooldowns_10.transform == false and _G.StamCheck("Demon Step Transformation") == true and _G.canuse == true and _G.check:inspect(l_Character_10) == true then
        local v236 = v2.GetM("Demon Step Transformation");
        local l_cd_10 = v236.cd;
        if v236.statreq and _G.MeetReq(v236.statreq) == false then
            return;
        else
            if l_Character_10:FindFirstChild("Diable") == nil then
                if l_Character_10:GetAttribute("blacklegDamage") == nil then
                    _G.displayMessage("<Color=Red>You dont have enough mode bar!");
                    return;
                elseif l_Character_10:GetAttribute("blacklegDamage") < require(game.ReplicatedStorage.Modules.Skills.Modes.BlackLeg)(l_LocalPlayer_0) / 4 then
                    _G.displayMessage("<Color=Red>You dont have enough mode bar!");
                    return;
                end;
            end;
            l_Cooldowns_10["Demon Step Transformation"] = true;
            _G.canuse = false;
            _G.keysetup:Destroy();
            game.ReplicatedStorage.Events.Skill:InvokeServer("Demon Step Transformation", {
                cf = l_Character_10.HumanoidRootPart.CFrame, 
                cf2 = l_Character_10.RightFoot.CFrame
            });
            if l_Character_10:FindFirstChild("Diable") ~= nil then
                v231.Tool.TextureId = "rbxassetid://6585762986";
                _G.keysetup:setup("BlackLegD", v230);
                task.spawn(function() --[[ Line: 894 ]]
                    -- upvalues: l_Character_10 (copy), v231 (copy), v229 (ref)
                    repeat
                        game["Run Service"].Heartbeat:Wait();
                    until l_Character_10:FindFirstChild("Diable") == nil;
                    _G.keysetup:Destroy();
                    v231.Tool.TextureId = "rbxassetid://4985358600";
                    _G.keysetup:setup("BlackLeg", v229);
                end);
            else
                v231.Tool.TextureId = "rbxassetid://4985358600";
                _G.keysetup:setup("BlackLeg", v229);
            end;
            _G.canuse = true;
            task.wait(l_cd_10);
            l_Cooldowns_10["Demon Step Transformation"] = false;
        end;
    end;
end;
return v7;