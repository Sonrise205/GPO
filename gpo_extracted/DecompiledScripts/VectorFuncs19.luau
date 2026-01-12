local v0 = require(script.Parent.Switch);
local _ = math.abs;
getNormalFromPartFace = function(v2, v3) --[[ Line: 5 ]] --[[ Name: getNormalFromPartFace ]]
    return v2.CFrame:VectorToWorldSpace(Vector3.FromNormalId(v3));
end;
normalVectorToFace = function(v4, v5) --[[ Line: 9 ]] --[[ Name: normalVectorToFace ]]
    local v6 = {
        Enum.NormalId.Front, 
        Enum.NormalId.Back, 
        Enum.NormalId.Bottom, 
        Enum.NormalId.Top, 
        Enum.NormalId.Left, 
        Enum.NormalId.Right
    };
    for _, v8 in ipairs(v6) do
        if getNormalFromPartFace(v4, v8):Dot(v5) > 0.999 then
            return v8;
        end;
    end;
    return nil;
end;
getTopLeftCorners = function(v9) --[[ Line: 28 ]] --[[ Name: getTopLeftCorners ]]
    local l_Size_0 = v9.Size;
    return {
        [Enum.NormalId.Front] = v9.CFrame * CFrame.new(l_Size_0.X / 2, l_Size_0.Y / 2, -l_Size_0.Z / 2), 
        [Enum.NormalId.Back] = v9.CFrame * CFrame.new(-l_Size_0.X / 2, l_Size_0.Y / 2, l_Size_0.Z / 2), 
        [Enum.NormalId.Right] = v9.CFrame * CFrame.new(l_Size_0.X / 2, l_Size_0.Y / 2, l_Size_0.Z / 2), 
        [Enum.NormalId.Left] = v9.CFrame * CFrame.new(-l_Size_0.X / 2, l_Size_0.Y / 2, -l_Size_0.Z / 2), 
        [Enum.NormalId.Bottom] = v9.CFrame * CFrame.new(l_Size_0.X / 2, -l_Size_0.Y / 2, l_Size_0.Z / 2), 
        [Enum.NormalId.Top] = v9.CFrame * CFrame.new(-l_Size_0.X / 2, l_Size_0.Y / 2, l_Size_0.Z / 2)
    };
end;
getRotationComponents = function(v11) --[[ Line: 40 ]] --[[ Name: getRotationComponents ]]
    local v12 = {
        v11:GetComponents()
    };
    table.remove(v12, 1);
    table.remove(v12, 2);
    table.remove(v12, 3);
    return v12;
end;
mapOffsetToFace = function(v13, v14, v15) --[[ Line: 49 ]] --[[ Name: mapOffsetToFace ]]
    -- upvalues: v0 (copy)
    local v16 = getRotationComponents(v13);
    return v0(v14)({
        X = v0(v15)({
            [{
                Enum.NormalId.Right, 
                Enum.NormalId.Left, 
                Enum.NormalId.Top, 
                Enum.NormalId.Bottom
            }] = CFrame.new(v13.Z, v13.Y, v13.X, unpack(v16)), 
            [{
                Enum.NormalId.Front, 
                Enum.NormalId.Back
            }] = v13
        }), 
        Y = v0(v15)({
            [{
                Enum.NormalId.Right, 
                Enum.NormalId.Left
            }] = CFrame.new(v13.Z, v13.Y, v13.X, unpack(v16)), 
            [{
                Enum.NormalId.Front, 
                Enum.NormalId.Back
            }] = v13, 
            [{
                Enum.NormalId.Top, 
                Enum.NormalId.Bottom
            }] = CFrame.new(v13.Y, v13.X, v13.Z, unpack(v16))
        })
    });
end;
return {
    normalVectorToFace = normalVectorToFace, 
    getTopLeftCorners = getTopLeftCorners, 
    mapOffsetToFace = mapOffsetToFace
};