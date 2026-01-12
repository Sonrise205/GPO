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
            local l_CrabMinion_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("CrabMinion");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_CrabMinion_0.Idle), 
                Walk = v3:LoadAnimation(l_CrabMinion_0.Walk), 
                Run = v3:LoadAnimation(l_CrabMinion_0.Walk), 
                Fall = v3:LoadAnimation(l_CrabMinion_0.Fall), 
                Jump = v3:LoadAnimation(l_CrabMinion_0.Jump)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Movement;
            v6.Run.Priority = Enum.AnimationPriority.Movement;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            local l_walkLooped_0 = l_Value_0.HumanoidRootPart:FindFirstChild("walkLooped");
            if l_walkLooped_0 == nil then
                l_walkLooped_0 = script.walkLooped:Clone();
                l_walkLooped_0.Parent = l_Value_0.HumanoidRootPart;
            end;
            l_walkLooped_0.Volume = 0;
            l_walkLooped_0:Play();
            local v8 = 1;
            local v9 = 0;
            v6.Run:GetMarkerReachedSignal("scream"):Connect(function() --[[ Line: 48 ]]
                -- upvalues: v9 (ref), v8 (ref), l_Value_0 (copy)
                if tick() - v9 < 2 then
                    return;
                else
                    v9 = tick();
                    v8 = v8 + 1;
                    if v8 > 2 then
                        v8 = 1;
                    end;
                    local v10 = script["v" .. v8]:Clone();
                    v10.Parent = l_Value_0.PrimaryPart;
                    v10:Play();
                    _G.destroy(v10, 3);
                    return;
                end;
            end);
            local v11 = "Idle";
            local _ = function() --[[ Line: 65 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy)
                for _, v13 in v6 do
                    v13:Stop();
                end;
            end;
            v2.Running:Connect(function(v15) --[[ Line: 70 ]]
                -- upvalues: l_walkLooped_0 (ref), l_Value_1 (copy), v11 (ref), v6 (copy)
                if v15 > 5 then
                    l_walkLooped_0.Volume = 0.5;
                else
                    l_walkLooped_0.Volume = 0;
                end;
                if l_Value_1 + 5 < v15 then
                    if v11 ~= "Running" then
                        v11 = "Running";
                        for _, v17 in v6 do
                            v17:Stop();
                        end;
                        v6.Run:Play();
                        v6.Run:AdjustSpeed(1.5);
                        return;
                    end;
                elseif v15 > 0.749 then
                    if v11 ~= "Walking" then
                        v11 = "Walking";
                        for _, v19 in v6 do
                            v19:Stop();
                        end;
                        v6.Walk:Play();
                        return;
                    end;
                elseif v11 ~= "Idle" then
                    v11 = "Idle";
                    for _, v21 in v6 do
                        v21:Stop();
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 97 ]]
                -- upvalues: v11 (ref), v6 (copy)
                if v11 ~= "Jump" then
                    v11 = "Jump";
                    for _, v23 in v6 do
                        v23:Stop();
                    end;
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v24) --[[ Line: 104 ]]
                -- upvalues: v2 (copy), v11 (ref), v6 (copy)
                if v24 and v2.FloorMaterial == Enum.Material.Air and v11 ~= "Fall" then
                    v11 = "Fall";
                    for _, v26 in v6 do
                        v26:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v27) --[[ Line: 113 ]]
                -- upvalues: v2 (copy), v11 (ref), v6 (copy)
                if v27 and v2.FloorMaterial == Enum.Material.Air and v11 ~= "Fall" then
                    v11 = "Fall";
                    for _, v29 in v6 do
                        v29:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            return;
        end;
    end;
end;