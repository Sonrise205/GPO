--!native
local v3 = {
    PlotPixel = function(_, _, _) --[[ Line: 4 ]] --[[ Name: PlotPixel ]]

    end
};
local function v8(v4) --[[ Line: 9 ]] --[[ Name: makeGradients ]]
    local v5 = {};
    local v6 = 1 / ((v4[2].X - v4[3].X) * (v4[1].Y - v4[3].Y) - (v4[1].X - v4[3].X) * (v4[2].Y - v4[3].Y));
    local v7 = -v6;
    v5.aOneOverZ = {};
    v5.aOneOverZ[1] = 1 / v4[1].Z;
    v5.aOneOverZ[2] = 1 / v4[2].Z;
    v5.aOneOverZ[3] = 1 / v4[3].Z;
    v5.dOneOverZdX = v6 * ((v5.aOneOverZ[2] - v5.aOneOverZ[3]) * (v4[1].Y - v4[3].Y) - (v5.aOneOverZ[1] - v5.aOneOverZ[3]) * (v4[2].Y - v4[3].Y));
    v5.dOneOverZdY = v7 * ((v5.aOneOverZ[2] - v5.aOneOverZ[3]) * (v4[1].X - v4[3].X) - (v5.aOneOverZ[1] - v5.aOneOverZ[3]) * (v4[2].X - v4[3].X));
    return v5;
end;
local function v18(v9, v10, v11, v12) --[[ Line: 26 ]] --[[ Name: makeEdge ]]
    local v13 = {
        Y = math.ceil(v10[v11].Y)
    };
    v13.height = math.ceil(v10[v12].Y) - v13.Y;
    local v14 = v13.Y - v10[v11].Y;
    local v15 = v10[v12].Y - v10[v11].Y;
    local v16 = v10[v12].X - v10[v11].X;
    v13.X = v16 * v14 / v15 + v10[v11].X;
    v13.XStep = v16 / v15;
    local v17 = v13.X - v10[v11].X;
    v13.OneOverZ = v9.aOneOverZ[v11] + v14 * v9.dOneOverZdY + v17 * v9.dOneOverZdX;
    v13.OneOverZStep = v13.XStep * v9.dOneOverZdX + v9.dOneOverZdY;
    return v13;
end;
local function _(v19) --[[ Line: 50 ]] --[[ Name: step ]]
    v19.X = v19.X + v19.XStep;
    v19.Y = v19.Y + 1;
    v19.height = v19.height - 1;
    v19.OneOverZ = v19.OneOverZ + v19.OneOverZStep;
end;
drawScanLine = function(v21, v22, v23) --[[ Line: 58 ]] --[[ Name: drawScanLine ]]
    -- upvalues: v3 (copy)
    local v24 = math.ceil(v22.X);
    local v25 = v24 - v22.X;
    local v26 = math.ceil(v23.X) - v24;
    local v27 = v22.OneOverZ + v25 * v21.dOneOverZdX;
    local l_v24_0 = v24;
    local l_Y_0 = v22.Y;
    while true do
        if v26 > 0 then
            v26 = v26 - 1;
            local v30 = 1 / v27;
            if v3.PlotPixel(l_v24_0, l_Y_0, v30) then
                return true;
            else
                l_v24_0 = l_v24_0 + 1;
                v27 = v27 + v21.dOneOverZdX;
            end;
        else
            return false;
        end;
    end;
end;
IsPointInsidePolygon = function(v31, v32) --[[ Line: 85 ]] --[[ Name: IsPointInsidePolygon ]]
    local v33 = #v32;
    local v34 = false;
    local v35 = v32[v33];
    local v36 = nil;
    for v37 = 1, v33 do
        v36 = v32[v37];
        if v36.y > v31.y ~= (v35.y > v31.y) and v31.x < (v35.x - v36.x) * (v31.y - v36.y) / (v35.y - v36.y) + v36.x then
            v34 = not v34;
        end;
        v35 = v36;
    end;
    return v34;
end;
drawScanLineForOccluder = function(v38, v39, v40, v41, v42, v43) --[[ Line: 104 ]] --[[ Name: drawScanLineForOccluder ]]
    -- upvalues: v3 (copy)
    local v44 = math.ceil(v39.X);
    local v45 = v44 - v39.X;
    local v46 = math.ceil(v40.X) - v44;
    local v47 = v39.OneOverZ + v45 * v38.dOneOverZdX;
    local l_v44_0 = v44;
    local l_Y_1 = v39.Y;
    local v50 = false;
    if v46 > 0 then
        while v46 > 0 do
            if v50 == false and IsPointInsidePolygon(Vector3.new(l_v44_0 * v42 - v43, l_Y_1 * v42 - v43, 0), v41) and IsPointInsidePolygon(Vector3.new(l_v44_0 * v42 - v43, l_Y_1 * v42 + v43, 0), v41) then
                v50 = true;
            end;
            if v50 == true then
                local v51 = Vector3.new(l_v44_0 * v42 + v43, l_Y_1 * v42 - v43, 0);
                if IsPointInsidePolygon(v51, v41) == false then
                    return;
                else
                    local v52 = Vector3.new(l_v44_0 * v42 + v43, l_Y_1 * v42 + v43, 0);
                    if IsPointInsidePolygon(v52, v41) == false then
                        return;
                    end;
                end;
            end;
            if v50 == true then
                local v53 = 1 / v47;
                v3.PlotPixel(l_v44_0, l_Y_1, v53);
            end;
            v46 = v46 - 1;
            l_v44_0 = l_v44_0 + 1;
            v47 = v47 + v38.dOneOverZdX;
        end;
    end;
    return false;
end;
v3.TriangleFill = function(_, v55, v56) --[[ Line: 158 ]] --[[ Name: TriangleFill ]]
    -- upvalues: v3 (copy), v8 (copy), v18 (copy)
    v3.PlotPixel = v56;
    local l_y_0 = v55[1].y;
    local l_y_1 = v55[2].y;
    local l_y_2 = v55[3].y;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    if l_y_0 < l_y_1 then
        if l_y_2 < l_y_0 then
            v60 = 3;
            v61 = 1;
            v62 = 2;
            v63 = 0;
            v64 = 1;
        else
            v60 = 1;
            if l_y_1 < l_y_2 then
                v61 = 2;
                v62 = 3;
                v63 = 1;
                v64 = 2;
            else
                v61 = 3;
                v62 = 2;
                v63 = 2;
                v64 = 1;
            end;
        end;
    elseif l_y_2 < l_y_1 then
        v60 = 3;
        v61 = 2;
        v62 = 1;
        v63 = 1;
        v64 = 0;
    else
        v60 = 2;
        if l_y_0 < l_y_2 then
            v61 = 1;
            v62 = 3;
            v63 = 3;
            v64 = 2;
        else
            v61 = 3;
            v62 = 1;
            v63 = 2;
            v64 = 3;
        end;
    end;
    local v65 = v8(v55);
    local v66 = v18(v65, v55, v60, v62);
    local v67 = v18(v65, v55, v60, v61);
    local v68 = v18(v65, v55, v61, v62);
    local v69 = true;
    local v70 = nil;
    local v71 = nil;
    if v63 < v64 then
        v69 = false;
        v70 = v66;
        v71 = v67;
    else
        v69 = true;
        v70 = v67;
        v71 = v66;
    end;
    local l_height_0 = v67.height;
    while true do
        if l_height_0 > 0 then
            l_height_0 = l_height_0 - 1;
            if drawScanLine(v65, v70, v71) == true then
                return true;
            else
                v67.X = v67.X + v67.XStep;
                v67.Y = v67.Y + 1;
                v67.height = v67.height - 1;
                v67.OneOverZ = v67.OneOverZ + v67.OneOverZStep;
                v66.X = v66.X + v66.XStep;
                v66.Y = v66.Y + 1;
                v66.height = v66.height - 1;
                v66.OneOverZ = v66.OneOverZ + v66.OneOverZStep;
            end;
        else
            l_height_0 = v68.height;
            if v69 then
                v70 = v68;
                v71 = v66;
            else
                v70 = v66;
                v71 = v68;
            end;
            while true do
                if l_height_0 > 0 then
                    l_height_0 = l_height_0 - 1;
                    if drawScanLine(v65, v70, v71) == true then
                        return true;
                    else
                        v68.X = v68.X + v68.XStep;
                        v68.Y = v68.Y + 1;
                        v68.height = v68.height - 1;
                        v68.OneOverZ = v68.OneOverZ + v68.OneOverZStep;
                        v66.X = v66.X + v66.XStep;
                        v66.Y = v66.Y + 1;
                        v66.height = v66.height - 1;
                        v66.OneOverZ = v66.OneOverZ + v66.OneOverZStep;
                    end;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
v3.TriangleFillSpecial = function(_, v74, v75, v76, v77) --[[ Line: 262 ]] --[[ Name: TriangleFillSpecial ]]
    -- upvalues: v3 (copy), v8 (copy), v18 (copy)
    v3.PlotPixel = v77;
    local l_y_3 = v74[1].y;
    local l_y_4 = v74[2].y;
    local l_y_5 = v74[3].y;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    if l_y_3 < l_y_4 then
        if l_y_5 < l_y_3 then
            v81 = 3;
            v82 = 1;
            v83 = 2;
            v84 = 0;
            v85 = 1;
        else
            v81 = 1;
            if l_y_4 < l_y_5 then
                v82 = 2;
                v83 = 3;
                v84 = 1;
                v85 = 2;
            else
                v82 = 3;
                v83 = 2;
                v84 = 2;
                v85 = 1;
            end;
        end;
    elseif l_y_5 < l_y_4 then
        v81 = 3;
        v82 = 2;
        v83 = 1;
        v84 = 1;
        v85 = 0;
    else
        v81 = 2;
        if l_y_3 < l_y_5 then
            v82 = 1;
            v83 = 3;
            v84 = 3;
            v85 = 2;
        else
            v82 = 3;
            v83 = 1;
            v84 = 2;
            v85 = 3;
        end;
    end;
    local v86 = v8(v74);
    local v87 = v18(v86, v74, v81, v83);
    local v88 = v18(v86, v74, v81, v82);
    local v89 = v18(v86, v74, v82, v83);
    local v90 = true;
    local v91 = nil;
    local v92 = nil;
    if v84 < v85 then
        v90 = false;
        v91 = v87;
        v92 = v88;
    else
        v90 = true;
        v91 = v88;
        v92 = v87;
    end;
    local l_height_1 = v88.height;
    local v94 = v76 / 2;
    while l_height_1 > 0 do
        l_height_1 = l_height_1 - 1;
        drawScanLineForOccluder(v86, v91, v92, v75, v76, v94);
        v88.X = v88.X + v88.XStep;
        v88.Y = v88.Y + 1;
        v88.height = v88.height - 1;
        v88.OneOverZ = v88.OneOverZ + v88.OneOverZStep;
        v87.X = v87.X + v87.XStep;
        v87.Y = v87.Y + 1;
        v87.height = v87.height - 1;
        v87.OneOverZ = v87.OneOverZ + v87.OneOverZStep;
    end;
    l_height_1 = v89.height;
    if v90 then
        v91 = v89;
        v92 = v87;
    else
        v91 = v87;
        v92 = v89;
    end;
    while l_height_1 > 0 do
        l_height_1 = l_height_1 - 1;
        drawScanLineForOccluder(v86, v91, v92, v75, v76, v94);
        v89.X = v89.X + v89.XStep;
        v89.Y = v89.Y + 1;
        v89.height = v89.height - 1;
        v89.OneOverZ = v89.OneOverZ + v89.OneOverZStep;
        v87.X = v87.X + v87.XStep;
        v87.Y = v87.Y + 1;
        v87.height = v87.height - 1;
        v87.OneOverZ = v87.OneOverZ + v87.OneOverZStep;
    end;
    return false;
end;
return v3;