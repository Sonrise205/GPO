local v0 = require(script.Parent.OctreeRegionUtils);
local v1 = {
    ClassName = "OctreeNode"
};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = setmetatable({}, v1);
    v4._octree = v2 or error("No octree");
    v4._object = v3 or error("No object");
    v4._currentLowestRegion = nil;
    v4._position = nil;
    return v4;
end;
v1.KNearestNeighborsSearch = function(v5, v6, v7) --[[ Line: 26 ]] --[[ Name: KNearestNeighborsSearch ]]
    return v5._octree:KNearestNeighborsSearch(v5._position, v6, v7);
end;
v1.GetObject = function(v8) --[[ Line: 30 ]] --[[ Name: GetObject ]]
    return v8._object;
end;
v1.RadiusSearch = function(v9, v10) --[[ Line: 34 ]] --[[ Name: RadiusSearch ]]
    return v9._octree:RadiusSearch(v9._position, v10);
end;
v1.GetPosition = function(v11) --[[ Line: 38 ]] --[[ Name: GetPosition ]]
    return v11._position;
end;
v1.GetRawPosition = function(v12) --[[ Line: 42 ]] --[[ Name: GetRawPosition ]]
    return v12._px, v12._py, v12._pz;
end;
v1.SetPosition = function(v13, v14) --[[ Line: 46 ]] --[[ Name: SetPosition ]]
    -- upvalues: v0 (copy)
    if v13._position == v14 then
        return;
    else
        local l_x_0 = v14.x;
        local l_y_0 = v14.y;
        local l_z_0 = v14.z;
        v13._px = l_x_0;
        v13._py = l_y_0;
        v13._pz = l_z_0;
        v13._position = v14;
        if v13._currentLowestRegion and v0.inRegionBounds(v13._currentLowestRegion, l_x_0, l_y_0, l_z_0) then
            return;
        else
            local l_OrCreateLowestSubRegion_0 = v13._octree:GetOrCreateLowestSubRegion(l_x_0, l_y_0, l_z_0);
            if v13._currentLowestRegion then
                v0.moveNode(v13._currentLowestRegion, l_OrCreateLowestSubRegion_0, v13);
            else
                v0.addNode(l_OrCreateLowestSubRegion_0, v13);
            end;
            v13._currentLowestRegion = l_OrCreateLowestSubRegion_0;
            return;
        end;
    end;
end;
v1.Destroy = function(v19) --[[ Line: 80 ]] --[[ Name: Destroy ]]
    -- upvalues: v0 (copy)
    if v19._currentLowestRegion then
        v0.removeNode(v19._currentLowestRegion, v19);
    end;
end;
return v1;