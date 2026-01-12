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
        crash = false, 
        sweep = false
    };
    return v10;
end;
v8.HollowImpale = function(v11, v12) --[[ Line: 28 ]] --[[ Name: HollowImpale ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.crash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Hollow Impale");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Hollow Impale") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.smash);
            v18:Play();
            v18:AdjustSpeed(1);
            v18:AdjustWeight(2);
            l_Cooldowns_0.crash = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v18, 0, 1);
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Hollow Impale");
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 57 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 66 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v20 >= 6 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(2);
            local v21 = Instance.new("BodyVelocity", l_Character_0.HumanoidRootPart);
            v21.MaxForce = Vector3.new(100000, 0, 100000, 0);
            v21.Velocity = l_Character_0.HumanoidRootPart.CFrame.lookVector * 100;
            _G.destroy(v21, 0.15);
            if v19 then
                v19:FireServer("sfx");
            end;
            local _ = nil;
            local v23 = false;
            local function v25(v24) --[[ Line: 87 ]] --[[ Name: hitfound ]]
                -- upvalues: v21 (copy), l_Character_0 (copy), v19 (copy)
                v21:Destroy();
                l_Character_0.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                if v19 then
                    v19:FireServer({
                        cf = l_Character_0.PrimaryPart.CFrame, 
                        Target = v24.Parent
                    });
                end;
            end;
            do
                local l_v23_0 = v23;
                local function v27() --[[ Line: 94 ]] --[[ Name: hitinter ]]
                    -- upvalues: v21 (copy), l_v23_0 (ref), v18 (copy)
                    v21:Destroy();
                    l_v23_0 = true;
                    v18:Stop();
                end;
                _G.hitbox:start(l_Character_0, Vector3.new(8, 5, 12, 0), 0.3, CFrame.new(0, 0, -3), v25, v27);
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Hollow Impale", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.crash = false;
            end;
        end;
    end;
end;
v8.HollowSweep = function(v28, v29) --[[ Line: 109 ]] --[[ Name: HollowSweep ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v28.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sweep == false and _G.check:inspect(l_Character_1) == true then
        local v33 = v3.GetM("Hollow Sweep");
        local l_cd_1 = v33.cd;
        if _G.StamCheck("Hollow Sweep") == false then
            return;
        elseif v33.statreq and _G.MeetReq(v33.statreq) == false then
            return;
        else
            local v35 = l_Character_1.Humanoid.Animator:LoadAnimation(script.windup);
            v35:Play();
            v35:AdjustWeight(2);
            v35:AdjustSpeed(0.75);
            l_Cooldowns_1.sweep = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v36 = game.ReplicatedStorage.Events.Skill:InvokeServer("Hollow Sweep");
            _G.PauseAnim(v35, 0.39, 0.667);
            v35:Stop();
            local v37 = l_Character_1.Humanoid.Animator:LoadAnimation(script.loop);
            v37:Play();
            v37:AdjustSpeed(2);
            local v38 = tick();
            v28:ChargeSkill(v29, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 142 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v37 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        v37:Stop();
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 150 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v38 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v38 >= 3 or _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v37:Stop();
            if v36 then
                v36:FireServer();
            end;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Hollow Sweep", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.sweep = false;
        end;
    end;
end;
return v8;