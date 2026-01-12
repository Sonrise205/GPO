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
        spin = false, 
        smash = false
    };
    return v10;
end;
v8.BoneFrenzy = function(v11, v12) --[[ Line: 28 ]] --[[ Name: BoneFrenzy ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Bone Frenzy");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Bone Frenzy") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.windup);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Bone Frenzy");
            _G.PauseAnim(v18, 0.5, 1.5);
            v18:Stop();
            local v20 = l_Character_0.Humanoid.Animator:LoadAnimation(script.loop);
            v20:Play();
            v20:AdjustSpeed(2);
            local v21 = tick();
            local v22 = Instance.new("BodyVelocity", l_Character_0.HumanoidRootPart);
            v22.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 61 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v15 (copy), v20 (copy), v22 (copy)
                    if _G.check:inspect(l_Character_0) == false or v15.Stamina.Value <= 0 then
                        v20:Stop();
                        return true;
                    else
                        v22.Velocity = l_Character_0.HumanoidRootPart.CFrame.lookVector * 35;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 70 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v21 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v21 >= 3 or l_Character_0:FindFirstChild("Stun") then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v22:Destroy();
            v20:Stop();
            if v19 then
                v19:FireServer();
            end;
            task.wait(0.3);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Bone Frenzy", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.spin = false;
        end;
    end;
end;
v8.RibSmash = function(v23, v24) --[[ Line: 98 ]] --[[ Name: RibSmash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v27 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.smash == false and _G.check:inspect(l_Character_1) == true then
        local v28 = v3.GetM("Rib Smash");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Rib Smash") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            local v30 = l_Character_1.Humanoid.Animator:LoadAnimation(script.smashStart);
            v30:Play();
            v30:AdjustWeight(2);
            l_Cooldowns_1.smash = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Rib Smash");
            _G.PauseAnim(v30, 0.325, 1);
            local v32 = tick();
            v23:ChargeSkill(v24, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 125 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v27 (copy), v30 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_1) == false or v27.Stamina.Value <= 0 then
                        v30:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 134 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v32 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v32 >= 3 or l_Character_1:FindFirstChild("Stun") then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v30:AdjustSpeed(1);
            if v31 then
                v31:FireServer(l_Character_1.PrimaryPart.CFrame);
            end;
            task.wait(0.85);
            _G.canuse = true;
            _G.keysetup:cooldown("Rib Smash", l_cd_1);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.fw(l_cd_1);
            l_Cooldowns_1.smash = false;
        end;
    end;
end;
return v8;