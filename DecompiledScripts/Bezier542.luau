local function _(v0, v1, v2, v3, v4) --[[ Line: 6 ]] --[[ Name: cubicBezier ]]
    return (1 - v4) ^ 3 * v0 + 3 * (1 - v4) ^ 2 * v4 * v1 + 3 * (1 - v4) * v4 ^ 2 * v2 + v4 ^ 3 * v3;
end;
local function _(v6, v7, v8, v9, v10) --[[ Line: 11 ]] --[[ Name: cubicBezierDerivative ]]
    return 3 * (1 - v10) ^ 2 * (v7 - v6) + 6 * (1 - v10) * v10 * (v8 - v7) + 3 * v10 ^ 2 * (v9 - v8);
end;
local v12 = {};
v12.__index = v12;
v12.new = function(v13, v14) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    local v15 = setmetatable({}, v12);
    v15.points = v13;
    v15.accuracy = v14 or 20;
    v15.point_count = 0;
    v15.cumulative_lengths = {};
    v15:_recalculate();
    return v15;
end;
v12.setPoints = function(v16, v17) --[[ Line: 42 ]] --[[ Name: setPoints ]]
    v16.points = v17;
    v16:_recalculate();
end;
v12.getSegmentPoints = function(v18, v19) --[[ Line: 47 ]] --[[ Name: getSegmentPoints ]]
    if v19 < 1 or v18.point_count - 1 < v19 then
        if v19 <= 0 then
            return Vector3.new(0, 0, 0, 0), Vector3.new(0, 0, 0, 0), Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, 0, 0));
        else
            error("attempt to get a non-existent segment at index " .. v19);
        end;
    end;
    local v20 = math.max((v19 - 1) * 4 - math.max(v19 - 2, 0), 1);
    return v18.points[v20], v18.points[v20 + 1], v18.points[v20 + 2], v18.points[v20 + 3];
end;
v12.forSample = function(v21, v22, v23) --[[ Line: 67 ]] --[[ Name: forSample ]]
    local v24 = v21.length // v22;
    if v24 == 0 then
        return;
    else
        for v25 = 0, v24 do
            v23(v21:getPositionArcSpace(v25 / v24), v25);
        end;
        return;
    end;
end;
v12.getPosition = function(v26, v27) --[[ Line: 80 ]] --[[ Name: getPosition ]]
    local v28, v29 = v26:getSegmentIndex(v27);
    local v30, v31, v32, v33 = v26:getSegmentPoints(v28);
    return (1 - v29) ^ 3 * v30 + 3 * (1 - v29) ^ 2 * v29 * v31 + 3 * (1 - v29) * v29 ^ 2 * v32 + v29 ^ 3 * v33;
end;
v12.getSegmentIndex = function(v34, v35) --[[ Line: 87 ]] --[[ Name: getSegmentIndex ]]
    v35 = math.clamp(v35, 0, 1);
    local v36 = v34.point_count - 1;
    local v37 = v35 * v36;
    local v38 = math.min(math.floor(v37) + 1, v36);
    local v39 = v37 - math.floor(v37);
    if v35 == 1 then
        v39 = 1;
    end;
    return v38, v39;
end;
v12.getEasedSegmentIndex = function(v40, v41) --[[ Line: 104 ]] --[[ Name: getEasedSegmentIndex ]]
    local v42 = v40.point_count - 1;
    local v43 = 1;
    for v44 = 1, v42 do
        local v45, _, _, v48 = v40:getSegmentPoints(v44);
        local l_x_0 = v45.x;
        local l_x_1 = v48.x;
        if l_x_0 <= v41 and v41 < l_x_1 then
            return v44, (v41 - l_x_0) / (l_x_1 - l_x_0);
        end;
    end;
    return v42, v43;
end;
v12.getEase = function(v51, v52) --[[ Line: 125 ]] --[[ Name: getEase ]]
    local v53, v54 = v51:getEasedSegmentIndex(v52);
    local v55, v56, v57, v58 = v51:getSegmentPoints(v53);
    for _ = 1, 5 do
        local l_x_2 = v55.x;
        local l_x_3 = v56.x;
        local l_x_4 = v57.x;
        local l_x_5 = v58.x;
        local l_v54_0 = v54;
        local v65 = (1 - l_v54_0) ^ 3 * l_x_2 + 3 * (1 - l_v54_0) ^ 2 * l_v54_0 * l_x_3 + 3 * (1 - l_v54_0) * l_v54_0 ^ 2 * l_x_4 + l_v54_0 ^ 3 * l_x_5;
        l_x_3 = v55.x;
        l_x_4 = v56.x;
        l_x_5 = v57.x;
        l_v54_0 = v58.x;
        local l_v54_1 = v54;
        l_x_2 = 3 * (1 - l_v54_1) ^ 2 * (l_x_4 - l_x_3) + 6 * (1 - l_v54_1) * l_v54_1 * (l_x_5 - l_x_4) + 3 * l_v54_1 ^ 2 * (l_v54_0 - l_x_5);
        if l_x_2 ~= 0 then
            l_x_3 = (v65 - v52) / l_x_2;
            v54 = v54 - l_x_3;
            if v54 < 0 then
                v54 = 0;
            elseif v54 > 1 then
                v54 = 1;
            end;
            if math.abs(l_x_3) < 0.001 then
                break;
            end;
        else
            break;
        end;
    end;
    local l_v54_2 = v54;
    return (1 - l_v54_2) ^ 3 * v55 + 3 * (1 - l_v54_2) ^ 2 * l_v54_2 * v56 + 3 * (1 - l_v54_2) * l_v54_2 ^ 2 * v57 + l_v54_2 ^ 3 * v58;
end;
v12.getPositionArcSpace = function(v68, v69) --[[ Line: 154 ]] --[[ Name: getPositionArcSpace ]]
    if v68.length <= 0 then
        return v68.points[1] or Vector3.new(0, 0, 0, 0);
    else
        local v70 = math.clamp(v69, 0, 1) * v68.cumulative_lengths[v68.accuracy + 1];
        local v71 = 1;
        local v72 = v68.accuracy + 1;
        local v73 = nil;
        while v71 < v72 do
            v73 = v71 + (v72 - v71) // 2;
            if v68.cumulative_lengths[v73] < v70 then
                v71 = v73 + 1;
            else
                v72 = v73;
            end;
        end;
        if v70 < v68.cumulative_lengths[v73] and v73 > 1 then
            v73 = v73 - 1;
        end;
        local v74 = v68.cumulative_lengths[v73];
        if v74 == v70 then
            return v68:getPosition((v73 - 1) / v68.accuracy);
        else
            return v68:getPosition((v73 - 1 + (v70 - v74) / (v68.cumulative_lengths[v73 + 1] - v74)) / v68.accuracy);
        end;
    end;
end;
v12._recalculate = function(v75) --[[ Line: 190 ]] --[[ Name: _recalculate ]]
    table.clear(v75.cumulative_lengths);
    table.insert(v75.cumulative_lengths, 0);
    v75.point_count = math.ceil(#v75.points / 3);
    local v76 = 0;
    local v77 = nil;
    for v78 = 1, v75.accuracy do
        local v79 = v75:getPosition(v78 / v75.accuracy);
        if not v77 then
            v77 = v75:getPosition(0);
        end;
        v76 = v76 + vector.magnitude(v79 - v77);
        v77 = v79;
        table.insert(v75.cumulative_lengths, v76);
    end;
    v75.length = v76;
    for v80, v81 in v75.cumulative_lengths do
        v75.cumulative_lengths[v80] = v81 / v76;
    end;
end;
return v12;