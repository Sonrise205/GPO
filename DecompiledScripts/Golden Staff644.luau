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
        sweep = false, 
        counter = false, 
        trans = false
    };
    return v10;
end;
v8.RapidThrust = function(v11, v12) --[[ Line: 33 ]] --[[ Name: RapidThrust ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Rapid Thrust");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Rapid Thrust") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.windup);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v18, 0.5, 1.5);
            v18:Stop();
            local v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.loop);
            v19:Play();
            v19:AdjustSpeed(1);
            local v20 = game.ReplicatedStorage.Events.Skill:InvokeServer("Rapid Thrust");
            local v21 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 64 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v19 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v19:Stop();
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 73 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v21 (copy), v15 (copy)
                    if not l_Character_0:FindFirstChild("Golden Staff") or tick() - v21 >= 1 or l_Character_0:FindFirstChild("Stun") or v15.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_0.Humanoid.WalkSpeed = 16;
            if v20 then
                v20:FireServer();
            end;
            v19:Stop();
            _G.keysetup:cooldown("Rapid Thrust", l_cd_0);
            task.wait(0.5);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.spin = false;
        end;
    end;
end;
v8.GoldenSweep = function(v22, v23) --[[ Line: 101 ]] --[[ Name: GoldenSweep ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v22.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v26 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sweep == false and _G.check:inspect(l_Character_1) == true then
        local v27 = v3.GetM("Golden Sweep");
        local l_cd_1 = v27.cd;
        if _G.StamCheck("Golden Sweep") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            local v29 = l_Character_1.Humanoid.Animator:LoadAnimation(script.sweepwind);
            v29:Play();
            v29:AdjustWeight(2);
            l_Cooldowns_1.sweep = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v29, 0.6, 1.2);
            v29:Stop();
            local v30 = l_Character_1.Humanoid.Animator:LoadAnimation(script.sweeploop);
            v30:Play();
            v30:AdjustSpeed(1);
            local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Sweep");
            local v32 = tick();
            v22:ChargeSkill(v23, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 132 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v30 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        v30:Stop();
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 141 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v32 (copy), v26 (copy)
                    if not l_Character_1:FindFirstChild("Golden Staff") or tick() - v32 >= 4 or l_Character_1:FindFirstChild("Stun") or v26.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_1.Humanoid.WalkSpeed = 16;
            if v31 then
                v31:FireServer();
            end;
            _G.keysetup:cooldown("Golden Sweep", l_cd_1);
            v30:Stop();
            task.wait(0.5);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.sweep = false;
        end;
    end;
end;
v8.PoleCounter = function(v33) --[[ Line: 178 ]] --[[ Name: PoleCounter ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v33.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.counter == false and _G.check:inspect(l_Character_2) == true then
        local v37 = v3.GetM("Pole Counter");
        local l_cd_2 = v37.cd;
        if _G.StamCheck("Pole Counter") == false then
            return;
        elseif v37.statreq and _G.MeetReq(v37.statreq) == false then
            return;
        else
            l_Cooldowns_2.counter = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Pole Counter");
            local v39 = tick();
            while true do
                l_Character_2.Humanoid.WalkSpeed = 0;
                l_Character_2.Humanoid.Jump = false;
                if not l_Character_2:FindFirstChild("counter") then
                    game["Run Service"].RenderStepped:Wait();
                    if tick() - v39 >= 2 then
                        break;
                    end;
                else
                    break;
                end;
            end;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Pole Counter", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.counter = false;
        end;
    end;
end;
v8.GoldenStaffTransform = function(v40) --[[ Line: 216 ]] --[[ Name: GoldenStaffTransform ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v40.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v43 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.trans == false and _G.check:inspect(l_Character_3) == true then
        local v44 = v3.GetM("Golden Staff Transform");
        local l_cd_3 = v44.cd;
        if _G.StamCheck("Golden Staff Transform") == false then
            return;
        elseif v44.statreq and _G.MeetReq(v44.statreq) == false then
            return;
        elseif v43.Stats.DF.Value ~= "Goro-Goro" and v43.Stats.DF.Value ~= "Goru-Goru" and v43.Customization.Race.Value:match("mink") == nil then
            return;
        else
            l_Cooldowns_3.trans = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Staff Transform");
            local _ = l_Character_3:FindFirstChild("Golden StaffSword");
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Golden Staff Transform", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.trans = false;
        end;
    end;
end;
return v8;