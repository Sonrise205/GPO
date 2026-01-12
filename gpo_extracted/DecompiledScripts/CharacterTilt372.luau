local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v2 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local l_Humanoid_0 = v2:WaitForChild("Humanoid");
local l_HumanoidRootPart_0 = v2:WaitForChild("HumanoidRootPart");
local l_LowerTorso_0 = v2:WaitForChild("LowerTorso");
local v6 = nil;
local v7 = nil;
local l_abs_0 = math.abs;
local l_clamp_0 = math.clamp;
local l_max_0 = math.max;
v6 = if l_Humanoid_0.RigType == Enum.HumanoidRigType.R15 then l_LowerTorso_0.Root else l_HumanoidRootPart_0.RootJoint;
v7 = v6.C0;
l_RunService_0.Heartbeat:Connect(function(v11) --[[ Line: 32 ]]
    -- upvalues: v6 (ref), v2 (ref), l_Humanoid_0 (ref), l_HumanoidRootPart_0 (ref), l_abs_0 (copy), l_clamp_0 (copy), l_max_0 (copy), v7 (ref)
    if v6 == nil or v2 == nil or l_Humanoid_0 == nil then
        return;
    elseif v2 and v2.Parent == workspace.Ragdolls or l_Humanoid_0:GetState() == Enum.HumanoidStateType.Physics then
        return;
    else
        local l_MoveDirection_0 = l_Humanoid_0.MoveDirection;
        if l_Humanoid_0 and (l_Humanoid_0.SeatPart ~= nil or _G.canuse == false) then
            l_MoveDirection_0 = Vector3.new(0, 0, 0, 0);
        end;
        local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
        local v14 = l_CFrame_0:VectorToObjectSpace(l_MoveDirection_0);
        local v15 = l_CFrame_0:VectorToObjectSpace(l_HumanoidRootPart_0.Velocity) * 0.008;
        v15 = Vector3.new(l_clamp_0(l_abs_0(v15.X), 0, 1), 0, (l_clamp_0(l_abs_0(v15.Z), 0, 1)));
        local l_v2_Scale_0 = v2:GetScale();
        local v17 = v14.X * v15.X / l_v2_Scale_0;
        local v18 = {
            l_max_0(0, v14.Z * v15.Z / l_v2_Scale_0), 
            0, 
            -v17
        };
        local l_C0_0 = v6.C0;
        local l_Y_0 = l_C0_0.Y;
        local v21 = l_C0_0:Lerp(v7 * CFrame.Angles(table.unpack(v18)), v11 * 15);
        v6.C0 = v21 - v21.Y * Vector3.new(0, 1, 0, 0) + Vector3.new(0, 1, 0, 0) * l_Y_0;
        return;
    end;
end);
l_LocalPlayer_0.CharacterAdded:Connect(function(v22) --[[ Line: 73 ]]
    -- upvalues: v2 (ref), l_Humanoid_0 (ref), l_HumanoidRootPart_0 (ref), v6 (ref), v7 (ref)
    v2 = v22;
    l_Humanoid_0 = v2:WaitForChild("Humanoid");
    l_HumanoidRootPart_0 = v2:WaitForChild("HumanoidRootPart");
    v6 = nil;
    v7 = nil;
    if l_Humanoid_0.RigType == Enum.HumanoidRigType.R15 then
        v6 = v2:WaitForChild("LowerTorso").Root;
    else
        v6 = l_HumanoidRootPart_0.RootJoint;
    end;
    v7 = v6.C0 - v6.C0.Y * Vector3.new(0, 1, 0, 0);
end);