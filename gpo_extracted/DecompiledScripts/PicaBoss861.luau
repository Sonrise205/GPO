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
            local l_Pica_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Pica");
            local _ = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_Pica_0.Idle), 
                Walk = v3:LoadAnimation(l_Pica_0.Walk), 
                Run = v3:LoadAnimation(l_Pica_0.Walk), 
                Fall = v3:LoadAnimation(l_Pica_0.Fall), 
                Jump = v3:LoadAnimation(l_Pica_0.Jump)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            v6.Jump.Priority = Enum.AnimationPriority.Core;
            v6.Fall.Priority = Enum.AnimationPriority.Core;
            local v7 = {};
            local function _(v8) --[[ Line: 42 ]] --[[ Name: playAnim ]]
                -- upvalues: v7 (copy)
                if v8 and v8.IsPlaying == false then
                    v8:Play();
                    if v7[v8] then
                        v8.TimePosition = v7[v8];
                    end;
                end;
            end;
            local function v13(v10) --[[ Line: 51 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v7 (copy)
                for _, v12 in v6 do
                    if v12.IsPlaying == true and v12 ~= v10 then
                        v7[v12] = v12.TimePosition;
                        v12:Stop();
                    end;
                end;
            end;
            v6.Walk:GetMarkerReachedSignal("stomp"):Connect(function() --[[ Line: 60 ]]
                -- upvalues: l_Value_0 (copy), v2 (copy)
                if l_Value_0.PrimaryPart.Anchored == true or v2.WalkSpeed <= 0 then
                    return;
                else
                    _G.PlaySound(l_Value_0.PrimaryPart, script.Stomps:GetChildren()[math.random(1, 3)]);
                    return;
                end;
            end);
            v2:GetPropertyChangedSignal("WalkToPoint"):Connect(function() --[[ Line: 67 ]]
                -- upvalues: v2 (copy), v13 (copy), v6 (copy), v7 (copy)
                local l_v2_State_0 = v2:GetState();
                if l_v2_State_0 == Enum.HumanoidStateType.Running then
                    v13(v6.Walk);
                    local l_Walk_0 = v6.Walk;
                    if l_Walk_0 and l_Walk_0.IsPlaying == false then
                        l_Walk_0:Play();
                        if v7[l_Walk_0] then
                            l_Walk_0.TimePosition = v7[l_Walk_0];
                            return;
                        end;
                    end;
                elseif l_v2_State_0 == Enum.HumanoidStateType.None then
                    v13(v6.Idle);
                    local l_Idle_0 = v6.Idle;
                    if l_Idle_0 and l_Idle_0.IsPlaying == false then
                        l_Idle_0:Play();
                        if v7[l_Idle_0] then
                            l_Idle_0.TimePosition = v7[l_Idle_0];
                        end;
                    end;
                end;
            end);
            local v17 = l_Value_0:WaitForChild("Info", 3);
            if v17 then
                v17.Target.Changed:Connect(function() --[[ Line: 79 ]]
                    -- upvalues: v17 (copy), v13 (copy), v6 (copy), v7 (copy)
                    if v17.Target.Value == nil then
                        v13(v6.Idle);
                        local l_Idle_1 = v6.Idle;
                        if l_Idle_1 and l_Idle_1.IsPlaying == false then
                            l_Idle_1:Play();
                            if v7[l_Idle_1] then
                                l_Idle_1.TimePosition = v7[l_Idle_1];
                            end;
                        end;
                    end;
                end);
            end;
            v6.Idle:Play();
            return;
        end;
    end;
end;