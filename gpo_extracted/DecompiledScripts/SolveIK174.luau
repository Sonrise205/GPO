return function(v0, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: solveIK ]]
    local v4 = v0:pointToObjectSpace(v1);
    local l_unit_0 = v4.unit;
    local l_magnitude_0 = v4.magnitude;
    local v7 = Vector3.new(0, 0, -1, 0):Cross(l_unit_0);
    local v8 = math.acos(-l_unit_0.Z);
    local v9 = v0 * CFrame.fromAxisAngle(v7, v8);
    if l_magnitude_0 < math.max(v3, v2) - math.min(v3, v2) then
        return v9 * CFrame.new(0, 0, math.max(v3, v2) - math.min(v3, v2) - l_magnitude_0), -1.5707963267948966, 3.141592653589793;
    elseif v2 + v3 < l_magnitude_0 then
        return v9, 1.5707963267948966, 0;
    else
        local v10 = -math.acos((-(v3 * v3) + v2 * v2 + l_magnitude_0 * l_magnitude_0) / (2 * v2 * l_magnitude_0));
        local v11 = math.acos((v3 * v3 - v2 * v2 + l_magnitude_0 * l_magnitude_0) / (2 * v3 * l_magnitude_0));
        return v9, v10 + 1.5707963267948966, v11 - v10;
    end;
end;