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
            local l_TrueBaal_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("TrueBaal");
            local _ = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(script.idle100), 
                Walk = v3:LoadAnimation(script.walk100), 
                Run = v3:LoadAnimation(script.walk100), 
                Fall = v3:LoadAnimation(l_TrueBaal_0.Fall), 
                Jump = v3:LoadAnimation(l_TrueBaal_0.Jump), 
                Land = v3:LoadAnimation(l_TrueBaal_0.Land)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Walk.Priority = Enum.AnimationPriority.Movement;
            v6.Run.Priority = Enum.AnimationPriority.Movement;
            v6.Jump.Priority = Enum.AnimationPriority.Movement;
            v6.Fall.Priority = Enum.AnimationPriority.Movement;
            v6.Land.Priority = Enum.AnimationPriority.Movement;
            local v7 = {};
            local function _(v8) --[[ Line: 45 ]] --[[ Name: playAnim ]]
                -- upvalues: v7 (copy), v6 (copy)
                if v7[v8] == nil then
                    v7[v8] = 0;
                end;
                v6[v8]:Play();
                v6[v8].TimePosition = v7[v8];
            end;
            local function _(v10) --[[ Line: 54 ]] --[[ Name: stopAnim ]]
                -- upvalues: v6 (copy), v7 (copy)
                if v6[v10].IsPlaying == false then
                    return;
                else
                    v7[v10] = v6[v10].TimePosition;
                    v6[v10]:Stop();
                    return;
                end;
            end;
            local v12 = "Idle";
            local _ = function() --[[ Line: 63 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v7 (copy)
                for v13, _ in v6 do
                    if v6[v13].IsPlaying ~= false then
                        v7[v13] = v6[v13].TimePosition;
                        v6[v13]:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v16) --[[ Line: 71 ]]
                -- upvalues: l_Value_0 (copy), v12 (ref), v6 (copy), v7 (copy)
                if v16 > 0.749 and l_Value_0.PrimaryPart.Anchored == false then
                    if v12 ~= "Running" then
                        v12 = "Running";
                        for v17, _ in v6 do
                            if v6[v17].IsPlaying ~= false then
                                v7[v17] = v6[v17].TimePosition;
                                v6[v17]:Stop();
                            end;
                        end;
                        if v7.Run == nil then
                            v7.Run = 0;
                        end;
                        v6.Run:Play();
                        v6.Run.TimePosition = v7.Run;
                        return;
                    end;
                elseif v12 ~= "Idle" then
                    v12 = "Idle";
                    for v19, _ in v6 do
                        if v6[v19].IsPlaying ~= false then
                            v7[v19] = v6[v19].TimePosition;
                            v6[v19]:Stop();
                        end;
                    end;
                    v6.Idle:Play();
                end;
            end);
            local v21 = {
                third = false, 
                half = false
            };
            v6.Idle:Play();
            task.spawn(function() --[[ Line: 128 ]]
                -- upvalues: l_Value_0 (copy)
                while true do
                    _G.PlaySound(l_Value_0.PrimaryPart, script.SFX:GetChildren()[math.random(1, #script.SFX:GetChildren())]).Parent = l_Value_0.PrimaryPart;
                    task.wait(math.random(10, 15));
                end;
            end);
            local v22 = "100";
            local _ = function(v23) --[[ Line: 136 ]] --[[ Name: resetOtherAdjusted ]]
                -- upvalues: v21 (copy)
                for v24, _ in pairs(v21) do
                    if v24 ~= v23 then
                        v21[v24] = false;
                    end;
                end;
            end;
            while true do
                local _ = v2.Health / v2.MaxHealth;
                local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("currentMode");
                if l_l_Value_0_Attribute_0 and v22 ~= l_l_Value_0_Attribute_0 then
                    if l_l_Value_0_Attribute_0 == "50" then
                        if v21.half == false then
                            v21.half = true;
                            local l_half_0 = v21.half;
                            for v30, _ in pairs(v21) do
                                if v30 ~= l_half_0 then
                                    v21[v30] = false;
                                end;
                            end;
                            l_half_0 = v3:LoadAnimation(script.idle50);
                            l_half_0:Play();
                            v6.Idle:Stop();
                            v6.Idle = l_half_0;
                            v6.Run:Stop();
                            v6.Run = v3:LoadAnimation(script.walk50);
                            if v12 == "Walk" or v12 == "Run" then
                                v6.Run:Play();
                            end;
                            v22 = l_l_Value_0_Attribute_0;
                        end;
                    elseif l_l_Value_0_Attribute_0 == "75" then
                        if v21.third == false then
                            v21.third = true;
                            local l_third_0 = v21.third;
                            for v33, _ in pairs(v21) do
                                if v33 ~= l_third_0 then
                                    v21[v33] = false;
                                end;
                            end;
                            l_third_0 = v3:LoadAnimation(script.idl75);
                            l_third_0:Play();
                            v6.Idle:Stop();
                            v6.Idle = l_third_0;
                            v6.Run:Stop();
                            v6.Run = v3:LoadAnimation(script.walk75);
                            if v12 == "Walk" or v12 == "Run" then
                                v6.Run:Play();
                            end;
                            v22 = l_l_Value_0_Attribute_0;
                        end;
                    elseif l_l_Value_0_Attribute_0 == "100" then
                        for v35, _ in pairs(v21) do
                            if v35 ~= nil then
                                v21[v35] = false;
                            end;
                        end;
                        local v37 = v3:LoadAnimation(script.idle100);
                        local v38 = v3:LoadAnimation(script.walk100);
                        local v39 = v3:LoadAnimation(script.walk100);
                        v6.Idle:Stop();
                        v6.Idle = v37;
                        v6.Run:Stop();
                        v6.Run = v39;
                        v6.Walk:Stop();
                        v6.Walk = v38;
                        v22 = l_l_Value_0_Attribute_0;
                    end;
                end;
                v6.Walk.Priority = Enum.AnimationPriority.Movement;
                v6.Run.Priority = Enum.AnimationPriority.Movement;
                task.wait(0.1);
            end;
        end;
        return;
    end;
end;