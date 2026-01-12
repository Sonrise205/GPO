return {
    Rig = function(_, v1, v2, v3, v4) --[[ Line: 3 ]] --[[ Name: Rig ]]
        local v5 = nil;
        local l_v1_FirstChild_0 = v1:FindFirstChild(v2);
        local v7 = script:FindFirstChild(v3):Clone();
        v7.Parent = v1;
        if v7:IsA("Model") then
            v5 = v7;
            v7 = v5.PrimaryPart;
        end;
        local l_Motor6D_0 = Instance.new("Motor6D");
        l_Motor6D_0.Part0 = l_v1_FirstChild_0;
        l_Motor6D_0.Part1 = v7;
        l_Motor6D_0.C0 = v7:GetAttribute("C0");
        l_Motor6D_0.C1 = v7:GetAttribute("C1");
        l_Motor6D_0.Name = v4 or "Motor6D";
        l_Motor6D_0.Parent = l_v1_FirstChild_0;
        return v5 or v7;
    end, 
    Align = function(_, v10, ...) --[[ Line: 31 ]] --[[ Name: Align ]]
        local v11, v12 = ...;
        if not v11 then
            v11 = {};
        end;
        if not v12 then
            v12 = {};
        end;
        local v13 = v10:FindFirstChildWhichIsA("AlignOrientation") or script.AlignOrientation:Clone();
        local v14 = v10:FindFirstChildWhichIsA("AlignPosition") or script.AlignPosition:Clone();
        for v15, v16 in next, v11 do
            v13[v15] = v16;
        end;
        for v17, v18 in next, v12 do
            v14[v17] = v18;
        end;
        v13.Attachment0 = v10.HumanoidRootPart.RootRigAttachment;
        v14.Attachment0 = v10.HumanoidRootPart.RootRigAttachment;
        v14.Parent = v10;
        v13.Parent = v10;
        return v14, v13;
    end
};