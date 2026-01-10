local v0 = {
    Vector3.new(1, 1, 1, 0), 
    Vector3.new(-1, 1, 1, 0), 
    Vector3.new(-1, 1, -1, 0), 
    Vector3.new(1, 1, -1, 0), 
    Vector3.new(1, -1, 1, 0), 
    Vector3.new(-1, -1, 1, 0), 
    Vector3.new(-1, -1, -1, 0), 
    (Vector3.new(1, -1, -1, 0))
};
local v1 = {
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8
};
local v2 = {
    1, 
    2, 
    5, 
    6, 
    7, 
    8
};
local v3 = {
    4, 
    5, 
    6, 
    7, 
    8
};
local function _(v4) --[[ Line: 32 ]] --[[ Name: fromIndexArray ]]
    -- upvalues: v0 (copy)
    local v5 = {};
    for v6 = 1, #v4 do
        v5[v6] = v0[v4[v6]];
    end;
    return v5;
end;
local function v13(v8) --[[ Line: 40 ]] --[[ Name: cylinder ]]
    local v9 = {};
    local v10 = 6.283185307179586 / v8;
    for v11 = 1, v8 do
        local v12 = CFrame.fromAxisAngle(Vector3.new(1, 0, 0, 0), v11 * v10) * Vector3.new(0, 1, 0, 0);
        v9[v11] = Vector3.new(1, 0, 0, 0) + v12;
        v9[v8 + v11] = Vector3.new(-1, 0, 0, 0) + v12;
    end;
    return v9;
end;
local function v32(v14) --[[ Line: 51 ]] --[[ Name: icoSphere ]]
    local v15 = {
        Vector3.new(-1, 1.6180340051651, 0, 0), 
        Vector3.new(1, 1.6180340051651, 0, 0), 
        Vector3.new(-1, -1.6180340051651, 0, 0), 
        Vector3.new(1, -1.6180340051651, 0, 0), 
        Vector3.new(0, -1, 1.6180340051651, 0), 
        Vector3.new(0, 1, 1.6180340051651, 0), 
        Vector3.new(0, -1, -1.6180340051651, 0), 
        Vector3.new(0, 1, -1.6180340051651, 0), 
        Vector3.new(1.6180340051651, 0, -1, 0), 
        Vector3.new(1.6180340051651, 0, 1, 0), 
        Vector3.new(-1.6180340051651, 0, -1, 0), 
        (Vector3.new(-1.6180340051651, 0, 1, 0))
    };
    local v16 = {
        1, 
        12, 
        6, 
        1, 
        6, 
        2, 
        1, 
        2, 
        8, 
        1, 
        8, 
        11, 
        1, 
        11, 
        12, 
        2, 
        6, 
        10, 
        6, 
        12, 
        5, 
        12, 
        11, 
        3, 
        11, 
        8, 
        7, 
        8, 
        2, 
        9, 
        4, 
        10, 
        5, 
        4, 
        5, 
        3, 
        4, 
        3, 
        7, 
        4, 
        7, 
        9, 
        4, 
        9, 
        10, 
        5, 
        10, 
        6, 
        3, 
        5, 
        12, 
        7, 
        3, 
        11, 
        9, 
        7, 
        8, 
        10, 
        9, 
        2
    };
    local v17 = {};
    local function _(v18, v19) --[[ Line: 97 ]] --[[ Name: split ]]
        -- upvalues: v17 (copy), v15 (copy)
        local v20 = v18 < v19 and v18 .. "," .. v19 or v19 .. "," .. v18;
        if not v17[v20] then
            v15[#v15 + 1] = (v15[v18] + v15[v19]) / 2;
            v17[v20] = #v15;
        end;
        return v17[v20];
    end;
    for _ = 1, v14 do
        for v23 = #v16, 1, -3 do
            local v24 = v16[v23 - 2];
            local v25 = v16[v23 - 1];
            local v26 = v16[v23];
            local v27 = v24 < v25 and v24 .. "," .. v25 or v25 .. "," .. v24;
            if not v17[v27] then
                v15[#v15 + 1] = (v15[v24] + v15[v25]) / 2;
                v17[v27] = #v15;
            end;
            local v28 = v17[v27];
            local v29 = v25 < v26 and v25 .. "," .. v26 or v26 .. "," .. v25;
            if not v17[v29] then
                v15[#v15 + 1] = (v15[v25] + v15[v26]) / 2;
                v17[v29] = #v15;
            end;
            v27 = v17[v29];
            local v30 = v26 < v24 and v26 .. "," .. v24 or v24 .. "," .. v26;
            if not v17[v30] then
                v15[#v15 + 1] = (v15[v26] + v15[v24]) / 2;
                v17[v30] = #v15;
            end;
            v29 = v17[v30];
            v16[#v16 + 1] = v24;
            v16[#v16 + 1] = v28;
            v16[#v16 + 1] = v29;
            v16[#v16 + 1] = v25;
            v16[#v16 + 1] = v27;
            v16[#v16 + 1] = v28;
            v16[#v16 + 1] = v26;
            v16[#v16 + 1] = v29;
            v16[#v16 + 1] = v27;
            v16[#v16 + 1] = v28;
            v16[#v16 + 1] = v27;
            v16[#v16 + 1] = v29;
            table.remove(v16, v23);
            table.remove(v16, v23 - 1);
            table.remove(v16, v23 - 2);
        end;
    end;
    for v31 = 1, #v15 do
        v15[v31] = v15[v31].Unit;
    end;
    return v15;
end;
local function v38(v33, v34, v35) --[[ Line: 147 ]] --[[ Name: vertShape ]]
    local v36 = {};
    for v37 = 1, #v35 do
        v36[v37] = v33:PointToWorldSpace(v35[v37] * v34);
    end;
    return v36;
end;
local function v42(v39) --[[ Line: 155 ]] --[[ Name: getCentroidFromSet ]]
    local v40 = v39[1];
    for _ = 2, #v39 do
        v40 = v40 + v39[2];
    end;
    return v40 / #v39;
end;
local function v44(v43) --[[ Line: 163 ]] --[[ Name: classify ]]
    if v43.ClassName == "Part" then
        if v43.Shape == Enum.PartType.Block then
            return "Block";
        elseif v43.Shape == Enum.PartType.Cylinder then
            return "Cylinder";
        elseif v43.Shape == Enum.PartType.Ball then
            return "Ball";
        end;
    elseif v43.ClassName == "WedgePart" then
        return "Wedge";
    elseif v43.ClassName == "CornerWedgePart" then
        return "CornerWedge";
    elseif v43:IsA("BasePart") then
        return "Block";
    end;
end;
local v45 = {};
for v46 = 1, #v1 do
    v45[v46] = v0[v1[v46]];
end;
local l_v45_0 = v45;
local v48 = {};
for v49 = 1, #v2 do
    v48[v49] = v0[v2[v49]];
end;
v45 = v48;
local v50 = {};
for v51 = 1, #v3 do
    v50[v51] = v0[v3[v51]];
end;
v48 = v50;
v50 = v13(20);
local v52 = v32(2);
return {
    Block = function(v53, v54) --[[ Line: 190 ]] --[[ Name: Block ]]
        -- upvalues: v38 (copy), l_v45_0 (copy)
        return (v38(v53, v54, l_v45_0));
    end, 
    Wedge = function(v55, v56) --[[ Line: 191 ]] --[[ Name: Wedge ]]
        -- upvalues: v38 (copy), v45 (copy)
        return (v38(v55, v56, v45));
    end, 
    CornerWedge = function(v57, v58) --[[ Line: 192 ]] --[[ Name: CornerWedge ]]
        -- upvalues: v38 (copy), v48 (copy)
        return (v38(v57, v58, v48));
    end, 
    Cylinder = function(v59, v60) --[[ Line: 193 ]] --[[ Name: Cylinder ]]
        -- upvalues: v38 (copy), v50 (copy)
        return (v38(v59, v60, v50));
    end, 
    Ball = function(v61, v62) --[[ Line: 194 ]] --[[ Name: Ball ]]
        -- upvalues: v38 (copy), v52 (copy)
        return (v38(v61, v62, v52));
    end, 
    GetCentroid = v42, 
    Classify = v44
};