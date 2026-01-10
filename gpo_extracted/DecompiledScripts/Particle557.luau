local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        Bone = v1, 
        RestLength = 0, 
        Weight = 0.7, 
        ParentIndex = 0, 
        Transform = v1.WorldCFrame:ToObjectSpace(v2.WorldCFrame):Inverse(), 
        LocalTransform = v1.CFrame:ToObjectSpace(v2.CFrame):Inverse(), 
        RootTransform = v2.WorldCFrame:ToObjectSpace(v3.CFrame):Inverse(), 
        Radius = v4.Radius, 
        IsColliding = false, 
        TransformOffset = CFrame.identity, 
        LastTransformOffset = CFrame.identity, 
        LocalTransformOffset = CFrame.identity, 
        RestPosition = Vector3.new(0, 0, 0, 0), 
        BoneTransform = CFrame.identity, 
        CalculatedWorldCFrame = v1.WorldCFrame, 
        CalculatedWorldPosition = v1.WorldPosition, 
        Position = v1.WorldPosition, 
        LastPosition = v1.WorldPosition, 
        Anchored = false, 
        RecyclingBin = {}
    }, v0));
end;
return v0;