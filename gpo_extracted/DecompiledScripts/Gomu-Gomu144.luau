local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
local v9 = {
    {
        "Block", 
        "f"
    }, 
    {
        "Gomu-Gomu no Pistol", 
        "e"
    }, 
    {
        "Gomu-Gomu no Balloon", 
        "r"
    }, 
    {
        "Gomu-Gomu no Rocket", 
        "t"
    }, 
    {
        "Gomu-Gomu no Bazooka", 
        "z"
    }, 
    {
        "Gomu-Gomu no Gatling", 
        "x"
    }, 
    {
        "Gomu-Gomu no Rifle", 
        "c"
    }, 
    {
        "Gear 2 Transformation", 
        "Y"
    }
};
local v10 = {
    {
        "Block", 
        "f"
    }, 
    {
        "Jet Pistol", 
        "e"
    }, 
    {
        "Jet Stomp", 
        "r"
    }, 
    {
        "Jet Rocket", 
        "t"
    }, 
    {
        "Red Hawk", 
        "z"
    }, 
    {
        "Jet Gatling", 
        "x"
    }, 
    {
        "Elephant Gun", 
        "c"
    }, 
    {
        "Gear 2 Transformation", 
        "Y"
    }
};
local function v18(v11) --[[ Line: 22 ]] --[[ Name: getTargetCharacter ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v11 == nil then
        return nil;
    else
        local v12 = nil;
        local l_Players_0 = game.Players:GetPlayers();
        for v14 = 1, #l_Players_0 do
            if v11:IsDescendantOf(l_Players_0[v14].Character) and l_Players_0[v14] ~= l_LocalPlayer_0 then
                local v15 = true;
                if l_Players_0[v14]:FindFirstChild("Party") and l_Players_0[v14].Party.Value ~= nil and l_LocalPlayer_0.Party.Value == l_Players_0[v14].Party.Value then
                    v15 = false;
                end;
                if v15 == true then
                    v12 = l_Players_0[v14].Character;
                    break;
                else
                    break;
                end;
            end;
        end;
        if v12 == nil then
            local l_Children_0 = workspace.NPCs:GetChildren();
            for v17 = 1, #l_Children_0 do
                if v11:IsDescendantOf(l_Children_0[v17]) and l_Children_0[v17]:FindFirstChild("Info") and l_Children_0[v17].Info:FindFirstChild("SeaNPC") == nil then
                    return l_Children_0[v17];
                end;
            end;
        end;
        return v12;
    end;
end;
v8.new = function(_) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy)
    local v20 = setmetatable(v4.new(script.Name), v8);
    v20.Cooldowns = {
        pistol = false, 
        galt = false, 
        bazooka = false, 
        rocket = false, 
        balloon = false, 
        rifle = false, 
        gear2 = false, 
        ult = false, 
        jetgalt = false, 
        jetpistol = false, 
        missile = false, 
        stamp = false, 
        hawk = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    v20.Anims = {
        idle = l_Character_0.Humanoid:LoadAnimation(script.Gear2Anims.g2Idle), 
        walk = l_Character_0.Humanoid:LoadAnimation(script.Gear2Anims.walk)
    };
    v20.Anims.idle.Priority = Enum.AnimationPriority.Action;
    v20.Anims.idle:AdjustWeight(5);
    v20.Anims.walk.Priority = Enum.AnimationPriority.Action;
    return v20;
end;
v8["Gomu-GomunoPistol"] = function(v22, v23) --[[ Line: 70 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v18 (copy)
    local l_Cooldowns_0 = v22.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v26 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.pistol == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Gomu-Gomu no Pistol") == true then
        local v27 = v3.GetM("Gomu-Gomu no Pistol");
        local l_cd_0 = v27.cd;
        if _G.StamCheck("Gomu-Gomu no Pistol") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            l_Cooldowns_0.pistol = true;
            _G.canuse = false;
            local v29 = l_Character_1.Humanoid:LoadAnimation(script.pistol);
            v29:Play();
            v29:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v29, 0.4, 1.5);
            local v30 = tick();
            v22:ChargeSkill(v23, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 97 ]] --[[ Name: endFunction ]]
                    -- upvalues: v30 (copy), v22 (copy), l_Character_1 (copy), v26 (copy)
                    if tick() - v30 >= 10 or v22.on == false or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v26.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            v29:AdjustSpeed(1);
            local l_v22_MouseCFrame_0 = v22:GetMouseCFrame();
            local v32 = v18(_G.MouseTarget);
            if v32 then
                l_Character_1.HumanoidRootPart.CFrame = CFrame.new(l_Character_1.HumanoidRootPart.Position, v32.HumanoidRootPart.Position);
            else
                l_Character_1.HumanoidRootPart.CFrame = CFrame.new(l_Character_1.HumanoidRootPart.Position, l_v22_MouseCFrame_0.Position);
            end;
            task.wait(0.15);
            l_Character_1.Humanoid.AutoRotate = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Gomu-Gomu no Pistol", {
                targetCF = l_v22_MouseCFrame_0, 
                cf = l_Character_1.HumanoidRootPart.CFrame, 
                target = v32, 
                armCF = l_Character_1.RightLowerArm.CFrame, 
                handCF = l_Character_1.RightLowerArm.CFrame * CFrame.Angles(-1.562069680534925, 0, 0.4363323129985824)
            });
            v29:AdjustSpeed(1);
            task.wait(1);
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Gomu-Gomu no Pistol", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.pistol = false;
        end;
    end;
end;
v8["Gomu-GomunoGatling"] = function(v33, v34) --[[ Line: 137 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v33.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v37 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.galt == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Gomu-Gomu no Gatling") == true then
        local v38 = v3.GetM("Gomu-Gomu no Gatling");
        local l_cd_1 = v38.cd;
        if _G.StamCheck("Gomu-Gomu no Gatling") == false then
            return;
        elseif v38.statreq and _G.MeetReq(v38.statreq) == false then
            return;
        else
            l_Cooldowns_1.galt = true;
            _G.canuse = false;
            local v40 = l_Character_2.Humanoid:LoadAnimation(script.galtstart);
            v40:Play();
            v40:AdjustWeight(2);
            _G.PauseAnim(v40, 0.6, 1);
            v40:Stop();
            local v41 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gomu-Gomu no Gatling", {
                cf = l_Character_2.HumanoidRootPart.CFrame
            });
            local v42 = l_Character_2.Humanoid:LoadAnimation(script.galtloop);
            v42:Play();
            v42:AdjustWeight(2);
            local v43 = tick();
            v33:ChargeSkill(v34, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 167 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 171 ]] --[[ Name: endFunction ]]
                    -- upvalues: v41 (copy), v43 (copy), v33 (copy), l_Character_2 (copy), v37 (copy)
                    if v41 == nil or tick() - v43 >= 5 or v33.on == false or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v37.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v42:Stop();
            l_Character_2.Humanoid:LoadAnimation(script.galtend):Play();
            if v41 then
                v41:FireServer();
            end;
            task.wait(0.5);
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Gomu-Gomu no Gatling", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.galt = false;
        end;
    end;
end;
v8["Gomu-GomunoBazooka"] = function(v44, v45) --[[ Line: 202 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v44.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v48 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.bazooka == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Gomu-Gomu no Bazooka") == true then
        local v49 = v3.GetM("Gomu-Gomu no Bazooka");
        local l_cd_2 = v49.cd;
        if _G.StamCheck("Gomu-Gomu no Bazooka") == false then
            return;
        elseif v49.statreq and _G.MeetReq(v49.statreq) == false then
            return;
        else
            l_Cooldowns_2.bazooka = true;
            _G.canuse = false;
            local v51 = l_Character_3.Humanoid:LoadAnimation(script.bazooka);
            v51:Play();
            v51:AdjustWeight(2);
            _G.FaceMouse = true;
            local v52 = nil;
            do
                local l_v52_0 = v52;
                task.spawn(function() --[[ Line: 225 ]]
                    -- upvalues: l_v52_0 (ref), l_Character_3 (copy)
                    task.wait(0.2);
                    l_v52_0 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gomu-Gomu no Bazooka", {
                        cf = l_Character_3.HumanoidRootPart.CFrame
                    });
                end);
                local _ = tick();
                _G.PauseAnim(v51, 0.67, 1.25);
                local v55 = tick();
                local function v56() --[[ Line: 237 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                end;
                local function v57() --[[ Line: 241 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_v52_0 (ref), v55 (copy), v44 (copy), l_Character_3 (copy), v48 (copy)
                    if l_v52_0 == nil or tick() - v55 >= 5 or v44.on == false or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v48.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                v44:ChargeSkill(v45, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = v56, 
                    EndFunction = v57
                });
                v51:AdjustSpeed(1.5);
                _G.FaceMouse = false;
                l_Character_3.HumanoidRootPart.Anchored = true;
                task.wait(0.2);
                l_Character_3.Humanoid.AutoRotate = false;
                if l_v52_0 then
                    local l_CFrame_0 = l_Character_3.HumanoidRootPart.CFrame;
                    l_v52_0:FireServer(l_CFrame_0);
                end;
                task.wait(1);
                l_Character_3.Humanoid.AutoRotate = true;
                l_Character_3.Humanoid.WalkSpeed = 16;
                l_Character_3.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Gomu-Gomu no Bazooka", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.bazooka = false;
            end;
        end;
    end;
end;
v8["Gomu-GomunoRocket"] = function(v59, v60) --[[ Line: 275 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v59.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v63 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_3.rocket == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Gomu-Gomu no Rocket") == true then
        local v64 = v3.GetM("Gomu-Gomu no Rocket");
        local l_cd_3 = v64.cd;
        if _G.StamCheck("Gomu-Gomu no Rocket") == false then
            return;
        elseif v64.statreq and _G.MeetReq(v64.statreq) == false then
            return;
        else
            l_Cooldowns_3.rocket = true;
            _G.canuse = false;
            local v66 = l_Character_4.Humanoid:LoadAnimation(script.rocket);
            v66:Play();
            v66:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v66, 0.35, 1);
            local v67 = tick();
            v59:ChargeSkill(v60, {
                Key = Enum.KeyCode.T, 
                CheckFunction = function() --[[ Line: 304 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_4 (copy)
                    l_Character_4.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 308 ]] --[[ Name: endFunction ]]
                    -- upvalues: v67 (copy), v59 (copy), l_Character_4 (copy), v63 (copy)
                    if tick() - v67 >= 9 or v59.on == false or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v63.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v66:AdjustSpeed(1);
            _G.FaceMouse = false;
            l_Character_4.HumanoidRootPart.Anchored = true;
            l_Character_4.Humanoid.AutoRotate = false;
            local l_CFrame_1 = l_Character_4.HumanoidRootPart.CFrame;
            local function _(v69) --[[ Line: 326 ]]
                return v69 * v69 * v69 * v69;
            end;
            local v71 = _G.FPS / 60;
            local v72 = Instance.new("BodyVelocity", l_Character_4.HumanoidRootPart);
            v72.Name = "geppo";
            v72.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
            v72.Velocity = Vector3.new(0, 0, 0, 0);
            task.wait(0.1);
            local v73 = nil;
            local v74 = nil;
            local v75 = nil;
            local v76 = nil;
            do
                local l_v73_0, l_v74_0, l_v75_0, l_v76_0 = v73, v74, v75, v76;
                pcall(function() --[[ Line: 341 ]]
                    -- upvalues: l_v73_0 (ref), l_v74_0 (ref), l_v75_0 (ref), l_v76_0 (ref), v59 (copy), l_Character_4 (copy)
                    local v81, v82, v83, v84 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Gomu-Gomu no Rocket", {
                        cf = v59:GetMouseCFrame(), 
                        charCF = l_Character_4.HumanoidRootPart.CFrame
                    }));
                    l_v73_0 = v81;
                    l_v74_0 = v82;
                    l_v75_0 = v83;
                    l_v76_0 = v84;
                end);
                if l_v73_0 ~= nil and l_v76_0 ~= nil then
                    l_Character_4.HumanoidRootPart.Anchored = false;
                    l_Character_4.Humanoid.PlatformStand = true;
                    local v85 = 200;
                    if l_v73_0 then
                        v85 = (l_Character_4.HumanoidRootPart.Position - l_v74_0).magnitude;
                    end;
                    v66:AdjustSpeed(0);
                    local v86 = false;
                    for v87 = 1, 40 * v71 do
                        local v88 = nil;
                        v88 = if l_v73_0 and l_v73_0.Anchored == true then l_v74_0 + Vector3.new(0, 5, 0, 0) else if l_v73_0 then l_v73_0.Position + Vector3.new(0, 5, 0, 0) else l_v74_0;
                        l_Character_4.HumanoidRootPart.Velocity = Vector3.new();
                        l_Character_4.HumanoidRootPart.RotVelocity = Vector3.new();
                        local l_HumanoidRootPart_0 = l_Character_4.HumanoidRootPart;
                        local v90 = CFrame.new(v88, v88 + (v88 - l_CFrame_1.Position));
                        local v91 = v87 / (40 * v71);
                        l_HumanoidRootPart_0.CFrame = l_CFrame_1:Lerp(v90, v91 * v91 * v91 * v91);
                        if math.floor(40 * v71 * 0.9) <= v87 and v86 == false and l_v76_0 then
                            v86 = true;
                            local l_CFrame_2 = l_Character_4.HumanoidRootPart.CFrame;
                            l_v76_0:FireServer(l_CFrame_2);
                        end;
                        l_Character_4.Humanoid.AutoRotate = false;
                        game["Run Service"].Stepped:Wait();
                    end;
                    l_Character_4.HumanoidRootPart.Anchored = false;
                    v72:Destroy();
                    l_Character_4.HumanoidRootPart.Velocity = l_Character_4.HumanoidRootPart.CFrame.lookVector * v85;
                    l_Character_4.HumanoidRootPart.Velocity = l_Character_4.HumanoidRootPart.Velocity + Vector3.new(0, 70, 0, 0) + l_Character_4.HumanoidRootPart.CFrame.lookVector * 50;
                    l_Character_4.HumanoidRootPart.CFrame = CFrame.new(l_Character_4.HumanoidRootPart.Position, l_Character_4.HumanoidRootPart.Position + l_Character_4.HumanoidRootPart.Velocity);
                    v66:Stop(0);
                    l_Character_4.Humanoid:LoadAnimation(script.rocketend):Play();
                else
                    task.wait(0.2);
                    v66:AdjustSpeed(0);
                    task.spawn(function() --[[ Line: 393 ]]
                        -- upvalues: v66 (copy), l_Character_4 (copy), v72 (copy)
                        task.wait(0.1);
                        v66:Stop();
                        l_Character_4.Humanoid:LoadAnimation(script.rocketmiss):Play(0);
                        v72:Destroy();
                    end);
                    if l_v76_0 then
                        local l_CFrame_3 = l_Character_4.HumanoidRootPart.CFrame;
                        l_v76_0:FireServer(l_CFrame_3);
                    end;
                end;
                if l_v73_0 == nil then
                    task.wait(0.5);
                else
                    task.wait(0.2);
                    l_Character_4.Humanoid.PlatformStand = false;
                end;
                l_Character_4.Humanoid.AutoRotate = true;
                l_Character_4.HumanoidRootPart.Anchored = false;
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Gomu-Gomu no Rocket", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.rocket = false;
            end;
        end;
    end;
end;
v8["Gomu-GomunoBalloon"] = function(v94, v95) --[[ Line: 424 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v94.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v98 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.balloon == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Gomu-Gomu no Balloon") == true then
        local v99 = v3.GetM("Gomu-Gomu no Balloon");
        local l_cd_4 = v99.cd;
        if _G.StamCheck("Gomu-Gomu no Balloon") == false then
            return;
        elseif v99.statreq and _G.MeetReq(v99.statreq) == false then
            return;
        else
            l_Cooldowns_4.balloon = true;
            _G.canuse = false;
            local v101 = l_Character_5.Humanoid:LoadAnimation(script.balloon);
            v101:Play();
            local v102 = true;
            v94:DoubleCastSkill(v95, {
                ToolName = script.Name, 
                Button = v95, 
                Key = Enum.KeyCode.R, 
                CompleteFunction = function() --[[ Line: 449 ]] --[[ Name: CompleteFunction ]]
                    -- upvalues: v102 (ref)
                    v102 = false;
                end, 
                SkipTap = true
            });
            task.wait(0.4);
            if l_Character_5:FindFirstChild("ragcarry") then
                _G.canuse = true;
                v101:Stop();
                task.wait(1);
                l_Cooldowns_4.balloon = false;
                return;
            else
                local v103 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gomu-Gomu no Balloon", {
                    cf = l_Character_5.HumanoidRootPart.CFrame
                });
                l_Character_5.Humanoid.PlatformStand = true;
                local v104 = Random.new();
                l_Character_5.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(v104:NextNumber(-10, 10), v104:NextNumber(-10, 10), v104:NextNumber(-10, 10));
                local v105 = script.BalloonForce:Clone();
                v105.Parent = l_Character_5.HumanoidRootPart;
                delay(0.8, function() --[[ Line: 470 ]]
                    -- upvalues: v101 (copy)
                    v101:AdjustSpeed(0);
                end);
                local v106 = tick();
                repeat
                    game["Run Service"].Heartbeat:Wait();
                    l_Character_5.Humanoid.WalkSpeed = 4;
                    local l_MoveDirection_0 = l_Character_5.Humanoid.MoveDirection;
                    if l_Character_5.Humanoid.MoveDirection:FuzzyEq((Vector3.new(0, 0, 0, 0))) then
                        v105.MaxForce = Vector3.new(0, 0, 0, 0);
                    else
                        v105.MaxForce = Vector3.new(100, 0, 100, 0);
                    end;
                    v105.Velocity = l_MoveDirection_0 * 100;
                    l_Character_5.Humanoid.PlatformStand = true;
                    l_Character_5.Humanoid.AutoRotate = false;
                until v103 == nil or v102 == false or tick() - v106 >= 20 or v94.on == false or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v98.Stamina.Value <= 0;
                v105:Destroy();
                v101:Stop();
                local v108 = l_Character_5.Humanoid:LoadAnimation(script.balloonend);
                v108:Play();
                v108:AdjustSpeed(0.5);
                l_Character_5.Humanoid.WalkSpeed = 16;
                if v103 then
                    v103:FireServer();
                end;
                task.wait(3);
                l_Character_5.Humanoid.PlatformStand = false;
                l_Character_5.Humanoid.AutoRotate = true;
                _G.canuse = true;
                _G.keysetup:cooldown("Gomu-Gomu no Balloon", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.balloon = false;
                --[[ close >= 8 ]]
            end;
        end;
    end;
end;
v8["Gomu-GomunoRifle"] = function(v109, v110) --[[ Line: 506 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v109.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v113 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.rifle == false and _G.check:inspect(l_Character_6) == true and _G.StamCheck("Gomu-Gomu no Rifle") == true then
        local v114 = v3.GetM("Gomu-Gomu no Rifle");
        local l_cd_5 = v114.cd;
        if _G.StamCheck("Gomu-Gomu no Rifle") == false then
            return;
        elseif v114.statreq and _G.MeetReq(v114.statreq) == false then
            return;
        else
            l_Cooldowns_5.rifle = true;
            _G.canuse = false;
            local v116 = l_Character_6.Humanoid:LoadAnimation(script.rifle);
            v116:Play();
            v116:AdjustWeight(2);
            l_Character_6.Humanoid.WalkSpeed = 4;
            local v117 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gomu-Gomu no Rifle", {
                cf = l_Character_6.HumanoidRootPart.CFrame
            });
            _G.PauseAnim(v116, 0.4, 1.25);
            local v118 = tick();
            v109:ChargeSkill(v110, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 535 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_6 (copy)
                    l_Character_6.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 539 ]] --[[ Name: endFunction ]]
                    -- upvalues: v117 (copy), v118 (copy), v109 (copy), l_Character_6 (copy), v113 (copy)
                    if v117 == nil or tick() - v118 >= 9 or v109.on == false or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v113.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v116:AdjustSpeed(3);
            local v119 = Instance.new("BodyVelocity", l_Character_6.HumanoidRootPart);
            v119.MaxForce = Vector3.new(1000000, 0, 1000000, 0);
            v119.Velocity = l_Character_6.HumanoidRootPart.CFrame.lookVector * 250;
            _G.destroy(v119, 0.1);
            local v120 = nil;
            local v121 = false;
            do
                local l_v119_0, l_v120_0, l_v121_0 = v119, v120, v121;
                local function v126(v125) --[[ Line: 557 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_v120_0 (ref), l_Character_6 (copy), l_v119_0 (ref), v117 (copy), v118 (copy)
                    l_v120_0 = true;
                    l_Character_6.HumanoidRootPart.Anchored = true;
                    l_Character_6.HumanoidRootPart.Velocity = Vector3.new();
                    l_v119_0.Velocity = Vector3.new();
                    l_v119_0:Destroy();
                    l_v119_0 = nil;
                    if v117 then
                        v117:FireServer(v125.Parent, l_Character_6.HumanoidRootPart.CFrame, 0.2 - (tick() - v118));
                    end;
                end;
                local function v127() --[[ Line: 569 ]] --[[ Name: hitinter ]]
                    -- upvalues: l_v119_0 (ref), l_v121_0 (ref), v116 (copy), v117 (copy)
                    l_v119_0:Destroy();
                    l_v119_0 = nil;
                    l_v121_0 = true;
                    v116:Stop();
                    if v117 then
                        v117:FireServer();
                    end;
                end;
                _G.hitbox:start(l_Character_6, Vector3.new(13, 13, 8, 0), 0.3, CFrame.new(0, 0, -2), v126, v127);
                if v117 then
                    v117:FireServer();
                end;
                task.spawn(function() --[[ Line: 582 ]]
                    -- upvalues: l_v120_0 (ref), v117 (copy), v116 (copy)
                    task.wait(0.5);
                    if l_v120_0 == nil and v117 then
                        v116:Stop(0.2);
                    end;
                end);
                task.wait(0.5);
                l_Character_6.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Gomu-Gomu no Rifle", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.rifle = false;
            end;
        end;
    end;
end;
v8.Gear2Transformation = function(v128, v129) --[[ Line: 606 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v10 (copy), v9 (copy)
    local l_Cooldowns_6 = v128.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_6.gear2 == false and _G.check:inspect(l_Character_7) == true and _G.StamCheck("Gear 2 Transformation") == true then
        local v133 = v3.GetM("Gear 2 Transformation");
        local l_cd_6 = v133.cd;
        if _G.StamCheck("Gear 2 Transformation") == false then
            return;
        elseif v133.statreq and _G.MeetReq(v133.statreq) == false then
            return;
        elseif (l_Character_7:GetAttribute("gomuDamage") or 0) < require(game.ReplicatedStorage.Modules.Skills.Modes.Gomu)(l_LocalPlayer_0) / 5 then
            _G.displayMessage("I need <Color=Pink>25%<Color=/> mode bar...");
            return;
        elseif v128.preG2Cnt then
            return;
        else
            l_Cooldowns_6.gear2 = true;
            _G.canuse = false;
            l_Character_7.PrimaryPart.Anchored = true;
            local v135 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gear 2 Transformation", l_Character_7.PrimaryPart.CFrame);
            if v135 == nil then
                l_Character_7.PrimaryPart.Anchored = false;
                _G.canuse = true;
                l_Cooldowns_6.gear2 = false;
                return;
            else
                script.Parent:SetAttribute("customIdle", true);
                _G.keysetup:Destroy();
                _G.keysetup:setup(v128.Tool.Name .. " Gear 2", v10);
                v128.preG2Cnt = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 648 ]]
                    -- upvalues: v128 (copy), l_Character_7 (copy)
                    if v128.on == true and l_Character_7.Humanoid.FloorMaterial ~= Enum.Material.Air then
                        if l_Character_7.Humanoid.MoveDirection == Vector3.new() then
                            if v128.Anims.idle.IsPlaying == false then
                                v128.Anims.idle:Play();
                            end;
                            if v128.Anims.walk.IsPlaying == true then
                                v128.Anims.walk:Stop();
                                return;
                            end;
                        else
                            if v128.Anims.idle.IsPlaying == true then
                                v128.Anims.idle:Stop();
                            end;
                            if v128.Anims.walk.IsPlaying == false then
                                v128.Anims.walk:Play();
                                return;
                            end;
                        end;
                    else
                        if v128.Anims.idle.IsPlaying == true then
                            v128.Anims.idle:Stop();
                        end;
                        if v128.Anims.walk.IsPlaying == true then
                            v128.Anims.walk:Stop();
                        end;
                    end;
                end);
                v128:DoubleCastSkill(v129, {
                    ToolName = script.Name, 
                    Button = v129, 
                    Key = Enum.KeyCode.Y, 
                    PassFunction = function() --[[ Line: 679 ]] --[[ Name: PassFunction ]]
                        -- upvalues: v128 (copy), l_Character_7 (copy)
                        return v128.Tool.Parent == l_Character_7;
                    end, 
                    CompleteFunction = function() --[[ Line: 682 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: v135 (copy)
                        if v135 then
                            v135:FireServer();
                        end;
                    end, 
                    SkipTap = true
                });
                l_Character_7:GetAttributeChangedSignal("GEAR2Active"):Connect(function() --[[ Line: 690 ]]
                    -- upvalues: l_Character_7 (copy), v128 (copy), v9 (ref), l_cd_6 (copy), l_Cooldowns_6 (copy)
                    if l_Character_7:GetAttribute("GEAR2Active") == nil then
                        if v128.preG2Cnt then
                            v128.preG2Cnt:Disconnect();
                            v128.preG2Cnt = nil;
                        end;
                        if v128.Anims.idle.IsPlaying == true then
                            v128.Anims.idle:Stop();
                        end;
                        script.Parent:SetAttribute("customIdle", nil);
                        _G.keysetup:Destroy();
                        _G.keysetup:setup(v128.Tool.Name, v9);
                        _G.keysetup:cooldown("Gear 2 Transformation", l_cd_6);
                        _G.fw(l_cd_6);
                        l_Cooldowns_6.gear2 = false;
                    end;
                end);
                task.wait(2);
                l_Character_7.PrimaryPart.Anchored = false;
                _G.canuse = true;
            end;
        end;
    end;
end;
v8.ElephantGun = function(v136, _) --[[ Line: 716 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_7 = v136.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_7.ult == false and _G.check:inspect(l_Character_8) == true and _G.StamCheck("Elephant Gun") == true then
        local v141 = v3.GetM("Elephant Gun");
        local l_cd_7 = v141.cd;
        if _G.StamCheck("Elephant Gun") == false then
            return;
        elseif v141.statreq and _G.MeetReq(v141.statreq) == false then
            return;
        else
            l_Cooldowns_7.ult = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Elephant Gun", v136:GetMouseCFrame());
            task.wait(3);
            _G.keysetup:cooldown("Elephant Gun", l_cd_7);
            _G.canuse = true;
            _G.fw(l_cd_7);
            l_Cooldowns_7.ult = false;
        end;
    end;
end;
v8.JetGatling = function(v144, v145) --[[ Line: 755 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_8 = v144.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local v148 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_8.jetgalt == false and _G.check:inspect(l_Character_9) == true and _G.StamCheck("Jet Gatling") == true then
        local v149 = v3.GetM("Jet Gatling");
        local l_cd_8 = v149.cd;
        if _G.StamCheck("Jet Gatling") == false then
            return;
        elseif v149.statreq and _G.MeetReq(v149.statreq) == false then
            return;
        else
            l_Cooldowns_8.jetgalt = true;
            _G.canuse = false;
            local v151 = l_Character_9.Humanoid:LoadAnimation(script.Gear2Anims.galtingWindup);
            v151:Play();
            v151:AdjustWeight(2);
            local v152 = Instance.new("BoolValue", l_Character_9);
            local l_Position_0 = (l_Character_9.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4.5) - Vector3.new(0, 0, 0, 0)).Position;
            local v154 = _G.Ess.Mouse.GetPosition(_G.Ess.RaycastParams);
            local l_Magnitude_0 = (v154 - l_Position_0).Magnitude;
            v154 = (CFrame.new(l_Position_0, (Vector3.new(v154.X, l_Position_0.Y, v154.Z))) * CFrame.new(0, 0, -math.clamp(l_Magnitude_0, 2, 20))).Position;
            _G.PauseAnim(v151, 0.68, 1);
            v151:Stop();
            local v156 = game.ReplicatedStorage.Events.Skill:InvokeServer("Jet Gatling");
            local v157 = l_Character_9.Humanoid:LoadAnimation(script.Gear2Anims.galtingLoop);
            v157:Play();
            v157:AdjustWeight(2);
            local v158 = tick();
            v144:ChargeSkill(v145, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 794 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_9 (copy)
                    l_Character_9.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 798 ]] --[[ Name: endFunction ]]
                    -- upvalues: v158 (copy), v144 (copy), l_Character_9 (copy), v148 (copy)
                    if tick() - v158 >= 5 or v144.on == false or l_Character_9:FindFirstChild("PB") or l_Character_9.Parent == nil or l_Character_9.Parent ~= workspace.PlayerCharacters or v148.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            task.wait(0.1);
            v152:Destroy();
            v157:Stop();
            if v156 then
                v156:FireServer();
            end;
            l_Character_9.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Jet Gatling", l_cd_8);
            _G.fw(l_cd_8);
            l_Cooldowns_8.jetgalt = false;
        end;
    end;
end;
v8.JetPistol = function(v159, v160) --[[ Line: 828 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_9 = v159.Cooldowns;
    local l_Character_10 = l_LocalPlayer_0.Character;
    local v163 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_9.jetpistol == false and _G.check:inspect(l_Character_10) == true and _G.StamCheck("Jet Pistol") == true then
        local v164 = v3.GetM("Jet Pistol");
        local l_cd_9 = v164.cd;
        if _G.StamCheck("Jet Pistol") == false then
            return;
        elseif v164.statreq and _G.MeetReq(v164.statreq) == false then
            return;
        else
            l_Cooldowns_9.jetpistol = true;
            _G.canuse = false;
            local v166 = l_Character_10.Humanoid:LoadAnimation(script.Gear2Anims.jetpistol);
            v166:Play();
            v166:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v166, 0.36, 1);
            local v167 = tick();
            local v168 = game.ReplicatedStorage.Events.Skill:InvokeServer("Jet Pistol");
            local function v169() --[[ Line: 855 ]] --[[ Name: endFunction ]]
                -- upvalues: v167 (copy), v159 (copy), l_Character_10 (copy), v163 (copy)
                if tick() - v167 >= 10 or v159.on == false or l_Character_10.Parent == nil or l_Character_10.Parent ~= workspace.PlayerCharacters or v163.Stamina.Value <= 0 then
                    return true;
                else
                    return;
                end;
            end;
            _G.holdSkill(Enum.KeyCode.E, checkFunction, v169);
            v159:ChargeSkill(v160, {
                Key = Enum.KeyCode.E, 
                EndFunction = v169
            });
            _G.FaceMouse = false;
            l_Character_10.HumanoidRootPart.Anchored = true;
            local l_p_0 = v159:GetMouseCFrame().p;
            l_Character_10:SetPrimaryPartCFrame(CFrame.new(l_Character_10.PrimaryPart.Position, l_p_0));
            if v168 then
                v168:FireServer(CFrame.new(l_p_0));
            end;
            v166:AdjustSpeed(4);
            task.wait(0.25);
            l_Character_10.Humanoid.AutoRotate = false;
            l_Character_10.Humanoid.AutoRotate = true;
            l_Character_10.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Jet Pistol", l_cd_9);
            _G.fw(l_cd_9);
            l_Cooldowns_9.jetpistol = false;
        end;
    end;
end;
v8.JetRocket = function(v171, v172) --[[ Line: 898 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_10 = v171.Cooldowns;
    local l_Character_11 = l_LocalPlayer_0.Character;
    local v175 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_10.missile == false and _G.check:inspect(l_Character_11) == true and _G.StamCheck("Jet Pistol") == true then
        local v176 = v3.GetM("Jet Rocket");
        local l_cd_10 = v176.cd;
        if _G.StamCheck("Jet Rocket") == false then
            return;
        elseif v176.statreq and _G.MeetReq(v176.statreq) == false then
            return;
        else
            l_Cooldowns_10.missile = true;
            _G.canuse = false;
            local v178 = l_Character_11.Humanoid:LoadAnimation(script.Gear2Anims.rocket);
            v178:Play();
            v178:AdjustWeight(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v178, 0.48, 1);
            local v179 = tick();
            v171:ChargeSkill(v172, {
                Key = Enum.KeyCode.T, 
                EndFunction = function() --[[ Line: 925 ]] --[[ Name: endFunction ]]
                    -- upvalues: v179 (copy), v171 (copy), l_Character_11 (copy), v175 (copy)
                    if tick() - v179 >= 10 or v171.on == false or l_Character_11.Parent == nil or l_Character_11.Parent ~= workspace.PlayerCharacters or v175.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v178:Stop();
            _G.FaceMouse = false;
            local l_p_1 = v171:GetMouseCFrame().p;
            local v181 = _G.getTargetNearMouse(125);
            if v181 then
                l_p_1 = v181.Position;
            end;
            l_Character_11.PrimaryPart.Anchored = true;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Jet Rocket", l_p_1);
            l_Character_11.PrimaryPart.Anchored = false;
            task.wait(0.25);
            l_Character_11.Humanoid.AutoRotate = false;
            l_Character_11.Humanoid.AutoRotate = true;
            l_Character_11.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Jet Rocket", l_cd_10);
            _G.fw(l_cd_10);
            l_Cooldowns_10.missile = false;
        end;
    end;
end;
v8.JetStomp = function(v182, _) --[[ Line: 959 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_11 = v182.Cooldowns;
    local l_Character_12 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_11.stamp == false and _G.check:inspect(l_Character_12) == true and _G.StamCheck("Jet Stomp") == true then
        local v187 = v3.GetM("Jet Stomp");
        local l_cd_11 = v187.cd;
        if _G.StamCheck("Jet Stomp") == false then
            return;
        elseif v187.statreq and _G.MeetReq(v187.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_11.stamp = true;
            local v189 = l_Character_12.Humanoid:LoadAnimation(script.Gear2Anims.stamp);
            v189:Play();
            _G.canuse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Jet Stomp");
            task.wait(1);
            v189:Stop();
            _G.canuse = true;
            _G.keysetup:cooldown("Jet Stomp", l_cd_11);
            _G.fw(l_cd_11);
            l_Cooldowns_11.stamp = false;
        end;
    end;
end;
v8.RedHawk = function(v190, v191) --[[ Line: 991 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_12 = v190.Cooldowns;
    local l_Character_13 = l_LocalPlayer_0.Character;
    local v194 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_12.hawk == false and _G.check:inspect(l_Character_13) == true and _G.StamCheck("Jet Pistol") == true then
        local v195 = v3.GetM("Red Hawk");
        local l_cd_12 = v195.cd;
        if _G.StamCheck("Red Hawk") == false then
            return;
        elseif v195.statreq and _G.MeetReq(v195.statreq) == false then
            return;
        else
            l_Cooldowns_12.hawk = true;
            _G.canuse = false;
            local v197 = l_Character_13.Humanoid:LoadAnimation(script.Gear2Anims.redhawk);
            v197:Play();
            v197:AdjustWeight(2);
            _G.FaceMouse = true;
            local v198 = game.ReplicatedStorage.Events.Skill:InvokeServer("Red Hawk");
            _G.PauseAnim(v197, 0.5900000000000001, 1);
            local v199 = tick();
            v190:ChargeSkill(v191, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 1022 ]] --[[ Name: endFunction ]]
                    -- upvalues: v199 (copy), v190 (copy), l_Character_13 (copy), v194 (copy)
                    if tick() - v199 >= 10 or v190.on == false or l_Character_13.Parent == nil or l_Character_13.Parent ~= workspace.PlayerCharacters or v194.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            l_Character_13.HumanoidRootPart.Anchored = true;
            local l_p_2 = v190:GetMouseCFrame().p;
            v197:AdjustSpeed(1.25);
            l_Character_13:SetPrimaryPartCFrame(CFrame.new(l_Character_13.PrimaryPart.Position, l_p_2));
            if v198 then
                v198:FireServer(l_Character_13.PrimaryPart.CFrame);
            end;
            task.wait(1);
            l_Character_13.Humanoid.AutoRotate = false;
            l_Character_13.Humanoid.AutoRotate = true;
            l_Character_13.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Red Hawk", l_cd_12);
            _G.fw(l_cd_12);
            l_Cooldowns_12.hawk = false;
        end;
    end;
end;
return v8;