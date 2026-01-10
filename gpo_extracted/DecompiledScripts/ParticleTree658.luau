local v0 = Random.new(1029410295159813);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy)
    return (setmetatable({
        WindOffset = v0:NextNumber(0, 1000000), 
        Root = v2:IsA("Bone") and v2 or nil, 
        RootPart = v3, 
        RootWorldToLocal = v2.WorldCFrame:ToObjectSpace(v2.CFrame), 
        BoneTotalLength = 0, 
        DistanceFromCamera = 100, 
        Particles = {}, 
        LocalCFrame = v2.WorldCFrame, 
        LocalGravity = v2.CFrame:PointToWorldSpace(v4).Unit * v4.Magnitude, 
        Force = Vector3.new(0, 0, 0, 0), 
        RestGravity = Vector3.new(-0, -1, -0, -0), 
        ObjectMove = Vector3.new(0, 0, 0, 0), 
        ObjectPreviousPosition = Vector3.new(0, 0, 0, 0)
    }, v1));
end;
return v1;