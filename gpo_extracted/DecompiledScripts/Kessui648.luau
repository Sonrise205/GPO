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
v8.KessuiBarrage = function(v11, v12) --[[ Line: 28 ]] --[[ Name: KessuiBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Kessui Barrage");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Kessui Barrage") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.Anims.Startup);
            v18:Play();
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Kessui Barrage");
            _G.PauseAnim(v18, 0.8, 1);
            v18:Stop();
            local v20 = l_Character_0.Humanoid.Animator:LoadAnimation(script.Anims.Loop);
            v20:Play();
            v20:AdjustWeight(2);
            v20.Priority = Enum.AnimationPriority.Action4;
            local v21 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 58 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 63 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v21 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v21 >= 2 then
                        return true;
                    elseif _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            if v19 then
                v19:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            v20:Stop();
            local v22 = l_Character_0.Humanoid.Animator:LoadAnimation(script.Anims.Dash);
            v22:Play();
            v22:AdjustWeight(2);
            v22.Priority = Enum.AnimationPriority.Action2;
            task.wait(0.4);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Kessui Barrage", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.spin = false;
        end;
    end;
end;
v8.KessuiIgnite = function(v23, _) --[[ Line: 97 ]] --[[ Name: KessuiIgnite ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sweep == false and _G.check:inspect(l_Character_1) == true then
        local v28 = v3.GetM("Kessui Ignite");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Kessui Ignite") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            local v30 = l_Character_1.Humanoid.Animator:LoadAnimation(script.windup);
            v30:Play();
            v30:AdjustWeight(2);
            v30:AdjustSpeed(0.75);
            l_Cooldowns_1.sweep = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Kessui Ignite");
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Kessui Ignite", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.sweep = false;
        end;
    end;
end;
return v8;