local l_Parent_0 = script.Parent;
if not l_Parent_0:IsA("Actor") then
    warn("ActorScript Parent wasn't an Actor: " .. script:GetFullName());
    return;
else
    local l_Event_0 = l_Parent_0.Event;
    local l_game_Service_0 = game:FindService("Players");
    local l_game_Service_1 = game:FindService("RunService");
    local l_game_Service_2 = game:FindService("ReplicatedStorage");
    local v5 = l_game_Service_0.LocalPlayer or l_game_Service_0.PlayerAdded:Wait();
    local v6 = {
        l_game_Service_2, 
        v5:WaitForChild("PlayerScripts")
    };
    local v7 = nil;
    for _, v9 in v6 do
        local l_v9_FirstChild_0 = v9:FindFirstChild("SmartBone", true);
        if l_v9_FirstChild_0 and l_v9_FirstChild_0:IsA("ModuleScript") then
            v7 = l_v9_FirstChild_0;
            break;
        end;
    end;
    if not v7 then
        warn("SmartBone was not found!");
        return;
    else
        local l_Dependencies_0 = v7:WaitForChild("Dependencies");
        local l_Config_0 = require(l_Dependencies_0:WaitForChild("Config"));
        local v13 = require(v7);
        local l_CameraUtil_0 = require(l_Dependencies_0:WaitForChild("CameraUtil"));
        local _ = l_Config_0.Debug;
        local l_clock_0 = os.clock;
        local v17 = l_clock_0();
        local v18 = 60;
        local v19 = {};
        local l_AnimatedHats_0 = l_game_Service_2:WaitForChild("Stats" .. game.Players.LocalPlayer.Name):WaitForChild("Settings"):WaitForChild("AnimatedHats");
        local v21 = false;
        local function _(v22) --[[ Line: 63 ]] --[[ Name: roundNumber ]]
            return math.floor(v22 * 1000 + 0.5) / 1000;
        end;
        local function v26() --[[ Line: 67 ]] --[[ Name: smoothDelta ]]
            -- upvalues: l_clock_0 (copy), v19 (copy), v18 (ref), v17 (copy)
            local v24 = l_clock_0();
            for v25 = #v19, 1, -1 do
                v19[v25 + 1] = v19[v25] >= v24 - 1 and v19[v25] or nil;
            end;
            v19[1] = v24;
            v18 = math.floor(l_clock_0() - v17 >= 1 and #v19 or #v19 / (l_clock_0() - v17));
            return math.floor((v18 * (1 / v18) ^ 2 + 0.001) * 1000 + 0.5) / 1000;
        end;
        local _ = function(v27, v28) --[[ Line: 80 ]] --[[ Name: Initialize ]]
            -- upvalues: v13 (copy), l_game_Service_1 (copy), v26 (copy), l_AnimatedHats_0 (copy), v21 (ref), l_CameraUtil_0 (copy)
            local v29 = v13.new(v27, v28);
            local v30 = 0;
            local v31 = false;
            v29.SimulationConnection = l_game_Service_1.Heartbeat:ConnectParallel(function(v32) --[[ Line: 86 ]]
                -- upvalues: v26 (ref), l_AnimatedHats_0 (ref), v21 (ref), v31 (ref), v29 (copy), v30 (ref), l_CameraUtil_0 (ref)
                v32 = v26();
                if workspace:GetAttribute("LowFXMode") or workspace:GetAttribute("NoClothingPhysics") or l_AnimatedHats_0.Value == false or v21 == false then
                    if v31 then
                        return;
                    else
                        v31 = true;
                        v29.InRange = false;
                        for _, v34 in v29.ParticleTrees do
                            v29:ResetParticles(v34);
                        end;
                        task.synchronize();
                        for _, v36 in v29.ParticleTrees do
                            v29:ResetTransforms(v36, v32);
                        end;
                        task.desynchronize();
                        return;
                    end;
                else
                    v30 = v30 + v32;
                    local l_Position_0 = workspace.CurrentCamera.CFrame.Position;
                    local l_Position_1 = v29.RootPart.Position;
                    local l_ThrottleDistance_0 = v29.Settings.ThrottleDistance;
                    local l_Magnitude_0 = (l_Position_0 - l_Position_1).Magnitude;
                    local l_ActivationDistance_0 = v29.Settings.ActivationDistance;
                    local v42 = math.floor((math.clamp((1 - math.clamp(math.clamp(l_Magnitude_0 - l_ThrottleDistance_0, 0, l_ActivationDistance_0) / l_ActivationDistance_0, 0, 1)) * v29.Settings.UpdateRate, 1, v29.Settings.UpdateRate)));
                    local v43 = l_CameraUtil_0.WithinViewport(v29.RootPart);
                    if v30 >= 1 / v42 then
                        if v31 then
                            v31 = false;
                        end;
                        if l_Magnitude_0 < l_ActivationDistance_0 and v43 then
                            v32 = v30;
                            v30 = 0;
                            debug.profilebegin("SmartBone");
                            if not v29.InRange then
                                v29.InRange = true;
                            end;
                            v29:UpdateBones(v32, v42);
                            debug.profileend();
                            task.synchronize();
                            debug.profilebegin("SmartBoneTransform");
                            for _, v45 in v29.ParticleTrees do
                                v29:TransformBones(v45, v32);
                            end;
                            debug.profileend();
                            task.desynchronize();
                            return;
                        elseif v29.InRange then
                            v29.InRange = false;
                            for _, v47 in v29.ParticleTrees do
                                v29:ResetParticles(v47);
                            end;
                            task.synchronize();
                            for _, v49 in v29.ParticleTrees do
                                v29:ResetTransforms(v49, v32);
                            end;
                            task.desynchronize();
                        end;
                    end;
                    return;
                end;
            end);
            return v29;
        end;
        l_Event_0.OnInvoke = function(v51, v52) --[[ Line: 179 ]]
            -- upvalues: v21 (ref), v5 (copy), v13 (copy), l_game_Service_1 (copy), v26 (copy), l_AnimatedHats_0 (copy), l_CameraUtil_0 (copy)
            v21 = v51:IsDescendantOf(v5.Character);
            local v53 = v13.new(v51, v52);
            local v54 = 0;
            local v55 = false;
            v53.SimulationConnection = l_game_Service_1.Heartbeat:ConnectParallel(function(v56) --[[ Line: 86 ]]
                -- upvalues: v26 (ref), l_AnimatedHats_0 (ref), v21 (ref), v55 (ref), v53 (copy), v54 (ref), l_CameraUtil_0 (ref)
                v56 = v26();
                if workspace:GetAttribute("LowFXMode") or workspace:GetAttribute("NoClothingPhysics") or l_AnimatedHats_0.Value == false or v21 == false then
                    if v55 then
                        return;
                    else
                        v55 = true;
                        v53.InRange = false;
                        for _, v58 in v53.ParticleTrees do
                            v53:ResetParticles(v58);
                        end;
                        task.synchronize();
                        for _, v60 in v53.ParticleTrees do
                            v53:ResetTransforms(v60, v56);
                        end;
                        task.desynchronize();
                        return;
                    end;
                else
                    v54 = v54 + v56;
                    local l_Position_2 = workspace.CurrentCamera.CFrame.Position;
                    local l_Position_3 = v53.RootPart.Position;
                    local l_ThrottleDistance_1 = v53.Settings.ThrottleDistance;
                    local l_Magnitude_1 = (l_Position_2 - l_Position_3).Magnitude;
                    local l_ActivationDistance_1 = v53.Settings.ActivationDistance;
                    local v66 = math.floor((math.clamp((1 - math.clamp(math.clamp(l_Magnitude_1 - l_ThrottleDistance_1, 0, l_ActivationDistance_1) / l_ActivationDistance_1, 0, 1)) * v53.Settings.UpdateRate, 1, v53.Settings.UpdateRate)));
                    local v67 = l_CameraUtil_0.WithinViewport(v53.RootPart);
                    if v54 >= 1 / v66 then
                        if v55 then
                            v55 = false;
                        end;
                        if l_Magnitude_1 < l_ActivationDistance_1 and v67 then
                            v56 = v54;
                            v54 = 0;
                            debug.profilebegin("SmartBone");
                            if not v53.InRange then
                                v53.InRange = true;
                            end;
                            v53:UpdateBones(v56, v66);
                            debug.profileend();
                            task.synchronize();
                            debug.profilebegin("SmartBoneTransform");
                            for _, v69 in v53.ParticleTrees do
                                v53:TransformBones(v69, v56);
                            end;
                            debug.profileend();
                            task.desynchronize();
                            return;
                        elseif v53.InRange then
                            v53.InRange = false;
                            for _, v71 in v53.ParticleTrees do
                                v53:ResetParticles(v71);
                            end;
                            task.synchronize();
                            for _, v73 in v53.ParticleTrees do
                                v53:ResetTransforms(v73, v56);
                            end;
                            task.desynchronize();
                        end;
                    end;
                    return;
                end;
            end);
            return v53;
        end;
        return;
    end;
end;