local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
local v9 = {
    {
        "Block", 
        "f"
    }, 
    {
        "Room", 
        "e"
    }, 
    {
        "Thorn", 
        "r"
    }, 
    {
        "Shambles", 
        "t"
    }, 
    {
        "Surgeon Mode", 
        "y"
    }, 
    {
        "Tact", 
        "z"
    }, 
    {
        "Counter Shock", 
        "x"
    }, 
    {
        "Gamma Knife", 
        "c"
    }
};
local v10 = {
    {
        "Block", 
        "f"
    }, 
    {
        "Room", 
        "e"
    }, 
    {
        "Mes", 
        "r"
    }, 
    {
        "Shambles", 
        "t"
    }, 
    {
        "Surgeon Mode", 
        "y"
    }, 
    {
        "Radio Knife", 
        "z"
    }, 
    {
        "Injection Shot", 
        "x"
    }, 
    {
        "Gamma Knife", 
        "c"
    }
};
v8.new = function(_) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy)
    local v12 = setmetatable(v4.new(script.Name), v8);
    v12.Cooldowns = {
        room = false, 
        mes = false, 
        tact = false, 
        shambles = false, 
        counterShock = false, 
        injection = false, 
        radio = false, 
        gamma = false, 
        sur = false, 
        thorn = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    v12.surMode = false;
    v12.inRoom = false;
    l_Character_0.AttributeChanged:Connect(function(v14) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), l_Character_0 (copy)
        if v14 == "surgeonMode" then
            v12.surMode = l_Character_0:GetAttribute("surgeonMode") or false;
        end;
    end);
    v12.HeartbeatConnection = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 39 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v12 (copy), l_Character_0 (copy)
        local l_FirstChild_0 = workspace.Effects:FindFirstChild("roomBubble" .. l_LocalPlayer_0.Name);
        if l_FirstChild_0 == nil then
            v12.inRoom = false;
            v12.roomData = nil;
        end;
        if l_FirstChild_0 and l_FirstChild_0:GetAttribute("originCFrame") and (l_Character_0.PrimaryPart.Position - l_FirstChild_0:GetAttribute("originCFrame").Position).magnitude <= l_FirstChild_0:GetAttribute("roomSize") / 2 then
            v12.inRoom = true;
        else
            v12.inRoom = false;
        end;
        if l_FirstChild_0 and v12.roomData == nil then
            local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("roomSize");
            v12.roomData = {
                cf = l_FirstChild_0:GetAttribute("originCFrame"), 
                Size = Vector3.new(l_l_FirstChild_0_Attribute_0, l_l_FirstChild_0_Attribute_0, l_l_FirstChild_0_Attribute_0)
            };
        end;
    end);
    return v12;
end;
v8.Room = function(v17, v18) --[[ Line: 61 ]] --[[ Name: Room ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v17.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v21 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.room == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Room") == true then
        local v22 = v3.GetM("Room");
        local l_cd_0 = v22.cd;
        if _G.StamCheck("Room") == false then
            return;
        elseif v22.statreq and _G.MeetReq(v22.statreq) == false then
            return;
        else
            local v24 = 125 + v21.Stats.DevilFruitMastery.Value / 2;
            if v24 >= 1000 then
                v24 = 1000;
            end;
            l_Cooldowns_0.room = true;
            local v25 = l_Character_1.Humanoid:LoadAnimation(script.roomLoop);
            v25:Play();
            v25:AdjustWeight(2);
            v25:AdjustSpeed(1);
            _G.canuse = false;
            local v26 = game.ReplicatedStorage.Events.Skill:InvokeServer("Room");
            local v27 = Instance.new("NumberValue", script);
            v27.Value = v24 * 0.2;
            _G.tween(v27, {
                1.5, 
                Enum.EasingStyle.Quart, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Value = v24
            });
            local v28 = game.ReplicatedStorage.Refrences.Ope.indicatorMesh:Clone();
            v28.CFrame = l_Character_1.HumanoidRootPart.CFrame * CFrame.new(0.25, -0.5, -2.2);
            v28.Parent = workspace.Effects;
            _G.tween(v28, {
                0.1, 
                Enum.EasingStyle.Linear, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Transparency = 0.95
            });
            v28.Anchored = true;
            local v29 = tick();
            do
                local l_v27_0 = v27;
                local function v31() --[[ Line: 108 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v26 (copy), l_v27_0 (ref), v28 (copy), l_Character_1 (copy)
                    if v26 == nil then
                        return false;
                    else
                        if l_v27_0 ~= nil then
                            v28.Size = Vector3.new(l_v27_0.Value, l_v27_0.Value, l_v27_0.Value);
                        end;
                        v28.CFrame = l_Character_1.HumanoidRootPart.CFrame * CFrame.new(0.25, -0.5, -2.2);
                        return;
                    end;
                end;
                local function v32() --[[ Line: 119 ]] --[[ Name: endFunction ]]
                    -- upvalues: v17 (copy), l_Character_1 (copy), v29 (copy), v21 (copy)
                    if v17.Tool.Parent ~= l_Character_1 or tick() - v29 >= 1.5 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v21.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                v17:ChargeSkill(v18, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = v31, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = v32
                });
                if tick() - v29 <= 0.2 then
                    task.wait(0.2);
                end;
                l_v27_0:Destroy();
                l_v27_0 = nil;
                _G.tween(v28, {
                    1.5, 
                    Enum.EasingStyle.Quint, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Transparency = 1
                });
                _G.destroy(v28, 1.5);
                game.Lighting.BlurF.Size = 15;
                _G.tween(game.Lighting.BlurF, {
                    1, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Size = 0
                });
                v25:Stop();
                if v26 then
                    v17.roomData = {
                        cf = l_Character_1.PrimaryPart.CFrame, 
                        Size = v28.Size
                    };
                    v26:FireServer(v28.Size.X, l_Character_1.PrimaryPart.CFrame * CFrame.new(0.25, -0.5, -2.2));
                end;
                local v33 = l_Character_1.Humanoid:LoadAnimation(script.roomRelease);
                v33:Play();
                v33:AdjustWeight(2);
                v33:AdjustSpeed(1);
                _G.canuse = true;
                l_Character_1.Humanoid.WalkSpeed = 16;
                v17:DoubleCastSkill(v18, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = v31, 
                    EndFunction = v32, 
                    SkipTap = true, 
                    CompleteFunction = function() --[[ Line: 166 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: v26 (copy), v17 (copy), l_cd_0 (copy), l_Cooldowns_0 (copy)
                        if v26 then
                            v26:FireServer("release");
                        end;
                        v17.roomData = nil;
                        _G.keysetup:cooldown("Room", l_cd_0);
                        _G.canuse = true;
                        _G.fw(l_cd_0);
                        l_Cooldowns_0.room = false;
                    end, 
                    PassFunction = function() --[[ Line: 176 ]] --[[ Name: PassFunction ]]
                        -- upvalues: l_Character_1 (copy)
                        return l_Character_1:FindFirstChild(script.Name) and _G.canuse == true;
                    end
                });
            end;
        end;
    end;
end;
v8.Mes = function(v34, v35) --[[ Line: 184 ]] --[[ Name: Mes ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v34.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v38 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v34.surMode == true and l_Cooldowns_1.mes == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Mes") == true then
        local v39 = v3.GetM("Mes");
        local l_cd_1 = v39.cd;
        if _G.StamCheck("Mes") == false then
            return;
        elseif v39.statreq and _G.MeetReq(v39.statreq) == false then
            return;
        elseif v34.inRoom == false then
            game:GetService("SoundService"):PlayLocalSound(script.OpeOutOfRoom);
            return;
        else
            l_Cooldowns_1.mes = true;
            local v41 = l_Character_2.Humanoid:LoadAnimation(script.mesWindup);
            v41:Play();
            v41:AdjustWeight(2);
            v41:AdjustSpeed(1);
            _G.canuse = false;
            _G.mouseLevel = true;
            _G.FaceMouse = true;
            local v42 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mes");
            local v43 = Instance.new("NumberValue", script);
            v43.Value = 8;
            local v44 = game.ReplicatedStorage.Refrences.Ope.aim:Clone();
            v44.Parent = workspace.Effects;
            v44.Attachment2.Position = Vector3.new();
            _G.tween(v44.Attachment2, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = game.ReplicatedStorage.Refrences.Ope.aim.Attachment2.Position
            });
            local v45 = true;
            task.spawn(function() --[[ Line: 224 ]]
                -- upvalues: v44 (copy), l_Character_2 (copy), v43 (copy)
                while _G.FaceMouse == true do
                    v44.CFrame = l_Character_2.HumanoidRootPart.CFrame * CFrame.new(0, -l_Character_2.Humanoid.HipHeight * 1.45, -25) * CFrame.Angles(3.141592653589793, 0, 0);
                    v44.Attachment2.Position = Vector3.new(0, 0, v43.Value - 10);
                    game["Run Service"].RenderStepped:Wait();
                end;
            end);
            _G.PauseAnim(v41, 0.5, 1);
            v41:Stop();
            local v46 = l_Character_2.Humanoid:LoadAnimation(script.mesLoop);
            v46:Play();
            v46:AdjustWeight(2);
            v46:AdjustSpeed(1);
            do
                local l_v45_0 = v45;
                task.delay(0.25, function() --[[ Line: 243 ]]
                    -- upvalues: l_v45_0 (ref), v43 (copy)
                    if l_v45_0 == true then
                        game:GetService("TweenService"):Create(v43, TweenInfo.new(0.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            Value = 16
                        }, true):Play();
                    end;
                end);
                local v48 = tick();
                v34:ChargeSkill(v35, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 254 ]] --[[ Name: checkFunction ]]
                        -- upvalues: v42 (copy)
                        if v42 == nil then
                            return false;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 260 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_2 (copy), v48 (copy), v38 (copy)
                        if l_Character_2:FindFirstChild(script.Name) == nil or tick() - v48 >= 1.25 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v38.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                l_v45_0 = false;
                if tick() - v48 < 0.75 then
                    repeat
                        task.wait();
                    until tick() - v48 >= 0.75;
                end;
                v46:Stop();
                local v49 = l_Character_2.Humanoid:LoadAnimation(script.mesSteal);
                v49:Play();
                v49:AdjustWeight(2);
                v49:AdjustSpeed(1);
                v43:Destroy();
                if v42 then
                    local l_Magnitude_0 = (v44.Attachment2.Position - v44.Attachment.Position).Magnitude;
                    v42:FireServer(-l_Magnitude_0 / 2, l_Character_2.PrimaryPart.CFrame, v44.Attachment2.WorldCFrame, l_Magnitude_0);
                end;
                _G.tween(v44.Beam, {
                    0.25, 
                    "Quad", 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Width0 = 0, 
                    Width1 = 0
                });
                _G.destroy(v44, 0.25);
                task.wait(0.25);
                _G.canuse = true;
                _G.FaceMouse = false;
                _G.mouseLevel = false;
                _G.keysetup:cooldown("Mes", l_cd_1);
                _G.canuse = true;
                _G.fw(l_cd_1);
                l_Cooldowns_1.mes = false;
            end;
        end;
    end;
end;
v8.Tact = function(v51, v52) --[[ Line: 309 ]] --[[ Name: Tact ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v51.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v55 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v51.surMode == false and l_Cooldowns_2.tact == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Tact") == true then
        local v56 = v3.GetM("Tact");
        local l_cd_2 = v56.cd;
        if _G.StamCheck("Tact") == false then
            return;
        elseif v56.statreq and _G.MeetReq(v56.statreq) == false then
            return;
        elseif v51.inRoom == false then
            game:GetService("SoundService"):PlayLocalSound(script.OpeOutOfRoom);
            return;
        else
            l_Cooldowns_2.tact = true;
            _G.canuse = false;
            local v58 = RaycastParams.new();
            v58.FilterDescendantsInstances = {
                workspace.Env, 
                workspace.Ships, 
                workspace.Islands
            };
            v58.FilterType = Enum.RaycastFilterType.Whitelist;
            v58.IgnoreWater = true;
            local l_Position_0 = game.Workspace.Camera.CFrame.Position;
            local v60 = CFrame.new(l_Position_0, v51:GetMouseCFrame().Position).lookVector * 2000;
            local v61 = workspace:Raycast(l_Position_0, v60, v58);
            local v62 = nil;
            if v61 ~= nil and (v61.Position - v51.roomData.cf.Position).Magnitude < v51.roomData.Size.X * 0.3 then
                v62 = v61.Position;
            end;
            local v63 = game.ReplicatedStorage.Events.Skill:InvokeServer("Tact");
            local v64 = l_Character_3.Humanoid:LoadAnimation(script.tactHold);
            v64:Play();
            v64:AdjustWeight(2);
            v64:AdjustSpeed(1);
            local v65 = tick();
            v51:ChargeSkill(v52, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 355 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                    l_Character_3.Humanoid.CameraOffset = Vector3.new(Random.new():NextNumber(-0.15, 0.15), Random.new():NextNumber(-0.15, 0.15), Random.new():NextNumber(-0.15, 0.15));
                end, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 361 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), v65 (copy), v55 (copy)
                    if l_Character_3:FindFirstChild(script.Name) == nil or tick() - v65 >= 1.5 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v55.Stamina.Value <= 0 or _G.check:inspect(l_Character_3) == false then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v64:Stop();
            local v66 = l_Character_3.Humanoid:LoadAnimation(script.tactRelease);
            v66:Play();
            v66:AdjustWeight(2);
            v66:AdjustSpeed(1);
            local v67 = v51.roomData.Size.X / 150;
            local v68 = math.ceil((tick() - v65) * 4 * v67);
            local v69 = nil;
            if v63 and _G.check:inspect(l_Character_3) == true then
                v69 = v63:InvokeServer({
                    v62, 
                    v68
                });
            end;
            _G.canuse = true;
            _G.FaceMouse = false;
            _G.mouseLevel = false;
            l_Character_3.Humanoid.WalkSpeed = 16;
            do
                local l_v69_0 = v69;
                if l_v69_0 then
                    local v71 = false;
                    do
                        local l_v71_0 = v71;
                        v51:DoubleCastSkill(v52, {
                            Key = Enum.KeyCode.Z, 
                            PassFunction = function() --[[ Line: 399 ]] --[[ Name: PassFunction ]]
                                -- upvalues: l_Character_3 (copy), v51 (copy)
                                return l_Character_3:FindFirstChild(script.Name) and v51.surMode == false and _G.canuse == true and _G.check:inspect(l_Character_3) == true;
                            end, 
                            CompleteFunction = function() --[[ Line: 402 ]] --[[ Name: CompleteFunction ]]
                                -- upvalues: l_v71_0 (ref), l_Character_3 (copy), l_v69_0 (ref), v51 (copy)
                                l_v71_0 = true;
                                local v73 = l_Character_3.Humanoid:LoadAnimation(script.tactLaunch);
                                v73:Play();
                                v73:AdjustWeight(2);
                                v73:AdjustSpeed(1);
                                l_v69_0:FireServer(v51:GetMouseCFrame());
                            end
                        });
                        repeat
                            task.wait();
                        until l_v71_0 == true or v51.roomData == nil;
                        _G.keysetup:cooldown("Tact", l_cd_2);
                        _G.canuse = true;
                        _G.fw(l_cd_2);
                        l_Cooldowns_2.tact = false;
                    end;
                else
                    _G.keysetup:cooldown("Tact", l_cd_2);
                    _G.canuse = true;
                    _G.fw(l_cd_2);
                    l_Cooldowns_2.tact = false;
                end;
            end;
        end;
    end;
end;
v8.Shambles = function(v74, _) --[[ Line: 431 ]] --[[ Name: Shambles ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v74.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Character_4.Parent ~= workspace.Ragdolls and l_Cooldowns_3.shambles == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Shambles") == true then
        local v79 = v3.GetM("Shambles");
        local l_cd_3 = v79.cd;
        if _G.StamCheck("Shambles") == false then
            return;
        elseif v79.statreq and _G.MeetReq(v79.statreq) == false then
            return;
        elseif v74.inRoom == false then
            game:GetService("SoundService"):PlayLocalSound(script.OpeOutOfRoom);
            return;
        elseif _G.shamblesTarget == nil then
            return;
        else
            l_Cooldowns_3.shambles = true;
            local _ = l_Character_4.HumanoidRootPart.Position;
            local l_shamblesTarget_0 = _G.shamblesTarget;
            game:GetService("TweenService"):Create(game.Workspace.Camera, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }, true):Play();
            local v83 = game.ReplicatedStorage.Refrences.Ope.zoomPart:Clone();
            v83.CFrame = game.Workspace.Camera.CFrame;
            _G.destroy(v83, 1);
            local l_CFrame_0 = l_shamblesTarget_0.PrimaryPart.CFrame;
            local v85 = l_Character_4.Humanoid:LoadAnimation(script.shambles);
            v85:Play();
            v85:AdjustWeight(2);
            v85:AdjustSpeed(1);
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Shambles", {
                l_Character_4.PrimaryPart.CFrame, 
                l_shamblesTarget_0, 
                l_CFrame_0
            });
            game:GetService("TweenService"):Create(game.Lighting.ColorCorrectionF, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TintColor = Color3.fromRGB(175, 200, 230)
            }, true):Play();
            task.wait(0.3);
            game:GetService("TweenService"):Create(game.Workspace.Camera, TweenInfo.new(0.275, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 90
            }, true):Play();
            game:GetService("TweenService"):Create(game.Lighting.ColorCorrectionF, TweenInfo.new(0.275, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Brightness = 0.2, 
                Saturation = 0.5
            }, true):Play();
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Size = Vector3.new(1, 1, 1, 0);
            l_Part_0.Transparency = 1;
            l_Part_0.Anchored = true;
            l_Part_0.CanCollide = false;
            l_Part_0.CFrame = l_Character_4.HumanoidRootPart.CFrame;
            l_Part_0.Parent = workspace.Effects;
            _G.destroy(l_Part_0, 0.35);
            game.Workspace.Camera.CameraSubject = l_Part_0;
            l_Character_4.HumanoidRootPart.Anchored = true;
            game:GetService("TweenService"):Create(l_Part_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                CFrame = l_CFrame_0
            }, true):Play();
            task.wait(0.275);
            game:GetService("TweenService"):Create(game.Workspace.Camera, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                FieldOfView = 70
            }, true):Play();
            game:GetService("TweenService"):Create(game.Lighting.ColorCorrectionF, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                Brightness = 0, 
                Saturation = 0
            }, true):Play();
            game:GetService("TweenService"):Create(game.Lighting.ColorCorrectionF, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                TintColor = Color3.fromRGB(255, 255, 255)
            }, true):Play();
            task.wait(0.125);
            game.Workspace.Camera.CameraSubject = l_Character_4.Humanoid;
            l_Character_4.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Shambles", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.shambles = false;
        end;
    end;
end;
v8.CounterShock = function(v88, _) --[[ Line: 536 ]] --[[ Name: CounterShock ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v88.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v88.surMode == false and l_Cooldowns_4.counterShock == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Counter Shock") == true then
        local v93 = v3.GetM("Counter Shock");
        local l_cd_4 = v93.cd;
        if _G.StamCheck("Counter Shock") == false then
            return;
        elseif v93.statreq and _G.MeetReq(v93.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_4.counterShock = true;
            local v95 = l_Character_5.Humanoid:LoadAnimation(script.counterShockHold);
            v95:Play();
            v95:AdjustWeight(2);
            v95:AdjustSpeed(0.5);
            v95.Priority = Enum.AnimationPriority.Action4;
            _G.canuse = false;
            l_Character_5.Humanoid.WalkSpeed = 4;
            local v96 = game.ReplicatedStorage.Events.Skill:InvokeServer("Counter Shock", {
                cf = l_Character_5.HumanoidRootPart.CFrame
            });
            task.wait(0.5);
            if v96 then
                v96:FireServer(l_Character_5.PrimaryPart.CFrame);
            end;
            task.wait(0.4);
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Counter Shock", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.counterShock = false;
        end;
    end;
end;
v8.InjectionShot = function(v97, v98) --[[ Line: 576 ]] --[[ Name: InjectionShot ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v97.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v101 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v97.surMode == true and l_Cooldowns_5.injection == false and _G.check:inspect(l_Character_6) == true and _G.StamCheck("Injection Shot") == true then
        local v102 = v3.GetM("Injection Shot");
        local l_cd_5 = v102.cd;
        if _G.StamCheck("Injection Shot") == false then
            return;
        elseif v102.statreq and _G.MeetReq(v102.statreq) == false then
            return;
        elseif v97.inRoom == false then
            game:GetService("SoundService"):PlayLocalSound(script.OpeOutOfRoom);
            return;
        else
            _G.canuse = false;
            local v104 = game.ReplicatedStorage.Events.Skill:InvokeServer("Injection Shot", {
                cf = v97:GetMouseCFrame()
            });
            if v104 == nil then
                _G.canuse = true;
                return;
            else
                l_Cooldowns_5.injection = true;
                local v105 = l_Character_6.Humanoid:LoadAnimation(script.injectionWindup);
                v105:Play();
                v105:AdjustWeight(2);
                _G.canuse = false;
                _G.FaceMouse = true;
                task.spawn(function() --[[ Line: 609 ]]
                    -- upvalues: v105 (copy)
                    _G.PauseAnim(v105, 0.7, 1);
                end);
                v105:Stop();
                local v106 = l_Character_6.Humanoid:LoadAnimation(script.injectionLoop);
                v106:Play();
                v106:AdjustWeight(2);
                local _ = tick();
                local v108 = tick();
                v97:ChargeSkill(v98, {
                    Key = Enum.KeyCode.X, 
                    EndFunction = function() --[[ Line: 625 ]] --[[ Name: endFunction ]]
                        -- upvalues: v108 (copy), l_Character_6 (copy), v101 (copy)
                        if tick() - v108 >= 1.5 or l_Character_6:FindFirstChild(script.Name) == nil or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v101.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                if tick() - v108 <= 0.5 then
                    task.wait(0.5 - (tick() - v108));
                end;
                v106:Stop();
                local v109 = l_Character_6.Humanoid:LoadAnimation(script.injectionFire);
                v109:Play();
                v109:AdjustWeight(2);
                l_Character_6.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                v109:AdjustSpeed(1);
                if v104 then
                    v104:FireServer(l_Character_6.HumanoidRootPart.CFrame);
                end;
                task.wait(0.75);
                l_Character_6.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Injection Shot", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.injection = false;
            end;
        end;
    end;
end;
v8.RadioKnife = function(v110, v111) --[[ Line: 659 ]] --[[ Name: RadioKnife ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_6 = v110.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local v114 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v110.surMode == true and l_Cooldowns_6.radio == false and _G.check:inspect(l_Character_7) == true and _G.StamCheck("Radio Knife") == true then
        local v115 = v3.GetM("Radio Knife");
        local l_cd_6 = v115.cd;
        if _G.StamCheck("Radio Knife") == false then
            return;
        elseif v115.statreq and _G.MeetReq(v115.statreq) == false then
            return;
        elseif v110.inRoom == false then
            game:GetService("SoundService"):PlayLocalSound(script.OpeOutOfRoom);
            return;
        else
            _G.canuse = false;
            local v117 = game.ReplicatedStorage.Events.Skill:InvokeServer("Radio Knife", {
                cf = v110:GetMouseCFrame()
            });
            l_Cooldowns_6.radio = true;
            local v118 = l_Character_7.Humanoid:LoadAnimation(script.radioWind);
            v118:Play();
            v118:AdjustWeight(2);
            v118:AdjustSpeed(0.66);
            _G.canuse = false;
            _G.FaceMouse = true;
            task.wait(0.625);
            v118:Stop();
            local v119 = l_Character_7.Humanoid:LoadAnimation(script.radioLoop);
            v119:Play();
            v119:AdjustWeight(2);
            local _ = tick();
            local v121 = tick();
            v110:ChargeSkill(v111, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 709 ]] --[[ Name: endFunction ]]
                    -- upvalues: v121 (copy), l_Character_7 (copy), v114 (copy)
                    if tick() - v121 >= 2 or l_Character_7:FindFirstChild(script.Name) == nil or l_Character_7.Parent == nil or l_Character_7.Parent ~= workspace.PlayerCharacters or v114.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v119:Stop();
            local v122 = l_Character_7.Humanoid:LoadAnimation(script.radioEnd);
            v122:Play();
            v122:AdjustSpeed(0);
            v122:AdjustWeight(4);
            task.delay(0.25, function() --[[ Line: 726 ]]
                -- upvalues: v122 (copy)
                v122:AdjustSpeed(1);
            end);
            l_Character_7.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            if v117 then
                v117:FireServer(l_Character_7.HumanoidRootPart.CFrame);
            end;
            task.wait(1.25);
            l_Character_7.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Radio Knife", l_cd_6);
            _G.fw(l_cd_6);
            l_Cooldowns_6.radio = false;
        end;
    end;
end;
v8.Thorn = function(v123, v124) --[[ Line: 744 ]] --[[ Name: Thorn ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_7 = v123.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local v127 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v123.surMode == false and l_Cooldowns_7.thorn == false and _G.check:inspect(l_Character_8) == true and _G.StamCheck("Thorn") == true then
        local v128 = v3.GetM("Thorn");
        local l_cd_7 = v128.cd;
        if _G.StamCheck("Thorn") == false then
            return;
        elseif v128.statreq and _G.MeetReq(v128.statreq) == false then
            return;
        elseif v123.inRoom == false then
            game:GetService("SoundService"):PlayLocalSound(script.OpeOutOfRoom);
            return;
        else
            _G.canuse = false;
            l_Cooldowns_7.thorn = true;
            local v130 = l_Character_8.Humanoid:LoadAnimation(script.thornCharge);
            v130:Play();
            v130:AdjustWeight(2);
            local v131 = tick();
            _G.canuse = false;
            local v132 = RaycastParams.new();
            v132.FilterDescendantsInstances = {
                workspace.Islands, 
                workspace.Env, 
                workspace.Ships
            };
            v132.FilterType = Enum.RaycastFilterType.Whitelist;
            v132.IgnoreWater = true;
            local l_Position_2 = game.Workspace.Camera.CFrame.Position;
            local v134 = CFrame.new(l_Position_2, v123:GetMouseCFrame().p).lookVector * 2000;
            local v135 = workspace:Raycast(l_Position_2, v134, v132);
            local v136 = nil;
            do
                local l_v136_0 = v136;
                local function v138(v139, v140, v141) --[[ Line: 787 ]] --[[ Name: findViableCFrame ]]
                    -- upvalues: v123 (copy), v132 (copy), l_v136_0 (ref), v138 (copy)
                    local v142 = CFrame.new(v139, v140) * CFrame.new(0, 0, -(v139 - v140).Magnitude * v141).Position;
                    local v143 = CFrame.new(v142, v142 - Vector3.new(0, 1, 0, 0)).lookVector * v123.roomData.Size.X;
                    local v144 = workspace:Raycast(v142, v143, v132);
                    if v144 ~= nil and (v123.roomData.cf.Position - v144.Position).Magnitude < v123.roomData.Size.X / 2 then
                        l_v136_0 = CFrame.new(v144.Position, v144.Position + v144.Normal);
                        return;
                    else
                        if v141 + 0.1 <= 1 then
                            v138(v139, v140, v141 + 0.1);
                        end;
                        return;
                    end;
                end;
                if v135 ~= nil and (v135.Position - v123.roomData.cf.Position).Magnitude < v123.roomData.Size.X / 2 then
                    l_v136_0 = CFrame.new(v135.Position, v135.Position + v135.Normal);
                elseif v135 ~= nil and (v135.Position - v123.roomData.cf.Position).Magnitude > v123.roomData.Size.X / 2 then
                    v138(CFrame.new(v123.roomData.cf.Position, (Vector3.new(v135.Position.X, v123.roomData.cf.Position.Y, v135.Position.Z))) * CFrame.new(0, v123.roomData.Size.X / 2, -v123.roomData.Size.X * 0.4).Position, CFrame.new(v123.roomData.cf.Position, (Vector3.new(v135.Position.X, v123.roomData.cf.Position.Y, v135.Position.Z))) * CFrame.new(0, v123.roomData.Size.X / 2, v123.roomData.Size.X * 0.4).Position, 0);
                elseif v135 == nil then
                    v138(CFrame.new(v123.roomData.cf.Position, (Vector3.new(game.Players.LocalPlayer:GetMouse().Hit.Position.X, v123.roomData.cf.Position.Y, game.Players.LocalPlayer:GetMouse().Hit.Position.Z))) * CFrame.new(0, v123.roomData.Size.X / 2, -v123.roomData.Size.X * 0.4).Position, CFrame.new(v123.roomData.cf.Position, (Vector3.new(game.Players.LocalPlayer:GetMouse().Hit.Position.X, v123.roomData.cf.Position.Y, game.Players.LocalPlayer:GetMouse().Hit.Position.Z))) * CFrame.new(0, v123.roomData.Size.X / 2, v123.roomData.Size.X * 0.4).Position, 0);
                end;
                if l_v136_0 == nil then
                    l_v136_0 = l_Character_8.PrimaryPart.CFrame;
                end;
                local l_Skill_0 = game.ReplicatedStorage.Events.Skill;
                local v146 = "Thorn";
                local v147 = CFrame.Angles(0, 0, 0);
                l_Skill_0 = l_Skill_0:InvokeServer(v146, l_v136_0 * v147 * CFrame.new(0, 0.1, 0));
                v123:ChargeSkill(v124, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 824 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_8 (copy)
                        l_Character_8.Humanoid.WalkSpeed = 4;
                    end, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 828 ]] --[[ Name: endFunction ]]
                        -- upvalues: v131 (copy), l_Character_8 (copy), v127 (copy)
                        if tick() - v131 >= 1 or l_Character_8:FindFirstChild(script.Name) == nil or l_Character_8.Parent == nil or l_Character_8.Parent ~= workspace.PlayerCharacters or v127.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                if tick() - v131 < 0.25 then
                    task.wait(0.25 - tick() - v131);
                end;
                v130:Stop();
                local v148 = l_Character_8.Humanoid:LoadAnimation(script.thornRaise);
                v148:Play();
                v148:AdjustSpeed(1);
                if l_Skill_0 then
                    l_Skill_0:FireServer();
                end;
                l_Character_8.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Thorn", l_cd_7);
                _G.fw(l_cd_7);
                l_Cooldowns_7.thorn = false;
            end;
        end;
    end;
end;
v8.GammaKnife = function(v149, v150) --[[ Line: 862 ]] --[[ Name: GammaKnife ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_8 = v149.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local v153 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_8.gamma == false and _G.check:inspect(l_Character_9) == true and _G.StamCheck("Gamma Knife") == true then
        local v154 = v3.GetM("Gamma Knife");
        local l_cd_8 = v154.cd;
        if _G.StamCheck("Gamma Knife") == false then
            return;
        elseif v154.statreq and _G.MeetReq(v154.statreq) == false then
            return;
        elseif v149.inRoom == false then
            game:GetService("SoundService"):PlayLocalSound(script.OpeOutOfRoom);
            return;
        else
            _G.canuse = false;
            local v156 = game.ReplicatedStorage.Events.Skill:InvokeServer("Gamma Knife", {
                cf = v149:GetMouseCFrame()
            });
            l_Cooldowns_8.gamma = true;
            local v157 = l_Character_9.Humanoid:LoadAnimation(script.gamma);
            v157:Play();
            v157:AdjustWeight(5);
            _G.canuse = false;
            l_Character_9.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v157, 0.35, 1);
            local v158 = tick();
            v149:ChargeSkill(v150, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 894 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_9 (copy)
                    l_Character_9.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 899 ]] --[[ Name: endFunction ]]
                    -- upvalues: v158 (copy), l_Character_9 (copy), v153 (copy)
                    if tick() - v158 >= 5 or l_Character_9:FindFirstChild(script.Name) == nil or l_Character_9.Parent == nil or l_Character_9.Parent ~= workspace.PlayerCharacters or v153.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v157:AdjustSpeed(1);
            local l_LinearVelocity_0 = Instance.new("LinearVelocity");
            l_LinearVelocity_0.Attachment0 = l_Character_9.PrimaryPart.RootRigAttachment;
            l_LinearVelocity_0.MaxForce = 100000000000;
            l_LinearVelocity_0.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
            l_LinearVelocity_0.VectorVelocity = l_Character_9:GetPivot().LookVector * 125;
            l_LinearVelocity_0.RelativeTo = Enum.ActuatorRelativeTo.World;
            l_LinearVelocity_0.Parent = l_Character_9;
            local l_AlignOrientation_0 = Instance.new("AlignOrientation");
            l_AlignOrientation_0.Attachment0 = l_Character_9.PrimaryPart.RootRigAttachment;
            l_AlignOrientation_0.Mode = 0;
            l_AlignOrientation_0.CFrame = l_Character_9:GetPivot();
            l_AlignOrientation_0.Responsiveness = 45;
            l_AlignOrientation_0.MaxTorque = 100000000000;
            l_AlignOrientation_0.Parent = l_Character_9;
            _G.tween(l_LinearVelocity_0, {
                0.5, 
                "Linear", 
                Enum.EasingDirection.Out
            }, {
                VectorVelocity = Vector3.new(0, 0, 0, 0)
            });
            _G.destroy(l_LinearVelocity_0, 0.5);
            _G.destroy(l_AlignOrientation_0, 0.5);
            if v156 then
                v156:FireServer("woosh");
            end;
            local v161 = nil;
            local _ = false;
            do
                local l_v161_0 = v161;
                local function v165(v164) --[[ Line: 938 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_LinearVelocity_0 (copy), v156 (copy), l_Character_9 (copy), l_v161_0 (ref)
                    l_LinearVelocity_0:Destroy();
                    if v156 then
                        v156:FireServer(l_Character_9.PrimaryPart.CFrame, v164.Parent);
                        l_v161_0 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_9, Vector3.new(15, 15, 10, 0), 0.25, CFrame.new(0, 0, -1), v165);
                task.wait(0.5);
                l_Character_9.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Gamma Knife", l_cd_8);
                _G.fw(l_cd_8);
                l_Cooldowns_8.gamma = false;
            end;
        end;
    end;
end;
v8.SurgeonMode = function(v166, _) --[[ Line: 957 ]] --[[ Name: SurgeonMode ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v10 (copy), v9 (copy)
    local l_Cooldowns_9 = v166.Cooldowns;
    local l_Character_10 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_9.sur == false and _G.check:inspect(l_Character_10) == true and _G.StamCheck("Surgeon Mode") == true then
        local v171 = v3.GetM("Surgeon Mode");
        local l_cd_9 = v171.cd;
        if _G.StamCheck("Surgeon Mode") == false then
            return;
        elseif v171.statreq and _G.MeetReq(v171.statreq) == false then
            return;
        else
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Surgeon Mode");
            l_Cooldowns_9.sur = true;
            _G.canuse = true;
            if v166.surMode == true then
                local v174 = l_Character_10.Humanoid:LoadAnimation(script.surgeon);
                v174:Play();
                v174:AdjustWeight(2);
                _G.keysetup:Destroy();
                _G.keysetup:setup(script.Name .. " Surgeon Mode", v10);
            else
                local v175 = l_Character_10.Humanoid:LoadAnimation(script.unmode);
                v175:Play();
                v175:AdjustWeight(2);
                _G.keysetup:Destroy();
                _G.keysetup:setup(script.Name, v9);
            end;
            _G.keysetup:cooldown("Surgeon Mode", l_cd_9);
            _G.fw(l_cd_9);
            l_Cooldowns_9.sur = false;
        end;
    end;
end;
return v8;