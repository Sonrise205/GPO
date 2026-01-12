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
                local l_Weapon_0 = l_Value_0.Info:FindFirstChild("Weapon");
                local l_Value_2 = l_Value_0.Info:FindFirstChild("Weapon").Value;
                local l_FirstChild_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Value_2);
                if l_FirstChild_0 and l_FirstChild_0:FindFirstChild("runAnim") then
                    v10 = v8[l_Value_2].runSpeed or 2;
                    v1 = true;
                end;
                if not v1 then
                    v9.Run.Priority = Enum.AnimationPriority.Idle;
                end;
                v1 = false;
                if true then
                    local l_l_Value_2_0, l_l_FirstChild_0_0 = l_Value_2, l_FirstChild_0;
                    if l_l_FirstChild_0_0 then
                        local function v19(v16, v17) --[[ Line: 48 ]] --[[ Name: updateAnimation ]]
                            -- upvalues: v9 (copy), v5 (copy)
                            if v9[v16] and v9[v16].Animation.AnimationId ~= v17.AnimationId then
                                local l_IsPlaying_0 = v9[v16].IsPlaying;
                                v9[v16]:Stop();
                                v9[v16]:Destroy();
                                v9[v16] = v5:LoadAnimation(v17);
                                if l_IsPlaying_0 then
                                    v9[v16]:Play();
                                end;
                            end;
                        end;
                        local l_v19_0 = v19 --[[ copy: 13 -> 17 ]];
                        local function v24(v21) --[[ Line: 60 ]] --[[ Name: updateRunning ]]
                            -- upvalues: l_l_FirstChild_0_0 (ref), v9 (copy), l_v19_0 (copy), l_Human_0 (copy)
                            if l_l_FirstChild_0_0:FindFirstChild("runAnim") == nil then
                                return;
                            else
                                local l_IsPlaying_1 = v9.Run.IsPlaying;
                                if v21 ~= nil then
                                    l_v19_0("Run", l_l_FirstChild_0_0:FindFirstChild("runAnim"));
                                    v9.Run.Priority = Enum.AnimationPriority.Movement;
                                else
                                    l_v19_0("Run", l_Human_0.Run);
                                end;
                                if l_IsPlaying_1 == true then
                                    v9.Run:Play();
                                end;
                                if l_l_FirstChild_0_0:FindFirstChild("walkAnim") == nil then
                                    return;
                                else
                                    local l_IsPlaying_2 = v9.Walk.IsPlaying;
                                    if v21 ~= nil then
                                        l_v19_0("Walk", l_l_FirstChild_0_0.walkAnim);
                                    else
                                        l_v19_0("Walk", l_Human_0.Walk);
                                    end;
                                    v9.Walk.Priority = Enum.AnimationPriority.Idle;
                                    if l_IsPlaying_2 == true then
                                        v9.Walk:Play();
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        local l_v24_0 = v24 --[[ copy: 14 -> 18 ]];
                        local function v28() --[[ Line: 95 ]] --[[ Name: updateIdle ]]
                            -- upvalues: l_Value_0 (copy), l_l_Value_2_0 (ref), v9 (copy), l_v19_0 (copy), l_Human_0 (copy), l_l_FirstChild_0_0 (ref), l_v24_0 (copy)
                            local l_l_Value_0_FirstChild_0 = l_Value_0:FindFirstChild(l_l_Value_2_0 .. "Sword");
                            local l_IsPlaying_3 = v9.Idle.IsPlaying;
                            if l_l_Value_0_FirstChild_0 == nil then
                                l_v19_0("Idle", l_Human_0.Idle);
                            else
                                l_v19_0("Idle", l_l_FirstChild_0_0.Idle);
                            end;
                            v9.Idle.Priority = Enum.AnimationPriority.Idle;
                            if l_IsPlaying_3 == true then
                                v9.Idle:Play();
                            end;
                            l_v24_0(l_l_Value_0_FirstChild_0);
                        end;
                        v28();
                        l_Value_0.ChildRemoved:Connect(v28);
                        l_Value_0.ChildAdded:Connect(v28);
                    end;
                    if l_Weapon_0 then
                        local l_l_Weapon_0_0 = l_Weapon_0 --[[ copy: 10 -> 16 ]];
                        l_Weapon_0.Changed:Connect(function() --[[ Line: 116 ]]
                            -- upvalues: l_l_Value_2_0 (ref), l_l_Weapon_0_0 (copy), l_l_FirstChild_0_0 (ref)
                            if l_l_Value_2_0 ~= l_l_Weapon_0_0.Value then
                                l_l_Value_2_0 = l_l_Weapon_0_0.Value;
                                l_l_FirstChild_0_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_l_Value_2_0);
                            end;
                        end);
                    end;
                end;
                v0 = true;
            end;
            if not v0 then
                v9.Run.Priority = Enum.AnimationPriority.Idle;
            end;
            v0 = false;
            v9.Walk.Priority = Enum.AnimationPriority.Idle;
            v9.Jump.Priority = Enum.AnimationPriority.Movement;
            v9.Fall.Priority = Enum.AnimationPriority.Movement;
            local function v31(v30) --[[ Line: 130 ]] --[[ Name: footstep ]]
                -- upvalues: l_Value_0 (copy)
                if v30:match("step") and v30 ~= "step" and _G.footstep and (l_Value_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.p).magnitude <= 150 then
                    _G.footstep(v30, nil, l_Value_0);
                end;
            end;
            v9.Walk.KeyframeReached:Connect(function(v32) --[[ Line: 135 ]]
                -- upvalues: v31 (copy)
                v31(v32);
            end);
            if v9.Run ~= nil then
                v9.Run.KeyframeReached:Connect(function(v33) --[[ Line: 139 ]]
                    -- upvalues: v31 (copy)
                    v31(v33);
                end);
            end;
            local v34 = {};
            local function _(v35) --[[ Line: 145 ]] --[[ Name: playAnim ]]
                -- upvalues: v34 (copy), v9 (copy)
                if v34[v35] == nil then
                    v34[v35] = 0;
                end;
                v9[v35]:Play();
                v9[v35].TimePosition = v34[v35];
            end;
            local function _(v37) --[[ Line: 153 ]] --[[ Name: stopAnim ]]
                -- upvalues: v9 (copy), v34 (copy)
                if v9[v37].IsPlaying == false then
                    return;
                else
                    v34[v37] = v9[v37].TimePosition;
                    v9[v37]:Stop();
                    return;
                end;
            end;
            local v39 = "Idle";
            local _ = function() --[[ Line: 162 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v9 (copy), v34 (copy)
                for v40, _ in v9 do
                    if v9[v40].IsPlaying ~= false then
                        v34[v40] = v9[v40].TimePosition;
                        v9[v40]:Stop();
                    end;
                end;
            end;
            v4.Running:Connect(function(v43) --[[ Line: 168 ]]
                -- upvalues: l_Value_1 (copy), v39 (ref), v9 (copy), v34 (copy), v10 (ref)
                if l_Value_1 < v43 then
                    if v39 ~= "Running" or v9.Run.IsPlaying == false then
                        v39 = "Running";
                        for v44, _ in v9 do
                            if v9[v44].IsPlaying ~= false then
                                v34[v44] = v9[v44].TimePosition;
                                v9[v44]:Stop();
                            end;
                        end;
                        if v34.Run == nil then
                            v34.Run = 0;
                        end;
                        v9.Run:Play();
                        v9.Run.TimePosition = v34.Run;
                        v9.Run:AdjustSpeed(v10);
                        return;
                    end;
                elseif v43 > 0.749 then
                    if v39 ~= "Walking" or v9.Walk.IsPlaying == false then
                        v39 = "Walking";
                        for v46, _ in v9 do
                            if v9[v46].IsPlaying ~= false then
                                v34[v46] = v9[v46].TimePosition;
                                v9[v46]:Stop();
                            end;
                        end;
                        if v34.Walk == nil then
                            v34.Walk = 0;
                        end;
                        v9.Walk:Play();
                        v9.Walk.TimePosition = v34.Walk;
                        return;
                    end;
                elseif v39 ~= "Idle" then
                    v39 = "Idle";
                    for v48, _ in v9 do
                        if v9[v48].IsPlaying ~= false then
                            v34[v48] = v9[v48].TimePosition;
                            v9[v48]:Stop();
                        end;
                    end;
                    v9.Idle:Play();
                end;
            end);
            v4.Jumping:Connect(function() --[[ Line: 193 ]]
                -- upvalues: v39 (ref), v9 (copy), v34 (copy)
                if v39 ~= "Jump" then
                    v39 = "Jump";
                    for v50, _ in v9 do
                        if v9[v50].IsPlaying ~= false then
                            v34[v50] = v9[v50].TimePosition;
                            v9[v50]:Stop();
                        end;
                    end;
                    v9.Jump:Play();
                end;
            end);
            v4.FreeFalling:Connect(function(v52) --[[ Line: 200 ]]
                -- upvalues: v4 (copy), l_Value_0 (copy), v39 (ref), v9 (copy), v34 (copy)
                if v52 and v4.FloorMaterial == Enum.Material.Air and l_Value_0.PrimaryPart.Anchored == false and v39 ~= "Fall" then
                    v39 = "Fall";
                    for v53, _ in v9 do
                        if v9[v53].IsPlaying ~= false then
                            v34[v53] = v9[v53].TimePosition;
                            v9[v53]:Stop();
                        end;
                    end;
                    v9.Fall:Play();
                end;
            end);
            v4.FallingDown:Connect(function(v55) --[[ Line: 209 ]]
                -- upvalues: v4 (copy), l_Value_0 (copy), v39 (ref), v9 (copy), v34 (copy)
                if v55 and v4.FloorMaterial == Enum.Material.Air and l_Value_0.PrimaryPart.Anchored == false and v39 ~= "Fall" then
                    v39 = "Fall";
                    for v56, _ in v9 do
                        if v9[v56].IsPlaying ~= false then
                            v34[v56] = v9[v56].TimePosition;
                            v9[v56]:Stop();
                        end;
                    end;
                    v9.Fall:Play();
                end;
            end);
            v4:GetPropertyChangedSignal("FloorMaterial"):Connect(function() --[[ Line: 218 ]]
                -- upvalues: v4 (copy), v39 (ref), v9 (copy), v34 (copy)
                if v4.FloorMaterial == Enum.Material.Air and v39 ~= "Fall" then
                    v39 = "Fall";
                    for v58, _ in v9 do
                        if v9[v58].IsPlaying ~= false then
                            v34[v58] = v9[v58].TimePosition;
                            v9[v58]:Stop();
                        end;
                    end;
                    v9.Fall:Play();
                    return;
                else
                    if v4.FloorMaterial ~= Enum.Material.Air and v39 == "Fall" then
                        v39 = "Idle";
                        for v60, _ in v9 do
                            if v9[v60].IsPlaying ~= false then
                                v34[v60] = v9[v60].TimePosition;
                                v9[v60]:Stop();
                            end;
                        end;
                        v9.Idle:Play();
                    end;
                    return;
                end;
            end);
            v4.GettingUp:Connect(function() --[[ Line: 230 ]]
                -- upvalues: v39 (ref), v9 (copy), v34 (copy)
                v39 = "Idle";
                for v62, _ in v9 do
                    if v9[v62].IsPlaying ~= false then
                        v34[v62] = v9[v62].TimePosition;
                        v9[v62]:Stop();
                    end;
                end;
                v9.Idle:Play();
            end);
            task.defer(function() --[[ Line: 236 ]]
                -- upvalues: v9 (copy)
                v9.Idle:Play();
            end);
            while true do
                task.wait(math.random(8, 15));
                _G.PlaySound(l_Value_0.Head, script["Audio/CupidLaugh" .. math.random(1, 7)]).Parent = l_Value_0.Head;
            end;
        end;
        return;
    end;
end;