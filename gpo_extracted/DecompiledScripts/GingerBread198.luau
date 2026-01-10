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
            v7.Idle.Priority = Enum.AnimationPriority.Idle;
            v7.Walk.Priority = Enum.AnimationPriority.Idle;
            v7.Jump.Priority = Enum.AnimationPriority.Movement;
            v7.Fall.Priority = Enum.AnimationPriority.Movement;
            local v9 = {};
            local function _(v10) --[[ Line: 54 ]] --[[ Name: playAnim ]]
                -- upvalues: v9 (copy), v7 (copy)
                if v9[v10] == nil then
                    v9[v10] = 0;
                end;
                v7[v10]:Play();
                v7[v10].TimePosition = v9[v10];
            end;
            local function _(v12) --[[ Line: 62 ]] --[[ Name: stopAnim ]]
                -- upvalues: v7 (copy), v9 (copy)
                if v7[v12].IsPlaying == false then
                    return;
                else
                    v9[v12] = v7[v12].TimePosition;
                    v7[v12]:Stop();
                    return;
                end;
            end;
            local v14 = "Idle";
            local _ = function() --[[ Line: 71 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v7 (copy), v9 (copy)
                for v15, _ in v7 do
                    if v7[v15].IsPlaying ~= false then
                        v9[v15] = v7[v15].TimePosition;
                        v7[v15]:Stop();
                    end;
                end;
            end;
            v3.Running:Connect(function(v18) --[[ Line: 77 ]]
                -- upvalues: l_Value_1 (copy), v14 (ref), v7 (copy), v9 (copy)
                if l_Value_1 + 5 < v18 then
                    if v14 ~= "Running" then
                        v14 = "Running";
                        for v19, _ in v7 do
                            if v7[v19].IsPlaying ~= false then
                                v9[v19] = v7[v19].TimePosition;
                                v7[v19]:Stop();
                            end;
                        end;
                        if v9.Run == nil then
                            v9.Run = 0;
                        end;
                        v7.Run:Play();
                        v7.Run.TimePosition = v9.Run;
                        v7.Run:AdjustSpeed(2);
                        return;
                    end;
                elseif v18 > 0.749 then
                    if v14 ~= "Walking" then
                        v14 = "Walking";
                        for v21, _ in v7 do
                            if v7[v21].IsPlaying ~= false then
                                v9[v21] = v7[v21].TimePosition;
                                v7[v21]:Stop();
                            end;
                        end;
                        if v9.Walk == nil then
                            v9.Walk = 0;
                        end;
                        v7.Walk:Play();
                        v7.Walk.TimePosition = v9.Walk;
                        return;
                    end;
                elseif v14 ~= "Idle" then
                    v14 = "Idle";
                    for v23, _ in v7 do
                        if v7[v23].IsPlaying ~= false then
                            v9[v23] = v7[v23].TimePosition;
                            v7[v23]:Stop();
                        end;
                    end;
                    v7.Idle:Play();
                end;
            end);
            v3.Jumping:Connect(function() --[[ Line: 102 ]]
                -- upvalues: v14 (ref), v7 (copy), v9 (copy)
                if v14 ~= "Jump" then
                    v14 = "Jump";
                    for v25, _ in v7 do
                        if v7[v25].IsPlaying ~= false then
                            v9[v25] = v7[v25].TimePosition;
                            v7[v25]:Stop();
                        end;
                    end;
                    v7.Jump:Play();
                end;
            end);
            v3.FreeFalling:Connect(function(v27) --[[ Line: 109 ]]
                -- upvalues: v3 (copy), v14 (ref), v7 (copy), v9 (copy)
                if v27 and v3.FloorMaterial == Enum.Material.Air and v14 ~= "Fall" then
                    v14 = "Fall";
                    for v28, _ in v7 do
                        if v7[v28].IsPlaying ~= false then
                            v9[v28] = v7[v28].TimePosition;
                            v7[v28]:Stop();
                        end;
                    end;
                    v7.Fall:Play();
                end;
            end);
            v3.FallingDown:Connect(function(v30) --[[ Line: 118 ]]
                -- upvalues: v3 (copy), v14 (ref), v7 (copy), v9 (copy)
                if v30 and v3.FloorMaterial == Enum.Material.Air and v14 ~= "Fall" then
                    v14 = "Fall";
                    for v31, _ in v7 do
                        if v7[v31].IsPlaying ~= false then
                            v9[v31] = v7[v31].TimePosition;
                            v7[v31]:Stop();
                        end;
                    end;
                    v7.Fall:Play();
                end;
            end);
            v7.Idle:Play();
            l_Value_0.HeadModel.AnimationController:LoadAnimation(script.Animation):Play();
            local v33 = 1;
            while true do
                task.wait(math.random(5, 10));
                _G.PlaySound(l_Value_0.Head, script["GingerbreadVoice" .. v33]).Parent = l_Value_0.Head;
                v33 = v33 + 1;
                if v33 > 3 then
                    v33 = 1;
                end;
            end;
        end;
        return;
    end;
end;