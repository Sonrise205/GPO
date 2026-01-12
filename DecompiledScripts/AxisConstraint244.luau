local function _(v0) --[[ Line: 1 ]] --[[ Name: SafeUnit ]]
    if v0.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v0.Unit;
    end;
end;
return function(v2, v3, v4, v5) --[[ Line: 11 ]]
    local v6 = v5:Inverse() * v3;
    local l_X_0 = v6.X;
    local l_Y_0 = v6.Y;
    local l_Z_0 = v6.Z;
    local l_XAxisLimits_0 = v2.XAxisLimits;
    local l_YAxisLimits_0 = v2.YAxisLimits;
    local l_ZAxisLimits_0 = v2.ZAxisLimits;
    local v13 = v2.AxisLocked[1] and 0 or 1;
    local v14 = v2.AxisLocked[2] and 0 or 1;
    local v15 = v2.AxisLocked[3] and 0 or 1;
    if l_XAxisLimits_0.Min == -1e999 and l_XAxisLimits_0.Max == 1e999 and l_YAxisLimits_0.Min == -1e999 and l_YAxisLimits_0.Max == 1e999 and l_ZAxisLimits_0.Min == -1e999 and l_ZAxisLimits_0.Max == 1e999 then
        if v13 == 1 and v14 == 1 and v15 == 1 then
            return v3;
        else
            return v5 * Vector3.new(l_X_0 * v13, l_Y_0 * v14, l_Z_0 * v15);
        end;
    else
        local v16 = l_XAxisLimits_0.Min + v2.Radius;
        local v17 = v16 <= l_XAxisLimits_0.Max - v2.Radius and l_XAxisLimits_0.Max - v2.Radius or v16;
        local v18 = l_YAxisLimits_0.Min + v2.Radius;
        local v19 = v18 <= l_YAxisLimits_0.Max - v2.Radius and l_YAxisLimits_0.Max - v2.Radius or v18;
        local v20 = l_ZAxisLimits_0.Min + v2.Radius;
        local v21 = v20 <= l_ZAxisLimits_0.Max - v2.Radius and l_ZAxisLimits_0.Max - v2.Radius or v20;
        l_X_0 = l_X_0 < v16 and v16 or v17 < l_X_0 and v17 or l_X_0;
        l_Y_0 = l_Y_0 < v18 and v18 or v19 < l_Y_0 and v19 or l_Y_0;
        l_Z_0 = l_Z_0 < v20 and v20 or v21 < l_Z_0 and v21 or l_Z_0;
        l_X_0 = l_X_0 * v13;
        l_Y_0 = l_Y_0 * v14;
        l_Z_0 = l_Z_0 * v15;
        v3 = v5 * Vector3.new(l_X_0, l_Y_0, l_Z_0);
        local l_RightVector_0 = v5.RightVector;
        local l_UpVector_0 = v5.UpVector;
        local l_LookVector_0 = v5.LookVector;
        local v25 = v3 - v4;
        local v26 = if v25.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v25.Unit;
        if l_X_0 ~= v6.X then
            v2:ClipVelocity(v3, l_RightVector_0:Dot(v26) < 0 and -l_RightVector_0 or l_RightVector_0);
        end;
        if l_Y_0 ~= v6.Y then
            v2:ClipVelocity(v3, l_UpVector_0:Dot(v26) < 0 and -l_UpVector_0 or l_UpVector_0);
        end;
        if l_Z_0 ~= v6.Z then
            v2:ClipVelocity(v3, l_LookVector_0:Dot(v26) > 0 and -l_LookVector_0 or l_LookVector_0);
        end;
        return v3;
    end;
end;