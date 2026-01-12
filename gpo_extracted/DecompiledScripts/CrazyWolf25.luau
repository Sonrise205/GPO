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
            local l_CrazyWolf_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("CrazyWolf");
            local _ = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_CrazyWolf_0.Idle), 
                Run = v3:LoadAnimation(l_CrazyWolf_0.Run)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            local v7 = {};
            local function _(v8) --[[ Line: 33 ]] --[[ Name: playAnim ]]
                -- upvalues: v7 (copy), v6 (copy)
                if v7[v8] == nil then
                    v7[v8] = 0;
                end;
                v6[v8]:Play();
                v6[v8].TimePosition = v7[v8];
            end;
            local function _(v10) --[[ Line: 41 ]] --[[ Name: stopAnim ]]
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
            local _ = function() --[[ Line: 50 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v7 (copy)
                for v13, _ in v6 do
                    if v6[v13].IsPlaying ~= false then
                        v7[v13] = v6[v13].TimePosition;
                        v6[v13]:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v16) --[[ Line: 56 ]]
                -- upvalues: v12 (ref), v6 (copy), v7 (copy)
                if v16 > 0.1 then
                    if v12 ~= "Running" or v6.Run.IsPlaying == false then
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
                        v6.Run:AdjustSpeed(1.25);
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
            v6.Idle:Play();
            return;
        end;
    end;
end;