local _ = {
    {
        0.25, 
        0.25, 
        -0.25
    }, 
    {
        -0.25, 
        0.25, 
        -0.25
    }, 
    {
        0.25, 
        0.25, 
        0.25
    }, 
    {
        -0.25, 
        0.25, 
        0.25
    }, 
    {
        0.25, 
        -0.25, 
        -0.25
    }, 
    {
        -0.25, 
        -0.25, 
        -0.25
    }, 
    {
        0.25, 
        -0.25, 
        0.25
    }, 
    {
        -0.25, 
        -0.25, 
        0.25
    }
};
local v1 = {};
local function v2(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 23 ]] --[[ Name: GetNeighborsWithinRadius ]]
    -- upvalues: v2 (copy)
    if not v10 then
        error("Missing MaxDepth.");
    end;
    local v13 = v4 + 0.8660254037844386 * (v3.Size[1] / 2);
    local v14 = v13 * v13 + 1.0E-6;
    local v15 = v4 * v4;
    for _, v17 in next, v3.SubRegions do
        local l_Position_0 = v17.Position;
        local v19 = l_Position_0[1];
        local v20 = l_Position_0[2];
        local v21 = l_Position_0[3];
        local v22 = v5 - v19;
        local v23 = v6 - v20;
        local v24 = v7 - v21;
        if v22 * v22 + v23 * v23 + v24 * v24 <= v14 then
            if v17.Depth == v10 then
                for v25 in next, v17.Nodes do
                    local l_PositionX_0 = v25.PositionX;
                    local l_PositionY_0 = v25.PositionY;
                    local l_PositionZ_0 = v25.PositionZ;
                    local v29 = l_PositionX_0 - v5;
                    local v30 = l_PositionY_0 - v6;
                    local v31 = l_PositionZ_0 - v7;
                    local v32 = v29 * v29 + v30 * v30 + v31 * v31;
                    if v32 <= v15 then
                        v11 = v11 + 1;
                        v12 = v12 + 1;
                        v8[v11] = v25.Object;
                        v9[v12] = v32;
                    end;
                end;
            else
                local v33, v34 = v2(v17, v4, v5, v6, v7, v8, v9, v10, v11, v12);
                v11 = v33;
                v12 = v34;
            end;
        end;
    end;
    return v11, v12;
end;
v1.GetNeighborsWithinRadius = v2;
return v1;