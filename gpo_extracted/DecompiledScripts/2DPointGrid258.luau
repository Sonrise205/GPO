local l_insert_0 = table.insert;
local v1 = {};
v1.__index = v1;
v1.CreateNode = function(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: CreateNode ]]
    -- upvalues: l_insert_0 (copy)
    assert(v3 ~= nil, "Argument #2 to RectGrid:FillRect cannot be nil");
    local l_Position_0 = workspace.CurrentCamera.CFrame.Position;
    if (Vector2.new(l_Position_0.X, l_Position_0.Z) - Vector2.new(v4, v5)).Magnitude ^ 2 > 250000 then
        return;
    else
        local l_CellSize_0 = v2.CellSize;
        local l_Cells_0 = v2.Cells;
        local v9 = v4 - v4 % l_CellSize_0;
        local v10 = v5 - v5 % l_CellSize_0;
        local v11 = v9 * 73856093 + v10 * 19351301;
        local v12 = {
            v3, 
            v4, 
            v5
        };
        v2.NodePositions[v3] = v11;
        local v13 = l_Cells_0[v11];
        if not v13 then
            l_Cells_0[v11] = {
                v12
            };
            return;
        else
            l_insert_0(v13, v12);
            return;
        end;
    end;
end;
v1.MoveNode = function(v14, v15, v16, v17) --[[ Line: 44 ]] --[[ Name: MoveNode ]]
    -- upvalues: l_insert_0 (copy)
    local l_NodePositions_0 = v14.NodePositions;
    local v19 = l_NodePositions_0[v15];
    if v19 then
        local l_Cells_1 = v14.Cells;
        local l_CellSize_1 = v14.CellSize;
        l_Cells_1[v19] = nil;
        local v22 = (v16 - v16 % l_CellSize_1) * 73856093 + (v17 - v17 % l_CellSize_1) * 19351301;
        local v23 = {
            v15, 
            v16, 
            v17
        };
        l_NodePositions_0[v15] = v22;
        local v24 = l_Cells_1[v19];
        if not v24 then
            l_Cells_1[v19] = {
                v23
            };
            return;
        else
            l_insert_0(v24, v23);
            return;
        end;
    else
        v14:CreateNode(v15, v16, v17);
        return;
    end;
end;
v1.GetCellNodes = function(v25, v26, v27) --[[ Line: 74 ]] --[[ Name: GetCellNodes ]]
    local l_CellSize_2 = v25.CellSize;
    return v25.Cells[(v26 - v26 % l_CellSize_2) * 73856093 + (v27 - v27 % l_CellSize_2) * 19351301];
end;
v1.RadiusSearch = function(v29, v30, v31, v32) --[[ Line: 81 ]] --[[ Name: RadiusSearch ]]
    local l_CellSize_3 = v29.CellSize;
    local v34 = v32 ^ 2;
    local v35 = v30 - v32;
    local v36 = v30 + v32;
    local v37 = v31 - v32;
    local v38 = v31 + v32;
    local v39 = {};
    local l_Cells_2 = v29.Cells;
    for v41 = v35 - v35 % l_CellSize_3, v36 - v36 % l_CellSize_3, l_CellSize_3 do
        for v42 = v37 - v37 % l_CellSize_3, v38 - v38 % l_CellSize_3, l_CellSize_3 do
            local v43 = l_Cells_2[v41 * 73856093 + v42 * 19351301];
            if v43 then
                for _, v45 in ipairs(v43) do
                    local v46 = v30 - v45[2];
                    local v47 = v31 - v45[3];
                    if v46 * v46 + v47 * v47 <= v34 then
                        table.insert(v39, v45[1]);
                    end;
                end;
            end;
        end;
    end;
    return v39;
end;
local _ = function(v48) --[[ Line: 109 ]] --[[ Name: countTableEntries ]]
    local v49 = 0;
    for _ in pairs(v48) do
        v49 = v49 + 1;
    end;
    return v49;
end;
v1.CleanupFarNodes = function(v52, v53, v54) --[[ Line: 117 ]] --[[ Name: CleanupFarNodes ]]
    local v55 = v54 ^ 2;
    local v56 = {};
    local v57 = {};
    for v58, v59 in pairs(v52.Cells) do
        for v60, v61 in ipairs(v59) do
            if v55 < (v53 - Vector2.new(v61[2], v61[3])).Magnitude ^ 2 then
                v57[v61[1]] = true;
                table.insert(v56, {
                    v58, 
                    v60
                });
            end;
        end;
    end;
    for _, v63 in ipairs(v56) do
        local v64, v65 = unpack(v63);
        table.remove(v52.Cells[v64], v65);
        if #v52.Cells[v64] == 0 then
            v52.Cells[v64] = nil;
        end;
    end;
    for v66 in pairs(v57) do
        v52.NodePositions[v66] = nil;
    end;
end;
return {
    new = function(v67) --[[ Line: 149 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy)
        assert(type(v67) == "number", "Argument #1 to RectGrid.new must be a number");
        local v68 = {
            CellSize = v67, 
            Cells = {}, 
            NodePositions = {}
        };
        setmetatable(v68, v1);
        task.spawn(function() --[[ Line: 159 ]]
            -- upvalues: v68 (copy)
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            while true do
                if l_CurrentCamera_0 then
                    local v70 = Vector2.new(l_CurrentCamera_0.CFrame.Position.X, l_CurrentCamera_0.CFrame.Position.Z);
                    v68:CleanupFarNodes(v70, 500);
                end;
                task.wait(5);
            end;
        end);
        return v68;
    end
};