local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        floor = false, 
        nado = false
    };
    return v10;
end;
v8.ExplosiveField = function(v11, v12) --[[ Line: 28 ]] --[[ Name: ExplosiveField ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.floor == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Explosive Field");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Explosive Field") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18, _, _ = _G.getRayFloor(l_Character_0.PrimaryPart.CFrame, 5);
            if v18 == nil then
                return nil;
            else
                local v21 = l_Character_0.Humanoid.Animator:LoadAnimation(script.floor);
                v21:Play();
                v21:AdjustWeight(2);
                l_Cooldowns_0.floor = true;
                _G.canuse = false;
                _G.mouseLevel = true;
                _G.FaceMouse = true;
                local v22 = game.ReplicatedStorage.Events.Skill:InvokeServer("Explosive Field");
                _G.PauseAnim(v21, 0.2, 0.9750000000000001);
                local v23 = tick();
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = function() --[[ Line: 58 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_0 (copy), v21 (copy)
                        if _G.check:inspect(l_Character_0) == false then
                            v21:Stop();
                            return true;
                        else
                            return;
                        end;
                    end, 
                    EndFunction = function() --[[ Line: 65 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_0 (copy), v23 (copy)
                        if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v23 >= 10 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                _G.mouseLevel = false;
                _G.FaceMouse = false;
                l_Character_0.HumanoidRootPart.Anchored = true;
                l_Character_0.Humanoid.AutoRotate = false;
                task.wait(0.16);
                l_Character_0.Humanoid.AutoRotate = false;
                v21:AdjustSpeed(1);
                if v22 then
                    if _G.check:inspect(l_Character_0) == true then
                        v22:FireServer(l_Character_0.PrimaryPart.CFrame);
                    else
                        v22:FireServer(nil);
                    end;
                end;
                task.wait(1);
                l_Character_0.Humanoid.AutoRotate = true;
                l_Character_0.HumanoidRootPart.Anchored = false;
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Explosive Field", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.floor = false;
            end;
        end;
    end;
end;
v8.SUPERMEGADEATHROCKET = function(v24, v25) --[[ Line: 106 ]] --[[ Name: SUPERMEGADEATHROCKET ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v24.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.nado == false and _G.check:inspect(l_Character_1) == true then
        local v29 = v3.GetM("SUPER MEGA DEATH ROCKET");
        local l_cd_1 = v29.cd;
        if _G.StamCheck("SUPER MEGA DEATH ROCKET") == false then
            return;
        elseif v29.statreq and _G.MeetReq(v29.statreq) == false then
            return;
        elseif (l_Character_1:GetAttribute("rocketBladeDamage") or 0) < require(game.ReplicatedStorage.Modules.Skills.Modes["Inferno Rocket Blade"])(l_LocalPlayer_0) * 0.2 then
            _G.displayMessage("<Color=Red>You dont have enough damage pool yet! (20%)");
            return;
        else
            local v31 = l_Character_1.Humanoid.Animator:LoadAnimation(script.aim);
            if script:GetAttribute("Prestige") then
                v31 = l_Character_1.Humanoid.Animator:LoadAnimation(script.aimPrestige);
            end;
            v31:Play();
            v31:AdjustWeight(2);
            l_Cooldowns_1.nado = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v32 = game.ReplicatedStorage.Events.Skill:InvokeServer("SUPER MEGA DEATH ROCKET");
            l_Character_1.Humanoid.WalkSpeed = 4;
            task.wait(0.8);
            v31:Stop();
            v31 = l_Character_1.Humanoid.Animator:LoadAnimation(script.charge);
            v31:Play();
            v31.Priority = Enum.AnimationPriority.Action3;
            v31:AdjustWeight(2);
            local v33 = tick();
            v24:ChargeSkill(v25, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 148 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 152 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v33 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v33 >= 25 or l_Character_1.Parent == workspace.Ragdolls then
                        return true;
                    else
                        local l_l_Character_1_Attribute_0 = l_Character_1:GetAttribute("rocketBladeDamage");
                        if l_l_Character_1_Attribute_0 and l_l_Character_1_Attribute_0 <= 0 or l_l_Character_1_Attribute_0 == nil then
                            return true;
                        else
                            return;
                        end;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            do
                local l_v31_0 = v31;
                task.delay(0.1, function() --[[ Line: 169 ]]
                    -- upvalues: l_v31_0 (ref), l_Character_1 (copy)
                    l_v31_0:Stop();
                    l_v31_0 = l_Character_1.Humanoid.Animator:LoadAnimation(script.fire);
                    l_v31_0:Play();
                    l_v31_0:AdjustWeight(2);
                end);
                _G.FaceMouse = false;
                l_Character_1.PrimaryPart.Anchored = true;
                if v32 then
                    v32:FireServer({
                        Target = _G.getTargetNearMouse(300), 
                        cf = v24:GetMouseCFrame(), 
                        hrpCF = l_Character_1.HumanoidRootPart.CFrame
                    });
                end;
                task.wait(1);
                l_Character_1.PrimaryPart.Anchored = false;
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("SUPER MEGA DEATH ROCKET", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.nado = false;
            end;
        end;
    end;
end;
return v8;