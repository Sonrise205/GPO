local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local _ = game:GetService("ReplicatedStorage");
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
        JitteStrike = false, 
        jitteLeap = false
    };
    return v10;
end;
v8.JitteStrike = function(v11, v12) --[[ Line: 28 ]] --[[ Name: JitteStrike ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.JitteStrike == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Jitte Strike");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Jitte Strike") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.JitteStrike = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.strikeWindup);
            v18:Play(0);
            v18:AdjustWeight(2);
            _G.PauseAnim(v18, 0.3, 1.3);
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 56 ]] --[[ Name: endFunction2 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                end, 
                IgnoreInstantCastSetting = true
            });
            v18:AdjustSpeed(1.3);
            task.wait(0.11538461538461538);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Jitte Strike", {
                cf = l_Character_0.HumanoidRootPart.CFrame
            });
            l_Character_0.Humanoid.WalkSpeed = 16;
            l_Character_0.Humanoid.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Jitte Strike", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.JitteStrike = false;
        end;
    end;
end;
v8.JitteLeap = function(v20, v21) --[[ Line: 81 ]] --[[ Name: JitteLeap ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.jitteLeap == false and _G.check:inspect(l_Character_1) == true then
        local v25 = v3.GetM("Jitte Leap");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Jitte Leap") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.jitteLeap = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v27 = l_Character_1.Humanoid.Animator:LoadAnimation(script.strikeWindup);
            v27:Play(0);
            v27:AdjustWeight(2);
            _G.PauseAnim(v27, 0.3, 1);
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 109 ]] --[[ Name: endFunction2 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                IgnoreInstantCastSetting = true
            });
            v27:AdjustSpeed(1);
            if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Stats.DF.Value == "Smoke-Smoke" then
                l_Character_1.Humanoid.WalkSpeed = 45;
            else
                l_Character_1.Humanoid.WalkSpeed = 30;
            end;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Jitte Leap", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            v27:Stop(0);
            l_Character_1.Humanoid.WalkSpeed = 16;
            l_Character_1.Humanoid.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Jitte Leap", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.jitteLeap = false;
        end;
    end;
end;
return v8;