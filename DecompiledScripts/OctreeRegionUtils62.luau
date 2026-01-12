local v0 = {
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
local v37 = {
    visualize = function(v1) --[[ Line: 26 ]] --[[ Name: visualize ]]
        local l_size_0 = v1.size;
        local l_position_0 = v1.position;
        local v4 = l_size_0[1];
        local v5 = l_size_0[2];
        local v6 = l_size_0[3];
        local v7 = l_position_0[1];
        local v8 = l_position_0[2];
        local v9 = l_position_0[3];
        local v10 = Draw.box(Vector3.new(v7, v8, v9), (Vector3.new(v4, v5, v6)));
        v10.Transparency = 0.9;
        v10.Name = "OctreeRegion_" .. tostring(v1.depth);
        return v10;
    end, 
    create = function(v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 39 ]] --[[ Name: create ]]
        local v19 = v14 / 2;
        local v20 = v15 / 2;
        local v21 = v16 / 2;
        return {
            subRegions = {}, 
            lowerBounds = {
                v11 - v19, 
                v12 - v20, 
                v13 - v21
            }, 
            upperBounds = {
                v11 + v19, 
                v12 + v20, 
                v13 + v21
            }, 
            position = {
                v11, 
                v12, 
                v13
            }, 
            size = {
                v14, 
                v15, 
                v16
            }, 
            parent = v17, 
            depth = v17 and v17.depth + 1 or 1, 
            parentIndex = v18, 
            nodes = {}, 
            node_count = 0
        };
    end, 
    addNode = function(v22, v23) --[[ Line: 71 ]] --[[ Name: addNode ]]
        assert(v23);
        local l_v22_0 = v22;
        while l_v22_0 do
            if not l_v22_0.nodes[v23] then
                l_v22_0.nodes[v23] = v23;
                l_v22_0.node_count = l_v22_0.node_count + 1;
            end;
            l_v22_0 = l_v22_0.parent;
        end;
    end, 
    moveNode = function(v25, v26, v27) --[[ Line: 84 ]] --[[ Name: moveNode ]]
        assert(v25.depth == v26.depth, "fromLowest.depth ~= toLowest.depth");
        assert(v25 ~= v26, "fromLowest == toLowest");
        local l_v25_0 = v25;
        local l_v26_0 = v26;
        while l_v25_0 ~= l_v26_0 do
            assert(l_v25_0.nodes[v27]);
            assert(l_v25_0.node_count > 0);
            l_v25_0.nodes[v27] = nil;
            l_v25_0.node_count = l_v25_0.node_count - 1;
            if l_v25_0.node_count <= 0 and l_v25_0.parentIndex then
                assert(l_v25_0.parent);
                assert(l_v25_0.parent.subRegions[l_v25_0.parentIndex] == l_v25_0);
                l_v25_0.parent.subRegions[l_v25_0.parentIndex] = nil;
            end;
            assert(not l_v26_0.nodes[v27]);
            l_v26_0.nodes[v27] = v27;
            l_v26_0.node_count = l_v26_0.node_count + 1;
            l_v25_0 = l_v25_0.parent;
            l_v26_0 = l_v26_0.parent;
        end;
    end, 
    removeNode = function(v30, v31) --[[ Line: 119 ]] --[[ Name: removeNode ]]
        assert(v31);
        local l_v30_0 = v30;
        while l_v30_0 do
            assert(l_v30_0.nodes[v31]);
            assert(l_v30_0.node_count > 0);
            l_v30_0.nodes[v31] = nil;
            l_v30_0.node_count = l_v30_0.node_count - 1;
            if l_v30_0.node_count <= 0 and l_v30_0.parentIndex then
                assert(l_v30_0.parent);
                assert(l_v30_0.parent.subRegions[l_v30_0.parentIndex] == l_v30_0);
                l_v30_0.parent.subRegions[l_v30_0.parentIndex] = nil;
            end;
            l_v30_0 = l_v30_0.parent;
        end;
    end, 
    getSearchRadiusSquared = function(v33, v34, v35) --[[ Line: 141 ]] --[[ Name: getSearchRadiusSquared ]]
        local v36 = v33 + 0.8660254037844386 * v34;
        return v36 * v36 + v35;
    end
};
v37.getNeighborsWithinRadius = function(v38, v39, v40, v41, v42, v43, v44, v45) --[[ Line: 151 ]] --[[ Name: getNeighborsWithinRadius ]]
    -- upvalues: v37 (copy)
    assert(v45);
    local v46 = v38.size[1] / 2;
    local v47 = v37.getSearchRadiusSquared(v39, v46, 1.0E-6);
    local v48 = v39 * v39;
    for _, v50 in v38.subRegions do
        local l_position_1 = v50.position;
        local v52 = l_position_1[1];
        local v53 = l_position_1[2];
        local v54 = l_position_1[3];
        local v55 = v40 - v52;
        local v56 = v41 - v53;
        local v57 = v42 - v54;
        if v55 * v55 + v56 * v56 + v57 * v57 <= v47 then
            if v50.depth == v45 then
                for v58, _ in v50.nodes do
                    local l_v58_RawPosition_0, v61, v62 = v58:GetRawPosition();
                    local v63 = v40 - l_v58_RawPosition_0;
                    local v64 = v41 - v61;
                    local v65 = v42 - v62;
                    local v66 = v63 * v63 + v64 * v64 + v65 * v65;
                    if v66 <= v48 then
                        v43[#v43 + 1] = v58:GetObject();
                        v44[#v44 + 1] = v66;
                    end;
                end;
            else
                v37.getNeighborsWithinRadius(v50, v39, v40, v41, v42, v43, v44, v45);
            end;
        end;
    end;
end;
v37.getOrCreateSubRegionAtDepth = function(v67, v68, v69, v70, v71) --[[ Line: 188 ]] --[[ Name: getOrCreateSubRegionAtDepth ]]
    -- upvalues: v37 (copy)
    local l_v67_0 = v67;
    for _ = v67.depth, v71 do
        local v74 = v37.getSubRegionIndex(l_v67_0, v68, v69, v70);
        local v75 = l_v67_0.subRegions[v74];
        if not v75 then
            v75 = v37.createSubRegion(l_v67_0, v74);
            l_v67_0.subRegions[v74] = v75;
        end;
        l_v67_0 = v75;
    end;
    return l_v67_0;
end;
v37.createSubRegion = function(v76, v77) --[[ Line: 206 ]] --[[ Name: createSubRegion ]]
    -- upvalues: v0 (copy), v37 (copy)
    local l_size_1 = v76.size;
    local l_position_2 = v76.position;
    local v80 = v0[v77];
    local v81 = l_position_2[1] + v80[1] * l_size_1[1];
    local v82 = l_position_2[2] + v80[2] * l_size_1[2];
    local v83 = l_position_2[3] + v80[3] * l_size_1[3];
    local v84 = l_size_1[1] / 2;
    local v85 = l_size_1[2] / 2;
    local v86 = l_size_1[3] / 2;
    return v37.create(v81, v82, v83, v84, v85, v86, v76, v77);
end;
v37.inRegionBounds = function(v87, v88, v89, v90) --[[ Line: 220 ]] --[[ Name: inRegionBounds ]]
    local l_lowerBounds_0 = v87.lowerBounds;
    local l_upperBounds_0 = v87.upperBounds;
    local v93 = false;
    if l_lowerBounds_0[1] <= v88 then
        v93 = false;
        if v88 <= l_upperBounds_0[1] then
            v93 = false;
            if l_lowerBounds_0[2] <= v89 then
                v93 = false;
                if v89 <= l_upperBounds_0[2] then
                    v93 = false;
                    if l_lowerBounds_0[3] <= v90 then
                        v93 = v90 <= l_upperBounds_0[3];
                    end;
                end;
            end;
        end;
    end;
    return v93;
end;
v37.getSubRegionIndex = function(v94, v95, v96, v97) --[[ Line: 230 ]] --[[ Name: getSubRegionIndex ]]
    local v98 = v94.position[1] < v95 and 1 or 2;
    if v96 <= v94.position[2] then
        v98 = v98 + 4;
    end;
    if v94.position[3] <= v97 then
        v98 = v98 + 2;
    end;
    return v98;
end;
v37.getTopLevelRegionHash = function(v99, v100, v101) --[[ Line: 244 ]] --[[ Name: getTopLevelRegionHash ]]
    return v99 * 73856093 + v100 * 19351301 + v101 * 83492791;
end;
v37.getTopLevelRegionCellIndex = function(v102, v103, v104, v105) --[[ Line: 249 ]] --[[ Name: getTopLevelRegionCellIndex ]]
    return math.floor(v103 / v102[1] + 0.5), math.floor(v104 / v102[2] + 0.5), (math.floor(v105 / v102[3] + 0.5));
end;
v37.getTopLevelRegionPosition = function(v106, v107, v108, v109) --[[ Line: 255 ]] --[[ Name: getTopLevelRegionPosition ]]
    return v106[1] * v107, v106[2] * v108, v106[3] * v109;
end;
v37.areEqualTopRegions = function(v110, v111, v112, v113) --[[ Line: 261 ]] --[[ Name: areEqualTopRegions ]]
    local l_position_3 = v110.position;
    local v115 = false;
    if l_position_3[1] == v111 then
        v115 = false;
        if l_position_3[2] == v112 then
            v115 = l_position_3[3] == v113;
        end;
    end;
    return v115;
end;
v37.findRegion = function(v116, v117, v118, v119, v120) --[[ Line: 268 ]] --[[ Name: findRegion ]]
    -- upvalues: v37 (copy)
    local v121, v122, v123 = v37.getTopLevelRegionCellIndex(v117, v118, v119, v120);
    local v124 = v116[v37.getTopLevelRegionHash(v121, v122, v123)];
    if not v124 then
        return nil;
    else
        local v125, v126, v127 = v37.getTopLevelRegionPosition(v117, v121, v122, v123);
        for _, v129 in v124 do
            if v37.areEqualTopRegions(v129, v125, v126, v127) then
                return v129;
            end;
        end;
        return nil;
    end;
end;
v37.getOrCreateRegion = function(v130, v131, v132, v133, v134) --[[ Line: 287 ]] --[[ Name: getOrCreateRegion ]]
    -- upvalues: v37 (copy)
    local v135, v136, v137 = v37.getTopLevelRegionCellIndex(v131, v132, v133, v134);
    local v138 = v37.getTopLevelRegionHash(v135, v136, v137);
    local v139 = v130[v138];
    if not v139 then
        v139 = {};
        v130[v138] = v139;
    end;
    local v140, v141, v142 = v37.getTopLevelRegionPosition(v131, v135, v136, v137);
    for _, v144 in v139 do
        if v37.areEqualTopRegions(v144, v140, v141, v142) then
            return v144;
        end;
    end;
    local v145 = v37.create(v140, v141, v142, v131[1], v131[2], v131[3]);
    table.insert(v139, v145);
    return v145;
end;
return v37;