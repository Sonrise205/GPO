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
        if v2.Parent and v2:IsDescendantOf(l_workspace_0) and v3.Parent and v3:IsDescendantOf(l_workspace_0) then
            local l_Jester_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Jester");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_Jester_0.Idle), 
                Walk = v3:LoadAnimation(l_Jester_0.Walk), 
                Run = v3:LoadAnimation(l_Jester_0.Run), 
                Fall = v3:LoadAnimation(l_Jester_0.Fall), 
                Jump = v3:LoadAnimation(l_Jester_0.Jump)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Idle;
            v6.Run.Priority = Enum.AnimationPriority.Movement;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            l_Value_0.Hat.AnimationController:LoadAnimation(script.Animation):Play();
            local v7 = {};
            local function _(v8) --[[ Line: 51 ]] --[[ Name: playAnim ]]
                -- upvalues: v7 (copy), v6 (copy)
                if v7[v8] == nil then
                    v7[v8] = 0;
                end;
                v6[v8]:Play();
                v6[v8].TimePosition = v7[v8];
            end;
            local function _(v10) --[[ Line: 59 ]] --[[ Name: stopAnim ]]
                -- upvalues: v6 (copy), v7 (copy)
                if v6[v10].IsPlaying == false then
                    return;
                else
                    v7[v10] = v6[v10].TimePosition;
                    v6[v10]:Stop();
                    return;
                end;
            end;
            local v12 = "Idle";
            local _ = function() --[[ Line: 68 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v7 (copy)
                for v13, _ in v6 do
                    if v6[v13].IsPlaying ~= false then
                        v7[v13] = v6[v13].TimePosition;
                        v6[v13]:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v16) --[[ Line: 74 ]]
                -- upvalues: l_Value_1 (copy), v12 (ref), v6 (copy), v7 (copy)
                if l_Value_1 + 5 < v16 then
                    if v12 ~= "Running" then
                        v12 = "Running";
                        for v17, _ in v6 do
                            if v6[v17].IsPlaying ~= false then
                                v7[v17] = v6[v17].TimePosition;
                                v6[v17]:Stop();
                            end;
                        end;
                        if v7.Run == nil then
                            v7.Run = 0;
                        end;
                        v6.Run:Play();
                        v6.Run.TimePosition = v7.Run;
                        v6.Run:AdjustSpeed(1.5);
                        return;
                    end;
                elseif v16 > 0.749 then
                    if v12 ~= "Walking" then
                        v12 = "Walking";
                        for v19, _ in v6 do
                            if v6[v19].IsPlaying ~= false then
                                v7[v19] = v6[v19].TimePosition;
                                v6[v19]:Stop();
                            end;
                        end;
                        if v7.Walk == nil then
                            v7.Walk = 0;
                        end;
                        v6.Walk:Play();
                        v6.Walk.TimePosition = v7.Walk;
                        return;
                    end;
                elseif v12 ~= "Idle" then
                    v12 = "Idle";
                    for v21, _ in v6 do
                        if v6[v21].IsPlaying ~= false then
                            v7[v21] = v6[v21].TimePosition;
                            v6[v21]:Stop();
                        end;
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 99 ]]
                -- upvalues: v12 (ref), v6 (copy), v7 (copy)
                if v12 ~= "Jump" then
                    v12 = "Jump";
                    for v23, _ in v6 do
                        if v6[v23].IsPlaying ~= false then
                            v7[v23] = v6[v23].TimePosition;
                            v6[v23]:Stop();
                        end;
                    end;
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v25) --[[ Line: 106 ]]
                -- upvalues: v2 (copy), v12 (ref), v6 (copy), v7 (copy)
                if v25 and v2.FloorMaterial == Enum.Material.Air and v12 ~= "Fall" then
                    v12 = "Fall";
                    for v26, _ in v6 do
                        if v6[v26].IsPlaying ~= false then
                            v7[v26] = v6[v26].TimePosition;
                            v6[v26]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v28) --[[ Line: 115 ]]
                -- upvalues: v2 (copy), v12 (ref), v6 (copy), v7 (copy)
                if v28 and v2.FloorMaterial == Enum.Material.Air and v12 ~= "Fall" then
                    v12 = "Fall";
                    for v29, _ in v6 do
                        if v6[v29].IsPlaying ~= false then
                            v7[v29] = v6[v29].TimePosition;
                            v6[v29]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            while true do
                local v31 = script["JesterLaugh" .. math.random(1, 3)]:Clone();
                v31.Parent = l_Value_0.Head;
                v31:Play();
                _G.destroy(v31, v31.TimeLength + 1);
                task.wait(10);
            end;
        end;
        return;
    end;
end;