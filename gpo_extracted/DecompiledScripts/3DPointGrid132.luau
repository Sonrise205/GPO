local l_insert_0 = table.insert;
local v1 = {};
v1.__index = v1;
v1.CreateNode = function(v2, v3, v4, v5, v6) --[[ Line: 6 ]] --[[ Name: CreateNode ]]
    -- upvalues: l_insert_0 (copy)
    assert(v3 ~= nil, "Argument #2 to RectGrid:FillRect cannot be nil");
    local l_CellSize_0 = v2.CellSize;
    local l_Cells_0 = v2.Cells;
    local v9 = (v4 - v4 % l_CellSize_0) * 73856093 + (v5 - v5 % l_CellSize_0) * 19351301 + (v6 - v6 % l_CellSize_0) * 83492791;
    local v10 = {
        v3, 
        v4, 
        v5, 
        v6
    };
    v2.NodePositions[v3] = v9;
    local v11 = l_Cells_0[v9];
    if not v11 then
        l_Cells_0[v9] = {
            v10
        };
        return;
    else
        l_insert_0(v11, v10);
        return;
    end;
end;
v1.MoveNode = function(v12, v13, v14, v15, v16) --[[ Line: 29 ]] --[[ Name: MoveNode ]]
    -- upvalues: l_insert_0 (copy)
    local l_NodePositions_0 = v12.NodePositions;
    local v18 = l_NodePositions_0[v13];
    if v18 then
        local l_Cells_1 = v12.Cells;
        local l_CellSize_1 = v12.CellSize;
        l_Cells_1[v18] = nil;
        local v21 = (v14 - v14 % l_CellSize_1) * 73856093 + (v15 - v15 % l_CellSize_1) * 19351301 + (v16 - v16 % l_CellSize_1) * 83492791;
        local v22 = {
            v13, 
            v14, 
            v15
        };
        l_NodePositions_0[v13] = v21;
        local v23 = l_Cells_1[v18];
        if not v23 then
            l_Cells_1[v18] = {
                v22
            };
            return;
        else
            l_insert_0(v23, v22);
        end;
    end;
end;
v1.GetCellNodes = function(v24, v25, v26, v27) --[[ Line: 56 ]] --[[ Name: GetCellNodes ]]
    local l_CellSize_2 = v24.CellSize;
    return v24.Cells[(v25 - v25 % l_CellSize_2) * 73856093 + (v26 - v26 % l_CellSize_2) * 19351301 + (v27 - v27 % l_CellSize_2) * 83492791];
end;
v1.RadiusSearch = function(v29, v30, v31) --[[ Line: 60 ]] --[[ Name: RadiusSearch ]]
    -- upvalues: l_insert_0 (copy)
    local l_X_0 = v30.X;
    local l_Y_0 = v30.Y;
    local l_Z_0 = v30.Z;
    local l_CellSize_3 = v29.CellSize;
    local v36 = v31 ^ 2;
    local v37 = l_X_0 - v31;
    local v38 = l_X_0 + v31;
    local v39 = l_Y_0 - v31;
    local v40 = l_Y_0 + v31;
    local v41 = l_Z_0 - v31;
    local v42 = l_Z_0 + v31;
    local v43 = {};
    for v44 = v37 - v37 % l_CellSize_3, v38 - v38 % l_CellSize_3, l_CellSize_3 do
        for v45 = v39 - v39 % l_CellSize_3, v40 - v40 % l_CellSize_3, l_CellSize_3 do
            for v46 = v41 - v41 % l_CellSize_3, v42 - v42 % l_CellSize_3, l_CellSize_3 do
                local v47 = v29.Cells[v44 * 73856093 + v45 * 19351301 + v46 * 83492791];
                if v47 then
                    for _, v49 in ipairs(v47) do
                        if (l_X_0 - v49[2]) ^ 2 + (l_Y_0 - v49[3]) ^ 2 + (l_Z_0 - v49[4]) ^ 2 <= v36 then
                            l_insert_0(v43, v49[1]);
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v43;
end;
v1.Cleanup = function(v50) --[[ Line: 90 ]] --[[ Name: Cleanup ]]
    table.clear(v50.Cells);
    table.clear(v50.NodePositions);
end;
return {
    new = function(v51) --[[ Line: 96 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy)
        assert(type(v51) == "number", "Argument #1 to RectGrid.new must be a number");
        return (setmetatable({
            CellSize = v51, 
            Cells = {}, 
            NodePositions = {}
        }, v1));
    end
};