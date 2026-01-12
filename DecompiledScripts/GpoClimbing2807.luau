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
local v22 = 0;
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
local _ = require(script.ConfigReader);
local v41 = script.BillboardGui:Clone();
local function _(v42) --[[ Line: 102 ]] --[[ Name: isInstanceClimbable ]]
    if v42 == nil then
        return false;
    elseif v42.CanCollide == false then
        return false;
    elseif v42.Transparency > 1 then
        return false;
    else
        return true;
    end;
end;
local function _(v44) --[[ Line: 110 ]] --[[ Name: isVectorAngleClimbable ]]
    if v44 == nil then
        return false;
    elseif math.abs((Vector3.new(0, 1, 0, 0):Dot(v44))) > 0.2617993877991494 then
        return false;
    else
        return true;
    end;
end;
local function _() --[[ Line: 117 ]] --[[ Name: enableLevitationForce ]]
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
local function _() --[[ Line: 124 ]] --[[ Name: disableLevitationForce ]]
    -- upvalues: l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref)
    if l_LinearVelocity_0.Parent == l_HumanoidRootPart_0 then
        l_LinearVelocity_0.Parent = nil;
        l_LinearVelocity_0.Attachment0 = nil;
    end;
end;
local function _(v48) --[[ Line: 131 ]] --[[ Name: enableOrientationAlignment ]]
    -- upvalues: l_AlignOrientation_0 (copy), l_HumanoidRootPart_0 (ref), l_RootRigAttachment_0 (ref)
    if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
    end;
    l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
    if v48 then
        l_AlignOrientation_0.CFrame = v48;
    end;
end;
local function _() --[[ Line: 141 ]] --[[ Name: disableOrientationAlignment ]]
    -- upvalues: l_AlignOrientation_0 (copy), l_HumanoidRootPart_0 (ref)
    if l_AlignOrientation_0.Parent == l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = nil;
        l_AlignOrientation_0.Attachment0 = nil;
    end;
end;
local function v102(v51) --[[ Line: 148 ]] --[[ Name: ClimbMovementHandler ]]
    -- upvalues: v21 (ref), v20 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref), l_AlignOrientation_0 (copy), v22 (ref), v0 (copy), l_Humanoid_0 (ref), v19 (ref), l_UserInputService_0 (copy), l_W_0 (copy), l_S_0 (copy), l_D_0 (copy), l_A_0 (copy), v41 (copy), l_RightUpperArm_0 (copy), v30 (copy), v29 (ref), l_RootRigAttachment_0 (ref), v26 (ref), l_Head_0 (ref), v33 (copy), v27 (ref)
    local v52 = 0;
    if v21 == false then
        return v20:Disconnect();
    elseif l_LinearVelocity_0.Parent ~= l_HumanoidRootPart_0 then
        return;
    elseif l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
        return;
    else
        v22 = v22 - v51;
        if v22 <= 0 then
            return v0:DeActivateClimb();
        else
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
            local v62 = v22 / 10;
            v41.Progress.Percentage.Value = v62 * 100;
            v41.Parent = l_HumanoidRootPart_0;
            if math.abs(v56) > 0 or math.abs(v57) > 0 then
                local l_Position_0 = l_HumanoidRootPart_0.Position;
                local v64 = v60 * (l_HumanoidRootPart_0.Size.X / 2 + l_RightUpperArm_0.Size.X + 2);
                local v65 = workspace:Raycast(l_Position_0, v64, v30);
                if v65 and v65.Instance and v65.Normal then
                    local l_Instance_0 = v65.Instance;
                    if l_Instance_0 ~= nil and not (l_Instance_0.CanCollide == false) and l_Instance_0.Transparency <= 1 then
                        l_Instance_0 = v65.Normal;
                        if l_Instance_0 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_0))) <= 0.2617993877991494 and v29 ~= v65.Normal and v65.Instance.Size.X > 3 and v65.Instance.Size.Y > 3 and v65.Instance.Size.Z > 3 then
                            v29 = v65.Normal;
                            local v67 = CFrame.new(v65.Position + v65.Normal, v65.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v67 then
                                l_AlignOrientation_0.CFrame = v67;
                            end;
                        end;
                    end;
                elseif math.abs(v56) > 0 or math.abs(v57) > 0 then
                    local l_Position_1 = l_HumanoidRootPart_0.Position;
                    local v69 = l_LookVector_0 * 5 * 3;
                    local v70 = workspace:Raycast(l_Position_1, v69, v30);
                    if v70 and v70.Instance and v70.Normal then
                        local l_Magnitude_0 = (l_HumanoidRootPart_0.Position + l_LookVector_0 * -l_HumanoidRootPart_0.Size.Z / 2 - v70.Position).Magnitude;
                        if l_HumanoidRootPart_0.Size.Z / 2 + 0.2 < l_Magnitude_0 then
                            l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * (l_Magnitude_0 - l_HumanoidRootPart_0.Size.Z / 2 - 1.5);
                        elseif l_Magnitude_0 < l_HumanoidRootPart_0.Size.Z / 2 + 0.2 then
                            l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity - l_LookVector_0 * (l_Magnitude_0 + l_HumanoidRootPart_0.Size.Z / 2 + 1.5);
                        end;
                        local l_Instance_1 = v70.Instance;
                        if l_Instance_1 ~= nil and not (l_Instance_1.CanCollide == false) and l_Instance_1.Transparency <= 1 then
                            l_Instance_1 = v70.Normal;
                            if l_Instance_1 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_1))) <= 0.2617993877991494 and v29 ~= v70.Normal and v70.Instance.Size.X > 3 and v70.Instance.Size.Y > 3 and v70.Instance.Size.Z > 3 then
                                v29 = v70.Normal;
                                local v73 = CFrame.new(v70.Position + v70.Normal, v70.Position);
                                if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                    l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                                end;
                                l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                                if v73 then
                                    l_AlignOrientation_0.CFrame = v73;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if (math.abs(v56) > 0 or math.abs(v57) > 0) and v61 == false and tick() - v26 > 0.2 then
                local v74 = l_HumanoidRootPart_0.Position + v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 15 + l_LookVector_0 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2);
                local v75 = (l_HumanoidRootPart_0.Position + v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 16 - v74).Unit * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2);
                local v76 = workspace:Raycast(v74, v75, v30);
                if v76 and v76.Instance and v76.Normal then
                    local l_Instance_2 = v76.Instance;
                    if l_Instance_2 ~= nil and not (l_Instance_2.CanCollide == false) and l_Instance_2.Transparency <= 1 then
                        l_Instance_2 = v76.Normal;
                        if l_Instance_2 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_2))) <= 0.2617993877991494 and v29 ~= v76.Normal and v76.Instance.Size.X > 3 and v76.Instance.Size.Y > 3 and v76.Instance.Size.Z > 3 then
                            v61 = true;
                            v26 = tick();
                            v29 = v76.Normal;
                            local v78 = CFrame.new(v76.Position + v76.Normal, v76.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v78 then
                                l_AlignOrientation_0.CFrame = v78;
                            end;
                        end;
                    end;
                end;
            end;
            if (math.abs(v56) > 0 or math.abs(v57) > 0) and v61 == false and tick() - v26 > 0.2 then
                local v79 = l_HumanoidRootPart_0.Position + v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 15;
                local v80 = (l_HumanoidRootPart_0.Position - v59 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) / 16 + l_LookVector_0 * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2) - v79).Unit * (l_HumanoidRootPart_0.Size.X + 2 * l_RightUpperArm_0.Size.X + 2);
                local v81 = workspace:Raycast(v79, v80, v30);
                if v81 and v81.Instance and v81.Normal then
                    local l_Instance_3 = v81.Instance;
                    if l_Instance_3 ~= nil and not (l_Instance_3.CanCollide == false) and l_Instance_3.Transparency <= 1 then
                        l_Instance_3 = v81.Normal;
                        if l_Instance_3 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_3))) <= 0.2617993877991494 and v29 ~= v81.Normal and v81.Instance.Size.X > 3 and v81.Instance.Size.Y > 3 and v81.Instance.Size.Z > 3 then
                            v61 = true;
                            v26 = tick();
                            v29 = v81.Normal;
                            local v83 = CFrame.new(v81.Position + v81.Normal, v81.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v83 then
                                l_AlignOrientation_0.CFrame = v83;
                            end;
                        end;
                    end;
                end;
            end;
            local l_Position_2 = l_HumanoidRootPart_0.Position;
            local v85 = l_LookVector_0 * 5 * 3;
            local v86 = workspace:Raycast(l_Position_2, v85, v30);
            if v86 and v86.Instance and v86.Normal then
                local l_Magnitude_1 = (l_HumanoidRootPart_0.Position + l_LookVector_0 * -l_HumanoidRootPart_0.Size.Z / 2 - v86.Position).Magnitude;
                if l_HumanoidRootPart_0.Size.Z / 2 + 0.2 < l_Magnitude_1 then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * (l_Magnitude_1 - l_HumanoidRootPart_0.Size.Z / 2 - 1.5);
                elseif l_Magnitude_1 < l_HumanoidRootPart_0.Size.Z / 2 + 0.2 then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity - l_LookVector_0 * (l_Magnitude_1 + l_HumanoidRootPart_0.Size.Z / 2 + 1.5);
                end;
            end;
            if v56 == -1 then
                local l_Position_3 = l_HumanoidRootPart_0.Position;
                local v89 = v58 * (l_Head_0.Position.Y - l_HumanoidRootPart_0.Position.Y);
                local v90 = workspace:Raycast(l_Position_3, v89, v30);
                if v90 and v90.Instance and v90.Normal then
                    v0:DeActivateClimb();
                end;
            end;
            local v91 = l_HumanoidRootPart_0.Position - l_LookVector_0 * 5 - v58 * (l_Head_0.Position.Y - l_HumanoidRootPart_0.Position.Y);
            local v92 = l_LookVector_0 * 5 * 4;
            local v93 = workspace:Raycast(v91, v92, v30);
            if not v93 or not v93.Instance or not v93.Normal then
                v0:DeActivateClimb();
            end;
            local v94 = false;
            if v56 == 1 then
                local v95 = l_HumanoidRootPart_0.Position - l_LookVector_0 * 5 + v58 * (l_Head_0.Position.Y - l_HumanoidRootPart_0.Position.Y);
                local v96 = 2 * l_LookVector_0 * 5;
                local v97 = workspace:Raycast(v95, v96, v30);
                if not v97 or not v97.Instance or not v97.Normal then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * 6;
                    v94 = true;
                end;
            end;
            if v94 == true and v21 then
                v52 = 1;
            elseif v21 then
                v52 = v56 == 1 and 2 or v56 == -1 and 3 or v57 == 1 and 4 or v57 == -1 and 5 or 6;
            end;
            v33.Value = v52;
            if v21 and tick() - v27 > 1 then
                v27 = tick();
                if l_HumanoidRootPart_0 then
                    local l_Position_4 = l_HumanoidRootPart_0.Position;
                    local v99 = l_LookVector_0 * 5;
                    local v100 = workspace:Raycast(l_Position_4, v99, v30);
                    if v100 and v100.Instance and v100.Normal then
                        local l_Instance_4 = v100.Instance;
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
v0.IsClimbing = function(_) --[[ Line: 315 ]] --[[ Name: IsClimbing ]]
    -- upvalues: v21 (ref)
    return v21;
end;
v0.ActivateClimb = function(_) --[[ Line: 318 ]] --[[ Name: ActivateClimb ]]
    -- upvalues: v23 (ref), v25 (ref), l_LocalPlayer_0 (copy), v30 (copy), v24 (ref), v22 (ref), v21 (ref), v29 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref), l_RootRigAttachment_0 (ref), l_AlignOrientation_0 (copy), v28 (ref), v20 (ref), l_RunService_0 (copy), v102 (copy)
    if v23 == false then
        return false;
    elseif tick() - v25 < 0.5 then
        return false;
    else
        local v105 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
        local l_HumanoidRootPart_1 = v105:WaitForChild("HumanoidRootPart");
        local _ = l_HumanoidRootPart_1:WaitForChild("RootRigAttachment");
        local l_Humanoid_1 = v105:WaitForChild("Humanoid");
        local l_CFrame_0 = l_HumanoidRootPart_1.CFrame;
        local v110 = workspace:Raycast(l_CFrame_0.Position, l_CFrame_0.LookVector * 5, v30);
        if v110 == nil then
            return false;
        elseif v110.Instance == nil then
            return false;
        else
            local l_Instance_5 = v110.Instance;
            if (l_Instance_5 ~= nil and not (l_Instance_5.CanCollide == false) and l_Instance_5.Transparency <= 1) == false then
                return false;
            elseif v110.Normal == nil then
                return false;
            else
                l_Instance_5 = v110.Normal;
                if (l_Instance_5 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_5))) <= 0.2617993877991494) == false then
                    return false;
                elseif v110.Position == nil then
                    return false;
                else
                    if v24 then
                        v22 = math.clamp(v22 + tick() - v25, 0, 10);
                    end;
                    if v22 <= 0 then
                        return;
                    else
                        v21 = true;
                        v29 = v110.Normal;
                        local v112 = CFrame.new(v110.Position + v110.Normal, v110.Position);
                        v105:PivotTo(v112);
                        if l_LinearVelocity_0.Parent ~= l_HumanoidRootPart_0 then
                            l_LinearVelocity_0.Parent = l_HumanoidRootPart_0;
                            l_LinearVelocity_0.Attachment0 = l_RootRigAttachment_0;
                            l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, 0, 0);
                        end;
                        if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                            l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                        end;
                        l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                        if v112 then
                            l_AlignOrientation_0.CFrame = v112;
                        end;
                        v28 = l_Humanoid_1.AutoRotate;
                        l_Humanoid_1.AutoRotate = false;
                        if v20 then
                            v20:Disconnect();
                        end;
                        v20 = l_RunService_0.Heartbeat:Connect(v102);
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
v0.DeActivateClimb = function(_) --[[ Line: 348 ]] --[[ Name: DeActivateClimb ]]
    -- upvalues: v21 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (ref), l_AlignOrientation_0 (copy), v25 (ref), l_Humanoid_0 (ref), v28 (ref), v33 (copy), v20 (ref), l_RunService_0 (copy), v22 (ref), v41 (copy)
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
    v20 = l_RunService_0.Heartbeat:Connect(function(v114) --[[ Line: 356 ]]
        -- upvalues: v22 (ref), v41 (ref), v20 (ref), v21 (ref)
        v22 = v22 + v114;
        v41.Progress.Percentage.Value = v22 / 10 * 100;
        if v22 >= 10 then
            v20:Disconnect();
            v22 = 10;
        end;
        if v41.Progress.Percentage.Value >= 100 and v21 == false then
            v41.Parent = nil;
        end;
    end);
end;
v0.CanClimb = function(_) --[[ Line: 372 ]] --[[ Name: CanClimb ]]
    -- upvalues: v23 (ref)
    return v23;
end;
v0.EnableClimb = function(_) --[[ Line: 375 ]] --[[ Name: EnableClimb ]]
    -- upvalues: v23 (ref)
    v23 = true;
end;
v0.DisableClimb = function(_) --[[ Line: 378 ]] --[[ Name: DisableClimb ]]
    -- upvalues: v23 (ref)
    v23 = false;
end;
v0.CanClimbStaminaRegen = function(_) --[[ Line: 382 ]] --[[ Name: CanClimbStaminaRegen ]]
    -- upvalues: v24 (ref)
    return v24;
end;
v0.EnableClimbStaminaRegen = function(_) --[[ Line: 385 ]] --[[ Name: EnableClimbStaminaRegen ]]
    -- upvalues: v24 (ref), v25 (ref)
    v24 = true;
    v25 = tick();
end;
v0.DisableClimbStaminaRegen = function(_) --[[ Line: 389 ]] --[[ Name: DisableClimbStaminaRegen ]]
    -- upvalues: v24 (ref)
    v24 = false;
end;
v0.GetClimbMaxStamina = function(_) --[[ Line: 393 ]] --[[ Name: GetClimbMaxStamina ]]
    return 10;
end;
v0.GetClimbCurrentStamina = function(_) --[[ Line: 396 ]] --[[ Name: GetClimbCurrentStamina ]]
    -- upvalues: v22 (ref)
    return v22;
end;
v0.EnableMobile = function(_) --[[ Line: 400 ]] --[[ Name: EnableMobile ]]
    -- upvalues: v19 (ref)
    v19 = true;
end;
v0.DisableMobile = function(_) --[[ Line: 404 ]] --[[ Name: DisableMobile ]]
    -- upvalues: v19 (ref)
    v19 = false;
end;
v33.Changed:Connect(function() --[[ Line: 408 ]]
    -- upvalues: v33 (copy), v34 (copy), v35 (copy), v36 (copy), v38 (copy), v37 (copy), v39 (copy)
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
l_LocalPlayer_0.CharacterAdded:Connect(function(v125) --[[ Line: 444 ]]
    -- upvalues: v12 (ref), l_HumanoidRootPart_0 (ref), l_RootRigAttachment_0 (ref), l_Humanoid_0 (ref), l_Head_0 (ref)
    v12 = v125;
    l_HumanoidRootPart_0 = v12:WaitForChild("HumanoidRootPart");
    l_RootRigAttachment_0 = l_HumanoidRootPart_0:WaitForChild("RootRigAttachment");
    l_Humanoid_0 = v12:WaitForChild("Humanoid");
    l_Head_0 = v12:WaitForChild("Head");
end);
return v0;