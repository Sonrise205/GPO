local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy), l_LocalPlayer_0 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        FloorShock = false, 
        Dash = false, 
        Slam = false, 
        Strike = false, 
        Fist = false
    };
    v8.removeBV = function() --[[ Line: 22 ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local l_Children_0 = l_LocalPlayer_0.Character.HumanoidRootPart:GetChildren();
        for v10 = 1, #l_Children_0 do
            if l_Children_0[v10]:IsA("BodyVelocity") then
                l_Children_0[v10]:Destroy();
            end;
        end;
    end;
    return v8;
end;
v6.ElectroLuna = function(v11, v12) --[[ Line: 34 ]] --[[ Name: ElectroLuna ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local v14 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.FloorShock == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Electro Luna") == true then
        local v16 = v2.GetM("Electro Luna");
        local l_cd_0 = v16.cd;
        if v16.stamreq and v14.Stamina.Value < v16.stamreq then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.FloorShock = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Electro Luna");
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.Floor);
            v18:Play();
            v18:AdjustWeight(5);
            l_Character_0.Humanoid.WalkSpeed = 4;
            task.spawn(function() --[[ Line: 57 ]]
                task.wait();
                script.grab2:Play();
            end);
            _G.PauseAnim(v18, 0.55, 2);
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 64 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    elseif l_Character_0:FindFirstChild(script.Name) == nil then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            task.wait(0.1);
            local _ = l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Electro Luna", {
                CFrame = l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            });
            task.wait(0.25);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Electro Luna", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.FloorShock = false;
        end;
    end;
end;
v6.ElectroDash = function(v20, v21) --[[ Line: 95 ]] --[[ Name: ElectroDash ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local v23 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.Dash == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Electro Dash") == true then
        local v25 = v2.GetM("Electro Dash");
        local l_cd_1 = v25.cd;
        if v25.stamreq and v23.Stamina.Value < v25.stamreq then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.Dash = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Electro Dash");
            local v27 = l_Character_1.Humanoid:LoadAnimation(script.Dash);
            v27:Play();
            v27:AdjustWeight(2);
            v27:AdjustSpeed(0);
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v28 = 0;
            local v29 = tick();
            local v30 = tick();
            do
                local l_v28_0, l_v29_0 = v28, v29;
                local function v33() --[[ Line: 124 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v27 (copy), l_v29_0 (ref), l_v28_0 (ref), v30 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_1) == false then
                        v27:Stop();
                        return true;
                    else
                        if tick() - l_v29_0 >= 0.2 then
                            game.ReplicatedStorage.Events.takestam:FireServer(2);
                            l_v28_0 = l_v28_0 + 3;
                            l_v29_0 = tick();
                        end;
                        if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v30 >= 2 then
                            return true;
                        else
                            return;
                        end;
                    end;
                end;
                v20:ChargeSkill(v21, {
                    Key = Enum.KeyCode.R, 
                    EndFunction = v33
                });
                l_v28_0 = math.clamp(l_v28_0, 0, 150);
                v27:AdjustSpeed(1);
                task.spawn(function() --[[ Line: 151 ]]
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Electro Dash");
                end);
                task.wait(0.1);
                v20.removeBV();
                local v34 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
                v34.MaxForce = Vector3.new(100000, 1000, 100000, 0);
                v34.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * (l_v28_0 + 75);
                local v35 = false;
                local v36 = tick();
                while true do
                    task.wait();
                    v34.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * (l_v28_0 + 75);
                    if _G.check:inspect(l_Character_1) == false then
                        v34.MaxForce = Vector3.new();
                        break;
                    elseif tick() - v36 >= 0.55 then
                        break;
                    end;
                end;
                _G.tween(v34, {
                    0.25, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    MaxForce = Vector3.new(0, 0, 0, 0)
                });
                _G.destroy(v34, 0.5);
                v27:AdjustSpeed(2);
                task.wait(0.1);
                l_Character_1.Humanoid.WalkSpeed = 16;
                l_Character_1.Humanoid.AutoRotate = true;
                v35 = true;
                task.wait(0.25);
                _G.canuse = true;
                _G.keysetup:cooldown("Electro Dash", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.Dash = false;
            end;
        end;
    end;
end;
v6.RaijuPunishment = function(v37, v38) --[[ Line: 191 ]] --[[ Name: RaijuPunishment ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v37.Cooldowns;
    local v40 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.Slam == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Raiju Punishment") == true then
        local v42 = v2.GetM("Raiju Punishment");
        local l_cd_2 = v42.cd;
        if v42.stamreq and v40.Stamina.Value < v42.stamreq then
            return;
        elseif v42.statreq and _G.MeetReq(v42.statreq) == false then
            return;
        else
            l_Cooldowns_2.Slam = true;
            _G.canuse = false;
            local v44 = l_Character_2.Humanoid:LoadAnimation(script.Slam);
            v44:Play();
            v44:AdjustWeight(3);
            v44:AdjustSpeed(0);
            l_Character_2.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v44, 0.4, 2);
            local v45 = 0;
            local _ = tick();
            local v47 = tick();
            v37:ChargeSkill(v38, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 222 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v44 (copy), v47 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_2) == false then
                        v44:Stop();
                        return true;
                    elseif l_Character_2:FindFirstChild(script.Name) == nil or tick() - v47 >= 2 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v45 = math.clamp(v45, 0, 150);
            v44:AdjustSpeed(1);
            l_Character_2.Humanoid.WalkSpeed = 16;
            v37.removeBV();
            if _G.check:inspect(l_Character_2) == false then
                v44:Stop();
            else
                local v48 = Instance.new("BodyVelocity", l_Character_2.HumanoidRootPart);
                v48.Name = "geppo";
                v48.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000, 0);
                v48.Velocity = l_Character_2.HumanoidRootPart.CFrame.upVector * 100;
                v48.P = 4324234234;
                _G.destroy(v48, 0.25);
                local v49 = nil;
                do
                    local l_v49_0 = v49;
                    task.spawn(function() --[[ Line: 257 ]]
                        -- upvalues: l_v49_0 (ref)
                        l_v49_0 = game.ReplicatedStorage.Events.Skill:InvokeServer("Raiju Punishment");
                    end);
                    task.wait(0.7999999999999999);
                    local l_Position_0 = l_Character_2.HumanoidRootPart.Position;
                    local v52 = Ray.new(l_Position_0, CFrame.new(l_Position_0).upVector * -500);
                    local v53, v54 = _G.raycastWhitelist(v52, {
                        workspace.Islands, 
                        workspace.Env, 
                        workspace.Ships
                    });
                    l_Character_2.HumanoidRootPart.Anchored = true;
                    if v53 then
                        local l_magnitude_0 = (l_Position_0 - v54).magnitude;
                        local v56 = l_Character_2.HumanoidRootPart.CFrame * CFrame.new(0, -l_magnitude_0, 0) * CFrame.new(0, l_Character_2.Humanoid.HipHeight * 1.25, 0);
                        l_Character_2.HumanoidRootPart.CFrame = v56;
                        task.spawn(function() --[[ Line: 272 ]]
                            -- upvalues: l_v49_0 (ref), v56 (copy)
                            repeat
                                game["Run Service"].RenderStepped:Wait();
                            until l_v49_0 ~= nil;
                            l_v49_0:FireServer({
                                cf = v56 * CFrame.new(0, 0, -2), 
                                endCF = v56
                            });
                        end);
                    else
                        v44:Stop();
                    end;
                end;
            end;
            task.wait(0.25);
            l_Character_2.HumanoidRootPart.Anchored = false;
            l_Character_2.Humanoid.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Raiju Punishment", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.Slam = false;
        end;
    end;
end;
v6.ElectroRain = function(v57, v58) --[[ Line: 293 ]] --[[ Name: ElectroRain ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v57.Cooldowns;
    local v60 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.Strike == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Electro Rain") == true then
        local v62 = v2.GetM("Electro Rain");
        local l_cd_3 = v62.cd;
        if v62.stamreq and v60.Stamina.Value < v62.stamreq then
            return;
        elseif v62.statreq and _G.MeetReq(v62.statreq) == false then
            return;
        else
            l_Cooldowns_3.Strike = true;
            _G.canuse = false;
            local v64 = l_Character_3.Humanoid:LoadAnimation(script.strike);
            v64:Play();
            v64:AdjustWeight(5);
            v64:AdjustSpeed(0);
            l_Character_3.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v64, 0.35, 1);
            local v65 = 0;
            local _ = tick();
            local v67 = tick();
            v57:ChargeSkill(v58, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 323 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), v64 (copy), v67 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_3) == false then
                        v64:Stop();
                        return true;
                    elseif l_Character_3:FindFirstChild(script.Name) == nil or tick() - v67 >= 2 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v65 = math.clamp(v65, 0, 150);
            v64:AdjustSpeed(1);
            l_Character_3.Humanoid.WalkSpeed = 16;
            v57.removeBV();
            local v68 = Instance.new("BodyVelocity", l_Character_3.HumanoidRootPart);
            v68.Name = "geppo";
            v68.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000, 0);
            v68.Velocity = l_Character_3.HumanoidRootPart.CFrame.upVector * 75;
            v68.P = 4324234234;
            _G.destroy(v68, 0.25);
            v68 = nil;
            local v69 = nil;
            do
                local l_v69_0 = v69;
                task.spawn(function() --[[ Line: 356 ]]
                    -- upvalues: l_v69_0 (ref)
                    l_v69_0 = game.ReplicatedStorage.Events.Skill:InvokeServer("Electro Rain");
                end);
                task.wait(0.6);
                local v71 = Instance.new("BodyVelocity", l_Character_3.HumanoidRootPart);
                v71.Name = "geppo";
                v71.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000, 0);
                l_Character_3.HumanoidRootPart.Anchored = true;
                task.spawn(function() --[[ Line: 364 ]]
                    -- upvalues: l_v69_0 (ref), l_Character_3 (copy)
                    repeat
                        game["Run Service"].RenderStepped:Wait();
                    until l_v69_0 ~= nil;
                    l_v69_0:FireServer({
                        cf = l_Character_3.HumanoidRootPart.CFrame * CFrame.new(0, -2, -2), 
                        endCF = l_Character_3.HumanoidRootPart.CFrame
                    });
                end);
                task.wait(0.35);
                v71.MaxForce = Vector3.new(0, 0, 0, 0);
                _G.destroy(v71, 0.25);
                v71 = nil;
                l_Character_3.HumanoidRootPart.Anchored = false;
                l_Character_3.Humanoid.AutoRotate = true;
                _G.canuse = true;
                _G.keysetup:cooldown("Electro Rain", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.Strike = false;
            end;
        end;
    end;
end;
v6.ElectroFist = function(v72, _) --[[ Line: 384 ]] --[[ Name: ElectroFist ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v72.Cooldowns;
    local v75 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.Fist == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Electro Fist") == true then
        if l_Character_4:FindFirstChild("ElecFist") then
            return;
        else
            local v77 = v2.GetM("Electro Fist");
            local l_cd_4 = v77.cd;
            if v77.stamreq and v75.Stamina.Value < v77.stamreq then
                return;
            elseif v77.statreq and _G.MeetReq(v77.statreq) == false then
                return;
            else
                l_Cooldowns_4.Fist = true;
                _G.canuse = false;
                local v79 = l_Character_4.Humanoid:LoadAnimation(script.fist);
                v79:Play();
                v79:AdjustWeight(2);
                v79:AdjustSpeed(1);
                task.wait(0.7);
                game.ReplicatedStorage.Events.Skill:InvokeServer("Electro Fist");
                _G.canuse = true;
                _G.keysetup:cooldown("Electro Fist", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.Fist = false;
            end;
        end;
    end;
end;
return v6;