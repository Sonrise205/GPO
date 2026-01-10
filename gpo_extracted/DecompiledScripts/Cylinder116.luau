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
local function v38(v12, v13, v14) --[[ Line: 25 ]] --[[ Name: ClosestPointFunc ]]
    local v15 = math.min(v13.Y, v13.Z) * 0.5;
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
        return v26 + (if v27.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v27.Unit) * math.min((v25 - v26).Magnitude, v15);
    end;
    local l_v23_0 = v23;
    local v30 = l_v23_0 - l_Position_0;
    v23 = l_Position_0 + (if v30.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v30.Unit) * math.min((l_v23_0 - l_Position_0).Magnitude, v15);
    l_v23_0 = v24;
    v30 = l_v23_0 - l_RightVector_0;
    v24 = l_RightVector_0 + (if v30.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v30.Unit) * math.min((l_v23_0 - l_RightVector_0).Magnitude, v15);
    l_v23_0 = (v20 - v14).Magnitude;
    v30 = v14 - v20;
    local v31 = if v30.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v30.Unit;
    v30 = l_v23_0 <= v15;
    local v32 = v20 + v31 * v15;
    local l_Magnitude_0 = (v24 - v14).Magnitude;
    local l_Magnitude_1 = (v23 - v14).Magnitude;
    local v35 = math.min(l_Magnitude_0, l_Magnitude_1, (v32 - v14).Magnitude);
    if l_v19_0 == v16 or v35 == l_Magnitude_0 then
        local v36 = v14 - v24;
        return (if v36.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v36.Unit):Dot(v19) < 0, v24, v19;
    elseif l_v19_0 == -v16 or v35 == l_Magnitude_1 then
        local v37 = v14 - v23;
        return (if v37.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v37.Unit):Dot(v22) < 0, v23, v22;
    else
        return v30, v32, v31;
    end;
end;
return function(v39, v40, v41, v42) --[[ Line: 70 ]]
    -- upvalues: v38 (copy)
    debug.profilebegin("Cylinder Testing");
    local v43, v44, v45 = v38(v39, v40, v41);
    if v43 then
        return v43, v44, v45;
    else
        v43 = (v44 - v41).Magnitude < v42;
        debug.profileend();
        return v43, v44, v45;
    end;
end;