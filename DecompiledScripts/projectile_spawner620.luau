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
v4.Fire = function(v18, v19, v20, v21) --[[ Line: 44 ]] --[[ Name: Fire ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy), v17 (copy), l_Debris_0 (copy)
    if not v18 or not v18:IsA("Model") then
        return nil;
    elseif not v19 or not v20 then
        return nil;
    else
        v21 = v21 or {};
        local v22 = v18:Clone();
        local l_PrimaryPart_0 = v22.PrimaryPart;
        if not l_PrimaryPart_0 then
            v22:Destroy();
            return nil;
        else
            l_PrimaryPart_0.CFrame = v19 * (v21.Offset or CFrame.new());
            v22.Parent = v21.Parent or workspace;
            local l_CFrame_0 = l_PrimaryPart_0.CFrame;
            local v25 = v21.Lifetime or 5;
            local v26 = v21.Duration or 1;
            local v27 = v21.EasingStyle or Enum.EasingStyle.Quad;
            local v28 = v21.EasingDirection or Enum.EasingDirection.Out;
            if v21.ControlPoints and #v21.ControlPoints >= 2 then
                local v29 = v21.ControlPoints[1];
                local v30 = v21.ControlPoints[2];
                local l_NumberValue_0 = Instance.new("NumberValue");
                l_NumberValue_0.Value = 0;
                l_NumberValue_0.Name = "ProjectileBezierProgress";
                l_NumberValue_0.Parent = nil;
                local v32 = TweenInfo.new(v26, v27, v28, 0, false, 0);
                local v33 = l_TweenService_0:Create(l_NumberValue_0, v32, {
                    Value = 1
                });
                local v34 = nil;
                do
                    local l_v34_0 = v34;
                    l_v34_0 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 106 ]]
                        -- upvalues: l_PrimaryPart_0 (copy), v33 (copy), v17 (ref), l_NumberValue_0 (copy), l_CFrame_0 (copy), v29 (copy), v30 (copy), v20 (copy), l_v34_0 (ref)
                        if l_PrimaryPart_0 and l_PrimaryPart_0.Parent and v33.PlaybackState == Enum.PlaybackState.Playing then
                            l_PrimaryPart_0.CFrame = v17(l_NumberValue_0.Value, l_CFrame_0, v29, v30, v20);
                            return;
                        else
                            if l_v34_0 then
                                l_v34_0:Disconnect();
                                l_v34_0 = nil;
                            end;
                            return;
                        end;
                    end);
                    v33:Play();
                    v33.Completed:Connect(function() --[[ Line: 119 ]]
                        -- upvalues: l_v34_0 (ref), l_NumberValue_0 (copy)
                        if l_v34_0 then
                            l_v34_0:Disconnect();
                            l_v34_0 = nil;
                        end;
                        l_NumberValue_0:Destroy();
                    end);
                end;
            else
                local v36 = TweenInfo.new(v26, v27, v28, 0, false, 0);
                local v37 = l_TweenService_0:Create(l_PrimaryPart_0, v36, {
                    CFrame = v20
                });
                v37:Play();
                v37.Completed:Connect(function(v38) --[[ Line: 140 ]]
                    if v38 == Enum.TweenStatus.Completed then

                    end;
                end);
            end;
            l_Debris_0:AddItem(v22, v25);
            return v22;
        end;
    end;
end;
return v4;