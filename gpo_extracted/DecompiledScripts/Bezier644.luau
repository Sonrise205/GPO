local v0 = {};
v0.__index = v0;
v0.new = function(...) --[[ Line: 125 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {
        ...
    };
    assert(#v1 >= 3, "Must have at least 3 points");
    local v2 = #v1 == 3;
    local v3 = #v1 == 4;
    local v4 = {};
    local l_new_0 = Vector3.new;
    local l_lerp_0 = l_new_0().lerp;
    local v7 = nil;
    local v8 = {};
    local v9 = 0;
    local v10 = nil;
    local function v16(v11) --[[ Line: 150 ]] --[[ Name: CreatePoint ]]
        -- upvalues: l_new_0 (copy), l_lerp_0 (copy)
        return {
            v11.X, 
            v11.Y, 
            v11.Z; 
            ToVector3 = function(v12) --[[ Line: 153 ]] --[[ Name: ToVector3 ]]
                -- upvalues: l_new_0 (ref)
                return (l_new_0(v12[1], v12[2], v12[3]));
            end, 
            lerp = function(v13, v14, v15) --[[ Line: 156 ]] --[[ Name: lerp ]]
                -- upvalues: l_lerp_0 (ref)
                return l_lerp_0(v13:ToVector3(), v14:ToVector3(), v15);
            end
        };
    end;
    if not v2 and not v3 then
        for v17 = 1, #v1 - 1 do
            local v18 = v16(v1[v17]);
            local v19 = {
                v18, 
                v16(v1[v17 + 1]), 
                (v16(v18))
            };
            v8[#v8 + 1] = v19;
        end;
        local l_v8_0 = v8;
        for v21 = #v8, 2, -1 do
            local v22 = {};
            for v23 = 1, v21 - 1 do
                local v24 = l_v8_0[v23];
                local v25 = l_v8_0[v23 + 1];
                local v26 = {
                    v24[3], 
                    v25[3], 
                    (v16(v24[3]))
                };
                v22[v23] = v26;
                v8[#v8 + 1] = v26;
            end;
            l_v8_0 = v22;
        end;
        v10 = l_v8_0[1];
        v9 = #v8;
    end;
    if v2 then
        local v27 = v1[1];
        local v28 = v1[2];
        local v29 = v1[3];
        v4.Get = function(_, v31, v32) --[[ Line: 201 ]] --[[ Name: Get ]]
            -- upvalues: v27 (copy), v28 (copy), v29 (copy)
            if v32 then
                v31 = v31 < 0 and 0 or v31 > 1 and 1 or v31;
            end;
            return (1 - v31) * (1 - v31) * v27 + 2 * (1 - v31) * v31 * v28 + v31 * v31 * v29;
        end;
    elseif v3 then
        local v33 = v1[1];
        local v34 = v1[2];
        local v35 = v1[3];
        local v36 = v1[4];
        v4.Get = function(_, v38, v39) --[[ Line: 213 ]] --[[ Name: Get ]]
            -- upvalues: v33 (copy), v34 (copy), v35 (copy), v36 (copy)
            if v39 then
                v38 = v38 < 0 and 0 or v38 > 1 and 1 or v38;
            end;
            return (1 - v38) * (1 - v38) * (1 - v38) * v33 + 3 * (1 - v38) * (1 - v38) * v38 * v34 + 3 * (1 - v38) * v38 * v38 * v35 + v38 * v38 * v38 * v36;
        end;
    else
        v4.Get = function(_, v41, v42) --[[ Line: 222 ]] --[[ Name: Get ]]
            -- upvalues: v9 (ref), v8 (copy), v10 (ref)
            if v42 then
                v41 = v41 < 0 and 0 or v41 > 1 and 1 or v41;
            end;
            for v43 = 1, v9 do
                local v44 = v8[v43];
                local v45 = v44[1]:lerp(v44[2], v41);
                local v46 = v44[3];
                local l_X_0 = v45.X;
                local l_Y_0 = v45.Y;
                local l_Z_0 = v45.Z;
                v46[1] = l_X_0;
                v46[2] = l_Y_0;
                v46[3] = l_Z_0;
            end;
            return v10[3]:ToVector3();
        end;
    end;
    v4.GetLength = function(v50, v51) --[[ Line: 240 ]] --[[ Name: GetLength ]]
        -- upvalues: v7 (ref)
        if not v7 then
            local l_v50_Path_0 = v50:GetPath(v51 or 0.1);
            local v53 = 0;
            for v54 = 2, #l_v50_Path_0 do
                v53 = v53 + (l_v50_Path_0[v54 - 1] - l_v50_Path_0[v54]).Magnitude;
            end;
            v7 = v53;
        end;
        return v7;
    end;
    v4.GetPath = function(v55, v56) --[[ Line: 256 ]] --[[ Name: GetPath ]]
        assert(type(v56) == "number", "Must provide a step increment");
        local v57 = false;
        if v56 > 0 then
            v57 = v56 < 1;
        end;
        assert(v57, "Step out of domain; should be between 0 and 1 (exclusive)");
        local v58 = {};
        v57 = 0;
        for v59 = 0, 1, v56 do
            v57 = v59;
            v58[#v58 + 1] = v55:Get(v59);
        end;
        if v57 < 1 then
            local v60 = 1 - v57 < v56 * 0.5;
            v58[#v58 + (v60 and 0 or 1)] = v55:Get(1);
        end;
        return v58;
    end;
    v4.GetPathByNumberSegments = function(v61, v62) --[[ Line: 275 ]] --[[ Name: GetPathByNumberSegments ]]
        assert(type(v62) == "number", "Must provide number of segments");
        assert(v62 > 0, "Number of segments must be greater than 0");
        return v61:GetPath(1 / v62);
    end;
    v4.GetPathBySegmentLength = function(v63, v64) --[[ Line: 282 ]] --[[ Name: GetPathBySegmentLength ]]
        assert(type(v64) == "number", "Must provide a segment length");
        assert(v64 > 0, "Segment length must be greater than 0");
        return v63:GetPathByNumberSegments((math.floor(v63:GetLength() / v64 + 0.5)));
    end;
    v4.GetPoints = function(_) --[[ Line: 292 ]] --[[ Name: GetPoints ]]
        -- upvalues: v1 (copy)
        return v1;
    end;
    return (setmetatable(v4, v0));
end;
return v0;