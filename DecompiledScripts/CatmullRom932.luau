local v0 = {};
local l_new_0 = Vector3.new;
local l_new_1 = CFrame.new;
local function v10(v3, v4, v5, v6, v7) --[[ Line: 8 ]] --[[ Name: solve ]]
    -- upvalues: l_new_0 (copy)
    local v8 = v7 * v7;
    local v9 = v8 * v7;
    return (l_new_0((v3[1] + v4[1] * v7 + v5[1] * v8 + v6[1] * v9) / 2, (v3[2] + v4[2] * v7 + v5[2] * v8 + v6[2] * v9) / 2, (v3[3] + v4[3] * v7 + v5[3] * v8 + v6[3] * v9) / 2));
end;
local l_v10_0 = v10 --[[ copy: 3 -> 4 ]];
v0.create = function(v12, v13, v14, v15) --[[ Line: 21 ]] --[[ Name: create ]]
    -- upvalues: l_v10_0 (copy), v0 (copy)
    local v16 = {
        2 * v13.X, 
        2 * v13.Y, 
        2 * v13.Z
    };
    local v17 = {
        -v12.X + v14.X, 
        -v12.Y + v14.Y, 
        -v12.Z + v14.Z
    };
    local v18 = {
        2 * v12.X - 5 * v13.X + 4 * v14.X - v15.X, 
        2 * v12.Y - 5 * v13.Y + 4 * v14.Y - v15.Y, 
        2 * v12.Z - 5 * v13.Z + 4 * v14.Z - v15.Z
    };
    local v19 = {
        -v12.X + 3 * v13.X - 3 * v14.X + v15.X, 
        -v12.Y + 3 * v13.Y - 3 * v14.Y + v15.Y, 
        -v12.Z + 3 * v13.Z - 3 * v14.Z + v15.Z
    };
    return (setmetatable({
        cA = v16, 
        cB = v17, 
        cC = v18, 
        cD = v19, 
        length = (function() --[[ Line: 33 ]]
            -- upvalues: l_v10_0 (ref), v16 (copy), v17 (copy), v18 (copy), v19 (copy)
            local v20 = 0;
            local v21 = l_v10_0(v16, v17, v18, v19, 0);
            for v22 = 0, 0.95, 0.05 do
                local v23 = l_v10_0(v16, v17, v18, v19, v22 + 0.05);
                v20 = v20 + (v23 - v21).magnitude;
                v21 = v23;
            end;
            return v20 * 0.05;
        end)()
    }, {
        __index = v0
    }));
end;
v0.Solve = function(v24, v25) --[[ Line: 50 ]] --[[ Name: Solve ]]
    -- upvalues: l_v10_0 (copy)
    return (l_v10_0(v24.cA, v24.cB, v24.cC, v24.cD, v25));
end;
v0.SolveNorm = function(v26, v27, v28) --[[ Line: 56 ]] --[[ Name: SolveNorm ]]
    -- upvalues: l_new_1 (copy)
    return l_new_1(v26:Solve(v27), v26:Solve(v27 + (v28 or 0.01)));
end;
v10 = {};
v10.create = function(v29) --[[ Line: 66 ]] --[[ Name: create ]]
    -- upvalues: v0 (copy), v10 (copy)
    assert(#v29 >= 4, "At least four points are required to construct a spline path");
    local v30 = {};
    local v31 = 0;
    local v32 = nil;
    local v33 = nil;
    local v34 = #v29;
    local v35 = v29[1] == v29[v34];
    local v36 = nil;
    v36 = if v35 then v0.create(v29[2]:Lerp(v29[1], 2), v29[1], v29[2], v29[3]) else v0.create(v29[v34], v29[1], v29[2], v29[3]);
    v31 = v31 + v36.length;
    v30[1] = v36;
    for v37, v38 in v29 do
        local v39 = v29[v37 + 1];
        if v32 and v33 and v39 then
            local v40 = v0.create(v32, v33, v38, v39);
            v31 = v31 + v40.length;
            v30[#v30 + 1] = v40;
        end;
        v32 = v33;
        v33 = v38;
    end;
    local v41 = nil;
    v41 = if v35 then v0.create(v29[v34 - 2], v29[v34 - 1], v29[v34], v29[v34 - 1]:Lerp(v29[v34], 2)) else v0.create(v29[v34 - 2], v29[v34 - 1], v29[v34], v29[1]);
    v31 = v31 + v41.length;
    v30[#v30 + 1] = v41;
    v41 = {};
    local v42 = 0;
    for v43 = 1, #v30 do
        v42 = v42 + v30[v43].length;
        v41[v43] = v42 / v31;
    end;
    v42 = #v41;
    local function v48(v44) --[[ Line: 113 ]] --[[ Name: GetPointOnPath ]]
        -- upvalues: v42 (copy), v41 (copy), v30 (copy), v31 (ref)
        local v45 = nil;
        local v46 = nil;
        for v47 = 1, v42 do
            if v44 < v41[v47] or v47 == v42 then
                v46 = (v44 - (v41[v47 - 1] or 0)) / v30[v47].length * v31;
                v45 = v30[v47];
                break;
            end;
        end;
        return v45:Solve(v46);
    end;
    return (setmetatable({
        parts = v30, 
        length = v31, 
        GetPointOnPath = v48
    }, {
        __index = v10
    }));
end;
return {
    Spline = v0, 
    Path = v10
};