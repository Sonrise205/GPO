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
local v16 = {
    diameter = 120, 
    padding = 4, 
    count = 64, 
    size = 1024
};
local v17 = false;
local v18 = nil;
local v19 = false;
local v20 = 0;
local v21 = true;
local v22 = true;
local v23 = 0;
local v24 = 0;
local v25 = 0;
local v26 = 0;
local v27 = nil;
local v28 = Vector3.new();
local v29 = RaycastParams.new();
v29.FilterType = l_Whitelist_0;
v29.FilterDescendantsInstances = v6;
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
local v32 = Instance.new("IntValue", script);
local v33 = l_Humanoid_0:LoadAnimation(script:WaitForChild("LedgeClimb"));
local v34 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbUp"));
local v35 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbDown"));
local v36 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbLeft"));
local v37 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbRight"));
local v38 = l_Humanoid_0:LoadAnimation(script:WaitForChild("ClimbIdle"));
local v39 = require(script.ConfigReader);
local v40 = script.BillboardGui:Clone();
v40.ImageLabel.ImageLabel.ImageRectSize = Vector2.new(v39.GetSize(v16));
local function _(v41) --[[ Line: 97 ]] --[[ Name: isInstanceClimbable ]]
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
local function _(v43) --[[ Line: 105 ]] --[[ Name: isVectorAngleClimbable ]]
    if v43 == nil then
        return false;
    elseif math.abs((Vector3.new(0, 1, 0, 0):Dot(v43))) > 0.2617993877991494 then
        return false;
    else
        return true;
    end;
end;
local function _() --[[ Line: 112 ]] --[[ Name: enableLevitationForce ]]
    -- upvalues: l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (copy), l_RootRigAttachment_0 (copy)
    if l_LinearVelocity_0.Parent == l_HumanoidRootPart_0 then
        return;
    else
        l_LinearVelocity_0.Parent = l_HumanoidRootPart_0;
        l_LinearVelocity_0.Attachment0 = l_RootRigAttachment_0;
        l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, 0, 0);
        return;
    end;
end;
local function _() --[[ Line: 119 ]] --[[ Name: disableLevitationForce ]]
    -- upvalues: l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (copy)
    if l_LinearVelocity_0.Parent == l_HumanoidRootPart_0 then
        l_LinearVelocity_0.Parent = nil;
        l_LinearVelocity_0.Attachment0 = nil;
    end;
end;
local function _(v47) --[[ Line: 126 ]] --[[ Name: enableOrientationAlignment ]]
    -- upvalues: l_AlignOrientation_0 (copy), l_HumanoidRootPart_0 (copy), l_RootRigAttachment_0 (copy)
    if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
    end;
    l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
    if v47 then
        l_AlignOrientation_0.CFrame = v47;
    end;
end;
local function _() --[[ Line: 136 ]] --[[ Name: disableOrientationAlignment ]]
    -- upvalues: l_AlignOrientation_0 (copy), l_HumanoidRootPart_0 (copy)
    if l_AlignOrientation_0.Parent == l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = nil;
        l_AlignOrientation_0.Attachment0 = nil;
    end;
end;
local function v104(_) --[[ Line: 143 ]] --[[ Name: ClimbMovementHandler ]]
    -- upvalues: v19 (ref), v18 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (copy), l_AlignOrientation_0 (copy), v25 (ref), v20 (ref), v0 (copy), l_Humanoid_0 (copy), v17 (ref), l_UserInputService_0 (copy), l_W_0 (copy), l_S_0 (copy), l_D_0 (copy), l_A_0 (copy), v40 (copy), v39 (copy), v16 (copy), v12 (copy), v29 (copy), v28 (ref), l_RootRigAttachment_0 (copy), v24 (ref), v32 (copy), v26 (ref)
    local v51 = 0;
    if v19 == false then
        return v18:Disconnect();
    elseif l_LinearVelocity_0.Parent ~= l_HumanoidRootPart_0 then
        return;
    elseif l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
        return;
    else
        if tick() - v25 >= 1 then
            v20 = v20 - 1;
            v25 = tick();
        end;
        if v20 <= 0 then
            return v0:DeActivateClimb();
        else
            local l_MoveDirection_0 = l_Humanoid_0.MoveDirection;
            local l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
            local l_RightVector_0 = l_HumanoidRootPart_0.CFrame.RightVector;
            local v55 = math.round((l_LookVector_0:Dot(l_MoveDirection_0)));
            local v56 = math.round((l_RightVector_0:Dot(l_MoveDirection_0)));
            if not v17 then
                v55 = l_UserInputService_0:IsKeyDown(l_W_0) and 1 or l_UserInputService_0:IsKeyDown(l_S_0) and -1 or 0;
                v56 = l_UserInputService_0:IsKeyDown(l_D_0) and 1 or l_UserInputService_0:IsKeyDown(l_A_0) and -1 or 0;
            end;
            local v57 = l_HumanoidRootPart_0.CFrame.UpVector * v55;
            local v58 = l_HumanoidRootPart_0.CFrame.RightVector * v56;
            local v59 = v58 + v57;
            l_LinearVelocity_0.VectorVelocity = v59 * 6;
            local v60 = false;
            local v61 = v20 / 10;
            local l_new_0 = Vector2.new;
            local l_ImageLabel_0 = v40.ImageLabel.ImageLabel;
            l_ImageLabel_0.ImageRectSize = l_new_0(v39.GetSize(v16));
            local v64 = v61 * 64;
            l_ImageLabel_0.ImageRectOffset = l_new_0(v39.GetOffset(v16, v64));
            l_ImageLabel_0.ImageColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(85, 255, 127), v61);
            v40.Parent = l_HumanoidRootPart_0;
            if math.abs(v55) > 0 or math.abs(v56) > 0 then
                local l_Position_0 = l_HumanoidRootPart_0.Position;
                local v66 = v59 * v12:GetExtentsSize().X / 2;
                local v67 = workspace:Raycast(l_Position_0, v66, v29);
                if v67 and v67.Instance and v67.Normal then
                    local l_Instance_0 = v67.Instance;
                    if l_Instance_0 ~= nil and not (l_Instance_0.CanCollide == false) and l_Instance_0.Transparency <= 1 then
                        l_Instance_0 = v67.Normal;
                        if l_Instance_0 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_0))) <= 0.2617993877991494 and v28 ~= v67.Normal and v67.Instance.Size.X > 3 and v67.Instance.Size.Y > 3 and v67.Instance.Size.Z > 3 then
                            v28 = v67.Normal;
                            local v69 = CFrame.new(v67.Position + v67.Normal, v67.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v69 then
                                l_AlignOrientation_0.CFrame = v69;
                            end;
                        end;
                    end;
                elseif math.abs(v55) > 0 or math.abs(v56) > 0 then
                    local l_Position_1 = l_HumanoidRootPart_0.Position;
                    local v71 = l_LookVector_0 * 5 * 3;
                    local v72 = workspace:Raycast(l_Position_1, v71, v29);
                    if v72 and v72.Instance and v72.Normal then
                        local l_Magnitude_0 = (l_HumanoidRootPart_0.Position + l_LookVector_0 * -v12:GetExtentsSize().Z / 2 - v72.Position).Magnitude;
                        if v12:GetExtentsSize().Z / 2 + 0.2 < l_Magnitude_0 then
                            l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * (l_Magnitude_0 - v12:GetExtentsSize().Z / 2 - 1.5);
                        elseif l_Magnitude_0 < v12:GetExtentsSize().Z / 2 + 0.2 then
                            l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity - l_LookVector_0 * (l_Magnitude_0 + v12:GetExtentsSize().Z / 2 + 1.5);
                        end;
                        local l_Instance_1 = v72.Instance;
                        if l_Instance_1 ~= nil and not (l_Instance_1.CanCollide == false) and l_Instance_1.Transparency <= 1 then
                            l_Instance_1 = v72.Normal;
                            if l_Instance_1 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_1))) <= 0.2617993877991494 and v28 ~= v72.Normal and v72.Instance.Size.X > 3 and v72.Instance.Size.Y > 3 and v72.Instance.Size.Z > 3 then
                                v28 = v72.Normal;
                                local v75 = CFrame.new(v72.Position + v72.Normal, v72.Position);
                                if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                    l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                                end;
                                l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                                if v75 then
                                    l_AlignOrientation_0.CFrame = v75;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if (math.abs(v55) > 0 or math.abs(v56) > 0) and v60 == false and tick() - v24 > 0.2 then
                local v76 = l_HumanoidRootPart_0.Position + v58 * v12:GetExtentsSize().X / 15 + l_LookVector_0 * v12:GetExtentsSize().X;
                local v77 = (l_HumanoidRootPart_0.Position + v58 * v12:GetExtentsSize().X / 16 - v76).Unit * v12:GetExtentsSize().X;
                local v78 = workspace:Raycast(v76, v77, v29);
                if v78 and v78.Instance and v78.Normal then
                    local l_Instance_2 = v78.Instance;
                    if l_Instance_2 ~= nil and not (l_Instance_2.CanCollide == false) and l_Instance_2.Transparency <= 1 then
                        l_Instance_2 = v78.Normal;
                        if l_Instance_2 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_2))) <= 0.2617993877991494 and v28 ~= v78.Normal and v78.Instance.Size.X > 3 and v78.Instance.Size.Y > 3 and v78.Instance.Size.Z > 3 then
                            v60 = true;
                            v24 = tick();
                            v28 = v78.Normal;
                            local v80 = CFrame.new(v78.Position + v78.Normal, v78.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v80 then
                                l_AlignOrientation_0.CFrame = v80;
                            end;
                        end;
                    end;
                end;
            end;
            if (math.abs(v55) > 0 or math.abs(v56) > 0) and v60 == false and tick() - v24 > 0.2 then
                local v81 = l_HumanoidRootPart_0.Position + v58 * v12:GetExtentsSize().X / 15;
                local v82 = (l_HumanoidRootPart_0.Position - v58 * v12:GetExtentsSize().X / 16 + l_LookVector_0 * v12:GetExtentsSize().X - v81).Unit * v12:GetExtentsSize().X;
                local v83 = workspace:Raycast(v81, v82, v29);
                if v83 and v83.Instance and v83.Normal then
                    local l_Instance_3 = v83.Instance;
                    if l_Instance_3 ~= nil and not (l_Instance_3.CanCollide == false) and l_Instance_3.Transparency <= 1 then
                        l_Instance_3 = v83.Normal;
                        if l_Instance_3 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_3))) <= 0.2617993877991494 and v28 ~= v83.Normal and v83.Instance.Size.X > 3 and v83.Instance.Size.Y > 3 and v83.Instance.Size.Z > 3 then
                            v60 = true;
                            v24 = tick();
                            v28 = v83.Normal;
                            local v85 = CFrame.new(v83.Position + v83.Normal, v83.Position);
                            if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                                l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                            end;
                            l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                            if v85 then
                                l_AlignOrientation_0.CFrame = v85;
                            end;
                        end;
                    end;
                end;
            end;
            local l_Position_2 = l_HumanoidRootPart_0.Position;
            local v87 = l_LookVector_0 * 5 * 3;
            local v88 = workspace:Raycast(l_Position_2, v87, v29);
            if v88 and v88.Instance and v88.Normal then
                local l_Magnitude_1 = (l_HumanoidRootPart_0.Position + l_LookVector_0 * -v12:GetExtentsSize().Z / 2 - v88.Position).Magnitude;
                if v12:GetExtentsSize().Z / 2 + 0.2 < l_Magnitude_1 then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * (l_Magnitude_1 - v12:GetExtentsSize().Z / 2 - 1.5);
                elseif l_Magnitude_1 < v12:GetExtentsSize().Z / 2 + 0.2 then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity - l_LookVector_0 * (l_Magnitude_1 + v12:GetExtentsSize().Z / 2 + 1.5);
                end;
            end;
            if v55 == -1 then
                local l_Position_3 = l_HumanoidRootPart_0.Position;
                local v91 = v57 * v12:GetExtentsSize().Y / 2;
                local v92 = workspace:Raycast(l_Position_3, v91, v29);
                if v92 and v92.Instance and v92.Normal then
                    v0:DeActivateClimb();
                end;
            end;
            local v93 = l_HumanoidRootPart_0.Position - l_LookVector_0 * 5 - v57 * v12:GetExtentsSize().Y / 3;
            local v94 = l_LookVector_0 * 5 * 4;
            local v95 = workspace:Raycast(v93, v94, v29);
            if not v95 or not v95.Instance or not v95.Normal then
                v0:DeActivateClimb();
            end;
            local v96 = false;
            if v55 == 1 then
                local v97 = l_HumanoidRootPart_0.Position - l_LookVector_0 * 5 + v57 * v12:GetExtentsSize().Y / 3.5;
                local v98 = 2 * l_LookVector_0 * 5;
                local v99 = workspace:Raycast(v97, v98, v29);
                if not v99 or not v99.Instance or not v99.Normal then
                    l_LinearVelocity_0.VectorVelocity = l_LinearVelocity_0.VectorVelocity + l_LookVector_0 * 6;
                    v96 = true;
                end;
            end;
            if v96 == true and v19 then
                v51 = 1;
            elseif v19 then
                v51 = v55 == 1 and 2 or v55 == -1 and 3 or v56 == 1 and 4 or v56 == -1 and 5 or 6;
            end;
            v32.Value = v51;
            if v19 and tick() - v26 > 1 then
                v26 = tick();
                if l_HumanoidRootPart_0 then
                    local l_Position_4 = l_HumanoidRootPart_0.Position;
                    local v101 = l_LookVector_0 * 5;
                    local v102 = workspace:Raycast(l_Position_4, v101, v29);
                    if v102 and v102.Instance and v102.Normal then
                        local l_Instance_4 = v102.Instance;
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
v0.IsClimbing = function(_) --[[ Line: 322 ]] --[[ Name: IsClimbing ]]
    -- upvalues: v19 (ref)
    return v19;
end;
v0.ActivateClimb = function(_) --[[ Line: 325 ]] --[[ Name: ActivateClimb ]]
    -- upvalues: v21 (ref), v23 (ref), l_LocalPlayer_0 (copy), v29 (copy), v22 (ref), v20 (ref), v19 (ref), v28 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (copy), l_RootRigAttachment_0 (copy), l_AlignOrientation_0 (copy), v27 (ref), v18 (ref), l_RunService_0 (copy), v104 (copy)
    if v21 == false then
        return false;
    elseif tick() - v23 < 0.5 then
        return false;
    else
        local v107 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
        local l_HumanoidRootPart_1 = v107:WaitForChild("HumanoidRootPart");
        local _ = l_HumanoidRootPart_1:WaitForChild("RootRigAttachment");
        local l_Humanoid_1 = v107:WaitForChild("Humanoid");
        local l_CFrame_0 = l_HumanoidRootPart_1.CFrame;
        local v112 = workspace:Raycast(l_CFrame_0.Position, l_CFrame_0.LookVector * 5, v29);
        if v112 == nil then
            return false;
        elseif v112.Instance == nil then
            return false;
        else
            local l_Instance_5 = v112.Instance;
            if (l_Instance_5 ~= nil and not (l_Instance_5.CanCollide == false) and l_Instance_5.Transparency <= 1) == false then
                return false;
            elseif v112.Normal == nil then
                return false;
            else
                l_Instance_5 = v112.Normal;
                if (l_Instance_5 ~= nil and math.abs((Vector3.new(0, 1, 0, 0):Dot(l_Instance_5))) <= 0.2617993877991494) == false then
                    return false;
                elseif v112.Position == nil then
                    return false;
                else
                    if v22 then
                        v20 = math.clamp(v20 + math.floor(tick() - v23), 0, 10);
                    end;
                    if v20 <= 0 then
                        return;
                    else
                        v19 = true;
                        v28 = v112.Normal;
                        local v114 = CFrame.new(v112.Position + v112.Normal, v112.Position);
                        v107:PivotTo(v114);
                        if l_LinearVelocity_0.Parent ~= l_HumanoidRootPart_0 then
                            l_LinearVelocity_0.Parent = l_HumanoidRootPart_0;
                            l_LinearVelocity_0.Attachment0 = l_RootRigAttachment_0;
                            l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, 0, 0);
                        end;
                        if l_AlignOrientation_0.Parent ~= l_HumanoidRootPart_0 then
                            l_AlignOrientation_0.Parent = l_HumanoidRootPart_0;
                        end;
                        l_AlignOrientation_0.Attachment0 = l_RootRigAttachment_0;
                        if v114 then
                            l_AlignOrientation_0.CFrame = v114;
                        end;
                        v27 = l_Humanoid_1.AutoRotate;
                        l_Humanoid_1.AutoRotate = false;
                        v18 = l_RunService_0.Heartbeat:Connect(v104);
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
v0.DeActivateClimb = function(_) --[[ Line: 354 ]] --[[ Name: DeActivateClimb ]]
    -- upvalues: v19 (ref), l_LinearVelocity_0 (copy), l_HumanoidRootPart_0 (copy), l_AlignOrientation_0 (copy), v23 (ref), l_Humanoid_0 (copy), v27 (ref), v32 (copy), v40 (copy)
    v19 = false;
    if l_LinearVelocity_0.Parent == l_HumanoidRootPart_0 then
        l_LinearVelocity_0.Parent = nil;
        l_LinearVelocity_0.Attachment0 = nil;
    end;
    if l_AlignOrientation_0.Parent == l_HumanoidRootPart_0 then
        l_AlignOrientation_0.Parent = nil;
        l_AlignOrientation_0.Attachment0 = nil;
    end;
    v23 = tick();
    l_Humanoid_0.AutoRotate = v27;
    v32.Value = 0;
    v40.Parent = nil;
end;
v0.CanClimb = function(_) --[[ Line: 365 ]] --[[ Name: CanClimb ]]
    -- upvalues: v21 (ref)
    return v21;
end;
v0.EnableClimb = function(_) --[[ Line: 368 ]] --[[ Name: EnableClimb ]]
    -- upvalues: v21 (ref)
    v21 = true;
end;
v0.DisableClimb = function(_) --[[ Line: 371 ]] --[[ Name: DisableClimb ]]
    -- upvalues: v21 (ref)
    v21 = false;
end;
v0.CanClimbStaminaRegen = function(_) --[[ Line: 375 ]] --[[ Name: CanClimbStaminaRegen ]]
    -- upvalues: v22 (ref)
    return v22;
end;
v0.EnableClimbStaminaRegen = function(_) --[[ Line: 378 ]] --[[ Name: EnableClimbStaminaRegen ]]
    -- upvalues: v22 (ref), v23 (ref)
    v22 = true;
    v23 = tick();
end;
v0.DisableClimbStaminaRegen = function(_) --[[ Line: 382 ]] --[[ Name: DisableClimbStaminaRegen ]]
    -- upvalues: v22 (ref)
    v22 = false;
end;
v0.GetClimbMaxStamina = function(_) --[[ Line: 386 ]] --[[ Name: GetClimbMaxStamina ]]
    return 10;
end;
v0.GetClimbCurrentStamina = function(_) --[[ Line: 389 ]] --[[ Name: GetClimbCurrentStamina ]]
    -- upvalues: v20 (ref)
    return v20;
end;
v0.EnableMobile = function(_) --[[ Line: 393 ]] --[[ Name: EnableMobile ]]
    -- upvalues: v17 (ref)
    v17 = true;
end;
v0.DisableMobile = function(_) --[[ Line: 397 ]] --[[ Name: DisableMobile ]]
    -- upvalues: v17 (ref)
    v17 = false;
end;
v32.Changed:Connect(function() --[[ Line: 401 ]]
    -- upvalues: v32 (copy), v33 (copy), v34 (copy), v35 (copy), v37 (copy), v36 (copy), v38 (copy)
    if v32 ~= nil then
        if v32.Value == 1 then
            v33:Play();
        else
            v33:Stop();
        end;
        if v32.Value == 2 then
            v34:Play();
        else
            v34:Stop();
        end;
        if v32.Value == 3 then
            v35:Play(0.100000001, 1, -1);
        else
            v35:Stop();
        end;
        if v32.Value == 4 then
            v37:Play();
        else
            v37:Stop();
        end;
        if v32.Value == 5 then
            v36:Play();
        else
            v36:Stop();
        end;
        if v32.Value == 6 then
            v38:Play();
            return;
        else
            v38:Stop();
        end;
    end;
end);
return v0;