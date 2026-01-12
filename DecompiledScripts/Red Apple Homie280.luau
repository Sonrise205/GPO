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
            local v4 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild(script.Name);
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(v4.Idle), 
                Walk = v3:LoadAnimation(v4.Walk), 
                Run = v3:LoadAnimation(v4.Walk)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Movement;
            v6.Run.Priority = Enum.AnimationPriority.Movement;
            local v7 = "Idle";
            local _ = function() --[[ Line: 40 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy)
                for _, v9 in v6 do
                    v9:Stop();
                end;
            end;
            v2.Running:Connect(function(v11) --[[ Line: 46 ]]
                -- upvalues: l_Value_1 (copy), v7 (ref), v6 (copy)
                if l_Value_1 + 5 < v11 then
                    if v7 ~= "Running" then
                        v7 = "Running";
                        for _, v13 in v6 do
                            v13:Stop();
                        end;
                        v6.Run:Play();
                        v6.Run:AdjustSpeed(1.5);
                        return;
                    end;
                elseif v11 > 0.749 then
                    if v7 ~= "Walking" then
                        v7 = "Walking";
                        for _, v15 in v6 do
                            v15:Stop();
                        end;
                        v6.Walk:Play();
                        return;
                    end;
                elseif v7 ~= "Idle" then
                    v7 = "Idle";
                    for _, v17 in v6 do
                        v17:Stop();
                    end;
                    v6.Idle:Play();
                end;
            end);
            v6.Idle:Play();
            local v18 = Random.new();
            while true do
                task.wait(v18:NextNumber(5, 15));
                if l_Value_0 and l_Value_0.PrimaryPart then
                    _G.PlaySound(l_Value_0.PrimaryPart, script.strawberrycakeSound1, {
                        RandomPitch = true
                    }).Parent = l_Value_0.PrimaryPart;
                end;
            end;
        end;
        return;
    end;
end;