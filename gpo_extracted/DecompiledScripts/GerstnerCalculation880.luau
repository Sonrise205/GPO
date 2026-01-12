--!native
local l_noise_0 = math.noise;
local l_cos_0 = math.cos;
local l_sin_0 = math.sin;
local l_sqrt_0 = math.sqrt;
local function v21(v4, v5, v6, v7, v8, v9, v10) --[[ Line: 15 ]] --[[ Name: Gerstner ]]
    -- upvalues: l_noise_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    if v5 == Vector3.new(0, 0, 0, 0) then
        v5 = Vector3.new(l_noise_0(v4.X / 100, v4.Z / 100, 1), (l_noise_0(v4.X / 100, v4.Z / 100, 0)));
    end;
    local v11 = 6.283185307179586 / v6;
    local v12 = v7 / v11;
    local v13 = l_sqrt_0(v8 / v11);
    local v14 = v11 * v5:Dot((Vector3.new(v4.X, v4.Z))) - v13 * v9;
    local v15 = l_cos_0(v14);
    local v16 = l_sin_0(v14);
    local v17 = v12 * Vector3.new(v5.X * v15, v16, v5.Y * v15);
    local v18 = nil;
    local v19 = nil;
    if v10 then
        local v20 = v7 * Vector3.new(-v5.X * v16, v15, -v5.Y * v16);
        v18 = v5.X * v20;
        v19 = v5.Y * v20;
    end;
    return v17, v18, v19;
end;
local function v28(v22, v23, v24, v25, v26, v27) --[[ Line: 43 ]] --[[ Name: GetTransform ]]
    -- upvalues: v21 (copy)
    return v21(v22, v23, v24, v25, v26, v27, false);
end;
local function v35(v29, v30, v31) --[[ Line: 47 ]] --[[ Name: GetWaveTransform ]]
    -- upvalues: v21 (copy)
    local v32 = Vector3.new(0, 0, 0, 0);
    for _, v34 in ipairs(v30) do
        if v34.Cancel then
            return (Vector3.new(0, 0, 0, 0));
        else
            v32 = v32 + v21(v29, v34.Direction, v34.WaveLength, v34.Steepness, v34.Gravity, v31, false);
        end;
    end;
    return v32;
end;
local function v47(v36, v37, v38) --[[ Line: 58 ]] --[[ Name: GetWaveTransformWithExtraNormals ]]
    -- upvalues: v21 (copy)
    local v39 = Vector3.new(0, 0, 0, 0);
    local v40 = Vector3.new(0, 0, 0, 0);
    local v41 = Vector3.new(0, 0, 0, 0);
    for _, v43 in ipairs(v37) do
        if v43.Cancel then
            return Vector3.new(0, 0, 0, 0), Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, 0, 0));
        else
            local v44, v45, v46 = v21(v36, v43.Direction, v43.WaveLength, v43.Steepness, v43.Gravity, v38, true);
            v39 = v39 + v44;
            v40 = v40 + v45;
            v41 = v41 + v46;
        end;
    end;
    return v39, v40, v41;
end;
return table.freeze({
    _gerstner = v21, 
    GetTransform = v28, 
    GetWaveTransform = v35, 
    GetWaveTransformWithExtraNormals = v47, 
    GetHeightAndNormal = function(v48, v49, v50, v51, v52, v53) --[[ Line: 72 ]] --[[ Name: GetHeightAndNormal ]]
        -- upvalues: v21 (copy)
        return v21(v48, v49, v50, v51, v52, v53, true);
    end, 
    GetWaveHeightAtPosition = function(v54, v55, v56) --[[ Line: 76 ]] --[[ Name: GetWaveHeightAtPosition ]]
        -- upvalues: v35 (copy)
        local l_v54_0 = v54;
        for _ = 0, 8 do
            l_v54_0 = v54 - v35(l_v54_0, v55, v56);
        end;
        return v35(l_v54_0, v55, v56).Y;
    end, 
    GetWaveNormalAtPosition = function(v59, v60, v61) --[[ Line: 86 ]] --[[ Name: GetWaveNormalAtPosition ]]
        -- upvalues: v47 (copy)
        local _, v63, v64 = v47(v59, v60, v61);
        return (v63.Unit:Cross(v64.Unit));
    end
});