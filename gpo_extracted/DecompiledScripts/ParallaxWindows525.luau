local v0 = {};
v0.__index = v0;
local v1 = {
    MaxFramerate = 60, 
    MinFramerate = 10, 
    MaxUpdateDistance = 10, 
    MinUpdateDistance = 200, 
    LazyCheckingModifier = 10, 
    ZOffset = 0, 
    AlwaysOnTop = false, 
    Brightness = 1, 
    LightInfluence = 1, 
    MaxDistance = 1000, 
    PixelsPerStud = 100, 
    SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
};
local v2 = {
    UpdateRange = 100, 
    ZIndex = 0, 
    Image = "rbxassetid://18838056070", 
    Rotation = 0, 
    ImageTransparency = 0, 
    BackgroundTransparency = 1, 
    ImageColor3 = Color3.fromRGB(255, 255, 255), 
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
    ResampleMode = Enum.ResamplerMode.Default, 
    ScaleType = Enum.ScaleType.Stretch, 
    TileSize = UDim2.new(1, 0, 1, 0), 
    Interactable = false, 
    Active = false, 
    ImageSize = Vector3.new(8, 8, 0, 0), 
    PosOffset = Vector3.new(), 
    ExtraOffset = UDim2.new()
};
local function v6(v3, v4) --[[ Line: 62 ]] --[[ Name: SetUpFolders ]]
    if v3.GuiFolder ~= nil then
        return;
    else
        local l_ParallaxWindows_SurfaceGuis_0 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ParallaxWindows_SurfaceGuis");
        if l_ParallaxWindows_SurfaceGuis_0 ~= nil then
            v3.GuiFolder = l_ParallaxWindows_SurfaceGuis_0;
            return;
        elseif not v4 then
            v3.GuiFolder = Instance.new("Folder");
            v3.GuiFolder.Name = "ParallaxWindows_SurfaceGuis";
            if game:GetService("RunService"):IsRunning() then
                v3.GuiFolder.Parent = game.Players.LocalPlayer.PlayerGui;
                return;
            else
                v3.GuiFolder.Parent = game.StarterGui;
                return;
            end;
        else
            return true;
        end;
    end;
end;
v0.new = function() --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy), v6 (copy)
    local v7 = {
        Default_GuiSettings = {}, 
        Default_FrameSettings = {}, 
        GuiSettings = {}, 
        FrameSettings = {}, 
        TargetParts = {}, 
        GuiFolder = nil, 
        LastStep = os.clock(), 
        MaxUpdates = 100
    };
    setmetatable(v7, v0);
    v7.Default_GuiSettings = table.clone(v1);
    v7.Default_FrameSettings = table.clone(v2);
    v6(v7);
    return v7;
end;
v0.UpdateSettings = function(v8, v9, v10) --[[ Line: 102 ]] --[[ Name: UpdateSettings ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v8.Default_GuiSettings == nil then
        v8.Default_GuiSettings = {};
    end;
    if v8.Default_FrameSettings == nil then
        v8.Default_FrameSettings = {};
    end;
    if v9 then
        assert(type(v9) == "table", "Expected table as parameter");
        for v11, v12 in v1 do
            if v9[v11] ~= nil then
                v8.Default_GuiSettings[v11] = v9[v11];
            elseif v8.Default_GuiSettings[v11] == nil then
                v8.Default_GuiSettings[v11] = v12;
            end;
        end;
    end;
    if v10 then
        assert(type(v10) == "table", "Expected table as parameter");
        for v13, v14 in v2 do
            if v10[v13] ~= nil then
                v8.Default_FrameSettings[v13] = v10[v13];
            elseif v8.Default_FrameSettings[v13] == nil then
                v8.Default_FrameSettings[v13] = v14;
            end;
        end;
    end;
end;
v0.UpdateFaceSettings = function(v15, v16, v17, v18) --[[ Line: 136 ]] --[[ Name: UpdateFaceSettings ]]
    local v19 = v15.TargetParts[v16][v17];
    if not v19 then
        return;
    else
        local l_SurfaceGui_0 = v19.SurfaceGui;
        if not l_SurfaceGui_0 then
            return;
        else
            if v15.GuiSettings[l_SurfaceGui_0] == nil then
                v15.GuiSettings[l_SurfaceGui_0] = {};
            end;
            if v18 == nil then
                v15.GuiSettings[l_SurfaceGui_0] = nil;
                return;
            else
                assert(type(v18) == "table", "Expected table as parameter");
                for v21, v22 in v18 do
                    v15.GuiSettings[l_SurfaceGui_0][v21] = v22;
                end;
                return;
            end;
        end;
    end;
end;
v0.UpdateFrameSettings = function(v23, v24, v25) --[[ Line: 157 ]] --[[ Name: UpdateFrameSettings ]]
    if v23.FrameSettings[v24] == nil then
        v23.FrameSettings[v24] = {};
    end;
    if v25 == nil then
        v23.FrameSettings[v24] = nil;
        return;
    else
        assert(type(v25) == "table", "Expected table as parameter");
        for v26, v27 in v25 do
            v23.FrameSettings[v24][v26] = v27;
        end;
        return;
    end;
end;
local function v32(v28, v29) --[[ Line: 176 ]] --[[ Name: GetNormalOffset ]]
    local v30 = Vector3.new();
    local v31 = CFrame.new();
    if v28 == Enum.NormalId.Front then
        return v29.Size.Z / 2 * v29.CFrame.LookVector, (CFrame.Angles(0, 0, 0));
    elseif v28 == Enum.NormalId.Back then
        return v29.Size.Z / 2 * -v29.CFrame.LookVector, (CFrame.Angles(0, 3.141592653589793, 0));
    elseif v28 == Enum.NormalId.Left then
        return v29.Size.X / 2 * -v29.CFrame.RightVector, (CFrame.Angles(0, 1.5707963267948966, 0));
    elseif v28 == Enum.NormalId.Right then
        return v29.Size.X / 2 * v29.CFrame.RightVector, (CFrame.Angles(0, -1.5707963267948966, 0));
    elseif v28 == Enum.NormalId.Top then
        return v29.Size.Y / 2 * v29.CFrame.UpVector, (CFrame.Angles(1.5707963267948966, 0, 0));
    else
        if v28 == Enum.NormalId.Bottom then
            v30 = v29.Size.Y / 2 * -v29.CFrame.UpVector;
            v31 = CFrame.Angles(-1.5707963267948966, 0, 0);
        end;
        return v30, v31;
    end;
end;
rayToPlaneIntersection = function(v33, v34, v35, v36) --[[ Line: 204 ]] --[[ Name: rayToPlaneIntersection ]]
    return v34 - v33 * ((v34 - v36):Dot(v35) / v33:Dot(v35));
end;
calcParallax = function(v37, v38, v39) --[[ Line: 213 ]] --[[ Name: calcParallax ]]
    local l_Position_0 = v38.Position;
    if math.abs(v39.X) < 0.05 then
        return {
            horOffset = -v39.Z, 
            verOffset = -v39.Y, 
            parimgPoint = Vector3.new(), 
            imgPoint = Vector3.new(), 
            camPos = v37
        };
    else
        local v41 = l_Position_0 + v38.LookVector * v39.X + v38.UpVector * v39.Y + v38.RightVector * v39.Z;
        local l_LookVector_0 = CFrame.lookAt(v37, v41).LookVector;
        local v43 = rayToPlaneIntersection(l_LookVector_0, v37, v38.LookVector, l_Position_0);
        local v44 = rayToPlaneIntersection(l_LookVector_0, v37, v38.LookVector, v41);
        local l_Magnitude_0 = (v43 - l_Position_0).Magnitude;
        local v46 = rayToPlaneIntersection(v38.UpVector * -l_Magnitude_0, v43, v38.UpVector, l_Position_0);
        local l_Magnitude_1 = (l_Position_0 - v46).Magnitude;
        if v38.RightVector:Dot(CFrame.lookAt(l_Position_0, v46).LookVector) > 0 then
            l_Magnitude_1 = l_Magnitude_1 * -1;
        end;
        local v48 = rayToPlaneIntersection(v38.RightVector * -l_Magnitude_0, v43, v38.RightVector, l_Position_0);
        local l_Magnitude_2 = (l_Position_0 - v48).Magnitude;
        if v38.UpVector:Dot(CFrame.lookAt(l_Position_0, v48).LookVector) > 0 then
            l_Magnitude_2 = l_Magnitude_2 * -1;
        end;
        return {
            horOffset = l_Magnitude_1, 
            verOffset = l_Magnitude_2, 
            parimgPoint = v44, 
            imgPoint = v43, 
            camPos = v37
        };
    end;
end;
getSizeAndPosition = function(v50, v51, v52, v53) --[[ Line: 259 ]] --[[ Name: getSizeAndPosition ]]
    local l_PixelsPerStud_0 = v53.PixelsPerStud;
    local l_Magnitude_3 = (v50.camPos - v50.imgPoint).Magnitude;
    local l_Magnitude_4 = (v50.camPos - v50.parimgPoint).Magnitude;
    local l_ImageSize_0 = v52.ImageSize;
    local v58 = Vector2.new(l_ImageSize_0.X * l_PixelsPerStud_0, l_ImageSize_0.Y * l_PixelsPerStud_0);
    local v59 = l_Magnitude_3 / l_Magnitude_4;
    local _ = nil;
    return if v51.SurfaceNormal == Enum.NormalId.Top then UDim2.new(0.5, v50.verOffset * l_PixelsPerStud_0, 0.5, -v50.horOffset * l_PixelsPerStud_0) else if v51.SurfaceNormal == Enum.NormalId.Bottom then UDim2.new(0.5, -v50.verOffset * l_PixelsPerStud_0, 0.5, v50.horOffset * l_PixelsPerStud_0) else UDim2.new(0.5, v50.horOffset * l_PixelsPerStud_0, 0.5, v50.verOffset * l_PixelsPerStud_0), (UDim2.new(0, v58.X * v59, 0, v58.Y * v59));
end;
getParallax = function(v61, v62, v63, v64, v65) --[[ Line: 282 ]] --[[ Name: getParallax ]]
    -- upvalues: v32 (copy)
    if not v65 or not v61 then
        return;
    else
        if not v63 then
            v63 = game.Workspace.CurrentCamera.CFrame.Position;
        end;
        local l_TargetPart_0 = v61.TargetPart;
        local _ = v61.SurfaceNormal;
        if not v64 then
            local v68, v69 = v32(v61.SurfaceNormal, l_TargetPart_0);
            v64 = l_TargetPart_0.CFrame * CFrame.new(v68) * v69;
        end;
        local v70 = calcParallax(v63, v64, v65);
        local v71, v72 = getSizeAndPosition(v70, v61, v62, v61.SurfaceGui);
        return v71, v72;
    end;
end;
SetUpSurface = function(v73, v74, v75) --[[ Line: 305 ]] --[[ Name: SetUpSurface ]]
    local l_SurfaceGui_1 = Instance.new("SurfaceGui");
    l_SurfaceGui_1.ResetOnSpawn = false;
    l_SurfaceGui_1.ClipsDescendants = true;
    l_SurfaceGui_1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_SurfaceGui_1.Parent = v75.GuiFolder;
    l_SurfaceGui_1.Adornee = v73;
    l_SurfaceGui_1.Face = v74;
    l_SurfaceGui_1.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud;
    l_SurfaceGui_1.PixelsPerStud = 100;
    l_SurfaceGui_1.Enabled = true;
    local l_CanvasGroup_0 = Instance.new("CanvasGroup");
    l_CanvasGroup_0.BackgroundTransparency = 1;
    l_CanvasGroup_0.Size = UDim2.new(1, 0, 1, 0);
    l_CanvasGroup_0.Parent = l_SurfaceGui_1;
    return l_SurfaceGui_1;
end;
SetUpFrame = function(v78) --[[ Line: 325 ]] --[[ Name: SetUpFrame ]]
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Name = "ScaleFrame";
    l_ImageLabel_0.Parent = v78:FindFirstChildWhichIsA("CanvasGroup") or v78;
    return l_ImageLabel_0;
end;
v0.AddFace = function(v80, v81, v82) --[[ Line: 340 ]] --[[ Name: AddFace ]]
    if v82 == nil then
        v82 = Enum.NormalId.Front;
    end;
    if v80.TargetParts[v81] == nil then
        v80.TargetParts[v81] = {};
    end;
    local v83 = SetUpSurface(v81, v82, v80);
    v80.GuiSettings[v83] = table.clone(v80.Default_GuiSettings);
    local v84 = {
        SurfaceNormal = v82, 
        SurfaceGui = v83, 
        TargetPart = v81, 
        Frames = {}, 
        LastUpdate = 0, 
        Visible = false, 
        Framerate = 1
    };
    if v80.TargetParts[v81][v82] == nil then
        v80.TargetParts[v81][v82] = {};
    end;
    v80.TargetParts[v81][v82] = v84;
    return v83;
end;
v0.AddFrame = function(v85, v86, v87, v88) --[[ Line: 367 ]] --[[ Name: AddFrame ]]
    if v87 == nil then
        v87 = Enum.NormalId.Front;
    end;
    if v85.TargetParts[v86] == nil then
        v85.TargetParts[v86] = {};
    end;
    local v89 = v85.TargetParts[v86][v87];
    if not v89 then
        v85:AddFace(v86, v87);
        v89 = v85.TargetParts[v86][v87];
    end;
    local l_SurfaceGui_2 = v89.SurfaceGui;
    local v91 = SetUpFrame(l_SurfaceGui_2, v87, v85);
    v85.FrameSettings[v91] = table.clone(v85.Default_FrameSettings);
    if v88 then
        for _, v93 in v88 do
            v93.Parent = v91;
        end;
    end;
    local v94 = {
        SurfaceNormal = v87, 
        SurfaceGui = l_SurfaceGui_2, 
        TargetPart = v86, 
        Frame = v91
    };
    table.insert(v85.TargetParts[v86][v87].Frames, v94);
    return v91;
end;
v0.RemoveFace = function(v95, v96, v97) --[[ Line: 402 ]] --[[ Name: RemoveFace ]]
    if v97 == nil then
        v97 = Enum.NormalId.Front;
    end;
    if v95.TargetParts[v96] == nil then
        return;
    else
        local v98 = v95.TargetParts[v96][v97];
        if v98 == nil then
            return;
        else
            v95.GuiSettings[v98.SurfaceGui] = nil;
            v98.SurfaceGui:Destroy();
            v95.TargetParts[v96][v97] = nil;
            if next(v95.TargetParts[v96]) == nil then
                v95.TargetParts[v96] = nil;
            end;
            return;
        end;
    end;
end;
v0.Clear = function(v99) --[[ Line: 418 ]] --[[ Name: Clear ]]
    for _, v101 in v99.TargetParts do
        for _, v103 in v101 do
            v103.SurfaceGui:Destroy();
        end;
    end;
    table.clear(v99.GuiSettings);
    table.clear(v99.FrameSettings);
    table.clear(v99.TargetParts);
end;
GetVectorFromNormal = function(v104, v105) --[[ Line: 433 ]] --[[ Name: GetVectorFromNormal ]]
    if v105 == Enum.NormalId.Front then
        return v104.LookVector;
    elseif v105 == Enum.NormalId.Right then
        return v104.RightVector;
    elseif v105 == Enum.NormalId.Top then
        return v104.UpVector;
    elseif v105 == Enum.NormalId.Back then
        return -v104.LookVector;
    elseif v105 == Enum.NormalId.Left then
        return -v104.RightVector;
    elseif v105 == Enum.NormalId.Bottom then
        return -v104.UpVector;
    else
        return;
    end;
end;
GetCorners = function(v106, v107, v108) --[[ Line: 449 ]] --[[ Name: GetCorners ]]
    local l_Size_0 = v106.Size;
    local l_CFrame_0 = v106.CFrame;
    local l_UpVector_0 = l_CFrame_0.UpVector;
    local l_RightVector_0 = l_CFrame_0.RightVector;
    local l_LookVector_1 = l_CFrame_0.LookVector;
    if v108 == Enum.NormalId.Front or v108 == Enum.NormalId.Back then
        return {
            v107, 
            v107 - l_UpVector_0 * l_Size_0.Y / 2 - l_RightVector_0 * l_Size_0.X / 2, 
            v107 - l_UpVector_0 * l_Size_0.Y / 2 + l_RightVector_0 * l_Size_0.X / 2, 
            v107 + l_UpVector_0 * l_Size_0.Y / 2 - l_RightVector_0 * l_Size_0.X / 2, 
            v107 + l_UpVector_0 * l_Size_0.Y / 2 + l_RightVector_0 * l_Size_0.X / 2
        };
    elseif v108 == Enum.NormalId.Right or v108 == Enum.NormalId.Left then
        return {
            v107, 
            v107 - l_UpVector_0 * l_Size_0.Y / 2 - l_LookVector_1 * l_Size_0.Z / 2, 
            v107 - l_UpVector_0 * l_Size_0.Y / 2 + l_LookVector_1 * l_Size_0.Z / 2, 
            v107 + l_UpVector_0 * l_Size_0.Y / 2 - l_LookVector_1 * l_Size_0.Z / 2, 
            v107 + l_UpVector_0 * l_Size_0.Y / 2 + l_LookVector_1 * l_Size_0.Z / 2
        };
    elseif v108 == Enum.NormalId.Top or v108 == Enum.NormalId.Bottom then
        return {
            v107, 
            v107 - l_RightVector_0 * l_Size_0.X / 2 - l_LookVector_1 * l_Size_0.Z / 2, 
            v107 - l_RightVector_0 * l_Size_0.X / 2 + l_LookVector_1 * l_Size_0.Z / 2, 
            v107 + l_RightVector_0 * l_Size_0.X / 2 - l_LookVector_1 * l_Size_0.Z / 2, 
            v107 + l_RightVector_0 * l_Size_0.X / 2 + l_LookVector_1 * l_Size_0.Z / 2
        };
    else
        return;
    end;
end;
CanSee = function(v114, v115, v116, v117) --[[ Line: 480 ]] --[[ Name: CanSee ]]
    if GetVectorFromNormal(v115.CFrame, v117):Dot(CFrame.lookAt(v116.Position, v114.CFrame.Position).LookVector) <= 0 then
        return false;
    else
        for _, v119 in (GetCorners(v115, v116.Position, v117)) do
            local _, v121 = v114:WorldToScreenPoint(v119);
            if v121 then
                return true;
            end;
        end;
        return false;
    end;
end;
v0.Step = function(v122) --[[ Line: 503 ]] --[[ Name: Step ]]
    -- upvalues: v6 (copy), v32 (copy)
    v6(v122);
    local v123 = os.clock() - v122.LastStep;
    v122.LastStep = os.clock();
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local l_Position_1 = l_CurrentCamera_0.CFrame.Position;
    local l_Default_GuiSettings_0 = v122.Default_GuiSettings;
    local l_Default_FrameSettings_0 = v122.Default_FrameSettings;
    for v128, _ in v122.FrameSettings do
        if not v128:IsDescendantOf(v122.GuiFolder) then
            v122.FrameSettings[v128] = nil;
        end;
    end;
    local l_MaxUpdates_0 = v122.MaxUpdates;
    local v131 = 0;
    local v132 = {};
    for v133, v134 in v122.TargetParts do
        if not v133:IsDescendantOf(game) then
            for _, v136 in v134 do
                v122.GuiSettings[v136.SurfaceGui] = nil;
                v136.SurfaceGui:Destroy();
            end;
            v122.TargetParts[v133] = nil;
        end;
        for _, v138 in v134 do
            local l_SurfaceGui_3 = v138.SurfaceGui;
            if l_SurfaceGui_3 then
                local v140, v141 = v32(v138.SurfaceNormal, v133);
                local v142 = (v133.CFrame + v140) * v141;
                local l_SurfaceNormal_1 = v138.SurfaceNormal;
                local v144 = CanSee(l_CurrentCamera_0, v133, v142, l_SurfaceNormal_1) or false;
                v138.Visible = v144;
                if v144 then
                    local v145 = {};
                    if v122.GuiSettings[l_SurfaceGui_3] ~= nil then
                        for v146, v147 in l_Default_GuiSettings_0 do
                            v145[v146] = v122.GuiSettings[l_SurfaceGui_3][v146] or v147;
                        end;
                    end;
                    local l_v145_0 = v145;
                    if next(v145) ~= nil then
                        l_v145_0 = v145;
                    end;
                    local l_Magnitude_5 = (v142.Position - l_Position_1).Magnitude;
                    if (l_v145_0.MinUpdateDistance >= l_Magnitude_5 or l_v145_0.MinFramerate > 0) and l_v145_0.MaxDistance >= l_Magnitude_5 then
                        local v150 = l_v145_0.MinFramerate + (l_v145_0.MaxFramerate - l_v145_0.MinFramerate) * math.clamp(1 - (l_Magnitude_5 - l_v145_0.MaxUpdateDistance) / l_v145_0.MinUpdateDistance, 0, 1);
                        if not v138.Visible then
                            v150 = v150 / l_v145_0.LazyCheckingModifier;
                        end;
                        local v151 = 1 / v150;
                        if l_v145_0.MaxFramerate < 0 then
                            v151 = -1;
                        end;
                        v138.LastUpdate = v138.LastUpdate + v123;
                        table.insert(v132, {
                            v133, 
                            v138, 
                            l_v145_0, 
                            {
                                v140, 
                                v141, 
                                v142, 
                                l_SurfaceNormal_1, 
                                l_Magnitude_5
                            }, 
                            v151
                        });
                    end;
                end;
            end;
        end;
    end;
    table.sort(v132, function(v152, v153) --[[ Line: 593 ]]
        return v152[2].LastUpdate / v152[5] > v153[2].LastUpdate / v153[5];
    end);
    for _, v155 in v132 do
        local _ = v155[1];
        local v157 = v155[2];
        local v158 = v155[3];
        if l_MaxUpdates_0 > v131 or l_MaxUpdates_0 < 0 then
            local l_SurfaceGui_4 = v157.SurfaceGui;
            local _ = v155[4][1];
            local _ = v155[4][2];
            local v162 = v155[4][3];
            local _ = v155[4][4];
            local v164 = v155[4][5];
            v157.LastUpdate = 0;
            l_SurfaceGui_4.ZOffset = v158.ZOffset;
            l_SurfaceGui_4.AlwaysOnTop = v158.AlwaysOnTop;
            l_SurfaceGui_4.Brightness = v158.Brightness;
            l_SurfaceGui_4.LightInfluence = v158.LightInfluence;
            l_SurfaceGui_4.MaxDistance = v158.MaxDistance;
            l_SurfaceGui_4.PixelsPerStud = v158.PixelsPerStud;
            l_SurfaceGui_4.SizingMode = v158.SizingMode;
            if v158.MinUpdateDistance < v164 and v158.MinFramerate <= 0 or v158.MaxDistance < v164 then
                print("Die");
            else
                v131 = v131 + 1;
                for v165, v166 in v157.Frames do
                    local l_Frame_0 = v166.Frame;
                    if not l_Frame_0 or not l_Frame_0:IsDescendantOf(v122.GuiFolder) then
                        table.remove(v157.Frames, v165);
                    else
                        local v168 = {};
                        if v122.FrameSettings[l_Frame_0] ~= nil then
                            for v169, v170 in l_Default_FrameSettings_0 do
                                v168[v169] = v122.FrameSettings[l_Frame_0][v169] or v170;
                            end;
                        end;
                        local l_v168_0 = v168;
                        if next(v168) ~= nil then
                            l_v168_0 = v168;
                        end;
                        if l_v168_0.UpdateRange >= v164 then
                            l_Frame_0.ZIndex = l_v168_0.ZIndex;
                            l_Frame_0.Image = l_v168_0.Image;
                            l_Frame_0.Rotation = l_v168_0.Rotation;
                            l_Frame_0.ImageTransparency = l_v168_0.ImageTransparency;
                            l_Frame_0.BackgroundTransparency = l_v168_0.BackgroundTransparency;
                            l_Frame_0.ImageColor3 = l_v168_0.ImageColor3;
                            l_Frame_0.BackgroundColor3 = l_v168_0.BackgroundColor3;
                            l_Frame_0.ResampleMode = l_v168_0.ResampleMode;
                            l_Frame_0.ScaleType = l_v168_0.ScaleType;
                            l_Frame_0.TileSize = l_v168_0.TileSize;
                            l_Frame_0.Interactable = l_v168_0.Interactable;
                            l_Frame_0.Active = l_v168_0.Active;
                            local v172, v173 = getParallax(v157, l_v168_0, l_Position_1, v162, l_v168_0.PosOffset);
                            l_Frame_0.Position = v172 + l_v168_0.ExtraOffset or UDim2.new(0.5, 0, 0.5, 0) + l_v168_0.ExtraOffset;
                            l_Frame_0.Size = v173 or UDim2.new(1, 0, 1, 0);
                        end;
                    end;
                end;
            end;
        else
            break;
        end;
    end;
end;
v0.ComputeStep = function(v174) --[[ Line: 705 ]] --[[ Name: ComputeStep ]]
    -- upvalues: v6 (copy), v32 (copy)
    if v6(v174, true) then
        return;
    else
        local v175 = {};
        local v176 = os.clock() - v174.LastStep;
        v174.LastStep = os.clock();
        local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
        local l_Position_2 = l_CurrentCamera_1.CFrame.Position;
        local l_Default_GuiSettings_1 = v174.Default_GuiSettings;
        local l_Default_FrameSettings_1 = v174.Default_FrameSettings;
        for v181, _ in v174.FrameSettings do
            if not v181:IsDescendantOf(v174.GuiFolder) then
                v174.FrameSettings[v181] = nil;
            end;
        end;
        local l_MaxUpdates_1 = v174.MaxUpdates;
        local v184 = 0;
        local v185 = {};
        for v186, v187 in v174.TargetParts do
            if not v186:IsDescendantOf(game) then
                for _, v189 in v187 do
                    v174.GuiSettings[v189.SurfaceGui] = nil;
                    v189.SurfaceGui:Destroy();
                end;
                v174.TargetParts[v186] = nil;
            end;
            for _, v191 in v187 do
                local l_SurfaceGui_5 = v191.SurfaceGui;
                if l_SurfaceGui_5 then
                    local v193, v194 = v32(v191.SurfaceNormal, v186);
                    local v195 = (v186.CFrame + v193) * v194;
                    local l_SurfaceNormal_2 = v191.SurfaceNormal;
                    local v197 = CanSee(l_CurrentCamera_1, v186, v195, l_SurfaceNormal_2) or false;
                    v191.Visible = v197;
                    if v197 then
                        local v198 = {};
                        if v174.GuiSettings[l_SurfaceGui_5] ~= nil then
                            for v199, v200 in l_Default_GuiSettings_1 do
                                v198[v199] = v174.GuiSettings[l_SurfaceGui_5][v199] or v200;
                            end;
                        end;
                        local l_v198_0 = v198;
                        if next(v198) ~= nil then
                            l_v198_0 = v198;
                        end;
                        local l_Magnitude_6 = (v195.Position - l_Position_2).Magnitude;
                        if (l_v198_0.MinUpdateDistance >= l_Magnitude_6 or l_v198_0.MinFramerate > 0) and l_v198_0.MaxDistance >= l_Magnitude_6 then
                            local v203 = l_v198_0.MinFramerate + (l_v198_0.MaxFramerate - l_v198_0.MinFramerate) * math.clamp(1 - (l_Magnitude_6 - l_v198_0.MaxUpdateDistance) / l_v198_0.MinUpdateDistance, 0, 1);
                            if not v191.Visible then
                                v203 = v203 / l_v198_0.LazyCheckingModifier;
                            end;
                            local v204 = 1 / v203;
                            if l_v198_0.MaxFramerate < 0 then
                                v204 = -1;
                            end;
                            v191.LastUpdate = v191.LastUpdate + v176;
                            table.insert(v185, {
                                v186, 
                                v191, 
                                l_v198_0, 
                                {
                                    v193, 
                                    v194, 
                                    v195, 
                                    l_SurfaceNormal_2, 
                                    l_Magnitude_6
                                }, 
                                v204
                            });
                        end;
                    end;
                end;
            end;
        end;
        table.sort(v185, function(v205, v206) --[[ Line: 798 ]]
            return v205[2].LastUpdate / v205[5] > v206[2].LastUpdate / v206[5];
        end);
        for _, v208 in v185 do
            local _ = v208[1];
            local v210 = v208[2];
            local v211 = v208[3];
            if l_MaxUpdates_1 > v184 or l_MaxUpdates_1 < 0 then
                local l_SurfaceGui_6 = v210.SurfaceGui;
                local _ = v208[4][1];
                local _ = v208[4][2];
                local v215 = v208[4][3];
                local _ = v208[4][4];
                local v217 = v208[4][5];
                table.insert(v175, {
                    istype = "surface", 
                    surfaceGui = l_SurfaceGui_6, 
                    GuiSettings = v211
                });
                v210.LastUpdate = 0;
                if (v211.MinUpdateDistance >= v217 or v211.MinFramerate > 0) and v211.MaxDistance >= v217 then
                    v184 = v184 + 1;
                    for v218, v219 in v210.Frames do
                        local l_Frame_1 = v219.Frame;
                        if not l_Frame_1 or not l_Frame_1:IsDescendantOf(v174.GuiFolder) then
                            table.remove(v210.Frames, v218);
                        else
                            local v221 = {};
                            if v174.FrameSettings[l_Frame_1] ~= nil then
                                for v222, v223 in l_Default_FrameSettings_1 do
                                    v221[v222] = v174.FrameSettings[l_Frame_1][v222] or v223;
                                end;
                            end;
                            local l_v221_0 = v221;
                            if next(v221) ~= nil then
                                l_v221_0 = v221;
                            end;
                            if l_v221_0.UpdateRange >= v217 then
                                local v225, v226 = getParallax(v210, l_v221_0, l_Position_2, v215, l_v221_0.PosOffset);
                                table.insert(v175, {
                                    istype = "frame", 
                                    frame = l_Frame_1, 
                                    Position = v225 + l_v221_0.ExtraOffset or UDim2.new(0.5, 0, 0.5, 0) + l_v221_0.ExtraOffset, 
                                    Size = v226 or UDim2.new(1, 0, 1, 0), 
                                    frameSettings = l_v221_0
                                });
                            end;
                        end;
                    end;
                end;
            else
                break;
            end;
        end;
        return v175;
    end;
end;
v0.ApplyStep = function(v227, v228) --[[ Line: 868 ]] --[[ Name: ApplyStep ]]
    -- upvalues: v6 (copy)
    if v228 == nil or #v228 <= 0 then
        return;
    else
        v6(v227);
        local _ = v227.Default_GuiSettings;
        local _ = v227.Default_FrameSettings;
        for _, v232 in v228 do
            if v232.istype == "frame" then
                local l_frame_0 = v232.frame;
                if l_frame_0 and l_frame_0:IsDescendantOf(v227.GuiFolder) then
                    local l_frameSettings_0 = v232.frameSettings;
                    l_frame_0.ZIndex = l_frameSettings_0.ZIndex;
                    l_frame_0.Image = l_frameSettings_0.Image;
                    l_frame_0.Rotation = l_frameSettings_0.Rotation;
                    l_frame_0.ImageTransparency = l_frameSettings_0.ImageTransparency;
                    l_frame_0.BackgroundTransparency = l_frameSettings_0.BackgroundTransparency;
                    l_frame_0.ImageColor3 = l_frameSettings_0.ImageColor3;
                    l_frame_0.BackgroundColor3 = l_frameSettings_0.BackgroundColor3;
                    l_frame_0.ResampleMode = l_frameSettings_0.ResampleMode;
                    l_frame_0.ScaleType = l_frameSettings_0.ScaleType;
                    l_frame_0.TileSize = l_frameSettings_0.TileSize;
                    l_frame_0.Interactable = l_frameSettings_0.Interactable;
                    l_frame_0.Active = false;
                    l_frame_0.Position = v232.Position;
                    l_frame_0.Size = v232.Size;
                end;
            elseif v232.istype == "surface" then
                local l_surfaceGui_0 = v232.surfaceGui;
                local l_GuiSettings_0 = v232.GuiSettings;
                l_surfaceGui_0.ZOffset = l_GuiSettings_0.ZOffset;
                l_surfaceGui_0.AlwaysOnTop = l_GuiSettings_0.AlwaysOnTop;
                l_surfaceGui_0.Brightness = l_GuiSettings_0.Brightness;
                l_surfaceGui_0.LightInfluence = l_GuiSettings_0.LightInfluence;
                l_surfaceGui_0.MaxDistance = l_GuiSettings_0.MaxDistance;
                l_surfaceGui_0.PixelsPerStud = l_GuiSettings_0.PixelsPerStud;
                l_surfaceGui_0.SizingMode = l_GuiSettings_0.SizingMode;
            end;
        end;
        return;
    end;
end;
return v0;