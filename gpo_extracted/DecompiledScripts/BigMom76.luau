local v0 = false;
local v1 = false;
local l_Value_0 = script:WaitForChild("Character").Value;
if not l_Value_0 then
    script:Destroy();
    return;
else
    local l_workspace_0 = workspace;
    local v4 = l_Value_0:WaitForChild("Humanoid", 5);
    if v4:IsA("Humanoid") == false then
        script:Destroy();
        return;
    elseif not v4 or v4.Health <= 0 then
        script:Destroy();
        return;
    else
        local v5 = v4:WaitForChild("Animator", 3) or v4;
        if v4.Parent and v4:IsDescendantOf(l_workspace_0) and v5.Parent and v5:IsDescendantOf(l_workspace_0) then
            local l_Human_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Human");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v8 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
            local v9 = {
                Idle = v5:LoadAnimation(l_Human_0.Idle), 
                Walk = v5:LoadAnimation(l_Human_0.Walk), 
                Run = v5:LoadAnimation(l_Human_0.Run), 
                Fall = v5:LoadAnimation(l_Human_0.Fall), 
                Jump = v5:LoadAnimation(l_Human_0.Jump)
            };
            local v10 = 2;
            if l_Value_0.Info:FindFirstChild("Weapon") then
                local l_Value_2 = l_Value_0.Info:FindFirstChild("Weapon").Value;
                local l_FirstChild_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2);
                if l_FirstChild_0 and l_FirstChild_0:FindFirstChild("runAnim") then
                    v10 = v8[l_Value_2].runSpeed or 2;
                    v0 = true;
                end;
                if not v0 then
                    v9.Run.Priority = Enum.AnimationPriority.Idle;
                end;
                v0 = false;
                if l_FirstChild_0 then
                    local function v16(v13, v14) --[[ Line: 47 ]] --[[ Name: updateAnimation ]]
                        -- upvalues: v9 (copy), v5 (copy)
                        if v9[v13] and v9[v13].Animation.AnimationId ~= v14.AnimationId then
                            local l_IsPlaying_0 = v9[v13].IsPlaying;
                            v9[v13]:Stop();
                            v9[v13]:Destroy();
                            v9[v13] = v5:LoadAnimation(v14);
                            if l_IsPlaying_0 then
                                v9[v13]:Play();
                            end;
                        end;
                    end;
                    local l_l_FirstChild_0_0 = l_FirstChild_0 --[[ copy: 11 -> 16 ]];
                    local l_v16_0 = v16 --[[ copy: 12 -> 17 ]];
                    local function v22(v19) --[[ Line: 59 ]] --[[ Name: updateRunning ]]
                        -- upvalues: l_l_FirstChild_0_0 (copy), v9 (copy), l_v16_0 (copy), l_Human_0 (copy)
                        if l_l_FirstChild_0_0:FindFirstChild("runAnim") == nil then
                            return;
                        else
                            local l_IsPlaying_1 = v9.Run.IsPlaying;
                            if v19 ~= nil then
                                l_v16_0("Run", l_l_FirstChild_0_0:FindFirstChild("runAnim"));
                                v9.Run.Priority = Enum.AnimationPriority.Movement;
                            else
                                l_v16_0("Run", l_Human_0.Run);
                            end;
                            if l_IsPlaying_1 == true then
                                v9.Run:Play();
                            end;
                            if l_l_FirstChild_0_0:FindFirstChild("walkAnim") == nil then
                                return;
                            else
                                local l_IsPlaying_2 = v9.Walk.IsPlaying;
                                if v19 ~= nil then
                                    l_v16_0("Walk", l_l_FirstChild_0_0.walkAnim);
                                else
                                    l_v16_0("Walk", l_Human_0.Walk);
                                end;
                                v9.Walk.Priority = Enum.AnimationPriority.Idle;
                                if l_IsPlaying_2 == true then
                                    v9.Walk:Play();
                                end;
                                return;
                            end;
                        end;
                    end;
                    local l_l_Value_2_0 = l_Value_2 --[[ copy: 10 -> 18 ]];
                    local l_v22_0 = v22 --[[ copy: 13 -> 19 ]];
                    local function v27() --[[ Line: 94 ]] --[[ Name: updateIdle ]]
                        -- upvalues: l_Value_0 (copy), l_l_Value_2_0 (copy), v9 (copy), l_v16_0 (copy), l_Human_0 (copy), l_l_FirstChild_0_0 (copy), l_v22_0 (copy)
                        local l_l_Value_0_FirstChild_0 = l_Value_0:FindFirstChild(l_l_Value_2_0 .. "Sword");
                        local l_IsPlaying_3 = v9.Idle.IsPlaying;
                        if l_l_Value_0_FirstChild_0 == nil then
                            l_v16_0("Idle", l_Human_0.Idle);
                        else
                            l_v16_0("Idle", l_l_FirstChild_0_0.Idle);
                        end;
                        v9.Idle.Priority = Enum.AnimationPriority.Idle;
                        if l_IsPlaying_3 == true then
                            v9.Idle:Play();
                        end;
                        l_v22_0(l_l_Value_0_FirstChild_0);
                    end;
                    v27();
                    l_Value_0.ChildRemoved:Connect(v27);
                    l_Value_0.ChildAdded:Connect(v27);
                    v1 = true;
                else
                    v1 = true;
                end;
            end;
            if not v1 then
                if not v1 then
                    v9.Run.Priority = Enum.AnimationPriority.Idle;
                end;
            end;
            v1 = false;
            v9.Walk.Priority = Enum.AnimationPriority.Idle;
            v9.Jump.Priority = Enum.AnimationPriority.Movement;
            v9.Fall.Priority = Enum.AnimationPriority.Movement;
            local function v29(v28) --[[ Line: 121 ]] --[[ Name: footstep ]]
                -- upvalues: l_Value_0 (copy)
                if v28:match("step") and v28 ~= "step" and _G.footstep and (l_Value_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.p).magnitude <= 150 then
                    _G.footstep(v28, nil, l_Value_0);
                end;
            end;
            v9.Walk.KeyframeReached:Connect(function(v30) --[[ Line: 126 ]]
                -- upvalues: v29 (copy)
                v29(v30);
            end);
            if v9.Run ~= nil then
                v9.Run.KeyframeReached:Connect(function(v31) --[[ Line: 131 ]]
                    -- upvalues: v29 (copy)
                    v29(v31);
                end);
            end;
            local v32 = {};
            local function _(v33) --[[ Line: 138 ]] --[[ Name: playAnim ]]
                -- upvalues: v32 (copy), v9 (copy)
                if v32[v33] == nil then
                    v32[v33] = 0;
                end;
                v9[v33]:Play();
                v9[v33].TimePosition = v32[v33];
            end;
            local function _(v35) --[[ Line: 146 ]] --[[ Name: stopAnim ]]
                -- upvalues: v9 (copy), v32 (copy)
                if v9[v35].IsPlaying == false then
                    return;
                else
                    v32[v35] = v9[v35].TimePosition;
                    v9[v35]:Stop();
                    return;
                end;
            end;
            local v37 = "Idle";
            local _ = function() --[[ Line: 155 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v9 (copy), v32 (copy)
                for v38, _ in v9 do
                    if v9[v38].IsPlaying ~= false then
                        v32[v38] = v9[v38].TimePosition;
                        v9[v38]:Stop();
                    end;
                end;
            end;
            v4.Running:Connect(function(v41) --[[ Line: 161 ]]
                -- upvalues: l_Value_1 (copy), v37 (ref), v9 (copy), v32 (copy), v10 (ref)
                if l_Value_1 + 5 < v41 then
                    if v37 ~= "Running" or v9.Run.IsPlaying == false then
                        v37 = "Running";
                        for v42, _ in v9 do
                            if v9[v42].IsPlaying ~= false then
                                v32[v42] = v9[v42].TimePosition;
                                v9[v42]:Stop();
                            end;
                        end;
                        if v32.Run == nil then
                            v32.Run = 0;
                        end;
                        v9.Run:Play();
                        v9.Run.TimePosition = v32.Run;
                        v9.Run:AdjustSpeed(v10);
                        return;
                    end;
                elseif v41 > 0.749 then
                    if v37 ~= "Walking" or v9.Walk.IsPlaying == false then
                        v37 = "Walking";
                        for v44, _ in v9 do
                            if v9[v44].IsPlaying ~= false then
                                v32[v44] = v9[v44].TimePosition;
                                v9[v44]:Stop();
                            end;
                        end;
                        if v32.Walk == nil then
                            v32.Walk = 0;
                        end;
                        v9.Walk:Play();
                        v9.Walk.TimePosition = v32.Walk;
                        return;
                    end;
                elseif v37 ~= "Idle" then
                    v37 = "Idle";
                    for v46, _ in v9 do
                        if v9[v46].IsPlaying ~= false then
                            v32[v46] = v9[v46].TimePosition;
                            v9[v46]:Stop();
                        end;
                    end;
                    v9.Idle:Play();
                end;
            end);
            v4.Jumping:Connect(function() --[[ Line: 186 ]]
                -- upvalues: v37 (ref), v9 (copy), v32 (copy)
                if v37 ~= "Jump" then
                    v37 = "Jump";
                    for v48, _ in v9 do
                        if v9[v48].IsPlaying ~= false then
                            v32[v48] = v9[v48].TimePosition;
                            v9[v48]:Stop();
                        end;
                    end;
                    v9.Jump:Play();
                end;
            end);
            v4.FreeFalling:Connect(function(v50) --[[ Line: 193 ]]
                -- upvalues: v4 (copy), l_Value_0 (copy), v37 (ref), v9 (copy), v32 (copy)
                if v50 and v4.FloorMaterial == Enum.Material.Air and l_Value_0.PrimaryPart.Anchored == false and v37 ~= "Fall" then
                    v37 = "Fall";
                    for v51, _ in v9 do
                        if v9[v51].IsPlaying ~= false then
                            v32[v51] = v9[v51].TimePosition;
                            v9[v51]:Stop();
                        end;
                    end;
                    v9.Fall:Play();
                end;
            end);
            v4.FallingDown:Connect(function(v53) --[[ Line: 202 ]]
                -- upvalues: v4 (copy), l_Value_0 (copy), v37 (ref), v9 (copy), v32 (copy)
                if v53 and v4.FloorMaterial == Enum.Material.Air and l_Value_0.PrimaryPart.Anchored == false and v37 ~= "Fall" then
                    v37 = "Fall";
                    for v54, _ in v9 do
                        if v9[v54].IsPlaying ~= false then
                            v32[v54] = v9[v54].TimePosition;
                            v9[v54]:Stop();
                        end;
                    end;
                    v9.Fall:Play();
                end;
            end);
            v4:GetPropertyChangedSignal("FloorMaterial"):Connect(function() --[[ Line: 211 ]]
                -- upvalues: v4 (copy), v37 (ref), v9 (copy), v32 (copy)
                if v4.FloorMaterial == Enum.Material.Air and v37 ~= "Fall" then
                    v37 = "Fall";
                    for v56, _ in v9 do
                        if v9[v56].IsPlaying ~= false then
                            v32[v56] = v9[v56].TimePosition;
                            v9[v56]:Stop();
                        end;
                    end;
                    v9.Fall:Play();
                    return;
                else
                    if v4.FloorMaterial ~= Enum.Material.Air and v37 == "Fall" then
                        v37 = "Idle";
                        for v58, _ in v9 do
                            if v9[v58].IsPlaying ~= false then
                                v32[v58] = v9[v58].TimePosition;
                                v9[v58]:Stop();
                            end;
                        end;
                        v9.Idle:Play();
                    end;
                    return;
                end;
            end);
            v4.GettingUp:Connect(function() --[[ Line: 223 ]]
                -- upvalues: v37 (ref), v9 (copy), v32 (copy)
                v37 = "Idle";
                for v60, _ in v9 do
                    if v9[v60].IsPlaying ~= false then
                        v32[v60] = v9[v60].TimePosition;
                        v9[v60]:Stop();
                    end;
                end;
                v9.Idle:Play();
            end);
            task.defer(function() --[[ Line: 229 ]]
                -- upvalues: v9 (copy)
                v9.Idle:Play();
            end);
            while true do
                task.wait(math.random(8, 15));
                _G.PlaySound(l_Value_0.Head, script.SFX, {
                    RandomSound = true
                }).Parent = l_Value_0.Head;
            end;
        end;
        return;
    end;
end;