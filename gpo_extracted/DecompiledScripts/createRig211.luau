local v0 = {
    [Enum.HumanoidRigType.R15] = {
        "LeftHand", 
        "LeftWrist", 
        "LeftLowerArm", 
        "LeftElbow", 
        "LeftUpperArm", 
        "LeftShoulder", 
        "RightHand", 
        "RightWrist", 
        "RightLowerArm", 
        "RightElbow", 
        "RightUpperArm", 
        "RightShoulder", 
        "UpperTorso", 
        "Head", 
        "Neck", 
        "Humanoid"
    }, 
    [Enum.HumanoidRigType.R6] = {
        "Left Arm", 
        "Right Arm", 
        "Head", 
        "Torso", 
        "Left Shoulder", 
        "Right Shoulder", 
        "Neck", 
        "Humanoid"
    }
};
for v1, v2 in next, v0 do
    local v3 = {};
    for v4 = 1, #v2 do
        v3[v2[v4]] = true;
    end;
    v0[v1] = v3;
end;
v0.new = function(_, v6) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local l_Archivable_0 = v6.Archivable;
    v6.Archivable = true;
    local v8 = v6:Clone();
    local l_Humanoid_0 = v8:WaitForChild("Humanoid");
    local v10 = v0[l_Humanoid_0.RigType];
    for v11, _ in next, v10 do
        while not v8:FindFirstChild(v11, true) do
            v8.DescendantAdded:Wait();
        end;
    end;
    v10["Body Colors"] = v8:FindFirstChild("Body Colors");
    v10.Shirt = v8:FindFirstChild("Shirt");
    local l_v8_Descendants_0 = v8:GetDescendants();
    for v14 = 1, #l_v8_Descendants_0 do
        if not v10[l_v8_Descendants_0[v14].Name] and not l_v8_Descendants_0[v14]:IsA("CharacterMesh") then
            l_v8_Descendants_0[v14]:Destroy();
        elseif l_v8_Descendants_0[v14]:IsA("BasePart") then
            l_v8_Descendants_0[v14].CanCollide = false;
            l_v8_Descendants_0[v14].Anchored = false;
        end;
    end;
    v8.Head.Anchored = true;
    v8.Head.Transparency = 1;
    if l_Humanoid_0.RigType == Enum.HumanoidRigType.R15 then
        v8.UpperTorso.Transparency = 1;
    else
        v8.Torso.Transparency = 1;
    end;
    l_Humanoid_0.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v8.Name = "viewModel";
    v6.Archivable = l_Archivable_0;
    return v8;
end;
return v0;