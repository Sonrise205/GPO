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
        upper = false, 
        dash = false
    };
    return v10;
end;
v8.CrimsonSlice = function(v11, v12) --[[ Line: 28 ]] --[[ Name: CrimsonSlice ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.upper == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Crimson Slice");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Crimson Slice") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.upper);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.upper = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Crimson Slice");
            _G.PauseAnim(v18, 0.35, 1.5);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 54 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 63 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v20 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            l_Character_0.HumanoidRootPart.Anchored = true;
            if v19 then
                task.wait(0.2);
                v19:FireServer(l_Character_0.HumanoidRootPart.CFrame);
            end;
            task.wait(0.4);
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Crimson Slice", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.upper = false;
        end;
    end;
end;
v8.ReapingSlash = function(v21, v22) --[[ Line: 92 ]] --[[ Name: ReapingSlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.dash == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Reaping Slash");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Reaping Slash") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28 = l_Character_1.Humanoid.Animator:LoadAnimation(script.dash);
            v28:Play();
            v28:AdjustWeight(2);
            l_Cooldowns_1.dash = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v29 = game.ReplicatedStorage.Events.Skill:InvokeServer("Reaping Slash");
            _G.PauseAnim(v28, 0.5, 1);
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 118 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v28 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        v28:Stop();
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 127 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v28:AdjustSpeed(2);
            task.wait(0.15);
            l_Character_1.Humanoid.AutoRotate = false;
            local l_CFrame_0 = l_Character_1.HumanoidRootPart.CFrame;
            local v31 = Ray.new(l_Character_1.HumanoidRootPart.CFrame.p, l_Character_1.HumanoidRootPart.CFrame.lookVector * 30);
            local _, v33 = _G.raycastWhitelist(v31, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local v34 = (l_CFrame_0.p - v33).magnitude - 1;
            local _ = l_CFrame_0 * CFrame.new(0, 0, -v34);
            l_Character_1.HumanoidRootPart.Anchored = true;
            if v29 then
                v29:FireServer(l_Character_1.HumanoidRootPart.CFrame, v34);
            end;
            task.wait(0.25);
            v28:Stop();
            local v36 = l_Character_1.Humanoid.Animator:LoadAnimation(script.slash);
            v36:Play(0);
            v36:AdjustWeight(2);
            if v29 then
                v29:FireServer(l_Character_1.HumanoidRootPart.CFrame);
            end;
            task.wait(0.75);
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Reaping Slash", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.dash = false;
        end;
    end;
end;
return v8;