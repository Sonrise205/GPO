local v0 = {};
v0.__index = v0;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local v5 = false;
local v6 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name);
local v7 = false;
local v8 = 0;
local v9 = 0;
local l_Animator_0 = v4.Humanoid.Animator;
local v11 = require(game.ReplicatedStorage.Modules.Skills);
local v12 = 1;
local v13 = script.geppoIndicator:Clone();
v13.Parent = v4.PrimaryPart;
local v14 = false;
local v15 = nil;
local function v17() --[[ Line: 29 ]] --[[ Name: meetGeppoRequirements ]]
    -- upvalues: v4 (copy), v14 (ref), v6 (copy)
    local v16 = false;
    if game.ReplicatedStorage:FindFirstChild("tradingHUB") == nil then
        v16 = false;
        if _G.canGlide == true then
            v16 = false;
            if v4.Humanoid.Sit == false then
                v16 = false;
                if v14 == false then
                    v16 = true;
                    if v6.Stats.FightingStyle.Value ~= "Rokushiki" then
                        v16 = true;
                        if v6.Stats.FightingStyle.Value ~= "BlackLeg" then
                            v16 = true;
                            if v6.Stats.FightingStyle.Value ~= "Kamishiki" then
                                v16 = v6.Skills.skyWalk.Value == true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v16;
end;
local function v22() --[[ Line: 33 ]] --[[ Name: updateGeppo ]]
    -- upvalues: v13 (copy), v8 (ref), v4 (copy)
    local l_Children_0 = v13.ImageLabel.ImageLabel:GetChildren();
    for v19 = 1, #l_Children_0 do
        if l_Children_0[v19]:IsA("Frame") then
            l_Children_0[v19].BackgroundTransparency = 0;
            l_Children_0[v19].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        end;
    end;
    for v20 = 1, v8 do
        pcall(function() --[[ Line: 43 ]]
            -- upvalues: v13 (ref), v20 (copy)
            v13.ImageLabel.ImageLabel[v20].BackgroundTransparency = 0.5;
            v13.ImageLabel.ImageLabel[v20].BackgroundColor3 = Color3.fromRGB(255, 0, 0);
        end);
    end;
    if v8 <= 0 then
        v8 = 0;
        game.ReplicatedStorage.Util.Movement.geppoReady:Play();
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.FillColor = Color3.fromRGB(255, 255, 255);
        l_Highlight_0.FillTransparency = 0;
        l_Highlight_0.OutlineTransparency = 1;
        l_Highlight_0.Parent = v4;
        _G.tween(l_Highlight_0, {
            1, 
            "Cubic", 
            Enum.EasingDirection.Out
        }, {
            FillTransparency = 1
        });
        _G.destroy(l_Highlight_0, 1);
        v13.Enabled = false;
        if currentGeppoRegen then
            currentGeppoRegen:Disconnect();
            currentGeppoRegen = nil;
        end;
    end;
end;
local function v23(v24) --[[ Line: 67 ]] --[[ Name: geppoBack ]]
    -- upvalues: v5 (ref), v8 (ref), v9 (ref), v4 (copy), v23 (copy), v22 (copy), v14 (ref)
    v5 = false;
    if v8 >= 5 then
        v8 = 5;
    end;
    v8 = v8 - 1;
    v9 = 0;
    if currentGeppoRegen then
        currentGeppoRegen:Disconnect();
        currentGeppoRegen = nil;
    end;
    if v8 > 0 and v24 == nil then
        currentGeppoRegen = game["Run Service"].Heartbeat:Connect(function(v25) --[[ Line: 82 ]]
            -- upvalues: v4 (ref), v9 (ref), v23 (ref)
            if v4.Humanoid.FloorMaterial ~= Enum.Material.Air then
                v9 = v9 + v25;
                if v9 >= 1 then
                    v23();
                end;
            end;
        end);
    end;
    v22();
    v14 = false;
end;
v0.new = function(v26) --[[ Line: 96 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v8 (ref), v23 (copy)
    local v27 = setmetatable({}, v0);
    v27.Handler = v26;
    v27.Utils = v26.Utils;
    game.ReplicatedStorage.Events.geppoManager.OnClientEvent:Connect(function() --[[ Line: 101 ]]
        -- upvalues: v8 (ref), v27 (copy), v23 (ref)
        if v8 <= 0 then
            return;
        elseif v27.Utils.inCombatCheck() == false then
            return;
        else
            v23(true);
            return;
        end;
    end);
    return v27;
end;
local v28 = nil;
local function v29(v30) --[[ Line: 117 ]] --[[ Name: tryGeppo ]]
    -- upvalues: v7 (ref), v4 (copy), v8 (ref), v9 (ref), v14 (ref), v5 (ref), v28 (ref), v6 (copy), v11 (copy), l_Animator_0 (copy), v12 (ref), v13 (copy), v15 (ref), v22 (copy), v23 (copy), l_UserInputService_0 (copy), v17 (copy), v29 (copy)
    v7 = not v7;
    local v31 = v4:GetAttribute("evading") ~= nil;
    if _G.check:inspect(v4) == false and v31 == false and v4:FindFirstChild("ragcarry") == nil then
        return;
    elseif v4.Humanoid.PlatformStand == true or v4.Humanoid:GetState() == Enum.HumanoidStateType.Physics or v4.PrimaryPart.Anchored == true then
        return;
    elseif v4:GetAttribute("flyMode") then
        return;
    elseif v30.Utils.inCombatCheck() and v8 >= 5 then
        _G.displayMessage("<Color=Red>Geppo is on cooldown until you remain on the ground for " .. math.ceil(2 - v9) .. " seconds.");
        script.DashOut:Play();
        if v14 == false then
            v5 = true;
        end;
        v7 = false;
        v14 = true;
        return;
    else
        if v28 then
            task.cancel(v28);
            v28 = nil;
        end;
        if v7 == false and (_G.canuse == true or v31 == true) and _G.swimming == false and _G.StamCheck("Sky Walk2", true) == true and v4:FindFirstChild("Cuffed") == nil then
            local v32 = nil;
            local v33 = nil;
            if v6.Stats.FightingStyle.Value == "Rokushiki" then
                v32 = v11.GetM("Geppo");
                v33 = v32.cd;
                if v32.statreq and _G.MeetReq(v32.statreq, nil, true) == false then
                    return;
                elseif v6.Skills.Rokushiki.Value < 4 then
                    return;
                end;
            elseif v6.Stats.FightingStyle.Value == "BlackLeg" then
                v32 = v11.GetM("Sky Walk");
                v33 = v32.cd;
                if v32.statreq and _G.MeetReq(v32.statreq, nil, true) == false then
                    return;
                elseif v6.Skills.BlackLeg.Value < 3 then
                    return;
                end;
            elseif v6.Stats.FightingStyle.Value == "Kamishiki" then
                v32 = v11.GetM("KamishikiGeppo");
                v33 = v32.cd;
                if v32.statreq and _G.MeetReq(v32.statreq, nil, true) == false then
                    return;
                end;
            elseif v6.Skills.skyWalk.Value == true then
                v32 = v11.GetM("Sky Walk2");
                v33 = v32.cd;
                if v32.statreq and _G.MeetReq(v32.statreq, nil, true) == false then
                    return;
                end;
            else
                return;
            end;
            _G.canuse = false;
            task.spawn(function() --[[ Line: 192 ]]
                task.wait(0.1);
                _G.canuse = true;
            end);
            v14 = true;
            local v34 = l_Animator_0:LoadAnimation(game.ReplicatedStorage.Util.Movement["Geppo" .. v12]);
            v34.Priority = Enum.AnimationPriority.Action;
            v34:Play(0.25);
            v34:AdjustWeight(5);
            v34:AdjustSpeed(2);
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            l_BodyVelocity_0.Name = "geppo";
            local v36 = 50;
            if _G.running == true then
                v36 = 75;
            end;
            v36 = _G.ScaleWithHP(v36);
            l_BodyVelocity_0.Velocity = v4.Humanoid.MoveDirection * v36 + Vector3.new(0, _G.ScaleWithHP(25), 0);
            _G.destroy(l_BodyVelocity_0, 0.25);
            task.delay(0.3, function() --[[ Line: 220 ]]
                -- upvalues: v4 (ref)
                local v37 = Instance.new("BoolValue", v4.HumanoidRootPart);
                v37.Name = "geppo";
                _G.destroy(v37, 0.25);
            end);
            local v38 = tick();
            local l_CFrame_0 = v4.HumanoidRootPart.CFrame;
            local v40 = false;
            if v4.Humanoid.MoveDirection == Vector3.new(0, 0, 0, 0) then
                v40 = true;
                l_CFrame_0 = v4.HumanoidRootPart.CFrame;
                l_BodyVelocity_0.Velocity = v4.HumanoidRootPart.CFrame.upVector * v36;
                v34:Stop();
                v34 = nil;
                v34 = l_Animator_0:LoadAnimation(game.ReplicatedStorage.Util.Movement["Geppo2" .. v12]);
                v34.Priority = Enum.AnimationPriority.Action;
                v34:Play(0.25);
                v34:AdjustWeight(5);
                v34:AdjustSpeed(2);
            end;
            local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.BeamRing];
            local v42 = v4.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0);
            local l_l_CFrame_0_0 = l_CFrame_0;
            if v40 == true then
                v42 = v42 * CFrame.Angles(1.5707963267948966, 0, 0);
            end;
            v42 = CFrame.lookAt(v4.HumanoidRootPart.Position, l_BodyVelocity_0.Velocity + v4.PrimaryPart.Position);
            v9 = 0;
            _G.PlayEffect("Geppo", nil, {
                char = v4, 
                cf = v42
            });
            l_BodyVelocity_0.Parent = v4.HumanoidRootPart;
            local _ = l_BodyVelocity_0.Velocity;
            task.spawn(function() --[[ Line: 262 ]]
                -- upvalues: v6 (ref), v4 (ref), v42 (ref)
                if v6.Stats.FightingStyle.Value == "Rokushiki" then
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Geppo", {
                        char = v4, 
                        cf = v42
                    });
                    if _G.keysetup then
                        _G.keysetup:cooldown("Geppo", 0.25);
                        return;
                    end;
                elseif v6.Stats.FightingStyle.Value == "BlackLeg" then
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Sky Walk", {
                        char = v4, 
                        cf = v42
                    });
                    if _G.keysetup then
                        _G.keysetup:cooldown("Sky Walk", 0.25);
                        return;
                    end;
                elseif v6.Stats.FightingStyle.Value == "Kamishiki" then
                    game.ReplicatedStorage.Events.Skill:InvokeServer("KamishikiGeppo", {
                        char = v4, 
                        cf = v42
                    });
                    return;
                elseif v6.Skills.skyWalk.Value == true then
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Sky Walk2", {
                        char = v4, 
                        cf = v42
                    });
                end;
            end);
            while true do
                v4.Humanoid.AutoRotate = false;
                if v40 == false and (v4.HumanoidRootPart.CFrame.Position - l_l_CFrame_0_0.Position).magnitude >= 0.1 then
                    v4.HumanoidRootPart.CFrame = CFrame.new(v4.HumanoidRootPart.Position, (Vector3.new(l_l_CFrame_0_0.X + 0.001, v4.HumanoidRootPart.Position.Y, l_l_CFrame_0_0.Z + 0.001))) * CFrame.Angles(0, 3.141592653589793, 0);
                end;
                if v4:FindFirstChild("Stun") and v4:GetAttribute("evading") == nil and l_BodyVelocity_0 then
                    l_BodyVelocity_0.MaxForce = Vector3.new();
                    l_BodyVelocity_0:Destroy();
                    if v4:FindFirstChild("knockback", true) == nil then
                        v4.PrimaryPart.AssemblyLinearVelocity = Vector3.new();
                        break;
                    else
                        break;
                    end;
                else
                    game["Run Service"].RenderStepped:Wait();
                    if tick() - v38 >= 0.25 then
                        break;
                    end;
                end;
            end;
            v4.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
            v4.Humanoid.AutoRotate = true;
            v8 = v8 + 1;
            if v30.Utils.inCombatCheck() == true then
                v13.Enabled = true;
                if v15 then
                    task.cancel(v15);
                    v15 = nil;
                end;
                v22();
            else
                v13.Enabled = false;
                v8 = 0;
            end;
            if v30.Utils.inCombatCheck() and v8 >= 5 then
                script.DashOut:Play();
            end;
            if v30.Utils.inCombatCheck() then
                if currentGeppoRegen then
                    currentGeppoRegen:Disconnect();
                    currentGeppoRegen = nil;
                end;
                currentGeppoRegen = game["Run Service"].Heartbeat:Connect(function(v45) --[[ Line: 327 ]]
                    -- upvalues: v4 (ref), v9 (ref), v23 (ref)
                    if v4.Humanoid.FloorMaterial ~= Enum.Material.Air then
                        v9 = v9 + v45;
                        if v9 >= 1 then
                            v23();
                        end;
                    end;
                end);
            end;
            v34:Stop(0.25);
            v12 = v12 + 1;
            if v12 > 2 then
                v12 = 1;
            end;
            v14 = false;
            task.wait(0.1);
            if (l_UserInputService_0:IsKeyDown(Enum.KeyCode.Space) == true or _G.mobileJumpHeld == true) and v5 == false and v17() == true then
                v7 = true;
                v29(v30);
            end;
            return;
        else
            v28 = task.delay(0.35, function() --[[ Line: 350 ]]
                -- upvalues: v7 (ref)
                v7 = false;
            end);
            return;
        end;
    end;
end;
v0.PC_Activate = function(v46) --[[ Line: 356 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v13 (copy), v5 (ref), v17 (copy), v29 (copy)
    if v46.Utils.inCombatCheck() == false then
        v13.Enabled = false;
    end;
    if v5 == false and not _G.grounded and v17() == true then
        v29(v46);
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;