local v0 = {
    joint = {}
};
v0.joint.new = function(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: new ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v1;
    l_Weld_0.Part1 = v2;
    if v3 then
        l_Weld_0.C0 = v3;
        l_Weld_0.C1 = v4 or CFrame.new();
    else
        l_Weld_0.C0 = CFrame.new();
        l_Weld_0.C1 = v2.CFrame:toObjectSpace(v1.CFrame);
    end;
    l_Weld_0.Parent = v2;
    return l_Weld_0;
end;
v0.joint.combine = function(v6, v7) --[[ Line: 22 ]] --[[ Name: combine ]]
    -- upvalues: v0 (copy)
    for _, v9 in (v6:GetChildren()) do
        if (v9:IsA("BasePart") or v9:IsA("UnionOperation")) and v9 ~= v7 then
            v0.joint.new(v9, v7);
            v9.Anchored = false;
        end;
        v7.Anchored = false;
    end;
end;
return v0;