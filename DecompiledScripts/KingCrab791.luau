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
            local l_KingCrab_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("KingCrab");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_KingCrab_0.Idle), 
                Walk = v3:LoadAnimation(l_KingCrab_0.Walk), 
                Run = v3:LoadAnimation(l_KingCrab_0.Walk), 
                Fall = v3:LoadAnimation(l_KingCrab_0.Fall), 
                Jump = v3:LoadAnimation(l_KingCrab_0.Jump)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Idle;
            v6.Run.Priority = Enum.AnimationPriority.Idle;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            v6.Run:GetMarkerReachedSignal("step1"):Connect(function() --[[ Line: 39 ]]
                -- upvalues: l_Value_0 (copy)
                local v7 = script.s1:Clone();
                v7.Parent = l_Value_0.PrimaryPart;
                v7:Play();
                _G.destroy(v7, 2);
            end);
            v6.Run:GetMarkerReachedSignal("step2"):Connect(function() --[[ Line: 46 ]]
                -- upvalues: l_Value_0 (copy)
                local v8 = script.s1:Clone();
                v8.Parent = l_Value_0.PrimaryPart;
                v8:Play();
                _G.destroy(v8, 2);
            end);
            local v9 = 1;
            local v10 = 0;
            v6.Run:GetMarkerReachedSignal("scream"):Connect(function() --[[ Line: 54 ]]
                -- upvalues: v10 (ref), v9 (ref), l_Value_0 (copy)
                if tick() - v10 < 2 then
                    return;
                else
                    v10 = tick();
                    v9 = v9 + 1;
                    if v9 > 4 then
                        v9 = 1;
                    end;
                    local v11 = script["v" .. v9]:Clone();
                    v11.Parent = l_Value_0.PrimaryPart;
                    v11:Play();
                    _G.destroy(v11, 3);
                    return;
                end;
            end);
            local v12 = "Idle";
            local _ = function() --[[ Line: 71 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy)
                for _, v14 in v6 do
                    v14:Stop();
                end;
            end;
            v2.Running:Connect(function(v16) --[[ Line: 76 ]]
                -- upvalues: l_Value_1 (copy), v12 (ref), v6 (copy)
                if l_Value_1 + 5 < v16 then
                    if v12 ~= "Running" then
                        v12 = "Running";
                        for _, v18 in v6 do
                            v18:Stop();
                        end;
                        v6.Run:Play();
                        v6.Run:AdjustSpeed(1.5);
                        return;
                    end;
                elseif v16 > 0.749 then
                    if v12 ~= "Walking" then
                        v12 = "Walking";
                        for _, v20 in v6 do
                            v20:Stop();
                        end;
                        v6.Walk:Play();
                        return;
                    end;
                elseif v12 ~= "Idle" then
                    v12 = "Idle";
                    for _, v22 in v6 do
                        v22:Stop();
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 98 ]]
                -- upvalues: v12 (ref), v6 (copy)
                if v12 ~= "Jump" then
                    v12 = "Jump";
                    for _, v24 in v6 do
                        v24:Stop();
                    end;
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v25) --[[ Line: 105 ]]
                -- upvalues: v2 (copy), v12 (ref), v6 (copy)
                if v25 and v2.FloorMaterial == Enum.Material.Air and v12 ~= "Fall" then
                    v12 = "Fall";
                    for _, v27 in v6 do
                        v27:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v28) --[[ Line: 114 ]]
                -- upvalues: v2 (copy), v12 (ref), v6 (copy)
                if v28 and v2.FloorMaterial == Enum.Material.Air and v12 ~= "Fall" then
                    v12 = "Fall";
                    for _, v30 in v6 do
                        v30:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            return;
        end;
    end;
end;