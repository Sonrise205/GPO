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
        pull = false, 
        impale = false
    };
    return v10;
end;
v8.PitchforkImpale = function(v11, v12) --[[ Line: 28 ]] --[[ Name: PitchforkImpale ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.pull == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Pitchfork Impale");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Pitchfork Impale") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.pull);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.pull = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v18, 0.12, 0.75);
            local v19 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 55 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 62 ]] --[[ Name: endFunction ]]
                    -- upvalues: v19 (copy), l_Character_0 (copy)
                    if tick() - v19 >= 6 or l_Character_0:FindFirstChild("Stun") then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Pitchfork Impale", l_Character_0.PrimaryPart.CFrame);
            l_Character_0.Humanoid.WalkSpeed = 16;
            task.wait(0.2);
            _G.canuse = true;
            _G.keysetup:cooldown("Pitchfork Impale", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.pull = false;
        end;
    end;
end;
v8.PitchforkDance = function(v20, v21) --[[ Line: 85 ]] --[[ Name: PitchforkDance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.impale == false and _G.check:inspect(l_Character_1) == true then
        local v25 = v3.GetM("Pitchfork Dance");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Pitchfork Dance") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            local v27 = l_Character_1.Humanoid.Animator:LoadAnimation(script.windup);
            v27:Play();
            v27:AdjustWeight(2);
            l_Cooldowns_1.impale = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v27, 0.25, 0.75);
            v27:Stop();
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Pitchfork Dance", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            local v29 = l_Character_1.Humanoid.Animator:LoadAnimation(script.loop);
            v29:Play();
            v29:AdjustWeight(2);
            v29:AdjustSpeed(2);
            local v30 = tick();
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 117 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 124 ]] --[[ Name: endFunction ]]
                    -- upvalues: v28 (copy), l_Character_1 (copy), v30 (copy)
                    if v28 == nil or l_Character_1:FindFirstChild(script.Name) == nil or tick() - v30 >= 2 or l_Character_1:FindFirstChild("Stun") then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v29:Stop();
            if v28 then
                v28:FireServer();
            end;
            task.wait(0.45);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Pitchfork Dance", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.impale = false;
        end;
    end;
end;
return v8;