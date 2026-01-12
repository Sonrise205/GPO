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
        flash = false
    };
    return v10;
end;
v8.RuthlessBlade = function(v11, v12) --[[ Line: 28 ]] --[[ Name: RuthlessBlade ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.slash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Ruthless Blade");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Ruthless Blade") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.slash);
            v18:Play();
            v18:AdjustWeight(2);
            v18.Priority = Enum.AnimationPriority.Action4;
            l_Cooldowns_0.slash = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            _G.mouseLevel = true;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Ruthless Blade");
            task.wait(0.5);
            local v20 = l_Character_0.Humanoid.Animator:LoadAnimation(script.loop);
            v20:Play();
            v20:AdjustWeight(2);
            v20.Priority = Enum.AnimationPriority.Action4;
            local v21 = tick();
            local function v22() --[[ Line: 61 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_0 (copy)
                l_Character_0.Humanoid.AutoRotate = false;
            end;
            do
                local l_v21_0 = v21;
                local function v24() --[[ Line: 66 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), l_v21_0 (ref)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - l_v21_0 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = v22, 
                    EndFunction = v24
                });
                _G.mouseLevel = false;
                v20:Stop();
                local v25 = l_Character_0.Humanoid.Animator:LoadAnimation(script.slashEnd);
                v25:Play(0);
                v25.Priority = Enum.AnimationPriority.Action4;
                v25:AdjustSpeed(1);
                _G.FaceMouse = false;
                l_Character_0.HumanoidRootPart.Anchored = true;
                l_Character_0.Humanoid.AutoRotate = false;
                if v19 then
                    v19:InvokeServer(l_Character_0.PrimaryPart.CFrame);
                end;
                l_v21_0 = tick();
                repeat
                    l_Character_0.Humanoid.AutoRotate = false;
                    task.wait();
                until tick() - l_v21_0 >= 0.4;
                l_Character_0.Humanoid.AutoRotate = true;
                l_Character_0.HumanoidRootPart.Anchored = false;
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Ruthless Blade", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.slash = false;
            end;
        end;
    end;
end;
v8.DragonFlash = function(v26, v27) --[[ Line: 111 ]] --[[ Name: DragonFlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v26.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.flash == false and _G.check:inspect(l_Character_1) == true then
        local v31 = v3.GetM("Dragon Flash");
        local l_cd_1 = v31.cd;
        if _G.StamCheck("Dragon Flash") == false then
            return;
        elseif v31.statreq and _G.MeetReq(v31.statreq) == false then
            return;
        else
            local v33 = nil;
            l_Cooldowns_1.flash = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            _G.mouseLevel = true;
            local _ = tick();
            v33 = l_Character_1.Humanoid.Animator:LoadAnimation(script.dragonWindup);
            v33:Play();
            v33:AdjustWeight(2);
            v33.Priority = Enum.AnimationPriority.Action4;
            local v35 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dragon Flash");
            task.wait(0.5);
            v33:Stop();
            v33 = l_Character_1.Humanoid.Animator:LoadAnimation(script.dragonCharge);
            v33:Play();
            v33:AdjustWeight(2);
            v33.Priority = Enum.AnimationPriority.Action4;
            local v36 = tick();
            v26:ChargeSkill(v27, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 151 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.AutoRotate = false;
                end, 
                EndFunction = function() --[[ Line: 156 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v36 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v36 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.mouseLevel = false;
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            l_Character_1.Humanoid.AutoRotate = false;
            v33:Stop();
            v33 = l_Character_1.Humanoid.Animator:LoadAnimation(script.dragonFlash);
            v33:Play();
            v33:AdjustWeight(2);
            if v35 then
                v35:InvokeServer(l_Character_1.PrimaryPart.CFrame);
            end;
            task.wait(0.65);
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Dragon Flash", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.flash = false;
        end;
    end;
end;
return v8;