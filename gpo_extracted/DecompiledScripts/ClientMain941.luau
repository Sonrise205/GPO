--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
_G.hitbox = require(game.ReplicatedStorage.Modules.Hitbox);
_G.check = require(game.ReplicatedStorage.Modules.HumanoidChecks);
_G.canuse = true;
_G.raycast = require(game.ReplicatedStorage.Modules.Raycast);
_G.music2 = true;
local l_Warp_0 = require(game.ReplicatedStorage.Modules:WaitForChild("Warp"));
local v2 = require(game.ReplicatedStorage.Modules.Shared.Signals.GoodSignal);
local v3 = require(l_ReplicatedStorage_0.Modules.ZiliEmitModule);
local v4 = l_Warp_0.Client("PlayEffect");
local l_ClientEffect_0 = game.ReplicatedStorage.Events.ClientEffect;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = script;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
l_LocalPlayer_0:SetAttribute("banned", true);
task.spawn(function() --[[ Line: 28 ]]
    -- upvalues: v3 (copy)
    v3.init();
end);
task.spawn(function() --[[ Line: 32 ]]
    local _ = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules").swoopz);
end);
_G.windowFocus = false;
_G.mobile = false;
if game:GetService("UserInputService").TouchEnabled then
    _G.mobile = true;
end;
game.ReplicatedStorage.Events.pingClient.OnClientInvoke = function() --[[ Line: 41 ]]
    return true;
end;
repeat
    game["Run Service"].Heartbeat:Wait();
until game.Players.LocalPlayer;
local l_UserInputService_0 = game:GetService("UserInputService");
l_UserInputService_0.WindowFocused:Connect(function() --[[ Line: 50 ]]
    _G.windowFocus = true;
end);
l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 54 ]]
    _G.windowFocus = false;
end);
game.ReplicatedStorage.Events.Tween.OnClientEvent:Connect(function(_, v12, v13, v14, v15) --[[ Line: 60 ]]
    if v12 then
        if v12:IsA("ObjectValue") then
            if v12.Value == nil then
                v12.Changed:Wait();
                if v12.Value ~= nil then
                    v12 = v12.Value;
                else
                    return;
                end;
            else
                v12 = v12.Value;
            end;
        end;
        if _G.tween == nil then
            repeat
                task.wait();
            until _G.tween ~= nil;
        end;
        _G.tween(v12, v13, v14, nil, v15);
    end;
end);
_G.ScaleWithHP = function(v16) --[[ Line: 90 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    return v16 * (l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth);
end;
local v18 = require(game.ReplicatedStorage.Modules.BoatTween);
local v19 = {};
_G.tween = function(v20, v21, v22, v23, v24) --[[ Line: 98 ]]
    -- upvalues: v19 (copy), v18 (copy)
    if v24 ~= nil and v19[v20] then
        local v25 = v19[v20][1];
        local _ = v19[v20][2];
        v25:Stop();
        v25:Destroy();
        v19[v20] = nil;
    end;
    if not v20 or v20 == nil or v20.Parent == nil or v20:IsA("BasePart") or v20.Parent:IsA("BasePart") then

    end;
    pcall(function() --[[ Line: 131 ]]
        -- upvalues: v19 (ref), v20 (copy), v22 (copy)
        if v19[v20] then
            local v27 = v19[v20][1];
            local v28 = v19[v20][2];
            local v29 = false;
            for v30, _ in v22 do
                if v28[v30] then
                    v29 = true;
                end;
            end;
            if v29 == true then
                v27:Stop();
                v27:Destroy();
                v19[v20] = nil;
            end;
        end;
    end);
    local v32 = v21[2];
    if typeof(v21[2]) ~= "string" then
        v32 = tostring(v21[2]);
        v32 = string.gsub(v32, "Enum.EasingStyle.", "");
    end;
    local v33 = tostring(v21[3]);
    v33 = string.gsub(v33, "Enum.EasingDirection.", "");
    local v34 = "Heartbeat";
    if _G.fastmode == true then
        v34 = "Heartbeat";
    end;
    if v23 then
        v34 = v23;
    end;
    local v35 = v18:Create(v20, {
        Time = v21[1], 
        EasingStyle = v32, 
        EasingDirection = v33, 
        Reverses = v21[5], 
        DelayTime = v21[6], 
        RepeatCount = v21[4], 
        StepType = v34, 
        CustomEventStepFreq = v22.CustomEventStepFreq or nil, 
        Goal = v22
    });
    v19[v20] = {
        v35, 
        v22
    };
    v35:Play();
    local v36 = nil;
    if v35 ~= nil and v35.Completed ~= nil then
        v36 = v35.Completed:Connect(function() --[[ Line: 188 ]]
            -- upvalues: v36 (ref), v35 (copy), v19 (ref), v20 (copy), v22 (copy)
            v36:Disconnect();
            v36 = nil;
            pcall(function() --[[ Line: 191 ]]
                -- upvalues: v35 (ref)
                v35:Destroy();
            end);
            v19[v20] = nil;
            table.clear(v22);
        end);
        v20.Destroying:Once(function() --[[ Line: 198 ]]
            -- upvalues: v36 (ref), v35 (copy), v19 (ref), v20 (copy), v22 (copy)
            if v36 then
                v36:Disconnect();
                v36 = nil;
            end;
            pcall(function() --[[ Line: 204 ]]
                -- upvalues: v35 (ref)
                v35:Destroy();
            end);
            v19[v20] = nil;
            table.clear(v22);
        end);
    else
        v19[v20] = nil;
    end;
    return v35;
end;
local v37 = require(game.ReplicatedStorage.Modules.StreamingObjectsModule);
_G.PlayEffect = function(v38, v39, ...) --[[ Line: 222 ]]
    if _G.checkRenderDistance == nil then
        repeat
            task.wait();
        until _G.checkRenderDistance ~= nil;
    end;
    if _G.getEffect == nil then
        repeat
            task.wait();
        until _G.getEffect;
    end;
    local v40 = _G.getEffect(v38);
    if v40 then
        local v41 = {
            ...
        };
        if v39 == "skipThread" then
            return (v40:start(unpack(v41)));
        else
            task.spawn(function() --[[ Line: 242 ]]
                -- upvalues: v40 (copy), v41 (copy), v38 (copy)
                if v40.start then
                    v40:start(unpack(v41));
                    return;
                else
                    warn(v38, " has no start function!");
                    return;
                end;
            end);
            return true;
        end;
    else
        warn("cant find effect " .. v38);
        return;
    end;
end;
local function v48(v42, ...) --[[ Line: 257 ]] --[[ Name: playeffect ]]
    -- upvalues: v37 (copy)
    local v43 = false;
    local function v46(v44, ...) --[[ Line: 260 ]] --[[ Name: play ]]
        -- upvalues: v37 (ref), v43 (ref)
        local v45 = v37:resolveArgs({
            ...
        });
        if v45 == "TIMED OUT VALUE" then
            warn("Package timed out" .. v44);
            return false;
        else
            v43 = _G.PlayEffect(v44, nil, unpack(v45));
            return;
        end;
    end;
    local v47 = task.spawn(v46, v42, ...);
    task.delay(5, function() --[[ Line: 275 ]]
        -- upvalues: v43 (ref), v47 (copy)
        if v43 == false then
            task.cancel(v47);
        end;
    end);
end;
local function v51(v49, v50, ...) --[[ Line: 283 ]] --[[ Name: effectRemoteFunction ]]
    -- upvalues: v48 (copy)
    if v50 == nil then
        return;
    elseif math.floor(workspace:GetServerTimeNow() - v50) >= 60 and v49 ~= "SoulProjectile" then
        warn("effect " .. v49 .. " was timed out");
        return;
    else
        v48(v49, ...);
        return;
    end;
end;
v4:Connect(v51);
l_ClientEffect_0.OnClientEvent:Connect(v51);
game.ReplicatedStorage.Events.ClientEffectUnrealiable.OnClientEvent:Connect(v51);
local function v57(v52, v53, v54) --[[ Line: 306 ]] --[[ Name: tweeneffect ]]
    local v55 = {};
    if v54 == nil then
        v55 = if v52:IsA("BlurEffect") and v53 then {
            Size = v53.Size
        } else {
            Brightness = v53.Brightness, 
            Contrast = v53.Contrast, 
            Saturation = v53.Saturation, 
            TintColor = v53.TintColor
        };
    end;
    if v54 then
        v55 = v54;
    end;
    local v56 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
    game:GetService("TweenService"):Create(v52, v56, v55):Play();
end;
game.ReplicatedStorage.Events.EffectOverlay.OnClientEvent:Connect(function(v58, v59, v60) --[[ Line: 330 ]]
    -- upvalues: v57 (copy)
    if v58 == "Hao" then
        local v61 = Instance.new("BlurEffect", workspace.CurrentCamera);
        local v62 = Instance.new("ColorCorrectionEffect", workspace.CurrentCamera);
        v57(v61, script.EffectOvers.Hao.Blur);
        v57(v62, script.EffectOvers.Hao.ColorCorrection);
        _G.destroy(v61, v59 + 0.25);
        _G.destroy(v62, v59 + 0.25);
        task.wait(v59);
        v57(v61, nil, {
            Size = 0
        });
        v57(v62, nil, {
            Brightness = 0, 
            Contrast = 0, 
            Saturation = 0, 
            TintColor = Color3.fromRGB(255, 255, 255)
        });
        return;
    elseif v58 == "HaoVictim" then
        local v63 = Instance.new("BlurEffect", workspace.CurrentCamera);
        local v64 = Instance.new("ColorCorrectionEffect", workspace.CurrentCamera);
        v57(v63, script.EffectOvers.HaoVictim.Blur);
        v57(v64, script.EffectOvers.HaoVictim.ColorCorrection);
        _G.destroy(v63, v59 + 0.25);
        _G.destroy(v64, v59 + 0.25);
        script.EffectOvers.HaoVictim.SFX:Play();
        local l_music_0 = _G.music;
        _G.music = false;
        task.wait(v59);
        if l_music_0 == true then
            _G.music = true;
        end;
        script.EffectOvers.HaoVictim.SFX:Stop();
        v57(v63, nil, {
            Size = 0
        });
        v57(v64, nil, {
            Brightness = 0, 
            Contrast = 0, 
            Saturation = 0, 
            TintColor = Color3.fromRGB(255, 255, 255)
        });
        return;
    elseif v58 == "Blinded" then
        local v66 = script.EffectOvers.Blinded.ColorCorrection:Clone();
        v66.Parent = workspace.CurrentCamera;
        _G.tween(v66, {
            2, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Brightness = 10
        });
        task.wait(3);
        _G.destroy(v66, 2);
        _G.tween(v66, {
            2, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Brightness = 0
        });
        return;
    elseif v58 == "SonSon" then
        local v67 = script.EffectOvers.SonSon.ColorCorrection:Clone();
        v67.Parent = workspace.CurrentCamera;
        _G.tween(v67, {
            0.1, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            TintColor = Color3.fromRGB(255, 0, 0)
        });
        local v68 = script.EffectOvers.SonSon.ScreenGui:Clone();
        v68.Frame.Size = UDim2.new(0, 0, 0, 0);
        v68.Parent = game.Players.LocalPlayer.PlayerGui;
        v68.Frame.Rotation = math.random(-360, 360);
        v68.Frame.Position = UDim2.new(math.random(100, 800) / 1000, 0, 0.5, 0);
        task.spawn(function() --[[ Line: 383 ]]
            -- upvalues: v68 (copy)
            task.wait(0.8);
            pcall(function() --[[ Line: 385 ]]
                _G.PlaySound(game.Players.LocalPlayer.Character.Head, script.EffectOvers.SonSon.Cut3);
            end);
            v68.Frame.Size = UDim2.new(0.15, 0, 4, 0);
            _G.tween(v68.Frame, {
                0.5, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = UDim2.new(0.15, 0, 4, 0), 
                SliceScale = -20
            });
            task.wait(0.5);
            _G.destroy(v68, 0.1);
        end);
        task.wait(1.5);
        _G.tween(v67, {
            0.1, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            TintColor = Color3.fromRGB(255, 255, 255)
        });
        _G.destroy(v67, 0.1);
        return;
    elseif v58 == "Phoenix" then
        local v69 = script.EffectOvers.Phoenix.ScreenGui:Clone();
        v69.Frame.Size = UDim2.new(0, 0, 0, 0);
        v69.Parent = game.Players.LocalPlayer.PlayerGui;
        v69.Frame.Rotation = math.random(-360, 360);
        v69.Frame.Position = UDim2.new(math.random(100, 800) / 1000, 0, 0.5, 0);
        if math.random(1, 2) == 1 then
            v69.Frame.ImageColor3 = Color3.fromRGB(255, 255, 0);
        end;
        task.spawn(function() --[[ Line: 407 ]]
            -- upvalues: v69 (copy)
            v69.Frame.Size = UDim2.new(0.15, 0, 4, 0);
            _G.tween(v69.Frame, {
                0.5, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = UDim2.new(0.15, 0, 4, 0), 
                SliceScale = -50
            });
            task.wait(0.5);
            _G.destroy(v69, 0.1);
        end);
        return;
    else
        if v58 == "Rashmon" then
            local v70 = script.EffectOvers.Rashmon.ColorCorrection:Clone();
            v70.Parent = workspace.CurrentCamera;
            if v60 and v60.excu then
                v70.TintColor = Color3.fromRGB(255, 0, 0);
            end;
            _G.tween(v70, {
                0.1, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Saturation = -1
            });
            task.spawn(function() --[[ Line: 423 ]]
                -- upvalues: v60 (copy)
                task.wait(0.7);
                local v71 = script.EffectOvers.Rashmon.ScreenGui:Clone();
                v71.Frame.Size = UDim2.new(0, 0, 0, 0);
                v71.Parent = game.Players.LocalPlayer.PlayerGui;
                if v60 and v60.Color ~= nil then
                    v71.Frame3.ImageColor3 = v60.Color;
                    v71.Frame4.ImageColor3 = v60.Color;
                end;
                if v60 and v60.excu then
                    warn("exc");
                    v71.excu:Play();
                end;
                local l_v71_Children_0 = v71:GetChildren();
                for v73 = 1, #l_v71_Children_0 do
                    if l_v71_Children_0[v73]:IsA("ImageLabel") then
                        l_v71_Children_0[v73].Size = UDim2.new(l_v71_Children_0[v73].Size.X.Scale, 0, 4, 0);
                        _G.tween(l_v71_Children_0[v73], {
                            0.5, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Size = UDim2.new(l_v71_Children_0[v73].Size.X.Scale, 0, 4, 0), 
                            SliceScale = -50
                        });
                    end;
                end;
                _G.destroy(v71, 3);
            end);
            task.wait(1.2);
            _G.tween(v70, {
                0.1, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Saturation = 0, 
                TintColor = Color3.fromRGB(255, 255, 255)
            });
            _G.destroy(v70, 0.1);
        end;
        return;
    end;
end);
game.ReplicatedStorage.Events.cam.OnClientEvent:Connect(function(v74) --[[ Line: 453 ]]
    game.Workspace.CurrentCamera.CameraSubject = v74.Humanoid;
    game.Workspace.CurrentCamera.CameraType = "Custom";
end);
game.ReplicatedStorage.Events.CustomWeld.OnClientEvent:Connect(function(v75, v76, v77, v78) --[[ Line: 458 ]]
    if _G.customWeld == nil then
        return;
    else
        _G.customWeld(v75, v76, v77, v78);
        return;
    end;
end);
local _ = function(v79, v80, v81) --[[ Line: 465 ]] --[[ Name: pop ]]
    task.spawn(function() --[[ Line: 466 ]]
        -- upvalues: v79 (copy), v80 (ref), v81 (ref)
        if v79:GetAttribute("size") == nil then
            v79:SetAttribute("size", v79.Size);
        end;
        if v79:GetAttribute("pos") == nil then
            v79:SetAttribute("pos", v79.Position);
        end;
        local l_v79_Attribute_0 = v79:GetAttribute("size");
        local l_v79_Attribute_1 = v79:GetAttribute("pos");
        if v80 == nil then
            v80 = 0;
        end;
        if v81 == nil then
            v81 = 0;
        end;
        local _ = v79.TextColor3;
        v79.TextColor3 = Color3.fromRGB(255, 255, 255);
        v79:TweenSizeAndPosition(UDim2.new(l_v79_Attribute_0.X.Scale + v81, 0, l_v79_Attribute_0.Y.Scale + v81, 0), UDim2.new(l_v79_Attribute_1.X.Scale + v80, 0, l_v79_Attribute_1.Y.Scale, 0), "Out", "Elastic", 0.1, true);
        task.wait(0.1);
        v79:TweenSizeAndPosition(l_v79_Attribute_0, l_v79_Attribute_1, "Out", "Quad", 0.1, true);
    end);
end;
game.ReplicatedStorage.Events.ComboIndicator.OnClientEvent:Connect(function(v86) --[[ Line: 495 ]]
    pcall(function() --[[ Line: 496 ]]
        -- upvalues: v86 (ref)
        local l_LocalPlayer_1 = game.Players.LocalPlayer;
        local l_Combo_0 = l_LocalPlayer_1.PlayerGui:FindFirstChild("Combo");
        if l_Combo_0 == nil then
            l_Combo_0 = script.Combo:Clone();
            l_Combo_0.Parent = l_LocalPlayer_1.PlayerGui;
        end;
        v86 = math.ceil(v86);
        l_Combo_0.NUMBER.Text = tostring(tonumber(l_Combo_0.NUMBER.Text) + 1);
        l_Combo_0.TextLabel.DAMAGE.Text = tostring(tonumber(l_Combo_0.TextLabel.DAMAGE.Text) + v86);
        local v89 = UDim2.new(0.2 - math.random(-5, 5) / 100, 0, 0.5 - math.random(-5, 5) / 100, 0);
        l_Combo_0.NUMBER.Position = v89;
        l_Combo_0.TextLabel.Position = UDim2.new(v89.X.Scale, 0, v89.Y.Scale + 0.05, 0);
        local l_NUMBER_0 = l_Combo_0.NUMBER;
        local v91 = nil;
        local v92 = 0.05;
        local l_l_NUMBER_0_0 = l_NUMBER_0 --[[ copy: 3 -> 6 ]];
        do
            local l_v91_0, l_v92_0 = v91, v92;
            task.spawn(function() --[[ Line: 466 ]]
                -- upvalues: l_l_NUMBER_0_0 (copy), l_v91_0 (ref), l_v92_0 (ref)
                if l_l_NUMBER_0_0:GetAttribute("size") == nil then
                    l_l_NUMBER_0_0:SetAttribute("size", l_l_NUMBER_0_0.Size);
                end;
                if l_l_NUMBER_0_0:GetAttribute("pos") == nil then
                    l_l_NUMBER_0_0:SetAttribute("pos", l_l_NUMBER_0_0.Position);
                end;
                local l_l_l_NUMBER_0_0_Attribute_0 = l_l_NUMBER_0_0:GetAttribute("size");
                local l_l_l_NUMBER_0_0_Attribute_1 = l_l_NUMBER_0_0:GetAttribute("pos");
                if l_v91_0 == nil then
                    l_v91_0 = 0;
                end;
                if l_v92_0 == nil then
                    l_v92_0 = 0;
                end;
                local _ = l_l_NUMBER_0_0.TextColor3;
                l_l_NUMBER_0_0.TextColor3 = Color3.fromRGB(255, 255, 255);
                l_l_NUMBER_0_0:TweenSizeAndPosition(UDim2.new(l_l_l_NUMBER_0_0_Attribute_0.X.Scale + l_v92_0, 0, l_l_l_NUMBER_0_0_Attribute_0.Y.Scale + l_v92_0, 0), UDim2.new(l_l_l_NUMBER_0_0_Attribute_1.X.Scale + l_v91_0, 0, l_l_l_NUMBER_0_0_Attribute_1.Y.Scale, 0), "Out", "Elastic", 0.1, true);
                task.wait(0.1);
                l_l_NUMBER_0_0:TweenSizeAndPosition(l_l_l_NUMBER_0_0_Attribute_0, l_l_l_NUMBER_0_0_Attribute_1, "Out", "Quad", 0.1, true);
            end);
        end;
        l_NUMBER_0 = l_Combo_0.TextLabel;
        v91 = nil;
        v92 = 0.015;
        local l_l_NUMBER_0_1 = l_NUMBER_0 --[[ copy: 3 -> 7 ]];
        do
            local l_v91_1, l_v92_1 = v91, v92;
            task.spawn(function() --[[ Line: 466 ]]
                -- upvalues: l_l_NUMBER_0_1 (copy), l_v91_1 (ref), l_v92_1 (ref)
                if l_l_NUMBER_0_1:GetAttribute("size") == nil then
                    l_l_NUMBER_0_1:SetAttribute("size", l_l_NUMBER_0_1.Size);
                end;
                if l_l_NUMBER_0_1:GetAttribute("pos") == nil then
                    l_l_NUMBER_0_1:SetAttribute("pos", l_l_NUMBER_0_1.Position);
                end;
                local l_l_l_NUMBER_0_1_Attribute_0 = l_l_NUMBER_0_1:GetAttribute("size");
                local l_l_l_NUMBER_0_1_Attribute_1 = l_l_NUMBER_0_1:GetAttribute("pos");
                if l_v91_1 == nil then
                    l_v91_1 = 0;
                end;
                if l_v92_1 == nil then
                    l_v92_1 = 0;
                end;
                local _ = l_l_NUMBER_0_1.TextColor3;
                l_l_NUMBER_0_1.TextColor3 = Color3.fromRGB(255, 255, 255);
                l_l_NUMBER_0_1:TweenSizeAndPosition(UDim2.new(l_l_l_NUMBER_0_1_Attribute_0.X.Scale + l_v92_1, 0, l_l_l_NUMBER_0_1_Attribute_0.Y.Scale + l_v92_1, 0), UDim2.new(l_l_l_NUMBER_0_1_Attribute_1.X.Scale + l_v91_1, 0, l_l_l_NUMBER_0_1_Attribute_1.Y.Scale, 0), "Out", "Elastic", 0.1, true);
                task.wait(0.1);
                l_l_NUMBER_0_1:TweenSizeAndPosition(l_l_l_NUMBER_0_1_Attribute_0, l_l_l_NUMBER_0_1_Attribute_1, "Out", "Quad", 0.1, true);
            end);
        end;
        l_NUMBER_0 = l_Combo_0.TextLabel.DAMAGE;
        v91 = nil;
        v92 = 0.015;
        local l_l_NUMBER_0_2 = l_NUMBER_0 --[[ copy: 3 -> 8 ]];
        do
            local l_v91_2, l_v92_2 = v91, v92;
            task.spawn(function() --[[ Line: 466 ]]
                -- upvalues: l_l_NUMBER_0_2 (copy), l_v91_2 (ref), l_v92_2 (ref)
                if l_l_NUMBER_0_2:GetAttribute("size") == nil then
                    l_l_NUMBER_0_2:SetAttribute("size", l_l_NUMBER_0_2.Size);
                end;
                if l_l_NUMBER_0_2:GetAttribute("pos") == nil then
                    l_l_NUMBER_0_2:SetAttribute("pos", l_l_NUMBER_0_2.Position);
                end;
                local l_l_l_NUMBER_0_2_Attribute_0 = l_l_NUMBER_0_2:GetAttribute("size");
                local l_l_l_NUMBER_0_2_Attribute_1 = l_l_NUMBER_0_2:GetAttribute("pos");
                if l_v91_2 == nil then
                    l_v91_2 = 0;
                end;
                if l_v92_2 == nil then
                    l_v92_2 = 0;
                end;
                local _ = l_l_NUMBER_0_2.TextColor3;
                l_l_NUMBER_0_2.TextColor3 = Color3.fromRGB(255, 255, 255);
                l_l_NUMBER_0_2:TweenSizeAndPosition(UDim2.new(l_l_l_NUMBER_0_2_Attribute_0.X.Scale + l_v92_2, 0, l_l_l_NUMBER_0_2_Attribute_0.Y.Scale + l_v92_2, 0), UDim2.new(l_l_l_NUMBER_0_2_Attribute_1.X.Scale + l_v91_2, 0, l_l_l_NUMBER_0_2_Attribute_1.Y.Scale, 0), "Out", "Elastic", 0.1, true);
                task.wait(0.1);
                l_l_NUMBER_0_2:TweenSizeAndPosition(l_l_l_NUMBER_0_2_Attribute_0, l_l_l_NUMBER_0_2_Attribute_1, "Out", "Quad", 0.1, true);
            end);
        end;
        l_NUMBER_0 = tick();
        if l_Combo_0:FindFirstChild("pretick") then
            l_Combo_0.pretick.Value = l_NUMBER_0;
        end;
        task.wait(2);
        if l_Combo_0.pretick.Value == l_NUMBER_0 and l_Combo_0.Parent ~= nil and tick() - l_Combo_0.pretick.Value >= 2 then
            l_Combo_0.Name = "gone";
            v91 = function(v111) --[[ Line: 522 ]] --[[ Name: trans ]]
                _G.tween(v111, {
                    0.25, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    TextTransparency = 1, 
                    TextStrokeTransparency = 1
                });
            end;
            v91(l_Combo_0.NUMBER);
            v91(l_Combo_0.TextLabel.DAMAGE);
            v91(l_Combo_0.TextLabel);
            _G.destroy(l_Combo_0, 0.25);
        end;
    end);
end);
_G.clientimpacts = {};
if _G.getEffect == nil then
    repeat
        task.wait();
    until _G.getEffect ~= nil;
end;
workspace:WaitForChild("Env"):WaitForChild("WaterStuff"):WaitForChild("Falls");
local l_Children_0 = game.ReplicatedStorage.ClientImpacts:GetChildren();
for v113 = 1, #l_Children_0 do
    _G.clientimpacts[l_Children_0[v113]] = require(l_Children_0[v113]);
end;
game.ReplicatedStorage.Events.ClientImpact.OnClientEvent:Connect(function(v114, v115, ...) --[[ Line: 544 ]]
    -- upvalues: v48 (copy)
    if v114 == game.Players.LocalPlayer then
        return;
    elseif _G.clientimpacts[game.ReplicatedStorage.ClientImpacts:FindFirstChild(v115)] then
        local v116 = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts:FindFirstChild(v115)];
        local v117 = _G.streamArgs(...);
        if v117 == "INVALID" then
            return;
        else
            v116:start(unpack(v117));
            return;
        end;
    else
        if _G.getEffect(v115) then
            v48(v115, ...);
        end;
        return;
    end;
end);
local v118 = _G.getEffect("FastCast");
game.ReplicatedStorage.Events.FastCast.OnClientEvent:Connect(function(...) --[[ Line: 568 ]]
    -- upvalues: v118 (copy)
    v118:start(...);
end);
local function _(v119) --[[ Line: 575 ]] --[[ Name: removeTextures ]]
    local l_v119_Children_0 = v119:GetChildren();
    for v121 = 1, #l_v119_Children_0 do
        if l_v119_Children_0[v121]:IsA("Texture") then
            l_v119_Children_0[v121]:Destroy();
        end;
    end;
end;
_G.fastmode = false;
_G.omegabooster = false;
local _ = {};
game.ReplicatedStorage.Events.Rope.OnClientEvent:Connect(function(v124, v125, v126) --[[ Line: 589 ]]
    if v125 == nil or v124 and v124:IsDescendantOf(workspace) == false or v125 and v125:IsDescendantOf(workspace) == false or workspace.Effects:FindFirstChild(v125.Name) or v124 == nil or v125 == nil then
        return;
    else
        local l_v126_0 = v126;
        if l_v126_0 == nil then
            l_v126_0 = 30;
        end;
        if v124 == game.Players.LocalPlayer.Character or v125 ~= game.Players.LocalPlayer.Character then
            local v128 = game.ReplicatedStorage.RopePart:Clone();
            v128.Parent = workspace.Effects;
            v128.CFrame = v124.HumanoidRootPart.CFrame;
            v128.Name = v125.Name;
            local l_Attachment2_0 = v128.Attachment2;
            l_Attachment2_0.Parent = v125.HumanoidRootPart;
            v128.RopeConstraint.Attachment1 = l_Attachment2_0;
            v128.RopeConstraint.Attachment0 = v128.Attachment;
            if v126 then
                v128.RopeConstraint.Length = v126 / 2;
            end;
            v128.Anchored = false;
            task.spawn(function() --[[ Line: 611 ]]
                -- upvalues: v125 (copy), v124 (copy), v128 (copy), l_Attachment2_0 (copy), l_v126_0 (ref)
                local v130 = nil;
                v130 = game["Run Service"].Stepped:Connect(function() --[[ Line: 613 ]]
                    -- upvalues: v125 (ref), v124 (ref), v128 (ref), v130 (ref), l_Attachment2_0 (ref), l_v126_0 (ref)
                    if v125.Parent == nil or v124.Parent == nil or v125 and v125:FindFirstChild("Roped") == nil then
                        if v124 == game.Players.LocalPlayer.Character then
                            game.ReplicatedStorage.Events.Rope:FireServer("snap");
                        end;
                        v128:Destroy();
                        v130:disconnect();
                        v130 = nil;
                        return;
                    else
                        l_Attachment2_0.WorldPosition = v125.Collar.UpperTorso.Hole.Position;
                        v128.CFrame = v124.RightHand.CFrame;
                        if v124:FindFirstChild("HumanoidRootPart") and v125:FindFirstChild("HumanoidRootPart") and (v124.HumanoidRootPart.Position - v125.HumanoidRootPart.Position).magnitude >= l_v126_0 then
                            v128:Destroy();
                            v130:disconnect();
                            v130 = nil;
                            if v124 == game.Players.LocalPlayer.Character then
                                game.ReplicatedStorage.Events.Rope:FireServer("snap");
                            end;
                        end;
                        return;
                    end;
                end);
            end);
        elseif v125 == game.Players.LocalPlayer.Character then
            local v131 = game.ReplicatedStorage.RopePart:Clone();
            v131.Parent = workspace.Effects;
            v131.CFrame = v124.HumanoidRootPart.CFrame;
            v131.Name = v125.Name;
            if v126 then
                v131.RopeConstraint.Length = v126 / 2;
            end;
            local l_Attachment2_1 = v131.Attachment2;
            l_Attachment2_1.Parent = v125.HumanoidRootPart;
            v131.RopeConstraint.Attachment1 = l_Attachment2_1;
            v131.RopeConstraint.Attachment0 = v131.Attachment;
            v131.Anchored = true;
            task.spawn(function() --[[ Line: 652 ]]
                -- upvalues: v125 (copy), v124 (copy), v131 (copy), l_Attachment2_1 (copy)
                local v133 = nil;
                v133 = game["Run Service"].Stepped:Connect(function() --[[ Line: 654 ]]
                    -- upvalues: v125 (ref), v124 (ref), v131 (ref), v133 (ref), l_Attachment2_1 (ref)
                    if v125.Parent == nil or v124.Parent == nil then
                        v131:Destroy();
                        v133:disconnect();
                        v133 = nil;
                        game.ReplicatedStorage.Events.Rope:FireServer("snap");
                        return;
                    elseif v125:FindFirstChild("Roped") == nil then
                        v131:Destroy();
                        v133:disconnect();
                        v133 = nil;
                        return;
                    else
                        if v124 == nil or v124.Parent == nil or v124:IsDescendantOf(workspace) == false then
                            v131:Destroy();
                            v133:disconnect();
                            v133 = nil;
                            game.ReplicatedStorage.Events.Rope:FireServer("snap");
                        end;
                        l_Attachment2_1.WorldPosition = v125.Collar.UpperTorso.Hole.Position;
                        v131.CFrame = v124.RightHand.CFrame;
                        return;
                    end;
                end);
            end);
        end;
        return;
    end;
end);
local _ = {};
local function _(v135) --[[ Line: 682 ]] --[[ Name: cleanClone ]]
    local l_PlayingAnimationTracks_0 = v135.Humanoid:GetPlayingAnimationTracks();
    for v137 = 1, #l_PlayingAnimationTracks_0 do
        l_PlayingAnimationTracks_0[v137]:Stop();
    end;
    local l_v135_Descendants_0 = v135:GetDescendants();
    for v139 = 1, #l_v135_Descendants_0 do
        if l_v135_Descendants_0[v139]:IsA("Tool") then
            l_v135_Descendants_0[v139]:Destroy();
        elseif l_v135_Descendants_0[v139]:IsA("LocalScript") then
            l_v135_Descendants_0[v139]:Destroy();
        elseif l_v135_Descendants_0[v139]:IsA("Model") and l_v135_Descendants_0[v139].Name:match("Back") then
            l_v135_Descendants_0[v139]:Destroy();
        elseif not l_v135_Descendants_0[v139]:IsA("Weld") and l_v135_Descendants_0[v139]:IsA("BasePart") == false and l_v135_Descendants_0[v139].ClassName:match("Mesh") == false then
            l_v135_Descendants_0[v139]:Destroy();
        end;
    end;
end;
local v141 = require(game.ReplicatedStorage.Modules.CameraShaker);
local function v144(v142) --[[ Line: 704 ]] --[[ Name: ShakeCamera ]]
    if _G.cameraShakeEnabled == false then
        return;
    else
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame * v142;
        return;
    end;
end;
task.spawn(function() --[[ Line: 712 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v145 = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name);
    _G.cameraShakeEnabled = v145:WaitForChild("Settings"):WaitForChild("CameraShake").Value;
end);
_G.camShake = v141.new(Enum.RenderPriority.Camera.Value + 1, v144);
_G.camShake:Start();
game.ReplicatedStorage.Events.CameraShake.OnClientEvent:Connect(function(...) --[[ Line: 720 ]]
    if _G.cameraShakeEnabled == false then
        return;
    else
        _G.camShake:ShakeOnce(...);
        return;
    end;
end);
game.ReplicatedStorage.Events.camshake.OnClientEvent:Connect(function(v146, v147, v148) --[[ Line: 728 ]]
    if _G.camshake == nil then
        return;
    else
        _G.camshake(v146, v147, v148);
        return;
    end;
end);
local v149 = 0;
game.ReplicatedStorage.Events.Movement.OnClientEvent:Connect(function(v150) --[[ Line: 737 ]]
    -- upvalues: v149 (ref)
    if v150 == false then
        v149 = v149 + 1;
        if v149 == 1 then
            while true do
                local l_Character_1 = game.Players.LocalPlayer.Character;
                if l_Character_1 and l_Character_1:FindFirstChild("Humanoid") ~= nil then
                    l_Character_1.Humanoid:MoveTo(l_Character_1.HumanoidRootPart.Position);
                    l_Character_1.Humanoid.Jump = false;
                    game["Run Service"].RenderStepped:Wait();
                    if v149 <= 0 then
                        break;
                    end;
                else
                    break;
                end;
            end;
        end;
    else
        v149 = v149 - 1;
    end;
end);
warn("Combat Tag moved, warn just incase");
game.ReplicatedStorage.Events.CombatTag.OnClientEvent:Connect(function(_) --[[ Line: 760 ]]

end);
local v153 = {};
local function v159(v154, v155) --[[ Line: 773 ]] --[[ Name: enableSwordTrails ]]
    -- upvalues: v153 (copy)
    local l_Children_1 = v154.Blade:GetChildren();
    local v157 = game:GetService("HttpService"):GenerateGUID(true);
    if typeof(v155) == "number" then
        v153[v154] = v157;
    end;
    for v158 = 1, #l_Children_1 do
        if (l_Children_1[v158]:IsA("Trail") or l_Children_1[v158]:IsA("ParticleEmitter")) and l_Children_1[v158].Name ~= "notTrail" and l_Children_1[v158]:GetAttribute("trailBypass") == nil then
            if typeof(v155) == "number" then
                l_Children_1[v158].Enabled = true;
                task.delay(v155, function() --[[ Line: 789 ]]
                    -- upvalues: v153 (ref), v154 (copy), v157 (copy), l_Children_1 (copy), v158 (copy)
                    if v153[v154] == v157 then
                        l_Children_1[v158].Enabled = false;
                        task.delay(3, function() --[[ Line: 792 ]]
                            -- upvalues: v153 (ref), v154 (ref), v157 (ref)
                            if v153[v154] == v157 then
                                v153[v154] = nil;
                            end;
                        end);
                    end;
                end);
            else
                l_Children_1[v158].Enabled = v155;
            end;
        end;
    end;
end;
_G.enableSwordTrails = function(v160, v161, v162) --[[ Line: 807 ]]
    -- upvalues: v159 (copy)
    local l_v160_Children_0 = v160:GetChildren();
    for v164 = 1, #l_v160_Children_0 do
        if l_v160_Children_0[v164]:FindFirstChild("Blade") then
            if v162 ~= nil then
                local v165 = true;
                for v166, v167 in pairs(v162) do
                    if l_v160_Children_0[v164]:GetAttribute(v166) == v167 then
                        v165 = false;
                        break;
                    end;
                end;
                if v165 == false then
                    continue;
                end;
            end;
            v159(l_v160_Children_0[v164], v161);
        end;
    end;
end;
game.ReplicatedStorage.Events.swordTrail.OnClientEvent:Connect(function(v168, v169, v170) --[[ Line: 830 ]]
    -- upvalues: v159 (copy)
    if v168 == game.Players.LocalPlayer then
        return;
    elseif v169 == nil then
        return;
    else
        pcall(function() --[[ Line: 837 ]]
            -- upvalues: v159 (ref), v169 (copy), v170 (copy)
            v159(v169, v170);
        end);
        return;
    end;
end);
game.ReplicatedStorage.Events.fruitspawn.OnClientEvent:Connect(function(v171, v172) --[[ Line: 842 ]]
    local v173 = script.sphere:Clone();
    v173.Parent = workspace.Effects;
    v173.CFrame = CFrame.new(v171.p);
    v173.sfx:Play();
    _G.destroy(v173, 60);
    script.spawner:Play();
    for _ = 1, 120 do
        pcall(function() --[[ Line: 853 ]]
            -- upvalues: v173 (copy)
            local v175 = script.sphere.BillboardGui:Clone();
            v175.Name = "d";
            v175.Parent = v173;
            _G.tween(v175, {
                1, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = UDim2.new(0, 150, 0, 150)
            });
            _G.tween(v175.ImageLabel, {
                1, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                ImageTransparency = 1, 
                ImageColor3 = Color3.fromRGB(255, 0, 0)
            });
            v173.sfx:Play();
            _G.destroy(v175, 1);
        end);
        if v172 then
            v173.CFrame = v172.PrimaryPart.CFrame;
        end;
        task.wait(1);
    end;
end);
local _ = require(game.ReplicatedStorage.Modules.ActiveVignette);
local _ = {};
game.ReplicatedStorage.Events.screenEffect.OnClientEvent:Connect(function(_, _, _, _, _) --[[ Line: 872 ]]

end);
_G.ScaleWithFPS = function(v183) --[[ Line: 924 ]]
    local v184 = v183 * (60 / _G.FPS);
    if v183 <= v184 then
        v184 = v183;
    end;
    return v184;
end;
_G.ScaleWithBaseFPS = function(v185) --[[ Line: 932 ]]
    local v186 = v185 * (_G.FPS / 60);
    if v185 <= v186 then
        v186 = v185;
    end;
    return v186;
end;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
_G.camshake = function(v189, v190, v191) --[[ Line: 943 ]]
    -- upvalues: l_sin_0 (copy), l_cos_0 (copy)
    if _G.cameraShakeEnabled == false then
        return;
    else
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        local v193 = 144 / _G.FPS;
        local v194 = tick();
        for v195 = v190, 0, v191 * v193 do
            local l_CoordinateFrame_0 = workspace.CurrentCamera.CoordinateFrame;
            local v197 = v195 / 3;
            local v198 = tick() * v189;
            l_CurrentCamera_1.CoordinateFrame = l_CoordinateFrame_0:Lerp(l_CoordinateFrame_0 * CFrame.new(l_sin_0(v198) * v197 / 10, l_cos_0(v198) * v197 / 10, 0), 0.1);
            if tick() - v194 < 1.5 then
                game["Run Service"].RenderStepped:Wait();
            else
                break;
            end;
        end;
        return;
    end;
end;
_G.ScaleWithHP = function(v199) --[[ Line: 965 ]]
    local l_Character_2 = game.Players.LocalPlayer.Character;
    if l_Character_2 then
        local v201 = l_Character_2.Humanoid.Health / (l_Character_2.Humanoid.MaxHealth / 3);
        if v201 > 1 then
            v201 = 1;
        end;
        return v199 * v201;
    else
        return v199;
    end;
end;
_G.MeetReq = function(v202, v203, v204) --[[ Line: 978 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v205 = true;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    for v207, v208 in v202 do
        if l_FirstChild_0.Stats:FindFirstChild(v207) then
            local l_FirstChild_1 = l_FirstChild_0.Stats:FindFirstChild(v207);
            if (l_FirstChild_0.Stats:FindFirstChild(v207):IsA("NumberValue") or l_FirstChild_0.Stats:FindFirstChild(v207):IsA("IntValue")) and l_FirstChild_0.Stats:FindFirstChild(v207).Value < v208 then
                v205 = false;
                if v204 == nil then
                    _G.displayMessage("<Color=Red>You need " .. v208 .. " " .. v207 .. "!");
                    return v205;
                else
                    break;
                end;
            elseif l_FirstChild_0.Stats:FindFirstChild(v207):IsA("StringValue") and l_FirstChild_0.Stats:FindFirstChild(v207).Value ~= v208 then
                if typeof(v208) == "table" then
                    local v210 = false;
                    for v211 = 1, #v208 do
                        if v208[v211] == l_FirstChild_1.Value then
                            v210 = true;
                            break;
                        end;
                    end;
                    if v210 == false then
                        return false;
                    end;
                else
                    if v204 == nil then
                        _G.displayMessage("<Color=Red>Your " .. v207 .. " isnt " .. v208 .. "!");
                    end;
                    return false;
                end;
            end;
        elseif v207:match("/SKILL/") and v203 == nil then
            v207 = string.gsub(v207, "/SKILL/", "");
            if l_FirstChild_0.Skills:FindFirstChild(v207) and l_FirstChild_0.Skills[v207].Value < v208 then
                v205 = false;
                if v204 == nil then
                    _G.displayMessage("<Color=Red>You havent learned this skill yet!");
                    return v205;
                else
                    break;
                end;
            elseif l_FirstChild_0.Skills:FindFirstChild(v207) == nil then
                return false;
            end;
        end;
    end;
    return v205;
end;
_G.FaceMouse = false;
local v212 = Instance.new("AlignOrientation", script);
v212.Mode = 0;
v212.Responsiveness = 45;
v212.MaxTorque = 1e999;
v212.ReactionTorqueEnabled = false;
local v213 = Instance.new("LinearVelocity", script);
v213.MaxForce = 1e999;
v213.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
v213.VectorVelocity = Vector3.new();
v213.RelativeTo = Enum.ActuatorRelativeTo.World;
local l_RunService_0 = game:GetService("RunService");
local v215 = {};
_G.PauseAnim = function(v216, v217, v218, v219, _) --[[ Line: 1059 ]]
    -- upvalues: v2 (copy), v215 (copy)
    local v221 = v2.new();
    local _ = v216.Animation.AnimationId;
    local _ = game.Players.LocalPlayer.Character;
    v216:AdjustSpeed(v218);
    v216:AdjustWeight(2);
    v216.Priority = Enum.AnimationPriority.Action4;
    local _ = game:GetService("HttpService"):GenerateGUID(true);
    if v218 == nil then
        v218 = 1;
    end;
    local l_TimePosition_0 = v216.TimePosition;
    v215[v216] = {
        Animation = v216, 
        EndTime = v217, 
        Speed = v218, 
        CustomFunction = v219, 
        Event = v221, 
        StartTime = os.clock(), 
        ExtraTime = l_TimePosition_0
    };
    local v226 = false;
    local v227 = task.spawn(function() --[[ Line: 1106 ]]
        -- upvalues: v221 (ref), v226 (ref)
        v221:Wait();
        v226 = true;
    end);
    local v228 = tick();
    repeat
        task.wait();
    until v226 == true or tick() - v228 >= v217 / v218;
    if v227 then
        task.cancel(v227);
    end;
    v221:DisconnectAll();
    v221 = nil;
    v215[v216] = nil;
    v216:AdjustSpeed(0);
    v216.TimePosition = v217;
    game["Run Service"].RenderStepped:Wait();
end;
game["Run Service"].RenderStepped:Connect(function(v229) --[[ Line: 1130 ]] --[[ Name: functionAnimate ]]
    -- upvalues: v215 (copy)
    for v230, v231 in pairs(v215) do
        local l_Animation_0 = v231.Animation;
        local l_EndTime_0 = v231.EndTime;
        local l_Speed_0 = v231.Speed;
        local l_CustomFunction_0 = v231.CustomFunction;
        local l_Event_0 = v231.Event;
        local l_StartTime_0 = v231.StartTime;
        local l_ExtraTime_0 = v231.ExtraTime;
        if l_Animation_0 == nil then
            v215[v230] = nil;
        else
            l_Animation_0.TimePosition = (os.clock() - l_StartTime_0) * l_Speed_0 + l_ExtraTime_0;
            if l_CustomFunction_0 then
                task.spawn(l_CustomFunction_0);
            end;
            _G.canuse = false;
            if os.clock() - l_StartTime_0 >= l_EndTime_0 / l_Speed_0 or l_EndTime_0 <= l_Animation_0.TimePosition + v229 then
                if l_Animation_0.IsPlaying == true then
                    l_Animation_0:AdjustSpeed(0);
                    l_Animation_0.TimePosition = l_EndTime_0;
                    task.delay(60, function() --[[ Line: 1151 ]]
                        -- upvalues: l_Animation_0 (copy)
                        l_Animation_0:Stop();
                    end);
                else
                    l_Animation_0:Play();
                    l_Animation_0:AdjustSpeed(0);
                    l_Animation_0.TimePosition = l_EndTime_0;
                end;
                l_Event_0:Fire();
                v215[v230] = nil;
            elseif l_Animation_0.IsPlaying == false then
                l_Event_0:Fire();
                l_Animation_0:Stop();
                v215[v230] = nil;
            end;
        end;
    end;
end);
local _ = game:GetService("ContextActionService");
local v240 = false;
_G.disableMovement = function(v241) --[[ Line: 1176 ]]
    -- upvalues: v240 (ref)
    v240 = v241;
end;
game.ReplicatedStorage.Events.disableMovement.OnClientEvent:Connect(function(v242) --[[ Line: 1180 ]]
    _G.disableMovement(v242);
end);
game.ReplicatedStorage.Events.note.OnClientEvent:Connect(function(v243, v244, v245) --[[ Line: 1184 ]]
    if _G.displayMessage == nil then
        repeat
            task.wait();
        until _G.displayMessage ~= nil;
    end;
    _G.displayMessage(v243, v244, v245);
end);
game.ReplicatedStorage.Events.enableSeat.OnClientEvent:Connect(function(v246) --[[ Line: 1193 ]]
    v246 = _G.awaitObject(v246);
    if typeof(v246) == "Instance" then
        v246.Disabled = false;
    end;
end);
game.ReplicatedStorage.Events.resetM1.OnClientEvent:Connect(function() --[[ Line: 1200 ]]
    _G.resetM1();
end);
game.ReplicatedStorage.Events.requestCFrame.OnClientEvent:Connect(function(v247, v248, v249) --[[ Line: 1204 ]]
    if v248 ~= nil then
        _G.FaceMouse = v248;
        return;
    else
        if v249 == nil then
            v249 = game.Players.LocalPlayer.Character.PrimaryPart;
        end;
        v247:FireServer(v249.CFrame);
        return;
    end;
end);
local v250 = require(game.ReplicatedStorage.Modules.Skills);
roundNumber = function(v251, v252) --[[ Line: 1217 ]] --[[ Name: roundNumber ]]
    return math.floor(v251 * 10 ^ v252) / 10 ^ v252;
end;
local v253 = {};
game.ReplicatedStorage.Events.skillManager.OnClientEvent:Connect(function(v254, v255, v256) --[[ Line: 1223 ]]
    -- upvalues: v250 (copy), v253 (copy)
    if v256 == true then
        local l_Skills_0 = v250.Skills;
        for v258 = 1, #l_Skills_0 do
            local v259 = l_Skills_0[v258];
            for v260, v261 in pairs(v259) do
                if v261.IsCounter == true and v260 ~= v254 then
                    _G.addSkillCD(v260, v255);
                end;
            end;
        end;
        return;
    else
        v253[v254] = true;
        task.delay(v255, function() --[[ Line: 1237 ]]
            -- upvalues: v253 (ref), v254 (copy)
            v253[v254] = nil;
        end);
        return;
    end;
end);
_G.addSkillCD = function(v262, v263) --[[ Line: 1242 ]]
    -- upvalues: v253 (copy)
    _G.keysetup:cooldown(v262, v263);
    v253[v262] = true;
    task.delay(v263, function() --[[ Line: 1245 ]]
        -- upvalues: v253 (ref), v262 (copy)
        v253[v262] = nil;
    end);
end;
_G.StamCheck = function(v264, v265, v266) --[[ Line: 1252 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v250 (copy), v253 (copy)
    local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if _G.canuse == false and v265 == nil then
        return false;
    elseif game.ReplicatedStorage:FindFirstChild("tradingHUB") then
        return;
    else
        local v268 = nil;
        local v269 = nil;
        local l_Character_4 = game.Players.LocalPlayer.Character;
        local v271 = {
            ["Sky Walk2"] = true
        };
        if type(v264) == "string" then
            local v272 = v250.GetM(v264);
            if v272.stamreq then
                v268 = v272.stamreq;
                v269 = v272.ULT;
                if v272.percentStamina ~= nil then
                    v268 = l_FirstChild_2.Stamina.MaxValue * v272.percentStamina;
                    if v272.baseStamina ~= nil then
                        v268 = v268 + v272.baseStamina;
                    end;
                end;
            end;
            if v272.Ground ~= nil and l_Character_4.Humanoid.FloorMaterial == Enum.Material.Air then
                _G.displayMessage("<Color=Red>I need to be grounded to use this skill!");
                return false;
            elseif _G.blocking == true then
                return false;
            else
                if _G.toolLocked ~= nil and v271[v264] == nil then
                    if _G.toolLocked:IsDescendantOf(game) then
                        if _G.toolLocked.Parent ~= l_LocalPlayer_0.Character then
                            return false;
                        end;
                    else
                        _G.toolLocked = nil;
                    end;
                end;
                if v272 and v272.Grounded ~= nil and l_Character_4 and l_Character_4.Humanoid.FloorMaterial == Enum.Material.Air then
                    _G.displayMessage("<Color=Red>I must touch the ground to use this skill!");
                    return false;
                elseif v271[v264] == nil then
                    local v273 = l_FirstChild_2.Stats.DF.Value:match("V2") ~= nil;
                    local _ = {
                        "Kamishiki", 
                        "Abyssal Karate", 
                        "Moonlit Electro"
                    };
                    local v275 = _G.FightingStylesV2[l_FirstChild_2.Stats.FightingStyle.Value] ~= nil;
                    local v276 = true;
                    if v272.statreq.FightingStyleMastery == nil then
                        v276 = v272.isFS ~= nil;
                    end;
                    local v277 = v272.statreq.DevilFruitMastery ~= nil;
                    if l_FirstChild_2.Settings.CurrentV2.Value ~= "Fruit" and v275 == true then
                        if v277 == true then
                            _G.displayMessage((("I cant use this while wielding the powers of <Color=Blue>%*<Color=/>!"):format(l_FirstChild_2.Stats.FightingStyle.Value)));
                            return false;
                        end;
                    elseif l_FirstChild_2.Settings.CurrentV2.Value == "Fruit" and v273 == true and v276 == true then
                        _G.displayMessage((("I cant use this while wielding the powers of <Color=Orange>%*<Color=/>!"):format(l_FirstChild_2.Stats.DF.Value)));
                        return false;
                    end;
                    if v273 == false and l_FirstChild_2.Stats.DF.Value ~= "" and _G.FightingStylesV2[l_FirstChild_2.Stats.FightingStyle.Value] and v277 == true then
                        _G.displayMessage((("I cant use this while wielding the powers of <Color=Blue>%*<Color=/>!"):format(l_FirstChild_2.Stats.FightingStyle.Value)));
                        return false;
                    elseif v275 == false and v273 == true and v276 == true then
                        _G.displayMessage((("I cant use this while wielding the powers of <Color=Orange>%*<Color=/>!"):format(l_FirstChild_2.Stats.DF.Value)));
                        return false;
                    end;
                end;
            end;
        else
            v268 = v264;
        end;
        if _G.canuse == false and v265 == nil then
            return false;
        elseif v269 ~= nil and _G.checkUlt(game.Players.LocalPlayer) == false then
            return false;
        else
            if v266 then
                v268 = v266;
            end;
            if v253[v264] and v271[v264] == nil then
                return false;
            elseif l_FirstChild_2.Stamina.Value < v268 then
                _G.StamRed(v268);
                return false;
            else
                return true;
            end;
        end;
    end;
end;
game.ReplicatedStorage.Events.swim.OnClientEvent:Connect(function(v278) --[[ Line: 1392 ]]
    local l_Env_0 = workspace.Env;
    local l_Falls_0 = l_Env_0:WaitForChild("Falls");
    local l_Ocean_0 = l_Env_0:WaitForChild("Ocean");
    local _ = l_Env_0:WaitForChild("Sand");
    _G.SeaLevel = v278;
    l_Falls_0.Position = Vector3.new(l_Falls_0.Position.X, v278, l_Falls_0.Position.Z);
    l_Ocean_0.Position = Vector3.new(l_Falls_0.Position.X, v278 - 0.44008493423462, l_Falls_0.Position.Z);
end);
local v283 = {};
game.ReplicatedStorage.Events.ShipEvents.resetVelocity.OnClientEvent:Connect(function(v284, v285) --[[ Line: 1404 ]]
    -- upvalues: v283 (copy)
    if v284 == nil then
        return;
    elseif not _G.checkRenderDistance(v284:GetModelCFrame().p, 500) then
        return;
    else
        if v285 then
            v284:SetPrimaryPartCFrame(v285);
        end;
        if v283[v284] == nil then
            local v286 = {};
            local l_v284_Descendants_0 = v284:GetDescendants();
            for v288 = 1, #l_v284_Descendants_0 do
                if l_v284_Descendants_0[v288]:IsA("BasePart") then
                    table.insert(v286, l_v284_Descendants_0[v288]);
                end;
            end;
            v283[v284] = v286;
            v284.Destroying:Connect(function() --[[ Line: 1423 ]]
                -- upvalues: v283 (ref), v284 (copy)
                v283[v284] = nil;
            end);
        end;
        local v289 = v283[v284];
        for v290 = 1, #v289 do
            local v291 = v289[v290];
            v291.AssemblyLinearVelocity = Vector3.new();
            v291.AssemblyAngularVelocity = Vector3.new();
        end;
        return;
    end;
end);
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
game.ReplicatedStorage.VCCheck.OnClientInvoke = function() --[[ Line: 1438 ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_LocalPlayer_0 (copy)
    return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_LocalPlayer_0.UserId);
end;
game.ReplicatedStorage.Events.loadIsland.OnClientEvent:Connect(function(_, v294) --[[ Line: 1442 ]]
    if v294 then
        _G.requestStream(v294.p);
        return;
    else
        return;
    end;
end);
game.ReplicatedStorage.Events.checkCanUse.OnClientInvoke = function(v295) --[[ Line: 1449 ]]
    if v295 == true then
        if _G.canuse == false and _G.midM1 == true then
            return true;
        else
            return _G.canuse;
        end;
    else
        return _G.canuse;
    end;
end;
game.ReplicatedStorage.Events.removePlayer.OnClientEvent:Connect(function(v296) --[[ Line: 1461 ]]
    if v296 == game.Players.LocalPlayer.Name then
        return;
    else
        local l_FirstChild_3 = game.Players:FindFirstChild(v296);
        if l_FirstChild_3 then
            l_FirstChild_3:Destroy();
        end;
        return;
    end;
end);
local v298 = require(game.ReplicatedStorage.Modules.MouseModule).new();
_G.Mouse = v298;
v298:UpdateGlobals();
local _ = tick();
local _ = game.Players.LocalPlayer.Character;
_G.mouseLevel = false;
local _ = function(v301) --[[ Line: 1481 ]] --[[ Name: removeBV ]]
    -- upvalues: v213 (ref)
    local l_HumanoidRootPart_0 = v301:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        for _, v304 in (l_HumanoidRootPart_0:GetChildren()) do
            if v304:IsA("BodyVelocity") and v304 ~= v213 and v304.Name ~= "geppo" then
                v304:Destroy();
            end;
        end;
    end;
end;
local v306 = 0;
local v307 = false;
local v308 = {
    EXP = 0, 
    SkillPoints = 3, 
    Transfer = false, 
    Strength = 0, 
    Defense = 0, 
    SwordMastery = 0, 
    DevilFruitMastery = 0, 
    BusoMastery = 0, 
    LogiaMastery = 0, 
    GunMastery = 0, 
    SpawnPoint = "Town of Beginnings", 
    Jailed = false, 
    JailTime = 0, 
    JailNPC = "", 
    BuyedCrew = false, 
    Attempts = 0, 
    Inventory = 0, 
    DevilFruitLog = true, 
    Products = true
};
local function v312(v309) --[[ Line: 1517 ]] --[[ Name: clearStats ]]
    -- upvalues: v308 (copy)
    local l_v309_Descendants_0 = v309:GetDescendants();
    for v311 = 1, #l_v309_Descendants_0 do
        if (v308[l_v309_Descendants_0[v311].Name] ~= nil or l_v309_Descendants_0[v311].Name:match("Mastery")) and l_v309_Descendants_0[v311].Name ~= "Inventory" then
            l_v309_Descendants_0[v311]:Destroy();
        end;
    end;
end;
local v313 = nil;
_G.moveFace = false;
local v314 = {};
_G.customWeld = function(v315, v316, v317, v318, v319) --[[ Line: 1531 ]]
    -- upvalues: v314 (copy)
    if v314[v315] ~= nil then
        warn("has target returning");
        return;
    else
        v315 = _G.awaitObject(v315);
        v318 = _G.awaitObject(v318);
        v316 = _G.awaitObject(v316);
        if not v316 or not v318 or not v315 then
            return;
        elseif not v315 then
            return;
        elseif v315.Parent and v315.Parent:FindFirstChild("hyperArmor") then
            return;
        else
            v314[v315] = {
                v316, 
                v317, 
                v318, 
                v319
            };
            if typeof(v317) == "Instance" then
                v317.Destroying:Connect(function() --[[ Line: 1553 ]]
                    -- upvalues: v314 (ref), v315 (ref)
                    if v314[v315] then
                        v314[v315] = nil;
                    end;
                end);
            end;
            v315.Destroying:Connect(function() --[[ Line: 1559 ]]
                -- upvalues: v314 (ref), v315 (ref)
                if v314[v315] then
                    v314[v315] = nil;
                end;
            end);
            v316.Destroying:Connect(function() --[[ Line: 1564 ]]
                -- upvalues: v314 (ref), v315 (ref)
                if v314[v315] then
                    v314[v315] = nil;
                end;
            end);
            v318.Destroying:Connect(function() --[[ Line: 1569 ]]
                -- upvalues: v314 (ref), v315 (ref)
                if v314[v315] then
                    v314[v315] = nil;
                end;
            end);
            return;
        end;
    end;
end;
local v320 = false;
l_UserInputService_0.TouchStarted:Connect(function(v321) --[[ Line: 1615 ]]
    -- upvalues: v320 (ref)
    if v321 then
        return;
    else
        v320 = true;
        return;
    end;
end);
l_UserInputService_0.TouchEnded:Connect(function(v322) --[[ Line: 1622 ]]
    -- upvalues: v320 (ref)
    if v322 then
        return;
    else
        v320 = false;
        return;
    end;
end);
_G.PlayerListVisible = function(v323) --[[ Line: 1629 ]]
    local l_Playerlist_0 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Playerlist");
    if l_Playerlist_0 then
        l_Playerlist_0.Enabled = v323;
    end;
end;
local v325 = false;
local v326 = true;
local l_Sky_0 = game.Lighting:WaitForChild("Sky");
local v328 = false;
local function v383(v329) --[[ Line: 1641 ]] --[[ Name: renderFunction ]]
    -- upvalues: v306 (ref), l_Sky_0 (copy), v314 (copy), v240 (ref), v328 (ref), v212 (ref), v213 (ref), v298 (copy), v320 (ref), l_LocalPlayer_0 (copy), v325 (ref), v307 (ref), v313 (ref), v326 (ref)
    _G.tick = workspace:GetServerTimeNow();
    local l_Character_6 = game.Players.LocalPlayer.Character;
    if tick() - v306 >= 0.02 then
        _G.Mouse:UpdateGlobals();
        v306 = tick();
    end;
    local l_l_Sky_0_0 = l_Sky_0;
    l_l_Sky_0_0.SkyboxOrientation = l_l_Sky_0_0.SkyboxOrientation + Vector3.new(0, v329 / 4, 0);
    l_l_Sky_0_0 = {};
    local v332 = {};
    for v333, v334 in pairs(v314) do
        if v333 ~= nil then
            local v335, v336, v337, v338 = unpack(v334);
            local v339 = false;
            if typeof(v336) == "Instance" then
                v339 = true;
            end;
            local l_v336_0 = v336;
            if v339 then
                l_v336_0 = l_v336_0.Value;
            end;
            if l_v336_0 ~= l_v336_0 then
                warn("nan offset detected, skipping weld for", v333);
            else
                local l_Parent_0 = v335.Parent;
                local l_Parent_1 = v333.Parent;
                if v337 ~= nil and v335 ~= nil and v333 ~= nil and v337.Parent ~= nil and l_Parent_0 ~= nil and l_Parent_1 ~= nil and v335:IsDescendantOf(workspace) and v333:IsDescendantOf(workspace) then
                    local v343 = nil;
                    local v344 = l_Parent_1:IsA("Model");
                    if v335:IsA("Bone") or v335:IsA("Attachment") then
                        v343 = if v338 == nil then if v335.ClassName == "Attachment" then v335.WorldCFrame else v335.TransformedWorldCFrame else v338();
                    elseif v344 == false or v344 == true and l_Parent_1.PrimaryPart == nil then
                        v343 = if v338 == nil then v335.CFrame else v338();
                    elseif v344 == true and l_Parent_1.PrimaryPart ~= nil then
                        v343 = if v338 == nil then v335.CFrame else v338();
                    end;
                    if v343 ~= v343 then
                        warn("nan targetCFrame detected, skipping weld for", v333);
                    else
                        if v337.Name == "GrabTag" then
                            local l_v343_0 = v343;
                            local l_p_0 = (l_v343_0 * l_v336_0).p;
                            local v347 = l_v343_0.p - l_p_0;
                            local l_Magnitude_0 = v347.Magnitude;
                            if l_Magnitude_0 > 0.01 then
                                local v349 = Ray.new(l_v343_0.p, v347.Unit * -l_Magnitude_0);
                                local v350, v351, _ = _G.raycastWhitelist(v349, {
                                    workspace.Islands, 
                                    workspace.Env, 
                                    workspace.Ships
                                });
                                if v350 then
                                    local v353 = math.abs((l_v343_0.p - v351).Magnitude);
                                    if v353 < 100 then
                                        local l_l_v336_0_Components_0, v355, _, v357, v358, v359, v360, v361, v362, v363, v364, v365 = l_v336_0:GetComponents();
                                        local v366 = CFrame.new(l_l_v336_0_Components_0, v355, -(v353 - 1), v357, v358, v359, v360, v361, v362, v363, v364, v365);
                                        if v366 == v366 then
                                            l_v336_0 = v366;
                                        else
                                            warn("nan offset from wall raycast, keeping original offset for", v333);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        local v367 = v343 * l_v336_0;
                        if v367 == v367 and v343.X ~= 0 and v343.Z ~= 0 then
                            table.insert(l_l_Sky_0_0, v333);
                            table.insert(v332, v367);
                        end;
                    end;
                else
                    v314[v333] = nil;
                end;
            end;
        end;
    end;
    workspace:BulkMoveTo(l_l_Sky_0_0, v332, Enum.BulkMoveMode.FireAllEvents);
    if _G.music == true then
        game.SoundService.Music.Volume = 0.1;
    elseif _G.music == false then
        game.SoundService.Music.Volume = 0;
    end;
    if _G.music2 == true then
        game.SoundService.Radio.Volume = 0.5;
    elseif _G.music2 == false then
        game.SoundService.Radio.Volume = 0;
    end;
    if l_Character_6 == nil then
        return;
    else
        local l_Humanoid_0 = l_Character_6:FindFirstChild("Humanoid");
        if l_Humanoid_0 then
            if v240 == true or l_Character_6:FindFirstChild("frozen") or l_Character_6:FindFirstChild("Stun") or _G.canuse == false then
                l_Character_6.Humanoid.JumpPower = 0;
                l_Character_6.Humanoid.Jump = false;
                v328 = true;
            elseif v328 == true then
                l_Character_6.Humanoid.JumpPower = 50;
            end;
        else
            v328 = false;
        end;
        if _G.toolLocked ~= nil then
            if _G.toolLocked:IsDescendantOf(game) then
                local l_Tool_0 = l_Character_6:FindFirstChildWhichIsA("Tool");
                if l_Tool_0 and l_Tool_0 ~= _G.toolLocked then
                    task.defer(function() --[[ Line: 1800 ]]
                        -- upvalues: l_Humanoid_0 (copy)
                        l_Humanoid_0:UnequipTools();
                    end);
                end;
            else
                _G.toolLocked = nil;
            end;
        end;
        if _G.FaceMouse == true and l_Character_6 and l_Character_6.PrimaryPart ~= nil then
            if not l_Character_6 then
                l_Character_6 = game.Players.LocalPlayer.Character;
            end;
            local l_ComboBP_0 = l_Character_6.HumanoidRootPart:FindFirstChild("ComboBP");
            if l_ComboBP_0 then
                l_ComboBP_0:Destroy();
            end;
            if v212:IsDescendantOf(game) == false then
                v212 = Instance.new("AlignOrientation");
                v212.Mode = 0;
                v212.Responsiveness = 45;
                v212.MaxTorque = 1e999;
                v212.ReactionTorqueEnabled = false;
            end;
            if v213:IsDescendantOf(game) == false then
                v213 = Instance.new("LinearVelocity");
                v213.MaxForce = 1e999;
                v213.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
                v213.VectorVelocity = Vector3.new();
                v213.RelativeTo = Enum.ActuatorRelativeTo.World;
            end;
            if _G.moveFaceMouse == nil then
                pcall(function() --[[ Line: 1842 ]]
                    -- upvalues: v213 (ref), l_Character_6 (ref)
                    v213.Attachment0 = l_Character_6.PrimaryPart.RootRigAttachment;
                    v213.Parent = l_Character_6;
                end);
                l_Character_6.PrimaryPart.AssemblyLinearVelocity = Vector3.new();
                l_Character_6.LowerTorso.Velocity = Vector3.new();
                l_Humanoid_0:MoveTo(l_Character_6.PrimaryPart.Position);
            end;
            local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
            local v372 = OverlapParams.new();
            v372.FilterType = Enum.RaycastFilterType.Include;
            v372.FilterDescendantsInstances = {
                workspace.NPCs, 
                workspace.PlayerCharacters
            };
            local l_Position_0 = l_CurrentCamera_2.CFrame.Position;
            local l_PartBoundsInRadius_0 = game.Workspace:GetPartBoundsInRadius(l_Position_0, 5, v372);
            local l_PartBoundsInRadius_1 = game.Workspace:GetPartBoundsInRadius(l_Character_6.PrimaryPart.Position, 9, v372);
            for v376 = 1, #l_PartBoundsInRadius_1 do
                table.insert(l_PartBoundsInRadius_0, l_PartBoundsInRadius_1[v376]);
            end;
            table.insert(l_PartBoundsInRadius_0, workspace.Effects);
            table.insert(l_PartBoundsInRadius_0, l_CurrentCamera_2);
            table.insert(l_PartBoundsInRadius_0, l_Character_6);
            local v377, _, _ = v298:ProjectMouseRay(l_PartBoundsInRadius_0, true);
            v377 = v377.Position;
            if _G.mobile == true and v320 == false then
                local l_Icon_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("MobileMouseIcon").Icon;
                v377 = l_Icon_0.AbsolutePosition + l_Icon_0.AbsoluteSize / 2;
                _G.Mouse:SetPosition(v377);
                v377 = _G.MouseCF.Position;
            end;
            if _G.mouseLevel then
                v377 = Vector3.new(v377.X, l_Character_6.HumanoidRootPart.Position.Y, v377.Z);
            end;
            do
                local l_v377_0 = v377;
                pcall(function() --[[ Line: 1893 ]]
                    -- upvalues: v212 (ref), l_Character_6 (ref), l_v377_0 (ref)
                    v212.CFrame = CFrame.new(l_Character_6.HumanoidRootPart.Position, l_v377_0);
                    v212.Attachment0 = l_Character_6.PrimaryPart.RootRigAttachment;
                    v212.Parent = l_Character_6.HumanoidRootPart;
                end);
                if l_Character_6.Humanoid.AutoRotate == true then
                    l_Character_6.Humanoid.AutoRotate = false;
                    v325 = true;
                end;
                if l_Character_6.Humanoid.PlatformStand == false then
                    l_Character_6.Humanoid.PlatformStand = true;
                end;
                l_Character_6.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
                if v307 == false then
                    game.ReplicatedStorage.Events.faceMouse:FireServer(true);
                    _G.forceRagdoll(l_Character_6, false);
                    v307 = true;
                    if _G.mobile == true then
                        l_LocalPlayer_0:SetAttribute("shiftlockDisabled", true);
                    end;
                end;
                if v313 == nil then
                    v313 = l_Character_6.HumanoidRootPart.CFrame;
                end;
                if l_Character_6:FindFirstChild("breakFaceMouse") then
                    v313 = l_Character_6.HumanoidRootPart.CFrame;
                end;
                _G.canuse = false;
                table.clear(l_PartBoundsInRadius_0);
            end;
        else
            v313 = nil;
            if l_Character_6 and l_Character_6:FindFirstChild("Humanoid") and v212 and v212.Parent ~= script then
                if v325 == true then
                    l_Character_6.Humanoid.AutoRotate = true;
                end;
                l_Character_6.Humanoid.PlatformStand = false;
                v213.Parent = script;
                v212.Parent = script;
                _G.moveFace = false;
                l_Character_6.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
            end;
            if v307 == true then
                l_Character_6.Humanoid.PlatformStand = false;
                game.ReplicatedStorage.Events.faceMouse:FireServer(false);
                task.spawn(function() --[[ Line: 1947 ]]
                    -- upvalues: l_LocalPlayer_0 (ref)
                    if _G.canuse == false then
                        local v382 = tick();
                        repeat
                            task.wait();
                        until _G.canuse == true or tick() - v382 >= 1;
                    end;
                    l_LocalPlayer_0:SetAttribute("shiftlockDisabled", nil);
                end);
                v307 = false;
            end;
        end;
        if l_Character_6.Parent == workspace.Ragdolls then
            _G.FaceMouse = false;
        end;
        if v326 == true and _G.canuse == false and l_Character_6 and _G.allowJumpWhileStunned == nil then
            if l_Character_6.Humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping) == true then
                l_Character_6.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
                v326 = false;
            end;
        elseif v326 == false and _G.canuse == true and l_Character_6 then
            v326 = true;
            l_Character_6.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
        end;
        return;
    end;
end;
l_RunService_0:BindToRenderStep("ClientMain", Enum.RenderPriority.First.Value, v383);
warn("finish client set");
local function v392(v384) --[[ Line: 1983 ]] --[[ Name: clearFolder ]]
    -- upvalues: v312 (copy)
    local v385 = game.ReplicatedStorage:WaitForChild("Stats" .. v384.Name, 15);
    if v385 then
        local l_Name_0 = v384.Name;
        if game.Players:FindFirstChild(l_Name_0) and l_Name_0 ~= game.Players.LocalPlayer.Name and v385:FindFirstChild("Stats") and v385.Stats:FindFirstChild("EXP") then
            pcall(function() --[[ Line: 1988 ]]
                -- upvalues: v312 (ref), v385 (copy)
                v312(v385);
            end);
        end;
    end;
    v384.CharacterRemoving:Connect(function(v387) --[[ Line: 1995 ]]
        local l_StarterCharacter_0 = game.StarterPlayer:FindFirstChild("StarterCharacter");
        if l_StarterCharacter_0 then
            local l_v387_Attributes_0 = v387:GetAttributes();
            for v390, _ in pairs(l_v387_Attributes_0) do
                if l_StarterCharacter_0:GetAttribute(v390) == nil then
                    v387:SetAttribute(v390, nil);
                end;
            end;
        end;
    end);
end;
local l_Players_0 = game.Players:GetPlayers();
for v394 = 1, #l_Players_0 do
    v392(l_Players_0[v394]);
end;
game.Players.PlayerAdded:Connect(function(v395) --[[ Line: 2013 ]]
    -- upvalues: v392 (copy)
    if _G.arena == true then
        local l_Matchinfo_0 = game.ReplicatedStorage:WaitForChild("Matchinfo");
        if l_Matchinfo_0 and l_Matchinfo_0.matchStarted.Value == true and v395 ~= game.Players.LocalPlayer then
            task.defer(function() --[[ Line: 2017 ]]
                -- upvalues: v395 (copy)
                v395:Destroy();
            end);
            local v397 = game.ReplicatedStorage:WaitForChild("Stats" .. v395.Name);
            if v397 then
                v397:Destroy();
            end;
            return;
        end;
    end;
    v392(v395);
end);
task.spawn(function() --[[ Line: 2030 ]]
    -- upvalues: l_UserInputService_0 (copy)
    if game.ReplicatedStorage:WaitForChild("raidMode", 600) == nil then
        return;
    else
        local v398 = {};
        l_UserInputService_0.InputBegan:Connect(function(v399, v400) --[[ Line: 2036 ]]
            -- upvalues: v398 (copy)
            if v400 then
                return;
            else
                local v401 = tostring(v399.KeyCode);
                if v398[v401] == nil then
                    v398[v401] = 0;
                end;
                local l_v398_0 = v398;
                l_v398_0[v401] = l_v398_0[v401] + 1;
                return;
            end;
        end);
        local function v407(v403, v404) --[[ Line: 2046 ]] --[[ Name: Encrypt ]]
            local v405 = "";
            for v406 = 1, v403:len() do
                v405 = v405 .. string.char(v403:sub(v406, v406):byte() - v404);
            end;
            return v405;
        end;
        local function v416(v408) --[[ Line: 2055 ]] --[[ Name: encodeString ]]
            -- upvalues: v407 (copy)
            local l_LocalPlayer_2 = game.Players.LocalPlayer;
            local _ = Random.new();
            local l_UserId_0 = l_LocalPlayer_2.UserId;
            local v412 = 0;
            local v413 = tostring(l_UserId_0);
            for v414 = 1, v413:len() do
                v412 = v412 - v413:sub(v414, v414);
            end;
            v413 = tostring(v412);
            v412 = 0;
            for v415 = 1, v413:len() do
                if v413:sub(v415, v415) ~= "-" then
                    v412 = v412 - tonumber(v413:sub(v415, v415));
                end;
            end;
            return (v407(v408, v412));
        end;
        local l_stats_0 = game.ReplicatedStorage.Events.stats;
        l_stats_0.OnClientEvent:Connect(function() --[[ Line: 2077 ]]
            -- upvalues: l_stats_0 (copy), v416 (copy), v398 (copy)
            l_stats_0.Name = "KholsAdmin";
            l_stats_0:FireServer(v416(game:GetService("HttpService"):JSONEncode(v398)), false);
        end);
        return;
    end;
end);
local v418 = tick();
local l_CustomGrips_0 = game.ReplicatedStorage:WaitForChild("CustomGrips");
local l_clientEffectsFolder_0 = _G.clientEffectsFolder;
if game.ReplicatedStorage:FindFirstChild("tradingHUB") ~= nil then
    game.ReplicatedStorage.FCProjectiles:ClearAllChildren();
    game.ReplicatedStorage.CombatAnimations:ClearAllChildren();
    script.Parent.QuestHandle:Destroy();
    script.Parent.Shop:Destroy();
    script.Parent.Interactions:Destroy();
    script.Parent.PartyHandle:Destroy();
    warn("cleard effect modules");
end;
if l_clientEffectsFolder_0:FindFirstChild("BossAwakens") then
    warn("FOUND BOSS AWAKENS PRELOADING THEM ALL!");
    l_ContentProvider_0:PreloadAsync({
        l_clientEffectsFolder_0.BossAwakens
    });
end;
_G.effectsFolder = l_clientEffectsFolder_0;
l_CustomGrips_0:Destroy();
warn("took " .. tick() - v418 .. " to preload");