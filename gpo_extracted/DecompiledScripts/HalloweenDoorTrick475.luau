local v0 = {};
local function _(v1, v2) --[[ Line: 3 ]] --[[ Name: GetCFrameOffset ]]
    return v1:Inverse() * v2;
end;
local l_CFrame_0 = script.RigInfo.Frame.CFrame;
local l_CFrame_1 = script.RigInfo.H.CFrame;
local v6 = l_CFrame_0:Inverse() * l_CFrame_1;
v0.start = function(_, v8, v9, v10, v11, v12) --[[ Line: 9 ]] --[[ Name: start ]]
    -- upvalues: v6 (copy)
    if _G.checkRenderDistance(v8.PrimaryPart.CFrame, 150) == false then
        return;
    elseif v8.PrimaryPart == nil then
        return;
    elseif v8:IsDescendantOf(workspace) == false or v10:IsDescendantOf(workspace) == false then
        return;
    else
        local _ = workspace:GetServerTimeNow() - v11;
        local v14 = game.Players.LocalPlayer.Character == v10;
        local v15 = v8.AnimationController:LoadAnimation(script.doorAnim);
        v15:Play();
        v10.Humanoid:LoadAnimation(script.victimAnim):Play();
        v9.Humanoid:LoadAnimation(script.dummyAnim):Play();
        local v16 = script.Frame:Clone();
        v16.CFrame = v8.PrimaryPart.CFrame;
        v16.Parent = workspace.Effects;
        local v17 = script.Silly:Clone();
        v17.CFrame = v8.PrimaryPart.CFrame * CFrame.new(0, 0, -0.5);
        v17.Parent = workspace.Effects;
        _G.PlaySound(v8.PrimaryPart, script.sfx);
        local _ = tick();
        v15:GetMarkerReachedSignal("doorAction"):Connect(function() --[[ Line: 45 ]]
            -- upvalues: v16 (copy)
            _G.customEmit(v16);
        end);
        v15:GetMarkerReachedSignal("stun"):Connect(function() --[[ Line: 49 ]]
            -- upvalues: v10 (copy)
            local v19 = script.Head.Alert:Clone();
            v19.Parent = v10.Head;
            _G.customEmit(v19);
            _G.destroy(v19, 5);
        end);
        v15:GetMarkerReachedSignal("beatDown"):Connect(function() --[[ Line: 56 ]]
            -- upvalues: v17 (copy)
            _G.particleEnabled(v17, true);
        end);
        v15:GetMarkerReachedSignal("throwOut"):Connect(function() --[[ Line: 60 ]]
            -- upvalues: v17 (copy)
            _G.particleEnabled(v17, false);
            _G.destroy(v17, 3);
        end);
        v15.Stopped:Connect(function() --[[ Line: 65 ]]
            -- upvalues: v16 (copy), v15 (copy)
            _G.destroy(v16, 4);
            v15:Destroy();
        end);
        if v14 == true then
            local v20 = script.CamReAdd:Clone();
            v20:SetPrimaryPartCFrame(v8.PrimaryPart.CFrame * v6);
            v20.Parent = workspace.Effects;
            v20.AnimationController:LoadAnimation(script.cameraAnim):Play();
            local v21 = nil;
            local v22 = tick();
            local l_CFrame_2 = workspace.CurrentCamera.CFrame;
            workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
            _G.PlayEffect("CameraHideUI", nil, true);
            _G.PlayEffect("ScreenFade", nil, 0.25, true);
            task.wait(0.125);
            v10:SetPrimaryPartCFrame(v12);
            local v24 = false;
            do
                local l_v21_0, l_v24_0 = v21, v24;
                l_v21_0 = game["Run Service"].RenderStepped:Connect(function() --[[ Line: 93 ]]
                    -- upvalues: v22 (copy), l_v24_0 (ref), l_CFrame_2 (copy), l_v21_0 (ref), v20 (copy)
                    if tick() - v22 >= 6.3 and l_v24_0 == false then
                        l_v24_0 = true;
                        task.spawn(function() --[[ Line: 96 ]]
                            -- upvalues: l_CFrame_2 (ref), l_v21_0 (ref), v20 (ref)
                            task.wait(0.25);
                            _G.PlayEffect("CameraHideUI", nil, false);
                            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
                            workspace.CurrentCamera.CFrame = l_CFrame_2;
                            l_v21_0:Disconnect();
                            l_v21_0 = nil;
                            v20:Destroy();
                        end);
                    end;
                    workspace.CurrentCamera.CFrame = v20.Cam.CFrame;
                end);
            end;
        end;
        return;
    end;
end;
return v0;