--!native
local function _(v0) --[[ Line: 2 ]] --[[ Name: SafeUnit ]]
    if v0.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v0.Unit;
    end;
end;
local function _(v2, v3, v4, v5) --[[ Line: 10 ]] --[[ Name: solve ]]
    return v2 + v3 * math.clamp((v5 - v2):Dot(v3), -v4, v4);
end;
local function _(v7, v8, v9, v10) --[[ Line: 17 ]] --[[ Name: ClosestPointFunc ]]
    local l_Position_0 = v7.Position;
    local l_UpVector_0 = v7.UpVector;
    local v13 = v8 * 0.5;
    local v14 = l_Position_0 + l_UpVector_0 * math.clamp((v10 - l_Position_0):Dot(l_UpVector_0), -v13, v13);
    l_Position_0 = (v14 - v10).Magnitude;
    v13 = v10 - v14;
    l_UpVector_0 = if v13.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v13.Unit;
    return l_Position_0 <= v9, v14 + l_UpVector_0 * v9, l_UpVector_0;
end;
return function(v16, v17, v18, v19) --[[ Line: 27 ]]
    local v20 = (v17.Y < v17.Z and v17.Y or v17.Z) * 0.5;
    local l_X_0 = v17.X;
    local v22 = v16 * CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0);
    local l_Position_1 = v22.Position;
    local l_UpVector_1 = v22.UpVector;
    local v25 = l_X_0 * 0.5;
    local v26 = l_Position_1 + l_UpVector_1 * math.clamp((v18 - l_Position_1):Dot(l_UpVector_1), -v25, v25);
    l_Position_1 = (v26 - v18).Magnitude;
    v25 = v18 - v26;
    l_UpVector_1 = if v25.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v25.Unit;
    local v27 = l_Position_1 <= v20;
    local v28 = v26 + l_UpVector_1 * v20;
    local l_l_UpVector_1_0 = l_UpVector_1;
    if v27 then
        return v27, v28, l_l_UpVector_1_0;
    else
        return (v28 - v18).Magnitude < v19, v28, l_l_UpVector_1_0;
    end;
end;