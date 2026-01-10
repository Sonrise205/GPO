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
        frenzy = false
    };
    return v10;
end;
v8.GravityField = function(v11, v12) --[[ Line: 28 ]] --[[ Name: GravityField ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Gravity Field");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Gravity Field") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.field);
            v18:Play();
            v18:AdjustWeight(4);
            _G.PauseAnim(v18, 0.4, 1);
            local v19 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 53 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 57 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v19 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v19 >= 3 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            v18:AdjustSpeed(1);
            task.wait(0.1);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Gravity Field", {
                cf = v11:GetMouseCFrame()
            });
            task.wait(0.2);
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Gravity Field", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.spin = false;
        end;
    end;
end;
v8.GravityFrenzy = function(v21, v22) --[[ Line: 85 ]] --[[ Name: GravityFrenzy ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.frenzy == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Gravity Frenzy");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Gravity Frenzy") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28 = l_Character_1.Humanoid.Animator:LoadAnimation(script.windup);
            v28:Play();
            v28:AdjustSpeed(0.75);
            l_Character_1.Humanoid.WalkSpeed = 4;
            l_Cooldowns_1.frenzy = true;
            _G.canuse = false;
            task.wait(0.75);
            v28:Stop();
            local v29 = l_Character_1.Humanoid.Animator:LoadAnimation(script.loop);
            v29:Play();
            v29:AdjustWeight(2);
            local v30 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gravity Frenzy", {
                cf = v21:GetMouseCFrame()
            });
            local v31 = tick();
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 115 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 121 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v31 (copy), v29 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v31 >= 4 then
                        return true;
                    elseif _G.check:inspect(l_Character_1) == false then
                        v29:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v29:Stop();
            if v30 then
                v30:InvokeServer();
            end;
            task.wait(0.2);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Gravity Frenzy", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.frenzy = false;
        end;
    end;
end;
return v8;