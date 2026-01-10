local v0 = {};
v0.__index = v0;
v0.SnapToGrid = function(v1, v2) --[[ Line: 4 ]] --[[ Name: SnapToGrid ]]
    return v2 - v2 % v1.CellSize;
end;
v0.FillCuboid = function(v3, v4, v5, v6) --[[ Line: 7 ]] --[[ Name: FillCuboid ]]
    local v7 = false;
    if type(v4) == "table" then
        v7 = v4.__type == "Cuboid";
    end;
    assert(v7, "Argument #1 to CuboidGrid:FillCuboid must be a Cuboid datatype");
    assert(v5 ~= nil, "Argument #2 to CuboidGrid:FillCuboid cannot be nil");
    v7 = true;
    if v6 ~= nil then
        v7 = type(v6) == "number";
    end;
    assert(v7, "Argument #3 to CuboidGrid:FillCuboid must be a number");
    v6 = v6 or 0;
    local l_Min_0 = v4.Min;
    v7 = v4.Max;
    local l_X_0 = l_Min_0.X;
    local l_X_1 = v7.X;
    local l_Y_0 = l_Min_0.Y;
    local l_Y_1 = v7.Y;
    local l_Z_0 = l_Min_0.Z;
    local l_Z_1 = v7.Z;
    local v15 = {
        l_X_0, 
        l_Y_0, 
        l_Z_0, 
        l_X_1, 
        l_Y_1, 
        l_Z_1, 
        v6, 
        v5
    };
    for v16 = v3:SnapToGrid(l_X_0), v3:SnapToGrid(l_X_1), v3.CellSize do
        for v17 = v3:SnapToGrid(l_Y_0), v3:SnapToGrid(l_Y_1), v3.CellSize do
            for v18 = v3:SnapToGrid(l_Z_0), v3:SnapToGrid(l_Z_1), v3.CellSize do
                local v19 = v16 * 73856093 + v17 * 19351301 + v18 * 83492791;
                local v20 = v3.Cells[v19];
                if not v20 then
                    v3.Cells[v19] = {
                        v15
                    };
                else
                    table.insert(v20, v15);
                end;
            end;
        end;
    end;
end;
v0.GetPointData = function(v21, v22, v23, v24) --[[ Line: 46 ]] --[[ Name: GetPointData ]]
    debug.profilebegin("Get data");
    local l_CellSize_0 = v21.CellSize;
    local v26 = v21.Cells[(v22 - v22 % l_CellSize_0) * 73856093 + (v23 - v23 % l_CellSize_0) * 19351301 + (v24 - v24 % l_CellSize_0) * 83492791];
    debug.profileend();
    if v26 then
        local v27 = nil;
        local v28 = nil;
        debug.profilebegin("Get cuboid");
        for _, v30 in next, v26 do
            if v30[1] <= v22 and v22 <= v30[4] and v30[2] <= v23 and v23 <= v30[5] and v30[3] <= v24 and v24 <= v30[6] and (v27 == nil or v28 < v30[7]) then
                v27 = v30;
                v28 = v30[7];
            end;
        end;
        debug.profileend();
        return v27 and v27[8];
    else
        return;
    end;
end;
return {
    new = function(v31) --[[ Line: 74 ]] --[[ Name: new ]]
        -- upvalues: v0 (copy)
        assert(type(v31) == "number", "Argument #1 to CuboidGrid.new must be cell size");
        return (setmetatable({
            CellSize = v31, 
            Cells = {}
        }, v0));
    end
};