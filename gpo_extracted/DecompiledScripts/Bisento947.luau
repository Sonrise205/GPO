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
        sweep = false
    };
    return v10;
end;
v8.ShockwaveSlash = function(v11, v12) --[[ Line: 28 ]] --[[ Name: ShockwaveSlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Shockwave Slash");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Shockwave Slash") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.smash);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Shockwave Slash");
            _G.PauseAnim(v18, 0.4, 0.30250000000000005);
            local v20 = tick();
            local v21 = false;
            local function v22() --[[ Line: 55 ]] --[[ Name: checkFunction ]]

            end;
            do
                local l_v21_0 = v21;
                local function v24() --[[ Line: 62 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy), v19 (copy), l_v21_0 (ref), v15 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v20 >= 10 then
                        return true;
                    else
                        if v19 and l_v21_0 == false and v15.Stats.DF.Value == "Gura-Gura" and tick() - v20 >= 2 then
                            l_v21_0 = true;
                            v19:FireServer("charged");
                        end;
                        return;
                    end;
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v22, 
                    EndFunction = v24, 
                    IgnoreInstantCastSetting = true
                });
                _G.FaceMouse = false;
                _G.mouseLevel = false;
                v18:AdjustSpeed(1);
                l_Character_0.HumanoidRootPart.Anchored = true;
                task.wait(0.25);
                if v19 then
                    v19:FireServer(l_Character_0.HumanoidRootPart.CFrame, l_Character_0:FindFirstChild("BisentoSword") and l_Character_0:FindFirstChild("BisentoSword").Blade.CFrame or l_Character_0.HumanoidRootPart.CFrame);
                end;
                task.wait(0.4);
                l_Character_0.HumanoidRootPart.Anchored = false;
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Shockwave Slash", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.spin = false;
            end;
        end;
    end;
end;
v8.HeavySweep = function(v25, v26) --[[ Line: 98 ]] --[[ Name: HeavySweep ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v25.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sweep == false and _G.check:inspect(l_Character_1) == true then
        local v30 = v3.GetM("Heavy Sweep");
        local l_cd_1 = v30.cd;
        if _G.StamCheck("Heavy Sweep") == false then
            return;
        elseif v30.statreq and _G.MeetReq(v30.statreq) == false then
            return;
        else
            local v32 = l_Character_1.Humanoid.Animator:LoadAnimation(script.windup);
            v32:Play();
            v32:AdjustWeight(2);
            v32:AdjustSpeed(0.75);
            l_Cooldowns_1.sweep = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v32, 0.65, 0.9);
            v32:Stop();
            local v33 = l_Character_1.Humanoid.Animator:LoadAnimation(script.loop);
            v33:Play();
            v33:AdjustSpeed(2);
            local v34 = game.ReplicatedStorage.Events.Skill:InvokeServer("Heavy Sweep");
            local v35 = tick();
            v25:ChargeSkill(v26, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 130 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 138 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v35 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v35 >= 3 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v33:Stop();
            if v34 then
                v34:FireServer();
            end;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Heavy Sweep", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.sweep = false;
        end;
    end;
end;
return v8;