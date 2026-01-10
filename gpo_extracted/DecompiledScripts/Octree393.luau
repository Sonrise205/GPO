local v0 = require(script.OctreeNode);
local v1 = require(script.OctreeRegionUtils);
local v2 = {
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
local v3 = {
    ClassName = "Octree"
};
v3.__index = v3;
local l_new_0 = v0.new;
local l_GetNeighborsWithinRadius_0 = v1.GetNeighborsWithinRadius;
v3.new = function() --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        MaxDepth = 4, 
        MaxRegionSize = table.create(3, 512), 
        RegionHashMap = {}
    }, v3));
end;
v3.ClearNodes = function(v6) --[[ Line: 36 ]] --[[ Name: ClearNodes ]]
    v6.MaxDepth = 4;
    v6.MaxRegionSize = table.create(3, 512);
    table.clear(v6.RegionHashMap);
end;
v3.GetAllNodes = function(v7) --[[ Line: 42 ]] --[[ Name: GetAllNodes ]]
    local v8 = {};
    local v9 = 0;
    for _, v11 in next, v7.RegionHashMap do
        for _, v13 in ipairs(v11) do
            for v14 in next, v13.Nodes do
                v9 = v9 + 1;
                v8[v9] = v14;
            end;
        end;
    end;
    return v8;
end;
v3.CreateNode = function(v15, v16, v17) --[[ Line: 58 ]] --[[ Name: CreateNode ]]
    -- upvalues: l_new_0 (copy)
    if typeof(v16) ~= "Vector3" then
        error("Bad position value");
    end;
    if not v17 then
        error("Bad object value.");
    end;
    local v18 = l_new_0(v15, v17);
    v18:SetPosition(v16);
    return v18;
end;
v3.RadiusSearch = function(v19, v20, v21) --[[ Line: 72 ]] --[[ Name: RadiusSearch ]]
    -- upvalues: l_GetNeighborsWithinRadius_0 (copy)
    if typeof(v20) ~= "Vector3" then
        error("Bad position value");
    end;
    if type(v21) ~= "number" then
        error("Bad radius value");
    end;
    local l_X_0 = v20.X;
    local l_Y_0 = v20.Y;
    local l_Z_0 = v20.Z;
    local v25 = {};
    local v26 = {};
    local v27 = 0;
    local v28 = 0;
    local v29 = v21 + 0.8660254037844386 * v19.MaxRegionSize[1];
    local v30 = v29 * v29 + 1.0E-9;
    for _, v32 in next, v19.RegionHashMap do
        for _, v34 in ipairs(v32) do
            local l_Position_0 = v34.Position;
            local v36 = l_Position_0[1];
            local v37 = l_Position_0[2];
            local v38 = l_Position_0[3];
            local v39 = l_X_0 - v36;
            local v40 = l_Y_0 - v37;
            local v41 = l_Z_0 - v38;
            if v39 * v39 + v40 * v40 + v41 * v41 <= v30 then
                local v42, v43 = l_GetNeighborsWithinRadius_0(v34, v21, l_X_0, l_Y_0, l_Z_0, v25, v26, v19.MaxDepth, v27, v28);
                v27 = v42;
                v28 = v43;
            end;
        end;
    end;
    return v25, v26;
end;
local function v46(v44, v45) --[[ Line: 110 ]] --[[ Name: NearestNeighborSort ]]
    return v44.Distance2 < v45.Distance2;
end;
v3.KNearestNeighborsSearch = function(v47, v48, v49, v50) --[[ Line: 114 ]] --[[ Name: KNearestNeighborsSearch ]]
    -- upvalues: l_GetNeighborsWithinRadius_0 (copy), v46 (copy)
    if typeof(v48) ~= "Vector3" then
        error("Bad position value");
    end;
    if type(v50) ~= "number" then
        error("Bad radius value");
    end;
    local l_X_1 = v48.X;
    local l_Y_1 = v48.Y;
    local l_Z_1 = v48.Z;
    local v54 = {};
    local v55 = {};
    local v56 = 0;
    local v57 = 0;
    local v58 = v50 + 0.8660254037844386 * v47.MaxRegionSize[1];
    local v59 = v58 * v58 + 1.0E-9;
    for _, v61 in next, v47.RegionHashMap do
        for _, v63 in ipairs(v61) do
            local l_Position_1 = v63.Position;
            local v65 = l_Position_1[1];
            local v66 = l_Position_1[2];
            local v67 = l_Position_1[3];
            local v68 = l_X_1 - v65;
            local v69 = l_Y_1 - v66;
            local v70 = l_Z_1 - v67;
            if v68 * v68 + v69 * v69 + v70 * v70 <= v59 then
                local v71, v72 = l_GetNeighborsWithinRadius_0(v63, v50, l_X_1, l_Y_1, l_Z_1, v54, v55, v47.MaxDepth, v56, v57);
                v56 = v71;
                v57 = v72;
            end;
        end;
    end;
    local v73 = table.create(v57);
    for v74, v75 in ipairs(v55) do
        v73[v74] = {
            Distance2 = v75, 
            Index = v74
        };
    end;
    table.sort(v73, v46);
    local v76 = math.min(v57, v49);
    local v77 = table.create(v76);
    local v78 = table.create(v76);
    for v79 = 1, v76 do
        local v80 = v73[v79];
        v78[v79] = v80.Distance2;
        v77[v79] = v54[v80.Index];
    end;
    return v77, v78;
end;
local function v109(v81, v82, v83, v84) --[[ Line: 171 ]] --[[ Name: GetOrCreateRegion ]]
    local l_RegionHashMap_0 = v81.RegionHashMap;
    local l_MaxRegionSize_0 = v81.MaxRegionSize;
    local v87 = l_MaxRegionSize_0[1];
    local v88 = l_MaxRegionSize_0[2];
    local v89 = l_MaxRegionSize_0[3];
    local v90 = math.floor(v82 / v87 + 0.5);
    local v91 = math.floor(v83 / v88 + 0.5);
    local v92 = math.floor(v84 / v89 + 0.5);
    local v93 = v90 * 73856093 + v91 * 19351301 + v92 * 83492791;
    local v94 = l_RegionHashMap_0[v93];
    if not v94 then
        v94 = {};
        l_RegionHashMap_0[v93] = v94;
    end;
    local v95 = v87 * v90;
    local v96 = v88 * v91;
    local v97 = v89 * v92;
    for _, v99 in ipairs(v94) do
        local l_Position_2 = v99.Position;
        if l_Position_2[1] == v95 and l_Position_2[2] == v96 and l_Position_2[3] == v97 then
            return v99;
        end;
    end;
    local v101 = v87 / 2;
    local v102 = v88 / 2;
    local v103 = v89 / 2;
    local v104 = {
        v95 - v101, 
        v96 - v102, 
        v97 - v103
    };
    local v105 = {
        v95, 
        v96, 
        v97
    };
    local v106 = {
        v87, 
        v88, 
        v89
    };
    local v107 = {
        v95 + v101, 
        v96 + v102, 
        v97 + v103
    };
    local v108 = {
        Depth = 1, 
        LowerBounds = v104, 
        NodeCount = 0, 
        Nodes = {}, 
        Parent = nil, 
        ParentIndex = nil, 
        Position = v105, 
        Size = v106, 
        SubRegions = {}, 
        UpperBounds = v107
    };
    table.insert(v94, v108);
    return v108;
end;
v3.GetOrCreateLowestSubRegion = function(v110, v111, v112, v113) --[[ Line: 216 ]] --[[ Name: GetOrCreateLowestSubRegion ]]
    -- upvalues: v109 (copy), v2 (copy)
    local v114 = v109(v110, v111, v112, v113);
    local l_MaxDepth_0 = v110.MaxDepth;
    local l_v114_0 = v114;
    for _ = v114.Depth, l_MaxDepth_0 do
        local l_Position_3 = l_v114_0.Position;
        local v119 = l_Position_3[1] < v111 and 1 or 2;
        if v112 <= l_Position_3[2] then
            v119 = v119 + 4;
        end;
        if l_Position_3[3] <= v113 then
            v119 = v119 + 2;
        end;
        local l_SubRegions_0 = l_v114_0.SubRegions;
        local v121 = l_SubRegions_0[v119];
        if not v121 then
            local l_Size_0 = l_v114_0.Size;
            local v123 = v2[v119];
            local v124 = l_Size_0[1];
            local v125 = l_Size_0[2];
            local v126 = l_Size_0[3];
            local v127 = l_Position_3[1] + v123[1] * v124;
            local v128 = l_Position_3[2] + v123[2] * v125;
            local v129 = l_Position_3[3] + v123[3] * v126;
            local v130 = v124 / 2;
            local v131 = v125 / 2;
            local v132 = v126 / 2;
            local v133 = v130 / 2;
            local v134 = v131 / 2;
            local v135 = v132 / 2;
            local v136 = {
                v127 - v133, 
                v128 - v134, 
                v129 - v135
            };
            local v137 = {
                v127, 
                v128, 
                v129
            };
            local v138 = {
                v130, 
                v131, 
                v132
            };
            local v139 = {
                v127 + v133, 
                v128 + v134, 
                v129 + v135
            };
            v121 = {
                Depth = l_v114_0 and l_v114_0.Depth + 1 or 1, 
                LowerBounds = v136, 
                NodeCount = 0, 
                Nodes = {}, 
                Parent = l_v114_0, 
                ParentIndex = v119, 
                Position = v137, 
                Size = v138, 
                SubRegions = {}, 
                UpperBounds = v139
            };
            l_SubRegions_0[v119] = v121;
        end;
        l_v114_0 = v121;
    end;
    return l_v114_0;
end;
return v3;