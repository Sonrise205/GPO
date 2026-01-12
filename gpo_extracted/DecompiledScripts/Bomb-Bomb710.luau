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
        leap = false, 
        swipe = false, 
        trap = false, 
        selfex = false, 
        swing = false
    };
    v9.CurrentSwipe = 1;
    return v9;
end;
v7.ExplosiveLeap = function(v10, v11) --[[ Line: 34 ]] --[[ Name: ExplosiveLeap ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_0.leap == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Explosive Leap") == true then
        local v15 = v3.GetM("Explosive Leap");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Explosive Leap") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.leap = true;
            _G.canuse = false;
            local v17 = l_Character_0.Humanoid:LoadAnimation(script.leap);
            v17:Play();
            v17:AdjustWeight(2);
            l_Character_0.Humanoid.WalkSpeed = 4;
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("Explosive Leap");
            local _ = tick();
            _G.PauseAnim(v17, 0.25, 1);
            local v20 = tick();
            local v21 = 0;
            do
                local l_v21_0 = v21;
                local function v23() --[[ Line: 62 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), l_v21_0 (ref)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                    l_v21_0 = l_v21_0 + 0.25;
                end;
                v10:ChargeSkill(v11, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = v23, 
                    EndFunction = function() --[[ Line: 67 ]] --[[ Name: endFunction ]]
                        -- upvalues: v20 (copy), l_Character_0 (copy), v14 (copy)
                        if tick() - v20 >= 3 or not l_Character_0:FindFirstChild("Bomb-Bomb") or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v17:AdjustSpeed(1.5);
                task.wait(0.1);
                local v24 = Instance.new("BodyVelocity", l_Character_0.HumanoidRootPart);
                v24.Name = "geppo";
                v24.MaxForce = Vector3.new(99999997952, 1000000000, 99999997952, 0);
                v24.Velocity = Vector3.new(0, l_v21_0 + 70, 0);
                _G.destroy(v24, 0.25);
                l_Character_0.Humanoid.WalkSpeed = 16;
                if v18 then
                    v18:FireServer({
                        cf = l_Character_0.HumanoidRootPart.CFrame, 
                        extra = l_v21_0
                    });
                end;
                _G.canuse = true;
                _G.keysetup:cooldown("Explosive Leap", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.leap = false;
            end;
        end;
    end;
end;
v7.ExplosiveSwipe = function(v25, v26) --[[ Line: 99 ]] --[[ Name: ExplosiveSwipe ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v25.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v29 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.swipe == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Explosive Swipe") == true then
        local v30 = v3.GetM("Explosive Swipe");
        local l_cd_1 = v30.cd;
        if _G.StamCheck("Explosive Swipe") == false then
            return;
        elseif v30.statreq and _G.MeetReq(v30.statreq) == false then
            return;
        else
            l_Cooldowns_1.swipe = true;
            _G.canuse = false;
            local v32 = l_Character_1.Humanoid:LoadAnimation(script["swipe" .. v25.CurrentSwipe]);
            v32:Play();
            v32:AdjustWeight(2);
            v25.CurrentSwipe = v25.CurrentSwipe + 1;
            if v25.CurrentSwipe > 2 then
                v25.CurrentSwipe = 1;
            end;
            _G.FaceMouse = true;
            _G.PauseAnim(v32, 0.42, 1);
            local v33 = nil;
            local v34 = nil;
            do
                local l_v33_0, l_v34_0 = v33, v34;
                pcall(function() --[[ Line: 126 ]]
                    -- upvalues: l_v33_0 (ref), l_v34_0 (ref), v25 (copy)
                    local v37, v38 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Explosive Swipe", {
                        cf = v25:GetMouseCFrame()
                    }));
                    l_v33_0 = v37;
                    l_v34_0 = v38;
                    if l_v34_0 then
                        l_v34_0 = _G.awaitObject(l_v34_0);
                    end;
                end);
                local v39 = tick();
                local v40 = 0;
                local v41 = nil;
                if l_v34_0 then
                    v41 = l_v34_0.CFrame;
                end;
                local function v46() --[[ Line: 141 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v41 (ref), v25 (copy), v40 (ref), l_v33_0 (ref), l_v34_0 (ref), l_Character_1 (copy)
                    if v41 then
                        local v42 = v41:Lerp(v25:GetMouseCFrame(), 0.1);
                        if tick() - v40 >= 0.05 and l_v33_0 then
                            l_v33_0:FireServer("update", v42);
                            v40 = tick();
                        end;
                        if l_v34_0 then
                            if (l_Character_1.HumanoidRootPart.Position - v42.p).magnitude >= 150 then
                                local v43 = Ray.new(l_Character_1.HumanoidRootPart.Position, (l_Character_1.HumanoidRootPart.Position - v42.p).unit * -150);
                                local _, v45 = _G.raycastIgnoreList(v43, {
                                    workspace
                                });
                                v42 = CFrame.new(v45);
                            end;
                            l_v34_0.CFrame = v42;
                            v41 = v42;
                        end;
                    end;
                end;
                v25:ChargeSkill(v26, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v46, 
                    EndFunction = function() --[[ Line: 163 ]] --[[ Name: endFunction ]]
                        -- upvalues: v39 (copy), l_Character_1 (copy), v29 (copy)
                        if tick() - v39 >= 3 or not l_Character_1:FindFirstChild("Bomb-Bomb") or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v29.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                v32:AdjustSpeed(0.85);
                l_Character_1.HumanoidRootPart.Anchored = true;
                if l_v33_0 then
                    l_v33_0:FireServer(v41);
                end;
                _G.FaceMouse = false;
                task.wait(0.45);
                l_Character_1.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Explosive Swipe", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.swipe = false;
            end;
        end;
    end;
end;
v7.ExplosiveMines = function(v47, v48) --[[ Line: 194 ]] --[[ Name: ExplosiveMines ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v47.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v51 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.trap == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Explosive Mines") == true then
        local v52 = v3.GetM("Explosive Mines");
        local l_cd_2 = v52.cd;
        if _G.StamCheck("Explosive Mines") == false then
            return;
        elseif v52.statreq and _G.MeetReq(v52.statreq) == false then
            return;
        else
            l_Cooldowns_2.trap = true;
            _G.canuse = false;
            local v54 = l_Character_2.Humanoid:LoadAnimation(script.trap);
            v54:Play();
            v54:AdjustWeight(2);
            l_Character_2.Humanoid.WalkSpeed = 0;
            _G.PauseAnim(v54, 0.5, 1);
            local v55 = game.ReplicatedStorage.Events.Skill:InvokeServer("Explosive Mines");
            local v56 = tick();
            local l_CFrame_0 = l_Character_2.HumanoidRootPart.CFrame;
            local v58 = Ray.new(l_CFrame_0.p + Vector3.new(0, 5, 0, 0), CFrame.new(l_CFrame_0.p).upVector * -25);
            local v59, v60, v61 = _G.raycastWhitelist(v58, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local v62 = nil;
            if v59 then
                v62 = game.ReplicatedStorage.MiscModels.BombTrap:Clone();
                v62.Parent = workspace.Effects;
                v62.CFrame = CFrame.new(v60, v60 + v61) * CFrame.Angles(1.5707963267948966, 0, 0);
                v62.Mesh.Scale = Vector3.new(20, 0.25, 20, 0);
            end;
            local v63 = 0;
            do
                local l_v62_0, l_v63_0 = v62, v63;
                local function v66() --[[ Line: 233 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy), l_v62_0 (ref), l_v63_0 (ref)
                    l_Character_2.Humanoid.WalkSpeed = 0;
                    if l_v62_0 and tick() - l_v63_0 >= 0.1 then
                        l_v62_0.Mesh.Scale = l_v62_0.Mesh.Scale + Vector3.new(2, 0, 2, 0);
                        l_v63_0 = tick();
                    end;
                end;
                v47:ChargeSkill(v48, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = v66, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 241 ]] --[[ Name: endFunction ]]
                        -- upvalues: v56 (copy), l_Character_2 (copy), v51 (copy)
                        if tick() - v56 >= 5 or l_Character_2:FindFirstChild("Stun") or not l_Character_2:FindFirstChild("Bomb-Bomb") or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v51.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v54:AdjustSpeed(1);
                local v67 = 20;
                if l_v62_0 then
                    v67 = l_v62_0.Mesh.Scale.X;
                    _G.tween(l_v62_0, {
                        0.25, 
                        "EntranceExpressive", 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        Transparency = 1
                    });
                    _G.destroy(l_v62_0, 0.25);
                end;
                local v68 = nil;
                if v55 then
                    v68 = v55:InvokeServer({
                        cf = l_Character_2.HumanoidRootPart.CFrame
                    });
                end;
                if v68 then
                    task.delay(1.1, function() --[[ Line: 268 ]]
                        -- upvalues: v68 (ref)
                        for v69 = 1, #v68 do
                            task.spawn(function() --[[ Line: 270 ]]
                                -- upvalues: v68 (ref), v69 (copy)
                                local v70 = _G.awaitObject(v68[v69]);
                                if v70 and typeof(v70) == "Instance" then
                                    v70.Transparency = 0.5;
                                end;
                            end);
                        end;
                    end);
                end;
                l_Character_2.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Explosive Mines", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.trap = false;
            end;
        end;
    end;
end;
v7.SelfDestruction = function(v71, v72) --[[ Line: 287 ]] --[[ Name: SelfDestruction ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v71.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v75 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.selfex == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Self Destruction") == true then
        local v76 = v3.GetM("Self Destruction");
        local l_cd_3 = v76.cd;
        if _G.StamCheck("Self Destruction") == false then
            return;
        elseif v76.statreq and _G.MeetReq(v76.statreq) == false then
            return;
        else
            l_Cooldowns_3.selfex = true;
            _G.canuse = false;
            local v78 = l_Character_3.Humanoid:LoadAnimation(script.self);
            v78:Play();
            v78:AdjustWeight(2);
            l_Character_3.HumanoidRootPart.Anchored = true;
            local v79 = game.ReplicatedStorage.Events.Skill:InvokeServer("Self Destruction", {
                cf = l_Character_3.HumanoidRootPart.CFrame, 
                cf2 = true
            });
            local v80 = tick();
            _G.PauseAnim(v78, 0.4, 1);
            v71:ChargeSkill(v72, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 312 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 316 ]] --[[ Name: endFunction ]]
                    -- upvalues: v80 (copy), l_Character_3 (copy), v75 (copy)
                    if tick() - v80 >= 4 or not l_Character_3:FindFirstChild("Bomb-Bomb") or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v75.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v78:AdjustSpeed(1);
            if v79 then
                v79:FireServer();
            end;
            task.wait(0.5);
            l_Character_3.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Self Destruction", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.selfex = false;
        end;
    end;
end;
v7.ExplosiveGrab = function(v81, v82) --[[ Line: 344 ]] --[[ Name: ExplosiveGrab ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v81.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v85 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.swing == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Explosive Grab") == true then
        local v86 = v3.GetM("Explosive Grab");
        local l_cd_4 = v86.cd;
        if _G.StamCheck("Explosive Grab") == false then
            return;
        elseif v86.statreq and _G.MeetReq(v86.statreq) == false then
            return;
        else
            l_Cooldowns_4.swing = true;
            _G.canuse = false;
            local v88 = l_Character_4.Humanoid:LoadAnimation(script.swing);
            v88:Play();
            v88:AdjustWeight(2);
            local v89 = tick();
            l_Character_4.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v88, 0.25, 1.5);
            v81:ChargeSkill(v82, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 369 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_4 (copy)
                    l_Character_4.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 374 ]] --[[ Name: endFunction ]]
                    -- upvalues: v89 (copy), l_Character_4 (copy), v85 (copy)
                    if tick() - v89 >= 4 or l_Character_4:FindFirstChild("Stun") or not l_Character_4:FindFirstChild("Bomb-Bomb") or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v85.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v88:AdjustSpeed(1);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Explosive Grab", {
                cf = l_Character_4.HumanoidRootPart.CFrame
            });
            l_Character_4.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Explosive Grab", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.swing = false;
        end;
    end;
end;
return v7;