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
            local l_Human_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Human");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_Human_0.Idle), 
                Walk = v3:LoadAnimation(l_Human_0.Walk), 
                Run = v3:LoadAnimation(l_Human_0.Run), 
                Fall = v3:LoadAnimation(l_Human_0.Fall), 
                Jump = v3:LoadAnimation(l_Human_0.Jump)
            };
            if l_Value_0.Info:FindFirstChild("Weapon") then
                local l_Value_2 = l_Value_0.Info:FindFirstChild("Weapon").Value;
                if game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2) and game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2):FindFirstChild("runAnim") then
                    v6.Run = v3:LoadAnimation(game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2):FindFirstChild("runAnim"));
                    v6.Run.Priority = Enum.AnimationPriority.Movement;
                else
                    v6.Run.Priority = Enum.AnimationPriority.Idle;
                end;
            else
                v6.Run.Priority = Enum.AnimationPriority.Idle;
            end;
            v6.Idle.Priority = Enum.AnimationPriority.Core;
            v6.Walk.Priority = Enum.AnimationPriority.Idle;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            local function v9(v8) --[[ Line: 51 ]] --[[ Name: footstep ]]
                -- upvalues: l_Value_0 (copy)
                if v8:match("step") and v8 ~= "step" and _G.footstep and (l_Value_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.p).magnitude <= 150 then
                    _G.footstep(v8, nil, l_Value_0);
                end;
            end;
            v6.Walk.KeyframeReached:Connect(function(v10) --[[ Line: 56 ]]
                -- upvalues: v9 (copy)
                v9(v10);
            end);
            if v6.Run ~= nil then
                v6.Run.KeyframeReached:Connect(function(v11) --[[ Line: 60 ]]
                    -- upvalues: v9 (copy)
                    v9(v11);
                end);
            end;
            local v12 = {};
            local function _(v13) --[[ Line: 66 ]] --[[ Name: playAnim ]]
                -- upvalues: v12 (copy), v6 (copy)
                if v12[v13] == nil then
                    v12[v13] = 0;
                end;
                v6[v13]:Play();
                v6[v13].TimePosition = v12[v13];
            end;
            local function _(v15) --[[ Line: 74 ]] --[[ Name: stopAnim ]]
                -- upvalues: v6 (copy), v12 (copy)
                if v6[v15].IsPlaying == false then
                    return;
                else
                    v12[v15] = v6[v15].TimePosition;
                    v6[v15]:Stop();
                    return;
                end;
            end;
            local v17 = "Idle";
            local _ = function() --[[ Line: 83 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v12 (copy)
                for v18, _ in v6 do
                    if v6[v18].IsPlaying ~= false then
                        v12[v18] = v6[v18].TimePosition;
                        v6[v18]:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v21) --[[ Line: 89 ]]
                -- upvalues: l_Value_1 (copy), v17 (ref), v6 (copy), v12 (copy)
                if l_Value_1 + 5 < v21 then
                    if v17 ~= "Running" or v6.Run.IsPlaying == false then
                        v17 = "Running";
                        for v22, _ in v6 do
                            if v6[v22].IsPlaying ~= false then
                                v12[v22] = v6[v22].TimePosition;
                                v6[v22]:Stop();
                            end;
                        end;
                        if v12.Run == nil then
                            v12.Run = 0;
                        end;
                        v6.Run:Play();
                        v6.Run.TimePosition = v12.Run;
                        v6.Run:AdjustSpeed(2);
                        return;
                    end;
                elseif v21 > 0.749 then
                    if v17 ~= "Walking" or v6.Walk.IsPlaying == false then
                        v17 = "Walking";
                        for v24, _ in v6 do
                            if v6[v24].IsPlaying ~= false then
                                v12[v24] = v6[v24].TimePosition;
                                v6[v24]:Stop();
                            end;
                        end;
                        if v12.Walk == nil then
                            v12.Walk = 0;
                        end;
                        v6.Walk:Play();
                        v6.Walk.TimePosition = v12.Walk;
                        return;
                    end;
                elseif v17 ~= "Idle" then
                    v17 = "Idle";
                    for v26, _ in v6 do
                        if v6[v26].IsPlaying ~= false then
                            v12[v26] = v6[v26].TimePosition;
                            v6[v26]:Stop();
                        end;
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 114 ]]
                -- upvalues: v17 (ref), v6 (copy), v12 (copy)
                if v17 ~= "Jump" then
                    v17 = "Jump";
                    for v28, _ in v6 do
                        if v6[v28].IsPlaying ~= false then
                            v12[v28] = v6[v28].TimePosition;
                            v6[v28]:Stop();
                        end;
                    end;
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v30) --[[ Line: 121 ]]
                -- upvalues: v2 (copy), v17 (ref), v6 (copy), v12 (copy)
                if v30 and v2.FloorMaterial == Enum.Material.Air and v17 ~= "Fall" then
                    v17 = "Fall";
                    for v31, _ in v6 do
                        if v6[v31].IsPlaying ~= false then
                            v12[v31] = v6[v31].TimePosition;
                            v6[v31]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v33) --[[ Line: 130 ]]
                -- upvalues: v2 (copy), v17 (ref), v6 (copy), v12 (copy)
                if v33 and v2.FloorMaterial == Enum.Material.Air and v17 ~= "Fall" then
                    v17 = "Fall";
                    for v34, _ in v6 do
                        if v6[v34].IsPlaying ~= false then
                            v12[v34] = v6[v34].TimePosition;
                            v6[v34]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            return;
        end;
    end;
end;