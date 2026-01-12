local v0 = {
    ClassName = "OctreeNode"
};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        Octree = v1 or error("No octree"), 
        Object = v2 or error("No object"), 
        CurrentLowestRegion = nil, 
        Position = nil, 
        PositionX = nil, 
        PositionY = nil, 
        PositionZ = nil
    }, v0));
end;
v0.KNearestNeighborsSearch = function(v3, v4, v5) --[[ Line: 20 ]] --[[ Name: KNearestNeighborsSearch ]]
    return v3.Octree:KNearestNeighborsSearch(v3.Position, v4, v5);
end;
v0.GetObject = function(v6) --[[ Line: 24 ]] --[[ Name: GetObject ]]
    warn("OctreeNode:GetObject is deprecated.");
    return v6.Object;
end;
v0.RadiusSearch = function(v7, v8) --[[ Line: 29 ]] --[[ Name: RadiusSearch ]]
    return v7.Octree:RadiusSearch(v7.Position, v8);
end;
v0.GetPosition = function(v9) --[[ Line: 33 ]] --[[ Name: GetPosition ]]
    warn("OctreeNode:GetPosition is deprecated.");
    return v9.Position;
end;
v0.GetRawPosition = function(v10) --[[ Line: 38 ]] --[[ Name: GetRawPosition ]]
    return v10.PositionX, v10.PositionY, v10.PositionZ;
end;
v0.SetPosition = function(v11, v12) --[[ Line: 42 ]] --[[ Name: SetPosition ]]
    if v11.Position == v12 then
        return;
    else
        local l_X_0 = v12.X;
        local l_Y_0 = v12.Y;
        local l_Z_0 = v12.Z;
        v11.PositionX = l_X_0;
        v11.PositionY = l_Y_0;
        v11.PositionZ = l_Z_0;
        v11.Position = v12;
        if v11.CurrentLowestRegion then
            local l_CurrentLowestRegion_0 = v11.CurrentLowestRegion;
            local l_LowerBounds_0 = l_CurrentLowestRegion_0.LowerBounds;
            local l_UpperBounds_0 = l_CurrentLowestRegion_0.UpperBounds;
            if l_LowerBounds_0[1] <= l_X_0 and l_X_0 <= l_UpperBounds_0[1] and l_LowerBounds_0[2] <= l_Y_0 and l_Y_0 <= l_UpperBounds_0[2] and l_LowerBounds_0[3] <= l_Z_0 and l_Z_0 <= l_UpperBounds_0[3] then
                return;
            end;
        end;
        local l_OrCreateLowestSubRegion_0 = v11.Octree:GetOrCreateLowestSubRegion(l_X_0, l_Y_0, l_Z_0);
        if v11.CurrentLowestRegion then
            local l_CurrentLowestRegion_1 = v11.CurrentLowestRegion;
            if l_CurrentLowestRegion_1.Depth ~= l_OrCreateLowestSubRegion_0.Depth then
                error("fromLowest.Depth ~= toLowest.Depth");
            end;
            if l_CurrentLowestRegion_1 == l_OrCreateLowestSubRegion_0 then
                error("fromLowest == toLowest");
            end;
            local l_l_CurrentLowestRegion_1_0 = l_CurrentLowestRegion_1;
            local l_l_OrCreateLowestSubRegion_0_0 = l_OrCreateLowestSubRegion_0;
            while l_l_CurrentLowestRegion_1_0 ~= l_l_OrCreateLowestSubRegion_0_0 do
                local l_Nodes_0 = l_l_CurrentLowestRegion_1_0.Nodes;
                if not l_Nodes_0[v11] then
                    error("CurrentFrom.Nodes doesn't have a node here.");
                end;
                local l_NodeCount_0 = l_l_CurrentLowestRegion_1_0.NodeCount;
                if l_NodeCount_0 <= 0 then
                    error("NodeCount is <= 0.");
                end;
                l_NodeCount_0 = l_NodeCount_0 - 1;
                l_Nodes_0[v11] = nil;
                l_l_CurrentLowestRegion_1_0.NodeCount = l_NodeCount_0;
                local l_ParentIndex_0 = l_l_CurrentLowestRegion_1_0.ParentIndex;
                if l_NodeCount_0 <= 0 and l_ParentIndex_0 then
                    local l_Parent_0 = l_l_CurrentLowestRegion_1_0.Parent;
                    if not l_Parent_0 then
                        error("CurrentFrom.Parent doesn't exist.");
                    end;
                    local l_SubRegions_0 = l_Parent_0.SubRegions;
                    if l_SubRegions_0[l_ParentIndex_0] ~= l_l_CurrentLowestRegion_1_0 then
                        error("Failed equality check.");
                    end;
                    l_SubRegions_0[l_ParentIndex_0] = nil;
                end;
                local l_Nodes_1 = l_l_OrCreateLowestSubRegion_0_0.Nodes;
                if l_Nodes_1[v11] then
                    error("CurrentTo.Nodes already has a node here.");
                end;
                l_Nodes_1[v11] = v11;
                l_l_OrCreateLowestSubRegion_0_0.NodeCount = l_l_OrCreateLowestSubRegion_0_0.NodeCount + 1;
                l_l_CurrentLowestRegion_1_0 = l_l_CurrentLowestRegion_1_0.Parent;
                l_l_OrCreateLowestSubRegion_0_0 = l_l_OrCreateLowestSubRegion_0_0.Parent;
            end;
        else
            local l_l_OrCreateLowestSubRegion_0_1 = l_OrCreateLowestSubRegion_0;
            while l_l_OrCreateLowestSubRegion_0_1 do
                local l_Nodes_2 = l_l_OrCreateLowestSubRegion_0_1.Nodes;
                if not l_Nodes_2[v11] then
                    l_Nodes_2[v11] = v11;
                    l_l_OrCreateLowestSubRegion_0_1.NodeCount = l_l_OrCreateLowestSubRegion_0_1.NodeCount + 1;
                end;
                l_l_OrCreateLowestSubRegion_0_1 = l_l_OrCreateLowestSubRegion_0_1.Parent;
            end;
        end;
        v11.CurrentLowestRegion = l_OrCreateLowestSubRegion_0;
        return;
    end;
end;
v0.Destroy = function(v31) --[[ Line: 137 ]] --[[ Name: Destroy ]]
    local l_CurrentLowestRegion_2 = v31.CurrentLowestRegion;
    if l_CurrentLowestRegion_2 then
        local l_l_CurrentLowestRegion_2_0 = l_CurrentLowestRegion_2;
        while l_l_CurrentLowestRegion_2_0 do
            local l_Nodes_3 = l_l_CurrentLowestRegion_2_0.Nodes;
            if not l_Nodes_3[v31] then
                error("CurrentFrom.Nodes doesn't have a node here.");
            end;
            local l_NodeCount_1 = l_l_CurrentLowestRegion_2_0.NodeCount;
            if l_NodeCount_1 <= 0 then
                error("NodeCount is <= 0.");
            end;
            l_NodeCount_1 = l_NodeCount_1 - 1;
            l_Nodes_3[v31] = nil;
            l_l_CurrentLowestRegion_2_0.NodeCount = l_NodeCount_1;
            local l_Parent_1 = l_l_CurrentLowestRegion_2_0.Parent;
            local l_ParentIndex_1 = l_l_CurrentLowestRegion_2_0.ParentIndex;
            if l_NodeCount_1 <= 0 and l_ParentIndex_1 then
                if not l_Parent_1 then
                    error("Current.Parent doesn't exist.");
                end;
                local l_SubRegions_1 = l_Parent_1.SubRegions;
                if l_SubRegions_1[l_ParentIndex_1] ~= l_l_CurrentLowestRegion_2_0 then
                    error("Failed equality check.");
                end;
                l_SubRegions_1[l_ParentIndex_1] = nil;
            end;
            l_l_CurrentLowestRegion_2_0 = l_Parent_1;
        end;
    end;
end;
return v0;