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
                    warn("going run");
                end;
            end;
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Idle;
            v6.Run.Priority = Enum.AnimationPriority.Movement;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            l_Value_0.PumpkinHead.AnimationController:LoadAnimation(script.Head):Play();
            local v8 = {};
            local function _(v9) --[[ Line: 51 ]] --[[ Name: playAnim ]]
                -- upvalues: v8 (copy), v6 (copy)
                if v8[v9] == nil then
                    v8[v9] = 0;
                end;
                v6[v9]:Play();
                v6[v9].TimePosition = v8[v9];
            end;
            local function _(v11) --[[ Line: 59 ]] --[[ Name: stopAnim ]]
                -- upvalues: v6 (copy), v8 (copy)
                if v6[v11].IsPlaying == false then
                    return;
                else
                    v8[v11] = v6[v11].TimePosition;
                    v6[v11]:Stop();
                    return;
                end;
            end;
            local v13 = "Idle";
            local _ = function() --[[ Line: 68 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v8 (copy)
                for v14, _ in v6 do
                    if v6[v14].IsPlaying ~= false then
                        v8[v14] = v6[v14].TimePosition;
                        v6[v14]:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v17) --[[ Line: 74 ]]
                -- upvalues: l_Value_1 (copy), v13 (ref), v6 (copy), v8 (copy)
                if l_Value_1 + 5 < v17 then
                    if v13 ~= "Running" then
                        v13 = "Running";
                        for v18, _ in v6 do
                            if v6[v18].IsPlaying ~= false then
                                v8[v18] = v6[v18].TimePosition;
                                v6[v18]:Stop();
                            end;
                        end;
                        if v8.Run == nil then
                            v8.Run = 0;
                        end;
                        v6.Run:Play();
                        v6.Run.TimePosition = v8.Run;
                        v6.Run:AdjustSpeed(2);
                        return;
                    end;
                elseif v17 > 0.749 then
                    if v13 ~= "Walking" then
                        v13 = "Walking";
                        for v20, _ in v6 do
                            if v6[v20].IsPlaying ~= false then
                                v8[v20] = v6[v20].TimePosition;
                                v6[v20]:Stop();
                            end;
                        end;
                        if v8.Walk == nil then
                            v8.Walk = 0;
                        end;
                        v6.Walk:Play();
                        v6.Walk.TimePosition = v8.Walk;
                        return;
                    end;
                elseif v13 ~= "Idle" then
                    v13 = "Idle";
                    for v22, _ in v6 do
                        if v6[v22].IsPlaying ~= false then
                            v8[v22] = v6[v22].TimePosition;
                            v6[v22]:Stop();
                        end;
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 99 ]]
                -- upvalues: v13 (ref), v6 (copy), v8 (copy)
                if v13 ~= "Jump" then
                    v13 = "Jump";
                    for v24, _ in v6 do
                        if v6[v24].IsPlaying ~= false then
                            v8[v24] = v6[v24].TimePosition;
                            v6[v24]:Stop();
                        end;
                    end;
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v26) --[[ Line: 106 ]]
                -- upvalues: v2 (copy), v13 (ref), v6 (copy), v8 (copy)
                if v26 and v2.FloorMaterial == Enum.Material.Air and v13 ~= "Fall" then
                    v13 = "Fall";
                    for v27, _ in v6 do
                        if v6[v27].IsPlaying ~= false then
                            v8[v27] = v6[v27].TimePosition;
                            v6[v27]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v29) --[[ Line: 115 ]]
                -- upvalues: v2 (copy), v13 (ref), v6 (copy), v8 (copy)
                if v29 and v2.FloorMaterial == Enum.Material.Air and v13 ~= "Fall" then
                    v13 = "Fall";
                    for v30, _ in v6 do
                        if v6[v30].IsPlaying ~= false then
                            v8[v30] = v6[v30].TimePosition;
                            v6[v30]:Stop();
                        end;
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            local v32 = 1;
            while true do
                task.wait(math.random(5, 10));
                _G.PlaySound(l_Value_0.Head, script["H" .. v32]).Parent = l_Value_0.Head;
                v32 = v32 + 1;
                if v32 > 4 then
                    v32 = 1;
                end;
            end;
        end;
        return;
    end;
end;