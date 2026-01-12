local v0 = {};
v0.__index = v0;
local l_W_0 = Enum.KeyCode.W;
local l_S_0 = Enum.KeyCode.S;
local l_D_0 = Enum.KeyCode.D;
local l_A_0 = Enum.KeyCode.A;
local l_Whitelist_0 = Enum.RaycastFilterType.Whitelist;
local v6 = {
    workspace.Env, 
    workspace.Ships, 
    workspace.Islands
};
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("CollectionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v12 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local l_HumanoidRootPart_0 = v12:WaitForChild("HumanoidRootPart");
local l_RootRigAttachment_0 = l_HumanoidRootPart_0:WaitForChild("RootRigAttachment");
local l_Humanoid_0 = v12:WaitForChild("Humanoid");
local l_Head_0 = v12:WaitForChild("Head");
local l_RightUpperArm_0 = v12:WaitForChild("RightUpperArm");
local _ = {
    diameter = 120, 
    padding = 4, 
    count = 64, 
    size = 1024
};
local v19 = false;
local v20 = nil;
local v21 = false;
local v22 = 10;
local v23 = true;
local v24 = true;
local v25 = 0;
local v26 = 0;
local v27 = 0;
local v28 = nil;
local v29 = Vector3.new();
local v30 = RaycastParams.new();
v30.FilterType = l_Whitelist_0;
v30.FilterDescendantsInstances = v6;
local l_LinearVelocity_0 = Instance.new("LinearVelocity");
l_LinearVelocity_0.Name = "climbLevitationForce";
l_LinearVelocity_0.MaxForce = 100000000000;
l_LinearVelocity_0.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, 0, 0);
local l_AlignOrientation_0 = Instance.new("AlignOrientation");
l_AlignOrientation_0.Name = "climbOrientationForce";
l_AlignOrientation_0.MaxTorque = 40000;
l_AlignOrientation_0.MaxAngularVelocity = 3000;
l_AlignOrientation_0.Responsiveness = 30;
l_AlignOrientation_0.Mode = Enum.OrientationAlignmentMode.OneAttachment;
local v33 = Instance.new("IntValue", script);
local v34 = l_Humanoid_0:LoadAnimation(script:WaitForChild("LedgeClimb"));
local v35 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbUp"));
local v36 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbDown"));
local v37 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbLeft"));
local v38 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbRight"));
local v39 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbIdle"));
local v40 = script.BillboardGui:Clone();
local function _(v41) --[[ Line: 101 ]] --[[ Name: isInstanceClimbable ]]
    if v41 == nil then
        return false;
    elseif v41.CanCollide == false then
        return false;
    elseif v41.Transparency > 1 then
        return false;
    else
        return true;
    end;
end;
local function _(v43) --[[ Line: 109 ]] --[[ Name: isVectorAngleClimbable ]]
    if v43 == nil then
        return false;
    elseif math.abs((Vector3.new(0, 1, 0, 0):Dot(v43))) > 0.2617993877991494 then
        return false;
    else
        return true;
    end;
end;
local function _() --[[ Line: 116 ]] --[[ Name: enableLevitationForce ]]
    -- upvalues: l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref), l_RootRigAttachment_0 (ref)
    if l_LinearVelocity_0.Parent == l_HumanoidRootPart_0 then
        return;
    else
        l_LinearVelocity_0.Parent = l_HumanoidRootPart_0;
        l_LinearVelocity_0.Attachment0 = l_RootRigAttachment_0;
        l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, 0, 0);
        return;
    end;
end;
local function _() --[[ Line: 123 ]] --[[ Name: disableLevitationForce ]]
    -- upvalues: l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref)
    if l_LinearVelocity_0.Parent == l_HumanoidRootPart_0 then
        l_LinearVelocity_0.Parent = nil;
        l_LinearVelocity_0.Attachment0 = nil;
    end;
end;
local function _(v47) --[[ Line: 130 ]] --[[ Name: enableOrientationAlignment ]]
    -- upvalues: l_AlignOrientation_0 (copy), l_HumanoidRootPart_0 (ref), l_RootRigAttachment_0 (ref)
    if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
    end;
    l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
    if v47 then
        l_AlignOrientation_0.CFrame = v47;
    end;
end;
local function _() --[[ Line: 140 ]] --[[ Name: disableOrientationAlignment ]]
    -- upvalues: l_AlignOrientation_0 (copy), l_HumanoidRootPart_0 (ref)
    if l_AlignOrientation_0.Parent == l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = nil;
        l_AlignOrientation_0.Attachment0 = nil;
    end;
end;
local function v101(v50) --[[ Line: 147 ]] --[[ Name: ClimbMovementHandler ]]
    -- upvalues: v21 (ref), v20 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref), l_AlignOrientation_0 (copy), v22 (ref), v0 (copy), v40 (copy), l_Humanoid_0 (ref), v19 (ref), l_UserInputService_0 (copy), l_W_0 (copy), l_S_0 (copy), l_D_0 (copy), l_A_0 (copy), l_RightUpperArm_0 (copy), v30 (copy), v29 (ref), l_RootRigAttachment_0 (ref), v26 (ref), l_Head_0 (ref), v33 (copy), v27 (ref)
    local v51 = 0;
    if v21 == false then
        return v20:Disconnect();
    elseif l_LinearVelocity_0.Parent ~= l_HumanoidRootPart_0 then
        return;
    elseif l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
        return;
    else
        v22 = v22 - v50;
        if v22 <= 0 then
            return v0:DeActivateClimb();
        else
            local v52 = v22 / 10;
            v40.Progress.Percentage.Value = v52 * 100;
            v40.Parent = l_HumanoidRootPart_0;
            local l_MoveDirection_0 = l_Humanoid_0.MoveDirection;
            local l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
            local l_RightVector_0 = l_HumanoidRootPart_0.CFrame.RightVector;
            local v56 = math.round((l_LookVector_0:Dot(l_MoveDirection_0)));
            local v57 = math.round((l_RightVector_0:Dot(l_MoveDirection_0)));
            if not v19 then
                v56 = l_UserInputService_0:IsKeyDown(l_W_0) and 1 or l_UserInputService_0:IsKeyDown(l_S_0) and -1 or 0;
                v57 = l_UserInputService_0:IsKeyDown(l_D_0) and 1 or l_UserInputService_0:IsKeyDown(l_A_0) and -1 or 0;
            end;
            local v58 = l_HumanoidRootPart_0.CFrame.UpVector * v56;
            local v59 = l_HumanoidRootPart_0.CFrame.RightVector * v57;
            local v60 = v59 + v58;
            l_LinearVelocity_0.VectorVelocity = v60 * 6;
            local v61 = false;
            if math.abs(v56) > 0 or math.abs(v57) > 0 then
                local l_Position_0 = l_HumanoidRootPart_0.Position;
                local v63 = v60 * (l_HumanoidRootPart_0.Size.X / 2 + l_RightUpperArm_0.Size.X + 2);
                local v64 = workspace:Raycast(l_Position_0, v63, v30);
                if v64 and v64.Instance and v64.Normal then
                    local l_Instance_0 = v64.Instance;
                    if l_Instance_0 ~= nil and not (l_Instance_0.CanCollide == false) and l_Instance_0.Transparency <= 1 then
                        l_Instance_0 = v64.Normal;
                        if l_Instance_0 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_0))) <= 0.2617993877991494 and v29 ~= v64.Normal and v64.Instance.Size.X > 3 and v64.Instance.Size.Y > 3 and v64.Instance.Size.Z > 3 then
                            v29 = v64.Normal;
                            local v66 = CFrame.new(v64.Position + v64.Normal, v64.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v66 then
                                l_AlignOrientation_0.CFrame = v66;
                            end;
                        end;
                    end;
                elseif math.abs(v56) > 0 or math.abs(v57) > 0 then
                    local l_Position_1 = l_HumanoidRootPart_0.Position;
                    local v68 = l_LookVector_0 * 5 * 3;
                    local v69 = workspace:Raycast(l_Position_1, v68, v30);
                    if v69 and v69.Instance and v69.Normal then
                        local l_Magnitude_0 = (l_HumanoidRootPart_0.Position + l_LookVector_0 * -l_HumanoidRootPart_0.Size.Z / 2 - v69.Position).Magnitude;
                        if l_HumanoidRootPart_0.Size.Z / 2 + 0.2 < l_Magnitude_0 then
                            l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * (l_Magnitude_0 - l_HumanoidRootPart_0.Size.Z / 2 - 1.5);
                        elseif l_Magnitude_0 < l_HumanoidRootPart_0.Size.Z / 2 + 0.2 then
                            l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity - l_LookVector_0 * (l_Magnitude_0 + l_HumanoidRootPart_0.Size.Z / 2 + 1.5);
                        end;
                        local l_Instance_1 = v69.Instance;
                        if l_Instance_1 ~= nil and not (l_Instance_1.CanCollide == false) and l_Instance_1.Transparency <= 1 then
                            l_Instance_1 = v69.Normal;
                            if l_Instance_1 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_1))) <= 0.2617993877991494 and v29 ~= v69.Normal and v69.Instance.Size.X > 3 and v69.Instance.Size.Y > 3 and v69.Instance.Size.Z > 3 then
                                v29 = v69.Normal;
                                local v72 = CFrame.new(v69.Position + v69.Normal, v69.Position);
                                if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                    l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                                end;
                                l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                                if v72 then
                                    l_AlignOrientation_0.CFrame = v72;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if (math.abs(v56) > 0 or math.abs(v57) > 0) and v61 == false and tick() - v26 > 0.2 then
                local v73 = l_HumanoidRootPart_0.Position + v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 15 + l_LookVector_0 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2);
                local v74 = (l_HumanoidRootPart_0.Position + v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 16 - v73).Unit * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2);
                local v75 = workspace:Raycast(v73, v74, v30);
                if v75 and v75.Instance and v75.Normal then
                    local l_Instance_2 = v75.Instance;
                    if l_Instance_2 ~= nil and not (l_Instance_2.CanCollide == false) and l_Instance_2.Transparency <= 1 then
                        l_Instance_2 = v75.Normal;
                        if l_Instance_2 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_2))) <= 0.2617993877991494 and v29 ~= v75.Normal and v75.Instance.Size.X > 3 and v75.Instance.Size.Y > 3 and v75.Instance.Size.Z > 3 then
                            v61 = true;
                            v26 = tick();
                            v29 = v75.Normal;
                            local v77 = CFrame.new(v75.Position + v75.Normal, v75.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v77 then
                                l_AlignOrientation_0.CFrame = v77;
                            end;
                        end;
                    end;
                end;
            end;
            if (math.abs(v56) > 0 or math.abs(v57) > 0) and v61 == false and tick() - v26 > 0.2 then
                local v78 = l_HumanoidRootPart_0.Position + v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 15;
                local v79 = (l_HumanoidRootPart_0.Position - v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 16 + l_LookVector_0 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) - v78).Unit * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2);
                local v80 = workspace:Raycast(v78, v79, v30);
                if v80 and v80.Instance and v80.Normal then
                    local l_Instance_3 = v80.Instance;
                    if l_Instance_3 ~= nil and not (l_Instance_3.CanCollide == false) and l_Instance_3.Transparency <= 1 then
                        l_Instance_3 = v80.Normal;
                        if l_Instance_3 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_3))) <= 0.2617993877991494 and v29 ~= v80.Normal and v80.Instance.Size.X > 3 and v80.Instance.Size.Y > 3 and v80.Instance.Size.Z > 3 then
                            v61 = true;
                            v26 = tick();
                            v29 = v80.Normal;
                            local v82 = CFrame.new(v80.Position + v80.Normal, v80.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v82 then
                                l_AlignOrientation_0.CFrame = v82;
                            end;
                        end;
                    end;
                end;
            end;
            local l_Position_2 = l_HumanoidRootPart_0.Position;
            local v84 = l_LookVector_0 * 5 * 3;
            local v85 = workspace:Raycast(l_Position_2, v84, v30);
            if v85 and v85.Instance and v85.Normal then
                local l_Magnitude_1 = (l_HumanoidRootPart_0.Position + l_LookVector_0 * -l_HumanoidRootPart_0.Size.Z / 2 - v85.Position).Magnitude;
                if l_HumanoidRootPart_0.Size.Z / 2 + 0.2 < l_Magnitude_1 then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * (l_Magnitude_1 - l_HumanoidRootPart_0.Size.Z / 2 - 1.5);
                elseif l_Magnitude_1 < l_HumanoidRootPart_0.Size.Z / 2 + 0.2 then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity - l_LookVector_0 * (l_Magnitude_1 + l_HumanoidRootPart_0.Size.Z / 2 + 1.5);
                end;
            end;
            if v56 == -1 then
                local l_Position_3 = l_HumanoidRootPart_0.Position;
                local v88 = v58 * (l_HumanoidRootPart_0.Size.Y + l_Humanoid_0.HipHeight);
                local v89 = workspace:Raycast(l_Position_3, v88, v30);
                if v89 and v89.Instance and v89.Normal then
                    v0:DeActivateClimb();
                end;
            end;
            local v90 = l_HumanoidRootPart_0.Position - l_LookVector_0 * 5 - v58 * (l_Head_0.Position.Y - l_HumanoidRootPart_0.Position.Y);
            local v91 = l_LookVector_0 * 5 * 4;
            local v92 = workspace:Raycast(v90, v91, v30);
            if not v92 or not v92.Instance or not v92.Normal then
                l_Humanoid_0:ChangeState(Enum.HumanoidStateType.Landed);
                v0:DeActivateClimb();
            end;
            local v93 = false;
            if v56 == 1 then
                local v94 = l_HumanoidRootPart_0.Position - l_LookVector_0 * 5 + v58 * (l_Head_0.Position.Y - l_HumanoidRootPart_0.Position.Y);
                local v95 = 2 * l_LookVector_0 * 5;
                local v96 = workspace:Raycast(v94, v95, v30);
                if not v96 or not v96.Instance or not v96.Normal then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * 6;
                    v93 = true;
                end;
            end;
            if v93 == true and v21 then
                v51 = 1;
            elseif v21 then
                v51 = v56 == 1 and 2 or v56 == -1 and 3 or v57 == 1 and 4 or v57 == -1 and 5 or 6;
            end;
            v33.Value = v51;
            if v21 and tick() - v27 > 1 then
                v27 = tick();
                if l_HumanoidRootPart_0 then
                    local l_Position_4 = l_HumanoidRootPart_0.Position;
                    local v98 = l_LookVector_0 * 5;
                    local v99 = workspace:Raycast(l_Position_4, v98, v30);
                    if v99 and v99.Instance and v99.Normal then
                        local l_Instance_4 = v99.Instance;
                        if (l_Instance_4 ~= nil and not (l_Instance_4.CanCollide == false) and l_Instance_4.Transparency <= 1) == false then
                            v0:DeActivateClimb();
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v0.IsClimbing = function(_) --[[ Line: 316 ]] --[[ Name: IsClimbing ]]
    -- upvalues: v21 (ref)
    return v21;
end;
v0.ActivateClimb = function(_) --[[ Line: 319 ]] --[[ Name: ActivateClimb ]]
    -- upvalues: v23 (ref), v25 (ref), l_LocalPlayer_0 (copy), v30 (copy), v22 (ref), v21 (ref), v29 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref), l_RootRigAttachment_0 (ref), l_AlignOrientation_0 (copy), v28 (ref), v20 (ref), l_RunService_0 (copy), v101 (copy)
    if v23 == false then
        return false;
    elseif tick() - v25 < 0.5 then
        return false;
    else
        local v104 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
        local l_HumanoidRootPart_1 = v104:WaitForChild("HumanoidRootPart");
        local _ = l_HumanoidRootPart_1:WaitForChild("RootRigAttachment");
        local l_Humanoid_1 = v104:WaitForChild("Humanoid");
        local l_CFrame_0 = l_HumanoidRootPart_1.CFrame;
        local v109 = workspace:Raycast(l_CFrame_0.Position, l_CFrame_0.LookVector * 5, v30);
        if v109 == nil then
            return false;
        elseif v109.Instance == nil then
            return false;
        else
            local l_Instance_5 = v109.Instance;
            if (l_Instance_5 ~= nil and not (l_Instance_5.CanCollide == false) and l_Instance_5.Transparency <= 1) == false then
                return false;
            elseif v109.Normal == nil then
                return false;
            else
                l_Instance_5 = v109.Normal;
                if (l_Instance_5 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_5))) <= 0.2617993877991494) == false then
                    return false;
                elseif v109.Position == nil then
                    return false;
                elseif v22 <= 0 then
                    return;
                else
                    v21 = true;
                    v29 = v109.Normal;
                    local v111 = CFrame.new(v109.Position + v109.Normal, v109.Position);
                    v104:PivotTo(v111);
                    if l_LinearVelocity_0.Parent ~= l_HumanoidRootPart_0 then
                        l_LinearVelocity_0.Parent = l_HumanoidRootPart_0;
                        l_LinearVelocity_0.Attachment0 = l_RootRigAttachment_0;
                        l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, 0, 0);
                    end;
                    if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                        l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                    end;
                    l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                    if v111 then
                        l_AlignOrientation_0.CFrame = v111;
                    end;
                    v28 = l_Humanoid_1.AutoRotate;
                    l_Humanoid_1.AutoRotate = false;
                    if v20 then
                        v20:Disconnect();
                    end;
                    v20 = l_RunService_0.Heartbeat:Connect(v101);
                    return;
                end;
            end;
        end;
    end;
end;
v0.DeActivateClimb = function(_) --[[ Line: 346 ]] --[[ Name: DeActivateClimb ]]
    -- upvalues: v21 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref), l_AlignOrientation_0 (copy), v25 (ref), l_Humanoid_0 (ref), v28 (ref), v33 (copy), v20 (ref), l_RunService_0 (copy), v22 (ref), v40 (copy)
    v21 = false;
    if l_LinearVelocity_0.Parent == l_HumanoidRootPart_0 then
        l_LinearVelocity_0.Parent = nil;
        l_LinearVelocity_0.Attachment0 = nil;
    end;
    if l_AlignOrientation_0.Parent == l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = nil;
        l_AlignOrientation_0.Attachment0 = nil;
    end;
    v25 = tick();
    l_Humanoid_0.AutoRotate = v28;
    v33.Value = 0;
    if v20 then
        v20:Disconnect();
    end;
    v20 = l_RunService_0.Heartbeat:Connect(function(v113) --[[ Line: 354 ]]
        -- upvalues: v22 (ref), v40 (ref), v20 (ref), v21 (ref)
        v22 = v22 + v113;
        v40.Progress.Percentage.Value = v22 / 10 * 100;
        if v22 >= 10 then
            v20:Disconnect();
            v22 = 10;
        end;
        if v40.Progress.Percentage.Value >= 100 and v21 == false then
            v40.Parent = nil;
        end;
    end);
end;
v0.CanClimb = function(_) --[[ Line: 370 ]] --[[ Name: CanClimb ]]
    -- upvalues: v23 (ref)
    return v23;
end;
v0.EnableClimb = function(_) --[[ Line: 373 ]] --[[ Name: EnableClimb ]]
    -- upvalues: v23 (ref)
    v23 = true;
end;
v0.DisableClimb = function(_) --[[ Line: 376 ]] --[[ Name: DisableClimb ]]
    -- upvalues: v23 (ref)
    v23 = false;
end;
v0.CanClimbStaminaRegen = function(_) --[[ Line: 380 ]] --[[ Name: CanClimbStaminaRegen ]]
    -- upvalues: v24 (ref)
    return v24;
end;
v0.EnableClimbStaminaRegen = function(_) --[[ Line: 383 ]] --[[ Name: EnableClimbStaminaRegen ]]
    -- upvalues: v24 (ref), v25 (ref)
    v24 = true;
    v25 = tick();
end;
v0.DisableClimbStaminaRegen = function(_) --[[ Line: 387 ]] --[[ Name: DisableClimbStaminaRegen ]]
    -- upvalues: v24 (ref)
    v24 = false;
end;
v0.GetClimbMaxStamina = function(_) --[[ Line: 391 ]] --[[ Name: GetClimbMaxStamina ]]
    return 10;
end;
v0.GetClimbCurrentStamina = function(_) --[[ Line: 394 ]] --[[ Name: GetClimbCurrentStamina ]]
    -- upvalues: v22 (ref)
    return v22;
end;
v0.EnableMobile = function(_) --[[ Line: 398 ]] --[[ Name: EnableMobile ]]
    -- upvalues: v19 (ref)
    v19 = true;
end;
v0.DisableMobile = function(_) --[[ Line: 402 ]] --[[ Name: DisableMobile ]]
    -- upvalues: v19 (ref)
    v19 = false;
end;
v33.Changed:Connect(function() --[[ Line: 406 ]]
    -- upvalues: v33 (copy), v34 (ref), v35 (ref), v36 (ref), v38 (ref), v37 (ref), v39 (ref)
    if v33 ~= nil then
        if v33.Value == 1 then
            v34:Play();
        else
            v34:Stop();
        end;
        if v33.Value == 2 then
            v35:Play();
        else
            v35:Stop();
        end;
        if v33.Value == 3 then
            v36:Play(0.100000001, 1, -1);
        else
            v36:Stop();
        end;
        if v33.Value == 4 then
            v38:Play();
        else
            v38:Stop();
        end;
        if v33.Value == 5 then
            v37:Play();
        else
            v37:Stop();
        end;
        if v33.Value == 6 then
            v39:Play();
            return;
        else
            v39:Stop();
        end;
    end;
end);
l_LocalPlayer_0.CharacterAdded:Connect(function(v124) --[[ Line: 442 ]]
    -- upvalues: v12 (ref), l_HumanoidRootPart_0 (ref), l_RootRigAttachment_0 (ref), l_Humanoid_0 (ref), l_Head_0 (ref), v34 (ref), v35 (ref), v36 (ref), v37 (ref), v38 (ref), v39 (ref)
    v12 = v124;
    l_HumanoidRootPart_0 = v12:WaitForChild("HumanoidRootPart");
    l_RootRigAttachment_0 = l_HumanoidRootPart_0:WaitForChild("RootRigAttachment");
    l_Humanoid_0 = v12:WaitForChild("Humanoid");
    l_Head_0 = v12:WaitForChild("Head");
    v34 = l_Humanoid_0:LoadAnimation(script:WaitForChild("LedgeClimb"));
    v35 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbUp"));
    v36 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbDown"));
    v37 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbLeft"));
    v38 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbRight"));
    v39 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbIdle"));
end);
return v0;