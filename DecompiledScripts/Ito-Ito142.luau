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
    -- upvalues: v4 (copy), v7 (copy), l_LocalPlayer_0 (copy)
    local v9 = setmetatable(v4.new(script.Name), v7);
    v9.Cooldowns = {
        cage = false, 
        penta = false, 
        bullet = false, 
        overheat = false, 
        parasite = false, 
        stringTravel = false
    };
    v9.CurrentSwipe = 1;
    local l_Character_0 = l_LocalPlayer_0.Character;
    v9.rope = nil;
    v9.endPoint = nil;
    v9.bodyForce = nil;
    v9.oldPos = nil;
    v9.vel = nil;
    v9.swingSide = nil;
    v9.alreadySwinging = false;
    v9.inSwingStartup = false;
    v9.inCombatSwings = 0;
    v9.anims = {};
    for _, v12 in (script.Swing:GetDescendants()) do
        if v12:IsA("Animation") then
            v9.anims[v12.Name] = l_Character_0:WaitForChild("Humanoid"):LoadAnimation(v12);
        end;
    end;
    v9.attach1 = Instance.new("Attachment", l_Character_0.HumanoidRootPart);
    v9.cleanupWebSwing = function() --[[ Line: 48 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v9 (copy), l_Character_0 (copy)
        _G.PlayEffect("Webswing", nil, "clean", l_LocalPlayer_0.Name);
        if v9.rope then
            v9.rope:Destroy();
            v9.rope = nil;
        end;
        if v9.endPoint then
            v9.endPoint:Destroy();
            v9.endPoint = nil;
        end;
        if l_Character_0.HumanoidRootPart:FindFirstChild("SwingGyro") then
            l_Character_0.HumanoidRootPart:FindFirstChild("SwingGyro"):Destroy();
        end;
    end;
    local function _(v13, v14, v15) --[[ Line: 63 ]] --[[ Name: Lerp ]]
        return v13 + (v14 - v13) * v15;
    end;
    v9.RenderStepped = game:GetService("RunService").RenderStepped:Connect(function(v17) --[[ Line: 67 ]]
        -- upvalues: v9 (copy), l_LocalPlayer_0 (ref), l_Character_0 (copy)
        if v9.rope and v9.endPoint then
            local _ = l_LocalPlayer_0:DistanceFromCharacter(v9.endPoint.WorldPosition);
            local v19 = l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth;
            if v19 < 0.8 then
                v19 = v19 * 0.5;
            end;
            local l_rope_0 = v9.rope;
            local l_Length_0 = v9.rope.Length;
            l_rope_0.Length = l_Length_0 + (math.clamp(l_LocalPlayer_0:DistanceFromCharacter(v9.endPoint.WorldPosition) - v17 * 30, 10, 10000) - l_Length_0) * v19;
            l_rope_0 = l_Character_0.HumanoidRootPart.Position;
            v9.vel = (l_rope_0 - v9.oldPos) / v17;
            v9.oldPos = v9.oldPos:Lerp(l_rope_0, v19);
        end;
        if l_Character_0.HumanoidRootPart:FindFirstChild("SwingGyro") and v9.endPoint ~= nil then
            l_Character_0.HumanoidRootPart.SwingGyro.CFrame = l_Character_0.HumanoidRootPart.SwingGyro.CFrame:Lerp(CFrame.new(l_Character_0.HumanoidRootPart.Position, v9.endPoint.WorldPosition), 0.1);
        end;
    end);
    return v9;
end;
v7.Birdcage = function(v22, _) --[[ Line: 87 ]] --[[ Name: Birdcage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v22.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.cage == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Birdcage") == true then
        local v27 = v3.GetM("Birdcage");
        local l_cd_0 = v27.cd;
        if _G.StamCheck("Birdcage") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            l_Cooldowns_0.cage = true;
            local v29 = l_Character_1.Humanoid:LoadAnimation(script.cage);
            v29:Play();
            v29:AdjustWeight(2);
            v29:AdjustSpeed(1);
            _G.canuse = false;
            task.wait(0.25);
            local l_v22_MouseCFrame_0 = v22:GetMouseCFrame();
            local v31 = Ray.new(l_v22_MouseCFrame_0.p + Vector3.new(0, 10, 0, 0), l_v22_MouseCFrame_0.upVector * -25);
            local _, v33, _ = _G.raycastWhitelist(v31, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            game.ReplicatedStorage.Events.Skill:InvokeServer("Birdcage", v33);
            _G.canuse = true;
            _G.keysetup:cooldown("Birdcage", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.cage = false;
        end;
    end;
end;
v7.PentachromaticStrings = function(v35, v36) --[[ Line: 121 ]] --[[ Name: PentachromaticStrings ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v35.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v39 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.penta == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Pentachromatic Strings") == true then
        local v40 = v3.GetM("Pentachromatic Strings");
        local l_cd_1 = v40.cd;
        if _G.StamCheck("Pentachromatic Strings") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_1.penta = true;
            local v42 = l_Character_2.Humanoid:LoadAnimation(script.penta);
            v42:Play();
            v42:AdjustWeight(2);
            v42:AdjustSpeed(1);
            l_Character_2.Humanoid.WalkSpeed = 4;
            _G.canuse = false;
            local v43 = game.ReplicatedStorage.Events.Skill:InvokeServer("Pentachromatic Strings");
            _G.PauseAnim(v42, 0.3, 1);
            local v44 = tick();
            v35:ChargeSkill(v36, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 148 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 153 ]] --[[ Name: endFunction ]]
                    -- upvalues: v44 (copy), v35 (copy), l_Character_2 (copy), v39 (copy)
                    if tick() - v44 >= 10 or v35.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v39.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v42:AdjustSpeed(1);
            l_Character_2.Humanoid.AutoRotate = false;
            local l_CFrame_0 = l_Character_2.HumanoidRootPart.CFrame;
            local _, v47 = _G.raycast:cast(l_Character_2.HumanoidRootPart.CFrame.p, l_Character_2.PrimaryPart.CFrame.lookVector * 15, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local l_magnitude_0 = (l_CFrame_0.p - v47).magnitude;
            if v43 then
                v43:FireServer(l_Character_2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -l_magnitude_0), l_Character_2.PrimaryPart.CFrame);
                _G.tween(l_Character_2.HumanoidRootPart, {
                    0.2, 
                    "Quad", 
                    Enum.EasingDirection.Out
                }, {
                    CFrame = l_Character_2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -l_magnitude_0)
                });
            end;
            task.wait(0.4);
            l_Character_2.Humanoid.WalkSpeed = 16;
            l_Character_2.Humanoid.AutoRotate = true;
            _G.keysetup:cooldown("Pentachromatic Strings", l_cd_1);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.penta = false;
        end;
    end;
end;
v7.StringBullet = function(v49, v50) --[[ Line: 184 ]] --[[ Name: StringBullet ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v49.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v53 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.bullet == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("String Bullet") == true then
        local v54 = v3.GetM("String Bullet");
        local l_cd_2 = v54.cd;
        if _G.StamCheck("String Bullet") == false then
            return;
        elseif v54.statreq and _G.MeetReq(v54.statreq) == false then
            return;
        else
            l_Cooldowns_2.bullet = true;
            local v56 = l_Character_3.Humanoid:LoadAnimation(script.bullet);
            v56:Play();
            v56:AdjustWeight(2);
            v56:AdjustSpeed(1);
            _G.FaceMouse = true;
            _G.canuse = false;
            local v57 = game.ReplicatedStorage.Events.Skill:InvokeServer("String Bullet");
            _G.PauseAnim(v56, 0.2, 1);
            local v58 = tick();
            v49:ChargeSkill(v50, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 212 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 216 ]] --[[ Name: endFunction ]]
                    -- upvalues: v58 (copy), v49 (copy), l_Character_3 (copy), v53 (copy)
                    if tick() - v58 >= 10 or v49.Tool.Parent ~= l_Character_3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v53.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v56:AdjustSpeed(1);
            l_Character_3.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            task.wait(0.2);
            if v57 then
                v57:FireServer(l_Character_3.PrimaryPart.CFrame);
            end;
            task.wait(0.3);
            l_Character_3.HumanoidRootPart.Anchored = false;
            l_Character_3.Humanoid.AutoRotate = true;
            _G.keysetup:cooldown("String Bullet", l_cd_2);
            _G.canuse = true;
            _G.fw(l_cd_2);
            l_Cooldowns_2.bullet = false;
        end;
    end;
end;
v7.OverheatedWhip = function(v59, v60) --[[ Line: 246 ]] --[[ Name: OverheatedWhip ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v59.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v63 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.overheat == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Overheated Whip") == true then
        local v64 = v3.GetM("Overheated Whip");
        local l_cd_3 = v64.cd;
        if _G.StamCheck("Overheated Whip") == false then
            return;
        elseif v64.statreq and _G.MeetReq(v64.statreq) == false then
            return;
        else
            l_Cooldowns_3.overheat = true;
            local v66 = l_Character_4.Humanoid:LoadAnimation(script.overheat);
            v66:Play();
            v66:AdjustWeight(2);
            v66:AdjustSpeed(1);
            _G.FaceMouse = true;
            _G.canuse = false;
            local v67 = game.ReplicatedStorage.Events.Skill:InvokeServer("Overheated Whip");
            _G.PauseAnim(v66, 0.4, 1);
            local v68 = tick();
            v59:ChargeSkill(v60, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 273 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 277 ]] --[[ Name: endFunction ]]
                    -- upvalues: v68 (copy), v59 (copy), l_Character_4 (copy), v63 (copy)
                    if tick() - v68 >= 10 or v59.Tool.Parent ~= l_Character_4 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v63.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v66:AdjustSpeed(2);
            l_Character_4.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            task.wait(0.2);
            if v67 then
                v67:FireServer(v59:GetMouseCFrame());
            end;
            task.wait(0.6);
            l_Character_4.HumanoidRootPart.Anchored = false;
            _G.FaceMouse = false;
            l_Character_4.Humanoid.AutoRotate = true;
            _G.keysetup:cooldown("Overheated Whip", l_cd_3);
            _G.canuse = true;
            _G.fw(l_cd_3);
            l_Cooldowns_3.overheat = false;
        end;
    end;
end;
v7.ParasiticStrings = function(v69, v70) --[[ Line: 308 ]] --[[ Name: ParasiticStrings ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v69.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v73 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_4.parasite == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Parasitic Strings") == true then
        local v74 = v3.GetM("Parasitic Strings");
        local l_cd_4 = v74.cd;
        if _G.StamCheck("Parasitic Strings") == false then
            return;
        elseif v74.statreq and _G.MeetReq(v74.statreq) == false then
            return;
        else
            l_Cooldowns_4.parasite = true;
            local v76 = l_Character_5.Humanoid:LoadAnimation(script.parasite);
            v76:Play();
            v76:AdjustWeight(2);
            v76:AdjustSpeed(1);
            _G.FaceMouse = true;
            _G.canuse = false;
            _G.PauseAnim(v76, 0.3, 1);
            local v77 = tick();
            v69:ChargeSkill(v70, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 335 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 339 ]] --[[ Name: endFunction ]]
                    -- upvalues: v77 (copy), v69 (copy), l_Character_5 (copy), v73 (copy)
                    if tick() - v77 >= 10 or v69.Tool.Parent ~= l_Character_5 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v73.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v76:AdjustSpeed(2);
            l_Character_5.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Parasitic Strings", v69:GetMouseCFrame());
            task.wait(0.6);
            l_Character_5.HumanoidRootPart.Anchored = false;
            l_Character_5.Humanoid.AutoRotate = true;
            _G.keysetup:cooldown("Parasitic Strings", l_cd_4);
            _G.canuse = true;
            _G.fw(l_cd_4);
            l_Cooldowns_4.parasite = false;
        end;
    end;
end;
local function _(v78) --[[ Line: 366 ]] --[[ Name: WorldToScreenPoint ]]
    local v79 = game.Workspace.CurrentCamera:WorldToViewportPoint(v78);
    return (Vector2.new(v79.X, v79.Y));
end;
local v81 = RaycastParams.new();
v81.FilterType = Enum.RaycastFilterType.Include;
v81.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
v7.SkyStrings = function(v82, v83) --[[ Line: 383 ]] --[[ Name: SkyStrings ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v81 (copy), l_LocalPlayer_0 (copy)
    local l_Cooldowns_5 = v82.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v86 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.stringTravel == false and _G.check:inspect(l_Character_6) == true and _G.grounded == false and _G.canuse == true then
        local v87 = v3.GetM("Sky Strings");
        local l_cd_5 = v87.cd;
        if l_Character_6:findFirstChild("inCombat") then
            if _G.StamCheck("Sky Strings", nil, v86.Stamina.MaxValue * 0.05) == false then
                return;
            end;
        elseif _G.StamCheck("Sky Strings", nil, 15) == false then
            return;
        end;
        if v87.statreq and _G.MeetReq(v87.statreq) == false then
            return;
        elseif game.ReplicatedStorage:FindFirstChild("tradingHUB") then
            return;
        else
            l_Cooldowns_5.stringTravel = true;
            if v82.inSwingStartup then
                return;
            elseif v82.alreadySwinging then
                return;
            else
                v82.cleanupWebSwing();
                v82.alreadySwinging = true;
                v82.inSwingStartup = true;
                local v89 = l_Character_6.Humanoid.Health / l_Character_6.Humanoid.MaxHealth;
                local _, v97 = (function(v90, v91) --[[ Line: 418 ]] --[[ Name: getMouseHit ]]
                    -- upvalues: v82 (copy)
                    v91 = v91 or 500;
                    local l_Position_0 = v82:GetMouseCFrame().Position;
                    local v93 = game.Workspace.CurrentCamera:WorldToViewportPoint(l_Position_0);
                    local v94 = Vector2.new(v93.X, v93.Y);
                    l_Position_0 = workspace.CurrentCamera:ViewportPointToRay(v94.X, v94.Y);
                    local v95 = Ray.new(l_Position_0.Origin, l_Position_0.Direction * v91);
                    return _G.raycastIgnoreList(v95, v90);
                end)({
                    workspace.Effects, 
                    l_Character_6
                }, 200);
                local l_Magnitude_0 = (l_Character_6.HumanoidRootPart.Position - v97).Magnitude;
                local v99 = l_Magnitude_0 / 300;
                if l_Character_6.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(v97)).X > 0 then
                    v82.swingSide = "Right";
                else
                    v82.swingSide = "Left";
                end;
                l_Character_6.Humanoid.AutoRotate = false;
                local l_BodyGyro_0 = Instance.new("BodyGyro");
                l_BodyGyro_0.Name = "SwingGyro";
                l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000272564224E16, 1.0000000272564224E16, 1.0000000272564224E16, 0);
                l_BodyGyro_0.P = 100000;
                l_BodyGyro_0.D = 1000;
                l_BodyGyro_0.Parent = l_Character_6.HumanoidRootPart;
                v82.endPoint = Instance.new("Attachment");
                v82.endPoint.Parent = workspace.Terrain;
                v82.endPoint.WorldPosition = v97;
                if workspace:Raycast(l_Character_6.HumanoidRootPart.Position, Vector3.new(0, -10, 0, 0), v81) then
                    v82.anims[v82.swingSide .. " Ground Activate"]:Play();
                else
                    v82.anims[v82.swingSide .. " Swing Activate"]:Play();
                end;
                _G.canuse = false;
                local v101 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sky Strings", {
                    l_Magnitude_0, 
                    v97, 
                    v82.swingSide
                });
                if v101 then
                    _G.PlayEffect("Webswing", nil, l_Character_6, v99, v97, v82.swingSide);
                    task.wait(v99);
                    l_Character_6.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown);
                    v82.anims[v82.swingSide .. " Swing Loop"]:Play();
                    v82.inSwingStartup = false;
                    v82.rope = script.Rope:Clone();
                    v82.rope.Length = l_LocalPlayer_0:DistanceFromCharacter(v82.endPoint.WorldPosition);
                    v82.rope.Parent = workspace.Effects;
                    v82.rope.Attachment0 = v82.attach1;
                    v82.rope.Attachment1 = v82.endPoint;
                    v82.bodyForce = Instance.new("BodyForce");
                    v82.bodyForce.Name = "geppo";
                    v82.bodyForce.Parent = l_Character_6.HumanoidRootPart;
                    v82.bodyForce.Force = (CFrame.new(l_Character_6.HumanoidRootPart.Position, v82.endPoint.Position).LookVector + l_Character_6.Humanoid.MoveDirection * 0.25) * 10000 + Vector3.new(0, 400, 0, 0);
                    v82.bodyForce.Force = v82.bodyForce.Force * 0;
                    _G.tween(v82.bodyForce, {
                        0.2 * v89, 
                        "Quad", 
                        Enum.EasingDirection.Out
                    }, {
                        Force = Vector3.new(0, 0, 0, 0)
                    });
                    v82.oldPos = l_Character_6.HumanoidRootPart.Position;
                end;
                local v102 = tick();
                v82:ChargeSkill(v83, {
                    Key = Enum.KeyCode.T, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 493 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_6 (copy), v102 (copy), v82 (copy), v86 (copy)
                        _G.canuse = false;
                        l_Character_6.Humanoid.PlatformStand = true;
                        l_Character_6.Humanoid.AutoRotate = false;
                        if tick() - v102 >= 5 or v82.Tool.Parent ~= l_Character_6 or _G.check:inspect(l_Character_6) == false or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v86.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                if tick() - v102 < 0.2 then
                    repeat
                        task.wait();
                    until tick() - v102 >= 0.2;
                end;
                v82.cleanupWebSwing();
                v82.alreadySwinging = false;
                if v101 then
                    v101:FireServer();
                end;
                if v82.bodyForce and v82.vel ~= nil then
                    v82.vel = Vector3.new(math.clamp(v82.vel.X, -100, 100), math.clamp(v82.vel.Y, -100, 100), (math.clamp(v82.vel.Z, -100, 100))) * v89;
                    v82.bodyForce.Force = v82.vel * 300 + Vector3.new(0, 400, 0, 0);
                    local v103 = 0.1 * v89;
                    _G.tween(v82.bodyForce, {
                        v103, 
                        "Quad", 
                        Enum.EasingDirection.Out
                    }, {
                        Force = Vector3.new(0, 0, 0, 0)
                    });
                    _G.destroy(v82.bodyForce, v103);
                end;
                if v82.swingSide then
                    v82.anims[v82.swingSide .. " Swing Loop"]:Stop();
                    if l_Character_6.PrimaryPart.Velocity.Magnitude >= 150 then
                        v82.anims[v82.swingSide .. " Flip"]:Play();
                        _G.PlaySound(l_Character_6.PrimaryPart, script["SwingWhoosh" .. math.random(1, 2)]).Parent = l_Character_6.PrimaryPart;
                    elseif workspace:Raycast(l_Character_6.HumanoidRootPart.Position, Vector3.new(0, -10, 0, 0), v81) == nil then
                        v82.anims[v82.swingSide .. " Swing End"]:Play();
                    end;
                    v82.swingSide = nil;
                end;
                l_Character_6.Humanoid.AutoRotate = true;
                l_Character_6.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall);
                l_Character_6.Humanoid.PlatformStand = false;
                if l_Character_6:FindFirstChild("inCombat") then
                    v82.inCombatSwings = v82.inCombatSwings + 1;
                    if v82.inCombatSwings >= 2 then
                        v82.inCombatSwings = 0;
                        l_cd_5 = 15;
                    end;
                else
                    v82.inCombatSwings = 0;
                end;
                _G.keysetup:cooldown("Sky Strings", l_cd_5);
                _G.canuse = true;
                _G.fw(l_cd_5);
                l_Cooldowns_5.stringTravel = false;
            end;
        end;
    end;
end;
return v7;