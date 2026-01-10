local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
local _ = game:GetService("UserInputService");
v6.new = function(_) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v9 = setmetatable(v3.new(script.Name), v6);
    v9.Cooldowns = {
        fist = false, 
        breath = false, 
        ult = false, 
        rush = false, 
        reverse = false, 
        mode = false, 
        triple = false
    };
    return v9;
end;
v6.DragonFist = function(v10, _) --[[ Line: 27 ]] --[[ Name: DragonFist ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.fist == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Dragon Fist") == true then
        local v15 = v2.GetM("Dragon Fist");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Dragon Fist") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.fist = true;
            _G.canuse = false;
            local v17 = l_Character_0.Humanoid:LoadAnimation(script.fist);
            v17:Play();
            v17:AdjustWeight(2);
            v17:AdjustSpeed(1);
            l_Character_0.Humanoid.WalkSpeed = 4;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Dragon Fist", l_Character_0.PrimaryPart.CFrame);
            local v19 = tick();
            repeat
                game["Run Service"].RenderStepped:Wait();
                l_Character_0.Humanoid.WalkSpeed = 4;
            until tick() - v19 >= 1;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.mouseLevel = false;
            _G.keysetup:cooldown("Dragon Fist", l_cd_0);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.fist = false;
        end;
    end;
end;
v6.DragonBreath = function(v20, _) --[[ Line: 69 ]] --[[ Name: DragonBreath ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.breath == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Dragon Breath") == true then
        local v25 = v2.GetM("Dragon Breath");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Dragon Breath") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            local v27, _, _ = _G.getRayFloor(l_Character_1.PrimaryPart.CFrame, 5);
            if v27 == nil then
                return nil;
            else
                l_Cooldowns_1.breath = true;
                _G.canuse = false;
                local v30 = l_Character_1.Humanoid:LoadAnimation(script.breath);
                v30:Play();
                v30:AdjustWeight(2);
                v30:AdjustSpeed(1);
                l_Character_1.Humanoid.WalkSpeed = 0;
                l_Character_1.PrimaryPart.Anchored = true;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Dragon Breath", l_Character_1.PrimaryPart.CFrame);
                local v32 = tick();
                repeat
                    game["Run Service"].RenderStepped:Wait();
                    l_Character_1.Humanoid.Jump = false;
                    l_Character_1.Humanoid.WalkSpeed = 0;
                until tick() - v32 >= 3;
                l_Character_1.PrimaryPart.Anchored = false;
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.mouseLevel = false;
                _G.keysetup:cooldown("Dragon Breath", l_cd_1);
                _G.canuse = true;
                _G.fw(l_cd_1);
                l_Cooldowns_1.breath = false;
            end;
        end;
    end;
end;
v6.DragonSkullCrusher = function(v33, v34) --[[ Line: 119 ]] --[[ Name: DragonSkullCrusher ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v33.Cooldowns;
    local v36 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.ult == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Dragon Skull Crusher") == true then
        local v38 = v2.GetM("Dragon Skull Crusher");
        local l_cd_2 = v38.cd;
        if _G.StamCheck("Dragon Skull Crusher") == false then
            return;
        elseif v38.statreq and _G.MeetReq(v38.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_2.ult = true;
            local v40 = l_Character_2.Humanoid:LoadAnimation(script.ultgrab);
            v40:Play();
            v40:AdjustWeight(2);
            _G.canuse = false;
            local v41 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dragon Skull Crusher", {
                cf = l_Character_2.HumanoidRootPart.CFrame
            });
            l_Character_2.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v40, 0.4, 1);
            local v42 = tick();
            v33:ChargeSkill(v34, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 150 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 154 ]] --[[ Name: endFunction ]]
                    -- upvalues: v42 (copy), l_Character_2 (copy), v36 (copy)
                    if tick() - v42 >= 10 or l_Character_2:FindFirstChild(script.Name) == nil or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v36.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v40:AdjustSpeed(1);
            if v41 then
                v41:FireServer(l_Character_2.PrimaryPart.CFrame);
            end;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Dragon Skull Crusher", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.ult = false;
        end;
    end;
end;
v6.DragonRush = function(v43, v44) --[[ Line: 178 ]] --[[ Name: DragonRush ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v43.Cooldowns;
    local v46 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.rush == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Dragon Rush") == true then
        local v48 = v2.GetM("Dragon Rush");
        local l_cd_3 = v48.cd;
        if _G.StamCheck("Dragon Rush") == false then
            return;
        elseif v48.statreq and _G.MeetReq(v48.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_3.rush = true;
            local v50 = l_Character_3.Humanoid:LoadAnimation(script.rushgrab);
            v50:Play();
            v50:AdjustWeight(2);
            _G.canuse = false;
            l_Character_3.Humanoid.WalkSpeed = 4;
            local v51 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dragon Rush", {
                cf = l_Character_3.HumanoidRootPart.CFrame
            });
            _G.PauseAnim(v50, 0.3, 1);
            local v52 = tick();
            v43:ChargeSkill(v44, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 209 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 213 ]] --[[ Name: endFunction ]]
                    -- upvalues: v52 (copy), l_Character_3 (copy), v46 (copy)
                    if tick() - v52 >= 10 or l_Character_3:FindFirstChild(script.Name) == nil or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v46.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v50:AdjustSpeed(1);
            local v53 = Instance.new("BodyVelocity", l_Character_3.HumanoidRootPart);
            v53.MaxForce = Vector3.new(100000, 0, 100000, 0);
            v53.Velocity = l_Character_3.HumanoidRootPart.CFrame.lookVector * 100;
            _G.destroy(v53, 0.15);
            if v51 then
                v51:FireServer("sfx");
            end;
            local _ = nil;
            local v55 = false;
            local function v57(v56) --[[ Line: 235 ]] --[[ Name: hitfound ]]
                -- upvalues: v53 (copy), l_Character_3 (copy), v51 (copy)
                v53:Destroy();
                l_Character_3.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                if v51 then
                    v51:FireServer({
                        cf = l_Character_3.PrimaryPart.CFrame, 
                        Target = v56.Parent
                    });
                end;
            end;
            do
                local l_v55_0 = v55;
                local function v59() --[[ Line: 243 ]] --[[ Name: hitinter ]]
                    -- upvalues: v53 (copy), l_v55_0 (ref), v50 (copy)
                    v53:Destroy();
                    l_v55_0 = true;
                    v50:Stop();
                end;
                _G.hitbox:start(l_Character_3, Vector3.new(8, 5, 12, 0), 0.3, CFrame.new(0, 0, -3), v57, v59);
                task.wait(0.3);
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Dragon Rush", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.rush = false;
            end;
        end;
    end;
end;
v6.ReverseDragon = function(v60, _) --[[ Line: 258 ]] --[[ Name: ReverseDragon ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v60.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.reverse == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Reverse Dragon") == true then
        local v65 = v2.GetM("Reverse Dragon");
        local l_cd_4 = v65.cd;
        if _G.StamCheck("Reverse Dragon") == false then
            return;
        elseif v65.statreq and _G.MeetReq(v65.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_4.reverse = true;
            local v67 = l_Character_4.Humanoid:LoadAnimation(script.counter);
            v67:Play();
            v67:AdjustWeight(2);
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Reverse Dragon", {
                cf = l_Character_4.HumanoidRootPart.CFrame
            });
            task.wait(1);
            v67:Stop();
            _G.canuse = true;
            _G.keysetup:cooldown("Reverse Dragon", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.reverse = false;
        end;
    end;
end;
v6.DragonClawSlashStance = function(_, v70, v71, v72) --[[ Line: 290 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_5 = v70.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_5 = l_LocalPlayer_0.Character;
    if _G.check:inspect(l_Character_5) == true then
        local v76 = "Dragon Claw Slash";
        if _G.StamCheck(v76) == false then
            return;
        else
            local v77 = tick();
            local v78 = tick();
            if v72 == nil or _G.mobile == nil then
                v70:ChargeSkill(v71, {
                    Key = Enum.KeyCode.T, 
                    EndFunction = function() --[[ Line: 310 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v78 (ref), v77 (copy)
                        v78 = tick() - v77;
                        return v78 > 0.25;
                    end, 
                    canUse = false
                });
            end;
            if tick() - v77 >= 0.25 then
                v76 = "Dragon Claw Stance";
            end;
            if v72 then
                v76 = v72;
            end;
            if _G.StamCheck(v76) == false or game.ReplicatedStorage:FindFirstChild("tradingHUB") then
                return;
            else
                local v79 = v2.GetM(v76);
                local l_cd_5 = v79.cd;
                if v79.statreq and _G.MeetReq(v79.statreq) == false then
                    return;
                elseif v76 == "Dragon Claw Stance" and (l_Cooldowns_5.mode == true or l_Character_5:findFirstChild("DragonClawStance") ~= nil) then
                    return;
                elseif v76 == "Dragon Claw Slash" and l_Cooldowns_5.triple == true then
                    return;
                else
                    _G.canuse = false;
                    if v76 == "Dragon Claw Stance" then
                        l_Cooldowns_5.mode = true;
                        local v81 = l_Character_5.Humanoid:LoadAnimation(script.mode);
                        v81:Play();
                        v81:AdjustWeight(2);
                        l_Character_5.PrimaryPart.Anchored = true;
                        local _ = game.ReplicatedStorage.Events.Skill:InvokeServer(v76, {
                            cf = l_Character_5.HumanoidRootPart.CFrame
                        });
                        task.wait(0.75);
                        l_Character_5.PrimaryPart.Anchored = false;
                    else
                        l_Cooldowns_5.triple = true;
                        local v83 = l_Character_5.Humanoid:LoadAnimation(script.tripleslash);
                        v83:Play();
                        v83:AdjustWeight(2);
                        local v84 = game.ReplicatedStorage.Events.Skill:InvokeServer(v76, {
                            cf = l_Character_5.HumanoidRootPart.CFrame
                        });
                        if v84 then
                            v84:FireServer("start");
                            task.delay(0.3, function() --[[ Line: 362 ]]
                                -- upvalues: l_Character_5 (copy), v84 (copy)
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                                l_BodyVelocity_0.Parent = l_Character_5.HumanoidRootPart;
                                _G.destroy(l_BodyVelocity_0, 1);
                                v84:FireServer(nil, l_Character_5.PrimaryPart.CFrame);
                                repeat
                                    l_BodyVelocity_0.Velocity = l_Character_5.PrimaryPart.CFrame.LookVector * 20;
                                    task.wait();
                                until l_BodyVelocity_0.Parent == nil;
                            end);
                            task.delay(0.7, function() --[[ Line: 373 ]]
                                -- upvalues: v84 (copy), l_Character_5 (copy)
                                v84:FireServer(nil, l_Character_5.PrimaryPart.CFrame);
                            end);
                            task.delay(1.0666666666666667, function() --[[ Line: 376 ]]
                                -- upvalues: v84 (copy), l_Character_5 (copy)
                                v84:FireServer(nil, l_Character_5.PrimaryPart.CFrame);
                            end);
                            task.wait(1.75);
                        end;
                    end;
                    _G.canuse = true;
                    _G.keysetup:cooldown(v76, l_cd_5);
                    _G.fw(l_cd_5);
                    if v76 == "Dragon Claw Slash" then
                        l_Cooldowns_5.triple = false;
                    else
                        l_Cooldowns_5.mode = false;
                    end;
                    --[[ close >= 9 ]]
                end;
            end;
        end;
    end;
end;
v6.DragonClawStance = function(v86, v87) --[[ Line: 395 ]]
    warn(v86);
    v86:DragonClawSlashStance(v86, v87, "Dragon Claw Stance");
end;
v6.DragonClawSlash = function(v88, v89) --[[ Line: 401 ]]
    warn(v88);
    v88:DragonClawSlashStance(v88, v89, "Dragon Claw Slash");
end;
return v6;