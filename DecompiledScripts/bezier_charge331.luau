local _ = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local l_RunService_0 = game:GetService("RunService");
local v4 = {};
local function v17(v5, v6, v7, v8, v9) --[[ Line: 9 ]] --[[ Name: getBezierCFrame ]]
    local v10 = 1 - v5;
    local v11 = v10 * v10;
    local v12 = v11 * v10;
    local v13 = v5 * v5;
    local v14 = v13 * v5;
    local v15 = v6.Position * v12 + v7.Position * (v11 * 3 * v5) + v8.Position * (v10 * 3 * v13) + v9.Position * v14;
    local v16 = (v7.Position - v6.Position) * (v11 * 3) + (v8.Position - v7.Position) * (v10 * 6 * v5) + (v9.Position - v8.Position) * (v13 * 3);
    if v16.Magnitude < 0.001 then
        v16 = if v5 < 0.5 then (v7.Position - v6.Position).Unit else (v9.Position - v8.Position).Unit;
        if v16.Magnitude < 0.001 then
            v16 = v9.Position - v6.Position;
            if v16.Magnitude < 0.001 then
                v16 = Vector3.new(0, 0, -1, 0);
            end;
        end;
    end;
    return CFrame.lookAt(v15, v15 + v16);
end;
v4.Create = function(v18, v19) --[[ Line: 43 ]] --[[ Name: Create ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy), v17 (copy), l_Debris_0 (copy)
    v19 = v19 or {};
    if typeof(v18) ~= "CFrame" then
        warn("BezierChargeEffect.Create: 'targetCFrame' must be a CFrame value, but received an " .. typeof(v18) .. ". Did you pass a Part/Instance instead of Part.CFrame?");
        return;
    else
        local v20 = v19.Count or 30;
        local v21 = v19.SpawnRadius or 20;
        local v22 = v19.MinDuration or 0.8;
        local v23 = v19.MaxDuration or 1.5;
        local v24 = v19.Lifetime or 2;
        local l_ParticleTemplate_0 = v19.ParticleTemplate;
        local v26 = v19.ControlPointHeight or 15;
        local v27 = v19.RandomControlOffset or 8;
        local v28 = v19.Parent or workspace.Effects;
        local v29 = v19.EasingStyle or Enum.EasingStyle.Quart;
        local v30 = v19.EasingDirection or Enum.EasingDirection.Out;
        local v31 = v19.SpawnDelay or 0.05;
        local l_ColorSequence_0 = v19.ColorSequence;
        local l_TransparencySequence_0 = v19.TransparencySequence;
        local v34 = v19.SwirlStrength or 0;
        if not l_ParticleTemplate_0 or not l_ParticleTemplate_0:IsA("BasePart") then
            warn("BezierChargeEffect.Create: ParticleTemplate is required and must be a BasePart.");
            return;
        else
            for v35 = 1, v20 do
                task.spawn(function() --[[ Line: 89 ]]
                    -- upvalues: v31 (copy), v35 (copy), l_ParticleTemplate_0 (copy), v28 (copy), v21 (copy), v18 (copy), v22 (copy), v23 (copy), v27 (copy), v34 (copy), v26 (copy), v29 (copy), v30 (copy), l_TweenService_0 (ref), l_RunService_0 (ref), v17 (ref), l_ColorSequence_0 (copy), l_TransparencySequence_0 (copy), l_Debris_0 (ref), v24 (copy)
                    if v31 > 0 then
                        task.wait(v35 * v31);
                    end;
                    local v36 = l_ParticleTemplate_0:Clone();
                    v36.Anchored = false;
                    v36.CanCollide = false;
                    v36.CanTouch = false;
                    v36.Massless = true;
                    v36.Parent = v28;
                    local v37 = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1).Unit * math.random(0, v21);
                    local v38 = CFrame.new(v18.Position + v37);
                    v36.CFrame = v38;
                    local v39 = math.random(v22 * 100, v23 * 100) / 100;
                    local l_v18_0 = v18;
                    local v41 = v38:Lerp(l_v18_0, 0.5);
                    local v42 = math.abs(v27);
                    local v43 = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1).Unit * (math.random() * v42);
                    local v44 = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1).Unit * (math.random() * v42);
                    local l_Unit_0 = (l_v18_0.Position - v38.Position).Unit;
                    local v46 = l_Unit_0:Cross((Vector3.new(0, 1, 0, 0)));
                    if v46.Magnitude < 0.001 then
                        v46 = l_Unit_0:Cross((Vector3.new(0, 0, -1, 0)));
                    end;
                    v46 = v46.Unit;
                    local v47 = v46 * (math.random() * 2 - 1) * v34;
                    local v48 = v46 * (math.random() * 2 - 1) * v34;
                    local v49 = v38.Position:Lerp(v41.Position, 0.3) + Vector3.new(0, v26, 0) + v43 + v47;
                    local v50 = v41.Position:Lerp(l_v18_0.Position, 0.7) + Vector3.new(0, v26, 0) + v44 + v48;
                    local v51 = CFrame.new(v49);
                    local v52 = CFrame.new(v50);
                    local l_NumberValue_0 = Instance.new("NumberValue");
                    l_NumberValue_0.Value = 0;
                    l_NumberValue_0.Parent = nil;
                    local v54 = TweenInfo.new(v39, v29, v30, 0, false, 0);
                    local v55 = l_TweenService_0:Create(l_NumberValue_0, v54, {
                        Value = 1
                    });
                    local v56 = nil;
                    v56 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 169 ]]
                        -- upvalues: v36 (copy), v55 (copy), v17 (ref), l_NumberValue_0 (copy), v38 (copy), v51 (copy), v52 (copy), l_v18_0 (copy), v56 (ref)
                        if v36 and v36.Parent and v55.PlaybackState == Enum.PlaybackState.Playing then
                            v36.CFrame = v17(l_NumberValue_0.Value, v38, v51, v52, l_v18_0);
                            return;
                        else
                            if v56 then
                                v56:Disconnect();
                                v56 = nil;
                            end;
                            return;
                        end;
                    end);
                    if l_ColorSequence_0 then
                        local l_Trail_0 = v36:FindFirstChildOfClass("Trail");
                        if l_Trail_0 then
                            l_Trail_0.Color = l_ColorSequence_0;
                        end;
                    end;
                    if l_TransparencySequence_0 then
                        local l_Trail_1 = v36:FindFirstChildOfClass("Trail");
                        if l_Trail_1 then
                            l_Trail_1.Transparency = l_TransparencySequence_0;
                        end;
                    end;
                    v55:Play();
                    v55.Completed:Connect(function() --[[ Line: 195 ]]
                        -- upvalues: v56 (ref), l_NumberValue_0 (copy)
                        if v56 then
                            v56:Disconnect();
                            v56 = nil;
                        end;
                        l_NumberValue_0:Destroy();
                    end);
                    l_Debris_0:AddItem(v36, v24);
                end);
            end;
            return;
        end;
    end;
end;
return v4;