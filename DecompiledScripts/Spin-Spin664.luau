local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local v4 = require(game.ReplicatedStorage.Modules.Skills);
local v5 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v5);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v8 (copy)
    local v10 = setmetatable(v5.new(script.Name), v8);
    v10.Cooldowns = {
        flight = false, 
        cyclone = false, 
        throw = false
    };
    return v10;
end;
v8.SpinningFlight = function(v11, v12) --[[ Line: 28 ]] --[[ Name: SpinningFlight ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_0.flight == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Spinning Flight") == true then
        local v16 = v4.GetM("Spinning Flight");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Spinning Flight") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.flight = true;
            _G.canuse = false;
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.flywindup);
            v18:Play();
            v18:AdjustWeight(2);
            local v19 = Instance.new("BodyGyro", l_Character_0.HumanoidRootPart);
            v19.MaxTorque = Vector3.new(1000000, 1000000, 1000000, 0);
            v19.CFrame = CFrame.new(l_Character_0.HumanoidRootPart.Position, v11:GetMouseCFrame().p);
            v19.P = 10000000;
            v19.D = 15000;
            local v20 = Instance.new("BodyVelocity", l_Character_0.LowerTorso);
            v20.Velocity = v19.CFrame.lookVector * 25;
            v20.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            l_Character_0.Humanoid.PlatformStand = true;
            local v21 = game.ReplicatedStorage.Events.Skill:InvokeServer("Spinning Flight", {
                cf = v11:GetMouseCFrame()
            });
            task.wait(0.5);
            v18:Stop();
            local v22 = l_Character_0.Humanoid:LoadAnimation(script.flyloop);
            v22:Play();
            v22:AdjustWeight(2);
            local v23 = tick();
            v11:ToggleSkill(v12, {
                Key = Enum.KeyCode.E, 
                IgnoreInstantCastSetting = true, 
                CheckFunction = function() --[[ Line: 71 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_0 (copy), v22 (copy), v19 (copy), v11 (copy), v20 (copy)
                    local v24 = l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth;
                    v22:AdjustSpeed(0.5 + v24);
                    v19.CFrame = CFrame.new(l_Character_0.HumanoidRootPart.Position, v11:GetMousePosition());
                    v20.Velocity = v19.CFrame.lookVector * (50 * v24);
                    l_Character_0.Humanoid.PlatformStand = true;
                end, 
                EndFunction = function() --[[ Line: 78 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v23 (copy), l_Character_0 (copy), v15 (copy)
                    local v25 = true;
                    if tick() - v23 < 10 then
                        v25 = true;
                        if l_Character_0:FindFirstChild(script.Name) ~= false then
                            v25 = true;
                            if l_Character_0.Parent ~= nil then
                                v25 = true;
                                if l_Character_0.Parent == workspace.PlayerCharacters then
                                    v25 = v15.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                    return v25;
                end
            });
            if v21 then
                v21:FireServer();
            end;
            v22:Stop();
            v19:Destroy();
            v20:Destroy();
            l_Character_0.Humanoid.PlatformStand = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Spinning Flight", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.flight = false;
        end;
    end;
end;
v8.SpinningCyclone = function(v26, v27) --[[ Line: 99 ]] --[[ Name: SpinningCyclone ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_1 = v26.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v30 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.cyclone == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Spinning Cyclone") == true then
        local v31 = v4.GetM("Spinning Cyclone");
        local l_cd_1 = v31.cd;
        if _G.StamCheck("Spinning Cyclone") == false then
            return;
        elseif v31.statreq and _G.MeetReq(v31.statreq) == false then
            return;
        else
            l_Cooldowns_1.cyclone = true;
            _G.canuse = false;
            local v33 = l_Character_1.Humanoid:LoadAnimation(script.spinwindup);
            v33:Play();
            v33:AdjustWeight(2);
            local v34 = Instance.new("BodyVelocity", l_Character_1.LowerTorso);
            v34.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 5;
            v34.MaxForce = Vector3.new(1000000, 10000, 1000000, 0);
            task.wait(0.5);
            v33:Stop();
            local v35 = l_Character_1.Humanoid:LoadAnimation(script.spinloop);
            v35:Play();
            v35:AdjustWeight(2);
            local v36 = game.ReplicatedStorage.Events.Skill:InvokeServer("Spinning Cyclone", {
                cf = v26:GetMouseCFrame()
            });
            local v37 = tick();
            v26:ToggleSkill(v27, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 137 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_1 (copy), v34 (copy)
                    local v38 = l_Character_1.HumanoidRootPart.CFrame.lookVector * 25;
                    v34.Velocity = Vector3.new(v38.X, -5, v38.Z);
                end, 
                EndFunction = function() --[[ Line: 143 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v36 (copy), l_Character_1 (copy), v37 (copy), v30 (copy)
                    if v36 == nil then
                        return true;
                    elseif _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        local v39 = true;
                        if tick() - v37 < 3 then
                            v39 = true;
                            if l_Character_1:FindFirstChild(script.Name) ~= false then
                                v39 = true;
                                if l_Character_1.Parent ~= nil then
                                    v39 = true;
                                    if l_Character_1.Parent == workspace.PlayerCharacters then
                                        v39 = v30.Stamina.Value <= 0;
                                    end;
                                end;
                            end;
                        end;
                        return v39;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            if v36 then
                v36:FireServer();
            end;
            v35:Stop();
            v34:Destroy();
            _G.canuse = true;
            _G.keysetup:cooldown("Spinning Cyclone", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.cyclone = false;
        end;
    end;
end;
v8.TwisterThrow = function(v40, v41) --[[ Line: 171 ]] --[[ Name: TwisterThrow ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_2 = v40.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v44 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.throw == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Twister Throw") == true then
        local v45 = v4.GetM("Twister Throw");
        local l_cd_2 = v45.cd;
        if _G.StamCheck("Twister Throw") == false then
            return;
        elseif v45.statreq and _G.MeetReq(v45.statreq) == false then
            return;
        else
            l_Cooldowns_2.throw = true;
            _G.canuse = false;
            local v47 = l_Character_2.Humanoid:LoadAnimation(script.twisterthrow);
            v47:Play();
            v47:AdjustWeight(2);
            l_Character_2.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v47, 0.35, 1);
            local v48 = tick();
            v40:ChargeSkill(v41, {
                Button = v41, 
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 198 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 202 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v48 (copy), l_Character_2 (copy), v44 (copy)
                    local v49 = true;
                    if tick() - v48 < 10 then
                        v49 = true;
                        if l_Character_2:FindFirstChild(script.Name) ~= false then
                            v49 = true;
                            if l_Character_2.Parent ~= nil then
                                v49 = true;
                                if l_Character_2.Parent == workspace.PlayerCharacters then
                                    v49 = v44.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                    return v49;
                end
            });
            v47:AdjustSpeed(1);
            task.wait(0.05);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Twister Throw", {
                cf = l_Character_2.HumanoidRootPart.CFrame
            });
            task.wait(0.2);
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Twister Throw", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.throw = false;
        end;
    end;
end;
return v8;