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
v8.IcebornLunge = function(v11, v12) --[[ Line: 28 ]] --[[ Name: IcebornLunge ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.lunge == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Iceborn Lunge");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Iceborn Lunge") == false then
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
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Iceborn Lunge");
            _G.PauseAnim(v18, 0.25, 0.75);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 54 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 61 ]] --[[ Name: endFunction ]]
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
            l_Character_0.Humanoid.AutoRotate = false;
            local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
            local _, v23 = _G.raycast:cast(l_Character_0.HumanoidRootPart.CFrame.p, l_CFrame_0.lookVector * 45, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local l_magnitude_0 = (l_CFrame_0.p - v23).magnitude;
            local v25 = l_CFrame_0 * CFrame.new(0, 0, -l_magnitude_0) * CFrame.new(0, l_Character_0.Humanoid.HipHeight * 1.25, 2);
            _G.FaceMouse = false;
            _G.tween(l_Character_0.HumanoidRootPart, {
                0.4, 
                "Cubic", 
                Enum.EasingDirection.Out
            }, {
                CFrame = v25
            });
            if v19 then
                v19:FireServer(l_CFrame_0, v25);
            end;
            task.wait(0.7);
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Iceborn Lunge", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.lunge = false;
        end;
    end;
end;
v8.IcebornShards = function(v26, _) --[[ Line: 103 ]] --[[ Name: IcebornShards ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v26.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.nado == false and _G.check:inspect(l_Character_1) == true then
        local v31 = v3.GetM("Iceborn Shards");
        local l_cd_1 = v31.cd;
        if _G.StamCheck("Iceborn Shards") == false then
            return;
        elseif v31.statreq and _G.MeetReq(v31.statreq) == false then
            return;
        else
            local v33 = l_Character_1.Humanoid.Animator:LoadAnimation(script.shoot);
            v33:Play();
            v33:AdjustWeight(2);
            l_Cooldowns_1.nado = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v34 = game.ReplicatedStorage.Events.Skill:InvokeServer("Iceborn Shards");
            local v35 = {
                [0] = 0, 
                [1] = 0.38, 
                [2] = 0.62, 
                [3] = 0.9
            };
            for v36 = 1, 3 do
                task.wait(v35[v36] - v35[v36 - 1]);
                if v34 and _G.check:inspect(l_Character_1) == true then
                    v34:FireServer({
                        hrpCF = l_Character_1.PrimaryPart.CFrame, 
                        targetCF = v26:GetMouseCFrame()
                    });
                elseif v34 then
                    v34:FireServer("end");
                    break;
                else
                    break;
                end;
            end;
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            task.wait(0.4);
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Iceborn Shards", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.nado = false;
        end;
    end;
end;
return v8;