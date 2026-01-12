local v0 = {};
v0.__index = v0;
local v1 = {
    DistanceOuter = 16, 
    DistanceInner = 4, 
    EffectRadius = 16, 
    EffectRadiusMin = 0, 
    EdgeDistanceCalculations = false, 
    Texture = "rbxassetid://18838056070", 
    TextureTransparency = 0, 
    TextureTransparencyMin = 1, 
    BackgroundTransparency = 1, 
    BackgroundTransparencyMin = 1, 
    TextureColor = Color3.fromRGB(255, 255, 255), 
    BackgroundColor = Color3.fromRGB(255, 255, 255), 
    TextureSize = Vector2.new(8, 8), 
    TextureOffset = Vector2.new(0, 0), 
    ZOffset = 0, 
    AlwaysOnTop = false, 
    Brightness = 1, 
    LightInfluence = 0, 
    MaxDistance = 1000, 
    PixelsPerStud = 100, 
    SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
};
local function _(v2) --[[ Line: 53 ]] --[[ Name: SetUpFolders ]]
    if v2.WorkspaceFolder == nil then
        local l_DistanceFade_SurfaceParts_0 = game.Workspace:FindFirstChild("DistanceFade_SurfaceParts");
        if l_DistanceFade_SurfaceParts_0 ~= nil then
            v2.WorkspaceFolder = l_DistanceFade_SurfaceParts_0;
            return;
        else
            v2.WorkspaceFolder = Instance.new("Folder");
            v2.WorkspaceFolder.Name = "DistanceFade_SurfaceParts";
            v2.WorkspaceFolder.Parent = workspace;
        end;
    end;
end;
v0.new = function() --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v5 = {
        Settings = {}, 
        FaceSettings = {}, 
        TargetParts = {}, 
        WorkspaceFolder = nil
    };
    setmetatable(v5, v0);
    v5.Settings = {};
    for v6, v7 in v1 do
        v5.Settings[v6] = v7;
    end;
    if v5.WorkspaceFolder == nil then
        local l_DistanceFade_SurfaceParts_1 = game.Workspace:FindFirstChild("DistanceFade_SurfaceParts");
        if l_DistanceFade_SurfaceParts_1 ~= nil then
            v5.WorkspaceFolder = l_DistanceFade_SurfaceParts_1;
            return v5;
        else
            v5.WorkspaceFolder = Instance.new("Folder");
            v5.WorkspaceFolder.Name = "DistanceFade_SurfaceParts";
            v5.WorkspaceFolder.Parent = workspace;
        end;
    end;
    return v5;
end;
v0.UpdateSettings = function(v9, v10) --[[ Line: 101 ]] --[[ Name: UpdateSettings ]]
    -- upvalues: v1 (copy)
    if v9.Settings == nil then
        v9.Settings = {};
    end;
    if v10 == nil then
        for v11, v12 in v1 do
            v9.Settings[v11] = v12;
        end;
        return;
    else
        assert(type(v10) == "table", "Expected table as parameter");
        for v13, v14 in v1 do
            if v10[v13] ~= nil then
                v9.Settings[v13] = v10[v13];
            elseif v9.Settings[v13] == nil then
                v9.Settings[v13] = v14;
            end;
        end;
        return;
    end;
end;
v0.UpdateFaceSettings = function(v15, v16, v17, v18) --[[ Line: 124 ]] --[[ Name: UpdateFaceSettings ]]
    if v15.FaceSettings[v16] == nil then
        v15.FaceSettings[v16] = {};
    end;
    if v15.FaceSettings[v16][v17] == nil then
        v15.FaceSettings[v16][v17] = {};
    end;
    if v18 == nil then
        v15.FaceSettings[v16][v17] = nil;
        return;
    else
        assert(type(v18) == "table", "Expected table as parameter");
        for v19, v20 in pairs(v18) do
            v15.FaceSettings[v16][v17][v19] = v20;
        end;
        return;
    end;
end;
local function v24(v21, v22) --[[ Line: 147 ]] --[[ Name: GetNormalDirection ]]
    local v23 = nil;
    if v21 == Enum.NormalId.Front then
        return v22.CFrame.LookVector;
    elseif v21 == Enum.NormalId.Back then
        return -v22.CFrame.LookVector;
    elseif v21 == Enum.NormalId.Left then
        return -v22.CFrame.RightVector;
    elseif v21 == Enum.NormalId.Right then
        return v22.CFrame.RightVector;
    elseif v21 == Enum.NormalId.Top then
        return v22.CFrame.UpVector;
    else
        if v21 == Enum.NormalId.Bottom then
            v23 = -v22.CFrame.UpVector;
        end;
        return v23;
    end;
end;
local function v29(v25, v26) --[[ Line: 168 ]] --[[ Name: GetNormalOffset ]]
    local v27 = Vector3.new();
    local v28 = CFrame.new();
    if v25 == Enum.NormalId.Front then
        return v26.Size.Z / 2 * v26.CFrame.LookVector, (CFrame.Angles(0, 0, 0));
    elseif v25 == Enum.NormalId.Back then
        return v26.Size.Z / 2 * -v26.CFrame.LookVector, (CFrame.Angles(0, 3.141592653589793, 0));
    elseif v25 == Enum.NormalId.Left then
        return v26.Size.X / 2 * -v26.CFrame.RightVector, (CFrame.Angles(0, 1.5707963267948966, 0));
    elseif v25 == Enum.NormalId.Right then
        return v26.Size.X / 2 * v26.CFrame.RightVector, (CFrame.Angles(0, -1.5707963267948966, 0));
    elseif v25 == Enum.NormalId.Top then
        return v26.Size.Y / 2 * v26.CFrame.UpVector, (CFrame.Angles(1.5707963267948966, 0, 0));
    else
        if v25 == Enum.NormalId.Bottom then
            v27 = v26.Size.Y / 2 * -v26.CFrame.UpVector;
            v28 = CFrame.Angles(-1.5707963267948966, 0, 0);
        end;
        return v27, v28;
    end;
end;
local function v45(v30, v31, v32, v33) --[[ Line: 196 ]] --[[ Name: GetSidePositionsOfPartAlongNormal ]]
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    if v32 == Enum.NormalId.Front or v32 == Enum.NormalId.Back then
        v34 = v33.X / 2;
        v35 = v33.Y / 2;
        v36 = v33.Z / 2;
        v37 = v32 == Enum.NormalId.Front and v31.RightVector or -v31.RightVector;
        v38 = v31.UpVector;
        v39 = v32 == Enum.NormalId.Front and v31.LookVector * v36 or -v31.LookVector * v36;
    elseif v32 == Enum.NormalId.Left or v32 == Enum.NormalId.Right then
        v34 = v33.Z / 2;
        v35 = v33.Y / 2;
        v36 = v33.X / 2;
        v37 = v32 == Enum.NormalId.Left and v31.LookVector or -v31.LookVector;
        v38 = v31.UpVector;
        v39 = v32 == Enum.NormalId.Left and -v31.RightVector * v36 or v31.RightVector * v36;
    elseif v32 == Enum.NormalId.Top or v32 == Enum.NormalId.Bottom then
        v34 = v33.X / 2;
        v35 = v33.Z / 2;
        v36 = v33.Y / 2;
        v37 = v31.RightVector;
        v38 = v32 == Enum.NormalId.Top and -v31.LookVector or v31.LookVector;
        v39 = v32 == Enum.NormalId.Top and v31.UpVector * v36 or -v31.UpVector * v36;
    end;
    local v40 = v30 + v39;
    local v41 = v40 - v37 * v34;
    local v42 = v40 + v37 * v34;
    local v43 = v40 + v38 * v35;
    local v44 = v40 - v38 * v35;
    return {
        Left = v41, 
        Right = v42, 
        Top = v43, 
        Bottom = v44
    };
end;
local function v51(v46, v47, v48) --[[ Line: 242 ]] --[[ Name: ToNormalSpace ]]
    local v49 = v46:PointToObjectSpace(v47);
    local _ = nil;
    if v48 == Enum.NormalId.Front then
        return v49;
    elseif v48 == Enum.NormalId.Back then
        return (Vector3.new(-v49.X, v49.Y, v49.Z));
    elseif v48 == Enum.NormalId.Left then
        return (Vector3.new(-v49.Z, v49.Y, v49.X));
    elseif v48 == Enum.NormalId.Right then
        return (Vector3.new(v49.Z, v49.Y, v49.X));
    elseif v48 == Enum.NormalId.Top then
        return (Vector3.new(v49.X, v49.Z, v49.Y));
    else
        return (Vector3.new(v49.X, -v49.Z, v49.Y));
    end;
end;
local function v55() --[[ Line: 267 ]] --[[ Name: NewTile ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.ClipsDescendants = true;
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.Name = "ScaleFrame";
    l_Frame_1.Parent = l_Frame_0;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = l_Frame_1;
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.Size = UDim2.new(9, 0, 9, 0);
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Tile;
    l_ImageLabel_0.TileSize = UDim2.new(0.111, 0, 0.111, 0);
    return l_Frame_0;
end;
local function v62(_, v57) --[[ Line: 290 ]] --[[ Name: CreateGrid ]]
    -- upvalues: v55 (copy)
    local v58 = {};
    for v59 = 1, 4 do
        for v60 = 1, 4 do
            local v61 = v55();
            v61.Parent = v57.ScaleFrame;
            v61.Size = UDim2.new(0.25, 0, 0.25, 0);
            v61.Position = UDim2.new((v60 - 1) * 0.25, 0, (v59 - 1) * 0.25, 0);
            v61.BorderSizePixel = 0;
            table.insert(v58, v61);
            v61.Name = tostring(#v58);
        end;
    end;
    return v58;
end;
local function v75(v63) --[[ Line: 309 ]] --[[ Name: ApplyCircularGradient ]]
    local v64 = {
        [1] = 45, 
        [4] = 135, 
        [13] = -45, 
        [16] = -135
    };
    local v65 = {
        [2] = 75, 
        [3] = 105, 
        [5] = 15, 
        [8] = 165, 
        [9] = -15, 
        [12] = -165, 
        [14] = -75, 
        [15] = -105
    };
    for v66 = 1, #v63 do
        local v67 = v63[v66];
        local v68 = false;
        for v69, v70 in v64 do
            if v69 == v66 then
                local l_UIGradient_0 = Instance.new("UIGradient");
                l_UIGradient_0.Parent = v67.ScaleFrame.ImageLabel;
                l_UIGradient_0.Rotation = v70;
                v68 = true;
                break;
            end;
        end;
        if not v68 then
            for v72, v73 in v65 do
                if v72 == v66 then
                    local l_UIGradient_1 = Instance.new("UIGradient");
                    l_UIGradient_1.Parent = v67.ScaleFrame.ImageLabel;
                    l_UIGradient_1.Rotation = v73;
                    break;
                end;
            end;
        end;
    end;
end;
local function v86(v76, v77, v78) --[[ Line: 352 ]] --[[ Name: SetUpSurface ]]
    -- upvalues: v29 (copy), v62 (copy), v75 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Transparency = 1;
    l_Part_0.Parent = v78.WorkspaceFolder;
    l_Part_0.Size = Vector3.new(0, 0, 0, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanTouch = false;
    l_Part_0.CanQuery = false;
    l_Part_0.Locked = true;
    local v80, v81 = v29(v77, v76);
    l_Part_0.CFrame = v76.CFrame * CFrame.new(v80) * v81;
    local l_SurfaceGui_0 = Instance.new("SurfaceGui");
    l_SurfaceGui_0.ResetOnSpawn = false;
    l_SurfaceGui_0.ClipsDescendants = true;
    l_SurfaceGui_0.Parent = game.Players.LocalPlayer.PlayerGui;
    l_SurfaceGui_0.Adornee = l_Part_0;
    l_SurfaceGui_0.Face = Enum.NormalId.Front;
    l_SurfaceGui_0.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud;
    l_SurfaceGui_0.PixelsPerStud = 1000;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_2.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Name = "ScaleFrame";
    l_Frame_2.Parent = l_SurfaceGui_0;
    l_SurfaceGui_0.Enabled = false;
    local l_EffectResolution_0 = v78.Settings.EffectResolution;
    local v85 = v62(l_EffectResolution_0, l_SurfaceGui_0);
    v75(v85, l_EffectResolution_0);
    return l_Part_0, l_SurfaceGui_0;
end;
v0.AddFace = function(v87, v88, v89) --[[ Line: 389 ]] --[[ Name: AddFace ]]
    -- upvalues: v86 (copy)
    if v89 == nil then
        v89 = Enum.NormalId.Front;
    end;
    local v90, v91 = v86(v88, v89, v87);
    local v92 = {
        SurfaceNormal = v89, 
        SurfacePart = v90, 
        SurfaceGui = v91
    };
    if v87.TargetParts[v88] == nil then
        v87.TargetParts[v88] = {};
    end;
    v87.TargetParts[v88][v89] = v92;
end;
v0.RemoveFace = function(v93, v94, v95) --[[ Line: 406 ]] --[[ Name: RemoveFace ]]
    if v95 == nil then
        v95 = Enum.NormalId.Front;
    end;
    if v93.TargetParts[v94] == nil then
        return;
    else
        local v96 = v93.TargetParts[v94][v95];
        if v96 == nil then
            return;
        else
            v96.SurfacePart:Destroy();
            v96.SurfaceGui:Destroy();
            v93.TargetParts[v94][v95] = nil;
            if next(v93.TargetParts[v94]) == nil then
                v93.TargetParts[v94] = nil;
                if v93.WorkspaceFolder ~= nil and #v93.WorkspaceFolder:GetChildren() == 0 then
                    v93.WorkspaceFolder:Destroy();
                    v93.WorkspaceFolder = nil;
                end;
            end;
            return;
        end;
    end;
end;
v0.Clear = function(v97) --[[ Line: 432 ]] --[[ Name: Clear ]]
    for _, v99 in v97.TargetParts do
        for _, v101 in v99 do
            v101.SurfacePart:Destroy();
            v101.SurfaceGui:Destroy();
        end;
    end;
    if v97.WorkspaceFolder ~= nil and #v97.WorkspaceFolder:GetChildren() == 0 then
        v97.WorkspaceFolder:Destroy();
        v97.WorkspaceFolder = nil;
    end;
    table.clear(v97.TargetParts);
end;
local v102 = {
    [1] = {
        OffsetX = 3, 
        OffsetY = 3
    }, 
    [2] = {
        OffsetX = 2, 
        OffsetY = 3
    }, 
    [3] = {
        OffsetX = 1, 
        OffsetY = 3
    }, 
    [4] = {
        OffsetX = 0, 
        OffsetY = 3
    }, 
    [5] = {
        OffsetX = 3, 
        OffsetY = 2
    }, 
    [6] = {
        OffsetX = 2, 
        OffsetY = 2
    }, 
    [7] = {
        OffsetX = 1, 
        OffsetY = 2
    }, 
    [8] = {
        OffsetX = 0, 
        OffsetY = 2
    }, 
    [9] = {
        OffsetX = 3, 
        OffsetY = 1
    }, 
    [10] = {
        OffsetX = 2, 
        OffsetY = 1
    }, 
    [11] = {
        OffsetX = 1, 
        OffsetY = 1
    }, 
    [12] = {
        OffsetX = 0, 
        OffsetY = 1
    }, 
    [13] = {
        OffsetX = 3, 
        OffsetY = 0
    }, 
    [14] = {
        OffsetX = 2, 
        OffsetY = 0
    }, 
    [15] = {
        OffsetX = 1, 
        OffsetY = 0
    }, 
    [16] = {
        OffsetX = 0, 
        OffsetY = 0
    }
};
local function v114(v103, v104, v105, v106) --[[ Line: 524 ]] --[[ Name: UpdateTextureOffset ]]
    local function _(v107, v108) --[[ Line: 525 ]] --[[ Name: ConvertToRange ]]
        local v109 = math.abs(v107) / v108 % 1;
        if v107 < 0 then
            return -v109;
        else
            return v109;
        end;
    end;
    local v111 = math.abs(v103) / v105 % 1;
    local v112 = if v103 < 0 then -v111 else v111;
    local v113 = math.abs(v104) / v106 % 1;
    v111 = if v104 < 0 then -v113 else v113;
    return UDim2.new(0.5 + v112 * v105, 0, 0.5 + v111 * v106, 0);
end;
local function _(v115, v116) --[[ Line: 539 ]] --[[ Name: AdjustGradientOffset ]]
    local v117 = math.rad(v115.Rotation);
    local v118 = math.cos(v117);
    local v119 = math.sin(v117);
    local v120 = v116.X * v118 - v116.Y * v119;
    local v121 = v116.X * v119 + v116.Y * v118;
    return Vector2.new(v120, v121);
end;
UpdateSideGradient = function(v123) --[[ Line: 550 ]] --[[ Name: UpdateSideGradient ]]
    local l_UIGradient_2 = v123.ScaleFrame.ImageLabel.UIGradient;
    local _ = v123.ScaleFrame.Size;
    local l_Position_0 = v123.ScaleFrame.ImageLabel.Position;
    local v127 = -(l_Position_0.X.Scale + 0.5) / 200;
    if v123.Name == "2" or v123.Name == "3" or v123.Name == "14" or v123.Name == "15" then
        v127 = 0;
    end;
    local v128 = -(l_Position_0.Y.Scale + 0.5) / 200;
    if v123.Name == "5" or v123.Name == "8" or v123.Name == "9" or v123.Name == "12" then
        v128 = 0;
    end;
    if v123.Name == "5" or v123.Name == "9" then
        v127 = v127 + 0.01;
    end;
    if v123.Name == "2" or v123.Name == "3" then
        v128 = v128 + 0.01;
    end;
    local v129 = (l_Position_0.X.Scale - 0.5) / 9 + v127;
    local v130 = (l_Position_0.Y.Scale - 0.5) / 9 + v128;
    if v123.Name == "12" or v123.Name == "9" or v123.Name == "2" or v123.Name == "3" then
        v130 = -v130;
    end;
    if v123.Name == "5" or v123.Name == "9" or v123.Name == "15" or v123.Name == "3" then
        v129 = -v129;
    end;
    if v123.Name == "2" or v123.Name == "3" or v123.Name == "14" or v123.Name == "15" then
        local l_v129_0 = v129;
        v129 = v130;
        v130 = l_v129_0;
    end;
    local v132 = {
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.444, 1), 
        NumberSequenceKeypoint.new(0.466, 1), 
        NumberSequenceKeypoint.new(0.555, 0), 
        NumberSequenceKeypoint.new(1, 0)
    };
    local v133 = {};
    for v134 = 1, #v132 do
        local v135 = v132[v134];
        local v136 = v135.Time + v129;
        v133[v134] = NumberSequenceKeypoint.new(math.clamp(v136, 0, 1), v135.Value);
    end;
    if v133[1].Time > 0 then
        table.insert(v133, 1, NumberSequenceKeypoint.new(0, v133[1].Value));
    end;
    if v133[#v133].Time < 1 then
        table.insert(v133, NumberSequenceKeypoint.new(1, v133[#v133].Value));
    end;
    for _, v138 in v133 do
        if v138.Time < 0 then
            v138.Time = 0;
        elseif v138.Time > 1 then
            v138.Time = 1;
        end;
    end;
    l_UIGradient_2.Transparency = NumberSequence.new(v133);
    local v139 = Vector2.new(-v130 / 4, 0);
    local v140 = math.rad(l_UIGradient_2.Rotation);
    local v141 = math.cos(v140);
    local v142 = math.sin(v140);
    local v143 = v139.X * v141 - v139.Y * v142;
    local v144 = v139.X * v142 + v139.Y * v141;
    l_UIGradient_2.Offset = Vector2.new(v143, v144);
end;
UpdateCornerGradient = function(v145) --[[ Line: 617 ]] --[[ Name: UpdateCornerGradient ]]
    local l_UIGradient_3 = v145.ScaleFrame.ImageLabel.UIGradient;
    local _ = v145.ScaleFrame.Size;
    local l_Position_1 = v145.ScaleFrame.ImageLabel.Position;
    local v149 = -(l_Position_1.X.Scale + 0.5) / 75;
    local v150 = -(l_Position_1.Y.Scale + 0.5) / 75;
    local v151 = (l_Position_1.X.Scale - 0.5) / 9 + v149;
    local v152 = (l_Position_1.Y.Scale - 0.5) / 9 + v150;
    if v145.Name == "13" or v145.Name == "1" then
        v151 = -v151;
    end;
    if v145.Name == "1" or v145.Name == "4" then
        v152 = -v152;
    end;
    local v153 = 0;
    if v145.Name == "1" then
        v153 = -0.015;
    elseif v145.Name == "4" then
        v153 = 0.0025;
    elseif v145.Name == "16" then
        v153 = 0.02;
    elseif v145.Name == "13" then
        v153 = 0.0025;
    end;
    local v154 = (v151 + v152) / 1.4142135623730951 + v153;
    local v155 = (v151 + v152) / 1.4142135623730951 + v153;
    local v156 = {
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.444, 1), 
        NumberSequenceKeypoint.new(0.51, 1), 
        NumberSequenceKeypoint.new(0.555, 0.2), 
        NumberSequenceKeypoint.new(1, 0.2)
    };
    local v157 = {};
    for v158 = 1, #v156 do
        local v159 = v156[v158];
        local v160 = v159.Time + v154;
        v157[v158] = NumberSequenceKeypoint.new(math.clamp(v160, 0, 1), v159.Value);
    end;
    if v157[1].Time > 0 then
        table.insert(v157, 1, NumberSequenceKeypoint.new(0, v157[1].Value));
    end;
    if v157[#v157].Time < 1 then
        table.insert(v157, NumberSequenceKeypoint.new(1, v157[#v157].Value));
    end;
    if v145.Name == "1" or v145.Name == "4" then
        local v161 = {};
        for v162, v163 in v157 do
            if v163.Time == 1 then
                for v164 = 1, v162 do
                    table.insert(v161, v157[v164]);
                end;
                v157 = v161;
                break;
            end;
        end;
    end;
    for _, v166 in v157 do
        if v166.Time < 0 then
            v166.Time = 0;
        elseif v166.Time > 1 then
            v166.Time = 1;
        end;
    end;
    l_UIGradient_3.Transparency = NumberSequence.new(v157);
    local v167 = Vector2.new(-v155 / 4, 0);
    local v168 = math.rad(l_UIGradient_3.Rotation);
    local v169 = math.cos(v168);
    local v170 = math.sin(v168);
    local v171 = v167.X * v169 - v167.Y * v170;
    local v172 = v167.X * v170 + v167.Y * v169;
    l_UIGradient_3.Offset = Vector2.new(v171, v172);
end;
v0.Step = function(v173, v174) --[[ Line: 697 ]] --[[ Name: Step ]]
    -- upvalues: v29 (copy), v24 (copy), v45 (copy), v51 (copy), v102 (copy), v114 (copy)
    if v173.WorkspaceFolder == nil then
        local l_DistanceFade_SurfaceParts_2 = game.Workspace:FindFirstChild("DistanceFade_SurfaceParts");
        if l_DistanceFade_SurfaceParts_2 ~= nil then
            v173.WorkspaceFolder = l_DistanceFade_SurfaceParts_2;
        else
            v173.WorkspaceFolder = Instance.new("Folder");
            v173.WorkspaceFolder.Name = "DistanceFade_SurfaceParts";
            v173.WorkspaceFolder.Parent = workspace;
        end;
    end;
    local l_Settings_0 = v173.Settings;
    if l_Settings_0.EffectRadiusMin > l_Settings_0.EffectRadius then
        l_Settings_0.EffectRadiusMin = l_Settings_0.EffectRadius;
    end;
    if l_Settings_0.DistanceInner > l_Settings_0.DistanceOuter then
        l_Settings_0.DistanceInner = l_Settings_0.DistanceOuter;
    end;
    if v174 == nil then
        local l_Character_0 = game.Players.LocalPlayer.Character;
        if l_Character_0 == nil then
            return;
        elseif l_Character_0.PrimaryPart == nil then
            return;
        else
            v174 = l_Character_0.HumanoidRootPart.Position;
        end;
    end;
    for v178, v179 in v173.TargetParts do
        for v180, v181 in v179 do
            local v182 = {};
            if v173.FaceSettings[v178] ~= nil and v173.FaceSettings[v178][v180] ~= nil then
                for v183, v184 in l_Settings_0 do
                    v182[v183] = v184;
                    if v173.FaceSettings[v178][v180][v183] ~= nil then
                        v182[v183] = v173.FaceSettings[v178][v180][v183];
                    end;
                end;
            end;
            local l_l_Settings_0_0 = l_Settings_0;
            if next(v182) ~= nil then
                l_l_Settings_0_0 = v182;
            end;
            local l_SurfacePart_0 = v181.SurfacePart;
            local l_SurfaceGui_1 = v181.SurfaceGui;
            l_SurfaceGui_1.ZOffset = l_l_Settings_0_0.ZOffset;
            l_SurfaceGui_1.AlwaysOnTop = l_l_Settings_0_0.AlwaysOnTop;
            l_SurfaceGui_1.Brightness = l_l_Settings_0_0.Brightness;
            l_SurfaceGui_1.LightInfluence = l_l_Settings_0_0.LightInfluence;
            l_SurfaceGui_1.MaxDistance = l_l_Settings_0_0.MaxDistance;
            l_SurfaceGui_1.PixelsPerStud = l_l_Settings_0_0.PixelsPerStud;
            l_SurfaceGui_1.SizingMode = l_l_Settings_0_0.SizingMode;
            local _ = v178.CFrame;
            local v189, v190 = v29(v181.SurfaceNormal, v178);
            local v191 = v24(v181.SurfaceNormal, v178);
            local v192 = v174 - (v178.Position + v189);
            local v193 = v192 - v191 * v192:Dot(v191);
            local v194 = v178.Position + v193 + v189;
            local v195 = v178.CFrame * CFrame.new(v189) * v190;
            l_SurfacePart_0.CFrame = CFrame.new(v194) * CFrame.fromMatrix(Vector3.new(), v195.RightVector, v195.UpVector);
            local l_Magnitude_0 = (v174 - l_SurfacePart_0.Position).Magnitude;
            local v197 = v45(v178.Position, v178.CFrame, v181.SurfaceNormal, v178.Size);
            if l_l_Settings_0_0.EdgeDistanceCalculations then
                local v198 = 1e999;
                local v199 = v51(CFrame.new(v197.Top) * (v178.CFrame - v178.CFrame.Position), v174, v181.SurfaceNormal);
                v199 = Vector3.new(0, v199.Y, v199.Z).Magnitude;
                if v199 < v198 then
                    v198 = v199;
                end;
                local v200 = v51(CFrame.new(v197.Bottom) * (v178.CFrame - v178.CFrame.Position), v174, v181.SurfaceNormal);
                v200 = Vector3.new(0, v200.Y, v200.Z).Magnitude;
                if v200 < v198 then
                    v198 = v200;
                end;
                local v201 = v51(CFrame.new(v197.Left) * (v178.CFrame - v178.CFrame.Position), v174, v181.SurfaceNormal);
                v201 = Vector3.new(v201.X, 0, v201.Z).Magnitude;
                if v201 < v198 then
                    v198 = v201;
                end;
                local v202 = v51(CFrame.new(v197.Right) * (v178.CFrame - v178.CFrame.Position), v174, v181.SurfaceNormal);
                v202 = Vector3.new(v202.X, 0, v202.Z).Magnitude;
                if v202 < v198 then
                    v198 = v202;
                end;
                if v198 < l_Magnitude_0 then
                    l_Magnitude_0 = v198;
                end;
            end;
            local v203 = 1 / (l_l_Settings_0_0.TextureSize.X * 2 / l_l_Settings_0_0.EffectRadius);
            local v204 = nil;
            if l_Magnitude_0 < l_l_Settings_0_0.DistanceInner then
                l_SurfaceGui_1.Enabled = true;
                v204 = v203;
            elseif l_Magnitude_0 < l_l_Settings_0_0.DistanceOuter then
                l_SurfaceGui_1.Enabled = true;
                v204 = v203 - math.clamp((l_Magnitude_0 - l_l_Settings_0_0.DistanceInner) / (l_l_Settings_0_0.DistanceOuter - l_l_Settings_0_0.DistanceInner), 0, 1);
            else
                l_SurfaceGui_1.Enabled = false;
                v204 = 0;
                continue;
            end;
            local v205 = l_l_Settings_0_0.EffectRadius / v203;
            local v206 = l_l_Settings_0_0.TextureSize.X * 2 / l_l_Settings_0_0.EffectRadius;
            local v207 = (l_l_Settings_0_0.EffectRadiusMin + (l_l_Settings_0_0.EffectRadius - l_l_Settings_0_0.EffectRadiusMin) * v204 * v206) * 2;
            l_SurfacePart_0.Size = Vector3.new(v207, v207, l_SurfacePart_0.Size.Z);
            local v208 = v45(l_SurfacePart_0.Position, l_SurfacePart_0.CFrame, Enum.NormalId.Front, l_SurfacePart_0.Size);
            local v209 = {
                Left = v51(v178.CFrame, v197.Left, v181.SurfaceNormal), 
                Right = v51(v178.CFrame, v197.Right, v181.SurfaceNormal), 
                Top = v51(v178.CFrame, v197.Top, v181.SurfaceNormal), 
                Bottom = v51(v178.CFrame, v197.Bottom, v181.SurfaceNormal)
            };
            local v210 = {
                Left = v51(v178.CFrame, v208.Left, v181.SurfaceNormal), 
                Right = v51(v178.CFrame, v208.Right, v181.SurfaceNormal), 
                Top = v51(v178.CFrame, v208.Top, v181.SurfaceNormal), 
                Bottom = v51(v178.CFrame, v208.Bottom, v181.SurfaceNormal)
            };
            local v211 = 1;
            local v212 = 1;
            if v210.Left.X < v209.Left.X then
                v211 = 1 - (v209.Left.X - v210.Left.X) / l_SurfacePart_0.Size.X;
            end;
            if v210.Right.X > v209.Right.X then
                v212 = 1 - (v210.Right.X - v209.Right.X) / l_SurfacePart_0.Size.X;
            end;
            local v213 = 1;
            local v214 = 1;
            if v210.Bottom.Y < v209.Bottom.Y then
                v214 = 1 - (v209.Bottom.Y - v210.Bottom.Y) / l_SurfacePart_0.Size.Y;
            end;
            if v210.Top.Y > v209.Top.Y then
                v213 = 1 - (v210.Top.Y - v209.Top.Y) / l_SurfacePart_0.Size.Y;
            end;
            if v213 < 0 or v214 < 0 or v211 < 0 or v212 < 0 then
                l_SurfaceGui_1.Enabled = false;
            else
                local v215 = 1 - (1 - v211 + (1 - v212));
                local v216 = 1 - (1 - v213 + (1 - v214));
                local v217 = v211 <= v212 and 1 or -1;
                local v218 = v214 <= v213 and 1 or -1;
                local v219 = l_SurfacePart_0.Size * Vector3.new(v215, v216, 1);
                local v220 = nil;
                if v212 < 1 and v211 < 1 then
                    local v221 = (v212 - v211) * 2;
                    v220 = (l_SurfacePart_0.Size.X - v219.X) / 2 * v221;
                    local v222 = (v210.Right.X + v210.Left.X) / 2;
                    local v223 = (v209.Right.X + v209.Left.X) / 2;
                    local v224 = math.abs(v209.Right.X - v209.Left.X);
                    v220 = v220 - (v222 + v220 + v219.X - (v223 + v224));
                    v217 = v221 / ((1 - (v212 + v211 - 1)) * 2);
                else
                    v220 = (l_SurfacePart_0.Size.X - v219.X) / 2 * v217;
                end;
                local v225 = nil;
                if v213 < 1 and v214 < 1 then
                    local v226 = (v213 - v214) * 2;
                    v225 = (l_SurfacePart_0.Size.Y - v219.Y) / 2 * v226;
                    local v227 = (v210.Top.Y + v210.Bottom.Y) / 2;
                    local v228 = (v209.Top.Y + v209.Bottom.Y) / 2;
                    local v229 = math.abs(v209.Top.Y - v209.Bottom.Y);
                    v225 = v225 - (v227 + v225 + v219.Y - (v228 + v229));
                    v218 = v226 / ((1 - (v213 + v214 - 1)) * 2);
                else
                    v225 = (l_SurfacePart_0.Size.Y - v219.Y) / 2 * v218;
                end;
                l_SurfacePart_0.CFrame = l_SurfacePart_0.CFrame * CFrame.new(v220, v225, 0);
                l_SurfacePart_0.Size = v219;
                l_SurfaceGui_1.ScaleFrame.Size = UDim2.new(1 / v215, 0, 1 / v216, 0);
                l_SurfaceGui_1.ScaleFrame.Position = UDim2.new(0.5 - (1 - 1 / v215) / 2 * v217, 0, 0.5 - (1 - 1 / v216) / 2 * v218, 0);
                local v230 = 1;
                if v203 > 1 then
                    v230 = v203;
                end;
                local v231 = math.min((1 - (v204 + (1 - v203))) / (0.8 - (1 - v203)), 1) * v230;
                if v231 < 0 then
                    v231 = 1;
                end;
                local v232 = l_l_Settings_0_0.TextureTransparency + (l_l_Settings_0_0.TextureTransparencyMin - l_l_Settings_0_0.TextureTransparency) * v231;
                local v233 = l_l_Settings_0_0.BackgroundTransparency + (l_l_Settings_0_0.BackgroundTransparencyMin - l_l_Settings_0_0.BackgroundTransparency) * v231;
                local v234 = 1 / (v204 + (v203 - v204) * (l_l_Settings_0_0.EffectRadiusMin / l_l_Settings_0_0.EffectRadius));
                local l_Position_2 = l_SurfacePart_0.Position;
                local v236 = l_Position_2 - v191 * l_Position_2:Dot(v191);
                local v237 = v51(v178.CFrame, v236, v181.SurfaceNormal);
                local v238 = (1 / v234 - 1) * 3 * v234;
                local v239 = -(1 - v215) / 0.5 * v217;
                local v240 = -(1 - v216) / 0.5 * v218;
                local v241 = -l_l_Settings_0_0.TextureOffset.X / l_l_Settings_0_0.TextureSize.X * v234;
                local v242 = l_l_Settings_0_0.TextureSize.Y / l_l_Settings_0_0.TextureSize.X;
                local v243 = v242 - 1;
                local v244 = -l_l_Settings_0_0.TextureOffset.Y / l_l_Settings_0_0.TextureSize.X * v234;
                for _, v246 in l_SurfaceGui_1.ScaleFrame:GetChildren() do
                    local l_ImageLabel_1 = v246.ScaleFrame.ImageLabel;
                    l_ImageLabel_1.Image = l_l_Settings_0_0.Texture;
                    l_ImageLabel_1.ImageTransparency = v232;
                    l_ImageLabel_1.ImageColor3 = l_l_Settings_0_0.TextureColor;
                    l_ImageLabel_1.BackgroundTransparency = v233;
                    l_ImageLabel_1.BackgroundColor3 = l_l_Settings_0_0.BackgroundColor;
                    local v248 = v102[tonumber(v246.Name)];
                    local v249 = (1 / v234 - 1) * v234 * v248.OffsetX;
                    local v250 = (1 / v234 - 1) * v234 * v248.OffsetY;
                    local v251 = v241 + v249 + v239 + v238 + v237.X / (v205 / 2) * v234;
                    local v252 = v244 + v250 + v240 + v238 + v237.Y / (v205 / 2) * v234;
                    l_ImageLabel_1.TileSize = UDim2.new(math.max(0.111 * v234, 0.001), 0, math.max(0.111 * v234 * v242, 0.001), 0);
                    if v246.Name == "1" or v246.Name == "2" or v246.Name == "3" or v246.Name == "4" then
                        v252 = v252 - v243 * v234;
                    elseif v246.Name == "9" or v246.Name == "10" or v246.Name == "11" or v246.Name == "12" then
                        v252 = v252 + v243 * v234;
                    elseif v246.Name == "13" or v246.Name == "14" or v246.Name == "15" or v246.Name == "16" then
                        v252 = v252 + v243 * v234 * 2;
                    end;
                    local v253 = v114(v251, v252, v234, v234 * v242);
                    local v254 = 0;
                    local v255 = 0;
                    if v253.X.Scale > 4.5 then
                        v254 = v253.X.Scale - 4.5;
                    elseif v253.X.Scale < -3.5 then
                        v254 = v253.X.Scale + 3.5;
                    end;
                    if v253.Y.Scale > 4.5 then
                        v255 = v253.Y.Scale - 4.5;
                    elseif v253.Y.Scale < -3.5 then
                        v255 = v253.Y.Scale + 3.5;
                    end;
                    local v256 = Vector2.new(-v254, -v255);
                    if v255 < 0 then
                        v256 = if v204 < 0.125 then Vector2.new(v256.X, -v255) else Vector2.new(v256.X, 1 * v234);
                    end;
                    if v254 < 0 then
                        v256 = if v204 < 0.125 then Vector2.new(-v254, v256.Y) else Vector2.new(1 * v234, v256.Y);
                    end;
                    l_ImageLabel_1.Position = UDim2.new(v253.X.Scale + v256.X, 0, v253.Y.Scale + v256.Y, 0);
                    local v257 = {
                        2, 
                        3, 
                        5, 
                        9, 
                        8, 
                        12, 
                        14, 
                        15
                    };
                    local v258 = {
                        1, 
                        4, 
                        13, 
                        16
                    };
                    if table.find(v257, (tonumber(v246.Name))) then
                        local _, _ = pcall(function() --[[ Line: 975 ]]
                            -- upvalues: v246 (copy)
                            UpdateSideGradient(v246);
                        end);
                    elseif table.find(v258, (tonumber(v246.Name))) then
                        local _, _ = pcall(function() --[[ Line: 979 ]]
                            -- upvalues: v246 (copy)
                            UpdateCornerGradient(v246);
                        end);
                    end;
                end;
            end;
        end;
    end;
end;
return v0;