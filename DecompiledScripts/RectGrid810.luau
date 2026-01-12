local v0 = {};
v0.__index = v0;
v0.SnapToGrid = function(v1, v2) --[[ Line: 4 ]] --[[ Name: SnapToGrid ]]
    return v2 - v2 % v1.CellSize;
end;
v0.FillRect = function(v3, v4, v5, v6, v7, v8) --[[ Line: 7 ]] --[[ Name: FillRect ]]
    assert(typeof(v4) == "Rect", "Argument #1 to RectGrid:FillRect must be a Rect datatype");
    assert(v5 ~= nil, "Argument #2 to RectGrid:FillRect cannot be nil");
    local v9 = true;
    if v7 ~= nil then
        v9 = type(v7) == "number";
    end;
    assert(v9, "Argument #3 to 'RectGrid:FillRect' must be a number");
    v9 = true;
    if v8 ~= nil then
        v9 = typeof(v8) == "Vector2";
    end;
    assert(v9, "Argument #4 to 'RectGrid:FillRect' must be a Vector2");
    v7 = v7 or 0;
    local l_Min_0 = v4.Min;
    v9 = v4.Max;
    local l_X_0 = l_Min_0.X;
    local l_X_1 = v9.X;
    local l_Y_0 = l_Min_0.Y;
    local l_Y_1 = v9.Y;
    local v15 = l_Min_0:lerp(v9, 0.5);
    v15 = CFrame.new(v15.X, 0, v15.Y);
    local v16 = {
        v6 and v15 * CFrame.Angles(0, math.rad(v6), 0) or v15, 
        (v8 and v8.X or v9.X - l_Min_0.X) / 2, 
        (v8 and v8.Y or v9.Y - l_Min_0.Y) / 2, 
        v7, 
        v5
    };
    for v17 = v3:SnapToGrid(l_X_0), v3:SnapToGrid(l_X_1), v3.CellSize do
        for v18 = v3:SnapToGrid(l_Y_0), v3:SnapToGrid(l_Y_1), v3.CellSize do
            local v19 = v17 * 73856093 + v18 * 19351301;
            local v20 = v3.Cells[v19];
            if not v20 then
                v3.Cells[v19] = {
                    v16
                };
            else
                table.insert(v20, v16);
            end;
        end;
    end;
end;
v0.GetPointData = function(v21, v22, v23) --[[ Line: 46 ]] --[[ Name: GetPointData ]]
    local l_CellSize_0 = v21.CellSize;
    local v25 = v21.Cells[(v22 - v22 % l_CellSize_0) * 73856093 + (v23 - v23 % l_CellSize_0) * 19351301];
    if v25 then
        local v26 = Vector3.new(v22, 0, v23);
        local v27 = -1e999;
        local v28 = nil;
        for _, v30 in next, v25 do
            local v31 = v30[1]:PointToObjectSpace(v26);
            if v31.X > -v30[2] and v31.X < v30[2] and v31.Z > -v30[3] and v31.Z < v30[3] and v27 < v30[4] then
                v28 = v30;
                v27 = v30[4];
            end;
        end;
        return v28 and v28[5];
    else
        return;
    end;
end;
return {
    new = function(v32) --[[ Line: 72 ]] --[[ Name: new ]]
        -- upvalues: v0 (copy)
        assert(type(v32) == "number", "Argument #1 to RectGrid.new must be cell size");
        return (setmetatable({
            CellSize = v32, 
            Cells = {}
        }, v0));
    end
};