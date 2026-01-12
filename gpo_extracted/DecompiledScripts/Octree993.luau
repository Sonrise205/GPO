local v0 = require(script.Parent.OctreeRegionUtils);
local v1 = require(script.Parent.OctreeNode);
local v2 = {
    ClassName = "Octree"
};
v2.__index = v2;
v2.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = setmetatable({}, v2);
    v3._maxRegionSize = {
        512, 
        512, 
        512
    };
    v3._maxDepth = 4;
    v3._regionHashMap = {};
    return v3;
end;
v2.GetAllNodes = function(v4) --[[ Line: 27 ]] --[[ Name: GetAllNodes ]]
    local v5 = {};
    for _, v7 in v4._regionHashMap do
        for _, v9 in v7 do
            for v10, _ in v9.nodes do
                v5[#v5 + 1] = v10;
            end;
        end;
    end;
    return v5;
end;
v2.CreateNode = function(v12, v13, v14) --[[ Line: 41 ]] --[[ Name: CreateNode ]]
    -- upvalues: v1 (copy)
    assert(typeof(v13) == "Vector3", "Bad position value");
    assert(v14, "Bad object value");
    local v15 = v1.new(v12, v14);
    v15:SetPosition(v13);
    return v15;
end;
v2.RadiusSearch = function(v16, v17, v18) --[[ Line: 52 ]] --[[ Name: RadiusSearch ]]
    assert(typeof(v17) == "Vector3");
    assert(type(v18) == "number");
    return v16:_radiusSearch(v17.x, v17.y, v17.z, v18);
end;
v2.KNearestNeighborsSearch = function(v19, v20, v21, v22) --[[ Line: 60 ]] --[[ Name: KNearestNeighborsSearch ]]
    assert(typeof(v20) == "Vector3");
    assert(type(v22) == "number");
    local v23, v24 = v19:_radiusSearch(v20.x, v20.y, v20.z, v22);
    local v25 = {};
    for v26, v27 in v24 do
        table.insert(v25, {
            dist2 = v27, 
            index = v26
        });
    end;
    table.sort(v25, function(v28, v29) --[[ Line: 75 ]]
        return v28.dist2 < v29.dist2;
    end);
    local v30 = {};
    local v31 = {};
    for v32 = 1, math.min(#v25, v21) do
        local v33 = v25[v32];
        v31[#v31 + 1] = v33.dist2;
        v30[#v30 + 1] = v23[v33.index];
    end;
    return v30, v31;
end;
v2.GetOrCreateLowestSubRegion = function(v34, v35, v36, v37) --[[ Line: 90 ]] --[[ Name: GetOrCreateLowestSubRegion ]]
    -- upvalues: v0 (copy)
    local v38 = v34:_getOrCreateRegion(v35, v36, v37);
    return v0.getOrCreateSubRegionAtDepth(v38, v35, v36, v37, v34._maxDepth);
end;
v2._radiusSearch = function(v39, v40, v41, v42, v43) --[[ Line: 95 ]] --[[ Name: _radiusSearch ]]
    -- upvalues: v0 (copy)
    local v44 = {};
    local v45 = {};
    local v46 = v39._maxRegionSize[1];
    local v47 = v0.getSearchRadiusSquared(v43, v46, 1.0E-9);
    for _, v49 in v39._regionHashMap do
        for _, v51 in v49 do
            local l_position_0 = v51.position;
            local v53 = l_position_0[1];
            local v54 = l_position_0[2];
            local v55 = l_position_0[3];
            local v56 = v40 - v53;
            local v57 = v41 - v54;
            local v58 = v42 - v55;
            if v56 * v56 + v57 * v57 + v58 * v58 <= v47 then
                v0.getNeighborsWithinRadius(v51, v43, v40, v41, v42, v44, v45, v39._maxDepth);
            end;
        end;
    end;
    return v44, v45;
end;
v2._getRegion = function(v59, v60, v61, v62) --[[ Line: 119 ]] --[[ Name: _getRegion ]]
    -- upvalues: v0 (copy)
    return v0.findRegion(v59._regionHashMap, v59._maxRegionSize, v60, v61, v62);
end;
v2._getOrCreateRegion = function(v63, v64, v65, v66) --[[ Line: 123 ]] --[[ Name: _getOrCreateRegion ]]
    -- upvalues: v0 (copy)
    return v0.getOrCreateRegion(v63._regionHashMap, v63._maxRegionSize, v64, v65, v66);
end;
return v2;