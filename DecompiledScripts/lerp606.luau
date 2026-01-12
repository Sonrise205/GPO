local v0 = require("./color/Oklab");
local v16 = {
    number = function(v1, v2, v3) --[[ Line: 7 ]] --[[ Name: number ]]
        return v1 + (v2 - v1) * v3;
    end, 
    Vector3 = function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: Vector3 ]]
        return v4:Lerp(v5, v6);
    end, 
    Vector2 = function(v7, v8, v9) --[[ Line: 15 ]] --[[ Name: Vector2 ]]
        return v7:Lerp(v8, v9);
    end, 
    CFrame = function(v10, v11, v12) --[[ Line: 19 ]] --[[ Name: CFrame ]]
        return v10:Lerp(v11, v12);
    end, 
    UDim2 = function(v13, v14, v15) --[[ Line: 23 ]] --[[ Name: UDim2 ]]
        return v13:Lerp(v14, v15);
    end
};
v16.UDim = function(v17, v18, v19) --[[ Line: 27 ]] --[[ Name: UDim ]]
    -- upvalues: v16 (copy)
    return UDim.new(v16.number(v17.Scale, v18.Scale, v19), v16.number(v17.Offset, v18.Offset, v19));
end;
v16.NumberRange = function(v20, v21, v22) --[[ Line: 35 ]] --[[ Name: NumberRange ]]
    -- upvalues: v16 (copy)
    return NumberRange.new(v16.number(v20.Min, v21.Min, v22), v16.number(v20.Max, v21.Max, v22));
end;
v16.Color3 = function(v23, v24, v25) --[[ Line: 43 ]] --[[ Name: Color3 ]]
    -- upvalues: v0 (copy)
    return v0.toSRGB(v0.fromSRGB(v23):Lerp(v0.fromSRGB(v24), v25));
end;
v16.PhysicalProperties = function(v26, v27, v28) --[[ Line: 50 ]] --[[ Name: PhysicalProperties ]]
    -- upvalues: v16 (copy)
    return PhysicalProperties.new(v16.number(v26.Density, v27.Density, v28), v16.number(v26.Friction, v27.Friction, v28), v16.number(v26.Elasticity, v27.Elasticity, v28), v16.number(v26.FrictionWeight, v27.FrictionWeight, v28), v16.number(v26.ElasticityWeight, v27.ElasticityWeight, v28));
end;
v16.Rect = function(v29, v30, v31) --[[ Line: 60 ]] --[[ Name: Rect ]]
    return Rect.new(v29.Min:Lerp(v30.Min, v31), v29.Max:Lerp(v30.Max, v31));
end;
v16.NumberSequence = function(v32, v33, v34) --[[ Line: 65 ]] --[[ Name: NumberSequence ]]
    local v35 = {};
    local v36 = {};
    local v37 = 0;
    for _, v39 in v32.Keypoints do
        local v40 = nil;
        local v41 = nil;
        for _, v43 in v33.Keypoints do
            if v43.Time == v39.Time then
                v40 = v43;
                v41 = v43;
                break;
            elseif v43.Time < v39.Time and (v41 == nil or v43.Time > v41.Time) then
                v41 = v43;
            elseif v43.Time > v39.Time and (v40 == nil or v43.Time < v40.Time) then
                v40 = v43;
            end;
        end;
        local v44 = nil;
        local v45 = nil;
        if v40 == v41 then
            v44 = v40.Value;
            v45 = v40.Envelope;
        else
            local v46 = (v39.Time - v41.Time) / (v40.Time - v41.Time);
            v44 = (v40.Value - v41.Value) * v46 + v41.Value;
            v45 = (v40.Envelope - v41.Envelope) * v46 + v41.Envelope;
        end;
        v37 = v37 + 1;
        v35[v37] = NumberSequenceKeypoint.new(v39.Time, (v44 - v39.Value) * v34 + v39.Value, (v45 - v39.Envelope) * v34 + v39.Envelope);
        v36[v39.Time] = true;
    end;
    for _, v48 in v33.Keypoints do
        if not v36[v48.Time] then
            local v49 = nil;
            local v50 = nil;
            for _, v52 in v32.Keypoints do
                if v52.Time == v48.Time then
                    v49 = v52;
                    v50 = v52;
                    break;
                elseif v52.Time < v48.Time and (v50 == nil or v52.Time > v50.Time) then
                    v50 = v52;
                elseif v52.Time > v48.Time and (v49 == nil or v52.Time < v49.Time) then
                    v49 = v52;
                end;
            end;
            local v53 = nil;
            local v54 = nil;
            if v49 == v50 then
                v53 = v49.Value;
                v54 = v49.Envelope;
            else
                local v55 = (v48.Time - v50.Time) / (v49.Time - v50.Time);
                v53 = (v49.Value - v50.Value) * v55 + v50.Value;
                v54 = (v49.Envelope - v50.Envelope) * v55 + v50.Envelope;
            end;
            v37 = v37 + 1;
            v35[v37] = NumberSequenceKeypoint.new(v48.Time, (v48.Value - v53) * v34 + v53, (v48.Envelope - v54) * v34 + v54);
        end;
    end;
    table.sort(v35, function(v56, v57) --[[ Line: 136 ]]
        return v56.Time < v57.Time;
    end);
    local v58 = nil;
    if #v35 > 20 then
        v58 = {};
        local v59 = (#v35 - 1) / 19;
        for v60 = 0, 19 do
            table.insert(v58, v35[math.floor(v60 * v59 + 1)]);
        end;
        if v58[#v58].Time < v35[#v35].Time then
            v58[#v58] = v35[#v35];
        end;
    else
        v58 = v35;
    end;
    return NumberSequence.new(v58);
end;
local function v69(v61, v62) --[[ Line: 161 ]] --[[ Name: getColorAtTime ]]
    local l_Keypoints_0 = v61.Keypoints;
    if v62 <= l_Keypoints_0[1].Time then
        return l_Keypoints_0[1].Value;
    elseif l_Keypoints_0[#l_Keypoints_0].Time <= v62 then
        return l_Keypoints_0[#l_Keypoints_0].Value;
    else
        local v64 = nil;
        local v65 = nil;
        for v66 = 1, #l_Keypoints_0 do
            local v67 = l_Keypoints_0[v66];
            if v67.Time == v62 then
                return v67.Value;
            elseif v67.Time < v62 then
                v64 = v67;
            elseif v62 < v67.Time then
                v65 = v67;
                break;
            end;
        end;
        local v68 = (v62 - v64.Time) / (v65.Time - v64.Time);
        return v64.Value:Lerp(v65.Value, v68);
    end;
end;
v16.ColorSequence = function(v70, v71, v72) --[[ Line: 192 ]] --[[ Name: ColorSequence ]]
    -- upvalues: v69 (copy)
    local v73 = {};
    for _, v75 in ipairs(v71.Keypoints) do
        local v76 = v69(v70, v75.Time):Lerp(v75.Value, v72);
        table.insert(v73, ColorSequenceKeypoint.new(v75.Time, v76));
    end;
    return ColorSequence.new(v73);
end;
v16.Other = function(v77, v78, v79) --[[ Line: 209 ]] --[[ Name: Other ]]
    return v79 < 0.5 and v77 or v78;
end;
return v16;