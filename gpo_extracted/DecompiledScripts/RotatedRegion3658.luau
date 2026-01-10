local l_GJK_0 = require(script:WaitForChild("GJK"));
local l_Supports_0 = require(script:WaitForChild("Supports"));
local l_Vertices_0 = require(script:WaitForChild("Vertices"));
local v3 = {};
v3.__index = v3;
local function v12(v4) --[[ Line: 86 ]] --[[ Name: worldBoundingBox ]]
    local v5 = {};
    local v6 = {};
    local v7 = {};
    for v8 = 1, #v4 do
        local l_x_0 = v4[v8].x;
        local l_y_0 = v4[v8].y;
        local l_z_0 = v4[v8].z;
        v5[v8] = l_x_0;
        v6[v8] = l_y_0;
        v7[v8] = l_z_0;
    end;
    return Vector3.new(math.min(unpack(v5)), math.min(unpack(v6)), (math.min(unpack(v7)))), (Vector3.new(math.max(unpack(v5)), math.max(unpack(v6)), (math.max(unpack(v7)))));
end;
v3.new = function(v13, v14) --[[ Line: 96 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    if v14 ~= v14 then
        return;
    else
        pcall(function() --[[ Line: 100 ]]
            -- upvalues: v14 (ref)
            if v14.X < 0 or v14.Y < 0 or v14.Z < 0 then
                v14 = Vector3.new(0, 0, 0, 0);
            end;
        end);
        pcall(function() --[[ Line: 105 ]]
            -- upvalues: v14 (ref)
            if v14.Magnitude >= 6000 then
                warn("too bifg!");
                v14 = Vector3.new(10, 10, 10, 0);
            end;
        end);
        local v15 = setmetatable({}, v3);
        v15.CFrame = v13;
        v15.Size = v14;
        v15.Shape = "Block";
        return v15;
    end;
end;
v3.Block = v3.new;
v3.Wedge = function(v16, v17) --[[ Line: 129 ]] --[[ Name: Wedge ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy), l_Supports_0 (copy), v12 (copy)
    local v18 = setmetatable({}, v3);
    local v19 = l_Vertices_0.Block(v16, v17 / 2);
    v18.CFrame = v16;
    v18.Size = v17;
    v18.Shape = "Wedge";
    v18.Set = l_Vertices_0.Wedge(v16, v17 / 2);
    v18.Support = l_Supports_0.PointCloud;
    v18.Centroid = l_Vertices_0.GetCentroid(v18.Set);
    v18.AlignedRegion3 = Region3.new(v12(v19));
    return v18;
end;
v3.CornerWedge = function(v20, v21) --[[ Line: 146 ]] --[[ Name: CornerWedge ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy), l_Supports_0 (copy), v12 (copy)
    local v22 = setmetatable({}, v3);
    local v23 = l_Vertices_0.Block(v20, v21 / 2);
    v22.CFrame = v20;
    v22.Size = v21;
    v22.Shape = "CornerWedge";
    v22.Set = l_Vertices_0.CornerWedge(v20, v21 / 2);
    v22.Support = l_Supports_0.PointCloud;
    v22.Centroid = l_Vertices_0.GetCentroid(v22.Set);
    v22.AlignedRegion3 = Region3.new(v12(v23));
    return v22;
end;
v3.Cylinder = function(v24, v25) --[[ Line: 163 ]] --[[ Name: Cylinder ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy), l_Supports_0 (copy), v12 (copy)
    if v25 ~= v25 then
        return;
    else
        pcall(function() --[[ Line: 167 ]]
            -- upvalues: v25 (ref)
            if v25.X < 0 or v25.Y < 0 or v25.Z < 0 then
                v25 = Vector3.new(0, 0, 0, 0);
            end;
        end);
        local v26 = setmetatable({}, v3);
        local v27 = l_Vertices_0.Block(v24, v25 / 2);
        v26.CFrame = v24;
        v26.Size = v25;
        v26.Shape = "Cylinder";
        v26.Set = {
            v24, 
            v25 / 2
        };
        v26.Support = l_Supports_0.Cylinder;
        v26.Centroid = v24.p;
        v26.AlignedRegion3 = Region3.new(v12(v27));
        return v26;
    end;
end;
v3.Ball = function(v28, v29) --[[ Line: 188 ]] --[[ Name: Ball ]]
    -- upvalues: v3 (copy)
    if v29 ~= v29 then
        return;
    else
        pcall(function() --[[ Line: 192 ]]
            -- upvalues: v29 (ref)
            if v29.X < 0 or v29.Y < 0 or v29.Z < 0 then
                v29 = Vector3.new(0, 0, 0, 0);
            end;
        end);
        local v30 = setmetatable({}, v3);
        v30.CFrame = v28;
        v30.Size = v29;
        v30.Shape = "Ball";
        return v30;
    end;
end;
v3.FromPart = function(v31) --[[ Line: 213 ]] --[[ Name: FromPart ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy)
    return v3[l_Vertices_0.Classify(v31)](v31.CFrame, v31.Size);
end;
v3.CastPoint = function(v32, v33) --[[ Line: 219 ]] --[[ Name: CastPoint ]]
    -- upvalues: l_GJK_0 (copy), l_Supports_0 (copy)
    return l_GJK_0.new(v32.Set, {
        v33
    }, v32.Centroid, v33, v32.Support, l_Supports_0.PointCloud):IsColliding();
end;
v3.CastPart = function(v34, v35) --[[ Line: 224 ]] --[[ Name: CastPart ]]
    -- upvalues: v3 (copy), l_GJK_0 (copy)
    local v36 = v3.FromPart(v35);
    return l_GJK_0.new(v34.Set, v36.Set, v34.Centroid, v36.Centroid, v34.Support, v36.Support):IsColliding();
end;
v3.FindPartsInRegion3 = function(v37, v38, v39) --[[ Line: 230 ]] --[[ Name: FindPartsInRegion3 ]]
    local v40 = {};
    local l_PartsInRegion3_0 = game.Workspace:FindPartsInRegion3(v37.AlignedRegion3, v38, v39);
    for v42 = 1, #l_PartsInRegion3_0 do
        if v37:CastPart(l_PartsInRegion3_0[v42]) then
            table.insert(v40, l_PartsInRegion3_0[v42]);
        end;
    end;
    return v40;
end;
local function v51(v43) --[[ Line: 265 ]] --[[ Name: filter ]]
    local v44 = {};
    local v45 = {};
    local v46 = #v43;
    local v47 = 1;
    while v47 <= v46 do
        local v48 = v43[v47];
        if v48 then
            local l_v48_FirstAncestor_0 = v48:FindFirstAncestor("SeaNPC");
            if l_v48_FirstAncestor_0 then
                local l_Parent_0 = l_v48_FirstAncestor_0.Parent;
                if v44[l_Parent_0] then
                    table.remove(v43, v47);
                    v46 = v46 - 1;
                else
                    v44[l_Parent_0] = v48;
                    table.insert(v45, v48);
                    v47 = v47 + 1;
                end;
            else
                table.insert(v45, v48);
                v47 = v47 + 1;
            end;
        else
            table.remove(v43, v47);
            v46 = v46 - 1;
        end;
    end;
    return v45;
end;
local v52 = false;
if game.GameId ~= 2097989947 then
    v52 = false;
end;
v3.FindPartsInRegion3WithIgnoreList = function(v53, v54, v55) --[[ Line: 302 ]] --[[ Name: FindPartsInRegion3WithIgnoreList ]]
    -- upvalues: v51 (copy)
    v54 = v54 or {};
    local v56 = OverlapParams.new();
    v56.FilterType = Enum.RaycastFilterType.Exclude;
    v56.MaxParts = v55 or 5000;
    v56.FilterDescendantsInstances = v54;
    v56.CollisionGroup = "ALL";
    if v53.Shape == "Block" then
        return (v51(workspace:GetPartBoundsInBox(v53.CFrame, v53.Size, v56)));
    else
        return (v51(workspace:GetPartBoundsInRadius(v53.CFrame, v53.Size, v56)));
    end;
end;
v3.FindPartsInRegion3WithWhiteList = function(v57, v58, v59) --[[ Line: 316 ]] --[[ Name: FindPartsInRegion3WithWhiteList ]]
    -- upvalues: v52 (ref), v51 (copy)
    v58 = v58 or {};
    local v60 = OverlapParams.new();
    v60.FilterType = Enum.RaycastFilterType.Include;
    v60.FilterDescendantsInstances = v58;
    v60.MaxParts = v59 or 5000;
    v60.CollisionGroup = "ALL";
    if v52 == true then
        local v61 = script:FindFirstChild(v57.Shape):Clone();
        v61.CFrame = v57.CFrame;
        v61.Size = v57.Size;
        if game:GetService("RunService"):IsServer() then
            v61.Color = Color3.fromRGB(0, 255, 0);
        end;
        v61.Parent = workspace.Effects;
        _G.destroy(v61, 0.25);
    end;
    if v57.Shape == "Block" then
        return (v51(workspace:GetPartBoundsInBox(v57.CFrame, v57.Size, v60)));
    else
        return (v51(workspace:GetPartBoundsInRadius(v57.CFrame.Position, v57.Size.X / 2, v60)));
    end;
end;
v3.Cast = function(v62, v63, v64) --[[ Line: 341 ]] --[[ Name: Cast ]]
    -- upvalues: v51 (copy)
    local v65 = type(v63) == "table" and v63 or {
        v63
    };
    return (v51(v62:FindPartsInRegion3WithIgnoreList(v65, v64)));
end;
return v3;