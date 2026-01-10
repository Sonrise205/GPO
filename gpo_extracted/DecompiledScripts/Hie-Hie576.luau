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
        Bird = false, 
        Spear = false, 
        Bike = false, 
        Sword = false, 
        Stomp = false, 
        age = false
    };
    v9.SpearHand = false;
    return v9;
end;
v7.IcePartisan = function(v10, v11) --[[ Line: 36 ]] --[[ Name: IcePartisan ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.Spear == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Ice Partisan") == true then
        local v15 = v3.GetM("Ice Partisan");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Ice Partisan") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.Spear = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v17 = tick();
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.Spear);
            v10.SpearHand = not v10.SpearHand;
            if v10.SpearHand then
                v18:Destroy();
                v18 = l_Character_0.Humanoid:LoadAnimation(script.Spear2);
            end;
            v18:Play();
            _G.PauseAnim(v18, 0.25, 1);
            v10:ChargeSkill(v11, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 66 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v17 (copy), l_Character_0 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (copy)
                    local v19 = true;
                    if tick() - v17 < 10 then
                        v19 = true;
                        if l_Character_0:FindFirstChild("Hie-Hie") ~= false then
                            v19 = true;
                            if l_Character_0.Parent ~= nil then
                                v19 = true;
                                if l_Character_0.Parent == workspace.PlayerCharacters then
                                    v19 = l_l_ReplicatedStorage_0_FirstChild_0.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                    return v19;
                end
            });
            _G.FaceMouse = false;
            v18:AdjustSpeed(1);
            l_Character_0.HumanoidRootPart.Anchored = true;
            task.wait(0.15000000000000002);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Ice Partisan", {
                cf = l_Character_0.HumanoidRootPart.CFrame, 
                ExploitCheck = true
            });
            task.spawn(function() --[[ Line: 76 ]]
                -- upvalues: l_cd_0 (copy), l_Cooldowns_0 (copy)
                _G.keysetup:cooldown("Ice Partisan", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.Spear = false;
            end);
            task.wait(0.35);
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
        end;
    end;
end;
v7.IceBike = function(v20, v21) --[[ Line: 89 ]] --[[ Name: IceBike ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local l_l_ReplicatedStorage_0_FirstChild_1 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if _G.grounded == false and l_Cooldowns_1.Bike == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Ice Bike") == true then
        local v25 = v3.GetM("Ice Bike");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Ice Bike") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.Bike = true;
            _G.allowJumpWhileStunned = true;
            _G.canuse = false;
            local v27 = nil;
            local v28 = nil;
            local v29 = nil;
            do
                local l_v27_0, l_v28_0, l_v29_0 = v27, v28, v29;
                pcall(function() --[[ Line: 109 ]]
                    -- upvalues: l_v27_0 (ref), l_Character_1 (copy)
                    l_v27_0 = game.ReplicatedStorage.Events.Skill:InvokeServer("Ice Bike", {
                        cf = l_Character_1.HumanoidRootPart.CFrame
                    });
                end);
                local _ = tick();
                local v34 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
                v34.MaxForce = Vector3.new(100000, 0, 100000, 0);
                local v35 = 5;
                local _ = nil;
                local v37 = workspace.Effects:WaitForChild(l_LocalPlayer_0.Name .. "IceBike", 3);
                if v37 then
                    l_v28_0 = v37.AnimationController:LoadAnimation(script.BikeWheel);
                    l_v28_0:Play();
                    l_v29_0 = l_Character_1.Humanoid:LoadAnimation(script.Pedal);
                    l_v29_0:Play();
                end;
                _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.IceBike]:start(l_Character_1);
                local _ = tick();
                local function v51(_) --[[ Line: 135 ]] --[[ Name: endFunction ]]
                    -- upvalues: v35 (ref), l_Character_1 (copy), v34 (copy), l_v28_0 (ref), l_v29_0 (ref), l_l_ReplicatedStorage_0_FirstChild_1 (copy)
                    if tick() - 0 >= 0.016666666666666666 then
                        v35 = v35 + 0.25 * (l_Character_1.Humanoid.Health / l_Character_1.Humanoid.MaxHealth);
                    end;
                    v35 = math.clamp(v35, 0, 125 * (l_Character_1.Humanoid.Health / l_Character_1.Humanoid.MaxHealth));
                    local v40 = CFrame.new(l_Character_1.HumanoidRootPart.Position);
                    local v41 = Ray.new(v40.p, v40.upVector * -(l_Character_1.Humanoid.HipHeight * 2 + 5));
                    local v42, _, _ = _G.raycastWhitelist(v41, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    local l_CFrame_0 = l_Character_1.HumanoidRootPart.CFrame;
                    local v46 = Ray.new(l_CFrame_0.p, l_CFrame_0.lookVector * 2);
                    local v47, _, _ = _G.raycastWhitelist(v46, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    if v42 == nil then
                        v35 = v35 - 0.25;
                    end;
                    if v47 and v47.CanCollide == true then
                        v35 = 0;
                    end;
                    v35 = v35;
                    v34.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * v35;
                    local v50 = v35 / 125 * 3;
                    if v42 == nil then
                        v50 = 0.25;
                    end;
                    if l_v28_0 then
                        l_v28_0:AdjustSpeed(v50);
                        l_v29_0:AdjustSpeed(v50);
                    end;
                    _G.allowJumpWhileStunned = true;
                    _G.canuse = false;
                    if l_Character_1:FindFirstChild("Stun") then
                        return true;
                    elseif l_l_ReplicatedStorage_0_FirstChild_1.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                v20:ChargeSkill(v21, {
                    Button = v21, 
                    Key = Enum.KeyCode.T, 
                    PCInputType = "Toggle", 
                    MobileInputType = "Toggle", 
                    EndFunction = v51
                });
                v34:Destroy();
                _G.allowJumpWhileStunned = nil;
                pcall(function() --[[ Line: 187 ]]
                    -- upvalues: l_v28_0 (ref), l_v29_0 (ref)
                    l_v28_0:Stop();
                    l_v29_0:Stop();
                end);
                _G.canuse = true;
                if l_v27_0 then
                    l_v27_0:FireServer();
                end;
                _G.keysetup:cooldown("Ice Bike", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.Bike = false;
            end;
        end;
    end;
end;
v7.PheasantBeak = function(v52, v53) --[[ Line: 201 ]] --[[ Name: PheasantBeak ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v52.Cooldowns;
    local l_l_ReplicatedStorage_0_FirstChild_2 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.Bird == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Pheasant Beak") == true then
        local v57 = v3.GetM("Pheasant Beak");
        local l_cd_2 = v57.cd;
        if _G.StamCheck("Pheasant Beak") == false then
            return;
        elseif v57.statreq and _G.MeetReq(v57.statreq) == false then
            return;
        else
            l_Cooldowns_2.Bird = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v59 = tick();
            local v60 = l_Character_2.Humanoid:LoadAnimation(script.beak);
            v60:Play();
            _G.PauseAnim(v60, 0.45, 2);
            v52:ChargeSkill(v53, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 226 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_2 (copy), v59 (copy), l_l_ReplicatedStorage_0_FirstChild_2 (copy)
                    return not l_Character_2:FindFirstChild("Hie-Hie") or tick() - v59 >= 10 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or l_l_ReplicatedStorage_0_FirstChild_2.Stamina.Value <= 0;
                end
            });
            _G.FaceMouse = false;
            l_Character_2.HumanoidRootPart.Anchored = true;
            v60:AdjustSpeed(1);
            task.wait(0.15);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Pheasant Beak", {
                cf = l_Character_2.HumanoidRootPart.CFrame
            });
            task.wait(0.35);
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Pheasant Beak", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.Bird = false;
        end;
    end;
end;
v7.IceStomp = function(v61, v62) --[[ Line: 246 ]] --[[ Name: IceStomp ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v61.Cooldowns;
    local l_l_ReplicatedStorage_0_FirstChild_3 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.Stomp == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Ice Stomp") == true then
        local v66 = v3.GetM("Ice Stomp");
        local l_cd_3 = v66.cd;
        if _G.StamCheck("Ice Stomp") == false then
            return;
        elseif v66.statreq and _G.MeetReq(v66.statreq) == false then
            return;
        else
            l_Cooldowns_3.Stomp = true;
            _G.canuse = false;
            local v68 = l_Character_3.Humanoid:LoadAnimation(script.stomp);
            v68:Play();
            l_Character_3.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v68, 0.3, 1.25);
            v61:ChargeSkill(v62, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 270 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 275 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), l_l_ReplicatedStorage_0_FirstChild_3 (copy)
                    if not l_Character_3:FindFirstChild("Hie-Hie") or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or l_l_ReplicatedStorage_0_FirstChild_3.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v68:AdjustSpeed(1);
            task.wait(0.3);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Ice Stomp", {
                cf = l_Character_3.HumanoidRootPart.CFrame
            });
            task.wait(0.25);
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Ice Stomp", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.Stomp = false;
        end;
    end;
end;
v7.FrostBlade = function(v69, v70) --[[ Line: 300 ]] --[[ Name: FrostBlade ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v69.Cooldowns;
    local l_l_ReplicatedStorage_0_FirstChild_4 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.Sword == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Frost Blade") == true then
        local v74 = v3.GetM("Frost Blade");
        local l_cd_4 = v74.cd;
        if _G.StamCheck("Frost Blade") == false then
            return;
        elseif v74.statreq and _G.MeetReq(v74.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v76 = game.ReplicatedStorage.Events.Skill:InvokeServer("Frost Blade", {
                cf = l_Character_4.HumanoidRootPart.CFrame
            });
            if v76 == nil then
                _G.canuse = true;
                return;
            else
                l_Cooldowns_4.Sword = true;
                local v77 = tick();
                local v78 = l_Character_4.Humanoid:LoadAnimation(script.IceSword);
                v78:Play();
                v78:AdjustWeight(5);
                _G.FaceMouse = true;
                _G.PauseAnim(v78, 1.25, 1.25);
                v69:ChargeSkill(v70, {
                    Key = Enum.KeyCode.X, 
                    EndFunction = function() --[[ Line: 333 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_4 (copy), v77 (copy), l_l_ReplicatedStorage_0_FirstChild_4 (copy)
                        return not l_Character_4:FindFirstChild("Hie-Hie") or tick() - v77 >= 10 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or l_l_ReplicatedStorage_0_FirstChild_4.Stamina.Value <= 0;
                    end
                });
                v78:AdjustSpeed(1.35);
                local _ = v78.KeyframeReached:Connect(function(v79) --[[ Line: 339 ]]
                    -- upvalues: v76 (copy), l_Character_4 (copy)
                    if v79:match("slash") and v76 ~= nil then
                        v76:FireServer(v79, l_Character_4.HumanoidRootPart.CFrame);
                    end;
                end);
                l_Character_4.HumanoidRootPart.Anchored = true;
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.FaceMouse = false;
                task.wait(2);
                _G.canuse = true;
                v76:FireServer("finish");
                l_Character_4.HumanoidRootPart.Anchored = false;
                _G.keysetup:cooldown("Frost Blade", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.Sword = false;
            end;
        end;
    end;
end;
v7.IceAge = function(v81, v82) --[[ Line: 358 ]] --[[ Name: IceAge ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v81.Cooldowns;
    local l_l_ReplicatedStorage_0_FirstChild_5 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local l_Character_5 = l_LocalPlayer_0.Character;
    if l_Cooldowns_5.age == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Ice Age") == true then
        if l_Character_5:FindFirstChild("ragcarry") then
            return;
        else
            local v86 = v3.GetM("Ice Age");
            local l_cd_5 = v86.cd;
            if _G.StamCheck("Ice Age") == false then
                return;
            elseif v86.statreq and _G.MeetReq(v86.statreq) == false then
                return;
            else
                l_Cooldowns_5.age = true;
                _G.canuse = false;
                local v88 = l_Character_5.Humanoid:LoadAnimation(script.iceage);
                v88:Play();
                v88:AdjustWeight(2);
                l_Character_5.Humanoid.WalkSpeed = 2;
                _G.PauseAnim(v88, 0.67, 1);
                v81:ChargeSkill(v82, {
                    Key = Enum.KeyCode.C, 
                    EndFunction = function() --[[ Line: 386 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_5 (copy), l_l_ReplicatedStorage_0_FirstChild_5 (copy)
                        l_Character_5.Humanoid.WalkSpeed = 2;
                        return not l_Character_5:FindFirstChild("Hie-Hie") or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or l_l_ReplicatedStorage_0_FirstChild_5.Stamina.Value <= 0;
                    end
                });
                v88:AdjustSpeed(1.35);
                task.wait(0.2);
                game.ReplicatedStorage.Events.Skill:InvokeServer("Ice Age", {
                    cf = l_Character_5.HumanoidRootPart.CFrame
                });
                task.wait(0.3);
                l_Character_5.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Ice Age", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.age = false;
            end;
        end;
    end;
end;
return v7;