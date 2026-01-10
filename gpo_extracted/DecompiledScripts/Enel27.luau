local l_Value_0 = script:WaitForChild("Character").Value;
if not l_Value_0 then
    script:Destroy();
    return;
else
    local l_workspace_0 = workspace;
    local v2 = l_Value_0:WaitForChild("Humanoid", 5);
    if not v2 or v2.Health <= 0 then
        script:Destroy();
        return;
    else
        local v3 = v2:WaitForChild("Animator", 3) or v2;
        if not v2.Parent or not v2:IsDescendantOf(l_workspace_0) or not v3.Parent or not v3:IsDescendantOf(l_workspace_0) then
            return;
        else
            local l_Enel_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Enel");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_Enel_0.Idle), 
                Walk = v3:LoadAnimation(l_Enel_0.Walk), 
                Run = v3:LoadAnimation(l_Enel_0.Run), 
                Fall = v3:LoadAnimation(l_Enel_0.Fall), 
                Jump = v3:LoadAnimation(l_Enel_0.Jump), 
                Ear = v3:LoadAnimation(l_Enel_0.Ear)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Idle;
            v6.Run.Priority = Enum.AnimationPriority.Idle;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            local function v8(v7) --[[ Line: 34 ]] --[[ Name: footstep ]]
                -- upvalues: l_Value_0 (copy)
                if v7:match("step") and v7 ~= "step" and _G.footstep and (l_Value_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.p).magnitude <= 150 then
                    _G.footstep(v7, nil, l_Value_0);
                end;
            end;
            v6.Walk.KeyframeReached:Connect(function(v9) --[[ Line: 39 ]]
                -- upvalues: v8 (copy)
                v8(v9);
            end);
            if v6.Run ~= nil then
                v6.Run.KeyframeReached:Connect(function(v10) --[[ Line: 43 ]]
                    -- upvalues: v8 (copy)
                    v8(v10);
                end);
            end;
            local v11 = "Idle";
            local _ = function() --[[ Line: 48 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy)
                for _, v13 in v6 do
                    v13:Stop();
                end;
            end;
            v2.Running:Connect(function(v15) --[[ Line: 53 ]]
                -- upvalues: l_Value_1 (copy), v11 (ref), v6 (copy)
                if l_Value_1 + 5 < v15 then
                    if v11 ~= "Running" then
                        v11 = "Running";
                        for _, v17 in v6 do
                            v17:Stop();
                        end;
                        v6.Run:Play();
                        return;
                    end;
                elseif v15 > 0.749 then
                    if v11 ~= "Walking" then
                        v11 = "Walking";
                        for _, v19 in v6 do
                            v19:Stop();
                        end;
                        v6.Walk:Play();
                        return;
                    end;
                elseif v11 ~= "Idle" then
                    v11 = "Idle";
                    for _, v21 in v6 do
                        v21:Stop();
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 74 ]]
                -- upvalues: v11 (ref), v6 (copy)
                if v11 ~= "Jump" then
                    v11 = "Jump";
                    for _, v23 in v6 do
                        v23:Stop();
                    end;
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v24) --[[ Line: 81 ]]
                -- upvalues: v11 (ref), v6 (copy)
                if v24 and v11 ~= "Fall" then
                    v11 = "Fall";
                    for _, v26 in v6 do
                        v26:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v27) --[[ Line: 90 ]]
                -- upvalues: v11 (ref), v6 (copy)
                if v27 and v11 ~= "Fall" then
                    v11 = "Fall";
                    for _, v29 in v6 do
                        v29:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            v6.Ear:Play();
            return;
        end;
    end;
end;