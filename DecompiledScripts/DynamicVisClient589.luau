--!native
local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = require(script.TriangleFill);
local v2 = require(script.ConvexHull);
local v3 = {
    planes = {}, 
    colors = {}, 
    debugTris = {}, 
    depthBuffer = {}, 
    debugDepthBuffer = {}, 
    debugPixels = {}, 
    xCount = 0, 
    yCount = 0, 
    dynamicVisRecords = {}, 
    occluderRecords = {}, 
    stats = {}, 
    debugGui = nil, 
    occlusionTime = {}, 
    occlusionTimeAvg = 0, 
    checkDynamicVisTime = {}, 
    checkDynamicVisTimeAvg = 0, 
    allowDebug = script.Parent:GetAttribute("allowDebugInLive") or game.ReplicatedFirst:FindFirstChild("allowDebugInLive") ~= nil
};
if game["Run Service"]:IsStudio() == true then
    v3.allowDebug = true;
end;
v3.debugging = false;
v3.drawDebugText = script.parent:GetAttribute("enableDebugOnStart") and v3.allowDebug;
v3.override = false;
v3.debugging = false;
v3.debugTextPos = 0;
local v4 = 0;
local v5 = {
    Vector3.new(-0.5, -0.5, -0.5, 0), 
    Vector3.new(0.5, -0.5, -0.5, 0), 
    Vector3.new(-0.5, 0.5, -0.5, 0), 
    Vector3.new(0.5, 0.5, -0.5, 0), 
    Vector3.new(-0.5, -0.5, 0.5, 0), 
    Vector3.new(0.5, -0.5, 0.5, 0), 
    Vector3.new(-0.5, 0.5, 0.5, 0), 
    (Vector3.new(0.5, 0.5, 0.5, 0))
};
local function _(v6, v7, v8) --[[ Line: 56 ]] --[[ Name: PlaneFromPoints ]]
    local l_Unit_0 = (v7 - v6):Cross(v8 - v6).Unit;
    return {
        n = l_Unit_0, 
        d = -v6:Dot(l_Unit_0)
    };
end;
v3.InitColors = function(v11) --[[ Line: 70 ]] --[[ Name: InitColors ]]
    if v11.colorsInited ~= true then
        v11.colorsInited = true;
        v11.colors = {};
        for _ = 1, 1000 do
            table.insert(v11.colors, Color3.fromHSV(math.random(), 0.5, 0.5));
        end;
        v11.dynamicVisRecords.__mode = "k";
        v11.occluderRecords.__mode = "k";
    end;
end;
v3.Update = function(v13) --[[ Line: 84 ]] --[[ Name: Update ]]
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_0.ViewportSize.X < 2 or l_CurrentCamera_0.ViewportSize.Y < 2 then
        return;
    else
        v13:PreDrawDebug();
        v13:BuildFrustumPlanes(l_CurrentCamera_0);
        v13:DrawDebug();
        return;
    end;
end;
v3.PreDrawDebug = function(v15) --[[ Line: 99 ]] --[[ Name: PreDrawDebug ]]
    debug.profilebegin("PreDrawDebug");
    if v15.debugGui == nil then
        v15.debugGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("DebugPixels", true);
        v15.debugBox = game.Players.LocalPlayer.PlayerGui:FindFirstChild("DebugPixelBox", true);
    end;
    for _, v17 in v15.debugTris do
        v17:Destroy();
    end;
    v15.debugTris = {};
    for _, v19 in v15.debugPixels do
        v19:Destroy();
    end;
    v15.debugPixels = {};
    debug.profileend();
end;
v3.DrawDebug = function(v20) --[[ Line: 119 ]] --[[ Name: DrawDebug ]]
    if v20.debugging == true then
        debug.profilebegin("DrawDebug");
        v20:DrawOccludedBoundingBox();
        local l_xCount_0 = v20.xCount;
        for v22, v23 in v20.depthBuffer do
            local v24 = math.floor(v22 / l_xCount_0);
            v20:RenderDebugPixel(v22 - v24 * l_xCount_0, v24, v23);
        end;
        debug.profileend();
    end;
    if v20.drawDebugText then
        v20:PrintStats();
    end;
end;
v3.BuildFrustumPlanes = function(v25, v26) --[[ Line: 152 ]] --[[ Name: BuildFrustumPlanes ]]
    debug.profilebegin("BuildFrustums");
    local l_X_0 = v26.ViewportSize.X;
    local l_Y_0 = v26.ViewportSize.Y;
    v25.yPixelSize = math.floor(l_Y_0 / 20);
    v25.xCount = math.ceil(l_X_0 / v25.yPixelSize) + 1;
    v25.yCount = 20;
    local v29 = math.ceil(v25.yPixelSize / 2) + 1;
    local v30 = v26:ViewportPointToRay(-v29, -v29, 0);
    local v31 = v26:ViewportPointToRay(l_X_0 + v29 * 2, -v29, 0);
    local v32 = v26:ViewportPointToRay(-v29, l_Y_0 + v29, 0);
    local v33 = v26:ViewportPointToRay(l_X_0 + v29 * 2, l_Y_0 + v29, 0);
    local v34 = v30.Origin + v30.Direction;
    local v35 = v32.Origin + v32.Direction;
    local v36 = v30.Origin + v30.Direction * 20000;
    local v37 = v32.Origin + v32.Direction * 20000;
    local v38 = v31.Origin + v31.Direction;
    local v39 = v33.Origin + v33.Direction;
    local v40 = v31.Origin + v31.Direction * 20000;
    local v41 = v33.Origin + v33.Direction * 20000;
    v25.outerPlanes = {};
    local l_outerPlanes_0 = v25.outerPlanes;
    local l_Unit_1 = (v38 - v34):Cross(v35 - v34).Unit;
    l_outerPlanes_0[1] = {
        n = l_Unit_1, 
        d = -v34:Dot(l_Unit_1)
    };
    l_outerPlanes_0 = v25.outerPlanes;
    l_Unit_1 = (v36 - v34):Cross(v38 - v34).Unit;
    l_outerPlanes_0[2] = {
        n = l_Unit_1, 
        d = -v34:Dot(l_Unit_1)
    };
    l_outerPlanes_0 = v25.outerPlanes;
    l_Unit_1 = (v35 - v34):Cross(v36 - v34).Unit;
    l_outerPlanes_0[3] = {
        n = l_Unit_1, 
        d = -v34:Dot(l_Unit_1)
    };
    l_outerPlanes_0 = v25.outerPlanes;
    l_Unit_1 = (v39 - v35):Cross(v37 - v35).Unit;
    l_outerPlanes_0[4] = {
        n = l_Unit_1, 
        d = -v35:Dot(l_Unit_1)
    };
    l_outerPlanes_0 = v25.outerPlanes;
    l_Unit_1 = (v40 - v38):Cross(v41 - v38).Unit;
    l_outerPlanes_0[5] = {
        n = l_Unit_1, 
        d = -v38:Dot(l_Unit_1)
    };
    l_outerPlanes_0 = v26:ViewportPointToRay(0, 0, 0);
    local v44 = v26:ViewportPointToRay(l_X_0, 0, 0);
    local v45 = v26:ViewportPointToRay(0, l_Y_0, 0);
    local v46 = v26:ViewportPointToRay(l_X_0, l_Y_0, 0);
    l_Unit_1 = l_outerPlanes_0.Origin + l_outerPlanes_0.Direction;
    local v47 = v45.Origin + v45.Direction;
    local v48 = l_outerPlanes_0.Origin + l_outerPlanes_0.Direction * 20000;
    local v49 = v45.Origin + v45.Direction * 20000;
    local v50 = v44.Origin + v44.Direction;
    local v51 = v46.Origin + v46.Direction;
    local v52 = v44.Origin + v44.Direction * 20000;
    local v53 = v46.Origin + v46.Direction * 20000;
    v25.innerPlanes = {};
    local l_innerPlanes_0 = v25.innerPlanes;
    local l_Unit_2 = (v50 - l_Unit_1):Cross(v47 - l_Unit_1).Unit;
    l_innerPlanes_0[1] = {
        n = l_Unit_2, 
        d = -l_Unit_1:Dot(l_Unit_2)
    };
    l_innerPlanes_0 = v25.innerPlanes;
    l_Unit_2 = (v48 - l_Unit_1):Cross(v50 - l_Unit_1).Unit;
    l_innerPlanes_0[2] = {
        n = l_Unit_2, 
        d = -l_Unit_1:Dot(l_Unit_2)
    };
    l_innerPlanes_0 = v25.innerPlanes;
    l_Unit_2 = (v47 - l_Unit_1):Cross(v48 - l_Unit_1).Unit;
    l_innerPlanes_0[3] = {
        n = l_Unit_2, 
        d = -l_Unit_1:Dot(l_Unit_2)
    };
    l_innerPlanes_0 = v25.innerPlanes;
    l_Unit_2 = (v51 - v47):Cross(v49 - v47).Unit;
    l_innerPlanes_0[4] = {
        n = l_Unit_2, 
        d = -v47:Dot(l_Unit_2)
    };
    l_innerPlanes_0 = v25.innerPlanes;
    l_Unit_2 = (v52 - v50):Cross(v53 - v50).Unit;
    l_innerPlanes_0[5] = {
        n = l_Unit_2, 
        d = -v50:Dot(l_Unit_2)
    };
    debug.profileend();
end;
v3.RenderDebugPixel = function(v56, v57, v58, v59) --[[ Line: 230 ]] --[[ Name: RenderDebugPixel ]]
    if v56.debugGui == nil then
        return;
    else
        local v60 = v56.debugBox:Clone();
        v60.Position = UDim2.new(0, v57 * v56.yPixelSize, 0, v58 * v56.yPixelSize);
        v60.Parent = v56.debugGui;
        local v61 = 1 - math.clamp(v59 / 500, 0, 1);
        v60.BackgroundColor3 = Color3.new(v61, v61, v61);
        v60.Visible = true;
        table.insert(v56.debugPixels, v60);
        return;
    end;
end;
v3.RenderDebugPixelRed = function(v62, v63, v64, v65) --[[ Line: 245 ]] --[[ Name: RenderDebugPixelRed ]]
    if v62.debugGui == nil then
        return;
    else
        local v66 = v62.debugBox:Clone();
        v66.Position = UDim2.new(0, v63 * v62.yPixelSize, 0, v64 * v62.yPixelSize);
        v66.Parent = v62.debugGui;
        local _ = 1 - math.clamp(v65 / 500, 0, 1);
        v66.BackgroundColor3 = Color3.new(1, 0, 0);
        v66.Visible = true;
        table.insert(v62.debugPixels, v66);
        return;
    end;
end;
local function v73(v68, v69, v70) --[[ Line: 259 ]] --[[ Name: PlotPixelForOccluder ]]
    -- upvalues: v3 (copy)
    local v71 = v68 + v69 * v3.xCount;
    local v72 = v3.depthBuffer[v71];
    if v72 ~= nil and v72 < v70 then
        return false;
    else
        v3.depthBuffer[v71] = v70;
        return false;
    end;
end;
local function v79(v74, v75, v76) --[[ Line: 271 ]] --[[ Name: TestPixel ]]
    -- upvalues: v4 (ref), v3 (copy)
    v4 = v4 + 1;
    local v77 = v74 + v75 * v3.xCount;
    local v78 = v3.depthBuffer[v77];
    if v78 == nil or v76 <= v78 then
        return true;
    else
        return false;
    end;
end;
local function v85(v80, v81, v82) --[[ Line: 285 ]] --[[ Name: TestPixelDebug ]]
    -- upvalues: v4 (ref), v3 (copy)
    v4 = v4 + 1;
    local v83 = v80 + v81 * v3.xCount;
    local v84 = v3.depthBuffer[v83];
    if v84 == nil or v82 <= v84 then
        v3.debugDepthBuffer[v83] = v82;
        return true;
    else
        return false;
    end;
end;
local function _(v86, v87, v88, v89) --[[ Line: 299 ]] --[[ Name: CompareCFrames ]]
    if v88:FuzzyEq(v89, 0.01) == false then
        return false;
    elseif v86.Position:FuzzyEq(v87.Position, 0.01) == false then
        return false;
    elseif v86.UpVector:FuzzyEq(v87.UpVector, 0.01) == false then
        return false;
    else
        return true;
    end;
end;
local function _(v91, v92, v93) --[[ Line: 318 ]] --[[ Name: IsTriangleClockwise ]]
    return (v92.X - v91.X) * (v93.Y - v91.Y) - (v93.X - v91.X) * (v92.Y - v91.Y) < 0;
end;
v3.RenderOccluders = function(v95, v96) --[[ Line: 323 ]] --[[ Name: RenderOccluders ]]
    -- upvalues: v3 (copy), l_CollectionService_0 (copy), v1 (copy), v73 (copy), v79 (copy), v85 (copy), v4 (ref)
    local v97 = false;
    local v98 = false;
    debug.profilebegin("RenderOcc");
    local v99 = tick();
    v95.depthBuffer = {};
    v95.debugDepthBuffer = {};
    if v95.debugBox then
        v95.debugBox.Size = UDim2.new(0, v95.yPixelSize, 0, v95.yPixelSize);
    end;
    v3.stats.transformedVerts = 0;
    v3.stats.occluderTriangles = 0;
    v3.stats.dynamicVisTriangles = 0;
    v3.stats.visibleDynamicVis = 0;
    v3.stats.totalDynamicVis = 0;
    local l_Position_0 = v96.CFrame.Position;
    for _, v102 in (l_CollectionService_0:GetTagged("Occluder")) do
        local v103 = v95.occluderRecords[v102];
        if v103 == nil then
            v103 = {
                originalParent = v102.Parent, 
                dirty = true
            };
            v95.occluderRecords[v102] = v103;
        end;
        if v102:IsDescendantOf(game.Workspace) ~= false then
            local l_v95_Bounds_0, v105 = v95:GetBounds(v102, v103);
            if v103.lastCFrame ~= nil then
                local l_lastCFrame_0 = v103.lastCFrame;
                v97 = (v103.lastSize:FuzzyEq(v105, 0.01) ~= false and not (l_lastCFrame_0.Position:FuzzyEq(l_v95_Bounds_0.Position, 0.01) == false) and l_lastCFrame_0.UpVector:FuzzyEq(l_v95_Bounds_0.UpVector, 0.01) ~= false) ~= false;
            end;
            if not v97 then
                v103.dirty = true;
                v103.lastCFrame = l_v95_Bounds_0;
                v103.lastSize = v105;
            end;
            v97 = false;
            if v95:PointInsideBounds(l_Position_0, l_v95_Bounds_0, v105) ~= true then
                debug.profilebegin("GenTriangles");
                local v107, v108 = v95:GenerateTrianglesForOccluderClipped(v103, v102, l_Position_0, l_v95_Bounds_0, v105, v96);
                debug.profileend();
                if v95.debugging == true then
                    local v109 = v108[#v108];
                    for v110 = 1, #v108 do
                        local v111 = v108[v110];
                        v3:DebugLineScreenSpace(v109, v111, Color3.new(1, 0, 0), v3.debugGui);
                        v109 = v111;
                    end;
                end;
                debug.profilebegin("FillTriangle");
                for _, v113 in v107 do
                    local v114 = v113[1];
                    local v115 = v113[2];
                    local v116 = v113[3];
                    local v117 = {
                        Vector3.new(v114.x / v95.yPixelSize, v114.y / v95.yPixelSize, v114.z), 
                        Vector3.new(v115.x / v95.yPixelSize, v115.y / v95.yPixelSize, v115.z), 
                        (Vector3.new(v116.x / v95.yPixelSize, v116.y / v95.yPixelSize, v116.z))
                    };
                    local l_stats_0 = v3.stats;
                    l_stats_0.transformedVerts = l_stats_0.transformedVerts + 3;
                    l_stats_0 = v3.stats;
                    l_stats_0.occluderTriangles = l_stats_0.occluderTriangles + 1;
                    debug.profilebegin("Fill");
                    v1:TriangleFillSpecial(v117, v108, v95.yPixelSize, v73);
                    debug.profileend();
                end;
                debug.profileend();
            end;
        end;
    end;
    if v95.drawDebugText then
        table.insert(v95.occlusionTime, tick() - v99);
    end;
    debug.profileend();
    debug.profilebegin("CheckDynamicVis");
    local v119 = tick();
    local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged("DynamicVis");
    local v121 = tick();
    for _, v123 in l_l_CollectionService_0_Tagged_0 do
        local v124 = v95.dynamicVisRecords[v123];
        if v124 == nil then
            v124 = {
                nextAllowedHideTime = v121 + 1, 
                visible = true, 
                originalParent = v123.Parent, 
                dirty = true, 
                desireVisible = true, 
                checkTime = 0
            };
            v95.dynamicVisRecords[v123] = v124;
        end;
        if v124.shadowCaster == nil and v124.checkTime < v121 then
            v124.checkTime = v121 + 1;
            local l_ShadowCaster_0 = v123:FindFirstChild("ShadowCaster");
            if l_ShadowCaster_0 then
                v124.shadowCaster = l_ShadowCaster_0;
                v124.shadowCaster.Parent = nil;
            end;
        end;
        local l_v95_Bounds_1, v127 = v95:GetBounds(v123, v124);
        if v124.lastCFrame ~= nil then
            local l_lastCFrame_1 = v124.lastCFrame;
            v98 = (v124.lastSize:FuzzyEq(v127, 0.01) ~= false and not (l_lastCFrame_1.Position:FuzzyEq(l_v95_Bounds_1.Position, 0.01) == false) and l_lastCFrame_1.UpVector:FuzzyEq(l_v95_Bounds_1.UpVector, 0.01) ~= false) ~= false;
        end;
        if not v98 then
            v124.dirty = true;
            v124.lastCFrame = l_v95_Bounds_1;
            v124.lastSize = v127;
        end;
        v98 = false;
        if v95:IsBoundingBoxVisible(v95.planes, l_v95_Bounds_1, v127) == false then
            print("out");
        elseif v95.override == true then
            v124.desireVisible = true;
        else
            local l_stats_1 = v95.stats;
            l_stats_1.totalDynamicVis = l_stats_1.totalDynamicVis + 1;
            if v124.visible == true then
                l_stats_1 = v3.stats;
                l_stats_1.visibleDynamicVis = l_stats_1.visibleDynamicVis + 1;
            end;
            if v124.visible == true and v121 < v124.nextAllowedHideTime then
                v124.desireVisible = true;
            elseif v95:PointInsideBounds(l_Position_0, l_v95_Bounds_1, v127) == true then
                v124.desireVisible = true;
            else
                l_stats_1 = v79;
                if v3.debugging == true then
                    l_stats_1 = v85;
                end;
                if v124.visible == false and v95:IsPointVisible(l_v95_Bounds_1.Position, v96, l_stats_1) == true then
                    v124.desireVisible = true;
                else
                    local v130, v131 = v95:GenerateTrianglesForTester(v124, v123, l_Position_0, l_v95_Bounds_1, v127);
                    if #v130 ~= 0 then
                        local v132 = false;
                        v4 = 0;
                        local v133 = {};
                        for _, v135 in v130 do
                            local _ = {};
                            local v137 = v135[1];
                            local v138 = v133[v137];
                            if v138 == nil then
                                v138 = v96:WorldToViewportPoint(v135[1]);
                                v138 = Vector3.new(v138.x / v95.yPixelSize, v138.y / v95.yPixelSize, v138.z);
                                v133[v137] = v138;
                            end;
                            local v139 = v135[2];
                            local v140 = v133[v139];
                            if v140 == nil then
                                v140 = v96:WorldToViewportPoint(v135[2]);
                                v140 = Vector3.new(v140.x / v95.yPixelSize, v140.y / v95.yPixelSize, v140.z);
                                v133[v139] = v140;
                            end;
                            local v141 = v135[3];
                            local v142 = v133[v141];
                            if v142 == nil then
                                v142 = v96:WorldToViewportPoint(v135[3]);
                                v142 = Vector3.new(v142.x / v95.yPixelSize, v142.y / v95.yPixelSize, v142.z);
                                v133[v141] = v142;
                            end;
                            local v143 = {
                                v138, 
                                v140, 
                                v142
                            };
                            local l_stats_2 = v3.stats;
                            l_stats_2.transformedVerts = l_stats_2.transformedVerts + 3;
                            l_stats_2 = v3.stats;
                            l_stats_2.dynamicVisTriangles = l_stats_2.dynamicVisTriangles + 1;
                            if v1:TriangleFill(v143, l_stats_1) == true then
                                v132 = true;
                                break;
                            end;
                        end;
                        if v132 == false then
                            if v4 ~= 0 then
                                v124.desireVisible = false;
                            end;
                        elseif v4 == 0 and v131 == false and v95:IsPointVisible(l_v95_Bounds_1.Position, v96, l_stats_1) == false then
                            v124.desireVisible = false;
                        else
                            v124.desireVisible = true;
                            local _ = #v130;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v95:UpdateVisibility();
    if v95.drawDebugText then
        table.insert(v95.checkDynamicVisTime, tick() - v119);
    end;
    debug.profileend();
end;
v3.TestSquareBounds = function(v146, v147, v148, v149, v150, _) --[[ Line: 602 ]] --[[ Name: TestSquareBounds ]]
    v147 = math.floor(v147 / v146.yPixelSize);
    v149 = math.floor(v149 / v146.yPixelSize);
    v148 = math.ceil(v148 / v146.yPixelSize);
    v150 = math.ceil(v150 / v146.yPixelSize);
    for _ = v147, v148 do
        for _ = v149, v150 do

        end;
    end;
end;
v3.DrawOccludedBoundingBox = function(v154) --[[ Line: 616 ]] --[[ Name: DrawOccludedBoundingBox ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v154.debugging == false then
        return;
    else
        local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
        local l_Position_1 = l_CurrentCamera_1.CFrame.Position;
        for v157, v158 in v154.dynamicVisRecords do
            if typeof(v157) ~= "string" and v158.visible ~= true then
                local l_v154_Bounds_0, v160 = v154:GetBounds(v157, v158);
                local v161 = {};
                for _, v163 in (v154:GenerateTrianglesForTester(v158, v157, l_Position_1, l_v154_Bounds_0, v160)) do
                    v163[1] = l_CurrentCamera_1:WorldToViewportPoint(v163[1]);
                    v163[2] = l_CurrentCamera_1:WorldToViewportPoint(v163[2]);
                    v163[3] = l_CurrentCamera_1:WorldToViewportPoint(v163[3]);
                    table.insert(v161, v163[1]);
                    table.insert(v161, v163[2]);
                    table.insert(v161, v163[3]);
                end;
                local v164 = v2:MakeConvexHull(v161);
                local v165 = v157:GetAttribute("boxcolor") or Color3.new(0, 0, 1);
                local v166 = v164[#v164];
                for v167 = 1, #v164 do
                    local v168 = v164[v167];
                    v3:DebugLineScreenSpace(v166, v168, v165, v3.debugGui);
                    v166 = v168;
                end;
                local _ = l_CurrentCamera_1:WorldToViewportPoint(l_v154_Bounds_0.Position);
                local _ = l_CurrentCamera_1:WorldToViewportPoint(l_v154_Bounds_0.Position + Vector3.new(0, 1, 0, 0));
            end;
        end;
        return;
    end;
end;
v3.UpdateVisibility = function(v171) --[[ Line: 665 ]] --[[ Name: UpdateVisibility ]]
    -- upvalues: l_CollectionService_0 (copy)
    debug.profilebegin("UpdateParents");
    for _, v173 in (l_CollectionService_0:GetTagged("DynamicVis")) do
        local v174 = v171.dynamicVisRecords[v173];
        if v174.desireVisible == true then
            if v174.visible == false then
                v173.Parent = v174.originalParent;
                v174.visible = true;
                v174.nextAllowedHideTime = tick() + 1;
                if v174.shadowCaster then
                    v174.shadowCaster.Parent = nil;
                end;
            end;
        elseif v174.visible == true then
            v173.Parent = game.Lighting;
            v174.visible = false;
            if v174.shadowCaster then
                v174.shadowCaster.Parent = v174.originalParent;
            end;
        end;
    end;
    debug.profileend();
end;
v3.Print = function(v175, v176, v177) --[[ Line: 701 ]] --[[ Name: Print ]]
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.AutoLocalize = false;
    l_TextLabel_0.Text = v176;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextSize = 8;
    l_TextLabel_0.TextColor3 = v177 or Color3.new(0.94902, 1, 0);
    l_TextLabel_0.Position = UDim2.new(0, 10, 0, v175.debugTextPos);
    v175.debugTextPos = v175.debugTextPos + 16;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Bottom;
    l_TextLabel_0.Parent = v175.debugGui;
    table.insert(v175.debugTris, l_TextLabel_0);
end;
local function _(v179) --[[ Line: 717 ]] --[[ Name: format ]]
    local v180 = math.floor(v179 * 10000) / 10;
    if v180 < 0.1 then
        return "0.0";
    else
        return (tostring(v180));
    end;
end;
v3.PrintStats = function(v182) --[[ Line: 727 ]] --[[ Name: PrintStats ]]
    v182.occlusionTimeAvg = 0;
    if #v182.occlusionTime > 0 then
        for _, v184 in v182.occlusionTime do
            v182.occlusionTimeAvg = v182.occlusionTimeAvg + v184;
        end;
        v182.occlusionTimeAvg = v182.occlusionTimeAvg / #v182.occlusionTime;
        while #v182.occlusionTime > 60 do
            table.remove(v182.occlusionTime, 1);
        end;
    end;
    v182.checkDynamicVisTimeAvg = 0;
    if #v182.checkDynamicVisTime > 0 then
        for _, v186 in v182.checkDynamicVisTime do
            v182.checkDynamicVisTimeAvg = v182.checkDynamicVisTimeAvg + v186;
        end;
        v182.checkDynamicVisTimeAvg = v182.checkDynamicVisTimeAvg / #v182.checkDynamicVisTime;
        while #v182.checkDynamicVisTime > 60 do
            table.remove(v182.checkDynamicVisTime, 1);
        end;
    end;
    v182.debugTextPos = 156;
    v182:Print("Dynamic Objects Culled: " .. "(" .. v182.stats.totalDynamicVis - v182.stats.visibleDynamicVis .. " of " .. v182.stats.totalDynamicVis .. ")");
    local v187 = "Occluder time:";
    local v188 = math.floor(v182.occlusionTimeAvg * 10000) / 10;
    v182:Print(v187 .. (v188 < 0.1 and "0.0" or tostring(v188)) .. "ms");
    v187 = "DynamicVis time:";
    v188 = math.floor(v182.checkDynamicVisTimeAvg * 10000) / 10;
    v182:Print(v187 .. (v188 < 0.1 and "0.0" or tostring(v188)) .. "ms");
    v182:Print("OccluderTriangles: " .. v182.stats.occluderTriangles);
    v182:Print("DynamicVisTriangles: " .. v182.stats.dynamicVisTriangles);
    v182:Print("TransformedVerts: " .. v182.stats.transformedVerts);
    v182:Print("");
    local v189 = Color3.new(1, 1, 1);
    v182:Print("F4 to toggle software occlusion debug view", v189);
    v182:Print("Hold F6 to supress occlusion", v189);
    v182:Print("Hold F7 to supress details", v189);
    v182:Print("Shift+F2 for roblox render stats", v189);
    v182:Print("F8 to toggle this text", v189);
end;
v3.GetCenter = function(_, v191) --[[ Line: 769 ]] --[[ Name: GetCenter ]]
    if v191:IsA("BasePart") then
        return v191.Position;
    else
        return v191.WorldPivot.p;
    end;
end;
v3.IsPointVisible = function(v192, v193, v194, v195) --[[ Line: 776 ]] --[[ Name: IsPointVisible ]]
    -- upvalues: v3 (copy)
    local v196 = v194:WorldToViewportPoint(v193);
    if v196.z < 0 then
        return false;
    else
        local v197 = math.floor(v196.x / v192.yPixelSize);
        local v198 = math.floor(v196.y / v192.yPixelSize);
        if v197 < 1 or v3.xCount - 2 < v197 then
            return false;
        elseif v198 < 1 or v3.yCount - 2 < v198 then
            return false;
        else
            return v195(v197, v198, v196.z);
        end;
    end;
end;
v3.GetBounds = function(_, v200, v201) --[[ Line: 797 ]] --[[ Name: GetBounds ]]
    if v201.modelType == nil then
        if v200:IsA("BasePart") then
            v201.modelType = 0;
        elseif v200:IsA("Model") then
            v201.modelType = 1;
        else
            v201.modelType = 2;
        end;
    end;
    if v201.modelType == 0 then
        return v200.CFrame, v200.Size;
    elseif v201.modelType == 1 then
        return v200:GetBoundingBox();
    else
        return nil;
    end;
end;
v3.GetBoundsCached = function(_, v203, v204) --[[ Line: 818 ]] --[[ Name: GetBoundsCached ]]
    if v204.modelType == nil then
        if v203:IsA("BasePart") then
            v204.modelType = 0;
        elseif v203:IsA("Model") then
            v204.modelType = 1;
        else
            v204.modelType = 2;
        end;
    end;
    if v204.modelType == 0 then
        return v203.CFrame, v203.size;
    elseif v204.modelType == 1 then
        if v204.cf == nil then
            local l_v203_BoundingBox_0, v206 = v203:GetBoundingBox();
            v204.cf = l_v203_BoundingBox_0;
            v204.size = v206;
        end;
        return v204.cf, v204.size;
    else
        return nil;
    end;
end;
v3.PointInsideBounds = function(_, v208, v209, v210) --[[ Line: 849 ]] --[[ Name: PointInsideBounds ]]
    local v211 = v209:PointToObjectSpace(v208);
    v210 = v210 / 2;
    if v211.x < -v210.x or v211.x > v210.x then
        return false;
    elseif v211.y < -v210.y or v211.y > v210.y then
        return false;
    elseif v211.z < -v210.z or v211.z > v210.z then
        return false;
    else
        return true;
    end;
end;
v3.GenerateTrianglesForOccluderClipped = function(v212, v213, _, v215, v216, v217, v218) --[[ Line: 866 ]] --[[ Name: GenerateTrianglesForOccluderClipped ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy)
    if v213.dirty == true then
        v213.transformedCorners = {};
        for _, v220 in v5 do
            local v221 = v216 * (v220 * v217);
            table.insert(v213.transformedCorners, v221);
        end;
        v213.dirty = false;
    end;
    local v222 = {};
    local _ = {};
    local l_transformedCorners_0 = v213.transformedCorners;
    if v212:TestVisPoint(v215, l_transformedCorners_0[6], l_transformedCorners_0[8], l_transformedCorners_0[4]) then
        table.insert(v222, {
            l_transformedCorners_0[6], 
            l_transformedCorners_0[8], 
            l_transformedCorners_0[4]
        });
        table.insert(v222, {
            l_transformedCorners_0[4], 
            l_transformedCorners_0[2], 
            l_transformedCorners_0[6]
        });
    else
        table.insert(v222, {
            l_transformedCorners_0[1], 
            l_transformedCorners_0[3], 
            l_transformedCorners_0[7]
        });
        table.insert(v222, {
            l_transformedCorners_0[1], 
            l_transformedCorners_0[7], 
            l_transformedCorners_0[5]
        });
    end;
    if v212:TestVisPoint(v215, l_transformedCorners_0[3], l_transformedCorners_0[4], l_transformedCorners_0[7]) then
        table.insert(v222, {
            l_transformedCorners_0[3], 
            l_transformedCorners_0[4], 
            l_transformedCorners_0[7]
        });
        table.insert(v222, {
            l_transformedCorners_0[7], 
            l_transformedCorners_0[4], 
            l_transformedCorners_0[8]
        });
    else
        table.insert(v222, {
            l_transformedCorners_0[5], 
            l_transformedCorners_0[6], 
            l_transformedCorners_0[2]
        });
        table.insert(v222, {
            l_transformedCorners_0[5], 
            l_transformedCorners_0[2], 
            l_transformedCorners_0[1]
        });
    end;
    if v212:TestVisPoint(v215, l_transformedCorners_0[1], l_transformedCorners_0[2], l_transformedCorners_0[4]) then
        table.insert(v222, {
            l_transformedCorners_0[1], 
            l_transformedCorners_0[2], 
            l_transformedCorners_0[4]
        });
        table.insert(v222, {
            l_transformedCorners_0[1], 
            l_transformedCorners_0[4], 
            l_transformedCorners_0[3]
        });
    else
        table.insert(v222, {
            l_transformedCorners_0[5], 
            l_transformedCorners_0[7], 
            l_transformedCorners_0[8]
        });
        table.insert(v222, {
            l_transformedCorners_0[5], 
            l_transformedCorners_0[8], 
            l_transformedCorners_0[6]
        });
    end;
    local v225 = if v3.debugging == true then v222 else v222;
    for _, v227 in v212.outerPlanes do
        local v228 = {};
        for _, v230 in v225 do
            v212:ClipTriangleToPlane(v230, v227, v228);
        end;
        if #v228 == 0 then
            return {}, {};
        else
            v225 = v228;
        end;
    end;
    local v231 = {};
    local v232 = {};
    for _, v234 in v225 do
        local v235 = v234[1];
        local v236 = v232[v235];
        if v236 == nil then
            v236 = v218:WorldToViewportPoint(v235);
            v232[v235] = v236;
        end;
        table.insert(v231, v236);
        v234[1] = v236;
        local v237 = v234[2];
        local v238 = v232[v237];
        if v238 == nil then
            v238 = v218:WorldToViewportPoint(v237);
            v232[v237] = v238;
        end;
        table.insert(v231, v238);
        v234[2] = v238;
        local v239 = v234[3];
        local v240 = v232[v239];
        if v240 == nil then
            v240 = v218:WorldToViewportPoint(v239);
            v232[v239] = v240;
        end;
        table.insert(v231, v240);
        v234[3] = v240;
    end;
    return v225, (v2:MakeConvexHull(v231));
end;
v3.GenerateTrianglesForTester = function(v241, v242, _, v244, v245, v246) --[[ Line: 986 ]] --[[ Name: GenerateTrianglesForTester ]]
    -- upvalues: v5 (copy)
    if v242.dirty == true then
        v242.transformedCorners = {};
        for _, v248 in v5 do
            local v249 = v245 * (v248 * v246);
            table.insert(v242.transformedCorners, v249);
        end;
        v242.dirty = false;
    end;
    local l_transformedCorners_1 = v242.transformedCorners;
    local v251 = {};
    if v241:TestVisPoint(v244, l_transformedCorners_1[6], l_transformedCorners_1[8], l_transformedCorners_1[4]) then
        table.insert(v251, {
            l_transformedCorners_1[6], 
            l_transformedCorners_1[8], 
            l_transformedCorners_1[4]
        });
        table.insert(v251, {
            l_transformedCorners_1[4], 
            l_transformedCorners_1[2], 
            l_transformedCorners_1[6]
        });
    else
        table.insert(v251, {
            l_transformedCorners_1[1], 
            l_transformedCorners_1[3], 
            l_transformedCorners_1[7]
        });
        table.insert(v251, {
            l_transformedCorners_1[1], 
            l_transformedCorners_1[7], 
            l_transformedCorners_1[5]
        });
    end;
    if v241:TestVisPoint(v244, l_transformedCorners_1[3], l_transformedCorners_1[4], l_transformedCorners_1[7]) then
        table.insert(v251, {
            l_transformedCorners_1[3], 
            l_transformedCorners_1[4], 
            l_transformedCorners_1[7]
        });
        table.insert(v251, {
            l_transformedCorners_1[7], 
            l_transformedCorners_1[4], 
            l_transformedCorners_1[8]
        });
    else
        table.insert(v251, {
            l_transformedCorners_1[5], 
            l_transformedCorners_1[6], 
            l_transformedCorners_1[2]
        });
        table.insert(v251, {
            l_transformedCorners_1[5], 
            l_transformedCorners_1[2], 
            l_transformedCorners_1[1]
        });
    end;
    if v241:TestVisPoint(v244, l_transformedCorners_1[1], l_transformedCorners_1[2], l_transformedCorners_1[4]) then
        table.insert(v251, {
            l_transformedCorners_1[1], 
            l_transformedCorners_1[2], 
            l_transformedCorners_1[4]
        });
        table.insert(v251, {
            l_transformedCorners_1[1], 
            l_transformedCorners_1[4], 
            l_transformedCorners_1[3]
        });
    else
        table.insert(v251, {
            l_transformedCorners_1[5], 
            l_transformedCorners_1[7], 
            l_transformedCorners_1[8]
        });
        table.insert(v251, {
            l_transformedCorners_1[5], 
            l_transformedCorners_1[8], 
            l_transformedCorners_1[6]
        });
    end;
    local l_v251_0 = v251;
    local v253 = false;
    for _, v255 in v241.innerPlanes do
        local v256 = {};
        for _, v258 in l_v251_0 do
            if v241:ClipTriangleToPlane(v258, v255, v256) then
                v253 = true;
            end;
        end;
        l_v251_0 = v256;
    end;
    return l_v251_0, v253;
end;
v3.TestVisPoint = function(_, v260, v261, v262, v263) --[[ Line: 1055 ]] --[[ Name: TestVisPoint ]]
    local v264 = v261 - v260;
    if (v263 - v261):Cross(v262 - v261):Dot(v264) < 0 then
        return true;
    else
        return false;
    end;
end;
v3.DebugLine = function(v265, v266, v267, v268, v269, v270) --[[ Line: 1067 ]] --[[ Name: DebugLine ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Shape = Enum.PartType.Block;
    l_Part_0.Size = Vector3.new(v268, v268, (v266 - v267).Magnitude);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanTouch = false;
    l_Part_0.CanQuery = false;
    l_Part_0.Material = Enum.Material.Neon;
    l_Part_0.Color = v269;
    l_Part_0.Transparency = v270;
    local v272 = (v266 + v267) * 0.5;
    l_Part_0.CFrame = CFrame.lookAt(v272, v267);
    l_Part_0.Parent = game.Workspace;
    table.insert(v265.debugTris, l_Part_0);
end;
v3.DebugLineScreenSpace = function(v273, v274, v275, v276, v277) --[[ Line: 1087 ]] --[[ Name: DebugLineScreenSpace ]]
    v274 = Vector3.new(v274.x, v274.y, 0);
    v275 = Vector3.new(v275.x, v275.y, 0);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.BackgroundColor3 = v276 or Color3.new(1, 1, 1);
    l_Frame_0.Parent = v277 or game.Players.LocalPlayer.PlayerGui;
    local l_Magnitude_0 = (v275 - v274).Magnitude;
    local v280 = (v274 + v275) / 2;
    local v281 = math.deg((math.atan2(v275.Y - v274.Y, v275.X - v274.X)));
    l_Frame_0.Size = UDim2.new(0, l_Magnitude_0, 0, 2);
    l_Frame_0.Position = UDim2.new(0, v280.X, 0, v280.Y);
    l_Frame_0.Rotation = v281;
    table.insert(v273.debugTris, l_Frame_0);
    return l_Frame_0;
end;
v3.DebugBall = function(v282, v283) --[[ Line: 1113 ]] --[[ Name: DebugBall ]]
    local v284 = v282.colors[#v282.debugTris % 1000 + 1];
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Shape = Enum.PartType.Ball;
    l_Part_1.Size = Vector3.new(1, 1, 1, 0);
    l_Part_1.Anchored = true;
    l_Part_1.CanCollide = false;
    l_Part_1.CanTouch = false;
    l_Part_1.CanQuery = false;
    l_Part_1.Position = v283;
    l_Part_1.Color = v284;
    l_Part_1.Parent = game.Workspace;
    table.insert(v282.debugTris, l_Part_1);
end;
v3.DistanceToPlane = function(_, v287, v288) --[[ Line: 1128 ]] --[[ Name: DistanceToPlane ]]
    return v288.n:Dot(v287) + v288.d;
end;
v3.ClipTriangleToPlane = function(v289, v290, v291, v292) --[[ Line: 1133 ]] --[[ Name: ClipTriangleToPlane ]]
    local v293 = v290[1];
    local v294 = v290[2];
    local v295 = v290[3];
    local v296 = v291.n:Dot(v293) + v291.d;
    local v297 = v291.n:Dot(v294) + v291.d;
    local v298 = v291.n:Dot(v295) + v291.d;
    if v296 < 0 and v297 < 0 and v298 < 0 then
        return true;
    elseif v296 >= 0 and v297 >= 0 and v298 >= 0 then
        table.insert(v292, v290);
        return false;
    elseif v296 < 0 and v297 > 0 and v298 > 0 then
        local l_Unit_3 = (v294 - v293).Unit;
        local l_Unit_4 = (v295 - v293).Unit;
        local v301 = v289:RayPlane(v293, l_Unit_3, v291.n, v291.d);
        local v302 = v289:RayPlane(v293, l_Unit_4, v291.n, v291.d);
        local v303 = {
            v301, 
            v294, 
            v295
        };
        local v304 = {
            v302, 
            v301, 
            v295
        };
        table.insert(v292, v303);
        table.insert(v292, v304);
        return true;
    elseif v297 < 0 and v298 > 0 and v296 > 0 then
        local l_Unit_5 = (v295 - v294).Unit;
        local l_Unit_6 = (v293 - v294).Unit;
        local v307 = v289:RayPlane(v294, l_Unit_5, v291.n, v291.d);
        local v308 = v289:RayPlane(v294, l_Unit_6, v291.n, v291.d);
        local v309 = {
            v307, 
            v295, 
            v293
        };
        local v310 = {
            v308, 
            v307, 
            v293
        };
        table.insert(v292, v309);
        table.insert(v292, v310);
        return true;
    elseif v298 < 0 and v296 > 0 and v297 > 0 then
        local l_Unit_7 = (v293 - v295).Unit;
        local l_Unit_8 = (v294 - v295).Unit;
        local v313 = v289:RayPlane(v295, l_Unit_7, v291.n, v291.d);
        local v314 = v289:RayPlane(v295, l_Unit_8, v291.n, v291.d);
        local v315 = {
            v313, 
            v293, 
            v294
        };
        local v316 = {
            v314, 
            v313, 
            v294
        };
        table.insert(v292, v315);
        table.insert(v292, v316);
        return true;
    elseif v296 > 0 and v297 < 0 and v298 < 0 then
        local l_Unit_9 = (v294 - v293).Unit;
        local l_Unit_10 = (v295 - v293).Unit;
        table.insert(v292, {
            v293, 
            v289:RayPlane(v293, l_Unit_9, v291.n, v291.d), 
            (v289:RayPlane(v293, l_Unit_10, v291.n, v291.d))
        });
        return 1;
    elseif v297 > 0 and v298 < 0 and v296 < 0 then
        local l_Unit_11 = (v295 - v294).Unit;
        local l_Unit_12 = (v293 - v294).Unit;
        table.insert(v292, {
            v294, 
            v289:RayPlane(v294, l_Unit_11, v291.n, v291.d), 
            (v289:RayPlane(v294, l_Unit_12, v291.n, v291.d))
        });
        return true;
    elseif v298 > 0 and v296 < 0 and v297 < 0 then
        local l_Unit_13 = (v293 - v295).Unit;
        local l_Unit_14 = (v294 - v295).Unit;
        table.insert(v292, {
            v295, 
            v289:RayPlane(v295, l_Unit_13, v291.n, v291.d), 
            (v289:RayPlane(v295, l_Unit_14, v291.n, v291.d))
        });
        return true;
    else
        return true;
    end;
end;
v3.RayPlane = function(_, v324, v325, v326, v327) --[[ Line: 1278 ]] --[[ Name: RayPlane ]]
    local v328 = v325:Dot(v326);
    return v324 + v325 * ((-v324:Dot(v326) - v327) / v328);
end;
v3.SphereVisible = function(_, v330, v331, v332) --[[ Line: 1292 ]] --[[ Name: SphereVisible ]]
    for v333 = 1, 6 do
        if v331:Dot(v330[v333].n) + v330[v333].d + v332 < 0 then
            return false;
        end;
    end;
    return true;
end;
v3.IsBoundingBoxVisible = function(_, v335, v336, v337) --[[ Line: 1303 ]] --[[ Name: IsBoundingBoxVisible ]]
    local v338 = v337 / 2;
    local v339 = {
        v336:PointToWorldSpace(Vector3.new(v338.X, v338.Y, v338.Z), Vector3.new(-v338.X, v338.Y, v338.Z), Vector3.new(v338.X, -v338.Y, v338.Z), Vector3.new(-v338.X, -v338.Y, v338.Z), Vector3.new(v338.X, v338.Y, -v338.Z), Vector3.new(-v338.X, v338.Y, -v338.Z), Vector3.new(v338.X, -v338.Y, -v338.Z), (Vector3.new(-v338.X, -v338.Y, -v338.Z)))
    };
    for _, v341 in v335 do
        local v342 = false;
        for v343 = 1, 8 do
            local v344 = v339[v343];
            if v341.n:Dot(v344) + v341.d >= 0 then
                v342 = true;
                break;
            end;
        end;
        if not v342 then
            return false;
        end;
    end;
    return true;
end;
v3.Setup = function(v345) --[[ Line: 1352 ]] --[[ Name: Setup ]]
    -- upvalues: v3 (copy)
    v345:InitColors();
    local l_UserInputService_0 = game:GetService("UserInputService");
    if v3.allowDebug then
        l_UserInputService_0.InputBegan:Connect(function(v347) --[[ Line: 1357 ]]
            -- upvalues: v345 (copy)
            if v347.UserInputType == Enum.UserInputType.Keyboard then
                if v347.KeyCode == Enum.KeyCode.F8 then
                    v345.drawDebugText = not v345.drawDebugText;
                end;
                if v347.KeyCode == Enum.KeyCode.F6 then
                    v345.override = true;
                end;
                if v347.KeyCode == Enum.KeyCode.F4 then
                    v345.debugging = not v345.debugging;
                end;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(v348) --[[ Line: 1374 ]]
            -- upvalues: v345 (copy)
            if v348.UserInputType == Enum.UserInputType.Keyboard and v348.KeyCode == Enum.KeyCode.F6 then
                v345.override = false;
            end;
        end);
    end;
    game["Run Service"].Heartbeat:Connect(function() --[[ Line: 1383 ]]
        -- upvalues: v3 (ref)
        v3:Update();
    end);
end;
v3:Setup();
return v3;