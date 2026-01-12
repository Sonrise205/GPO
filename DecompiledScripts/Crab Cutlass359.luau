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
        lunge = false, 
        nado = false
    };
    return v10;
end;
v8.CutlassLunge = function(v11, v12) --[[ Line: 28 ]] --[[ Name: CutlassLunge ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.lunge == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Cutlass Lunge");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Cutlass Lunge") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.lunge);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.lunge = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cutlass Lunge");
            _G.PauseAnim(v18, 0.47, 1.2);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 56 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    else
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
            _G.FaceMouse = false;
            v18:AdjustSpeed(1);
            if v19 then
                if _G.check:inspect(l_Character_0) == true then
                    l_Character_0.HumanoidRootPart.Anchored = true;
                    l_Character_0.Humanoid.AutoRotate = false;
                    local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
                    local _, v23 = _G.raycast:cast(l_Character_0.HumanoidRootPart.CFrame.p, l_CFrame_0.lookVector * 30, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    local l_magnitude_0 = (l_CFrame_0.p - v23).magnitude;
                    local v25 = l_CFrame_0 * CFrame.new(0, 0, -l_magnitude_0) * CFrame.new(0, l_Character_0.Humanoid.HipHeight * 1.25, 2);
                    local v26 = script.Part:Clone();
                    v26.Parent = workspace.Effects;
                    v26.CFrame = l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, 0, -8);
                    _G.tween(l_Character_0.HumanoidRootPart, {
                        0.3, 
                        "Cubic", 
                        Enum.EasingDirection.Out
                    }, {
                        CFrame = v25
                    });
                    _G.tween(v26, {
                        0.3, 
                        "Cubic", 
                        Enum.EasingDirection.Out
                    }, {
                        CFrame = v25 * CFrame.new(0, 0, -8)
                    });
                    _G.PlayEffect("FloorTrail", nil, v26, 0.3, Color3.fromRGB(213, 104, 14), Color3.fromRGB(0, 0, 0), 0.3, 0.25, 15);
                    _G.destroy(v26, 0.3);
                    v19:FireServer({
                        cf = v25
                    });
                    task.wait(0.7);
                else
                    v19:FireServer(nil);
                end;
            end;
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Cutlass Lunge", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.lunge = false;
        end;
    end;
end;
v8.CutlassLadder = function(v27, v28) --[[ Line: 113 ]] --[[ Name: CutlassLadder ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.nado == false and _G.check:inspect(l_Character_1) == true then
        local v32 = v3.GetM("Cutlass Ladder");
        local l_cd_1 = v32.cd;
        if _G.StamCheck("Cutlass Ladder") == false then
            return;
        elseif v32.statreq and _G.MeetReq(v32.statreq) == false then
            return;
        else
            local v34 = l_Character_1.Humanoid.Animator:LoadAnimation(script.ladder);
            v34:Play();
            v34:AdjustWeight(2);
            l_Cooldowns_1.nado = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v35 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cutlass Ladder");
            _G.PauseAnim(v34, 0.39, 1.2);
            local v36 = tick();
            v27:ChargeSkill(v28, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 140 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 149 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v36 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v36 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v34:AdjustSpeed(1);
            task.wait(0.13);
            local v37 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
            v37.MaxForce = Vector3.new(0, 10000000, 0, 0);
            v37.Velocity = l_Character_1.HumanoidRootPart.CFrame.upVector * 50;
            _G.destroy(v37, 0.2);
            if v35 and _G.check:inspect(l_Character_1) == true then
                v35:FireServer(l_Character_1.HumanoidRootPart.CFrame);
            elseif v35 then
                v35:FireServer();
            end;
            task.wait(0.2);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Cutlass Ladder", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.nado = false;
        end;
    end;
end;
return v8;