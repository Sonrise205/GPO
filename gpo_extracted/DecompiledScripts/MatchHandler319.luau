repeat
    task.wait();
until game.Players.LocalPlayer;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v1 = nil;
game.ReplicatedStorage:WaitForChild("matchEvents");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v3 = {};
local v4 = nil;
Lerp = function(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: Lerp ]]
    return v5 + (v6 - v5) * v7;
end;
local v8 = nil;
local v9 = {};
_G.matchEvent = function(v10, v11, v12, v13, v14, v15) --[[ Line: 15 ]]
    -- upvalues: v1 (ref), l_LocalPlayer_0 (copy), v9 (copy), v3 (ref), v8 (ref), v4 (ref), l_CurrentCamera_0 (copy)
    if v10 ~= "loadingmapPercent" then
        print("NEW ENV " .. v10);
    end;
    if v1 == v10 and v10 ~= "unspec" then
        warn("is current env " .. v10);
        return;
    elseif v10 == "camera" then
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        task.spawn(function() --[[ Line: 26 ]]
            -- upvalues: v13 (ref), l_CurrentCamera_1 (copy)
            if v13 then
                v13 = _G.awaitObject(v13);
                while true do
                    workspace.CurrentCamera.CameraSubject = v13;
                    game.Players.LocalPlayer.ReplicationFocus = v13.Parent.PrimaryPart;
                    task.wait();
                end;
            end;
            local l_CFrame_0 = workspace.Env:WaitForChild("Winner"):WaitForChild("Cam").CFrame;
            if v13 then
                l_CFrame_0 = v13;
            end;
            while true do
                game["Run Service"].Heartbeat:Wait();
                l_CurrentCamera_1.CameraType = Enum.CameraType.Scriptable;
                l_CurrentCamera_1.CFrame = l_CFrame_0;
            end;
        end);
        if v13 == nil or v13 and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and v13 ~= game.Players.LocalPlayer.Character.Humanoid then
            _G.hideUI(true);
        end;
        local v18 = script.winner:Clone();
        v18:SetAttribute("unhideable", true);
        v18.Frame.TextLabel.Text = v11;
        v18.Parent = l_LocalPlayer_0.PlayerGui;
        if v12 then
            v18.Frame.TextLabel.UIGradient.Color = v12;
        end;
        return;
    elseif v10 == "waveInfo" then
        local v19 = script.waveInfo:Clone();
        v19.Frame.TextLabel.Text = v11;
        v19.Frame.Size = UDim2.new(1.25, 0, 0, 0);
        v19.Frame.TextLabel.TextTransparency = 1;
        if v12 then
            v19.Frame.TextLabel.TextColor3 = v12;
        end;
        if v15 then
            v19.Frame.Position = v15;
        end;
        v19.Parent = game.Players.LocalPlayer.PlayerGui;
        _G.tween(v19.Frame, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Size = UDim2.new(1.25, 0, script.waveInfo.Frame.Size.Y.Scale, 0)
        });
        if v13 and script.ObjectiveSFX:FindFirstChild(v13) then
            if v9[v13] == nil then
                v9[v13] = 0;
            end;
            local l_v9_0 = v9;
            l_v9_0[v13] = l_v9_0[v13] + 1;
            script.ObjectiveSFX:FindFirstChild(v13):GetChildren()[math.random(1, #script.ObjectiveSFX:FindFirstChild(v13):GetChildren())]:Play();
            if v9[v13] >= #script.ObjectiveSFX:FindFirstChild(v13):GetChildren() then
                v9[v13] = 0;
            end;
        end;
        task.wait(0.25);
        _G.tween(v19.Frame.TextLabel, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            TextTransparency = 0
        });
        if v14 == nil then
            task.wait(3);
        else
            task.wait(v14);
        end;
        _G.tween(v19.Frame.TextLabel, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            TextTransparency = 1
        });
        task.wait(0.25);
        _G.tween(v19.Frame, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Size = UDim2.new(1.25, 0, 0, 0)
        });
        _G.destroy(v19, 1);
        return;
    elseif v10 == "displayMinimap" then
        require(script.DisplayMinimap):Display(v11);
        return;
    elseif v10 == "hideUI" then
        game.StarterGui:SetCoreGuiEnabled("Health", false);
        game.Players.LocalPlayer.PlayerGui.HealthBars:ClearAllChildren();
        _G.hideUI(true);
        return;
    else
        if v10 == "spec" and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Spec") == nil then
            local l_Children_0 = l_LocalPlayer_0.PlayerGui:GetChildren();
            for v22 = 1, #l_Children_0 do
                local v23 = l_Children_0[v22];
                if v23:IsA("ScreenGui") and v23.Enabled and string.lower(v23.Name):match("topbar") == nil and v23:GetAttribute("unhideable") == nil then
                    pcall(function() --[[ Line: 122 ]]
                        -- upvalues: l_Children_0 (copy), v22 (copy), v3 (ref)
                        l_Children_0[v22].Enabled = false;
                        table.insert(v3, l_Children_0[v22]);
                    end);
                end;
            end;
            local l_Descendants_0 = game.ReplicatedStorage.Assets:GetDescendants();
            for v25 = 1, #l_Descendants_0 do
                if l_Descendants_0[v25]:IsA("Sound") then
                    l_Descendants_0[v25]:Stop();
                end;
            end;
            local v26 = script.Spec:Clone();
            v26.Parent = l_LocalPlayer_0.PlayerGui;
            v26.LocalScript.Disabled = false;
        elseif v10 == "unspec" then
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Spec") then
                game.Players.LocalPlayer.PlayerGui:FindFirstChild("Spec"):Destroy();
            end;
            pcall(function() --[[ Line: 142 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character;
                l_LocalPlayer_0.PlayerGui.Matchmake.Enabled = true;
            end);
            for v27 = 1, #v3 do
                pcall(function() --[[ Line: 148 ]]
                    -- upvalues: v3 (ref), v27 (copy)
                    v3[v27].Enabled = true;
                end);
            end;
            v3 = {};
            return;
        elseif v10 == "removeTeamMarker" then
            local v28 = tick();
            local v29 = false;
            while true do
                task.wait();
                if tick() - v28 >= 5 then
                    v29 = true;
                    break;
                elseif v11.Party.Value == game.Players.LocalPlayer.Party.Value then
                    break;
                end;
            end;
            if v29 == true then
                warn("timed out for " .. v11.Name);
                return;
            else
                if v11.Party.Value == game.Players.LocalPlayer.Party.Value then
                    warn(v11.Name .. " vs " .. game.Players.LocalPlayer.Party.Value.Name);
                    repeat
                        task.wait();
                    until v12 ~= nil or v11.Character and v11.Character:FindFirstChild("Head") and v11.Character.Head:FindFirstChild("TeamID") ~= nil;
                    if v12 == nil then
                        v12 = v11.Character.Head:FindFirstChild("TeamID");
                        warn("replacing arg3");
                    end;
                    v12.Size = UDim2.new(0, 0, 0, 0);
                end;
                return;
            end;
        elseif v10 == "startStorm" then
            local l_PrimaryPart_0 = _G.awaitObject(v15).PrimaryPart;
            _G.stormPart = l_PrimaryPart_0;
            game:GetService("CollectionService"):AddTag(l_PrimaryPart_0, "stormCenter");
            warn("starting storm!");
            local v31 = {
                Scale = v14
            };
            v8 = v14;
            _G.tween(l_PrimaryPart_0.Mesh, {
                v13 - workspace:GetServerTimeNow(), 
                Enum.EasingStyle.Linear, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, v31);
            v4 = l_PrimaryPart_0;
            warn("storm end time is " .. v13 - workspace:GetServerTimeNow());
            local v32 = Instance.new("Attachment", workspace.Terrain);
            local v33 = script.BrStormLoop1:Clone();
            v33.Parent = v32;
            v33.RollOffMaxDistance = 0;
            local v34 = false;
            local l_l_PrimaryPart_0_0 = l_PrimaryPart_0 --[[ copy: 6 -> 20 ]];
            local l_v32_0 = v32 --[[ copy: 8 -> 21 ]];
            local l_v33_0 = v33 --[[ copy: 9 -> 22 ]];
            do
                local l_v34_0 = v34;
                game["Run Service"].Heartbeat:Connect(function() --[[ Line: 205 ]]
                    -- upvalues: v4 (ref), l_l_PrimaryPart_0_0 (copy), l_v32_0 (copy), l_v33_0 (copy), l_v34_0 (ref)
                    if v4:FindFirstChild("Mesh") == nil then
                        return;
                    else
                        local l_CurrentCamera_2 = workspace.CurrentCamera;
                        local l_magnitude_0 = (l_CurrentCamera_2.CFrame.Position - l_l_PrimaryPart_0_0.Position).magnitude;
                        l_v32_0.WorldCFrame = l_l_PrimaryPart_0_0.CFrame:Lerp(l_CurrentCamera_2.CFrame, 1.01);
                        l_v33_0.RollOffMaxDistance = math.clamp(v4.Mesh.Scale.X / 2 * 0.75, 1000, 100000000000) + 50;
                        if l_magnitude_0 + 500 >= v4.Mesh.Scale.X / 2 * 0.75 and l_magnitude_0 <= v4.Mesh.Scale.X / 2 then
                            l_v34_0 = true;
                            if l_v33_0.IsPlaying == false then
                                l_v33_0:Play();
                            end;
                            l_v33_0.Volume = Lerp(0, 0.5, l_magnitude_0 / (v4.Mesh.Scale.X / 2));
                            return;
                        else
                            if l_v34_0 == true then
                                l_v34_0 = false;
                                _G.tween(l_v33_0, {
                                    0.25, 
                                    "Quad", 
                                    Enum.EasingDirection.Out, 
                                    0, 
                                    false, 
                                    0
                                }, {
                                    Volume = 0
                                }, nil, true);
                                task.delay(0.25, function() --[[ Line: 225 ]]
                                    -- upvalues: l_v33_0 (ref)
                                    l_v33_0:Stop();
                                end);
                            end;
                            return;
                        end;
                    end;
                end);
            end;
        elseif v10 == "spawnfs" then
            warn("spawning fs");
            local l_v12_0 = v12;
            local v42 = script.medalPiller:Clone();
            v42:PivotTo(CFrame.new(v11.Position) * CFrame.Angles(0, 0, 1.5707963267948966));
            v42.Parent = workspace.Effects;
            local l_v42_Children_0 = v42:GetChildren();
            for v44 = 1, #l_v42_Children_0 do
                l_v42_Children_0[v44].Mesh.Scale = Vector3.new(3000, 0, 0, 0);
                _G.tween(l_v42_Children_0[v44].Mesh, {
                    10, 
                    "Quad", 
                    Enum.EasingDirection.Out, 
                    0, 
                    true, 
                    0
                }, {
                    Scale = Vector3.new(3000, 35, 35, 0)
                }, nil, true);
                _G.tween(l_v42_Children_0[v44], {
                    10, 
                    "Quad", 
                    Enum.EasingDirection.Out, 
                    0, 
                    true, 
                    0
                }, {
                    Transparency = 1
                }, nil, true);
                l_v42_Children_0[v44].Color = l_v12_0;
            end;
            _G.PlaySound(v11, script.FightstyleTokenSpawn);
            _G.destroy(v42, 21);
        elseif v10 == "spawnMedal" then
            local l_v12_1 = v12;
            local v46 = script.invertedSphere:Clone();
            v46:PivotTo(CFrame.new(v11.Position));
            v46.Color = l_v12_1;
            v46.Size = Vector3.new(0, 0, 0, 0);
            v46.Parent = workspace.Effects;
            _G.tween(v46, {
                10, 
                "Exponential", 
                Enum.EasingDirection.Out, 
                0, 
                true, 
                0
            }, {
                Size = Vector3.new(15, 15, 15, 0), 
                Transparency = 1
            }, nil, true);
            _G.destroy(v46, 21);
        elseif v10 == "screenFlash" then
            local v47 = script.ScreenGui:Clone();
            v47.Parent = game.Players.LocalPlayer.PlayerGui;
            v47.Frame.BackgroundTransparency = 1;
            _G.destroy(v47, v11 + 1);
            _G.tween(v47.Frame, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                BackgroundTransparency = 0
            }, nil, true);
            if v11 ~= nil then
                task.spawn(function() --[[ Line: 266 ]]
                    -- upvalues: v12 (ref)
                    game:GetService("ContentProvider"):PreloadAsync({
                        v12
                    });
                end);
            end;
            task.wait(v11);
            local l_v47_0 = v47 --[[ copy: 6 -> 19 ]];
            pcall(function() --[[ Line: 271 ]]
                -- upvalues: l_v47_0 (copy)
                _G.tween(l_v47_0.Frame, {
                    0.25, 
                    "Quad", 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    BackgroundTransparency = 1
                }, nil, true);
                _G.destroy(l_v47_0, 0.25);
            end);
            if script:FindFirstChild("royaleMusic") then
                script.royaleMusic:Play();
                script.royaleMusic.Name = "played";
            end;
        elseif v10 == "disablePlayerList" then
            game.StarterGui:SetCoreGuiEnabled("PlayerList", false);
            _G.PlayerListVisible(false);
        elseif v10 == "globalFeed" then
            local v49 = script.TextLabel:Clone();
            v49.Text = v11;
            v49.Parent = l_LocalPlayer_0.PlayerGui.globalFeed.globalFeed;
            task.wait(60);
            _G.tween(v49, {
                2, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                TextTransparency = 1, 
                TextStrokeTransparency = 1
            }, nil, true);
            _G.destroy(v49, 2);
            return;
        elseif v10 == "adjustStorm" then
            if v4 then
                local v50 = {
                    Scale = v8
                };
                _G.tween(v4.Mesh, {
                    v11 - workspace:GetServerTimeNow(), 
                    Enum.EasingStyle.Linear, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, v50, nil, true);
            end;
            return;
        elseif v10 == "returningToLobby" then
            _G.hideUI(true);
            script.screenInfo:Clone().Parent = l_LocalPlayer_0.PlayerGui;
        elseif v10 == "addHotZone" then
            repeat
                task.wait();
            until _G.addBlip ~= nil;
            warn("found hotzone global");
            local v51 = script.storm:Clone();
            v51.Transparency = 1;
            v51.CFrame = v11;
            v51.Mesh.Scale = Vector3.new(v12, 1, v12);
            v51.Parent = workspace.Effects;
            _G.destroy(v51, 600);
            _G.addBlip("hotZone", v51);
            return;
        elseif v10 == "addCampfire" then
            repeat
                task.wait();
            until _G.addBlip ~= nil;
            local v52 = script.storm:Clone();
            v52.Transparency = 1;
            v52.CFrame = v11;
            v52.Parent = workspace.Effects;
            _G.addBlip("campfire", v52);
            return;
        elseif v10 == "busRoute" then
            local v53 = v11:Lerp(v12, 0.5);
            local l_Magnitude_0 = (v11.p - v12.p).Magnitude;
            repeat
                task.wait();
            until _G.addBusRoute ~= nil;
            local v55 = script.storm:Clone();
            v55.Transparency = 1;
            v55.CFrame = v53;
            v55.Parent = workspace.Effects;
            _G.destroy(v55, 60);
            _G.addBusRoute(v11, v53, l_Magnitude_0, v55);
        elseif v10 == "loadingmapPercent" then
            l_LocalPlayer_0.PlayerGui:WaitForChild("Matchmake", 600).TextLabel.Text = "Loading map... (" .. v11 .. "%)";
            return;
        elseif v10 == "areaLabel" then
            repeat
                task.wait();
            until _G.addBlip ~= nil;
            local v56 = script.storm:Clone();
            v56.Transparency = 1;
            v56.Name = v12;
            v56.CFrame = v11;
            v56.Parent = workspace.Effects;
            _G.addBlip("areaLabel", v56);
            return;
        elseif v10 == "phoLabel" then
            repeat
                task.wait();
            until _G.addBlip ~= nil;
            local v57 = script.storm:Clone();
            v57.Transparency = 1;
            v57.CFrame = v11;
            v57.Parent = workspace.Effects;
            _G.addBlip("phoLabel", v57);
            return;
        elseif v10 == "customBlip" then
            repeat
                task.wait();
            until _G.addBlip ~= nil;
            warn(v11, v12);
            _G.addBlip("customBlip", v11, nil, v12);
            return;
        elseif v10 == "startBarriers" then
            if v11:FindFirstChild("Walls") == nil then
                return;
            else
                local v58 = require(game.ReplicatedStorage.Modules.DistanceFade).new();
                local l_Children_1 = v11.Walls:GetChildren();
                local v60 = Vector3.new(0, 0, 0, 0);
                local v61 = 0;
                for _, v63 in ipairs(l_Children_1) do
                    if v63:IsA("BasePart") then
                        v60 = v60 + v63.Position;
                        v61 = v61 + 1;
                    end;
                end;
                v60 = v60 / v61;
                local function v72(v64) --[[ Line: 396 ]] --[[ Name: getInwardFace ]]
                    -- upvalues: v60 (ref)
                    local v65 = nil;
                    local v66 = 1e999;
                    for _, v68 in ipairs(Enum.NormalId:GetEnumItems()) do
                        local v69 = v64.CFrame * CFrame.new(v64.Size / 2 * Vector3.FromNormalId(v68));
                        local l_Unit_0 = (v60 - v69.Position).Unit;
                        local v71 = math.acos((v64.CFrame:VectorToWorldSpace(Vector3.FromNormalId(v68)).Unit:Dot(l_Unit_0)));
                        if v71 < v66 then
                            v66 = v71;
                            v65 = v68;
                        end;
                    end;
                    return v65;
                end;
                for _, v74 in ipairs(l_Children_1) do
                    if v74:IsA("BasePart") then
                        local v75 = v72(v74);
                        if v75 then
                            v58:AddFace(v74, v75);
                            print(v74.Name .. "'s inward-facing NormalId is: " .. v75.Name);
                        end;
                    end;
                end;
                v58:UpdateSettings({
                    DistanceOuter = 16, 
                    DistanceInner = 4, 
                    EffectRadius = 16, 
                    EffectRadiusMin = 0, 
                    EdgeDistanceCalculations = false, 
                    Texture = "rbxassetid://18838056070", 
                    TextureTransparency = 0, 
                    TextureTransparencyMin = 1, 
                    BackgroundTransparency = 1, 
                    BackgroundTransparencyMin = 1, 
                    TextureColor = Color3.fromRGB(170, 255, 255), 
                    BackgroundColor = Color3.fromRGB(170, 255, 255), 
                    TextureSize = Vector2.new(8, 8), 
                    TextureOffset = Vector2.new(0, 0), 
                    ZOffset = 0, 
                    AlwaysOnTop = false, 
                    Brightness = 3, 
                    LightInfluence = 0, 
                    MaxDistance = 1000, 
                    PixelsPerStud = 100, 
                    SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
                });
                game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 454 ]]
                    -- upvalues: v58 (copy)
                    v58:Step();
                end);
                return;
            end;
        end;
        if v10 ~= "spawnfs" and v10 ~= "spawnMedal" and v10 ~= "startStorm" and v10 ~= "globalFeed" and v10 ~= "screenFlash" and v10 ~= "addHotZone" and v10 ~= "customText" then
            v1 = v10;
        end;
        local v76 = l_LocalPlayer_0.PlayerGui:WaitForChild("Matchmake", 600);
        if v10 == "waitingPlayers" then
            while true do
                task.wait(1);
                v76.TextLabel.Text = "Waiting for players to fully load. (" .. game.ReplicatedStorage.Matchinfo.waittime.Value .. ")";
                if not game.ReplicatedStorage.Matchinfo.waittime:GetAttribute("done") then
                    warn("cotuning down");
                    if v1 == "waitingPlayers" then
                        break;
                    end;
                else
                    break;
                end;
            end;
            warn("copunt edned new env " .. v1);
        elseif v10 == "inter" then
            repeat
                v76.TextLabel.Text = "Intermission " .. game.ReplicatedStorage.Matchinfo.int.Value;
                game["Run Service"].Heartbeat:Wait();
            until v1 ~= v10 and v1 ~= "";
            warn("eneded inter new state " .. v1);
        elseif v10 == "loadingmap" then
            v76.TextLabel.Text = "Loading map...";
        elseif v10 == "matchStart" then
            _G.arenaMatchStarted = true;
            v76.TextLabel.Visible = false;
            if game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") == nil and v11:FindFirstChild("Scene") then
                pcall(function() --[[ Line: 494 ]]
                    _G.disableMovement(true);
                end);
                v76.TextLabel.Visible = false;
                l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                local v77 = script.ScreenGui:Clone();
                v77.Parent = game.Players.LocalPlayer.PlayerGui;
                local function v81(v78) --[[ Line: 501 ]] --[[ Name: cameraTween ]]
                    -- upvalues: l_CurrentCamera_0 (ref)
                    local v79 = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
                    local v80 = {
                        CFrame = v78
                    };
                    game:GetService("TweenService"):Create(l_CurrentCamera_0, v79, v80):Play();
                end;
                local function v84() --[[ Line: 510 ]] --[[ Name: flash ]]
                    -- upvalues: v77 (copy)
                    local v82 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                    local v83 = {
                        BackgroundTransparency = 1
                    };
                    game:GetService("TweenService"):Create(v77.Frame, v82, v83):Play();
                end;
                v11:WaitForChild("Scene"):WaitForChild("1");
                local l_Children_2 = v11.Scene:GetChildren();
                local v86 = {};
                local v87 = 0;
                repeat
                    for v88 = 1, #l_Children_2 do
                        if l_Children_2[v88] and tonumber(l_Children_2[v88].Name) == v87 + 1 then
                            v87 = v87 + 1;
                            table.insert(v86, l_Children_2[v88]);
                        end;
                    end;
                    task.wait();
                    warn("match start");
                until #v86 == #l_Children_2;
                local v89 = false;
                local v90 = CFrame.Angles(0, 0, 0);
                for v91 = 1, #v86 do
                    if v91 > 1 and v89 == false then
                        v84();
                        task.spawn(function() --[[ Line: 541 ]]
                            -- upvalues: v86 (copy), v91 (copy)
                            _G.requestStream(v86[v91].Value.Position);
                        end);
                        v81(v86[v91].Value * v90);
                        v89 = true;
                        task.wait(1.5);
                    else
                        v77.Frame.BackgroundTransparency = 0;
                        l_CurrentCamera_0.CFrame = v86[v91].Value * v90;
                        v89 = false;
                    end;
                end;
                v77.Frame.BackgroundTransparency = 0;
                v84();
                l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                task.wait(0.5);
            end;
            if v76:FindFirstChild("Wave") == nil then
                v76.Enabled = false;
            end;
            _G.disableMovement(false);
        elseif v10 == "returning" then
            v76.TextLabel.Text = "Returning...";
        elseif v10 == "gameOver" then
            l_LocalPlayer_0.PlayerGui.Matchmake.Enabled = true;
            v76.TextLabel.Text = "GAME OVER";
            v76.Frame.Visible = true;
        elseif v10 == "customText" then
            v76.Enabled = true;
            v76.TextLabel.Visible = true;
            v76.TextLabel.Text = v11;
        end;
        return;
    end;
end;
game.ReplicatedStorage.matchEvents.OnClientEvent:Connect(function(...) --[[ Line: 578 ]]
    _G.matchEvent(...);
end);
l_LocalPlayer_0.CharacterAdded:Connect(function() --[[ Line: 582 ]]
    -- upvalues: v1 (ref)
    v1 = "";
end);