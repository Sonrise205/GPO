local v0 = require(script.QuadtreeRegionUtils);
local v1 = require(script.QuadtreeNode);
local v2 = {
    ClassName = "Quadtree"
};
v2.__index = v2;
v2.new = function() --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        _maxRegionSize = {
            512, 
            512
        }, 
        _maxDepth = 4, 
        _regionHashMap = {}
    }, v2));
end;
v2.ClearNodes = function(v3) --[[ Line: 19 ]] --[[ Name: ClearNodes ]]
    v3._maxRegionSize = {
        512, 
        512
    };
    v3._maxDepth = 4;
    table.clear(v3._regionHashMap);
end;
v2.GetAllNodes = function(v4) --[[ Line: 25 ]] --[[ Name: GetAllNodes ]]
    local v5 = {};
    for _, v7 in pairs(v4._regionHashMap) do
        for _, v9 in pairs(v7) do
            for v10 in pairs(v9.nodes) do
                table.insert(v5, v10);
            end;
        end;
    end;
    return v5;
end;
v2.CreateNode = function(v11, v12, v13) --[[ Line: 39 ]] --[[ Name: CreateNode ]]
    -- upvalues: v1 (copy)
    assert(typeof(v12) == "Vector2", "Bad position value");
    assert(v13, "Bad object value");
    local v14 = v1.new(v11, v13);
    v14:SetPosition(v12);
    return v14;
end;
v2.RadiusSearch = function(v15, v16, v17) --[[ Line: 50 ]] --[[ Name: RadiusSearch ]]
    return v15:_radiusSearch(assert(typeof(v16) == "Vector2") and v16.X, v16.Y, assert(type(v17) == "number") and v17);
end;
v2.KNearestNeighborsSearch = function(v18, v19, v20, v21) --[[ Line: 54 ]] --[[ Name: KNearestNeighborsSearch ]]
    assert(typeof(v19) == "Vector2");
    assert(type(v21) == "number");
    local v22, v23 = v18:_radiusSearch(v19.X, v19.Y, v21);
    local v24 = {};
    for v25, v26 in pairs(v23) do
        table.insert(v24, {
            dist2 = v26, 
            index = v25
        });
    end;
    table.sort(v24, function(v27, v28) --[[ Line: 68 ]]
        return v27.dist2 < v28.dist2;
    end);
    local v29 = {};
    local v30 = {};
    for v31 = 1, math.min(#v24, v20) do
        local v32 = v24[v31];
        table.insert(v30, v32.dist2);
        table.insert(v29, v22[v32.index]);
    end;
    return v29, v30;
end;
v2.GetOrCreateLowestSubRegion = function(v33, v34, v35) --[[ Line: 83 ]] --[[ Name: GetOrCreateLowestSubRegion ]]
    -- upvalues: v0 (copy)
    return v0.getOrCreateSubRegionAtDepth(v33:_getOrCreateRegion(v34, v35), v34, v35, v33._maxDepth);
end;
v2._radiusSearch = function(v36, v37, v38, v39) --[[ Line: 87 ]] --[[ Name: _radiusSearch ]]
    -- upvalues: v0 (copy)
    local v40 = {};
    local v41 = {};
    local l__maxDepth_0 = v36._maxDepth;
    local v43 = (v39 + 0.8660254037844386 * v36._maxRegionSize[1]) ^ 2 + 1.0E-9;
    for _, v45 in pairs(v36._regionHashMap) do
        for _, v47 in pairs(v45) do
            local l_position_0 = v47.position;
            if (v37 - l_position_0[1]) ^ 2 + (v38 - l_position_0[2]) ^ 2 <= v43 then
                v0.getNeighborsWithinRadius(v47, v39, v37, v38, v40, v41, l__maxDepth_0);
            end;
        end;
    end;
    return v40, v41;
end;
v2._getRegion = function(v49, v50, v51) --[[ Line: 107 ]] --[[ Name: _getRegion ]]
    -- upvalues: v0 (copy)
    return v0.findRegion(v49._regionHashMap, v49._maxRegionSize, v50, v51);
end;
v2._getOrCreateRegion = function(v52, v53, v54) --[[ Line: 111 ]] --[[ Name: _getOrCreateRegion ]]
    -- upvalues: v0 (copy)
    return v0.getOrCreateRegion(v52._regionHashMap, v52._maxRegionSize, v53, v54);
end;
return v2;