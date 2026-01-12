local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        Rank = false, 
        Tekkai = false, 
        Shigan = false, 
        Rokuogan = false
    };
    return v8;
end;
local v9 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local function _(v10, v11, v12) --[[ Line: 27 ]] --[[ Name: getinregion ]]
    -- upvalues: v9 (copy)
    return (v9.new(v11, v12):FindPartsInRegion3WithWhiteList(_G.getTargets(v10), 500));
end;
v6.Rankakyu = function(v14, v15) --[[ Line: 33 ]] --[[ Name: Rankakyu ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v14.Cooldowns;
    local v17 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.Rank == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Rankakyu") == true then
        local v19 = v2.GetM("Rankakyu");
        local l_cd_0 = v19.cd;
        if v19.stamreq and v17.Stamina.Value < v19.stamreq then
            return;
        elseif v19.statreq and _G.MeetReq(v19.statreq) == false then
            return;
        else
            l_Cooldowns_0.Rank = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Rankakyu");
            local v21 = l_Character_0.Humanoid:LoadAnimation(script.rank);
            v21:Play();
            _G.FaceMouse = true;
            _G.PauseAnim(v21, 0.3, 1);
            local v22 = tick();
            v14:ChargeSkill(v15, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 58 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v14 (copy), v22 (copy)
                    if _G.check:inspect(l_Character_0) == false or v14.Tool.Parent ~= l_Character_0 or tick() - v22 >= 5 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v21:AdjustSpeed(1);
            local v23 = CFrame.new(l_Character_0.HumanoidRootPart.Position, v14:GetMouseCFrame().p);
            task.wait(0.25);
            _G.FaceMouse = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Rankakyu", {
                CFrame = v23
            });
            task.wait(0.5);
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Rankakyu", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.Rank = false;
        end;
    end;
end;
v6.Tekkai = function(v24, v25) --[[ Line: 84 ]] --[[ Name: Tekkai ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v24.Cooldowns;
    local v27 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.Tekkai == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Tekkai") == true then
        local v29 = v2.GetM("Tekkai");
        local l_cd_1 = v29.cd;
        if v29.stamreq and v27.Stamina.Value < v29.stamreq then
            return;
        elseif v29.statreq and _G.MeetReq(v29.statreq) == false then
            return;
        else
            l_Cooldowns_1.Tekkai = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Tekkai");
            local v31 = l_Character_1.Humanoid:LoadAnimation(script.tekkai);
            v31:Play();
            local v32 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
            v32.MaxForce = Vector3.new(1e999, 0, 1e999, 0);
            v32.Velocity = Vector3.new(0, 0, 0, 0);
            _G.PauseAnim(v31, 0.85, 2, function() --[[ Line: 108 ]]
                -- upvalues: l_Character_1 (copy)
                l_Character_1.Humanoid.JumpPower = 0;
            end);
            v31:AdjustSpeed(0);
            v31.Priority = Enum.AnimationPriority.Action4;
            v31.TimePosition = 0.85;
            local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Tekkai", {
                CFrame = l_Character_1.HumanoidRootPart.CFrame, 
                info = {}
            });
            if v33 then
                local v34 = l_Character_1:WaitForChild("Blocking", 3);
                local v35 = game.ReplicatedStorage.Util.Melee.BlockGui:Clone();
                v35.Parent = l_Character_1.HumanoidRootPart;
                v24:ChargeSkill(v25, {
                    Key = Enum.KeyCode.R, 
                    EndFunction = function() --[[ Line: 123 ]] --[[ Name: endFunction ]]
                        -- upvalues: v34 (copy), v35 (copy), l_Character_1 (copy), v27 (copy), v33 (copy), v24 (copy)
                        pcall(function() --[[ Line: 124 ]]
                            -- upvalues: v34 (ref), v35 (ref), l_Character_1 (ref)
                            local v36 = v34.Value / v34.MaxValue;
                            v35.ImageLabel.Frame.Position = UDim2.new(0, 0, 1 - v36, 0);
                            v35.ImageLabel.Frame.Size = UDim2.new(1, 0, v36, 0);
                            _G.canuse = false;
                            l_Character_1.Humanoid.WalkSpeed = 0;
                            v35.ImageLabel.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v36, 0);
                            v35.ImageLabel.Frame.ImageLabel.Position = UDim2.new(0, 0, -(v35.ImageLabel.Frame.Position.Y.Scale / v35.ImageLabel.Frame.Size.Y.Scale), 0);
                        end);
                        if v34 == nil then
                            return true;
                        elseif v34 and v34.Value <= 0 or v34.Parent == nil or v27.Stamina.Value <= 0 or v33 == nil or v24.Tool and v24.Tool.Parent ~= l_Character_1 then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                v35:Destroy();
            end;
            l_Character_1.Humanoid.WalkSpeed = 16;
            if v33 then
                v33:FireServer();
            end;
            v31:AdjustSpeed(1);
            l_Character_1.Humanoid.JumpPower = 50;
            v32:Destroy();
            v32 = nil;
            task.wait(0.5);
            _G.canuse = true;
            _G.keysetup:cooldown("Tekkai", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.Tekkai = false;
        end;
    end;
end;
v6.Shigan = function(v37, v38) --[[ Line: 166 ]] --[[ Name: Shigan ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v37.Cooldowns;
    local v40 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.Shigan == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Shigan") == true then
        local v42 = v2.GetM("Shigan");
        local l_cd_2 = v42.cd;
        if v42.stamreq and v40.Stamina.Value < v42.stamreq then
            return;
        elseif v42.statreq and _G.MeetReq(v42.statreq) == false then
            return;
        else
            l_Cooldowns_2.Shigan = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Shigan");
            local v44 = l_Character_2.Humanoid:LoadAnimation(script.shigan);
            v44:Play();
            v44:AdjustWeight(3);
            _G.PauseAnim(v44, 0.3, 2, function() --[[ Line: 189 ]]
                -- upvalues: l_Character_2 (copy)
                l_Character_2.Humanoid.WalkSpeed = 4;
            end);
            v37:ChargeSkill(v38, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 193 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v37 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                    if v37.Tool.Parent ~= l_Character_2 or _G.check:inspect(l_Character_2) == false then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v44:AdjustSpeed(4);
            local v45 = Instance.new("BodyVelocity", l_Character_2.HumanoidRootPart);
            v45.MaxForce = Vector3.new(100000, 0, 100000, 0);
            v45.Velocity = l_Character_2.HumanoidRootPart.CFrame.lookVector * 75;
            _G.destroy(v45, 0.1);
            l_Character_2.Humanoid.WalkSpeed = 16;
            local _ = nil;
            local v47 = false;
            do
                local l_v45_0, l_v47_0 = v45, v47;
                local function v51(v50) --[[ Line: 216 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_v45_0 (ref)
                    l_v45_0:Destroy();
                    l_v45_0 = nil;
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Shigan", {
                        Target = v50.Parent
                    });
                end;
                local function v52() --[[ Line: 222 ]] --[[ Name: hitinter ]]
                    -- upvalues: l_v45_0 (ref), l_v47_0 (ref), v44 (copy)
                    l_v45_0:Destroy();
                    l_v45_0 = nil;
                    l_v47_0 = true;
                    v44:Stop();
                end;
                _G.hitbox:start(l_Character_2, Vector3.new(5, 5, 5, 0), 0.3, CFrame.new(0, 0, -1), v51, v52);
                task.wait(0.35);
                _G.canuse = true;
                _G.keysetup:cooldown("Shigan", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.Shigan = false;
            end;
        end;
    end;
end;
v6.Rokuogan = function(v53, v54) --[[ Line: 237 ]] --[[ Name: Rokuogan ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v53.Cooldowns;
    local v56 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.Rokuogan == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Rokuogan") == true then
        local v58 = v2.GetM("Rokuogan");
        local l_cd_3 = v58.cd;
        if v58.stamreq and v56.Stamina.Value < v58.stamreq then
            return;
        elseif v58.statreq and _G.MeetReq(v58.statreq) == false then
            return;
        else
            l_Cooldowns_3.Rokuogan = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Rokuogan");
            local v60 = l_Character_3.Humanoid:LoadAnimation(script.rokuogan);
            v60:Play();
            v60:AdjustWeight(3);
            _G.FaceMouse = true;
            _G.PauseAnim(v60, 0.45, 1, function() --[[ Line: 260 ]]
                -- upvalues: l_Character_3 (copy)
                l_Character_3.Humanoid.WalkSpeed = 0;
            end);
            v53:ChargeSkill(v54, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 264 ]] --[[ Name: endFunction ]]
                    -- upvalues: v53 (copy), l_Character_3 (copy), v60 (copy)
                    if v53.Tool.Parent ~= l_Character_3 or _G.check:inspect(l_Character_3) == false then
                        v60:Stop();
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            v60:AdjustSpeed(4);
            l_Character_3.HumanoidRootPart.Anchored = true;
            if _G.check:inspect(l_Character_3) == true then
                task.wait(0.1);
                local v61 = CFrame.new(l_Character_3.HumanoidRootPart.Position, v53:GetMouseCFrame().p);
                local l_v53_MouseCFrame_0 = v53:GetMouseCFrame();
                local v63 = Ray.new(v61.p, v61.LookVector * 125);
                local _, v65 = _G.raycastWhitelist(v63, {
                    workspace.Islands, 
                    workspace.Ships, 
                    workspace.Env
                });
                local _ = (v65 - v61.Position).Magnitude + 10;
                local v67 = CFrame.new(v65, l_Character_3.HumanoidRootPart.CFrame.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, l_Character_3.Humanoid.HipHeight * 2, 3);
                local l_Magnitude_0 = (v61.Position - l_v53_MouseCFrame_0.Position).Magnitude;
                local v69 = _G.getTargetsInRegion(l_Character_3, CFrame.new(v61.Position, l_v53_MouseCFrame_0.Position) * CFrame.new(0, 0, -l_Magnitude_0 / 2), (Vector3.new(20, 20, l_Magnitude_0 + 5)));
                local v70 = nil;
                for v71 = 1, #v69 do
                    if v69[v71].Parent ~= l_Character_3 and v69[v71].Parent:FindFirstChild("targetGrabed") == nil and v69[v71].Parent:FindFirstChildWhichIsA("ForceField") == nil and v69[v71].Parent:FindFirstChild("SeaNPC") == nil then
                        v70 = v69[v71].Parent;
                        break;
                    end;
                end;
                if v70 then
                    v67 = CFrame.new(v70.HumanoidRootPart.CFrame.p, l_Character_3.HumanoidRootPart.CFrame.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 2);
                end;
                local v72 = TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0);
                local v73 = {
                    CFrame = v67
                };
                game:GetService("TweenService"):Create(l_Character_3.HumanoidRootPart, v72, v73):Play();
                local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Soru]:start({
                    char = l_Character_3
                });
                do
                    local l_v67_0, l_v70_0 = v67, v70;
                    task.spawn(function() --[[ Line: 341 ]]
                        -- upvalues: v61 (copy), l_v67_0 (ref), l_v53_MouseCFrame_0 (copy)
                        local v77 = require(script.Lightning);
                        local v78 = game.ReplicatedStorage.MiscModels.RokuTrail:Clone();
                        v78.Parent = workspace.Effects;
                        local v79 = v77:Fire(workspace.Effects, v61.Position, l_v67_0.p, Vector3.new(-20, 0, -20, 0), Vector3.new(20, 0, 20, 0), 0.75, Color3.fromRGB(0, 255, 0), 1, nil, 0.25);
                        for v80 = 1, #v79 do
                            game["Run Service"].RenderStepped:Wait();
                            v78.CFrame = CFrame.new(v79[v80], l_v53_MouseCFrame_0.p);
                            v78.Trail.Enabled = true;
                        end;
                        task.wait();
                        v78.Trail.Enabled = false;
                        _G.destroy(v78, 1);
                    end);
                    local _ = game:GetService("PhysicsService");
                    if l_v70_0 then
                        local v82 = CFrame.new(0, 0, -2);
                        local _ = l_v67_0 * v82 * CFrame.Angles(1.5707963267948966, 0, 0);
                        pcall(function() --[[ Line: 361 ]]
                            -- upvalues: l_v70_0 (ref), l_v67_0 (ref)
                            game.ReplicatedStorage.Events.Skill:InvokeServer("Rokuogan", {
                                Target = l_v70_0, 
                                cf = l_v67_0
                            });
                        end);
                    else
                        game.ReplicatedStorage.Events.Skill:InvokeServer("Rokuogan", {
                            Target = nil, 
                            cf = l_v67_0
                        });
                    end;
                    task.wait();
                    _G.canuse = true;
                    l_Character_3.Humanoid.WalkSpeed = 16;
                    task.wait(0.1);
                end;
            end;
            l_Character_3.HumanoidRootPart.Anchored = false;
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Rokuogan", l_cd_3);
            task.wait(1);
            _G.canuse = true;
            _G.fw(l_cd_3);
            l_Cooldowns_3.Rokuogan = false;
        end;
    end;
end;
return v6;