local l_RunService_0 = game:GetService("RunService");
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require(script.mod.logger);
local v3 = require(script.mod.utility);
local v4 = require(script.beam);
local v5 = require(script.spin);
local v6 = require(script.mesh);
local v7 = require(script.bezier);
local v8 = require(script.screen);
local v9 = require(script.particle);
local v10 = require(script.camera_shake);
local v11 = require(script.tween_property);
local v12 = require(script.shockwave_ring);
local v13 = require(script.shockwave_line);
local v14 = require(script.shockwave_debris);
local v15 = require(script.obj.Promise);
local v16 = require(script.obj.ObjectCache);
local l_script_FirstAncestorOfClass_0 = script:FindFirstAncestorOfClass("Plugin");
local v18 = l_RunService_0:IsServer() or l_script_FirstAncestorOfClass_0;
local v19 = {
    scope = {}, 
    setup = false
};
local function v29(v20, v21) --[[ Line: 116 ]] --[[ Name: assembleMeshVFX ]]
    -- upvalues: v19 (copy), v2 (copy), v3 (copy)
    if not v19.setup then
        v2.error("API not initialized");
    end;
    local v22 = v3.getRanomId();
    if v20:IsA("Part") then
        local v23 = v19.caches.shared_part:get(v22);
        v23.CFrame = v20.CFrame;
        local v24 = v23._getReal();
        v3.copyProperties(v20, v24, v3.COPY_PART_PROPERTIES);
        v3.copyProperties(v20, v24, v3.COPY_EXTENDED_PART_PROPERTIES);
        local v25 = v20:Clone();
        for _, v27 in v25:GetChildren() do
            v27.Parent = v24;
        end;
        v25:Destroy();
        table.insert(v21, function() --[[ Line: 140 ]]
            -- upvalues: v19 (ref), v22 (copy)
            v19.caches.shared_part:free(v22);
        end);
        return v23;
    else
        local v28 = v20:Clone();
        v28.Archivable = false;
        v28.Locked = true;
        v28.Parent = workspace.Terrain;
        table.insert(v21, v28);
        return v28;
    end;
end;
v19.init = function(_) --[[ Line: 157 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v18 (copy), v3 (copy), v2 (copy), l_RunService_0 (copy), l_script_FirstAncestorOfClass_0 (copy), v16 (copy), v10 (copy), v7 (copy), v12 (copy), v13 (copy), v14 (copy), l_CollectionService_0 (copy), v6 (copy), v29 (copy)
    if v19.setup then
        return;
    else
        if v18 then
            task.spawn(function() --[[ Line: 163 ]]
                -- upvalues: v3 (ref), v2 (ref)
                local v31 = false;
                local v32 = 0;
                local v33 = nil;
                repeat
                    v32 = v32 + 1;
                    local l_status_0, l_result_0 = pcall(v3.setCollisionGroups, v3.COLLISION_GROUPS);
                    v31 = l_status_0;
                    v33 = l_result_0;
                    if not v31 then
                        task.wait(v32);
                    end;
                until v31 or v32 >= 5;
                if not v31 then
                    v2.warn((("couldn't register necessary collision groups after %* tries with the last error being: %*"):format(v32, v33)));
                end;
            end);
        end;
        v19.setup = true;
        if l_RunService_0:IsServer() and not l_script_FirstAncestorOfClass_0 then
            return;
        else
            shared.vfx = v19;
            local v36 = nil;
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Transparency = 1;
            l_Part_0.Anchored = true;
            l_Part_0.CanCollide = false;
            l_Part_0.CanQuery = false;
            l_Part_0.Locked = true;
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "DO_NOT_REMOVE_ForgeSharedPartCache";
            l_Folder_0.Archivable = false;
            l_Folder_0.Parent = workspace.Terrain;
            v3.protectParent(v19.scope, l_Folder_0);
            v36 = v16.new(l_Part_0, l_Folder_0, {
                size = 150, 
                on_free = function(v39) --[[ Line: 217 ]] --[[ Name: on_free ]]
                    local l_value_0 = v39.value;
                    l_value_0.Transparency = 1;
                    l_value_0.Anchored = true;
                    l_value_0.CanQuery = false;
                    l_value_0.CanCollide = false;
                    l_value_0.CollisionGroup = "ForgeMouseIgnore";
                    l_value_0.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
                    l_value_0.AssemblyAngularVelocity = Vector3.new(0, 0, 0, 0);
                    l_value_0:ClearAllChildren();
                end
            });
            v19.caches = {
                shared_part = v36
            };
            table.insert(v19.scope, function() --[[ Line: 243 ]]
                -- upvalues: v36 (ref)
                v36:destroy();
            end);
            v10.init();
            v7.init(v36);
            v12.init(v36);
            v13.init(v36);
            v14.init(v36);
            l_Part_0 = Instance.new("Decal");
            l_Folder_0 = Instance.new("Part");
            l_Folder_0.Name = "DO_NOT_REMOVE_ForgeTextureCache";
            l_Folder_0.Transparency = 1;
            l_Folder_0.Size = Vector3.new(0, 0, 0, 0);
            l_Folder_0.Archivable = false;
            l_Folder_0.Anchored = true;
            l_Folder_0.CanCollide = false;
            l_Folder_0.CanQuery = false;
            l_Folder_0.Locked = true;
            l_Folder_0.Parent = workspace.Terrain;
            v3.protectParent(v19.scope, l_Folder_0);
            local v42 = v16.new(l_Part_0, l_Folder_0, {
                size = 360, 
                on_free = function(v41) --[[ Line: 272 ]] --[[ Name: on_free ]]
                    v41.value.Texture = "";
                end
            });
            local v43 = {};
            local l_v42_0 = v42 --[[ copy: 4 -> 12 ]];
            local function v77(v45) --[[ Line: 279 ]] --[[ Name: loadTextures ]]
                -- upvalues: v3 (ref), l_v42_0 (copy), l_RunService_0 (ref), l_CollectionService_0 (ref), v43 (copy)
                if v45:IsDescendantOf(workspace.Terrain) then
                    return;
                elseif v3.isMeshVFX(v45) then
                    local l_Start_0 = v45:FindFirstChild("Start");
                    if not l_Start_0 or not l_Start_0:IsA("BasePart") then
                        return;
                    else
                        local v47 = {};
                        local v48 = {};
                        table.insert(v47, v48);
                        local function v66() --[[ Line: 296 ]] --[[ Name: refresh ]]
                            -- upvalues: v3 (ref), v48 (copy), v45 (copy), l_Start_0 (copy), l_v42_0 (ref), l_RunService_0 (ref), l_CollectionService_0 (ref)
                            v3.cleanupScope(v48);
                            local v49, v50 = v3.getMeshDecals(v45, l_Start_0);
                            local function _(v51) --[[ Line: 301 ]] --[[ Name: add ]]
                                -- upvalues: l_v42_0 (ref), v48 (ref)
                                local v52 = typeof(v51) == "Instance" and v51.Texture or v51;
                                if v52 == "" then
                                    return;
                                else
                                    l_v42_0:get(v52).Texture = v52;
                                    table.insert(v48, function() --[[ Line: 311 ]]
                                        -- upvalues: l_v42_0 (ref), v52 (copy)
                                        l_v42_0:free(v52);
                                    end);
                                    return;
                                end;
                            end;
                            for _, v55 in v49 do
                                local v56 = typeof(v55) == "Instance" and v55.Texture or v55;
                                if v56 ~= "" then
                                    l_v42_0:get(v56).Texture = v56;
                                    table.insert(v48, function() --[[ Line: 311 ]]
                                        -- upvalues: l_v42_0 (ref), v56 (copy)
                                        l_v42_0:free(v56);
                                    end);
                                end;
                            end;
                            for v57, v58 in v50 do
                                local v59 = false;
                                if l_RunService_0:IsStudio() then
                                    for _, v61 in l_CollectionService_0:GetTags(v57) do
                                        if v61:match("^_local_flipbook_") then
                                            v59 = true;
                                            break;
                                        end;
                                    end;
                                end;
                                for _, v63 in v58 do
                                    local v64 = ("%*%*"):format(v59 and "rbxtemp://" or "rbxassetid://", v63);
                                    local v65 = typeof(v64) == "Instance" and v64.Texture or v64;
                                    if v65 ~= "" then
                                        l_v42_0:get(v65).Texture = v65;
                                        table.insert(v48, function() --[[ Line: 311 ]]
                                            -- upvalues: l_v42_0 (ref), v65 (copy)
                                            l_v42_0:free(v65);
                                        end);
                                    end;
                                end;
                            end;
                        end;
                        v66();
                        if l_RunService_0:IsStudio() then
                            local v67 = v3.reboundfn(1, v66);
                            table.insert(v47, l_Start_0.DescendantAdded:Connect(v67));
                            table.insert(v47, l_Start_0.DescendantRemoving:Connect(v67));
                        end;
                        v43[v45] = v47;
                        return;
                    end;
                else
                    local v68 = {};
                    local v69 = {};
                    table.insert(v68, v69);
                    local function v75() --[[ Line: 354 ]] --[[ Name: refresh ]]
                        -- upvalues: v3 (ref), v69 (copy), l_v42_0 (ref), v45 (copy)
                        v3.cleanupScope(v69);
                        local function v72(v70) --[[ Line: 357 ]] --[[ Name: check ]]
                            -- upvalues: l_v42_0 (ref), v69 (ref)
                            if not v70:IsA("ParticleEmitter") then
                                return;
                            else
                                local l_Texture_0 = v70.Texture;
                                if l_Texture_0 == "" then
                                    return;
                                else
                                    l_v42_0:get(l_Texture_0).Texture = l_Texture_0;
                                    table.insert(v69, function() --[[ Line: 371 ]]
                                        -- upvalues: l_v42_0 (ref), l_Texture_0 (copy)
                                        l_v42_0:free(l_Texture_0);
                                    end);
                                    return;
                                end;
                            end;
                        end;
                        v72(v45);
                        for _, v74 in v45:GetDescendants() do
                            v72(v74);
                        end;
                    end;
                    v75();
                    if l_RunService_0:IsStudio() then
                        local v76 = v3.reboundfn(1, v75);
                        table.insert(v68, v45.DescendantAdded:Connect(v76));
                        table.insert(v68, v45.DescendantRemoving:Connect(v76));
                    end;
                    v43[v45] = v68;
                    return;
                end;
            end;
            for _, v79 in l_CollectionService_0:GetTagged(v3.TEXTURE_LOAD_TAG) do
                v77(v79);
            end;
            l_CollectionService_0:GetInstanceAddedSignal(v3.TEXTURE_LOAD_TAG):Connect(v77);
            l_CollectionService_0:GetInstanceRemovedSignal(v3.TEXTURE_LOAD_TAG):Connect(function(v80) --[[ Line: 401 ]]
                -- upvalues: v43 (copy), v3 (ref)
                local v81 = v43[v80];
                if v81 then
                    v3.cleanupScope(v81);
                    v43[v80] = nil;
                end;
            end);
            local l_v42_1 = v42 --[[ copy: 4 -> 13 ]];
            table.insert(v19.scope, function() --[[ Line: 410 ]]
                -- upvalues: l_v42_1 (copy), v43 (copy), v3 (ref)
                l_v42_1:destroy();
                for _, v84 in v43 do
                    v3.cleanupScope(v84);
                end;
            end);
            l_Part_0 = {};
            l_Folder_0 = function(v85) --[[ Line: 422 ]] --[[ Name: removeEnabledEffect ]]
                -- upvalues: l_Part_0 (copy), v3 (ref)
                local v86 = l_Part_0[v85];
                if v86 then
                    v3.cleanupScope(v86);
                end;
                l_Part_0[v85] = nil;
            end;
            v42 = function(v87) --[[ Line: 432 ]] --[[ Name: addEnabledEffect ]]
                -- upvalues: v3 (ref), l_Part_0 (copy), v42 (copy), l_RunService_0 (ref), v19 (ref), v6 (ref), v29 (ref), v7 (ref)
                local v88 = v3.isMeshVFX(v87);
                local v89 = v87:HasTag(v3.BEZIER_TAG);
                if not v88 and not v89 then
                    return;
                else
                    local v90 = {};
                    local v91 = {};
                    table.insert(v90, v91);
                    l_Part_0[v87] = v90;
                    table.insert(v90, v87.AncestryChanged:Connect(function() --[[ Line: 449 ]]
                        -- upvalues: v87 (copy), l_Part_0 (ref), v42 (ref), v3 (ref)
                        if v87:IsDescendantOf(workspace) or v87.Parent and v87.Parent:HasTag("AllowEmitting") then
                            if not l_Part_0[v87] then
                                v42(v87);
                                return;
                            end;
                        else
                            local l_v87_0 = v87;
                            local v93 = l_Part_0[l_v87_0];
                            if v93 then
                                v3.cleanupScope(v93);
                            end;
                            l_Part_0[l_v87_0] = nil;
                        end;
                    end));
                    if not v87:IsDescendantOf(workspace) and if v87.Parent then not v87.Parent:HasTag("AllowEmitting") else false then
                        return;
                    else
                        local function v104() --[[ Line: 466 ]] --[[ Name: onEnabled ]]
                            -- upvalues: v3 (ref), v87 (copy), v91 (copy), l_RunService_0 (ref), v19 (ref), v88 (copy), v6 (ref), v29 (ref), v89 (copy), v7 (ref)
                            if v3.getAttribute(v87, "Enabled", true) then
                                local v94 = 0;
                                table.insert(v91, l_RunService_0.RenderStepped:Connect(function() --[[ Line: 474 ]]
                                    -- upvalues: v3 (ref), v87 (ref), v94 (ref), v19 (ref), v88 (ref), v6 (ref), v29 (ref), v89 (ref), v7 (ref)
                                    local v95 = v3.getAttribute(v87, "Rate", 5);
                                    local v96 = v87:GetAttribute("SpeedOverride") or 1;
                                    if v96 == 0 then
                                        return;
                                    elseif os.clock() - v94 <= 1 / v95 / v96 then
                                        return;
                                    else
                                        local v97 = {
                                            depth = 0
                                        };
                                        local function v98() --[[ Line: 489 ]] --[[ Name: cleanup ]]
                                            -- upvalues: v3 (ref), v97 (copy)
                                            v3.cleanupScope(v97);
                                        end;
                                        table.insert(v19.scope, v98);
                                        if v88 then
                                            local l_Start_1 = v87:FindFirstChild("Start");
                                            if not l_Start_1 then
                                                v87:RemoveTag(v3.ENABLED_VFX_TAG);
                                                return;
                                            else
                                                v94 = os.clock();
                                                for _ = 1, v3.getAttribute(v87, "EmitCount", 1) do
                                                    v3.try(("failed to emit mesh '%*' with error: %%s"):format((v87:GetFullName())), v6.emit, v87, v29(l_Start_1, v97), v97, 1, true);
                                                end;
                                            end;
                                        elseif v89 then
                                            local l_Part_1 = v87:FindFirstChildOfClass("Part");
                                            if not l_Part_1 then
                                                return;
                                            else
                                                v94 = os.clock();
                                                local v102 = l_Part_1:Clone();
                                                v102.Locked = true;
                                                table.insert(v97, v102);
                                                v3.try(("failed to emit bezier '%*' with error: %%s"):format((v87:GetFullName())), v7.emit, v87, v102, v97, true);
                                            end;
                                        end;
                                        local v103 = table.find(v19.scope, v98);
                                        if v103 then
                                            table.remove(v19.scope, v103);
                                        end;
                                        v3.cleanupScope(v97);
                                        return;
                                    end;
                                end));
                                return;
                            else
                                v3.cleanupScope(v91);
                                return;
                            end;
                        end;
                        table.insert(v90, v87:GetAttributeChangedSignal("Enabled"):Connect(v104));
                        v104();
                        return;
                    end;
                end;
            end;
            for _, v106 in l_CollectionService_0:GetTagged(v3.ENABLED_VFX_TAG) do
                v42(v106);
            end;
            l_CollectionService_0:GetInstanceAddedSignal(v3.ENABLED_VFX_TAG):Connect(v42);
            l_CollectionService_0:GetInstanceRemovedSignal(v3.ENABLED_VFX_TAG):Connect(l_Folder_0);
            table.insert(v19.scope, function() --[[ Line: 566 ]]
                -- upvalues: l_Part_0 (copy), v3 (ref)
                for _, v108 in l_Part_0 do
                    v3.cleanupScope(v108);
                end;
            end);
            return;
        end;
    end;
end;
v19.deinit = function() --[[ Line: 574 ]] --[[ Name: deinit ]]
    -- upvalues: v19 (copy), l_RunService_0 (copy), l_script_FirstAncestorOfClass_0 (copy), v3 (copy), v7 (copy), v10 (copy), v12 (copy), v13 (copy), v14 (copy)
    if not v19.setup then
        return;
    else
        v19.setup = false;
        shared.vfx = nil;
        if l_RunService_0:IsServer() and not l_script_FirstAncestorOfClass_0 then
            return;
        else
            v3.cleanupScope(v19.scope);
            v7.deinit();
            v10.deinit();
            v12.deinit();
            v13.deinit();
            v14.deinit();
            return;
        end;
    end;
end;
v19.emit = function(v109, ...) --[[ Line: 596 ]] --[[ Name: emit ]]
    -- upvalues: v19 (copy), v2 (copy), v15 (copy), v3 (copy), v9 (copy), v4 (copy), v7 (copy), v6 (copy), v29 (copy), v5 (copy), v10 (copy), v11 (copy), v12 (copy), v14 (copy), v13 (copy), v8 (copy)
    if not v19.setup then
        v2.error("not initialized");
    end;
    local v110 = {};
    local v111 = {};
    local v112 = 1;
    local function v131(v113, v114) --[[ Line: 606 ]] --[[ Name: emit ]]
        -- upvalues: v15 (ref), v3 (ref), v111 (copy), v110 (copy), v9 (ref), v112 (ref), v4 (ref), v7 (ref), v6 (ref), v29 (ref), v5 (ref), v10 (ref), v11 (ref), v12 (ref), v14 (ref), v13 (ref)
        return v15.new(function(v115) --[[ Line: 607 ]]
            -- upvalues: v114 (copy), v113 (copy), v3 (ref), v111 (ref), v110 (ref), v9 (ref), v112 (ref), v4 (ref), v7 (ref), v15 (ref), v6 (ref), v29 (ref), v5 (ref), v10 (ref), v11 (ref), v12 (ref), v14 (ref), v13 (ref)
            (function() --[[ Line: 608 ]] --[[ Name: run ]]
                -- upvalues: v114 (ref), v113 (ref), v3 (ref), v111 (ref), v110 (ref), v9 (ref), v112 (ref), v4 (ref), v7 (ref), v15 (ref), v6 (ref), v29 (ref), v5 (ref), v10 (ref), v11 (ref), v12 (ref), v14 (ref), v13 (ref)
                local v116 = {
                    depth = v114
                };
                if v113:IsA("ParticleEmitter") then
                    if not v113:IsDescendantOf(workspace) then
                        local v117, v118 = v3.cloneParticleAncestry(v113, v111);
                        if not v117 then
                            return;
                        else
                            table.insert(v116, v118);
                            local v119 = v113:Clone();
                            v119.Archivable = false;
                            v119.Parent = v117;
                            if not v110[v118] then
                                v118.Parent = workspace.Terrain;
                            end;
                            if not v110[v118] then
                                v110[v118] = 1;
                            else
                                local l_v110_0 = v110;
                                l_v110_0[v118] = l_v110_0[v118] + 1;
                            end;
                            v3.try(("failed to emit particle '%*' with error: %%s"):format((v113:GetFullName())), v9.emit, v113, v119, v116, v112);
                            local l_v110_1 = v110;
                            l_v110_1[v118] = l_v110_1[v118] - 1;
                            if v110[v118] <= 0 then
                                v3.cleanupScope(v116);
                            end;
                        end;
                    else
                        v3.try(("failed to emit particle '%*' with error: %%s"):format((v113:GetFullName())), v9.emit, v113, v113, v116, v112);
                        v3.cleanupScope(v116);
                    end;
                elseif v113:IsA("Beam") then
                    local v122 = v113:Clone();
                    v122.Archivable = false;
                    v122.Parent = workspace.Terrain;
                    table.insert(v116, v122);
                    v3.try(("failed to emit beam '%*' with error: %%s"):format((v113:GetFullName())), v4.emit, v113, v122, v116, v112);
                    v3.cleanupScope(v116);
                elseif v113:IsA("Trail") then
                    v113.Enabled = true;
                elseif v113:HasTag(v3.BEZIER_TAG) then
                    local l_Part_2 = v113:FindFirstChildOfClass("Part");
                    if not l_Part_2 then
                        return;
                    else
                        if v113:GetAttribute("Enabled") then
                            v113:SetAttribute("Enabled", false);
                        end;
                        local v124 = l_Part_2:Clone();
                        v124.Locked = true;
                        table.insert(v116, v124);
                        v3.try(("failed to emit bezier '%*' with error: %%s"):format((v113:GetFullName())), v7.emit, v113, v124, v116);
                        v3.cleanupScope(v116);
                    end;
                elseif v3.isMeshVFX(v113) then
                    local l_Start_2 = v113:FindFirstChild("Start");
                    if not l_Start_2 then
                        return;
                    else
                        if v113:GetAttribute("Enabled") then
                            v113:SetAttribute("Enabled", false);
                        end;
                        local v126 = {};
                        for _ = 1, v3.getAttribute(v113, "EmitCount", 1) do
                            table.insert(v126, v15.new(function(v128) --[[ Line: 714 ]]
                                -- upvalues: v3 (ref), v113 (ref), v6 (ref), v29 (ref), l_Start_2 (copy), v116 (copy), v112 (ref)
                                v3.try(("failed to emit mesh '%*' with error: %%s"):format((v113:GetFullName())), v6.emit, v113, v29(l_Start_2, v116), v116, v112);
                                v128();
                            end));
                        end;
                        v15.all(v126):await();
                        v3.cleanupScope(v116);
                    end;
                elseif v113:IsA("Model") then
                    if v3.lock(v113) then
                        return;
                    else
                        v3.try(("failed to emit spinning model '%*' with error: %%s"):format((v113:GetFullName())), v5.emit, v113, v116);
                        v3.cleanupScope(v116);
                        v3.unlock(v113);
                    end;
                elseif v113:IsA("RayValue") then
                    if v113:HasTag(v3.SCREENSHAKE_TAG) then
                        v3.try(("failed to emit camera shake '%*' with error: %%s"):format((v113:GetFullName())), v10.emit, v113, v116);
                        v3.cleanupScope(v116);
                    elseif not v113.Parent or v3.lock(v113) then
                        return;
                    else
                        v3.try(("failed to emit tween property '%*' with error: %%s"):format((v113:GetFullName())), v11.emit, v113.Parent, v113, v116);
                        v3.unlock(v113);
                        v3.cleanupScope(v116);
                    end;
                end;
                if v113:IsA("Part") then
                    local v129 = v3.findFirstClassWithTag(v113, "Attachment", v3.SHOCKWAVE_TAG);
                    if v129 then
                        local l_Name_0 = v113.Parent.Name;
                        if l_Name_0 == "Rings" then
                            v3.try(("failed to emit shockwave ring '%*' with error: %%s"):format((v113:GetFullName())), v12.emit, v129, v113, v116);
                            v3.cleanupScope(v116);
                            return;
                        elseif l_Name_0 == "Debris" then
                            v3.try(("failed to emit shockwave debris '%*' with error: %%s"):format((v113:GetFullName())), v14.emit, v129, v113, v116);
                            v3.cleanupScope(v116);
                            return;
                        elseif l_Name_0 == "Lines" then
                            v3.try(("failed to emit shockwave line '%*' with error: %%s"):format((v113:GetFullName())), v13.emit, v129, v113, v116);
                            v3.cleanupScope(v116);
                        end;
                    end;
                end;
            end)();
            v115();
        end);
    end;
    local v132 = {
        ...
    };
    if typeof(v109) ~= "number" then
        table.insert(v132, v109);
    else
        v112 = v109;
    end;
    local v133 = {};
    local function v134(v135, v136, v137) --[[ Line: 827 ]] --[[ Name: emitAll ]]
        -- upvalues: v3 (ref), v8 (ref), v134 (copy), v133 (copy), v15 (ref), v131 (copy)
        for _, v139 in v136 do
            if v139:IsA("BasePart") and v139:GetAttribute("Enabled") and not v3.findFirstClassWithTag(v139, "Attachment", v3.SHOCKWAVE_TAG) then
                if not v3.lock(v139) then
                    local l_v139_FirstAncestorOfClass_0 = v139:FindFirstAncestorOfClass("Model");
                    if not l_v139_FirstAncestorOfClass_0 or l_v139_FirstAncestorOfClass_0:GetAttribute("SpinRotation") == Vector3.new(0, 0, 0, 0) and l_v139_FirstAncestorOfClass_0:GetAttribute("Scale_Start") == 1 and l_v139_FirstAncestorOfClass_0:GetAttribute("Scale_End") == 1 then
                        local v141 = coroutine.running();
                        local v142 = {
                            depth = v135
                        };
                        if v3.try(("failed to emit screen effect '%*' with error: %%s"):format((v139:GetFullName())), v8.emit, v139, v142) then
                            if #v139:GetDescendants() == 0 then
                                v3.cleanupScope(v142);
                                return;
                            else
                                local v143 = {};
                                v134(v135 + 1, v139:GetChildren(), v143);
                                table.insert(v133, v15.all(v143):finally(function() --[[ Line: 873 ]]
                                    -- upvalues: v3 (ref), v139 (copy), v141 (copy), v142 (copy)
                                    v3.unlock(v139, v141);
                                    v3.cleanupScope(v142);
                                end));
                            end;
                        end;
                    end;
                end;
            else
                table.insert(v137, v131(v139, v135));
                if not v139:HasTag(v3.BEZIER_TAG) and not v3.isMeshVFX(v139) and (not v139:IsA("BasePart") or not v3.findFirstClassWithTag(v139, "Attachment", v3.SHOCKWAVE_TAG)) then
                    v134(v135 + 1, v139:GetChildren(), v137);
                end;
            end;
        end;
    end;
    v134(0, v132, v133);
    return {
        Finished = v15.all(v133)
    };
end;
return v19;