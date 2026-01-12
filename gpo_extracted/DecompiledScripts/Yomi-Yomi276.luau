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
v8.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        roar = false, 
        chill = false, 
        ghost = false, 
        ass = false, 
        death = false, 
        run = false
    };
    return v10;
end;
v8.SoulKingRoar = function(v11, _) --[[ Line: 30 ]] --[[ Name: SoulKingRoar ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.roar == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Soul King Roar") == true then
        local v16 = v3.GetM("Soul King Roar");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Soul King Roar") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.roar = true;
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.ult);
            v18:Play();
            v18:AdjustSpeed(1);
            l_Character_0.HumanoidRootPart.Anchored = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul King Roar");
            task.wait(3);
            _G.canuse = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.keysetup:cooldown("Soul King Roar", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.roar = false;
        end;
    end;
end;
v8.ChillingSoul = function(v20, v21) --[[ Line: 64 ]] --[[ Name: ChillingSoul ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v24 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.chill == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Chilling Soul") == true then
        local v25 = v3.GetM("Chilling Soul");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Chilling Soul") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.chill = true;
            local v27 = l_Character_1.Humanoid:LoadAnimation(script.freeze);
            v27:Play();
            v27:AdjustSpeed(1);
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.canuse = false;
            local v28 = tick();
            _G.PauseAnim(v27, 0.28, 0.5);
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 98 ]] --[[ Name: endFunction ]]
                    -- upvalues: v28 (copy), v20 (copy), l_Character_1 (copy), v24 (copy)
                    if tick() - v28 >= 10 or v20.Tool.Parent ~= l_Character_1 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v24.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true, 
                CheckFunction = function() --[[ Line: 91 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_1) == false then
                        return false;
                    else
                        return;
                    end;
                end
            });
            v27:AdjustSpeed(1);
            task.wait(0.13999999999999996);
            if l_Character_1.Humanoid.FloorMaterial ~= Enum.Material.Air then
                game.ReplicatedStorage.Events.Skill:InvokeServer("Chilling Soul");
            end;
            task.wait(0.25);
            _G.canuse = true;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Chilling Soul", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.chill = false;
        end;
    end;
end;
v8.SoulForm = function(v29, v30) --[[ Line: 126 ]] --[[ Name: SoulForm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v29.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v33 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.ghost == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Soul Form") == true then
        local v34 = v3.GetM("Soul Form");
        local l_cd_2 = v34.cd;
        if _G.StamCheck("Soul Form") == false then
            return;
        elseif v34.statreq and _G.MeetReq(v34.statreq) == false then
            return;
        else
            l_Cooldowns_2.ghost = true;
            local l_Health_0 = l_Character_2.Humanoid.Health;
            local v37 = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Form");
            local v38 = tick();
            v29:ToggleSkill(v30, {
                Key = Enum.KeyCode.R, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 150 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Health_0 (copy), l_Character_2 (copy), v33 (copy), v38 (copy)
                    local v39 = true;
                    if l_Health_0 <= l_Character_2.Humanoid.Health then
                        v39 = true;
                        if v33.Stamina.Value > 0 then
                            v39 = tick() - v38 >= 15;
                        end;
                    end;
                    return v39;
                end
            });
            if v37 then
                v37:FireServer("keygo");
            end;
            task.wait(0.25);
            _G.canuse = true;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Soul Form", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.ghost = false;
        end;
    end;
end;
v8.SoulAssault = function(v40, _) --[[ Line: 168 ]] --[[ Name: SoulAssault ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v40.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.ass == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Soul Assault") == true then
        local v45 = v3.GetM("Soul Assault");
        local l_cd_3 = v45.cd;
        if _G.StamCheck("Soul Assault") == false then
            return;
        elseif v45.statreq and _G.MeetReq(v45.statreq) == false then
            return;
        else
            l_Cooldowns_3.ass = true;
            local _ = l_Character_3.Humanoid.Health;
            l_Character_3.Humanoid.WalkSpeed = 4;
            _G.canuse = false;
            local v48 = tick();
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Assault");
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.Velocity = l_Character_3.PrimaryPart.CFrame.LookVector * 8;
            l_BodyVelocity_0.MaxForce = Vector3.new(10000000, 10000000, 10000000, 0);
            l_BodyVelocity_0.Parent = l_Character_3.HumanoidRootPart;
            _G.destroy(l_BodyVelocity_0, 2);
            repeat
                task.wait();
                l_BodyVelocity_0.Velocity = l_Character_3.PrimaryPart.CFrame.LookVector * 8;
                l_Character_3.Humanoid.WalkSpeed = 4;
            until tick() - v48 >= 2.5;
            _G.canuse = true;
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Soul Assault", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.ass = false;
        end;
    end;
end;
v8.DeathDefied = function(v51, _) --[[ Line: 209 ]] --[[ Name: DeathDefied ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v51.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.death == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Death Defied") == true then
        local v56 = v3.GetM("Death Defied");
        local l_cd_4 = v56.cd;
        if _G.StamCheck("Death Defied") == false then
            return;
        elseif v56.statreq and _G.MeetReq(v56.statreq) == false then
            return;
        elseif l_Character_4:GetAttribute("yomiRevived") ~= nil and l_Character_4:GetAttribute("yomiRevived") ~= nil then
            _G.displayMessage("<Color=Red>Death Defied has already been casted!");
            return;
        else
            l_Cooldowns_4.death = true;
            local _ = l_Character_4.Humanoid.Health;
            local _ = tick();
            if l_Character_4:GetAttribute("yomiRevived") == nil then
                l_Character_4.Humanoid:LoadAnimation(script.revive):Play();
                l_Character_4.PrimaryPart.Anchored = true;
                _G.canuse = false;
                l_Character_4.Humanoid.WalkSpeed = 0;
            end;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Death Defied");
            task.wait(0.5);
            l_Character_4.PrimaryPart.Anchored = false;
            _G.canuse = true;
            l_Character_4.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Death Defied", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.death = false;
        end;
    end;
end;
v8.Skedaddle = function(v61, v62) --[[ Line: 253 ]] --[[ Name: Skedaddle ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v61.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v65 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.run == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Skedaddle") == true then
        local v66 = v3.GetM("Skedaddle");
        local l_cd_5 = v66.cd;
        if _G.StamCheck("Skedaddle") == false then
            return;
        elseif v66.statreq and _G.MeetReq(v66.statreq) == false then
            return;
        else
            l_Cooldowns_5.run = true;
            local v68 = tick();
            _G.canuse = false;
            local v69 = game.ReplicatedStorage.Events.Skill:InvokeServer("Skedaddle");
            local v70 = l_Character_5.Humanoid:LoadAnimation(script.run);
            v70:Play();
            v70.Priority = Enum.AnimationPriority.Action;
            local l_BodyVelocity_1 = Instance.new("BodyVelocity");
            l_BodyVelocity_1.MaxForce = Vector3.new(100000, 100000, 100000, 0);
            l_BodyVelocity_1.Parent = l_Character_5.HumanoidRootPart;
            v61:ToggleSkill(v62, {
                Key = Enum.KeyCode.T, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 287 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_5 (copy), l_BodyVelocity_1 (copy), v70 (copy), v65 (copy), v68 (copy), v69 (copy)
                    if _G.check:inspect(l_Character_5) == false then
                        return true;
                    else
                        local v72 = l_Character_5.Humanoid.Health / l_Character_5.Humanoid.MaxHealth;
                        l_BodyVelocity_1.Velocity = l_Character_5.PrimaryPart.CFrame.LookVector * (55 * v72);
                        l_Character_5.Humanoid.WalkSpeed = 35;
                        v70:AdjustSpeed(1 * v72);
                        _G.canuse = false;
                        if v65.Stamina.Value <= 0 then
                            return true;
                        else
                            local v73 = true;
                            if tick() - v68 < 30 then
                                v73 = true;
                                if v69 ~= nil then
                                    v73 = v69 and v69:IsDescendantOf(game) == false;
                                end;
                            end;
                            return v73;
                        end;
                    end;
                end
            });
            l_BodyVelocity_1:Destroy();
            v70:Stop();
            if v69 then
                v69:FireServer();
            end;
            _G.canuse = true;
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Skedaddle", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.run = false;
        end;
    end;
end;
return v8;