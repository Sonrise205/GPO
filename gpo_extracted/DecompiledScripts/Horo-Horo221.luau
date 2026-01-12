local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local v9 = setmetatable({}, v4);
v9.__index = v9;
v9.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v9 (copy), l_LocalPlayer_0 (copy)
    local v11 = setmetatable(v4.new(script.Name), v9);
    v11.Cooldowns = {
        negitive = false, 
        kami = false, 
        snap = false, 
        mini = false, 
        fly = false, 
        depressSnap = false
    };
    task.spawn(function() --[[ Line: 25 ]]
        -- upvalues: v11 (copy), l_LocalPlayer_0 (ref)
        v11.Tool = l_LocalPlayer_0.Character:WaitForChild("Horo-Horo") or l_LocalPlayer_0.Backpack:WaitForChild("Horo-Horo");
    end);
    v11.CurrentSwipe = 1;
    return v11;
end;
local v12 = {};
local function _(v13) --[[ Line: 36 ]] --[[ Name: stopAll ]]
    -- upvalues: v12 (ref)
    for v14, v15 in v12 do
        if v14 ~= v13 then
            v15:Stop();
        end;
    end;
end;
local function _(v17) --[[ Line: 45 ]] --[[ Name: playAnim ]]
    -- upvalues: v12 (ref)
    if v12[v17].IsPlaying == false then
        v12[v17].Priority = Enum.AnimationPriority.Movement;
        v12[v17]:Play();
    end;
    for v18, v19 in v12 do
        if v18 ~= v17 then
            v19:Stop();
        end;
    end;
end;
v9.NegativeHollow = function(v21, v22) --[[ Line: 53 ]] --[[ Name: NegativeHollow ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v21.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.negitive == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Negative Hollow") == true then
        local v26 = v3.GetM("Negative Hollow");
        local l_cd_0 = v26.cd;
        if _G.StamCheck("Negative Hollow") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Negative Hollow");
            if v28 == nil then
                return;
            else
                l_Cooldowns_0.negitive = true;
                local v29 = false;
                do
                    local l_v29_0 = v29;
                    v21:DoubleCastSkill(v22, {
                        ToolName = script.Name, 
                        Button = v22, 
                        Key = Enum.KeyCode.E, 
                        PassFunction = function() --[[ Line: 80 ]] --[[ Name: PassFunction ]]
                            -- upvalues: v21 (copy), l_Character_0 (copy)
                            local v31 = false;
                            if v21.Tool.Parent == l_Character_0 then
                                v31 = false;
                                if _G.canuse == true then
                                    v31 = _G.check:inspect(l_Character_0) == true;
                                end;
                            end;
                            return v31;
                        end, 
                        CompleteFunction = function() --[[ Line: 83 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: l_v29_0 (ref)
                            l_v29_0 = true;
                        end
                    });
                    repeat
                        game["Run Service"].Heartbeat:Wait();
                    until l_v29_0 == true or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters;
                    local v32 = l_Character_0.Humanoid:LoadAnimation(script.target);
                    v32:Play();
                    v32:AdjustWeight(2);
                    v32:AdjustSpeed(2);
                    if v28 then
                        task.wait(0.3);
                        v28:FireServer({
                            Target = _G.getTargetNearMouse() or v21:GetMouseCFrame(), 
                            cf = v21:GetMouseCFrame()
                        });
                    end;
                    _G.keysetup:cooldown("Negative Hollow", l_cd_0);
                    _G.fw(l_cd_0);
                    l_Cooldowns_0.negitive = false;
                end;
            end;
        end;
    end;
end;
v9.KamikazeHollow = function(v33, v34) --[[ Line: 107 ]] --[[ Name: KamikazeHollow ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v33.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v37 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.kami == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Kamikaze Hollow") == true then
        local v38 = v3.GetM("Kamikaze Hollow");
        local l_cd_1 = v38.cd;
        if _G.StamCheck("Kamikaze Hollow") == false then
            return;
        elseif v38.statreq and _G.MeetReq(v38.statreq) == false then
            return;
        else
            local v40 = game.ReplicatedStorage.Events.Skill:InvokeServer("Kamikaze Hollow");
            if v40 == nil then
                return;
            else
                l_Cooldowns_1.kami = true;
                local v41 = false;
                do
                    local l_v41_0 = v41;
                    v33:DoubleCastSkill(v34, {
                        ToolName = script.Name, 
                        Key = Enum.KeyCode.C, 
                        Button = v34, 
                        PassFunction = function() --[[ Line: 135 ]] --[[ Name: PassFunction ]]
                            -- upvalues: v33 (copy), l_Character_1 (copy)
                            local v43 = false;
                            if v33.Tool.Parent == l_Character_1 then
                                v43 = false;
                                if _G.canuse == true then
                                    v43 = _G.check:inspect(l_Character_1) == true;
                                end;
                            end;
                            return v43;
                        end, 
                        CompleteFunction = function() --[[ Line: 138 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: l_v41_0 (ref)
                            l_v41_0 = true;
                        end
                    });
                    repeat
                        game["Run Service"].Heartbeat:Wait();
                    until l_v41_0 == true or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v37.Stamina.Value <= 0;
                    local v44 = l_Character_1.Humanoid:LoadAnimation(script.throwKami);
                    v44:Play();
                    v44:AdjustWeight(2);
                    v44:AdjustSpeed(2);
                    if v40 then
                        task.wait(0.3);
                        v40:FireServer({
                            Target = _G.getTargetNearMouse(), 
                            cf = v33:GetMouseCFrame()
                        });
                    end;
                    _G.keysetup:cooldown("Kamikaze Hollow", l_cd_1);
                    _G.fw(l_cd_1);
                    l_Cooldowns_1.kami = false;
                end;
            end;
        end;
    end;
end;
v9.ExplosiveSnap = function(v45, _) --[[ Line: 160 ]] --[[ Name: ExplosiveSnap ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v45.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.snap == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Explosive Snap") == true then
        local v50 = v3.GetM("Explosive Snap");
        local l_cd_2 = v50.cd;
        if _G.StamCheck("Explosive Snap") == false then
            return;
        elseif v50.statreq and _G.MeetReq(v50.statreq) == false then
            return;
        else
            l_Cooldowns_2.snap = true;
            local v52 = l_Character_2.Humanoid:LoadAnimation(script.snap);
            v52:Play();
            v52:AdjustWeight(2);
            v52:AdjustSpeed(2);
            task.wait(0.3);
            task.spawn(function() --[[ Line: 182 ]]
                game.ReplicatedStorage.Events.Skill:InvokeServer("Explosive Snap");
            end);
            _G.keysetup:cooldown("Explosive Snap", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.snap = false;
        end;
    end;
end;
v9.MiniHollowBarrage = function(v53, v54) --[[ Line: 191 ]] --[[ Name: MiniHollowBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v53.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.mini == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Mini Hollow Barrage") == true then
        local v58 = v3.GetM("Mini Hollow Barrage");
        local l_cd_3 = v58.cd;
        if _G.StamCheck("Mini Hollow Barrage") == false then
            return;
        elseif v58.statreq and _G.MeetReq(v58.statreq) == false then
            return;
        else
            local v60 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mini Hollow Barrage");
            if v60 == nil then
                return;
            else
                l_Cooldowns_3.mini = true;
                local v61 = false;
                do
                    local l_v61_0 = v61;
                    v53:DoubleCastSkill(v54, {
                        ToolName = script.Name, 
                        Key = Enum.KeyCode.Z, 
                        Button = v54, 
                        PassFunction = function() --[[ Line: 218 ]] --[[ Name: PassFunction ]]
                            -- upvalues: v53 (copy), l_Character_3 (copy)
                            local v63 = false;
                            if v53.Tool.Parent == l_Character_3 then
                                v63 = false;
                                if _G.canuse == true then
                                    v63 = _G.check:inspect(l_Character_3) == true;
                                end;
                            end;
                            return v63;
                        end, 
                        CompleteFunction = function() --[[ Line: 221 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: l_v61_0 (ref)
                            l_v61_0 = true;
                        end
                    });
                    repeat
                        game["Run Service"].Heartbeat:Wait();
                    until l_v61_0 == true or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters;
                    if v60 then
                        local l_v60_Attribute_0 = v60:GetAttribute("TotalHollows");
                        v60:FireServer({
                            Target = _G.getTargetNearMouse(), 
                            cf = v53:GetMouseCFrame()
                        });
                        if l_v60_Attribute_0 then
                            task.wait(l_v60_Attribute_0 * 0.1);
                        end;
                    end;
                    _G.keysetup:cooldown("Mini Hollow Barrage", l_cd_3);
                    _G.fw(l_cd_3);
                    l_Cooldowns_3.mini = false;
                end;
            end;
        end;
    end;
end;
local function v66(v65) --[[ Line: 243 ]] --[[ Name: getLargestAxis ]]
    if math.abs(v65.X) > math.abs(v65.Y) and math.abs(v65.X) > math.abs(v65.Z) then
        return v65.X > 0 and "Right" or "Left", (math.abs(v65.X));
    elseif math.abs(v65.Z) > math.abs(v65.X) and math.abs(v65.Z) > math.abs(v65.Y) then
        return v65.Z > 0 and "Down" or "Up", (math.abs(v65.Z));
    else
        return "None", 0;
    end;
end;
v9.SoulUnbound = function(v67, v68) --[[ Line: 253 ]] --[[ Name: SoulUnbound ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v12 (ref), l_l_PlayerModule_0_Controls_0 (copy), v66 (copy)
    local l_Cooldowns_4 = v67.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_4.fly == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Soul Unbound") == true then
        local v72 = v3.GetM("Soul Unbound");
        local l_cd_4 = v72.cd;
        if _G.StamCheck("Soul Unbound") == false then
            return;
        elseif v72.statreq and _G.MeetReq(v72.statreq) == false then
            return;
        else
            l_Cooldowns_4.fly = true;
            local v74 = nil;
            local v75 = nil;
            local v76 = nil;
            local v77 = nil;
            local v78 = nil;
            local v79 = nil;
            local v80 = false;
            do
                local l_v74_0, l_v75_0, l_v76_0, l_v77_0, l_v78_0, l_v79_0, l_v80_0 = v74, v75, v76, v77, v78, v79, v80;
                pcall(function() --[[ Line: 276 ]]
                    -- upvalues: v12 (ref), l_Character_4 (copy), l_v78_0 (ref), l_v79_0 (ref), l_v74_0 (ref), l_v75_0 (ref), l_v80_0 (ref)
                    v12 = {
                        Idle = l_Character_4.Humanoid:LoadAnimation(script.Flight.idle), 
                        Front = l_Character_4.Humanoid:LoadAnimation(script.Flight.front), 
                        Back = l_Character_4.Humanoid:LoadAnimation(script.Flight.back), 
                        Left = l_Character_4.Humanoid:LoadAnimation(script.Flight.left), 
                        Right = l_Character_4.Humanoid:LoadAnimation(script.Flight.right)
                    };
                    l_Character_4.Humanoid:LoadAnimation(script.unboundSoul):Play();
                    l_v78_0 = script.DepthOfField:Clone();
                    l_v78_0.Parent = workspace.CurrentCamera;
                    l_v78_0.FarIntensity = 0;
                    l_v78_0.NearIntensity = 0;
                    l_v79_0 = script.ColorCorrection:Clone();
                    l_v79_0.Parent = workspace.CurrentCamera;
                    l_v79_0.Brightness = 0;
                    l_v79_0.Contrast = 0;
                    l_v79_0.TintColor = Color3.fromRGB(255, 255, 255);
                    l_v79_0.Saturation = 0;
                    _G.tween(l_v79_0, {
                        1, 
                        Enum.EasingStyle.Sine, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        Saturation = script.ColorCorrection.Saturation, 
                        TintColor = script.ColorCorrection.TintColor, 
                        Contrast = script.ColorCorrection.Contrast, 
                        Brightness = script.ColorCorrection.Brightness
                    });
                    _G.tween(l_v78_0, {
                        1, 
                        Enum.EasingStyle.Sine, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        FarIntensity = script.DepthOfField.FarIntensity, 
                        NearIntensity = script.DepthOfField.NearIntensity
                    });
                    local v88, v89 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Unbound", l_Character_4.HumanoidRootPart.CFrame, true));
                    l_v74_0 = v88;
                    l_v75_0 = v89;
                    l_v74_0.OnClientInvoke = function() --[[ Line: 296 ]]
                        -- upvalues: l_v80_0 (ref)
                        if l_v80_0 == true then
                            return;
                        else
                            l_v80_0 = true;
                            script.SoulInterrupt:Play();
                            return;
                        end;
                    end;
                    if v12.Idle.IsPlaying == false then
                        v12.Idle.Priority = Enum.AnimationPriority.Movement;
                        v12.Idle:Play();
                    end;
                    for v90, v91 in v12 do
                        if v90 ~= "Idle" then
                            v91:Stop();
                        end;
                    end;
                end);
                v67:DoubleCastSkill(v68, {
                    ToolName = script.Name, 
                    Key = Enum.KeyCode.T, 
                    Button = v68, 
                    SkipTap = true, 
                    CheckFunction = function() --[[ Line: 312 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_v80_0 (ref)
                        return l_v80_0 == true;
                    end, 
                    CompleteFunction = function() --[[ Line: 315 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: l_v80_0 (ref)
                        l_v80_0 = true;
                    end
                });
                if l_v75_0 ~= nil then
                    l_v76_0 = Instance.new("BodyVelocity", l_Character_4.HumanoidRootPart);
                    l_v76_0.Name = "geppo";
                    l_v76_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                    l_v76_0.Velocity = Vector3.new();
                    l_v77_0 = Instance.new("BodyGyro", l_Character_4.HumanoidRootPart);
                    l_v77_0.P = 100000;
                    l_v77_0.D = 2500;
                    l_v77_0.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                end;
                local v92 = 0;
                local v93 = tick();
                local l_Humanoid_0 = l_Character_4.Humanoid;
                local v95 = nil;
                v95 = l_Character_4.ChildAdded:Connect(function(v96) --[[ Line: 336 ]]
                    -- upvalues: v67 (copy), l_Humanoid_0 (copy)
                    if v96:IsA("Tool") and v96 ~= v67.Tool then
                        task.defer(function() --[[ Line: 339 ]]
                            -- upvalues: l_Humanoid_0 (ref)
                            l_Humanoid_0:UnequipTools();
                        end);
                    end;
                end);
                while true do
                    game["Run Service"].Heartbeat:Wait();
                    if l_v75_0 ~= nil and l_Character_4.HumanoidRootPart.Position.Y > workspace.Env.WaterStuff.Falls.Position.Y then
                        pcall(function() --[[ Line: 356 ]]
                            -- upvalues: l_l_PlayerModule_0_Controls_0 (ref), l_Character_4 (copy), l_v75_0 (ref), v92 (ref), v66 (ref), l_v76_0 (ref), l_v77_0 (ref), v12 (ref)
                            local l_l_l_PlayerModule_0_Controls_0_MoveVector_0 = l_l_PlayerModule_0_Controls_0:GetMoveVector();
                            local v98 = 0.05 * (60 / _G.FPS);
                            v92 = math.clamp(30 * (1 - (l_Character_4.HumanoidRootPart.Position - l_v75_0.PrimaryPart.Position).Magnitude / 200), 10, 30) * (l_Character_4.Humanoid.Health / l_Character_4.Humanoid.MaxHealth);
                            local v99 = Vector3.new();
                            local v100, _ = v66(l_l_l_PlayerModule_0_Controls_0_MoveVector_0);
                            if l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Magnitude > 0 then
                                local v102 = Vector3.new(0, 0, 0, 0);
                                if v100 == "Up" then
                                    v102 = workspace.CurrentCamera.CFrame.LookVector * v92;
                                    v102 = Vector3.new(v102.X, v102.Y * 2, v102.Z);
                                elseif v100 == "Down" then
                                    v102 = workspace.CurrentCamera.CFrame.LookVector * -v92;
                                    v102 = Vector3.new(v102.X, v102.Y * 2, v102.Z);
                                end;
                                v99 = v102 + Vector3.new(l_Character_4.Humanoid.MoveDirection.X, 0, l_Character_4.Humanoid.MoveDirection.Z) * v92;
                            else
                                v99 = Vector3.new();
                            end;
                            if _G.FaceMouse == true or l_Character_4:FindFirstChildWhichIsA("ObjectValue") or _G.canuse == false and script.Parent.Parent ~= l_Character_4 then
                                v99 = Vector3.new();
                            end;
                            l_v76_0.Velocity = l_v76_0.Velocity:Lerp(v99, v98);
                            if _G.FaceMouse == true then
                                l_v77_0.Parent = nil;
                                l_v77_0.MaxTorque = Vector3.new(0, 0, 0, 0);
                                return;
                            else
                                if v100 == "Down" then
                                    if v12.Back.IsPlaying == false then
                                        v12.Back.Priority = Enum.AnimationPriority.Movement;
                                        v12.Back:Play();
                                    end;
                                    for v103, v104 in v12 do
                                        if v103 ~= "Back" then
                                            v104:Stop();
                                        end;
                                    end;
                                elseif v100 == "Left" then
                                    if v12.Left.IsPlaying == false then
                                        v12.Left.Priority = Enum.AnimationPriority.Movement;
                                        v12.Left:Play();
                                    end;
                                    for v105, v106 in v12 do
                                        if v105 ~= "Left" then
                                            v106:Stop();
                                        end;
                                    end;
                                elseif v100 == "Right" then
                                    if v12.Right.IsPlaying == false then
                                        v12.Right.Priority = Enum.AnimationPriority.Movement;
                                        v12.Right:Play();
                                    end;
                                    for v107, v108 in v12 do
                                        if v107 ~= "Right" then
                                            v108:Stop();
                                        end;
                                    end;
                                elseif v100 == "Up" then
                                    if v12.Front.IsPlaying == false then
                                        v12.Front.Priority = Enum.AnimationPriority.Movement;
                                        v12.Front:Play();
                                    end;
                                    for v109, v110 in v12 do
                                        if v109 ~= "Front" then
                                            v110:Stop();
                                        end;
                                    end;
                                else
                                    if v12.Idle.IsPlaying == false then
                                        v12.Idle.Priority = Enum.AnimationPriority.Movement;
                                        v12.Idle:Play();
                                    end;
                                    for v111, v112 in v12 do
                                        if v111 ~= "Idle" then
                                            v112:Stop();
                                        end;
                                    end;
                                end;
                                l_v77_0.Parent = l_Character_4.HumanoidRootPart;
                                l_v77_0.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                                l_v77_0.CFrame = CFrame.new(l_Character_4.HumanoidRootPart.Position, workspace.CurrentCamera.CFrame * CFrame.new(0, 0, 1000).p) * CFrame.Angles(0, 3.141592653589793, 0);
                                return;
                            end;
                        end);
                        local l_Tool_0 = l_Character_4:FindFirstChildWhichIsA("Tool");
                        if l_Tool_0 and l_Tool_0.Name ~= script.Name then
                            task.defer(function() --[[ Line: 409 ]]
                                -- upvalues: l_Character_4 (copy)
                                l_Character_4.Humanoid:UnequipTools();
                            end);
                        end;
                        l_Character_4.Humanoid.PlatformStand = true;
                        if l_v80_0 == true or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or tick() - v93 >= 15 then
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                v95:Disconnect();
                v95 = nil;
                l_Character_4.Humanoid.PlatformStand = false;
                local v114 = Instance.new("ObjectValue", l_Character_4);
                _G.canuse = false;
                for v115, v116 in v12 do
                    if v115 ~= nil then
                        v116:Stop();
                    end;
                end;
                if l_v74_0 then
                    l_v76_0:Destroy();
                    l_v77_0:Destroy();
                    local v117 = {
                        Target = _G.MouseTarget, 
                        cf = v67:GetMouseCFrame()
                    };
                    l_v74_0:InvokeServer(v117);
                end;
                _G.tween(l_v79_0, {
                    0.7, 
                    Enum.EasingStyle.Sine, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Saturation = 0, 
                    TintColor = Color3.fromRGB(255, 255, 255), 
                    Brightness = 0, 
                    Contrast = 0
                });
                _G.tween(l_v78_0, {
                    0.7, 
                    Enum.EasingStyle.Sine, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    FarIntensity = 0, 
                    NearIntensity = 0
                });
                _G.destroy(l_v79_0, 0.7);
                _G.destroy(l_v78_0, 0.7);
                task.wait(1);
                v114:Destroy();
                _G.canuse = true;
                _G.keysetup:cooldown("Soul Unbound", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.fly = false;
            end;
        end;
    end;
end;
v9["ExplosiveSnap:Twirl"] = function(v118, _) --[[ Line: 448 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v118.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.depressSnap == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Explosive Snap: Twirl") == true then
        local v123 = v3.GetM("Explosive Snap: Twirl");
        local l_cd_5 = v123.cd;
        if _G.StamCheck("Explosive Snap: Twirl") == false then
            return;
        elseif v123.statreq and _G.MeetReq(v123.statreq) == false then
            return;
        else
            l_Cooldowns_5.depressSnap = true;
            local v125 = l_Character_5.Humanoid:LoadAnimation(script.snap2);
            v125:Play();
            v125:AdjustWeight(2);
            v125.Priority = Enum.AnimationPriority.Action4;
            _G.canuse = false;
            l_Character_5.Humanoid.WalkSpeed = 4;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Explosive Snap: Twirl", l_Character_5.HumanoidRootPart.CFrame);
            _G.canuse = true;
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Explosive Snap: Twirl", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.depressSnap = false;
        end;
    end;
end;
return v9;