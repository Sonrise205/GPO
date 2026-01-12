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
        shiningkick = false, 
        ["Diamond Dash"] = false, 
        ["Diamond Defense"] = false, 
        ["Rock Toss"] = false, 
        ["Prismatic Lift"] = false
    };
    return v9;
end;
v7.DiamondKick = function(v10, v11) --[[ Line: 33 ]] --[[ Name: DiamondKick ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.canuse and not l_Cooldowns_0.shiningkick and _G.check:inspect(l_Character_0) then
        local v15 = v3.GetM("Diamond Kick");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Diamond Kick") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.shiningkick = true;
            _G.canuse = false;
            local v17 = game.ReplicatedStorage.Events.Skill:InvokeServer("Diamond Kick", l_Character_0.PrimaryPart.CFrame, "start");
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.kickStart);
            v18.Priority = Enum.AnimationPriority.Action4;
            v18:Play();
            _G.PauseAnim(v18, 0.233, 1);
            local v19 = tick();
            v10:ChargeSkill(v11, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 63 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 67 ]] --[[ Name: endFunction ]]
                    -- upvalues: v19 (copy), v10 (copy), l_Character_0 (copy), v14 (copy)
                    if tick() - v19 >= 10 or v10.Tool.Parent ~= l_Character_0 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1.2);
            if v17 then
                v17:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            task.wait(0.6);
            _G.keysetup:cooldown("Diamond Kick", l_cd_0);
            _G.canuse = true;
            l_Character_0.Humanoid.WalkSpeed = 16;
            l_Character_0.Humanoid.AutoRotate = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.shiningkick = false;
        end;
    end;
end;
v7.RockToss = function(v20, v21) --[[ Line: 97 ]] --[[ Name: RockToss ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local v23 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1["Rock Toss"] == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Rock Toss") == true then
        local v25 = v3.GetM("Rock Toss");
        local l_cd_1 = v25.cd;
        if v25.stamreq and v23.Stamina.Value < v25.stamreq then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1["Rock Toss"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v27 = game.ReplicatedStorage.Events.Skill:InvokeServer("Rock Toss", l_Character_1.PrimaryPart.CFrame, "start");
            local v28 = l_Character_1.Humanoid:LoadAnimation(script.rockToss);
            v28.Priority = Enum.AnimationPriority.Action4;
            v28:Play();
            _G.PauseAnim(v28, 1.25, 1.3);
            local v29 = tick();
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 128 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 0;
                end, 
                EndFunction = function() --[[ Line: 132 ]] --[[ Name: endFunction ]]
                    -- upvalues: v29 (copy), v20 (copy), l_Character_1 (copy), v23 (copy)
                    if tick() - v29 >= 10 or v20.Tool.Parent ~= l_Character_1 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v23.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v28:AdjustSpeed(1);
            _G.FaceMouse = false;
            _G.mouseLevel = nil;
            l_Character_1.PrimaryPart.Anchored = true;
            if v27 then
                v27:FireServer(l_Character_1.PrimaryPart.CFrame, v20:GetMouseCFrame());
            end;
            task.wait(0.8);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.keysetup:cooldown("Rock Toss", l_cd_1);
            _G.canuse = true;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.fw(l_cd_1);
            l_Cooldowns_1["Rock Toss"] = false;
        end;
    end;
end;
v7.PrismaticLift = function(v30, v31) --[[ Line: 162 ]] --[[ Name: PrismaticLift ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v30.Cooldowns;
    local v33 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2["Prismatic Lift"] == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Prismatic Lift") == true then
        local v35 = v3.GetM("Prismatic Lift");
        local l_cd_2 = v35.cd;
        if v35.stamreq and v33.Stamina.Value < v35.stamreq then
            return;
        elseif v35.statreq and _G.MeetReq(v35.statreq) == false then
            return;
        else
            l_Character_2.Humanoid.WalkSpeed = 0;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            l_Cooldowns_2["Prismatic Lift"] = true;
            local v37 = game.ReplicatedStorage.Events.Skill:InvokeServer("Prismatic Lift", l_Character_2.PrimaryPart.CFrame, "start");
            local v38 = l_Character_2.Humanoid:LoadAnimation(script.prismatic);
            v38.Priority = Enum.AnimationPriority.Action4;
            v38:Play();
            l_Character_2.Humanoid.AutoRotate = false;
            _G.PauseAnim(v38, 1.35, 1);
            l_Character_2.Humanoid.AutoRotate = true;
            _G.canuse = false;
            local v39 = tick();
            v30:ChargeSkill(v31, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 201 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 0;
                end, 
                EndFunction = function() --[[ Line: 205 ]] --[[ Name: endFunction ]]
                    -- upvalues: v39 (copy), v30 (copy), l_Character_2 (copy), v33 (copy)
                    if tick() - v39 >= 10 or v30.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v33.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v38:AdjustSpeed(1);
            if v37 then
                v37:FireServer(l_Character_2.PrimaryPart.CFrame, v30:GetMouseCFrame(), l_Character_2.LeftHand.CFrame * CFrame.new(0.1, -13, 7));
            end;
            task.wait(0.7);
            _G.FaceMouse = false;
            _G.mouseLevel = nil;
            _G.canuse = true;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Prismatic Lift", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2["Prismatic Lift"] = false;
        end;
    end;
end;
v7.DiamondDash = function(v40, v41) --[[ Line: 236 ]] --[[ Name: DiamondDash ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v40.Cooldowns;
    local v43 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3["Diamond Dash"] == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Diamond Dash") == true then
        local v45 = v3.GetM("Diamond Dash");
        local l_cd_3 = v45.cd;
        if v45.stamreq and v43.Stamina.Value < v45.stamreq then
            return;
        elseif v45.statreq and _G.MeetReq(v45.statreq) == false then
            return;
        else
            l_Cooldowns_3["Diamond Dash"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v47 = game.ReplicatedStorage.Events.Skill:InvokeServer("Diamond Dash", l_Character_3.PrimaryPart.CFrame, "start");
            local v48 = l_Character_3.Humanoid:LoadAnimation(script.windupcharge);
            v48.Priority = Enum.AnimationPriority.Action4;
            v48:Play();
            _G.PauseAnim(v48, 0.23, 1);
            local v49 = tick();
            v40:ChargeSkill(v41, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 267 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 270 ]] --[[ Name: endFunction ]]
                    -- upvalues: v49 (copy), v40 (copy), l_Character_3 (copy), v43 (copy)
                    if tick() - v49 >= 3 or v40.Tool.Parent ~= l_Character_3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v43.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v48:Stop();
            local v50 = l_Character_3.Humanoid:LoadAnimation(script.dashLoop);
            v50.Priority = Enum.AnimationPriority.Action4;
            v50:Play();
            _G.FaceMouse = false;
            if v47 then
                v47:InvokeServer(v40:GetMouseCFrame());
            end;
            task.wait(0.1);
            v50:Stop();
            _G.keysetup:cooldown("Diamond Dash", l_cd_3);
            _G.canuse = true;
            l_Character_3.HumanoidRootPart.Anchored = false;
            _G.fw(l_cd_3);
            l_Cooldowns_3["Diamond Dash"] = false;
        end;
    end;
end;
v7.DiamondDefense = function(v51, v52) --[[ Line: 304 ]] --[[ Name: DiamondDefense ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v51.Cooldowns;
    local v54 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4["Diamond Defense"] == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Diamond Defense") == true then
        local v56 = v3.GetM("Diamond Defense");
        local l_cd_4 = v56.cd;
        if v56.stamreq and v54.Stamina.Value < v56.stamreq then
            return;
        elseif v56.statreq and _G.MeetReq(v56.statreq) == false then
            return;
        else
            local l_Tool_0 = v51.Tool;
            if l_Tool_0 == nil then
                return;
            elseif (l_Character_4:GetAttribute(l_Tool_0:GetAttribute("damageName")) or 0) < l_Tool_0:GetAttribute("modePercent") * require(game.ReplicatedStorage.Modules.Skills.Modes.Kira)(l_LocalPlayer_0) then
                _G.displayMessage((("<Color=Red>I need <Color=/>%*%% bar<Color=Red> to use this skill!"):format(l_Tool_0:GetAttribute("modePercent") * 100)));
                return;
            else
                _G.canuse = false;
                l_Cooldowns_4["Diamond Defense"] = true;
                local v59 = l_Character_4.Humanoid:LoadAnimation(script.defenseStartup);
                v59:Play();
                v59.Priority = Enum.AnimationPriority.Action2;
                task.wait(0.35);
                local v60 = false;
                local v61 = game.ReplicatedStorage.Events.Skill:InvokeServer("Diamond Defense", l_Character_4.PrimaryPart.CFrame);
                do
                    local l_v60_0 = v60;
                    v51:DoubleCastSkill(v52, {
                        Key = Enum.KeyCode.X, 
                        SkipTap = true, 
                        CompleteFunction = function() --[[ Line: 347 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: l_v60_0 (ref)
                            l_v60_0 = true;
                        end, 
                        PassFunction = function() --[[ Line: 350 ]] --[[ Name: PassFunction ]]
                            -- upvalues: l_Tool_0 (copy), l_Character_4 (copy)
                            return l_Tool_0.Parent == l_Character_4;
                        end
                    });
                    _G.canuse = true;
                    repeat
                        task.wait();
                    until l_v60_0 == true or l_Character_4:GetAttribute("DiamondDefense") == nil;
                    if v61 then
                        v61:FireServer();
                    end;
                    _G.keysetup:cooldown("Diamond Defense", l_cd_4);
                    _G.fw(l_cd_4);
                    l_Cooldowns_4["Diamond Defense"] = false;
                end;
            end;
        end;
    end;
end;
return v7;