local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v3 = nil;
local v4 = false;
local v5 = nil;
local function v8(v6, v7) --[[ Line: 13 ]] --[[ Name: Raycast ]]
    -- upvalues: v3 (ref)
    return (workspace:Raycast(v6, v7, v3));
end;
local function _(v9) --[[ Line: 32 ]] --[[ Name: CanVault ]]
    if _G.canuse == false or _G.check:inspect(v9) == false or v9.Parent ~= workspace.PlayerCharacters then
        return false;
    else
        return true;
    end;
end;
local function v32(v11) --[[ Line: 39 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: v5 (ref), v3 (ref), l_RunService_0 (copy), v4 (ref), v8 (copy)
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
    local l_Humanoid_0 = v11:WaitForChild("Humanoid");
    local l_HumanoidRootPart_0 = v11:WaitForChild("HumanoidRootPart");
    local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
    local v15 = {};
    for _, v17 in script.Anims:GetChildren() do
        table.insert(v15, l_Animator_0:LoadAnimation(v17));
    end;
    v3 = RaycastParams.new();
    v3.FilterDescendantsInstances = {
        workspace.Env, 
        workspace.Ships, 
        workspace.Islands
    };
    v3.RespectCanCollide = true;
    v3.FilterType = Enum.RaycastFilterType.Include;
    local v18 = 1;
    local v19 = 0;
    l_Humanoid_0:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 61 ]]
        -- upvalues: l_Humanoid_0 (copy), l_HumanoidRootPart_0 (copy), v19 (ref), v5 (ref), l_RunService_0 (ref), v4 (ref), v11 (copy), v8 (ref), v18 (ref), v15 (copy)
        local l_MoveDirection_0 = l_Humanoid_0.MoveDirection;
        local v21 = l_HumanoidRootPart_0.CFrame:VectorToObjectSpace(l_MoveDirection_0);
        if l_MoveDirection_0 == Vector3.new() then
            v19 = 0;
        end;
        if v21.Z < -0.3 then
            if v5 then
                return;
            else
                v5 = l_RunService_0.Heartbeat:Connect(function(v22) --[[ Line: 69 ]]
                    -- upvalues: l_Humanoid_0 (ref), v19 (ref), l_HumanoidRootPart_0 (ref), v4 (ref), v11 (ref), v8 (ref), v18 (ref), v15 (ref)
                    if l_Humanoid_0.MoveDirection ~= Vector3.new() then
                        v19 = v19 + v22;
                    end;
                    if v19 < 0.6 then
                        return;
                    elseif l_HumanoidRootPart_0.Anchored == true then
                        return;
                    elseif v4 then
                        return;
                    elseif l_Humanoid_0:GetState() ~= Enum.HumanoidStateType.Running and l_Humanoid_0:GetState() ~= Enum.HumanoidStateType.Freefall and l_Humanoid_0:GetState() ~= Enum.HumanoidStateType.Jumping then
                        return;
                    elseif l_HumanoidRootPart_0:FindFirstChildWhichIsA("BodyVelocity") or v11.LowerTorso:FindFirstChildWhichIsA("BodyVelocity") then
                        return;
                    else
                        local l_v11_0 = v11;
                        if not (_G.canuse ~= false and _G.check:inspect(l_v11_0) ~= false and l_v11_0.Parent == workspace.PlayerCharacters) then
                            return;
                        else
                            local v24 = 5;
                            if l_Humanoid_0.WalkSpeed > 20 then
                                v24 = 10;
                            end;
                            v24 = 2 + (l_HumanoidRootPart_0.Position - Vector3.new(v11.Head.Position.X, l_HumanoidRootPart_0.Position.Y, v11.Head.Position.Z)).Magnitude * 1.5;
                            local v25 = v8(l_HumanoidRootPart_0.Position - l_HumanoidRootPart_0.CFrame.UpVector * l_HumanoidRootPart_0.Size.Y * 0.5, l_Humanoid_0.MoveDirection * v24);
                            if not v25 then
                                return;
                            elseif math.abs((vector.dot(v25.Normal, (Vector3.new(0, 1, 0, 0))))) > 0.5 then
                                return;
                            else
                                local v26 = l_Humanoid_0.HipHeight + l_HumanoidRootPart_0.Size.Y * 0.5;
                                local v27 = v25.Position + v25.Normal * 0.5;
                                local v28 = vector.cross(l_HumanoidRootPart_0.CFrame.RightVector, -v25.Normal) * v26;
                                if v8(v25.Position + v25.Normal, Vector3.new(0, 1, 0, 0) * -v26 / 2) then
                                    return;
                                elseif v8(v27, v28) then
                                    return;
                                else
                                    v27 = v27 + v28;
                                    v28 = -v25.Normal;
                                    if v8(v27, v28) then
                                        return;
                                    else
                                        v27 = v27 + v28;
                                        v28 = vector.cross(l_HumanoidRootPart_0.CFrame.RightVector, v25.Normal) * v26;
                                        local v29 = v8(v27, v28);
                                        if not v29 then
                                            return;
                                        else
                                            v4 = true;
                                            v18 = v18 + 1;
                                            if v18 > 3 then
                                                v18 = 1;
                                            end;
                                            local v30 = v15[v18];
                                            v30:Play();
                                            v30.Priority = Enum.AnimationPriority.Action;
                                            if v30.Length ~= 0 then
                                                v30:AdjustSpeed(v30.Length / 0.4);
                                            end;
                                            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                            l_BodyVelocity_0.MaxForce = Vector3.new(100000, 100000, 100000, 0);
                                            l_BodyVelocity_0.Velocity = (v29.Position + v29.Normal * v26 * 1.5 - l_HumanoidRootPart_0.Position) * 5 + l_Humanoid_0.MoveDirection * 3;
                                            l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                            _G.PlaySound(v11.PrimaryPart, script.VaultingSFX["VaultJump" .. math.random(1, 4)]).Parent = v11.PrimaryPart;
                                            task.delay(0.1, l_BodyVelocity_0.Destroy, l_BodyVelocity_0);
                                            v30.Stopped:Connect(function() --[[ Line: 156 ]]
                                                -- upvalues: v4 (ref)
                                                v4 = false;
                                            end);
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
                return;
            end;
        else
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
            return;
        end;
    end);
end;
v32(l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait());
l_LocalPlayer_0.CharacterAdded:Connect(v32);