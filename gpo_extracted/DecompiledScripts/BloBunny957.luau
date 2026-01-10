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
            local l_Blo_0 = game:GetService("ReplicatedStorage"):WaitForChild("NPCAnimations"):WaitForChild("Blo");
            local _ = script:WaitForChild("Walkspeed").Value;
            local v6 = {
                Idle = v3:LoadAnimation(l_Blo_0.Idle), 
                Walk = v3:LoadAnimation(l_Blo_0.Walk), 
                Run = v3:LoadAnimation(l_Blo_0.Walk)
            };
            v6.Idle.Priority = Enum.AnimationPriority.Idle;
            local v7 = l_Value_0:WaitForChild("Info", 3);
            local v8 = 0;
            local function _(v9) --[[ Line: 34 ]] --[[ Name: hookJump ]]
                -- upvalues: v8 (ref), v7 (copy), l_Value_0 (copy)
                v9:GetMarkerReachedSignal("Jump"):Connect(function() --[[ Line: 35 ]]
                    -- upvalues: v8 (ref), v7 (ref), l_Value_0 (ref)
                    v8 = v8 + 1;
                    if v8 > 3 then
                        v8 = 1;
                    end;
                    if v7 and v7.Target.Value ~= nil then
                        _G.PlaySound(l_Value_0.PrimaryPart, script["EasterBunnyAgroJump" .. v8]).Parent = l_Value_0.PrimaryPart;
                        return;
                    else
                        _G.PlaySound(l_Value_0.PrimaryPart, script["EasterBunnyIdleJump" .. v8]).Parent = l_Value_0.PrimaryPart;
                        return;
                    end;
                end);
            end;
            for _, v12 in pairs(v6) do
                v12.Priority = Enum.AnimationPriority.Action3;
                v12:GetMarkerReachedSignal("Jump"):Connect(function() --[[ Line: 35 ]]
                    -- upvalues: v8 (ref), v7 (copy), l_Value_0 (copy)
                    v8 = v8 + 1;
                    if v8 > 3 then
                        v8 = 1;
                    end;
                    if v7 and v7.Target.Value ~= nil then
                        _G.PlaySound(l_Value_0.PrimaryPart, script["EasterBunnyAgroJump" .. v8]).Parent = l_Value_0.PrimaryPart;
                        return;
                    else
                        _G.PlaySound(l_Value_0.PrimaryPart, script["EasterBunnyIdleJump" .. v8]).Parent = l_Value_0.PrimaryPart;
                        return;
                    end;
                end);
            end;
            local v13 = {};
            local v14 = "Idle";
            local function _(v15) --[[ Line: 54 ]] --[[ Name: playAnim ]]
                -- upvalues: v13 (copy)
                if v15 and v15.IsPlaying == false then
                    v15:Play();
                    if v13[v15] then
                        v15.TimePosition = v13[v15];
                    end;
                end;
            end;
            local function v20(v17) --[[ Line: 63 ]] --[[ Name: CancelAnims ]]
                -- upvalues: v6 (copy), v13 (copy)
                for _, v19 in v6 do
                    if v19.IsPlaying == true and v19 ~= v17 then
                        v13[v19] = v19.TimePosition;
                        v19:Stop();
                    end;
                end;
            end;
            v2.Running:Connect(function(v21) --[[ Line: 83 ]]
                -- upvalues: v14 (ref), v20 (copy), v6 (copy)
                if v21 > 2 then
                    if v14 ~= "Running" then
                        v14 = "Running";
                        v20();
                        v6.Run:Play();
                        return;
                    end;
                elseif v14 ~= "Idle" then
                    v14 = "Idle";
                    v20();
                    v6.Idle:Play();
                end;
            end);
            if v7 then
                v7.Target.Changed:Connect(function() --[[ Line: 101 ]]
                    -- upvalues: v7 (copy), v20 (copy), v6 (copy), v13 (copy)
                    if v7.Target.Value == nil then
                        v20(v6.Idle);
                        local l_Idle_0 = v6.Idle;
                        if l_Idle_0 and l_Idle_0.IsPlaying == false then
                            l_Idle_0:Play();
                            if v13[l_Idle_0] then
                                l_Idle_0.TimePosition = v13[l_Idle_0];
                            end;
                        end;
                    end;
                end);
            end;
            v6.Idle:Play();
            while true do
                task.wait(math.random(5, 10));
                if not l_Value_0:GetAttribute("EndVoice") or workspace:GetServerTimeNow() >= l_Value_0:GetAttribute("EndVoice") then
                    _G.PlaySound(l_Value_0.PrimaryPart, script["EasterBunnyIdleVoice" .. math.random(1, 3)]);
                end;
            end;
        end;
        return;
    end;
end;