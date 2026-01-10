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
        smash = false, 
        pound = false
    };
    return v10;
end;
v8.EloSmash = function(v11, v12) --[[ Line: 28 ]] --[[ Name: EloSmash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.smash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Elo Smash");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Elo Smash") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.smash);
            v18:Play();
            v18:AdjustWeight(2);
            l_Character_0.Humanoid.WalkSpeed = 4;
            l_Cooldowns_0.smash = true;
            _G.canuse = false;
            _G.PauseAnim(v18, 0.35, 1);
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 52 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 61 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Elo Smash");
            task.wait(0.15);
            if v19 then
                local v20 = nil;
                v20 = if l_Character_0:FindFirstChild("Elo's SledgehammerSword") then l_Character_0:FindFirstChild("Elo's SledgehammerSword").Blade.CFrame else l_Character_0.HumanoidRootPart.CFrame;
                v19:FireServer({
                    cf = l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, 0, -7)
                });
            end;
            task.wait(0.15);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Elo Smash", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.smash = false;
        end;
    end;
end;
v8.PoundingFestival = function(v21, v22) --[[ Line: 96 ]] --[[ Name: PoundingFestival ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.pound == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Pounding Festival");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Pounding Festival") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28 = l_Character_1.Humanoid.Animator:LoadAnimation(script.pound);
            v28:Play();
            v28:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            l_Cooldowns_1.pound = true;
            _G.canuse = false;
            _G.PauseAnim(v28, 0.25, 1);
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 120 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v28 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        v28:Stop();
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 129 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v28:AdjustSpeed(1);
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            l_BodyVelocity_0.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 25;
            l_BodyVelocity_0.Parent = l_Character_1.HumanoidRootPart;
            _G.destroy(l_BodyVelocity_0, 0.25);
            task.wait(0.22499999999999998);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Pounding Festival", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            task.wait(0.15);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Pounding Festival", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.pound = false;
        end;
    end;
end;
return v8;