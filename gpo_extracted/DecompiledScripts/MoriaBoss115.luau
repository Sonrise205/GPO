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
            local l_MoriaBoss_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("MoriaBoss");
            local l_Value_1 = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_MoriaBoss_0.Idle), 
                Walk = v3:LoadAnimation(l_MoriaBoss_0.Walk), 
                Run = v3:LoadAnimation(l_MoriaBoss_0.Walk), 
                Fall = v3:LoadAnimation(l_MoriaBoss_0.Fall), 
                Jump = v3:LoadAnimation(l_MoriaBoss_0.Jump)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Idle;
            v6.Run.Priority = Enum.AnimationPriority.Idle;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            local v7 = "Idle";
            local _ = function() --[[ Line: 41 ]] --[[ Name: CancelAnims ]]
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
            if l_Value_0:FindFirstChild("Overhead") == nil then
                local v18 = script.Overhead:Clone();
                v18.Adornee = l_Value_0.Head;
                v18.Health.Frame.Script.char.Value = l_Value_0;
                v18.Parent = game.Players.LocalPlayer.PlayerGui.HealthBars;
                v18.Health.Frame.Script.Disabled = false;
                if l_Value_0.Name ~= "Moria" then
                    v18.NameT.Text = "Moria's Sillhouette";
                end;
            end;
            v6.Run:GetMarkerReachedSignal("step1"):Connect(function(_) --[[ Line: 82 ]]
                -- upvalues: l_Value_0 (copy)
                _G.PlaySound(l_Value_0.PrimaryPart, script.MoriaStep1);
            end);
            v6.Run:GetMarkerReachedSignal("step2"):Connect(function(_) --[[ Line: 86 ]]
                -- upvalues: l_Value_0 (copy)
                _G.PlaySound(l_Value_0.PrimaryPart, script.MoriaStep2);
            end);
            while true do
                task.wait(math.random(10, 20));
                _G.PlaySound(l_Value_0.Head, script["MoriaLaugh" .. math.random(1, 5)]).Parent = l_Value_0.PrimaryPart;
            end;
        end;
        return;
    end;
end;