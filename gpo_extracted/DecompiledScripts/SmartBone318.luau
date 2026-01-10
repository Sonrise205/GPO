local l_CollectionService_0 = game:GetService("CollectionService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Components_0 = script:WaitForChild("Components");
local l_Dependencies_0 = script:WaitForChild("Dependencies");
local l_ImOverlay_0 = require(l_Dependencies_0:WaitForChild("Debug"):WaitForChild("ImOverlay"));
local l_Config_0 = require(l_Dependencies_0:WaitForChild("Config"));
local l_Frustum_0 = require(l_Dependencies_0:WaitForChild("Frustum"));
local l_Utilities_0 = require(l_Dependencies_0:WaitForChild("Utilities"));
local v10 = nil;
local l_Bone_0 = require(l_Components_0:WaitForChild("Bone"));
local l_BoneTree_0 = require(l_Components_0:WaitForChild("BoneTree"));
local l_ColliderObject_0 = require(l_Components_0:WaitForChild("Collision"):WaitForChild("ColliderObject"));
local l_Runtime_0 = l_Dependencies_0:WaitForChild("Runtime");
local function _(v15, v16) --[[ Line: 22 ]] --[[ Name: CopyPasteAttributes ]]
    for v17, v18 in v15:GetAttributes() do
        v16:SetAttribute(v17, v18);
    end;
end;
local l_SB_INDENT_LOG_0 = l_Utilities_0.SB_INDENT_LOG;
local l_SB_UNINDENT_LOG_0 = l_Utilities_0.SB_UNINDENT_LOG;
local l_SB_VERBOSE_LOG_0 = l_Utilities_0.SB_VERBOSE_LOG;
local l_SB_VERBOSE_WARN_0 = l_Utilities_0.SB_VERBOSE_WARN;
local v24 = {};
v24.__index = v24;
v24.new = function() --[[ Line: 73 ]] --[[ Name: new ]]
    -- upvalues: l_HttpService_0 (copy), v24 (copy)
    return (setmetatable({
        ID = l_HttpService_0:GenerateGUID(false), 
        BoneTrees = {}, 
        ColliderObjects = {}, 
        ShouldDestroy = false
    }, v24));
end;
v24.m_AppendBone = function(_, v26, v27, v28, v29) --[[ Line: 96 ]] --[[ Name: m_AppendBone ]]
    -- upvalues: l_Utilities_0 (copy), l_Bone_0 (copy), l_SB_VERBOSE_LOG_0 (copy)
    local v30 = l_Utilities_0.GatherBoneSettings(v27);
    local v31 = l_Bone_0.new(v27, v26.Root, v26.RootPart);
    for v32, v33 in v30 do
        v31[v32] = v33 ~= "\194\172" and v33 or nil;
    end;
    local v34 = v26.Bones[v28];
    if v28 > 0 then
        local l_Magnitude_0 = (v34.Position - v31.Position).Magnitude;
        v31.FreeLength = l_Magnitude_0;
        v31.Weight = l_Magnitude_0 * 0.7;
        v31.HeirarchyLength = v29;
        v34.HasChild = true;
    end;
    if v29 <= v26.Settings.AnchorDepth then
        l_SB_VERBOSE_LOG_0("Anchoring bone");
        v31.Anchored = true;
    end;
    v31.ParentIndex = v28;
    table.insert(v26.Bones, v31);
end;
v24.m_CreateBoneTree = function(v36, v37, v38) --[[ Line: 135 ]] --[[ Name: m_CreateBoneTree ]]
    -- upvalues: l_BoneTree_0 (copy), l_Utilities_0 (copy), l_SB_VERBOSE_LOG_0 (copy), l_SB_INDENT_LOG_0 (copy), l_SB_UNINDENT_LOG_0 (copy)
    local v39 = l_BoneTree_0.new(v38, v37, l_Utilities_0.GatherObjectSettings(v37));
    l_SB_VERBOSE_LOG_0((("Creating bone tree %*; %*"):format(v37.Name, v38.Name)));
    l_SB_INDENT_LOG_0();
    local function v40(v41, v42, v43) --[[ Line: 141 ]] --[[ Name: AddChildren ]]
        -- upvalues: l_SB_VERBOSE_LOG_0 (ref), l_SB_INDENT_LOG_0 (ref), v36 (copy), v39 (copy), v40 (copy), l_SB_UNINDENT_LOG_0 (ref)
        l_SB_VERBOSE_LOG_0((("Adding bone: %*; %*; %*"):format(v41.Name, v42, v43)));
        l_SB_INDENT_LOG_0();
        local l_v41_Children_0 = v41:GetChildren();
        local v45 = false;
        for _, v47 in l_v41_Children_0 do
            if v47:IsA("Bone") then
                v36:m_AppendBone(v39, v47, v42, v43);
                v40(v47, #v39.Bones, v43 + 1);
                v45 = true;
            end;
        end;
        if string.sub(v41.Name, #v41.Name - 3, #v41.Name) == "_end" or string.sub(v41.Name, #v41.Name - 4, #v41.Name) == "_Tail" then
            v45 = true;
        end;
        if not v45 then
            l_SB_VERBOSE_LOG_0("Adding tail bone");
            local l_Parent_0 = v41.Parent;
            local v49 = l_Parent_0:IsA("Bone") and l_Parent_0.WorldPosition or l_Parent_0.Position;
            local v50 = v41.WorldCFrame + v41.WorldCFrame.UpVector.Unit * (v41.WorldPosition - v49).Magnitude;
            local l_Bone_1 = Instance.new("Bone");
            l_Bone_1.Parent = v41;
            l_Bone_1.Name = v41.Name .. "_Tail";
            l_Bone_1.WorldCFrame = v50;
            for v52, v53 in v41:GetAttributes() do
                l_Bone_1:SetAttribute(v52, v53);
            end;
            v36:m_AppendBone(v39, l_Bone_1, #v39.Bones, v43);
        end;
        l_SB_UNINDENT_LOG_0();
    end;
    v36:m_AppendBone(v39, v38, 0, 0);
    v40(v38, 1, 1);
    table.insert(v36.BoneTrees, v39);
    l_SB_UNINDENT_LOG_0();
end;
v24.m_UpdateViewFrustum = function(v54) --[[ Line: 194 ]] --[[ Name: m_UpdateViewFrustum ]]
    -- upvalues: l_Config_0 (copy), l_Frustum_0 (copy)
    if shared.FrameCounter % l_Config_0.FRUSTUM_FREQ ~= 0 then
        return;
    else
        local v55, v56, v57, v58, v59, v60, v61, v62, v63 = l_Frustum_0.GetCFrames(workspace.CurrentCamera, l_Config_0.FAR_PLANE);
        for _, v65 in v54.BoneTrees do
            local v66 = {
                CFrame = v65.BoundingBoxCFrame, 
                Size = v65.BoundingBoxSize
            };
            v65.InView = l_Frustum_0.ObjectInFrustum(v66, v55, v56, v57, v58, v59, v60, v61, v62, v63);
        end;
        return;
    end;
end;
v24.m_CleanColliders = function(v67) --[[ Line: 215 ]] --[[ Name: m_CleanColliders ]]
    -- upvalues: l_SB_VERBOSE_WARN_0 (copy), l_SB_INDENT_LOG_0 (copy), l_SB_UNINDENT_LOG_0 (copy)
    local v68 = false;
    if #v67.ColliderObjects ~= 0 then
        for v69, v70 in v67.ColliderObjects do
            if #v70.Colliders == 0 or v70.Destroyed == true then
                l_SB_VERBOSE_WARN_0("Deleting Collider Object");
                l_SB_INDENT_LOG_0();
                v70:Destroy();
                l_SB_UNINDENT_LOG_0();
                table.remove(v67.ColliderObjects, v69);
                v68 = true;
            end;
        end;
    end;
    if not v68 then

    end;
end;
v24.m_UpdateBoneTree = function(v71, v72, v73, v74) --[[ Line: 247 ]] --[[ Name: m_UpdateBoneTree ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    if v72.Destroyed then
        v72:Destroy();
        table.remove(v71.BoneTrees, v73);
        return;
    else
        v72:PreUpdate(v74);
        if not v72.InView or math.floor(v72.UpdateRate) == 0 or not v72.InWorkspace then
            local l_IsSkippingUpdates_0 = v72.IsSkippingUpdates;
            v72:SkipUpdate();
            if not l_IsSkippingUpdates_0 then
                task.synchronize();
                v72:ApplyTransform();
                l_SB_VERBOSE_LOG_0((("Skipping BoneTree, InView: %*, Update Rate == 0: %*, InWorkspace: %*"):format(v72.InView, math.floor(v72.UpdateRate) == 0, v72.InWorkspace)));
            end;
            return;
        else
            for _, v77 in v71.ColliderObjects do
                v77:Step();
            end;
            local v78 = 1 / v72.UpdateRate;
            local v79 = false;
            v72.AccumulatedDelta = v72.AccumulatedDelta + v74;
            while v78 < v72.AccumulatedDelta do
                v72.AccumulatedDelta = v72.AccumulatedDelta - v78;
                v79 = true;
                v72:StepPhysics(v78);
                v72:Constrain(v71.ColliderObjects, v78);
                v72:SolveTransform(v78);
            end;
            if v79 then
                task.synchronize();
                v72:ApplyTransform();
            end;
            return;
        end;
    end;
end;
v24.m_CheckDestroy = function(v80) --[[ Line: 312 ]] --[[ Name: m_CheckDestroy ]]
    v80.ShouldDestroy = false;
    if #v80.BoneTrees == 0 then
        v80.ShouldDestroy = true;
        return true;
    else
        return false;
    end;
end;
v24.LoadObject = function(v81, v82) --[[ Line: 328 ]] --[[ Name: LoadObject ]]
    local l_v82_Attribute_0 = v82:GetAttribute("Roots");
    if not l_v82_Attribute_0 then
        return;
    else
        local v84 = l_v82_Attribute_0:split(",");
        local v85 = {};
        for _, v87 in v82:QueryDescendants("Bone") do
            if v85[v87.Name] then
                warn((("[SmartBone2::LoadObject] Duplicate bones of name: %* in RootPart: %*"):format(v87.Name, v82.Name)));
            else
                v85[v87.Name] = v87;
            end;
        end;
        for _, v89 in v84 do
            local v90 = v85[v89];
            if not v90 then
                warn((("[SmartBone2::LoadObject] Couldn't find Root Bone of name: %* in RootPart: %*"):format(v89, v82.Name)));
            else
                v81:m_CreateBoneTree(v82, v90);
            end;
        end;
        return;
    end;
end;
v24.LoadColliderModule = function(v91, v92, v93) --[[ Line: 365 ]] --[[ Name: LoadColliderModule ]]
    -- upvalues: l_HttpService_0 (copy), l_ColliderObject_0 (copy)
    assert(v92, "[SmartBone2::LoadColliderModule] No collider module passed in");
    local v94 = require(v92);
    local v95 = l_HttpService_0:JSONDecode(v94);
    local v96 = l_ColliderObject_0.new(v95, v93);
    table.insert(v91.ColliderObjects, v96);
end;
v24.LoadRawCollider = function(v97, v98, v99) --[[ Line: 380 ]] --[[ Name: LoadRawCollider ]]
    -- upvalues: l_ColliderObject_0 (copy)
    local v100 = l_ColliderObject_0.new(v98, v99);
    table.insert(v97.ColliderObjects, v100);
end;
v24.SkipUpdate = function(v101) --[[ Line: 388 ]] --[[ Name: SkipUpdate ]]
    for _, v103 in v101.BoneTrees do
        v103:SkipUpdate();
    end;
end;
v24.StepBoneTrees = function(v104, v105) --[[ Line: 399 ]] --[[ Name: StepBoneTrees ]]
    -- upvalues: l_SB_VERBOSE_WARN_0 (copy)
    if v104:m_CheckDestroy() then
        return;
    elseif v105 <= 0 then
        l_SB_VERBOSE_WARN_0("DeltaTime is zero or sub zero, not updating.");
        return;
    else
        v104:m_CleanColliders();
        v104:m_UpdateViewFrustum();
        for v106, v107 in v104.BoneTrees do
            v104:m_UpdateBoneTree(v107, v106, v105);
        end;
        return;
    end;
end;
v24.DrawDebug = function(v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121) --[[ Line: 432 ]] --[[ Name: DrawDebug ]]
    for _, v123 in v108.BoneTrees do
        v123:DrawDebug(v110, v111, v112, v113, v114, v119, v120, v121);
    end;
    if v109 then
        for _, v125 in v108.ColliderObjects do
            v125:DrawDebug(v115, v116, v117, v118);
        end;
    end;
end;
v24.DrawOverlay = function(v126, v127) --[[ Line: 471 ]] --[[ Name: DrawOverlay ]]
    -- upvalues: l_Config_0 (copy)
    if not l_Config_0.DEBUG_OVERLAY_ENABLED then
        return;
    else
        local v128 = Color3.new(1, 0.431373, 0.713725);
        local v129 = Color3.new(1, 1, 1);
        local v130 = Color3.new(0.486275, 0.431373, 1);
        local v131 = Color3.new(1, 1, 1);
        v127.Begin(("SmartBone Instance ID: %*"):format(v126.ID), v128, v129);
        v127.Text((("Frame Counter: %*"):format(shared.FrameCounter)));
        if l_Config_0.DEBUG_OVERLAY_TREE then
            for v132, v133 in v126.BoneTrees do
                if l_Config_0.DEBUG_OVERLAY_MAX_TREES <= 0 or l_Config_0.DEBUG_OVERLAY_TREE_OFFSET + l_Config_0.DEBUG_OVERLAY_MAX_TREES > v132 then
                    if v132 >= l_Config_0.DEBUG_OVERLAY_TREE_OFFSET then
                        v127.Begin(("Bone Tree %*"):format(v132), v130, v131);
                        v133:DrawOverlay(v127);
                        v127.End();
                    end;
                else
                    break;
                end;
            end;
        end;
        v127.End();
        return;
    end;
end;
v24.Destroy = function(v134) --[[ Line: 507 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    l_SB_VERBOSE_LOG_0("Deleting SmartBone Object");
    for _, v136 in v134.BoneTrees do
        v136:Destroy();
    end;
    for _, v138 in v134.ColliderObjects do
        v138:Destroy();
    end;
    setmetatable(v134, nil);
end;
v24.Start = function() --[[ Line: 525 ]] --[[ Name: Start ]]
    -- upvalues: l_RunService_0 (copy), v24 (copy), l_Config_0 (copy), l_Players_0 (copy), v10 (ref), l_CollectionService_0 (copy), l_SB_VERBOSE_LOG_0 (copy), l_SB_INDENT_LOG_0 (copy), l_Utilities_0 (copy), l_Runtime_0 (copy), l_SB_UNINDENT_LOG_0 (copy), l_ImOverlay_0 (copy)
    if not l_RunService_0:IsClient() then
        warn("Smartbone.Start() can only be called in client context.");
        return;
    elseif v24.Running then
        warn("Cannot call Smartbone.Start() multiple times");
        return;
    else
        if l_Config_0.STARTUP_PRINT_ENABLED or l_Config_0.LOG_VERBOSE then
            print((("SmartBone2 v%* Starting"):format(l_Config_0.VERSION)));
        end;
        v24.Running = true;
        local l_PlayerScripts_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerScripts");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "SmartBone-Actors";
        l_Folder_0.Parent = l_PlayerScripts_0;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = "OverlayEvent";
        l_BindableEvent_0.Parent = script;
        l_BindableEvent_0.Event:Connect(function(v142, ...) --[[ Line: 553 ]]
            -- upvalues: l_Config_0 (ref), v10 (ref)
            if not l_Config_0.DEBUG_OVERLAY_ENABLED then
                return;
            elseif v142 == "Text" then
                v10:Text(...);
                return;
            elseif v142 == "Begin" then
                v10:Begin(...);
                return;
            else
                if v142 == "End" then
                    v10:End();
                end;
                return;
            end;
        end);
        local v143 = {};
        local v144 = {};
        local function _() --[[ Line: 570 ]] --[[ Name: GetActor ]]
            -- upvalues: v144 (copy)
            return table.remove(v144) or Instance.new("Actor");
        end;
        local function v148(v146) --[[ Line: 575 ]] --[[ Name: OnObjectFreed ]]
            -- upvalues: v143 (copy), v144 (copy)
            local v147 = v143[v146];
            v143[v146] = nil;
            if not v147 then
                return;
            else
                v147.Name = "Pooled Actor";
                table.insert(v144, v147);
                return;
            end;
        end;
        local function v153() --[[ Line: 588 ]] --[[ Name: GatherColliders ]]
            -- upvalues: l_CollectionService_0 (ref), l_SB_VERBOSE_LOG_0 (ref), l_Config_0 (ref)
            local v149 = {
                Key = {}, 
                Raw = {}
            };
            for _, v151 in l_CollectionService_0:GetTagged("SmartCollider") do
                if v151:IsA("BasePart") then
                    local l_v151_Attribute_0 = v151:GetAttribute("ColliderKey");
                    if l_v151_Attribute_0 then
                        l_v151_Attribute_0 = tostring(l_v151_Attribute_0);
                        if not v149.Key[l_v151_Attribute_0] then
                            v149.Key[l_v151_Attribute_0] = {};
                        end;
                        table.insert(v149.Key[l_v151_Attribute_0], v151);
                    end;
                    l_SB_VERBOSE_LOG_0((("Adding collider: %*, Collider Key: %*"):format(v151.Name, l_v151_Attribute_0)));
                    table.insert(v149.Raw, v151);
                    if l_Config_0.YIELD_ON_COLLIDER_GATHER then
                        task.wait();
                    end;
                end;
            end;
            return v149;
        end;
        local function v165(v154) --[[ Line: 622 ]] --[[ Name: SetupObject ]]
            -- upvalues: l_SB_VERBOSE_LOG_0 (ref), l_SB_INDENT_LOG_0 (ref), v153 (copy), l_Utilities_0 (ref), v144 (copy), l_Runtime_0 (ref), l_Folder_0 (copy), v143 (copy), l_SB_UNINDENT_LOG_0 (ref)
            if not v154:IsA("BasePart") then
                return;
            else
                l_SB_VERBOSE_LOG_0((("Setup Object: %*"):format(v154.Name)));
                l_SB_INDENT_LOG_0();
                local v155 = v153();
                local l_v154_Attribute_0 = v154:GetAttribute("ColliderKey");
                local v157 = nil;
                v157 = if l_v154_Attribute_0 then v155.Key[tostring(l_v154_Attribute_0)] or {} else v155.Raw or {};
                local v158 = {};
                for _, v160 in v157 do
                    table.insert(v158, {
                        l_Utilities_0.GetCollider(v160), 
                        v160
                    });
                end;
                local v161 = table.remove(v144) or Instance.new("Actor");
                local v162 = l_Runtime_0:Clone();
                v162.Parent = v161;
                v162.Enabled = true;
                v161.Parent = l_Folder_0;
                v143[v154] = v161;
                task.wait();
                v161:SendMessage("Setup", v154, v158, script);
                v154:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 663 ]]
                    -- upvalues: v154 (copy), v143 (ref), v144 (ref)
                    if v154.Parent ~= nil then
                        return;
                    else
                        local l_v154_0 = v154;
                        local v164 = v143[l_v154_0];
                        v143[l_v154_0] = nil;
                        if not v164 then
                            return;
                        else
                            v164.Name = "Pooled Actor";
                            table.insert(v144, v164);
                            return;
                        end;
                    end;
                end);
                l_SB_VERBOSE_LOG_0("Runtime Started");
                l_SB_UNINDENT_LOG_0();
                return;
            end;
        end;
        local v166 = l_CollectionService_0:GetInstanceAddedSignal("SmartBone"):Connect(v165);
        local v167 = l_CollectionService_0:GetInstanceRemovedSignal("SmartBone"):Connect(v148);
        for _, v169 in l_CollectionService_0:GetTagged("SmartBone") do
            v165(v169);
        end;
        if l_Config_0.DEBUG_OVERLAY_ENABLED then
            v10 = l_ImOverlay_0.new();
            local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "SmartBoneDebugOverlay";
            l_ScreenGui_0.IgnoreGuiInset = true;
            l_ScreenGui_0.ResetOnSpawn = false;
            l_ScreenGui_0.Parent = l_PlayerGui_0;
            v10.BackFrame.Parent = l_ScreenGui_0;
            l_RunService_0.RenderStepped:Connect(function() --[[ Line: 695 ]]
                -- upvalues: v10 (ref)
                v10:Render();
            end);
        end;
        return {
            Stop = function() --[[ Line: 701 ]] --[[ Name: Stop ]]
                -- upvalues: v24 (ref), l_Config_0 (ref), l_Folder_0 (copy), v166 (copy), v167 (copy)
                v24.Running = false;
                if not l_Config_0.RESET_BONE_ON_DESTROY then
                    l_Folder_0:Destroy();
                    return;
                else
                    for _, v173 in l_Folder_0:GetChildren() do
                        v173:SendMessage("Destroy");
                    end;
                    if v166 then
                        v166:Disconnect();
                    end;
                    if v167 then
                        v167:Disconnect();
                    end;
                    return;
                end;
            end
        };
    end;
end;
return v24;