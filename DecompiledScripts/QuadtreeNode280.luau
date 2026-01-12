local v0 = require(script.Parent.QuadtreeRegionUtils);
local v1 = {
    ClassName = "QuadtreeNode"
};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        _quadtree = v2 or error("No quadtree"), 
        _object = v3 or error("No object"), 
        _currentLowestRegion = nil, 
        _position = nil
    }, v1));
end;
v1.KNearestNeighborsSearch = function(v4, v5, v6) --[[ Line: 19 ]] --[[ Name: KNearestNeighborsSearch ]]
    return v4._quadtree:KNearestNeighborsSearch(v4._position, v5, v6);
end;
v1.GetObject = function(v7) --[[ Line: 23 ]] --[[ Name: GetObject ]]
    return v7._object;
end;
v1.UpdatePosition = function(v8, v9) --[[ Line: 27 ]] --[[ Name: UpdatePosition ]]
    v8:RemoveObject(v9, true);
    v8:AddObject(v9);
end;
v1.RadiusSearch = function(v10, v11) --[[ Line: 32 ]] --[[ Name: RadiusSearch ]]
    return v10._quadtree:RadiusSearch(v10._position, v11);
end;
v1.GetPosition = function(v12) --[[ Line: 36 ]] --[[ Name: GetPosition ]]
    return v12._position;
end;
v1.SetPosition = function(v13, v14) --[[ Line: 40 ]] --[[ Name: SetPosition ]]
    -- upvalues: v0 (copy)
    if v13._position == v14 then
        return;
    else
        local l_X_0 = v14.X;
        local l_Y_0 = v14.Y;
        v13._px = l_X_0;
        v13._py = l_Y_0;
        v13._position = v14;
        local l__currentLowestRegion_0 = v13._currentLowestRegion;
        if l__currentLowestRegion_0 and v0.inRegionBounds(l__currentLowestRegion_0, l_X_0, l_Y_0) then
            return;
        else
            local l_OrCreateLowestSubRegion_0 = v13._quadtree:GetOrCreateLowestSubRegion(l_X_0, l_Y_0);
            if l__currentLowestRegion_0 then
                local l_l__currentLowestRegion_0_0 = l__currentLowestRegion_0;
                local l_l_OrCreateLowestSubRegion_0_0 = l_OrCreateLowestSubRegion_0;
                while l_l__currentLowestRegion_0_0 ~= l_l_OrCreateLowestSubRegion_0_0 do
                    local l_parent_0 = l_l__currentLowestRegion_0_0.parent;
                    local l_node_count_0 = l_l__currentLowestRegion_0_0.node_count;
                    l_l__currentLowestRegion_0_0.nodes[v13] = nil;
                    l_l__currentLowestRegion_0_0.node_count = l_node_count_0 - 1;
                    local v23 = false;
                    if l_node_count_0 <= 1 then
                        v23 = l_l__currentLowestRegion_0_0.parentIndex;
                    end;
                    if v23 then
                        l_parent_0.subRegions[v23] = nil;
                    end;
                    l_l_OrCreateLowestSubRegion_0_0.nodes[v13] = v13;
                    l_l_OrCreateLowestSubRegion_0_0.node_count = l_l_OrCreateLowestSubRegion_0_0.node_count + 1;
                    l_l__currentLowestRegion_0_0 = l_parent_0;
                    l_l_OrCreateLowestSubRegion_0_0 = l_l_OrCreateLowestSubRegion_0_0.parent;
                end;
            else
                local l_l_OrCreateLowestSubRegion_0_1 = l_OrCreateLowestSubRegion_0;
                while l_l_OrCreateLowestSubRegion_0_1 do
                    if not l_l_OrCreateLowestSubRegion_0_1.nodes[v13] then
                        l_l_OrCreateLowestSubRegion_0_1.nodes[v13] = v13;
                        l_l_OrCreateLowestSubRegion_0_1.node_count = l_l_OrCreateLowestSubRegion_0_1.node_count + 1;
                    end;
                    l_l_OrCreateLowestSubRegion_0_1 = l_l_OrCreateLowestSubRegion_0_1.parent;
                end;
            end;
            v13._currentLowestRegion = l_OrCreateLowestSubRegion_0;
            return;
        end;
    end;
end;
v1.Destroy = function(v25) --[[ Line: 112 ]] --[[ Name: Destroy ]]
    -- upvalues: v0 (copy)
    local l__currentLowestRegion_1 = v25._currentLowestRegion;
    if l__currentLowestRegion_1 then
        v0.removeNode(l__currentLowestRegion_1, v25);
    end;
end;
return v1;