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
        slash = false, 
        triple = false
    };
    return v10;
end;
v8.CrescentSlash = function(v11, v12) --[[ Line: 28 ]] --[[ Name: CrescentSlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.slash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Crescent Slash");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Crescent Slash") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.slash);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.slash = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Crescent Slash");
            _G.PauseAnim(v18, 0.4, 2);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 55 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.AutoRotate = false;
                end, 
                EndFunction = function() --[[ Line: 60 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v20 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            task.wait(0.15);
            _G.FaceMouse = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            l_Character_0.Humanoid.AutoRotate = false;
            if v19 then
                v19:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            v18:AdjustSpeed(1);
            task.wait(0.35);
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Crescent Slash", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.slash = false;
        end;
    end;
end;
v8.TripleRipple = function(v21, v22) --[[ Line: 95 ]] --[[ Name: TripleRipple ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.triple == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Triple Ripple");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Triple Ripple") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28 = l_Character_1.Humanoid.Animator:LoadAnimation(script.triple);
            v28:Play();
            v28:AdjustWeight(2);
            l_Cooldowns_1.triple = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v29 = game.ReplicatedStorage.Events.Skill:InvokeServer("Triple Ripple");
            _G.PauseAnim(v28, 0.35, 1);
            local v30 = tick();
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 123 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 127 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v30 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v30 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v28:AdjustSpeed(1);
            if v29 then
                l_Character_1.Humanoid.AutoRotate = false;
                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                l_BodyVelocity_0.Velocity = l_Character_1.PrimaryPart.CFrame.LookVector * 40;
                l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                l_BodyVelocity_0.Parent = l_Character_1.HumanoidRootPart;
                _G.destroy(l_BodyVelocity_0, 0.6);
                v29:FireServer("start", l_Character_1.PrimaryPart.CFrame);
                v29:FireServer("slash", l_Character_1.PrimaryPart.CFrame);
                task.wait(0.15);
                v29:FireServer("slash", l_Character_1.PrimaryPart.CFrame);
                task.wait(0.33);
                v29:FireServer("slash", l_Character_1.PrimaryPart.CFrame);
            end;
            task.wait(0.3);
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Triple Ripple", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.triple = false;
        end;
    end;
end;
return v8;