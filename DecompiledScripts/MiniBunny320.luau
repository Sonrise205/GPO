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
            local l_MiniBunny_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("MiniBunny");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_MiniBunny_0.Idle), 
                Walk = v3:LoadAnimation(l_MiniBunny_0.Walk), 
                Run = v3:LoadAnimation(l_MiniBunny_0.Run), 
                Fall = v3:LoadAnimation(l_MiniBunny_0.Fall), 
                Jump = v3:LoadAnimation(l_MiniBunny_0.Jump)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Movement;
            v6.Run.Priority = Enum.AnimationPriority.Movement;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Idle;
            v6.Run:GetMarkerReachedSignal("bounce"):Connect(function() --[[ Line: 40 ]]
                -- upvalues: l_Value_0 (copy)
                local v7 = script.bounce:Clone();
                v7.Parent = l_Value_0.PrimaryPart;
                v7:Play();
                _G.destroy(v7, 1);
            end);
            local v8 = "Idle";
            local _ = function() --[[ Line: 48 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy)
                for _, v10 in v6 do
                    v10:Stop();
                end;
            end;
            v2.Running:Connect(function(v12) --[[ Line: 54 ]]
                -- upvalues: l_Value_1 (copy), v8 (ref), v6 (copy)
                if l_Value_1 + 5 < v12 then
                    if v8 ~= "Running" then
                        v8 = "Running";
                        for _, v14 in v6 do
                            v14:Stop();
                        end;
                        v6.Run:Play();
                        return;
                    end;
                elseif v12 > 0.749 then
                    if v8 ~= "Walking" then
                        v8 = "Walking";
                        for _, v16 in v6 do
                            v16:Stop();
                        end;
                        v6.Walk:Play();
                        return;
                    end;
                elseif v8 ~= "Idle" then
                    v8 = "Idle";
                    for _, v18 in v6 do
                        v18:Stop();
                    end;
                    v6.Idle:Play();
                end;
            end);
            v2.Jumping:Connect(function() --[[ Line: 76 ]]
                -- upvalues: v8 (ref), v6 (copy), l_Value_0 (copy)
                if v8 ~= "Jump" then
                    v8 = "Jump";
                    for _, v20 in v6 do
                        v20:Stop();
                    end;
                    local v21 = script.bounce:Clone();
                    v21.Parent = l_Value_0.PrimaryPart;
                    v21:Play();
                    _G.destroy(v21, 1);
                    v6.Jump:Play();
                end;
            end);
            v2.FreeFalling:Connect(function(v22) --[[ Line: 87 ]]
                -- upvalues: v2 (copy), v8 (ref), v6 (copy)
                if v22 and v2.FloorMaterial == Enum.Material.Air and v8 ~= "Fall" then
                    v8 = "Fall";
                    for _, v24 in v6 do
                        v24:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v2.FallingDown:Connect(function(v25) --[[ Line: 96 ]]
                -- upvalues: v2 (copy), v8 (ref), v6 (copy)
                if v25 and v2.FloorMaterial == Enum.Material.Air and v8 ~= "Fall" then
                    v8 = "Fall";
                    for _, v27 in v6 do
                        v27:Stop();
                    end;
                    v6.Fall:Play();
                end;
            end);
            v6.Idle:Play();
            return;
        end;
    end;
end;