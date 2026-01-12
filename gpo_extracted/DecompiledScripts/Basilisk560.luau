local l_Value_0 = script:WaitForChild("Character").Value;
if not l_Value_0 then
    script:Destroy();
    return;
else
    local l_workspace_0 = workspace;
    local v2 = l_Value_0:WaitForChild("Humanoid", 5);
    if v2:IsA("Humanoid") == false then
        script:Destroy();
        return;
    elseif not v2 or v2.Health <= 0 then
        script:Destroy();
        return;
    else
        local v3 = v2:WaitForChild("Animator", 3) or v2;
        if not v2.Parent or not v2:IsDescendantOf(l_workspace_0) or not v3.Parent or not v3:IsDescendantOf(l_workspace_0) then
            return;
        else
            local l_Basilisk_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Basilisk");
            local _ = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_Basilisk_0.Idle), 
                Walk = v3:LoadAnimation(l_Basilisk_0.Walk), 
                Run = v3:LoadAnimation(l_Basilisk_0.Run), 
                Fall = v3:LoadAnimation(l_Basilisk_0.Fall), 
                Jump = v3:LoadAnimation(l_Basilisk_0.Jump), 
                Land = v3:LoadAnimation(l_Basilisk_0.Land)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Movement;
            v6.Run.Priority = Enum.AnimationPriority.Movement;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            v6.Land.Priority = Enum.AnimationPriority.Movement;
            local function v8(v7) --[[ Line: 41 ]] --[[ Name: footstep ]]
                -- upvalues: l_Value_0 (copy)
                if v7:match("step") and v7 ~= "step" and _G.footstep and (l_Value_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.Position).magnitude <= 150 then
                    _G.footstep(v7, nil, l_Value_0);
                end;
            end;
            v6.Walk.KeyframeReached:Connect(function(v9) --[[ Line: 47 ]]
                -- upvalues: v8 (copy)
                v8(v9);
            end);
            if v6.Run ~= nil then
                v6.Run.KeyframeReached:Connect(function(v10) --[[ Line: 52 ]]
                    -- upvalues: v8 (copy)
                    v8(v10);
                end);
            end;
            local v11 = {};
            local function _(v12) --[[ Line: 59 ]] --[[ Name: playAnim ]]
                -- upvalues: v11 (copy), v6 (copy)
                if v11[v12] == nil then
                    v11[v12] = 0;
                end;
                v6[v12]:Play();
                v6[v12].TimePosition = v11[v12];
            end;
            local function _(v14) --[[ Line: 68 ]] --[[ Name: stopAnim ]]
                -- upvalues: v6 (copy), v11 (copy)
                if v6[v14].IsPlaying == false then
                    return;
                else
                    v11[v14] = v6[v14].TimePosition;
                    v6[v14]:Stop();
                    return;
                end;
            end;
            local v16 = "Idle";
            local _ = function() --[[ Line: 77 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v11 (copy)
                for v17, _ in v6 do
                    if v6[v17].IsPlaying ~= false then
                        v11[v17] = v6[v17].TimePosition;
                        v6[v17]:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v20) --[[ Line: 85 ]]
                -- upvalues: v16 (ref), v6 (copy), v11 (copy)
                if v20 > 20 then
                    if v16 ~= "Running" then
                        v16 = "Running";
                        for v21, _ in v6 do
                            if v6[v21].IsPlaying ~= false then
                                v11[v21] = v6[v21].TimePosition;
                                v6[v21]:Stop();
                            end;
                        end;
                        if v11.Run == nil then
                            v11.Run = 0;
                        end;
                        v6.Run:Play();
                        v6.Run.TimePosition = v11.Run;
                        v6.Run:AdjustSpeed(2);
                        return;
                    end;
                elseif v20 > 0.749 then
                    if v16 ~= "Walking" then
                        v16 = "Walking";
                        for v23, _ in v6 do
                            if v6[v23].IsPlaying ~= false then
                                v11[v23] = v6[v23].TimePosition;
                                v6[v23]:Stop();
                            end;
                        end;
                        if v11.Walk == nil then
                            v11.Walk = 0;
                        end;
                        v6.Walk:Play();
                        v6.Walk.TimePosition = v11.Walk;
                        return;
                    end;
                elseif v16 ~= "Idle" then
                    v16 = "Idle";
                    for v25, _ in v6 do
                        if v6[v25].IsPlaying ~= false then
                            v11[v25] = v6[v25].TimePosition;
                            v6[v25]:Stop();
                        end;
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 110 ]]
                -- upvalues: v16 (ref), v6 (copy), v11 (copy)
                if v16 ~= "Jump" then
                    v16 = "Jump";
                    for v27, _ in v6 do
                        if v6[v27].IsPlaying ~= false then
                            v11[v27] = v6[v27].TimePosition;
                            v6[v27]:Stop();
                        end;
                    end;
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v29) --[[ Line: 117 ]]
                -- upvalues: v2 (copy), v16 (ref), v6 (copy), v11 (copy)
                if v29 and v2.FloorMaterial == Enum.Material.Air and v16 ~= "Fall" then
                    v16 = "Fall";
                    for v30, _ in v6 do
                        if v6[v30].IsPlaying ~= false then
                            v11[v30] = v6[v30].TimePosition;
                            v6[v30]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v32) --[[ Line: 126 ]]
                -- upvalues: v2 (copy), v16 (ref), v6 (copy), v11 (copy)
                if v32 and v2.FloorMaterial == Enum.Material.Air and v16 ~= "Fall" then
                    v16 = "Fall";
                    for v33, _ in v6 do
                        if v6[v33].IsPlaying ~= false then
                            v11[v33] = v6[v33].TimePosition;
                            v6[v33]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            v2:GetPropertyChangedSignal("FloorMaterial"):Connect(function() --[[ Line: 136 ]]
                -- upvalues: v2 (copy), v6 (copy)
                if v2.FloorMaterial == Enum.Material.Air then
                    return;
                else
                    v6.Land:Play();
                    return;
                end;
            end);
            return;
        end;
    end;
end;