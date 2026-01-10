--!native
local function _(v0) --[[ Line: 2 ]] --[[ Name: SafeUnit ]]
    if v0.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v0.Unit;
    end;
end;
local function _(v2, v3, v4, v5) --[[ Line: 10 ]] --[[ Name: solve ]]
    local v6 = math.clamp((v5 - v2):Dot(v3), -v4, v4);
    return v2 + v3 * v6, v6;
end;
local function _(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: ProjectOnPlane ]]
    return v10 - (v10 - v8):Dot(v9) * v9;
end;
local function v39(v12, v13, v14) --[[ Line: 25 ]] --[[ Name: ClosestPointFunc ]]
    local v15 = (v13.Y < v13.Z and v13.Y or v13.Z) * 0.5;
    local v16 = v13.X * 0.5;
    local l_Position_0 = v12.Position;
    local l_RightVector_0 = v12.RightVector;
    local v19 = math.clamp((v14 - l_Position_0):Dot(l_RightVector_0), -v16, v16);
    local v20 = l_Position_0 + l_RightVector_0 * v19;
    local l_v19_0 = v19;
    l_Position_0 = v12.Position + -v12.RightVector * v16;
    l_RightVector_0 = v12.Position + v12.RightVector * v16;
    local v22 = -v12.RightVector;
    v19 = v12.RightVector;
    local v23 = v14 - (v14 - l_Position_0):Dot(v22) * v22;
    local v24 = v14 - (v14 - l_RightVector_0):Dot(v19) * v19;
    local function _(v25, v26) --[[ Line: 39 ]] --[[ Name: GetFinalProj ]]
        -- upvalues: v15 (copy)
        local v27 = v25 - v26;
        local v28 = if v27.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v27.Unit;
        v27 = (v25 - v26).Magnitude;
        return v26 + v28 * (v27 < v15 and v27 or v15);
    end;
    local l_v23_0 = v23;
    local v31 = l_v23_0 - l_Position_0;
    local v32 = if v31.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v31.Unit;
    v31 = (l_v23_0 - l_Position_0).Magnitude;
    v23 = l_Position_0 + v32 * (v31 < v15 and v31 or v15);
    l_v23_0 = v24;
    v31 = l_v23_0 - l_RightVector_0;
    v32 = if v31.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v31.Unit;
    v31 = (l_v23_0 - l_RightVector_0).Magnitude;
    v24 = l_RightVector_0 + v32 * (v31 < v15 and v31 or v15);
    l_v23_0 = (v20 - v14).Magnitude;
    v31 = v14 - v20;
    v32 = if v31.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v31.Unit;
    v31 = l_v23_0 <= v15;
    local v33 = v20 + v32 * v15;
    local l_Magnitude_0 = (v24 - v14).Magnitude;
    local l_Magnitude_1 = (v23 - v14).Magnitude;
    local v36 = math.min(l_Magnitude_0, l_Magnitude_1, (v33 - v14).Magnitude);
    if l_v19_0 == v16 or v36 == l_Magnitude_0 then
        local v37 = v14 - v24;
        return (if v37.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v37.Unit):Dot(v19) < 0, v24, v19;
    elseif l_v19_0 == -v16 or v36 == l_Magnitude_1 then
        local v38 = v14 - v23;
        return (if v38.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v38.Unit):Dot(v22) < 0, v23, v22;
    else
        return v31, v33, v32;
    end;
end;
return function(v40, v41, v42, v43) --[[ Line: 70 ]]
    -- upvalues: v39 (copy)
    local v44, v45, v46 = v39(v40, v41, v42);
    if v44 then
        return v44, v45, v46;
    else
        return (v45 - v42).Magnitude < v43, v45, v46;
    end;
end;