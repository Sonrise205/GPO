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
            local l_Perona_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Perona");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
            local v7 = {
                Idle = v3:LoadAnimation(l_Perona_0.Idle), 
                Walk = v3:LoadAnimation(l_Perona_0.Walk), 
                Run = v3:LoadAnimation(l_Perona_0.Run), 
                Fall = v3:LoadAnimation(l_Perona_0.Fall), 
                Jump = v3:LoadAnimation(l_Perona_0.Jump)
            };
            local v8 = 2;
            if l_Value_0.Info:FindFirstChild("Weapon") then
                local l_Value_2 = l_Value_0.Info:FindFirstChild("Weapon").Value;
                local l_FirstChild_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2);
                if l_FirstChild_0 and l_FirstChild_0:FindFirstChild("runAnim") then
                    v8 = v6[l_Value_2].runSpeed or 2;
                else
                    v7.Run.Priority = Enum.AnimationPriority.Idle;
                end;
                if l_FirstChild_0 then
                    local function v14(v11, v12) --[[ Line: 49 ]] --[[ Name: updateAnimation ]]
                        -- upvalues: v7 (copy), v3 (copy)
                        if v7[v11] and v7[v11].Animation.AnimationId ~= v12.AnimationId then
                            local l_IsPlaying_0 = v7[v11].IsPlaying;
                            v7[v11]:Stop();
                            v7[v11]:Destroy();
                            v7[v11] = v3:LoadAnimation(v12);
                            if l_IsPlaying_0 then
                                v7[v11]:Play();
                            end;
                        end;
                    end;
                    local l_l_FirstChild_0_0 = l_FirstChild_0 --[[ copy: 11 -> 16 ]];
                    local l_v14_0 = v14 --[[ copy: 12 -> 17 ]];
                    local function v20(v17) --[[ Line: 61 ]] --[[ Name: updateRunning ]]
                        -- upvalues: l_l_FirstChild_0_0 (copy), v7 (copy), l_v14_0 (copy), l_Perona_0 (copy)
                        if l_l_FirstChild_0_0:FindFirstChild("runAnim") == nil then
                            return;
                        else
                            local l_IsPlaying_1 = v7.Run.IsPlaying;
                            if v17 ~= nil then
                                l_v14_0("Run", l_l_FirstChild_0_0:FindFirstChild("runAnim"));
                                v7.Run.Priority = Enum.AnimationPriority.Movement;
                            else
                                l_v14_0("Run", l_Perona_0.Run);
                            end;
                            if l_IsPlaying_1 == true then
                                v7.Run:Play();
                            end;
                            if l_l_FirstChild_0_0:FindFirstChild("walkAnim") == nil then
                                return;
                            else
                                local l_IsPlaying_2 = v7.Walk.IsPlaying;
                                if v17 ~= nil then
                                    l_v14_0("Walk", l_l_FirstChild_0_0.walkAnim);
                                else
                                    l_v14_0("Walk", l_Perona_0.Walk);
                                end;
                                v7.Walk.Priority = Enum.AnimationPriority.Idle;
                                if l_IsPlaying_2 == true then
                                    v7.Walk:Play();
                                end;
                                return;
                            end;
                        end;
                    end;
                    local l_l_Value_2_0 = l_Value_2 --[[ copy: 10 -> 18 ]];
                    local l_v20_0 = v20 --[[ copy: 13 -> 19 ]];
                    local function v25() --[[ Line: 96 ]] --[[ Name: updateIdle ]]
                        -- upvalues: l_Value_0 (copy), l_l_Value_2_0 (copy), v7 (copy), l_v14_0 (copy), l_Perona_0 (copy), l_l_FirstChild_0_0 (copy), l_v20_0 (copy)
                        local l_l_Value_0_FirstChild_0 = l_Value_0:FindFirstChild(l_l_Value_2_0 .. "Sword");
                        local l_IsPlaying_3 = v7.Idle.IsPlaying;
                        if l_l_Value_0_FirstChild_0 == nil then
                            l_v14_0("Idle", l_Perona_0.Idle);
                        else
                            l_v14_0("Idle", l_l_FirstChild_0_0.Idle);
                        end;
                        v7.Idle.Priority = Enum.AnimationPriority.Idle;
                        if l_IsPlaying_3 == true then
                            v7.Idle:Play();
                        end;
                        l_v20_0(l_l_Value_0_FirstChild_0);
                    end;
                    v25();
                    l_Value_0.ChildRemoved:Connect(v25);
                    l_Value_0.ChildAdded:Connect(v25);
                end;
            else
                v7.Run.Priority = Enum.AnimationPriority.Idle;
            end;
            v7.Walk.Priority = Enum.AnimationPriority.Idle;
            v7.Jump.Priority = Enum.AnimationPriority.Movement;
            v7.Fall.Priority = Enum.AnimationPriority.Movement;
            local function v27(v26) --[[ Line: 123 ]] --[[ Name: footstep ]]
                -- upvalues: l_Value_0 (copy)
                if v26:match("step") and v26 ~= "step" and _G.footstep and (l_Value_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.p).magnitude <= 150 then
                    _G.footstep(v26, nil, l_Value_0);
                end;
            end;
            v7.Walk.KeyframeReached:Connect(function(v28) --[[ Line: 128 ]]
                -- upvalues: v27 (copy)
                v27(v28);
            end);
            if v7.Run ~= nil then
                v7.Run.KeyframeReached:Connect(function(v29) --[[ Line: 132 ]]
                    -- upvalues: v27 (copy)
                    v27(v29);
                end);
            end;
            local v30 = {};
            local function _(v31) --[[ Line: 138 ]] --[[ Name: playAnim ]]
                -- upvalues: v30 (copy), v7 (copy)
                if v30[v31] == nil then
                    v30[v31] = 0;
                end;
                v7[v31]:Play();
                v7[v31].TimePosition = v30[v31];
            end;
            local function _(v33) --[[ Line: 146 ]] --[[ Name: stopAnim ]]
                -- upvalues: v7 (copy), v30 (copy)
                if v7[v33].IsPlaying == false then
                    return;
                else
                    v30[v33] = v7[v33].TimePosition;
                    v7[v33]:Stop();
                    return;
                end;
            end;
            local v35 = "Idle";
            local _ = function() --[[ Line: 155 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v7 (copy), v30 (copy)
                for v36, _ in v7 do
                    if v7[v36].IsPlaying ~= false then
                        v30[v36] = v7[v36].TimePosition;
                        v7[v36]:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v39) --[[ Line: 161 ]]
                -- upvalues: l_Value_1 (copy), v35 (ref), v7 (copy), v30 (copy), v8 (ref)
                if l_Value_1 + 5 < v39 then
                    if v35 ~= "Running" or v7.Run.IsPlaying == false then
                        v35 = "Running";
                        for v40, _ in v7 do
                            if v7[v40].IsPlaying ~= false then
                                v30[v40] = v7[v40].TimePosition;
                                v7[v40]:Stop();
                            end;
                        end;
                        if v30.Run == nil then
                            v30.Run = 0;
                        end;
                        v7.Run:Play();
                        v7.Run.TimePosition = v30.Run;
                        v7.Run:AdjustSpeed(v8);
                        return;
                    end;
                elseif v39 > 0.749 then
                    if v35 ~= "Walking" or v7.Walk.IsPlaying == false then
                        v35 = "Walking";
                        for v42, _ in v7 do
                            if v7[v42].IsPlaying ~= false then
                                v30[v42] = v7[v42].TimePosition;
                                v7[v42]:Stop();
                            end;
                        end;
                        if v30.Walk == nil then
                            v30.Walk = 0;
                        end;
                        v7.Walk:Play();
                        v7.Walk.TimePosition = v30.Walk;
                        return;
                    end;
                elseif v35 ~= "Idle" then
                    v35 = "Idle";
                    for v44, _ in v7 do
                        if v7[v44].IsPlaying ~= false then
                            v30[v44] = v7[v44].TimePosition;
                            v7[v44]:Stop();
                        end;
                    end;
                    v7.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 186 ]]
                -- upvalues: v35 (ref), v7 (copy), v30 (copy)
                if v35 ~= "Jump" then
                    v35 = "Jump";
                    for v46, _ in v7 do
                        if v7[v46].IsPlaying ~= false then
                            v30[v46] = v7[v46].TimePosition;
                            v7[v46]:Stop();
                        end;
                    end;
                    v7.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v48) --[[ Line: 193 ]]
                -- upvalues: v2 (copy), l_Value_0 (copy), v35 (ref), v7 (copy), v30 (copy)
                if v48 and v2.FloorMaterial == Enum.Material.Air and l_Value_0.PrimaryPart.Anchored == false and v35 ~= "Fall" then
                    v35 = "Fall";
                    for v49, _ in v7 do
                        if v7[v49].IsPlaying ~= false then
                            v30[v49] = v7[v49].TimePosition;
                            v7[v49]:Stop();
                        end;
                    end;
                    v7.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v51) --[[ Line: 202 ]]
                -- upvalues: v2 (copy), l_Value_0 (copy), v35 (ref), v7 (copy), v30 (copy)
                if v51 and v2.FloorMaterial == Enum.Material.Air and l_Value_0.PrimaryPart.Anchored == false and v35 ~= "Fall" then
                    v35 = "Fall";
                    for v52, _ in v7 do
                        if v7[v52].IsPlaying ~= false then
                            v30[v52] = v7[v52].TimePosition;
                            v7[v52]:Stop();
                        end;
                    end;
                    v7.Fall:Play();
                end;
            end);
            v2:GetPropertyChangedSignal("FloorMaterial"):Connect(function() --[[ Line: 212 ]]
                -- upvalues: v2 (copy), v35 (ref), v7 (copy), v30 (copy)
                if v2.FloorMaterial == Enum.Material.Air and v35 ~= "Fall" then
                    v35 = "Fall";
                    for v54, _ in v7 do
                        if v7[v54].IsPlaying ~= false then
                            v30[v54] = v7[v54].TimePosition;
                            v7[v54]:Stop();
                        end;
                    end;
                    v7.Fall:Play();
                    return;
                else
                    if v2.FloorMaterial ~= Enum.Material.Air and v35 == "Fall" then
                        v35 = "Idle";
                        for v56, _ in v7 do
                            if v7[v56].IsPlaying ~= false then
                                v30[v56] = v7[v56].TimePosition;
                                v7[v56]:Stop();
                            end;
                        end;
                        v7.Idle:Play();
                    end;
                    return;
                end;
            end);
            v2.GettingUp:Connect(function() --[[ Line: 224 ]]
                -- upvalues: v35 (ref), v7 (copy), v30 (copy)
                v35 = "Idle";
                for v58, _ in v7 do
                    if v7[v58].IsPlaying ~= false then
                        v30[v58] = v7[v58].TimePosition;
                        v7[v58]:Stop();
                    end;
                end;
                v7.Idle:Play();
            end);
            task.defer(function() --[[ Line: 230 ]]
                -- upvalues: v7 (copy)
                v7.Idle:Play();
            end);
            return;
        end;
    end;
end;