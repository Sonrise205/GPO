local v0 = {};
local _ = {};
sum = function(v2) --[[ Line: 8 ]] --[[ Name: sum ]]
    local v3 = 0;
    for _, v5 in v2 do
        v3 = v3 + v5;
    end;
    return v3;
end;
local l_Part_0 = Instance.new("Part");
l_Part_0.Material = Enum.Material.Plastic;
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.BrickColor = BrickColor.Blue();
local v7 = {};
local v8 = Instance.new("Model", game.Workspace);
drawline = function(v9, v10, v11) --[[ Line: 24 ]] --[[ Name: drawline ]]
    -- upvalues: v7 (copy), l_Part_0 (copy), v8 (copy)
    if not v7[v9] then
        v7[v9] = l_Part_0:Clone();
        v7[v9].Parent = v8;
    end;
    v7[v9].Size = Vector3.new(0.2, 0.2, v11.magnitude);
    v7[v9].CFrame = CFrame.new(v10 + v11 / 2, v10 + v11);
    return v7[v9];
end;
v0.new = function(v12, v13) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v14 = setmetatable({}, {
        __index = v0
    });
    local v15 = {};
    for v16 = 1, #v12 - 1 do
        v15[v16] = (v12[v16] - v12[v16 + 1]).magnitude;
    end;
    v14.n = #v12;
    v14.tolerance = 0.1;
    v14.target = v13;
    v14.joints = v12;
    v14.lengths = v15;
    v14.origin = v12[1];
    v14.totallength = sum(v15);
    v14.constrained = false;
    v14.left = 1.5707963267948966;
    v14.right = 1.5707963267948966;
    v14.up = 1.5707963267948966;
    v14.down = 1.5707963267948966;
    return v14;
end;
v0.constrain = function(v17, v18, v19, v20) --[[ Line: 59 ]] --[[ Name: constrain ]]
    local v21 = v18:Dot(v19) / v19.magnitude;
    local v22 = v21 * v19.unit;
    local v23 = {
        v20:vectorToWorldSpace(Vector3.FromNormalId(Enum.NormalId.Top)), 
        v20:vectorToWorldSpace(Vector3.FromNormalId(Enum.NormalId.Bottom))
    };
    local v24 = {
        v20:vectorToWorldSpace(Vector3.FromNormalId(Enum.NormalId.Right)), 
        v20:vectorToWorldSpace(Vector3.FromNormalId(Enum.NormalId.Left))
    };
    table.sort(v23, function(v25, v26) --[[ Line: 66 ]]
        -- upvalues: v18 (copy)
        return (v25 - v18).magnitude < (v26 - v18).magnitude;
    end);
    table.sort(v24, function(v27, v28) --[[ Line: 67 ]]
        -- upvalues: v18 (copy)
        return (v27 - v18).magnitude < (v28 - v18).magnitude;
    end);
    local v29 = v23[1];
    local v30 = v24[1];
    local v31 = v18 - v22;
    if v21 < 0 then
        v22 = -v22;
    end;
    local v32 = v31:Dot(v30);
    local v33 = v31:Dot(v29);
    local v34 = -(v22.magnitude * math.tan(v17.left));
    local v35 = v22.magnitude * math.tan(v17.right);
    local v36 = v22.magnitude * math.tan(v17.up);
    local v37 = -(v22.magnitude * math.tan(v17.down));
    local v38 = v32 >= 0 and v35 or v34;
    local v39 = v33 >= 0 and v36 or v37;
    local l_v18_0 = v18;
    local v41 = v32 ^ 2 / v38 ^ 2 + v33 ^ 2 / v39 ^ 2;
    local v42 = false;
    if v41 <= 1 then
        v42 = v21 >= 0;
    end;
    if not v42 then
        local v43 = math.atan2(v33, v32);
        local v44 = v38 * math.cos(v43);
        local v45 = v39 * math.sin(v43);
        l_v18_0 = (v22 + v30 * v44 + v29 * v45).unit * v18.magnitude;
    end;
    return l_v18_0;
end;
v0.backward = function(v46) --[[ Line: 112 ]] --[[ Name: backward ]]
    v46.joints[v46.n] = v46.target;
    for v47 = v46.n - 1, 1, -1 do
        local v48 = v46.joints[v47 + 1] - v46.joints[v47];
        local v49 = v46.lengths[v47] / v48.magnitude;
        local v50 = (1 - v49) * v46.joints[v47 + 1] + v49 * v46.joints[v47];
        v46.joints[v47] = v50;
    end;
end;
v0.forward = function(v51) --[[ Line: 124 ]] --[[ Name: forward ]]
    v51.joints[1] = v51.origin;
    local l_unit_0 = (v51.joints[2] - v51.joints[1]).unit;
    for v53 = 1, v51.n - 1 do
        local v54 = v51.joints[v53 + 1] - v51.joints[v53];
        local v55 = v51.lengths[v53] / v54.magnitude;
        local v56 = CFrame.new(v51.joints[v53], v51.joints[v53] + l_unit_0);
        local v57 = (1 - v55) * v51.joints[v53] + v55 * v51.joints[v53 + 1];
        local v58 = v51:constrain(v57 - v51.joints[v53], l_unit_0, v56);
        v51.joints[v53 + 1] = v51.constrained and v51.joints[v53] + v58 or v57;
        l_unit_0 = v51.joints[v53 + 1] - v51.joints[v53];
    end;
end;
v0.solve = function(v59) --[[ Line: 141 ]] --[[ Name: solve ]]
    local l_magnitude_0 = (v59.joints[1] - v59.target).magnitude;
    if v59.totallength < l_magnitude_0 then
        for v61 = 1, v59.n - 1 do
            local l_magnitude_1 = (v59.target - v59.joints[v61]).magnitude;
            local v63 = v59.lengths[v61] / l_magnitude_1;
            v59.joints[v61 + 1] = (1 - v63) * v59.joints[v61] + v63 * v59.target;
        end;
        v59:backward();
        v59:forward();
        return;
    else
        local v64 = 0;
        local l_magnitude_2 = (v59.joints[v59.n] - v59.target).magnitude;
        local v66 = l_magnitude_2 < v59.tolerance and l_magnitude_0 or l_magnitude_2;
        while v59.tolerance < v66 do
            v59:backward();
            v59:forward();
            l_magnitude_2 = v66;
            v64 = v64 + 1;
            if v64 > 10 then
                break;
            end;
        end;
        return;
    end;
end;
return v0;