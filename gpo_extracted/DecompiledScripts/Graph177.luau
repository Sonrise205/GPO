local function _(v0, v1, v2) --[[ Line: 3 ]] --[[ Name: clamp ]]
    if v0 < v1 then
        return v1;
    elseif v2 < v0 then
        return v2;
    else
        return v0;
    end;
end;
local function _(v4, v5, v6) --[[ Line: 4 ]] --[[ Name: lerp ]]
    return v4 + (v5 - v4) * v6;
end;
local v14 = {
    GenerateSeed = function(v8) --[[ Line: 12 ]]
        local v9 = {};
        local l_Keypoints_0 = v8.Keypoints;
        local v11 = math.random();
        local v12 = math.random() >= 0.5;
        for v13 = 1, #l_Keypoints_0 do
            if l_Keypoints_0[v13].Envelope > 0 then
                if v12 == true then
                    v9[v13] = v11 * l_Keypoints_0[v13].Envelope;
                else
                    v9[v13] = -v11 * l_Keypoints_0[v13].Envelope;
                end;
            end;
        end;
        return v9;
    end
};
v14.GenerateSeeds = function(v15, v16) --[[ Line: 29 ]]
    -- upvalues: v14 (copy)
    local v17 = {};
    for v18 = 1, v16 do
        v17[v18] = v14.GenerateSeed(v15);
    end;
    return v17;
end;
v14.QueryPointsWithTime = function(v19, v20, v21) --[[ Line: 38 ]]
    v19 = math.clamp(v19, 0, 1);
    local l_Keypoints_1 = v20.Keypoints;
    if #l_Keypoints_1 == 1 then
        return l_Keypoints_1[1].Value + (v21[1] or 0);
    else
        for v23 = 1, #l_Keypoints_1 - 1 do
            local v24 = l_Keypoints_1[v23];
            local v25 = l_Keypoints_1[v23 + 1];
            if v24.Time <= v19 and v19 <= v25.Time then
                local v26 = (v19 - v24.Time) / (v25.Time - v24.Time);
                local v27 = v24.Value + (v21[v23] or 0);
                return v27 + (v25.Value + (v21[v23 + 1] or 0) - v27) * v26;
            end;
        end;
        return l_Keypoints_1[#l_Keypoints_1].Value + (v21[#l_Keypoints_1] or 0);
    end;
end;
v14.QueryColorPointWithTime = function(v28, v29) --[[ Line: 64 ]]
    local l_Keypoints_2 = v29.Keypoints;
    if #l_Keypoints_2 == 0 then
        return Color3.new(1, 1, 1);
    elseif #l_Keypoints_2 == 1 then
        return l_Keypoints_2[1].Value;
    elseif v28 <= l_Keypoints_2[1].Time then
        return l_Keypoints_2[1].Value;
    else
        for v31 = 1, #l_Keypoints_2 - 1 do
            local v32 = l_Keypoints_2[v31];
            local v33 = l_Keypoints_2[v31 + 1];
            if v32.Time <= v28 and v28 <= v33.Time then
                local v34 = (v28 - v32.Time) / (v33.Time - v32.Time);
                return v32.Value:Lerp(v33.Value, v34);
            end;
        end;
        return l_Keypoints_2[#l_Keypoints_2].Value;
    end;
end;
v14.BlendGraphWithTime = function(v35, v36, v37, v38) --[[ Line: 108 ]]
    -- upvalues: v14 (copy)
    local v39 = v38 or 1;
    v38 = v39 < 0 and 0 or v39 > 1 and 1 or v39;
    v39 = {};
    local v40 = {};
    for _, v42 in ipairs({
        v35, 
        v36
    }) do
        for _, v44 in ipairs(v42.Keypoints) do
            if not v40[v44.Time] then
                v40[v44.Time] = true;
                table.insert(v39, v44.Time);
            end;
        end;
    end;
    table.sort(v39);
    local v45 = {};
    local v46 = {};
    for _, v48 in ipairs(v39) do
        local v49 = v14.QueryPointsWithTime(v48, v35, {}) or v35.Keypoints[#v35.Keypoints].Value;
        local v50 = v14.QueryPointsWithTime(v48, v36, {}) or v36.Keypoints[#v36.Keypoints].Value;
        table.insert(v45, NumberSequenceKeypoint.new(v48, v49));
        table.insert(v46, NumberSequenceKeypoint.new(v48, v50));
    end;
    local v51 = v14.QueryPointsWithTime(v38, v37, {}) or 1;
    local v52 = {};
    for v53, v54 in ipairs(v45) do
        local l_Time_0 = v54.Time;
        local l_Value_0 = v54.Value;
        local v57 = l_Value_0 + (v46[v53].Value - l_Value_0) * v51;
        table.insert(v52, NumberSequenceKeypoint.new(l_Time_0, v57));
    end;
    return NumberSequence.new(v52);
end;
v14.BlendColorGraphWithTime = function(v58, v59, v60, v61) --[[ Line: 147 ]]
    -- upvalues: v14 (copy)
    local v62 = v61 or 1;
    v61 = v62 < 0 and 0 or v62 > 1 and 1 or v62;
    v62 = {};
    local v63 = {};
    for _, v65 in ipairs({
        v58, 
        v59
    }) do
        for _, v67 in ipairs(v65.Keypoints) do
            if not v63[v67.Time] then
                v63[v67.Time] = true;
                table.insert(v62, v67.Time);
            end;
        end;
    end;
    table.sort(v62);
    local v68 = v14.QueryPointsWithTime(v61, v60, {}) or 1;
    local v69 = {};
    for _, v71 in ipairs(v62) do
        local v72 = v14.QueryColorPointWithTime(v71, v58):Lerp(v14.QueryColorPointWithTime(v71, v59), v68);
        table.insert(v69, ColorSequenceKeypoint.new(v71, v72));
    end;
    return ColorSequence.new(v69);
end;
return v14;