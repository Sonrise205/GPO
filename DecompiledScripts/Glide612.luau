local _, v1, v2, _, v4 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v5 = v1.Humanoid:LoadAnimation(game.ReplicatedStorage.Util.Glide.Glide);
local v6 = nil;
local function v19() --[[ Line: 7 ]] --[[ Name: checkFloor ]]
    -- upvalues: v1 (copy)
    local l_CFrame_0 = v1.HumanoidRootPart.CFrame;
    if l_CFrame_0.Y <= workspace.Env.WaterStuff.Falls.Position.Y and l_CFrame_0.Y > workspace.Env.WaterStuff.Sand.Position.Y then
        return true;
    else
        local v8 = v1.Humanoid.HipHeight * 3;
        local v9 = CFrame.new(l_CFrame_0.p);
        local v10 = Ray.new(v9.p, v9.upVector * -v8);
        local v11, _, _ = _G.raycastWhitelist(v10, {
            workspace.Islands, 
            workspace.Ships, 
            workspace.Env
        });
        if v11 and v11.CanCollide == true or v11 and v11.Name == "gravRock" then
            return true;
        else
            local v14 = v1.Humanoid.HipHeight * 3;
            local v15 = Ray.new(l_CFrame_0.p, l_CFrame_0.LookVector * v14);
            local v16, _, _ = _G.raycastWhitelist(v15, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            if v16 and v16.CanCollide == true or v16 and v16.Name == "gravRock" then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
GetMassOfModel = function(v20) --[[ Line: 34 ]] --[[ Name: GetMassOfModel ]]
    local v21 = 0;
    for _, v23 in (v20:GetChildren()) do
        if v23:IsA("BasePart") then
            v21 = v21 + v23:GetMass();
        end;
    end;
    return v21;
end;
local v24 = {};
local function _(v25) --[[ Line: 45 ]] --[[ Name: trail ]]
    -- upvalues: v24 (copy)
    local v26 = Instance.new("Attachment", v25);
    v26.Position = Vector3.new(0, 0.10000000149011612, 0, 0);
    local v27 = v26:Clone();
    v27.Position = Vector3.new(0, -0.10000000149011612, 0, 0);
    v27.Parent = v25;
    local v28 = game.ReplicatedStorage.Util.Glide.Trail:Clone();
    v28.Parent = v25;
    v28.Attachment0 = v26;
    v28.Attachment1 = v27;
    local v29 = {
        v26, 
        v27, 
        v28
    };
    for v30 = 1, #v29 do
        table.insert(v24, v29[v30]);
    end;
end;
_G.canGlide = true;
local v32 = false;
v2.InputBegan:Connect(function(v33, v34) --[[ Line: 63 ]]
    -- upvalues: v1 (copy), v4 (copy), v19 (copy), v32 (ref), v6 (ref), v2 (copy), v5 (copy), v24 (copy)
    if v34 then
        return;
    else
        if v33.KeyCode == Enum.KeyCode.Space and _G.canGlide == true and _G.canuse == true and _G.check:inspect(v1) == true and v4.Skills.SkypianFlight.Value == true and v4.Customization.Race.Value:match("Skypian") ~= nil and v19() == false and v32 == false then
            local v35 = game:GetService("HttpService"):GenerateGUID(true);
            v6 = v35;
            if v1.HumanoidRootPart:FindFirstChild("geppo") then
                return;
            elseif v6 ~= v35 then
                return;
            elseif v2:IsKeyDown(Enum.KeyCode.Space) == false or v19() == true then
                return;
            else
                local v36 = tick();
                v32 = true;
                repeat
                    game["Run Service"].Heartbeat:Wait();
                until v2:IsKeyDown(Enum.KeyCode.Space) == true and v1.HumanoidRootPart:FindFirstChild("geppo") == nil;
                if v19() == true then
                    v32 = false;
                    return;
                else
                    v5:Play();
                    _G.canuse = false;
                    local v37 = nil;
                    do
                        local l_v37_0 = v37;
                        l_v37_0 = v2.InputEnded:Connect(function(v39, _) --[[ Line: 93 ]]
                            -- upvalues: l_v37_0 (ref)
                            if v39.KeyCode == Enum.KeyCode.Space then
                                l_v37_0:Disconnect();
                                l_v37_0 = nil;
                            end;
                        end);
                        local v41 = nil;
                        task.spawn(function() --[[ Line: 100 ]]
                            -- upvalues: v41 (ref)
                            v41 = game.ReplicatedStorage.Events.glide:InvokeServer();
                        end);
                        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                        l_BodyVelocity_0.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
                        l_BodyVelocity_0.Velocity = Vector3.new(0, -5, 0, 0);
                        l_BodyVelocity_0.Parent = v1.HumanoidRootPart;
                        l_BodyVelocity_0.Name = "geppo";
                        local l_CurrentCamera_0 = workspace.CurrentCamera;
                        local v44 = math.clamp(math.abs(v1.HumanoidRootPart.Velocity.magnitude / 2) + 10, 1, 150);
                        local _ = tick();
                        local l_CFrame_1 = v1.HumanoidRootPart.CFrame;
                        v1.Humanoid.PlatformStand = true;
                        local v47 = 0;
                        local v48 = tick();
                        local v49 = _G.PlaySound(v1.Head, game.ReplicatedStorage.Util.Glide.start);
                        _G.tween(v49, {
                            6, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Volume = 0
                        });
                        local v50 = game.ReplicatedStorage.Util.Glide.loop:Clone();
                        v50.Parent = v1.Head;
                        v50:Play();
                        local v51 = v44 / 12 + 5;
                        _G.PlayEffect("GlideTrail", nil, nil, v1, l_BodyVelocity_0);
                        while true do
                            local v52 = tick() - v48;
                            v48 = tick();
                            v1.Humanoid.PlatformStand = true;
                            v1.Humanoid.AutoRotate = false;
                            local v53 = l_CFrame_1:Lerp(l_CurrentCamera_0.CoordinateFrame, 0.05);
                            local v54 = v53.lookVector * v44;
                            local v55 = 0;
                            v55 = math.clamp(v54.Y / 50, -10, 0.4);
                            v1.HumanoidRootPart.RotVelocity = Vector3.new();
                            local v56 = math.clamp(1 - (tick() - v36) / v51, 0, 1);
                            local v57 = v54.Y * (1 + (1 - l_CurrentCamera_0.CoordinateFrame.YVector.Y) + v47);
                            if l_CurrentCamera_0.CoordinateFrame.YVector.Y < 0.6 then
                                v47 = v47 + v52;
                            else
                                v47 = math.clamp(v47 - v52, 0, 1e999);
                            end;
                            local v58 = v1.Humanoid.Health / v1.Humanoid.MaxHealth;
                            l_BodyVelocity_0.Velocity = l_BodyVelocity_0.Velocity:Lerp(Vector3.new(v54.X * v56, math.clamp(v57, -5000, 2), v54.Z * v56), 1) * math.clamp(v58, 0.1, 1);
                            local _, _, _, v62, v63, v64, v65, v66, v67, v68, v69, v70 = v53:components();
                            local l_CFrame_2 = v1.HumanoidRootPart.CFrame;
                            v1.HumanoidRootPart.CFrame = CFrame.new(l_CFrame_2.x, l_CFrame_2.y, l_CFrame_2.z, v62, v63, v64, v65, v66, v67, v68, v69, v70);
                            l_CFrame_1 = CFrame.new(l_CFrame_2.x, l_CFrame_2.y, l_CFrame_2.z, v62, v63, v64, v65, v66, v67, v68, v69, v70);
                            local l_Magnitude_0 = l_BodyVelocity_0.Velocity.Magnitude;
                            v50.Pitch = l_Magnitude_0 / 40;
                            v50.Volume = 0.5 + l_Magnitude_0 / 40;
                            v5:AdjustSpeed(l_Magnitude_0 / 25);
                            _G.canuse = false;
                            if l_Magnitude_0 >= 5 and v1.Parent == workspace.PlayerCharacters and not v1:FindFirstChild("Stun") and v51 > tick() - v36 and not v1:GetAttribute("flyMode") and not v1:FindFirstChild("Blocking") then
                                game["Run Service"].Stepped:Wait();
                                if v19() == true or l_v37_0 == nil then
                                    break;
                                end;
                            else
                                break;
                            end;
                        end;
                        if v49 and v49.Parent ~= nil then
                            _G.tween(v49, {
                                0.25, 
                                Enum.EasingStyle.Quad, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Volume = 0
                            });
                            _G.destroy(v49, 0.25);
                        end;
                        if v50 and v50.Parent ~= nil then
                            _G.tween(v50, {
                                1, 
                                Enum.EasingStyle.Quad, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Volume = 0
                            });
                            _G.destroy(v50, 1);
                        end;
                        v1.Humanoid.PlatformStand = false;
                        v1.Humanoid.AutoRotate = true;
                        table.clear(v24);
                        l_BodyVelocity_0:Destroy();
                        _G.canuse = true;
                        v5:Stop();
                        task.spawn(function() --[[ Line: 196 ]]
                            -- upvalues: v32 (ref)
                            task.wait(3);
                            v32 = false;
                        end);
                        repeat
                            game["Run Service"].Heartbeat:Wait();
                        until v41 ~= nil;
                        if v41 then
                            game.ReplicatedStorage.Events.glide:InvokeServer(v41);
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end);