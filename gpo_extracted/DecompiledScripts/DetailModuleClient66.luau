local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = {
    quads = script.Parent:FindFirstChild("Quads"), 
    allowDebug = script.Parent:GetAttribute("allowDebugInLive") or game.ReplicatedFirst:FindFirstChild("allowDebugInLive") ~= nil
};
if game["Run Service"]:IsStudio() == true then
    v1.allowDebug = true;
end;
v1.debugging = false;
v1.drawDebugText = script.parent:GetAttribute("enableDebugOnStart") and v1.allowDebug;
v1.override = false;
v1.tagList = {
    {
        name = "Detail_Ultra", 
        distance = 800, 
        useGrid = false
    }, 
    {
        name = "Detail_Big", 
        distance = 400, 
        useGrid = true
    }, 
    {
        name = "Detail_Small", 
        distance = 200, 
        useGrid = true
    }
};
v1.imposterDistance = script.Parent:GetAttribute("Imposter") or 350;
v1.imposterMaxDistance = script.Parent:GetAttribute("ImposterMax") or 4000;
v1.teleportSize = script.Parent:GetAttribute("TeleportSize") or 40;
v1.folder = game.ReplicatedFirst:FindFirstChild("Imposters");
v1.stepSize = 20;
v1.debugGui = nil;
v1.animSpeed = 4;
v1.imposterAnimSpeed = 4;
v1.imposterMsBudget = 0.5;
v1.imposterUpdates = 0;
v1.impostersUpdating = false;
v1.imposterVerticalAngleTolerance = 0.75;
v1.supressAnimationFrames = 0;
v1.largestGridDistance = 0;
v1.records = {};
v1.ultraRecords = {};
v1.movingRecords = {};
v1.debugSupression = false;
v1.detailMsBudget = 4;
v1.lastGrid = nil;
v1.processing = false;
v1.detailsDirty = false;
v1.setup = false;
v1.animating = {};
v1.animatingLights = {};
v1.debugTris = {};
v1.grid = {};
v1.oldSet = {};
v1.gridSize = Vector3.new(200, 2000, 200, 0);
v1.newlyVisibleRecords = {};
v1.imposters = {};
v1.recordCount = 0;
v1.visibleDetails = 0;
v1.visibleMovingDetails = 0;
v1.visibleImposterModels = 0;
v1.visibleImposterQuads = 0;
v1.detailsAnimating = 0;
v1.tooMuchStuffAnimating = 200;
v1.markParts = false;
v1.centerOnPlayer = script.Parent:GetAttribute("centerOnPlayer") or true;
v1.pendingLoads = 0;
v1.ForceUpdateAllTags = function(v2) --[[ Line: 86 ]] --[[ Name: ForceUpdateAllTags ]]
    -- upvalues: v1 (copy)
    local l_Position_0 = game.workspace.CurrentCamera.CFrame.Position;
    for _, v5 in v2.records do
        task.spawn(function() --[[ Line: 92 ]]
            -- upvalues: v1 (ref), v5 (copy), v2 (copy), l_Position_0 (copy)
            local l_v1_0 = v1;
            l_v1_0.pendingLoads = l_v1_0.pendingLoads + 1;
            while v5.loaded ~= true do
                wait();
            end;
            l_v1_0 = v1;
            l_v1_0.pendingLoads = l_v1_0.pendingLoads - 1;
            l_v1_0 = v5.instance;
            v2:ConfigureRecordDistance(l_v1_0, v5, v5.tag.useGrid, v5.tag.moves, v5.tag.distance);
            v2:UpdateVis(v5, l_Position_0);
        end);
    end;
end;
v1.SupressAnimations = function(_, v8) --[[ Line: 107 ]] --[[ Name: SupressAnimations ]]
    -- upvalues: v1 (copy)
    v1.supressAnimationFrames = v8;
end;
v1.AnimateRecord = function(v9, v10, v11) --[[ Line: 111 ]] --[[ Name: AnimateRecord ]]
    -- upvalues: v1 (copy)
    if v10.animate ~= true or v1.supressAnimationFrames > 0 then
        v9:SnapAnimateRecord(v10, v11);
        return;
    else
        if v9.detailsAnimating > v9.tooMuchStuffAnimating then
            v11 = v11 * 4;
        end;
        if v10.lodModel == nil then
            v9:AnimatePart(v10.instance, v10.instance, v11, 0, v10.reparent);
            for _, v13 in v10.instance:GetDescendants() do
                v9:AnimatePart(v10.instance, v13, v11, 0, v10.reparent);
            end;
            return;
        else
            local v14 = 0;
            local v15 = 1;
            if v11 < 0 then
                v14 = 1;
                v15 = 0;
            end;
            if v10.reparent == true then
                v10.lodModel.Parent = v10.parent;
            end;
            v9:AnimatePart(v10.lodModel, v10.lodModel, -v11 * 2, v14, v10.reparent);
            for _, v17 in v10.lodModel:GetDescendants() do
                v9:AnimatePart(v10.lodModel, v17, -v11 * 2, v14, v10.reparent);
            end;
            v9:AnimatePart(v10.instance, v10.instance, v11 * 2, v15, v10.reparent);
            for _, v19 in v10.instance:GetDescendants() do
                v9:AnimatePart(v10.instance, v19, v11 * 2, v15, v10.reparent);
            end;
            return;
        end;
    end;
end;
local function v21(v20) --[[ Line: 154 ]] --[[ Name: SetFullyTransparent ]]
    if v20:IsA("BasePart") or v20:IsA("Decal") or v20:IsA("Texture") then
        v20.LocalTransparencyModifier = 1;
    elseif v20:IsA("SurfaceGui") then
        v20.Enabled = false;
    end;
    if v20:IsA("Light") then
        if v20:GetAttribute("Brightness") == nil then
            v20:SetAttribute("Brightness", v20.Brightness);
        end;
        v20.Brightness = 0;
    end;
end;
v1.SnapRecordToTransparent = function(_, v23) --[[ Line: 171 ]] --[[ Name: SnapRecordToTransparent ]]
    -- upvalues: v21 (copy)
    v21(v23.instance);
    for _, v25 in v23.instance:GetDescendants() do
        v21(v25);
    end;
end;
v1.SnapRecordLODModelToTransparent = function(_, v27) --[[ Line: 179 ]] --[[ Name: SnapRecordLODModelToTransparent ]]
    -- upvalues: v21 (copy)
    v21(v27.lodModel);
    for _, v29 in v27.lodModel:GetDescendants() do
        v21(v29);
    end;
end;
v1.SnapAnimateRecord = function(v30, v31, v32) --[[ Line: 187 ]] --[[ Name: SnapAnimateRecord ]]
    v30:ClearAnimations(v31);
    if v31.lodModel ~= nil then
        if v32 > 0 then
            if v31.reparent == true then
                v31.instance.Parent = nil;
            else
                v30:SnapRecordToTransparent(v31);
            end;
            if v31.reparent == true then
                v31.lodModel.Parent = v31.parent;
                return;
            end;
        elseif v31.reparent == true then
            v31.lodModel.Parent = nil;
            v31.parentReason = "AnimatingSnap";
            v31.instance.Parent = v31.parent;
            return;
        else
            v30:SnapRecordLODModelToTransparent(v31);
            return;
        end;
    elseif v32 > 0 then
        if v31.reparent == true then
            v31.instance.Parent = nil;
            return;
        else
            v30:SnapRecordToTransparent(v31);
            return;
        end;
    elseif v31.reparent == true then
        v31.parentReason = "AnimatingSnap";
        v31.instance.Parent = v31.parent;
    end;
end;
v1.ClearAnimations = function(v33, v34) --[[ Line: 246 ]] --[[ Name: ClearAnimations ]]
    -- upvalues: v1 (copy)
    if v34.animate == false and v34.reparent == true then
        return;
    else
        if v34.lodModel ~= nil then
            v1:ClearAnimation(v34.lodModel);
            for _, v36 in v34.lodModel:GetDescendants() do
                v33:ClearAnimation(v36);
            end;
        end;
        v33:ClearAnimation(v34.instance);
        for _, v38 in v34.instance:GetDescendants() do
            v33:ClearAnimation(v38);
        end;
        return;
    end;
end;
v1.ClearAnimation = function(v39, v40) --[[ Line: 269 ]] --[[ Name: ClearAnimation ]]
    if v40:IsA("BasePart") or v40:IsA("Decal") or v40:IsA("Texture") then
        v40.LocalTransparencyModifier = 0;
        local _ = v39.animating[v40];
        v39.animating[v40] = nil;
    elseif v40:IsA("SurfaceGui") then
        v40.Enabled = true;
    end;
    if v40:IsA("Light") then
        local l_v40_Attribute_0 = v40:GetAttribute("Brightness");
        if l_v40_Attribute_0 ~= nil then
            v40.Brightness = l_v40_Attribute_0;
        end;
        v39.animatingLights[v40] = nil;
    end;
end;
v1.AnimatePart = function(v43, v44, v45, v46, v47, v48) --[[ Line: 289 ]] --[[ Name: AnimatePart ]]
    if v45:IsA("BasePart") or v45:IsA("Decal") or v45:IsA("Texture") then
        local v49 = {
            part = v45, 
            delayTime = v47 * 0.5
        };
        if v46 < 0 then
            v49.transparency = 1;
            v49.dir = v46;
        else
            v49.transparency = 0;
            v49.dir = v46;
        end;
        local v50 = v43.animating[v45];
        if v50 ~= nil then
            v49.transparency = v50.transparency;
        end;
        v49.parentInstance = v44;
        v49.reparent = v48;
        v45.LocalTransparencyModifier = v49.transparency;
        v43.animating[v45] = v49;
        return;
    elseif v45:IsA("SurfaceGui") then
        if v46 < 0 then
            v45.Enabled = true;
            return;
        else
            v45.Enabled = false;
            return;
        end;
    elseif v45:IsA("Light") then
        local l_v45_Attribute_0 = v45:GetAttribute("Brightness");
        if l_v45_Attribute_0 == nil then
            l_v45_Attribute_0 = v45.Brightness;
            v45:SetAttribute("Brightness", l_v45_Attribute_0);
        end;
        local v52 = {
            delayTime = v47, 
            part = v45, 
            brightness = l_v45_Attribute_0, 
            reparent = v48
        };
        if v46 < 0 then
            v52.transparency = 1;
            v52.dir = v46;
        else
            v52.transparency = 0;
            v52.dir = v46;
        end;
        local v53 = v43.animatingLights[v45];
        if v53 ~= nil then
            v52.transparency = v53.transparency;
        end;
        v52.parentInstance = v44;
        v45.Brightness = v52.brightness * (1 - v52.transparency);
        v43.animatingLights[v45] = v52;
        return;
    else
        return;
    end;
end;
v1.AddToGrid = function(v54, v55) --[[ Line: 370 ]] --[[ Name: AddToGrid ]]
    local v56 = v54.grid[v55.key];
    if v56 == nil then
        v56 = {};
        v54.grid[v55.key] = v56;
    end;
    v56[v55.instance] = v55;
    v55.instance:SetAttribute("pos", v54:GetPosition(v55));
end;
v1.RemoveFromGrid = function(v57, v58) --[[ Line: 380 ]] --[[ Name: RemoveFromGrid ]]
    local v59 = v57.grid[v58.key];
    if v59 then
        v59[v58.instance] = nil;
    end;
end;
v1.UpdateVis = function(v60, v61, v62) --[[ Line: 387 ]] --[[ Name: UpdateVis ]]
    if v61.parent == nil then
        return;
    else
        local l_magnitude_0 = (v60:GetPosition(v61) - v62).magnitude;
        if v60.debugSupression == true then
            l_magnitude_0 = 0;
        end;
        if v61.distance < l_magnitude_0 then
            if v61.visible == true then
                if v60.debugging == true then
                    print("Detail hiding", v61.instance.Name);
                end;
                v61.visible = false;
                if v61.lodModel and v61.reparent == true then
                    v61.lodModel.Parent = v61.parent;
                end;
                v60:AnimateRecord(v61, 1);
                return;
            end;
        elseif v61.visible == false then
            if v60.debugging == true then
                print("Detail showing", v61.instance.Name);
            end;
            v61.visible = true;
            if v61.reparent == true then
                v61.parentReason = "Animating";
                v61.instance.Parent = v61.parent;
            end;
            v60:AnimateRecord(v61, -1);
        end;
        return;
    end;
end;
v1.PrintPathForInstance = function(_, v65) --[[ Line: 441 ]] --[[ Name: PrintPathForInstance ]]
    local v66 = "";
    local l_v65_0 = v65;
    while l_v65_0 ~= nil do
        if v66 == "" then
            v66 = l_v65_0.Name;
        else
            v66 = l_v65_0.Name .. "." .. v66;
        end;
        l_v65_0 = l_v65_0.Parent;
    end;
    return v66;
end;
v1.CalculateKey = function(v68, v69) --[[ Line: 455 ]] --[[ Name: CalculateKey ]]
    return (Vector3.new(math.floor(v69.x / v68.gridSize.x), math.floor(v69.y / v68.gridSize.y), (math.floor(v69.z / v68.gridSize.z))));
end;
v1.GetPosition = function(_, v71) --[[ Line: 459 ]] --[[ Name: GetPosition ]]
    if v71.isDecalOrTexture then
        return v71.parent.Position;
    elseif v71.isModel == true then
        if v71.instance.PrimaryPart ~= nil then
            return v71.instance.PrimaryPart.Position;
        else
            return v71.instance:GetModelCFrame().Position;
        end;
    else
        return v71.instance.Position;
    end;
end;
v1.CalculateRadius = function(_, v73) --[[ Line: 474 ]] --[[ Name: CalculateRadius ]]
    local v74 = nil;
    if v73:IsA("Decal") or v73:IsA("Texture") then
        v74 = v73.Parent.Size;
    elseif v73:IsA("BasePart") then
        v74 = v73.Size;
    else
        local _, v76 = v73:GetBoundingBox();
        v74 = v76;
    end;
    return math.max(math.max(v74.x, v74.y), v74.z) / 2;
end;
v1.ConfigureRecordDistance = function(v77, v78, v79, v80, v81, v82) --[[ Line: 489 ]] --[[ Name: ConfigureRecordDistance ]]
    v79.useGrid = v80;
    v79.moves = v81;
    local l_v78_Attribute_0 = v78:GetAttribute("distance");
    if l_v78_Attribute_0 ~= nil then
        v82 = l_v78_Attribute_0;
    end;
    v79.distance = v82 + v77:CalculateRadius(v79.instance);
    if v80 and v79.distance > v77.largestGridDistance then
        v79.distance = v77.largestGridDistance;
    end;
end;
v1.CleanupDetailRecord = function(v84, v85) --[[ Line: 510 ]] --[[ Name: CleanupDetailRecord ]]
    if v84.debugging == true then
        print("Detail destroyed", v85.instance.Name);
    end;
    if v85.instanceSignal then
        v85.instanceSignal:Disconnect();
        v85.instanceSignal = nil;
    end;
    if v85.ancestoryChangedSignal then
        v85.ancestoryChangedSignal:Disconnect();
        v85.ancestoryChangedSignal = nil;
    end;
    if v85.transformChangedSignal then
        v85.transformChangedSignal:Disconnect();
        v85.transformChangedSignal = nil;
    end;
    if v85.primaryPartChangedSignal then
        v85.primaryPartChangedSignal:Disconnect();
        v85.primaryPartChangedSignal = nil;
    end;
    v84:ClearAnimations(v85);
    if v85.instance ~= nil then
        v84:RemoveFromGrid(v85);
        v84.records[v85.instance] = nil;
        v84.ultraRecords[v85.instance] = nil;
        v84.movingRecords[v85.instance] = nil;
        v84.oldSet[v85.instance] = nil;
    end;
    v84.recordCount = v84.recordCount - 1;
end;
v1.OnDetailAdded = function(v86, v87, v88, v89, v90, v91, v92, v93) --[[ Line: 547 ]] --[[ Name: OnDetailAdded ]]
    -- upvalues: v1 (copy)
    if v86.newlyVisibleRecords[v87] ~= nil then
        return;
    else
        local v94 = v86.records[v87];
        if v94 ~= nil then
            if v94.parentReason == nil then
                v86.newlyVisibleRecords[v87] = v86.records[v87];
            end;
            v94.parentReason = nil;
            return;
        elseif v87:IsA("Model") == false and v87:IsA("BasePart") == false and v87:IsA("Decal") == false and v87:IsA("Texture") == false then
            warn("Only models, baseparts, decals, and textures allowed: ", v86:PrintPathForInstance(v87));
            return;
        else
            local v95 = nil;
            v95 = task.spawn(function() --[[ Line: 572 ]]
                -- upvalues: v86 (copy), v87 (copy), v90 (copy), v93 (copy), v91 (copy), v92 (copy), v89 (copy), v88 (copy), v95 (ref), v1 (ref)
                if v86.debugging == true then
                    print("Detail Adding ", v87.Name, " moves:", v90);
                end;
                local v96 = {
                    tag = v93, 
                    instance = v87, 
                    visible = true, 
                    animate = v91, 
                    reparent = v92, 
                    loaded = false, 
                    useGrid = v89, 
                    moves = v90
                };
                v86:ConfigureRecordDistance(v87, v96, v89, v90, v88);
                v86.records[v87] = v96;
                if game.Workspace:IsAncestorOf(v87) == false then
                    local v99 = v87.AncestryChanged:Connect(function(_, _) --[[ Line: 599 ]]
                        -- upvalues: v87 (ref), v95 (ref)
                        if game.Workspace:IsAncestorOf(v87) == true then
                            coroutine.resume(v95);
                        end;
                    end);
                    coroutine.yield(v95);
                    v99:Disconnect();
                end;
                local l_v87_Attribute_0 = v87:GetAttribute("HasLodModel");
                if l_v87_Attribute_0 ~= nil then
                    local l_v1_1 = v1;
                    l_v1_1.pendingLoads = l_v1_1.pendingLoads + 1;
                    l_v1_1 = #v87:GetDescendants();
                    while l_v1_1 < l_v87_Attribute_0 do
                        wait();
                        l_v1_1 = #v87:GetDescendants() or 0;
                    end;
                    local v102;
                    while true do
                        v102 = v87:FindFirstChild("LOD");
                        if not v102 then
                            wait();
                        else
                            break;
                        end;
                    end;
                    v102.Name = v87.Name .. "_LOD";
                    v96.lodModel = v102;
                    v102 = v1;
                    v102.pendingLoads = v102.pendingLoads - 1;
                end;
                if v87.Parent == nil then
                    local l_v1_2 = v1;
                    l_v1_2.pendingLoads = l_v1_2.pendingLoads + 1;
                    while v87.Parent == nil do
                        wait();
                    end;
                    l_v1_2 = v1;
                    l_v1_2.pendingLoads = l_v1_2.pendingLoads - 1;
                end;
                local l_v87_Attribute_1 = v87:GetAttribute("animate");
                if l_v87_Attribute_1 ~= nil then
                    v96.animate = l_v87_Attribute_1;
                end;
                v96.isDecalOrTexture = false;
                v96.isModel = false;
                if v87:IsA("Decal") or v87:IsA("Texture") then
                    v96.isDecalOrTexture = true;
                elseif v87:IsA("Model") then
                    v96.isModel = true;
                end;
                if v86.markParts == true then
                    local l_SelectionBox_0 = Instance.new("SelectionBox");
                    l_SelectionBox_0.Adornee = v87;
                    l_SelectionBox_0.Parent = v87;
                    l_SelectionBox_0.Color3 = Color3.new(0.3, 1, 0.3);
                    l_SelectionBox_0.SurfaceColor3 = Color3.new(0.3, 1, 0.3);
                    l_SelectionBox_0.SurfaceTransparency = 0.85;
                end;
                v96.parent = v87.Parent;
                v96.instanceSignal = v96.instance:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 675 ]]

                end);
                v96.instance.Destroying:Connect(function() --[[ Line: 676 ]]
                    -- upvalues: v86 (ref), v96 (copy)
                    v86:CleanupDetailRecord(v96);
                end);
                if v96.useGrid == true then
                    v96.key = v86:CalculateKey(v86:GetPosition(v96));
                    v86:AddToGrid(v96);
                    v86.oldSet[v96.instance] = v96;
                    if v96.isModel == false then
                        local l_instance_0 = v96.instance;
                        if v96.isDecalOrTexture then
                            l_instance_0 = v96.instance.Parent;
                        end;
                    else
                        v96.primaryPartChangedSignal = v96.instance:GetPropertyChangedSignal("PrimaryPart"):Connect(function() --[[ Line: 698 ]]
                            -- upvalues: v96 (copy), v86 (ref)
                            if v96.primaryPartChangedSignal then
                                v96.primaryPartChangedSignal:Disconnect();
                            end;
                            local v107 = v86:CalculateKey(v86:GetPosition(v96));
                            if v107 ~= v96.key then
                                v86:RemoveFromGrid(v96);
                                v96.key = v107;
                                v86:AddToGrid(v96);
                            end;
                        end);
                    end;
                elseif v96.moves == true then
                    v86.movingRecords[v87] = v96;
                else
                    v86.ultraRecords[v87] = v96;
                end;
                v86.newlyVisibleRecords[v87] = v96;
                v96.loaded = true;
                local l_v86_0 = v86;
                l_v86_0.recordCount = l_v86_0.recordCount + 1;
            end);
            return;
        end;
    end;
end;
v1.ConfigureTags = function(v109) --[[ Line: 729 ]] --[[ Name: ConfigureTags ]]
    for _, v111 in script.Parent:GetChildren() do
        local l_Name_0 = v111.Name;
        if string.sub(l_Name_0, 1, 7) == "Detail_" then
            local v113 = nil;
            for _, v115 in v109.tagList do
                if v115.name == l_Name_0 then
                    v113 = v115;
                    break;
                end;
            end;
            if v113 == nil then
                v113 = {
                    moves = false, 
                    useGrid = true, 
                    name = l_Name_0, 
                    distance = 50
                };
                if v109.debugging == true then
                    print("New Detail tag registered:", l_Name_0, " distance:", v113.distance, " moves:", v113.moves);
                end;
                table.insert(v109.tagList, v113);
            end;
            v113.reparent = true;
            v113.animate = true;
            v113.moves = false;
            if v111:GetAttribute("distance") ~= nil then
                v113.distance = v111:GetAttribute("distance");
            end;
            if v111:GetAttribute("usegrid") == false then
                v113.useGrid = false;
            end;
            if v111:GetAttribute("animate") == false then
                v113.animate = false;
            end;
            if v111:GetAttribute("deparent") == false then
                v113.reparent = false;
            end;
            if v111:GetAttribute("moves") == true then
                v113.useGrid = false;
                v113.moves = true;
                v113.reparent = false;
            end;
            v113.configurationDistance = v113.distance;
        end;
    end;
    v109.largestGridDistance = 0;
    for _, v117 in v109.tagList do
        if v117.useGrid == true and v117.distance > v109.largestGridDistance then
            v109.largestGridDistance = v117.distance;
        end;
    end;
end;
v1.Setup = function(v118) --[[ Line: 797 ]] --[[ Name: Setup ]]
    -- upvalues: l_CollectionService_0 (copy), v1 (copy)
    if v118.setup == true then
        return;
    else
        v118.setup = true;
        v118:ConfigureTags();
        for _, v120 in v118.tagList do
            for _, v122 in l_CollectionService_0:GetTagged(v120.name) do
                v1:OnDetailAdded(v122, v120.distance, v120.useGrid, v120.moves, v120.animate, v120.reparent, v120);
            end;
            l_CollectionService_0:GetInstanceAddedSignal(v120.name):Connect(function(v123) --[[ Line: 812 ]]
                -- upvalues: v1 (ref), v120 (copy)
                v1:OnDetailAdded(v123, v120.distance, v120.useGrid, v120.moves, v120.animate, v120.reparent, v120);
            end);
        end;
        for _, v125 in l_CollectionService_0:GetTagged("Imposter") do
            v118:ImposterSetup(v125);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("Imposter"):Connect(function(v126) --[[ Line: 821 ]]
            -- upvalues: v118 (copy)
            v118:ImposterSetup(v126);
        end);
        v118.cameraPreviousCFrame = game.workspace.CurrentCamera.CFrame;
        return;
    end;
end;
v1.DrawUIText = function(v127, v128, v129, v130, v131) --[[ Line: 828 ]] --[[ Name: DrawUIText ]]
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.AutoLocalize = false;
    l_TextLabel_0.Text = v129;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextSize = v131;
    l_TextLabel_0.TextColor3 = v130;
    l_TextLabel_0.Position = UDim2.new(0, v128.x, 0, v128.y);
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Bottom;
    l_TextLabel_0.Parent = v127.debugGui;
    table.insert(v127.debugTris, l_TextLabel_0);
    return l_TextLabel_0;
end;
v1.ProcessDetailObject = function(v133, v134, v135) --[[ Line: 844 ]] --[[ Name: ProcessDetailObject ]]
    if v134.loaded == false then
        return;
    elseif v134.instanceSignal == nil or v134.instanceSignal.Connected == false then
        v133:CleanupDetailRecord(v134);
        return;
    else
        v133:UpdateVis(v134, v135);
        if v134.visible then
            if v134.moves then
                v133.visibleMovingDetails = v133.visibleMovingDetails + 1;
                return;
            else
                v133.visibleDetails = v133.visibleDetails + 1;
            end;
        end;
        return;
    end;
end;
v1.UpdateAnimations = function(v136, v137) --[[ Line: 866 ]] --[[ Name: UpdateAnimations ]]
    debug.profilebegin("Update Animations");
    v136.detailsAnimating = 0;
    for _, v139 in v136.animating do
        v136.detailsAnimating = v136.detailsAnimating + 1;
        if v139.delayTime > 0 then
            v139.delayTime = v139.delayTime - v137 * v136.animSpeed;
        else
            v139.transparency = v139.transparency + v139.dir * v137 * v136.animSpeed;
            if v139.transparency < 0 then
                v139.transparency = 0;
                v136.animating[v139.part] = nil;
            end;
            if v139.transparency > 1 then
                v139.transparency = 1;
                v136.animating[v139.part] = nil;
                if v139.reparent then
                    v139.parentInstance.Parent = nil;
                end;
            end;
        end;
        v139.part.LocalTransparencyModifier = v139.transparency;
    end;
    for _, v141 in v136.animatingLights do
        v136.detailsAnimating = v136.detailsAnimating + 1;
        if v141.delayTime > 0 then
            v141.delayTime = v141.delayTime - v137 * v136.animSpeed;
        else
            v141.transparency = v141.transparency + v141.dir * v137 * v136.animSpeed;
            if v141.transparency < 0 then
                v141.transparency = 0;
                v136.animatingLights[v141.part] = nil;
            end;
            if v141.transparency > 1 then
                v141.transparency = 1;
                v136.animatingLights[v141.part] = nil;
                if v141.reparent == true then
                    v141.parentInstance.Parent = nil;
                end;
            end;
        end;
        v141.part.Brightness = v141.brightness * (1 - v141.transparency);
    end;
    debug.profileend();
end;
v1.UpdateDetails = function(v142, v143, _) --[[ Line: 928 ]] --[[ Name: UpdateDetails ]]
    if v142.detailsDirty == false then
        return;
    elseif v142.processing == true then
        return;
    else
        v142.detailsDirty = false;
        v142.processing = true;
        local v145 = tick() + 0.001 * v142.detailMsBudget;
        task.spawn(function() --[[ Line: 942 ]]
            -- upvalues: v142 (copy), v143 (copy), v145 (ref)
            debug.profilebegin("Update Details");
            v142.visibleDetails = 0;
            local v146 = math.ceil(v142.largestGridDistance / v142.gridSize.x);
            local v147 = math.ceil(v142.largestGridDistance / v142.gridSize.y);
            local v148 = math.ceil(v142.largestGridDistance / v142.gridSize.z);
            local v149 = math.floor(v143.x / v142.gridSize.x) - v146;
            local v150 = math.floor(v143.y / v142.gridSize.y) - v147;
            local v151 = math.floor(v143.z / v142.gridSize.z) - v148;
            local v152 = math.floor(v143.x / v142.gridSize.x) + v146;
            local v153 = math.floor(v143.y / v142.gridSize.y) + v147;
            local v154 = math.floor(v143.z / v142.gridSize.z) + v148;
            local v155 = {};
            debug.profilebegin("Update Grid");
            for v156 = v149, v152 do
                for v157 = v150, v153 do
                    for v158 = v151, v154 do
                        local v159 = v142.grid[Vector3.new(v156, v157, v158)];
                        if v159 then
                            for _, v161 in v159 do
                                v155[v161.instance] = v161;
                                v142.oldSet[v161.instance] = v161;
                            end;
                        end;
                    end;
                end;
            end;
            debug.profileend();
            local v162 = 0;
            for _, v164 in v142.oldSet do
                v142:ProcessDetailObject(v164, v143);
                v162 = v162 + 1;
                if v162 > 100 then
                    v162 = 0;
                    if tick() > v145 then
                        debug.profileend();
                        task.wait();
                        debug.profilebegin("Update Details");
                        v145 = tick() + 0.001 * v142.detailMsBudget;
                    end;
                end;
            end;
            v142.oldSet = v155;
            v142.processing = false;
            v162 = 0;
            for _, v166 in v142.ultraRecords do
                v142:ProcessDetailObject(v166, v143);
                v162 = v162 + 1;
                if v162 > 100 then
                    v162 = 0;
                    if tick() > v145 then
                        debug.profileend();
                        task.wait();
                        debug.profilebegin("Update Details");
                        v145 = tick() + 0.001 * v142.detailMsBudget;
                    end;
                end;
            end;
            debug.profileend();
        end);
        return;
    end;
end;
v1.UpdateMovingDetails = function(v167, v168, _) --[[ Line: 1025 ]] --[[ Name: UpdateMovingDetails ]]
    task.spawn(function() --[[ Line: 1028 ]]
        -- upvalues: v167 (copy), v168 (copy)
        debug.profilebegin("Update Moving Details");
        v167.visibleMovingDetails = 0;
        local v170 = 0;
        local v171 = tick() + 0.001 * v167.detailMsBudget;
        for _, v173 in v167.movingRecords do
            v167:ProcessDetailObject(v173, v168);
            v170 = v170 + 1;
            if v170 > 100 then
                v170 = 0;
                if v171 < tick() then
                    debug.profileend();
                    task.wait();
                    debug.profilebegin("Update Moving Details");
                    v171 = tick() + 0.001 * v167.detailMsBudget;
                end;
            end;
        end;
    end);
end;
v1.Update = function(v174, v175) --[[ Line: 1055 ]] --[[ Name: Update ]]
    -- upvalues: v1 (copy)
    debug.profilebegin("Update Detail Module");
    v174:Setup();
    local v176 = tick();
    for _, v178 in v174.debugTris do
        v178:Destroy();
    end;
    v174.debugTris = {};
    local v179 = nil;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
    v179 = if l_CameraSubject_0 and l_CameraSubject_0.Parent then if l_CameraSubject_0:IsA("Humanoid") then if l_CameraSubject_0.Parent.PrimaryPart then l_CurrentCamera_0.CameraSubject.Parent.PrimaryPart.Position else l_CurrentCamera_0.CFrame.Position else l_CameraSubject_0.Position else l_CurrentCamera_0.CFrame.Position;
    if v174.cameraPreviousPos == nil then
        v174.cameraPreviousPos = v179;
    end;
    local l_Magnitude_0 = (v179 - v174.cameraPreviousPos).Magnitude;
    v174.cameraPreviousPos = v179;
    if v1.teleportSize < l_Magnitude_0 then
        if v174.debugging == true then
            print("Camera teleported!");
        end;
        v174.detailsDirty = true;
        v174.supressAnimationFrames = v174.supressAnimationFrames + 1;
    end;
    if v174.gridPreviousPos == nil then
        v174.gridPreviousPos = v179;
    end;
    local v183 = v179 - v174.gridPreviousPos;
    if v174.detailsDirty == false and v183.Magnitude > v174.stepSize then
        v174.gridPreviousPos = v179;
        v174.detailsDirty = true;
    end;
    v174.lastCameraPos = v179;
    v174:UpdateNewlyVisibleDetails(v179);
    v174:UpdateDetails(v179, v175);
    v174:UpdateMovingDetails(v179, v175);
    v174:UpdateAnimations(v175);
    if v174.processing == false and v174.supressAnimationFrames > 0 then
        v174.supressAnimationFrames = v174.supressAnimationFrames - 1;
    end;
    v174:DrawDebugText((math.floor((tick() - v176) * 10000)));
    debug.profileend();
end;
v1.UpdateNewlyVisibleDetails = function(v184, v185) --[[ Line: 1139 ]] --[[ Name: UpdateNewlyVisibleDetails ]]
    for _, v187 in v184.newlyVisibleRecords do
        if v187.isModel ~= nil then
            v184:ClearAnimations(v187);
            if (v184:GetPosition(v187) - v185).magnitude > v187.distance then
                v187.visible = false;
                if v187.lodModel ~= nil then
                    v187.lodModel.Parent = v187.parent;
                end;
                if v187.reparent == true then
                    v187.instance.Parent = nil;
                else
                    v184:SnapRecordToTransparent(v187);
                end;
            else
                v187.visible = true;
                if v187.lodModel ~= nil then
                    if v187.reparent == true then
                        v187.lodModel.Parent = nil;
                    else
                        v187.lodModel.Parent = v187.parent;
                        v184:SnapRecordLODModelToTransparent(v187);
                    end;
                end;
                v187.instance.Parent = v187.parent;
            end;
        end;
    end;
    v184.newlyVisibleRecords = {};
end;
v1.DrawDebugText = function(v188, v189) --[[ Line: 1191 ]] --[[ Name: DrawDebugText ]]
    -- upvalues: v1 (copy)
    debug.profilebegin("DrawDebugText");
    if v188.drawDebugText == true then
        v189 = v189 / 10;
        local v190 = tostring(v189);
        if v189 < 0.1 then
            v190 = "0.0";
        end;
        if v188.debugGui == nil then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Parent = game.Players.LocalPlayer.PlayerGui;
            l_ScreenGui_0.ResetOnSpawn = false;
            l_ScreenGui_0.IgnoreGuiInset = true;
            l_ScreenGui_0.Name = "DebugGui";
            v188.debugGui = l_ScreenGui_0;
        end;
        local v192 = 0;
        v188.visibleImposterQuads = 0;
        v188.visibleImposterModels = 0;
        for _, v194 in v188.imposters do
            v192 = v192 + 1;
            if v194.showModel == false then
                v188.visibleImposterQuads = v188.visibleImposterQuads + 1;
            else
                v188.visibleImposterModels = v188.visibleImposterModels + 1;
            end;
        end;
        local v195 = 76;
        v188:DrawUIText(Vector3.new(10, v195, 0), "Num Details: (" .. v188.visibleDetails + v188.visibleMovingDetails .. "/" .. v188.recordCount .. ") (" .. v1.pendingLoads .. ")", Color3.new(0, 1, 0), 8);
        v195 = v195 + 14;
        v188:DrawUIText(Vector3.new(10, v195, 0), "Animating: " .. v188.detailsAnimating, Color3.new(0, 1, 0), 8);
        v195 = v195 + 14;
        v188:DrawUIText(Vector3.new(10, v195, 0), "Imposter Models vs Quads: (" .. v188.visibleImposterModels .. " vs " .. v188.visibleImposterQuads .. ")", Color3.new(0, 1, 0), 8);
        v195 = v195 + 14;
        v188:DrawUIText(Vector3.new(10, v195, 0), "Imposter Updates: " .. v188.imposterUpdates, Color3.new(0, 1, 0), 8);
        v195 = v195 + 14;
        v188:DrawUIText(Vector3.new(10, v195, 0), "Detail CPU: " .. v190 .. "ms.", Color3.new(0, 1, 0), 8);
        v195 = v195 + 14;
    end;
    v188.imposterUpdates = 0;
    debug.profileend();
end;
v1.UpdateImposters = function(v196, v197) --[[ Line: 1244 ]] --[[ Name: UpdateImposters ]]
    if v196.impostersUpdating ~= true then
        v196.impostersUpdating = true;
        coroutine.wrap(function() --[[ Line: 1247 ]]
            -- upvalues: v196 (copy), v197 (copy)
            local v198 = tick() + 0.001 * v196.imposterMsBudget;
            local v199 = 0;
            for _, v201 in v196.imposters do
                v199 = v199 + 1;
                if v199 > 100 and v198 < tick() then
                    v198 = tick() + 0.001 * v196.imposterMsBudget;
                    v199 = 0;
                    task.wait();
                end;
                v196:UpdateImposter(v201, v197);
            end;
            v196.impostersUpdating = false;
        end)();
    end;
end;
v1.ImposterSetup = function(v202, v203) --[[ Line: 1274 ]] --[[ Name: ImposterSetup ]]
    -- upvalues: v1 (copy)
    if v202.imposters[v203] ~= nil then
        return;
    else
        local v204 = {
            instance = v203, 
            parent = v203.Parent, 
            animate = true
        };
        local l_v203_Attribute_0 = v203:GetAttribute("animate");
        if l_v203_Attribute_0 ~= nil then
            v204.animate = l_v203_Attribute_0;
        end;
        v204.showModel = true;
        v204.reparent = true;
        v204.distanceCulled = false;
        v204.imposterDistance = v203:GetAttribute("distance") or v1.imposterDistance;
        v204.imposterMaxDistance = v203:GetAttribute("maxdistance") or v1.imposterMaxDistance;
        if v204.imposterMaxDistance < v204.imposterDistance then
            v204.imposterMaxDistance = v204.imposterDistance + 100;
        end;
        v1.imposters[v203] = v204;
        return;
    end;
end;
local function _(v206, v207) --[[ Line: 1304 ]] --[[ Name: CompareAngle ]]
    if math.abs(v206 - v207) > 0.5 then
        return true;
    else
        return false;
    end;
end;
local function _(v209, v210) --[[ Line: 1311 ]] --[[ Name: CompareInt ]]
    if math.abs(v209 - v210) > 0 then
        return true;
    else
        return false;
    end;
end;
local function _(v212, v213) --[[ Line: 1318 ]] --[[ Name: CompareVector ]]
    if math.abs(v212.x - v213.x) > 0.1 or math.abs(v212.y - v213.y) > 0.1 or math.abs(v212.z - v213.z) > 0.1 then
        return true;
    else
        return false;
    end;
end;
local function _(v215, v216) --[[ Line: 1325 ]] --[[ Name: CompareRotation ]]
    local l_LookVector_0 = v215.LookVector;
    local l_LookVector_1 = v216.LookVector;
    if math.abs(l_LookVector_0.x - l_LookVector_1.x) > 0.1 or math.abs(l_LookVector_0.y - l_LookVector_1.y) > 0.1 or math.abs(l_LookVector_0.z - l_LookVector_1.z) > 0.1 then
        return true;
    else
        return false;
    end;
end;
v1.UpdateImposterSize = function(_, v221) --[[ Line: 1329 ]] --[[ Name: UpdateImposterSize ]]
    local l_BoundingBox_0, v223 = v221.instance:GetBoundingBox();
    local v224 = math.max(math.max(v223.x, v223.z) * 1.414213, v223.y) * v221.scale;
    for _, v226 in v221.parts do
        v221.surface:Clone().Parent = v226;
        v226.Size = Vector3.new(1.0E-5, v224, v224);
        v226.Position = l_BoundingBox_0.Position;
        v226.Parent = v221.lodModel;
        v226.Transparency = 1;
    end;
    v221.offset = l_BoundingBox_0.Position - v221.instance:GetModelCFrame().Position;
    v221.storedBounds = v223;
    v221.pivot = v221.instance:GetPivot();
    v221.quadPivot = v221.pivot + v221.pivot.YVector * v221.pivot.YVector:Dot(l_BoundingBox_0.Position - v221.pivot.Position);
    v221.largest = v224;
    return l_BoundingBox_0, v223;
end;
v1.UpdateImposter = function(v227, v228, v229) --[[ Line: 1362 ]] --[[ Name: UpdateImposter ]]
    -- upvalues: v1 (copy)
    local v230 = false;
    if v228.surface == nil then
        if #v228.instance:GetChildren() == 0 then
            return;
        else
            local l_Attribute_0 = v228.instance:GetAttribute("HasImposter");
            if l_Attribute_0 ~= nil and l_Attribute_0 == true and v228.instance:FindFirstChild("Imposter", true) == nil then
                return;
            else
                local l_FirstChild_0 = v228.instance:FindFirstChild("Imposter", true);
                if l_FirstChild_0 == nil then
                    if v227.folder == nil then
                        return;
                    else
                        l_FirstChild_0 = v227.folder:FindFirstChild(v228.instance.Name);
                        if l_FirstChild_0 then
                            l_FirstChild_0 = l_FirstChild_0:Clone();
                            l_FirstChild_0.Parent = v228.instance;
                        else
                            return;
                        end;
                    end;
                end;
                v228.surface = l_FirstChild_0:FindFirstChildWhichIsA("SurfaceAppearance");
                if v228.surface ~= nil then
                    v228.parts = {};
                    for v233 = 1, 16 do
                        local v234 = v1.quads:FindFirstChild("Quad" .. v233):Clone();
                        v228.parts[v233] = v234;
                        v234.Position = v228.instance:GetModelCFrame().Position;
                        v234.CastShadow = l_FirstChild_0.CastShadow;
                    end;
                    v228.scale = 1;
                    local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("scale");
                    if l_l_FirstChild_0_Attribute_0 ~= nil and tonumber(l_l_FirstChild_0_Attribute_0) ~= nil and l_l_FirstChild_0_Attribute_0 > 0 then
                        v228.scale = l_l_FirstChild_0_Attribute_0;
                    end;
                    l_FirstChild_0:Destroy();
                    local l_Model_0 = Instance.new("Model");
                    l_Model_0.Name = v228.instance.Name .. "_Imp";
                    l_Model_0.Parent = v228.parent;
                    v228.lodModel = l_Model_0;
                    v228.descendantAddedSignal = v228.instance.DescendantAdded:Connect(function() --[[ Line: 1425 ]]
                        -- upvalues: v228 (copy)
                        if v228.storedBounds ~= nil then
                            local _, v238 = v228.instance:GetBoundingBox();
                            if (v228.storedBounds - v238).magnitude > 0 then
                                v228.storedBounds = nil;
                            end;
                        end;
                    end);
                    v228.ang = 0;
                end;
            end;
        end;
    end;
    if v228.surface == nil then
        return;
    else
        if v228.storedBounds == nil then
            v227:UpdateImposterSize(v228);
        end;
        local l_Position_1 = v228.pivot.Position;
        local v240 = v229 - l_Position_1;
        local l_showModel_0 = v228.showModel;
        v228.showModel = false;
        local l_Magnitude_1 = v240.Magnitude;
        if v227.debugSupression == true then
            l_Magnitude_1 = 0;
        end;
        if v228.imposterMaxDistance < l_Magnitude_1 then
            if v228.lodModel.Parent ~= nil then
                v228.lodModel.Parent = nil;
                v228.distanceCulled = true;
            end;
        elseif v228.distanceCulled == true then
            v228.distanceCulled = false;
            if v228.lodModel.Parent == nil then
                v228.lodModel.Parent = v228.instance.Parent;
                v228.showModel = true;
            end;
        end;
        if l_Magnitude_1 < v228.imposterDistance then
            v228.showModel = true;
        end;
        if v228.showModel == false and math.abs(v240.Unit.y) > v227.imposterVerticalAngleTolerance then
            v228.showModel = true;
        end;
        if v228.showModel ~= l_showModel_0 then
            if v228.showModel == false then
                v227:AnimateRecord(v228, 1 * v227.imposterAnimSpeed);
            end;
            if v228.showModel == true then
                v228.instance.Parent = v228.parent;
                v227:AnimateRecord(v228, -1 * v227.imposterAnimSpeed);
            end;
        end;
        if v228.showModel == false then
            local v243 = v228.pivot:PointToObjectSpace(v229);
            local v244 = math.atan2(v243.X, v243.Z);
            local v245 = math.floor(v244 / 0.39269908169872414 + 0.5) % 16 + 1;
            local v246;
            if v228.prevPartIndex ~= nil and math.abs(v228.prevPartIndex - v245) > 0 ~= true and math.abs(v228.prevAngle - v244) > 0.5 ~= true then
                local l_prevModelPosition_0 = v228.prevModelPosition;
                v230 = (math.abs(l_prevModelPosition_0.x - l_Position_1.x) > 0.1 or not (math.abs(l_prevModelPosition_0.y - l_Position_1.y) <= 0.1) or math.abs(l_prevModelPosition_0.z - l_Position_1.z) > 0.1) ~= true;
            end;
            if not v230 then
                v227.imposterUpdates = v227.imposterUpdates + 1;
                v246 = v228.parts[v245];
                for v248 = 1, 16 do
                    if v248 == v245 then
                        v228.parts[v248].Transparency = 0;
                    else
                        v228.parts[v248].Transparency = 1;
                    end;
                end;
                v246.CFrame = v228.quadPivot * CFrame.fromOrientation(1.5707963267948966, v244 + 1.5707963267948966, 0);
            end;
            v230 = false;
            v228.prevPartIndex = v245;
            v228.prevAngle = v244;
            v228.prevModelPosition = l_Position_1;
            v228.prevBaseRotation = v228.baseRotation;
        end;
        return;
    end;
end;
v1.Start = function(v249) --[[ Line: 1542 ]] --[[ Name: Start ]]
    -- upvalues: v1 (copy)
    local l_UserInputService_0 = game:GetService("UserInputService");
    if v249.allowDebug then
        l_UserInputService_0.InputBegan:Connect(function(v251) --[[ Line: 1546 ]]
            -- upvalues: v249 (copy)
            if v251.UserInputType == Enum.UserInputType.Keyboard then
                if v251.KeyCode == Enum.KeyCode.F8 then
                    v249.drawDebugText = not v249.drawDebugText;
                end;
                if v251.KeyCode == Enum.KeyCode.F7 then
                    v249.debugSupression = true;
                    local l_Position_2 = game.workspace.CurrentCamera.CFrame.Position;
                    for _, v254 in v249.records do
                        v249:UpdateVis(v254, l_Position_2);
                    end;
                end;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(v255) --[[ Line: 1563 ]]
            -- upvalues: v249 (copy)
            if v255.UserInputType == Enum.UserInputType.Keyboard and v255.KeyCode == Enum.KeyCode.F7 then
                v249.debugSupression = false;
                local l_Position_3 = game.workspace.CurrentCamera.CFrame.Position;
                for _, v258 in v249.records do
                    v249:UpdateVis(v258, l_Position_3);
                end;
            end;
        end);
    end;
    local v259 = 0;
    game:GetService("RunService").Heartbeat:Connect(function(_) --[[ Line: 1577 ]]
        -- upvalues: v259 (ref), v1 (ref)
        if tick() - v259 >= 0.1 then
            v1:Update(tick() - v259);
            v259 = tick();
        end;
    end);
end;
v1:Start();
return v1;