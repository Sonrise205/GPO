local v0 = {};
local v1 = nil;
BuildNodes = function() --[[ Line: 18 ]] --[[ Name: BuildNodes ]]
    -- upvalues: v1 (ref)
    local l_Town_0 = game:GetService("ServerStorage").NodeMapProjects:FindFirstChild("Town");
    local v3 = {};
    local v4 = {};
    for _, v6 in (l_Town_0:GetChildren()) do
        if v6:IsA("Folder") then
            local v7 = {
                Position = v6:GetAttribute("NodePosition"), 
                Neighbors = {}, 
                F = 0, 
                G = 0, 
                H = 0, 
                Parent = nil
            };
            table.insert(v3, v7);
            v4[v6:GetAttribute("NodeId")] = v7;
        end;
    end;
    for _, v9 in (l_Town_0:GetChildren()) do
        if v9:IsA("Folder") then
            local v10 = v9:GetAttribute("NodeLinks"):split(",");
            local v11 = v4[v9:GetAttribute("NodeId")];
            for _, v13 in v10 do
                local v14 = v4[v13];
                table.insert(v11.Neighbors, v14);
                table.insert(v14.Neighbors, v11);
            end;
        end;
    end;
    v1 = v3;
end;
FindNearestNode = function(v15) --[[ Line: 53 ]] --[[ Name: FindNearestNode ]]
    -- upvalues: v1 (ref)
    local v16 = 1e999;
    local v17 = nil;
    for _, v19 in v1 do
        local l_Magnitude_0 = (v15 - v19.Position).Magnitude;
        if l_Magnitude_0 < v16 then
            v16 = l_Magnitude_0;
            v17 = v19;
        end;
    end;
    return v17;
end;
v0.FindPath = function(v21, v22, v23) --[[ Line: 65 ]] --[[ Name: FindPath ]]
    -- upvalues: v1 (ref)
    if not v1 then
        v21:Init();
    end;
    local v24 = {};
    local v25 = false;
    local v26 = FindNearestNode(v22);
    local v27 = FindNearestNode(v23);
    local v28 = {
        [v26] = true
    };
    local v29 = {};
    local function _() --[[ Line: 81 ]] --[[ Name: FindLowestFNode ]]
        -- upvalues: v28 (copy)
        local v30 = 1e999;
        local v31 = nil;
        for v32 in v28 do
            if v32.F < v30 then
                v30 = v32.F;
                v31 = v32;
            end;
        end;
        return v31;
    end;
    while next(v28) do
        local v34 = 1e999;
        local v35 = nil;
        for v36 in v28 do
            if v36.F < v34 then
                v34 = v36.F;
                v35 = v36;
            end;
        end;
        local l_v35_0 = v35;
        v28[l_v35_0] = nil;
        v29[l_v35_0] = true;
        if l_v35_0 == v27 then
            v25 = true;
            break;
        else
            for _, v39 in l_v35_0.Neighbors do
                if not v29[v39] then
                    if not v28[v39] then
                        v28[v39] = true;
                        v39.Parent = l_v35_0;
                        v39.G = l_v35_0.G + (v39.Position - l_v35_0.Position).Magnitude;
                        v39.H = (v39.Position - v27.Position).Magnitude;
                        v39.F = v39.G + v39.H;
                    elseif v39.G < l_v35_0.G then
                        v39.Parent = l_v35_0;
                        v39.G = l_v35_0.G + (v39.Position - l_v35_0.Position).Magnitude;
                        v39.F = v39.G + v39.H;
                    end;
                end;
            end;
        end;
    end;
    if v25 then
        local l_v27_0 = v27;
        while l_v27_0 do
            table.insert(v24, 1, l_v27_0.Position);
            l_v27_0 = l_v27_0.Parent;
        end;
    end;
    local function _(v41) --[[ Line: 140 ]] --[[ Name: ResetNodeDictionary ]]
        for v42 in v41 do
            v42.F = 0;
            v42.G = 0;
            v42.H = 0;
            v42.Parent = nil;
        end;
    end;
    for v44 in v28 do
        v44.F = 0;
        v44.G = 0;
        v44.H = 0;
        v44.Parent = nil;
    end;
    for v45 in v29 do
        v45.F = 0;
        v45.G = 0;
        v45.H = 0;
        v45.Parent = nil;
    end;
    return v25 and v24 or nil;
end;
v0.Init = function(_) --[[ Line: 156 ]] --[[ Name: Init ]]
    BuildNodes();
end;
return v0;