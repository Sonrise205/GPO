local v0 = false;
local l_Value_0 = script:WaitForChild("Character").Value;
if not l_Value_0 then
    script:Destroy();
    return;
else
    local l_workspace_0 = workspace;
    local v3 = l_Value_0:WaitForChild("Humanoid", 5);
    if v3:IsA("Humanoid") == false then
        script:Destroy();
        return;
    elseif not v3 or v3.Health <= 0 then
        script:Destroy();
        return;
    else
        local v4 = v3:WaitForChild("Animator", 3) or v3;
        if v3.Parent and v3:IsDescendantOf(l_workspace_0) and v4.Parent and v4:IsDescendantOf(l_workspace_0) then
            local l_Human_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Human");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v7 = {
                Idle = v4:LoadAnimation(l_Human_0.Idle), 
                Walk = v4:LoadAnimation(l_Human_0.Walk), 
                Run = v4:LoadAnimation(l_Human_0.Run), 
                Fall = v4:LoadAnimation(l_Human_0.Fall), 
                Jump = v4:LoadAnimation(l_Human_0.Jump)
            };
            if l_Value_0.Info:FindFirstChild("Weapon") then
                local l_Value_2 = l_Value_0.Info:FindFirstChild("Weapon").Value;
                if game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2) and game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2):FindFirstChild("runAnim") then
                    v7.Run = v4:LoadAnimation(game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2):FindFirstChild("runAnim"));
                    v7.Run.Priority = Enum.AnimationPriority.Movement;
                    v0 = true;
                end;
                if not v0 then
                    v7.Run.Priority = Enum.AnimationPriority.Idle;
                    v0 = true;
                end;
            end;
            if not v0 then
                if not v0 then
                    v7.Run.Priority = Enum.AnimationPriority.Idle;
                end;
            end;
            v0 = false;
            v7.Idle.Priority = Enum.AnimationPriority.Core;
            v7.Walk.Priority = Enum.AnimationPriority.Idle;
            v7.Jump.Priority = Enum.AnimationPriority.Movement;
            v7.Fall.Priority = Enum.AnimationPriority.Movement;
            local function v10(v9) --[[ Line: 51 ]] --[[ Name: footstep ]]
                -- upvalues: l_Value_0 (copy)
                if v9:match("step") and v9 ~= "step" and _G.footstep and (l_Value_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.p).magnitude <= 150 then
                    _G.footstep(v9, nil, l_Value_0);
                end;
            end;
            v7.Walk.KeyframeReached:Connect(function(v11) --[[ Line: 56 ]]
                -- upvalues: v10 (copy)
                v10(v11);
            end);
            if v7.Run ~= nil then
                v7.Run.KeyframeReached:Connect(function(v12) --[[ Line: 60 ]]
                    -- upvalues: v10 (copy)
                    v10(v12);
                end);
            end;
            local v13 = {};
            local function _(v14) --[[ Line: 67 ]] --[[ Name: playAnim ]]
                -- upvalues: v13 (copy), v7 (copy)
                if v13[v14] == nil then
                    v13[v14] = 0;
                end;
                v7[v14]:Play();
                v7[v14].TimePosition = v13[v14];
            end;
            local function _(v16) --[[ Line: 75 ]] --[[ Name: stopAnim ]]
                -- upvalues: v7 (copy), v13 (copy)
                if v7[v16].IsPlaying == false then
                    return;
                else
                    v13[v16] = v7[v16].TimePosition;
                    v7[v16]:Stop();
                    return;
                end;
            end;
            local v18 = "Idle";
            local _ = function() --[[ Line: 84 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v7 (copy), v13 (copy)
                for v19, _ in v7 do
                    if v7[v19].IsPlaying ~= false then
                        v13[v19] = v7[v19].TimePosition;
                        v7[v19]:Stop();
                    end;
                end;
            end;
            v3.Running:Connect(function(v22) --[[ Line: 90 ]]
                -- upvalues: l_Value_1 (copy), v18 (ref), v7 (copy), v13 (copy)
                if l_Value_1 + 5 < v22 then
                    if v18 ~= "Running" or v7.Run.IsPlaying == false then
                        v18 = "Running";
                        for v23, _ in v7 do
                            if v7[v23].IsPlaying ~= false then
                                v13[v23] = v7[v23].TimePosition;
                                v7[v23]:Stop();
                            end;
                        end;
                        if v13.Run == nil then
                            v13.Run = 0;
                        end;
                        v7.Run:Play();
                        v7.Run.TimePosition = v13.Run;
                        v7.Run:AdjustSpeed(2);
                        return;
                    end;
                elseif v22 > 0.749 then
                    if v18 ~= "Walking" or v7.Walk.IsPlaying == false then
                        v18 = "Walking";
                        for v25, _ in v7 do
                            if v7[v25].IsPlaying ~= false then
                                v13[v25] = v7[v25].TimePosition;
                                v7[v25]:Stop();
                            end;
                        end;
                        if v13.Walk == nil then
                            v13.Walk = 0;
                        end;
                        v7.Walk:Play();
                        v7.Walk.TimePosition = v13.Walk;
                        return;
                    end;
                elseif v18 ~= "Idle" then
                    v18 = "Idle";
                    for v27, _ in v7 do
                        if v7[v27].IsPlaying ~= false then
                            v13[v27] = v7[v27].TimePosition;
                            v7[v27]:Stop();
                        end;
                    end;
                    v7.Idle:Play();
                end;
            end);
            v3.Jumping:Connect(function() --[[ Line: 115 ]]
                -- upvalues: v18 (ref), v7 (copy), v13 (copy)
                if v18 ~= "Jump" then
                    v18 = "Jump";
                    for v29, _ in v7 do
                        if v7[v29].IsPlaying ~= false then
                            v13[v29] = v7[v29].TimePosition;
                            v7[v29]:Stop();
                        end;
                    end;
                    v7.Jump:Play();
                end;
            end);
            v3.FreeFalling:Connect(function(v31) --[[ Line: 122 ]]
                -- upvalues: v3 (copy), v18 (ref), v7 (copy), v13 (copy)
                if v31 and v3.FloorMaterial == Enum.Material.Air and v18 ~= "Fall" then
                    v18 = "Fall";
                    for v32, _ in v7 do
                        if v7[v32].IsPlaying ~= false then
                            v13[v32] = v7[v32].TimePosition;
                            v7[v32]:Stop();
                        end;
                    end;
                    v7.Fall:Play();
                end;
            end);
            v3.FallingDown:Connect(function(v34) --[[ Line: 131 ]]
                -- upvalues: v3 (copy), v18 (ref), v7 (copy), v13 (copy)
                if v34 and v3.FloorMaterial == Enum.Material.Air and v18 ~= "Fall" then
                    v18 = "Fall";
                    for v35, _ in v7 do
                        if v7[v35].IsPlaying ~= false then
                            v13[v35] = v7[v35].TimePosition;
                            v7[v35]:Stop();
                        end;
                    end;
                    v7.Fall:Play();
                end;
            end);
            v7.Idle:Play();
            while true do
                task.wait(math.random(5, 10));
                _G.PlaySound(l_Value_0.Head, script["RyumaVoice" .. math.random(1, 4)]).Parent = l_Value_0.Head;
            end;
        end;
        return;
    end;
end;