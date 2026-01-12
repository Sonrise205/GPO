local function _(v0) --[[ Line: 1 ]] --[[ Name: SafeUnit ]]
    if v0.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v0.Unit;
    end;
end;
local function v24(v2, v3, v4) --[[ Line: 9 ]] --[[ Name: ClosestPointFunc ]]
    local v5 = v2:pointToObjectSpace(v4);
    local l_x_0 = v3.x;
    local l_y_0 = v3.y;
    local l_z_0 = v3.z;
    local l_x_1 = v5.x;
    local l_y_1 = v5.y;
    local l_z_1 = v5.z;
    local v12 = math.clamp(l_x_1, -l_x_0 * 0.5, l_x_0 * 0.5);
    local v13 = math.clamp(l_y_1, -l_y_0 * 0.5, l_y_0 * 0.5);
    local v14 = math.clamp(l_z_1, -l_z_0 * 0.5, l_z_0 * 0.5);
    if v12 ~= l_x_1 or v13 ~= l_y_1 or v14 ~= l_z_1 then
        local v15 = v2 * Vector3.new(v12, v13, v14);
        local v16 = v4 - v15;
        return false, v15, if v16.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v16.Unit;
    else
        local v17 = l_x_1 - l_x_0 * 0.5;
        local v18 = l_y_1 - l_y_0 * 0.5;
        local v19 = l_z_1 - l_z_0 * 0.5;
        local v20 = -l_x_1 - l_x_0 * 0.5;
        local v21 = -l_y_1 - l_y_0 * 0.5;
        local v22 = -l_z_1 - l_z_0 * 0.5;
        local v23 = math.max(v17, v18, v19, v20, v21, v22);
        if v23 == v17 then
            return true, v2 * Vector3.new(l_x_0 * 0.5, l_y_1, l_z_1), v2.XVector;
        elseif v23 == v18 then
            return true, v2 * Vector3.new(l_x_1, l_y_0 * 0.5, l_z_1), v2.YVector;
        elseif v23 == v19 then
            return true, v2 * Vector3.new(l_x_1, l_y_1, l_z_0 * 0.5), v2.ZVector;
        elseif v23 == v20 then
            return true, v2 * Vector3.new(-l_x_0 * 0.5, l_y_1, l_z_1), -v2.XVector;
        elseif v23 == v21 then
            return true, v2 * Vector3.new(l_x_1, -l_y_0 * 0.5, l_z_1), -v2.YVector;
        elseif v23 == v22 then
            return true, v2 * Vector3.new(l_x_1, l_y_1, -l_z_0 * 0.5), -v2.ZVector;
        else
            warn("CLOSEST POINT ON BOX FAIL");
            return false, v2.Position, (Vector3.new(0, 0, 0, 0));
        end;
    end;
end;
return function(v25, v26, v27, v28) --[[ Line: 60 ]]
    -- upvalues: v24 (copy)
    local v29, v30, v31 = v24(v25, v26, v27);
    if v29 then
        return v29, v30, v31;
    else
        return (v30 - v27).Magnitude < v28, v30, v31;
    end;
end;