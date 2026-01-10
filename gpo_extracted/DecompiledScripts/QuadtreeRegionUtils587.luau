local l_insert_0 = table.insert;
local v1 = {
    {
        0.25, 
        0.25
    }, 
    {
        -0.25, 
        0.25
    }, 
    {
        0.25, 
        0.25
    }, 
    {
        -0.25, 
        0.25
    }, 
    {
        0.25, 
        -0.25
    }, 
    {
        -0.25, 
        -0.25
    }, 
    {
        0.25, 
        -0.25
    }, 
    {
        -0.25, 
        -0.25
    }
};
local v17 = {
    create = function(v2, v3, v4, v5, v6, v7) --[[ Line: 21 ]] --[[ Name: create ]]
        local v8 = v4 / 2;
        local v9 = v5 / 2;
        return {
            subRegions = {}, 
            lowerBounds = {
                v2 - v8, 
                v3 - v9
            }, 
            upperBounds = {
                v2 + v8, 
                v3 + v9
            }, 
            position = {
                v2, 
                v3
            }, 
            size = {
                v4, 
                v5
            }, 
            parent = v6, 
            depth = v6 and v6.depth + 1 or 1, 
            parentIndex = v7, 
            nodes = {}, 
            node_count = 0
        };
    end, 
    removeNode = function(v10, v11) --[[ Line: 53 ]] --[[ Name: removeNode ]]
        assert(v11);
        local l_v10_0 = v10;
        while l_v10_0 do
            local l_nodes_0 = l_v10_0.nodes;
            assert(l_nodes_0[v11]);
            local v14 = l_v10_0.node_count - 1;
            assert(v14 > 1);
            l_nodes_0[v11] = nil;
            l_v10_0.node_count = v14;
            local l_parent_0 = l_v10_0.parent;
            local l_parentIndex_0 = l_v10_0.parentIndex;
            if v14 <= 0 and l_parentIndex_0 then
                assert(l_parent_0);
                assert(l_parent_0.subRegions[l_parentIndex_0] == l_v10_0);
                l_parent_0.subRegions[l_parentIndex_0] = nil;
            end;
            l_v10_0 = l_parent_0;
        end;
    end
};
v17.getNeighborsWithinRadius = function(v18, v19, v20, v21, v22, v23, v24) --[[ Line: 84 ]] --[[ Name: getNeighborsWithinRadius ]]
    -- upvalues: l_insert_0 (copy), v17 (copy)
    local v25 = (v19 + 0.8660254037844386 * v18.size[1] / 2) ^ 2 + 1.0E-6;
    local v26 = v19 * v19;
    for _, v28 in pairs(v18.subRegions) do
        local l_position_0 = v28.position;
        if (v20 - l_position_0[1]) ^ 2 + (v21 - l_position_0[2]) ^ 2 <= v25 then
            if v28.depth == v24 then
                for v30 in pairs(v28.nodes) do
                    local v31 = (v20 - v30._px) ^ 2 + (v21 - v30._py) ^ 2;
                    if v31 <= v26 then
                        l_insert_0(v22, v30._object);
                        l_insert_0(v23, v31);
                    end;
                end;
            else
                v17.getNeighborsWithinRadius(v28, v19, v20, v21, v22, v23, v24);
            end;
        end;
    end;
end;
v17.getOrCreateSubRegionAtDepth = function(v32, v33, v34, v35) --[[ Line: 110 ]] --[[ Name: getOrCreateSubRegionAtDepth ]]
    -- upvalues: v17 (copy)
    local l_v32_0 = v32;
    for _ = v32.depth, v35 do
        local l_position_1 = l_v32_0.position;
        local v39 = (l_position_1[1] < v33 and 1 or 2) + (v34 <= l_position_1[2] and 4 or 0);
        local v40 = l_v32_0.subRegions[v39];
        if not v40 then
            v40 = v17.createSubRegion(l_v32_0, v39);
            l_v32_0.subRegions[v39] = v40;
        end;
        l_v32_0 = v40;
    end;
    return l_v32_0;
end;
v17.createSubRegion = function(v41, v42) --[[ Line: 130 ]] --[[ Name: createSubRegion ]]
    -- upvalues: v1 (copy), v17 (copy)
    local l_size_0 = v41.size;
    local l_position_2 = v41.position;
    local v45 = v1[v42];
    return v17.create(l_position_2[1] + v45[1] * l_size_0[1], l_position_2[2] + v45[2] * l_size_0[2], l_size_0[1] / 2, l_size_0[2] / 2, v41, v42);
end;
v17.inRegionBounds = function(v46, v47, v48) --[[ Line: 147 ]] --[[ Name: inRegionBounds ]]
    local l_lowerBounds_0 = v46.lowerBounds;
    local l_upperBounds_0 = v46.upperBounds;
    local v51 = false;
    if l_lowerBounds_0[1] <= v47 then
        v51 = false;
        if v47 <= l_upperBounds_0[1] then
            v51 = false;
            if l_lowerBounds_0[2] <= v48 then
                v51 = v48 <= l_upperBounds_0[2];
            end;
        end;
    end;
    return v51;
end;
v17.getSubRegionIndex = function(v52, v53, v54) --[[ Line: 154 ]] --[[ Name: getSubRegionIndex ]]
    local l_position_3 = v52.position;
    return (l_position_3[1] < v53 and 1 or 2) + (v54 <= l_position_3[2] and 4 or 0);
end;
v17.findRegion = function(v56, v57, v58, v59) --[[ Line: 166 ]] --[[ Name: findRegion ]]
    local v60 = v57[1];
    local v61 = v57[2];
    local v62 = math.floor(v58 / v60 + 0.5);
    local v63 = math.floor(v59 / v61 + 0.5);
    local v64 = v56[v62 * 73856093 + v63 * 19351301];
    if not v64 then
        return nil;
    else
        local v65 = v60 * v62;
        local v66 = v61 * v63;
        for _, v68 in pairs(v64) do
            local l_position_4 = v68.position;
            if l_position_4[1] == v65 and l_position_4[2] == v66 then
                return v68;
            end;
        end;
        return nil;
    end;
end;
v17.getOrCreateRegion = function(v70, v71, v72, v73) --[[ Line: 190 ]] --[[ Name: getOrCreateRegion ]]
    -- upvalues: v17 (copy)
    local v74 = math.floor(v72 / v71[1] + 0.5);
    local v75 = math.floor(v73 / v71[2] + 0.5);
    local v76 = v74 * 73856093 + v75 * 19351301;
    local v77 = v70[v76];
    if not v77 then
        v77 = {};
        v70[v76] = v77;
    end;
    local v78 = v71[1] * v74;
    local v79 = v71[2] * v75;
    for _, v81 in pairs(v77) do
        local l_position_5 = v81.position;
        if l_position_5[1] == v78 and l_position_5[2] == v79 then
            return v81;
        end;
    end;
    local v83 = v17.create(v78, v79, v71[1], v71[2]);
    table.insert(v77, v83);
    return v83;
end;
return v17;