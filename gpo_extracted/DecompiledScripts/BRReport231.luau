local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Icon_0 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("TopbarPlus"):WaitForChild("Icon"));
local v2 = require(l_ReplicatedStorage_0.Modules.Trove);
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v4 = false;
local l_ReportKick_0 = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("ReportKick");
local v6 = 0;
local v7 = true;
local v8 = v2.new();
local _ = game:GetService("UserInputService");
while true do
    local l_status_0, _ = pcall(function() --[[ Line: 19 ]]
        -- upvalues: l_LocalPlayer_0 (copy), v7 (ref), v6 (ref)
        if l_LocalPlayer_0:IsInGroup(268184936) == false then
            v7 = false;
            return;
        else
            v6 = l_LocalPlayer_0:GetRankInGroup(268184936);
            return;
        end;
    end);
    if l_status_0 ~= true then
        task.wait(1);
    else
        break;
    end;
end;
local v12 = false;
pcall(function() --[[ Line: 34 ]]
    -- upvalues: v12 (ref), l_LocalPlayer_0 (copy)
    v12 = game:GetService("BadgeService"):UserHasBadgeAsync(l_LocalPlayer_0.UserId, 4.199204445683457E15);
end);
if v7 == false and v12 == false then
    script:Destroy();
    return;
elseif v6 < 100 and v12 == false then
    script:Destroy();
    return;
else
    if _G.arena == nil then
        repeat
            task.wait();
        until _G.arena ~= nil;
    end;
    if _G.arena == false and game.GameId ~= 2097989947 then
        return;
    else
        if _G.arena == true then
            local l_reservedCode_0 = game.ReplicatedStorage:WaitForChild("reservedCode");
            repeat
                task.wait();
            until l_reservedCode_0.Value ~= "checking";
            if l_reservedCode_0:GetAttribute("battleRoyale") == nil then
                return;
            end;
        end;
        local v14 = l_Icon_0.new():align("Left"):setLabel("BR Report System"):setCaption("DO NOT ABUSE"):setTextFont(Enum.Font.SourceSansBold):setOrder(50):setImage(14942519118);
        local v15 = nil;
        local v16 = false;
        local v17 = {};
        local function v30() --[[ Line: 80 ]] --[[ Name: UpdateList ]]
            -- upvalues: v15 (ref), l_Icon_0 (copy), l_LocalPlayer_0 (copy), l_ReportKick_0 (copy), v8 (copy), v4 (ref), v17 (copy), v14 (copy), v16 (ref)
            local l_Players_0 = game.Players:GetPlayers();
            table.sort(l_Players_0, function(v19, v20) --[[ Line: 82 ]]
                return v19.Name:lower() < v20.Name:lower();
            end);
            local v21 = {};
            if v15 then
                for v22 = 1, #v15 do
                    v15[v22]:Destroy();
                end;
            end;
            table.insert(v21, (l_Icon_0.new():setLabel("Self Respawn"):bindEvent("selected", function(_) --[[ Line: 96 ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_ReportKick_0 (ref)
                _G.promptQuestion(l_LocalPlayer_0, "<font color=\"rgb(255,0,0)\">Are you sure you want to respawn (spectate)? DONT RESPAWN UNTIL YOU DROP FROM BUS!</font>", {
                    [true] = function() --[[ Line: 98 ]]
                        -- upvalues: l_ReportKick_0 (ref)
                        l_ReportKick_0:InvokeServer("Respawn");
                    end, 
                    [false] = function() --[[ Line: 101 ]]

                    end
                });
            end):setOrder(-100000000000):oneClick(true):align("Center")));
            v8:Clean();
            for v24, v25 in ipairs(l_Players_0) do
                if v25 ~= l_LocalPlayer_0 or game.GameId == 2097989947 then
                    local v29 = l_Icon_0.new():setLabel(v25.Name):bindEvent("selected", function(_) --[[ Line: 121 ]]
                        -- upvalues: v4 (ref), v25 (copy), l_LocalPlayer_0 (ref), l_ReportKick_0 (ref)
                        if v4 == true then
                            return;
                        else
                            v4 = true;
                            local v27 = nil;
                            if v25.Character then
                                v27 = Instance.new("Highlight");
                                v27.FillTransparency = 0.2;
                                v27.FillColor = Color3.fromRGB(255, 0, 0);
                                v27.Parent = v25.Character;
                            end;
                            local function _() --[[ Line: 136 ]] --[[ Name: finishSelection ]]
                                -- upvalues: v27 (ref), v4 (ref)
                                if v27 then
                                    v27:Destroy();
                                end;
                                v4 = false;
                            end;
                            _G.promptQuestion(l_LocalPlayer_0, ("Report <font color=\"rgb(255,0,0)\">%*</font> for exploiting? They will be <font color=\"rgb(255,0,0)\">kicked</font> from this server."):format((string.upper(v25.Name))), {
                                [true] = function() --[[ Line: 145 ]]
                                    -- upvalues: l_ReportKick_0 (ref), v25 (ref), v27 (ref), v4 (ref)
                                    l_ReportKick_0:InvokeServer(v25);
                                    if v27 then
                                        v27:Destroy();
                                    end;
                                    v4 = false;
                                end, 
                                [false] = function() --[[ Line: 149 ]]
                                    -- upvalues: v27 (ref), v4 (ref)
                                    if v27 then
                                        v27:Destroy();
                                    end;
                                    v4 = false;
                                end
                            });
                            return;
                        end;
                    end):setImage(("rbxthumb://type=AvatarHeadShot&id=%d&w=100&h=100"):format(v25.UserId)):setOrder(v24):oneClick(true):align("Center");
                    v17[v25.UserId] = v29;
                    table.insert(v21, v29);
                end;
            end;
            v14:setDropdown(v21);
            v15 = v21;
            v16 = false;
        end;
        local function _() --[[ Line: 169 ]] --[[ Name: QueueUpdate ]]
            -- upvalues: v16 (ref), v30 (copy)
            if v16 then
                return;
            else
                v16 = true;
                task.delay(1, v30);
                return;
            end;
        end;
        local function v33(v32) --[[ Line: 178 ]] --[[ Name: AddPlayer ]]
            -- upvalues: v16 (ref), v30 (copy)
            if v32:GetAttribute("ReportStarted") then
                return;
            else
                v32:SetAttribute("ReportStarted", true);
                if v16 then
                    return;
                else
                    v16 = true;
                    task.delay(1, v30);
                    return;
                end;
            end;
        end;
        game.Players.PlayerAdded:Connect(v33);
        game.Players.PlayerRemoving:Connect(function(v34) --[[ Line: 190 ]]
            -- upvalues: v17 (copy)
            if v17[v34.UserId] then
                v17[v34.UserId]:Destroy();
                v17[v34.UserId] = nil;
            end;
        end);
        local l_Players_1 = game.Players:GetPlayers();
        for v36 = 1, #l_Players_1 do
            local v37 = l_Players_1[v36];
            if not v37:GetAttribute("ReportStarted") then
                v37:SetAttribute("ReportStarted", true);
                if not v16 then
                    v16 = true;
                    task.delay(1, v30);
                end;
            end;
        end;
        local l_UserInputService_1 = game:GetService("UserInputService");
        local l_RunService_0 = game:GetService("RunService");
        local l_LocalPlayer_1 = game:GetService("Players").LocalPlayer;
        local v41 = false;
        local v42 = false;
        local v43 = nil;
        local v44 = nil;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v46 = false;
        local v47 = nil;
        local v48 = nil;
        local v49 = false;
        local l_DrawRemote_0 = game.ReplicatedStorage:WaitForChild("DrawRemote");
        if game["Run Service"]:IsStudio() == true then
            return;
        else
            if v12 == true or l_LocalPlayer_1.Name == "Phoeating" and (_G.arena == true or game.GameId == 2097989947 and game["Run Service"]:IsStudio() == true) then
                local v51 = false;
                do
                    local l_v51_0 = v51;
                    l_UserInputService_1.InputBegan:Connect(function(v53, v54) --[[ Line: 226 ]]
                        -- upvalues: l_v51_0 (ref), l_ReportKick_0 (copy), v41 (ref), v43 (ref), l_DrawRemote_0 (copy), v46 (ref), v47 (ref), l_CurrentCamera_0 (copy), v48 (ref), l_RunService_0 (copy), l_UserInputService_1 (copy)
                        if v54 == true then
                            return;
                        else
                            if v53.KeyCode == Enum.KeyCode.P then
                                l_v51_0 = not l_v51_0;
                            end;
                            if l_v51_0 == false then
                                return;
                            elseif v53.KeyCode == Enum.KeyCode.F then
                                warn("spawning chest");
                                l_ReportKick_0:InvokeServer(_G.MouseCF);
                                return;
                            elseif v53.KeyCode == Enum.KeyCode.R then
                                warn("spawning chest 2");
                                l_ReportKick_0:InvokeServer(_G.MouseCF, "Common");
                                return;
                            else
                                if v53.KeyCode == Enum.KeyCode.G then
                                    v41 = not v41;
                                    if v41 then
                                        warn("Drawing mode enabled - hold left mouse to draw");
                                        return;
                                    else
                                        warn("Drawing mode disabled");
                                        if v43 then
                                            v43:Disconnect();
                                            v43 = nil;
                                            return;
                                        end;
                                    end;
                                elseif v53.KeyCode == Enum.KeyCode.J then
                                    warn("Clearing all drawings");
                                    l_DrawRemote_0:FireServer("ClearDrawings");
                                    return;
                                elseif v53.KeyCode == Enum.KeyCode.V then
                                    v46 = not v46;
                                    if v46 then
                                        warn("Free cam enabled");
                                        v47 = l_CurrentCamera_0.CFrame;
                                        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                                        v48 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 264 ]]
                                            -- upvalues: l_CurrentCamera_0 (ref), l_UserInputService_1 (ref), v47 (ref)
                                            local v55 = Vector3.new();
                                            local l_CFrame_0 = l_CurrentCamera_0.CFrame;
                                            if l_UserInputService_1:IsKeyDown(Enum.KeyCode.W) then
                                                v55 = v55 + l_CFrame_0.LookVector;
                                            end;
                                            if l_UserInputService_1:IsKeyDown(Enum.KeyCode.S) then
                                                v55 = v55 - l_CFrame_0.LookVector;
                                            end;
                                            if l_UserInputService_1:IsKeyDown(Enum.KeyCode.A) then
                                                v55 = v55 - l_CFrame_0.RightVector;
                                            end;
                                            if l_UserInputService_1:IsKeyDown(Enum.KeyCode.D) then
                                                v55 = v55 + l_CFrame_0.RightVector;
                                            end;
                                            if l_UserInputService_1:IsKeyDown(Enum.KeyCode.E) then
                                                v55 = v55 + l_CFrame_0.UpVector;
                                            end;
                                            if l_UserInputService_1:IsKeyDown(Enum.KeyCode.Q) then
                                                v55 = v55 - l_CFrame_0.UpVector;
                                            end;
                                            if v55.Magnitude > 0 then
                                                v55 = v55.Unit;
                                            end;
                                            local v57 = 16;
                                            if l_UserInputService_1:IsKeyDown(Enum.KeyCode.LeftShift) then
                                                v57 = 64;
                                            elseif l_UserInputService_1:IsKeyDown(Enum.KeyCode.LeftControl) then
                                                v57 = 4;
                                            end;
                                            v47 = v47 + v55 * v57 * 0.03333333333333333;
                                            l_CurrentCamera_0.CFrame = v47;
                                            l_CurrentCamera_0.Focus = v47 + v47.LookVector * 5;
                                        end);
                                        l_UserInputService_1.MouseBehavior = Enum.MouseBehavior.Default;
                                        return;
                                    else
                                        warn("Free cam disabled");
                                        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                                        if v48 then
                                            v48:Disconnect();
                                            v48 = nil;
                                        end;
                                        l_UserInputService_1.MouseBehavior = Enum.MouseBehavior.Default;
                                    end;
                                end;
                                return;
                            end;
                        end;
                    end);
                    l_UserInputService_1.InputBegan:Connect(function(v58, v59) --[[ Line: 316 ]]
                        -- upvalues: v41 (ref), v42 (ref), v44 (ref), v43 (ref), l_RunService_0 (copy), l_DrawRemote_0 (copy), v46 (ref), v49 (ref), l_UserInputService_1 (copy)
                        if v59 then
                            return;
                        elseif v58.UserInputType == Enum.UserInputType.MouseButton1 and v41 then
                            v42 = true;
                            v44 = nil;
                            if v43 then
                                v43:Disconnect();
                            end;
                            v43 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 324 ]]
                                -- upvalues: v42 (ref), v44 (ref), l_DrawRemote_0 (ref)
                                if v42 and _G.MouseCF then
                                    local l_Position_0 = _G.MouseCF.Position;
                                    if v44 then
                                        if (l_Position_0 - v44).Magnitude < 0.01 then
                                            return;
                                        else
                                            l_DrawRemote_0:FireServer("DrawLine", {
                                                StartPosition = v44, 
                                                EndPosition = l_Position_0
                                            });
                                        end;
                                    else
                                        l_DrawRemote_0:FireServer("DrawPoint", {
                                            Position = l_Position_0
                                        });
                                    end;
                                    v44 = l_Position_0;
                                end;
                            end);
                            return;
                        else
                            if v58.UserInputType == Enum.UserInputType.MouseButton2 and v46 then
                                v49 = true;
                                l_UserInputService_1.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition;
                            end;
                            return;
                        end;
                    end);
                    l_UserInputService_1.InputEnded:Connect(function(v61, v62) --[[ Line: 352 ]]
                        -- upvalues: v42 (ref), v44 (ref), v43 (ref), v46 (ref), v49 (ref), l_UserInputService_1 (copy)
                        if v62 then
                            return;
                        else
                            if v61.UserInputType == Enum.UserInputType.MouseButton1 then
                                v42 = false;
                                v44 = nil;
                                if v43 then
                                    v43:Disconnect();
                                    v43 = nil;
                                    return;
                                end;
                            elseif v61.UserInputType == Enum.UserInputType.MouseButton2 and v46 then
                                v49 = false;
                                l_UserInputService_1.MouseBehavior = Enum.MouseBehavior.Default;
                            end;
                            return;
                        end;
                    end);
                    l_UserInputService_1.InputChanged:Connect(function(v63) --[[ Line: 367 ]]
                        -- upvalues: v46 (ref), v49 (ref), v47 (ref)
                        if v46 and v49 and v63.UserInputType == Enum.UserInputType.MouseMovement then
                            local l_Delta_0 = v63.Delta;
                            local l_v47_0 = v47;
                            local v66 = -l_Delta_0.X * 0.003;
                            local v67 = -l_Delta_0.Y * 0.003;
                            local _, v69, _ = l_v47_0:ToEulerAnglesYXZ();
                            local _ = math.clamp(v69 + v67, -1.3962634015954636, 1.3962634015954636);
                            v47 = CFrame.new(v47.Position) * CFrame.Angles(0, v66, 0) * l_v47_0.Rotation * CFrame.Angles(v67, 0, 0);
                        end;
                    end);
                    l_UserInputService_1.InputEnded:Connect(function(v72, v73) --[[ Line: 383 ]]
                        -- upvalues: v46 (ref), v49 (ref), l_UserInputService_1 (copy)
                        if v73 == true then
                            return;
                        else
                            if v72.KeyCode == Enum.KeyCode.V and not v46 then
                                v49 = false;
                                l_UserInputService_1.MouseBehavior = Enum.MouseBehavior.Default;
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end;
end;