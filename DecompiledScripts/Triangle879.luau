--!native
local l_Dot_0 = Vector3.new().Dot;
local l_Cross_0 = Vector3.new().Cross;
local l_clamp_0 = math.clamp;
local function _(v3) --[[ Line: 12 ]] --[[ Name: SafeUnit ]]
    if v3.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v3.Unit;
    end;
end;
local function _(v5, v6, v7) --[[ Line: 20 ]] --[[ Name: ClosestPointOnLineSegment ]]
    -- upvalues: l_Dot_0 (copy), l_clamp_0 (copy)
    local v8 = v6 - v5;
    return v5 + l_clamp_0(l_Dot_0(v7 - v5, v8) / l_Dot_0(v8, v8), 0, 1) * v8;
end;
local function _(v10, v11, v12) --[[ Line: 26 ]] --[[ Name: ProjectOnPlane ]]
    return v12 - (v12 - v10):Dot(v11) * v11;
end;
local function _(v14, v15, v16, v17) --[[ Line: 34 ]] --[[ Name: SameSide ]]
    -- upvalues: l_Cross_0 (copy), l_Dot_0 (copy)
    local v18 = l_Cross_0(v17 - v16, v14 - v16);
    local v19 = l_Cross_0(v17 - v16, v15 - v16);
    if l_Dot_0(v18, v19) >= 0 then
        return true;
    else
        return false;
    end;
end;
local function _(v21, v22, v23, v24) --[[ Line: 44 ]] --[[ Name: PointInTriangle ]]
    -- upvalues: l_Cross_0 (copy), l_Dot_0 (copy)
    local v25 = l_Cross_0(v24 - v23, v21 - v23);
    local v26 = l_Cross_0(v24 - v23, v22 - v23);
    if l_Dot_0(v25, v26) >= 0 then
        v25 = l_Cross_0(v24 - v22, v21 - v22);
        v26 = l_Cross_0(v24 - v22, v23 - v22);
        if l_Dot_0(v25, v26) >= 0 then
            v25 = l_Cross_0(v23 - v22, v21 - v22);
            v26 = l_Cross_0(v23 - v22, v24 - v22);
            if l_Dot_0(v25, v26) >= 0 then
                return true;
            end;
        end;
    end;
    return false;
end;
return function(v28, v29, v30, v31) --[[ Line: 52 ]] --[[ Name: ClosestPointOnTri ]]
    -- upvalues: l_Dot_0 (copy), l_clamp_0 (copy), l_Cross_0 (copy)
    local v32 = false;
    local v33 = v29 - v28;
    local v34 = v28 + l_clamp_0(l_Dot_0(v31 - v28, v33) / l_Dot_0(v33, v33), 0, 1) * v33;
    local v35 = v30 - v29;
    v33 = v29 + l_clamp_0(l_Dot_0(v31 - v29, v35) / l_Dot_0(v35, v35), 0, 1) * v35;
    local v36 = v28 - v30;
    v35 = v30 + l_clamp_0(l_Dot_0(v31 - v30, v36) / l_Dot_0(v36, v36), 0, 1) * v36;
    local v37 = l_Cross_0(v29 - v28, v30 - v28);
    v36 = if v37.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v37.Unit;
    local v38 = v31 - (v31 - (v28 + v29 + v30) * 0.3333):Dot(v36) * v36;
    local v39 = l_Cross_0(v30 - v29, v31 - v29);
    local v40 = l_Cross_0(v30 - v29, v28 - v29);
    local v41;
    if l_Dot_0(v39, v40) >= 0 then
        v39 = l_Cross_0(v30 - v28, v31 - v28);
        v40 = l_Cross_0(v30 - v28, v29 - v28);
        if l_Dot_0(v39, v40) >= 0 then
            v39 = l_Cross_0(v29 - v28, v31 - v28);
            v40 = l_Cross_0(v29 - v28, v30 - v28);
            if l_Dot_0(v39, v40) >= 0 then
                v41 = true;
                v32 = true;
            end;
        end;
    end;
    if not v32 then
        v41 = false;
    end;
    v32 = false;
    if v41 then
        return v38, v36;
    else
        v41 = (v34 - v31).Magnitude;
        local l_Magnitude_0 = (v33 - v31).Magnitude;
        v39 = (v35 - v31).Magnitude;
        v40 = math.min(v41, l_Magnitude_0, v39);
        if v40 == v41 then
            return v34, v36;
        elseif v40 == l_Magnitude_0 then
            return v33, v36;
        elseif v40 == v39 then
            return v35, v36;
        else
            return v31, v36;
        end;
    end;
end;