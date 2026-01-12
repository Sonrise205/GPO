local l_CollectionService_0 = game:GetService("CollectionService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Components_0 = script:WaitForChild("Components");
local l_Dependencies_0 = script:WaitForChild("Dependencies");
local l_CeiveImOverlay_0 = require(l_Dependencies_0:WaitForChild("CeiveImOverlay"));
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
        ShouldDestroy = false, 
        calculateCollisions = true
    }, v24));
end;
v24.m_AppendBone = function(_, v26, v27, v28, v29) --[[ Line: 97 ]] --[[ Name: m_AppendBone ]]
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
    -- upvalues: l_Utilities_0 (copy), l_BoneTree_0 (copy), l_SB_VERBOSE_LOG_0 (copy), l_SB_INDENT_LOG_0 (copy), l_SB_UNINDENT_LOG_0 (copy)
    local v39 = l_Utilities_0.GatherObjectSettings(v37);
    local v40 = l_BoneTree_0.new(v38, v37);
    v40.Settings = v39;
    l_SB_VERBOSE_LOG_0((("Creating bone tree %*; %*"):format(v37.Name, v38.Name)));
    l_SB_INDENT_LOG_0();
    local function v41(v42, v43, v44) --[[ Line: 144 ]] --[[ Name: AddChildren ]]
        -- upvalues: l_SB_VERBOSE_LOG_0 (ref), l_SB_INDENT_LOG_0 (ref), v36 (copy), v40 (copy), v41 (copy), l_SB_UNINDENT_LOG_0 (ref)
        l_SB_VERBOSE_LOG_0((("Adding bone: %*; %*; %*"):format(v42.Name, v43, v44)));
        l_SB_INDENT_LOG_0();
        local l_v42_Children_0 = v42:GetChildren();
        for _, v47 in l_v42_Children_0 do
            if v47:IsA("Bone") then
                v36:m_AppendBone(v40, v47, v43, v44);
                v41(v47, #v40.Bones, v44 + 1);
            end;
        end;
        if #l_v42_Children_0 == 0 then
            l_SB_VERBOSE_LOG_0("Adding tail bone");
            local l_Parent_0 = v42.Parent;
            local v49 = l_Parent_0:IsA("Bone") and l_Parent_0.WorldPosition or l_Parent_0.Position;
            local v50 = v42.WorldCFrame + v42.WorldCFrame.UpVector.Unit * (v42.WorldPosition - v49).Magnitude;
            local l_Bone_1 = Instance.new("Bone");
            l_Bone_1.Parent = v42;
            l_Bone_1.Name = v42.Name .. "_Tail";
            l_Bone_1.WorldCFrame = v50;
            for v52, v53 in v42:GetAttributes() do
                l_Bone_1:SetAttribute(v52, v53);
            end;
            v36:m_AppendBone(v40, l_Bone_1, #v40.Bones, v44);
        end;
        l_SB_UNINDENT_LOG_0();
    end;
    v36:m_AppendBone(v40, v38, 0, 0);
    v41(v38, 1, 1);
    table.insert(v36.BoneTrees, v40);
    l_SB_UNINDENT_LOG_0();
end;
v24.m_UpdateViewFrustum = function(v54) --[[ Line: 191 ]] --[[ Name: m_UpdateViewFrustum ]]
    -- upvalues: l_Frustum_0 (copy), l_Config_0 (copy)
    debug.profilebegin("SmartBone2::m_UpdateViewFrustum");
    local v55, v56, v57, v58, v59, v60, v61, v62, v63 = l_Frustum_0.GetCFrames(workspace.CurrentCamera, l_Config_0.FAR_PLANE);
    for _, v65 in v54.BoneTrees do
        debug.profilebegin("BoneTree::m_UpdateViewFrustum");
        local v66 = {
            CFrame = v65.BoundingBoxCFrame, 
            Size = v65.BoundingBoxSize
        };
        v65.InView = l_Frustum_0.ObjectInFrustum(v66, v55, v56, v57, v58, v59, v60, v61, v62, v63);
        debug.profileend();
    end;
    debug.profileend();
end;
v24.m_CleanColliders = function(v67) --[[ Line: 207 ]] --[[ Name: m_CleanColliders ]]
    -- upvalues: l_SB_VERBOSE_WARN_0 (copy), l_SB_INDENT_LOG_0 (copy), l_SB_UNINDENT_LOG_0 (copy)
    debug.profilebegin("Clean Colliders");
    if #v67.ColliderObjects ~= 0 then
        for v68, v69 in v67.ColliderObjects do
            if #v69.Colliders == 0 or v69.Destroyed == true then
                l_SB_VERBOSE_WARN_0("Deleting Collider Object");
                l_SB_INDENT_LOG_0();
                v69:Destroy();
                l_SB_UNINDENT_LOG_0();
                table.remove(v67.ColliderObjects, v68);
            end;
        end;
    end;
    debug.profileend();
end;
v24.m_ConstrainBoneTree = function(v70, v71, v72) --[[ Line: 231 ]] --[[ Name: m_ConstrainBoneTree ]]
    debug.profilebegin("SmartBone2::m_ConstrainBoneTree");
    v71:Constrain(v70.ColliderObjects, v72);
    debug.profileend();
end;
v24.m_UpdateBoneTree = function(v73, v74, v75, v76) --[[ Line: 248 ]] --[[ Name: m_UpdateBoneTree ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    debug.profilebegin("SmartBone2::m_UpdateBoneTree");
    if v74.Destroyed then
        v74:Destroy();
        table.remove(v73.BoneTrees, v75);
        return;
    else
        v74:PreUpdate(v76);
        if not v74.InView or math.floor(v74.UpdateRate) == 0 then
            local l_FirstSkipUpdate_0 = v74.FirstSkipUpdate;
            v74:SkipUpdate();
            if not l_FirstSkipUpdate_0 then
                debug.profileend();
                task.synchronize();
                v74:ApplyTransform();
                l_SB_VERBOSE_LOG_0((("Skipping BoneTree, InView: %*, Update Rate == 0: %*"):format(v74.InView, math.floor(v74.UpdateRate) == 0)));
            end;
            return;
        else
            debug.profilebegin("Step Colliders");
            for _, v79 in v73.ColliderObjects do
                v79:Step();
            end;
            debug.profileend();
            local v80 = 1 / v74.UpdateRate;
            local v81 = false;
            v74.AccumulatedDelta = v74.AccumulatedDelta + v76;
            while v80 < v74.AccumulatedDelta do
                v74.AccumulatedDelta = v74.AccumulatedDelta - v80;
                v81 = true;
                v74:StepPhysics(v80);
                v73:m_ConstrainBoneTree(v74, v76);
                v74:SolveTransform(v80);
            end;
            debug.profileend();
            if v81 then
                task.synchronize();
                v74:ApplyTransform();
            end;
            return;
        end;
    end;
end;
v24.m_CheckDestroy = function(v82) --[[ Line: 311 ]] --[[ Name: m_CheckDestroy ]]
    v82.ShouldDestroy = false;
    if #v82.BoneTrees == 0 then
        v82.ShouldDestroy = true;
        return true;
    else
        return false;
    end;
end;
v24.LoadObject = function(v83, v84) --[[ Line: 327 ]] --[[ Name: LoadObject ]]
    local l_v84_Attribute_0 = v84:GetAttribute("Roots");
    if not l_v84_Attribute_0 then
        warn((("[SmartBone2::LoadObject] Cannot load an object with no roots defined %*"):format(v84.Name)));
        return;
    else
        local v86 = l_v84_Attribute_0:split(",");
        local v87 = {};
        for _, v89 in v84:GetDescendants() do
            if v89:IsA("Bone") then
                if v87[v89.Name] then
                    warn((("[SmartBone2::LoadObject] Duplicate bones of name: %* in RootPart: %*"):format(v89.Name, v84.Name)));
                else
                    v87[v89.Name] = v89;
                end;
            end;
        end;
        for _, v91 in v86 do
            local v92 = v87[v91];
            if not v92 then
                warn((("[SmartBone2::LoadObject] Couldn't find Root Bone of name: %* in RootPart: %*"):format(v91, v84.Name)));
            else
                v83:m_CreateBoneTree(v84, v92);
            end;
        end;
        return;
    end;
end;
v24.LoadColliderModule = function(v93, v94, v95) --[[ Line: 368 ]] --[[ Name: LoadColliderModule ]]
    -- upvalues: l_HttpService_0 (copy), l_ColliderObject_0 (copy)
    assert(v94, "[SmartBone2::LoadColliderModule] No collider module passed in");
    local v96 = require(v94);
    local v97 = l_HttpService_0:JSONDecode(v96);
    local v98 = l_ColliderObject_0.new(v97, v95);
    table.insert(v93.ColliderObjects, v98);
end;
v24.LoadRawCollider = function(v99, v100, v101) --[[ Line: 383 ]] --[[ Name: LoadRawCollider ]]
    -- upvalues: l_ColliderObject_0 (copy)
    local v102 = l_ColliderObject_0.new(v100, v101);
    table.insert(v99.ColliderObjects, v102);
end;
v24.SkipUpdate = function(v103) --[[ Line: 391 ]] --[[ Name: SkipUpdate ]]
    debug.profilebegin("SmartBone2::SkipUpdate");
    for _, v105 in v103.BoneTrees do
        v105:SkipUpdate();
    end;
    debug.profileend();
end;
v24.StepBoneTrees = function(v106, v107) --[[ Line: 402 ]] --[[ Name: StepBoneTrees ]]
    -- upvalues: l_SB_VERBOSE_WARN_0 (copy)
    if v106:m_CheckDestroy() then
        return;
    elseif v107 <= 0 then
        l_SB_VERBOSE_WARN_0("DeltaTime is zero or sub zero, not updating.");
        return;
    else
        v106:m_CleanColliders();
        v106:m_UpdateViewFrustum();
        for v108, v109 in v106.BoneTrees do
            v106:m_UpdateBoneTree(v109, v108, v107);
        end;
        return;
    end;
end;
v24.DrawDebug = function(v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123) --[[ Line: 435 ]] --[[ Name: DrawDebug ]]
    for _, v125 in v110.BoneTrees do
        v125:DrawDebug(v112, v113, v114, v115, v116, v121, v122, v123);
    end;
    if v111 then
        for _, v127 in v110.ColliderObjects do
            v127:DrawDebug(v117, v118, v119, v120);
        end;
    end;
end;
v24.DrawOverlay = function(v128, v129) --[[ Line: 474 ]] --[[ Name: DrawOverlay ]]
    -- upvalues: l_Config_0 (copy)
    if not l_Config_0.DEBUG_OVERLAY_ENABLED then
        return;
    else
        local v130 = Color3.new(1, 0.431373, 0.713725);
        local v131 = Color3.new(1, 1, 1);
        local v132 = Color3.new(0.486275, 0.431373, 1);
        local v133 = Color3.new(1, 1, 1);
        v129.Begin(("SmartBone Instance ID: %*"):format(v128.ID), v130, v131);
        v129.Text((("Frame Counter: %*"):format(shared.FrameCounter)));
        if l_Config_0.DEBUG_OVERLAY_TREE then
            for v134, v135 in v128.BoneTrees do
                if l_Config_0.DEBUG_OVERLAY_MAX_TREES <= 0 or l_Config_0.DEBUG_OVERLAY_TREE_OFFSET + l_Config_0.DEBUG_OVERLAY_MAX_TREES > v134 then
                    if v134 >= l_Config_0.DEBUG_OVERLAY_TREE_OFFSET then
                        v129.Begin(("Bone Tree %*"):format(v134), v132, v133);
                        v135:DrawOverlay(v129);
                        v129.End();
                    end;
                else
                    break;
                end;
            end;
        end;
        v129.End();
        return;
    end;
end;
v24.Destroy = function(v136) --[[ Line: 510 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    l_SB_VERBOSE_LOG_0("Deleting SmartBone Object");
    for _, v138 in v136.BoneTrees do
        v138:Destroy();
    end;
    for _, v140 in v136.ColliderObjects do
        v140:Destroy();
    end;
    setmetatable(v136, nil);
end;
v24.Start = function() --[[ Line: 528 ]] --[[ Name: Start ]]
    -- upvalues: l_RunService_0 (copy), v24 (copy), l_Config_0 (copy), l_Players_0 (copy), v10 (ref), l_CollectionService_0 (copy), l_SB_VERBOSE_LOG_0 (copy), l_SB_INDENT_LOG_0 (copy), l_Utilities_0 (copy), l_Runtime_0 (copy), l_SB_UNINDENT_LOG_0 (copy), l_CeiveImOverlay_0 (copy)
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
        l_BindableEvent_0.Event:Connect(function(v144, ...) --[[ Line: 556 ]]
            -- upvalues: l_Config_0 (ref), v10 (ref)
            if not l_Config_0.DEBUG_OVERLAY_ENABLED then
                return;
            elseif v144 == "Text" then
                v10:Text(...);
                return;
            elseif v144 == "Begin" then
                v10:Begin(...);
                return;
            else
                if v144 == "End" then
                    v10:End();
                end;
                return;
            end;
        end);
        local function v149() --[[ Line: 570 ]] --[[ Name: GatherColliders ]]
            -- upvalues: l_CollectionService_0 (ref), l_SB_VERBOSE_LOG_0 (ref), l_Config_0 (ref)
            local v145 = {
                Key = {}, 
                Raw = {}
            };
            for _, v147 in l_CollectionService_0:GetTagged("SmartCollider") do
                if v147:IsA("BasePart") then
                    local l_v147_Attribute_0 = v147:GetAttribute("ColliderKey");
                    if l_v147_Attribute_0 then
                        l_v147_Attribute_0 = tostring(l_v147_Attribute_0);
                        if not v145.Key[l_v147_Attribute_0] then
                            v145.Key[l_v147_Attribute_0] = {};
                        end;
                        table.insert(v145.Key[l_v147_Attribute_0], v147);
                    end;
                    l_SB_VERBOSE_LOG_0((("Adding collider: %*, Collider Key: %*"):format(v147.Name, l_v147_Attribute_0)));
                    table.insert(v145.Raw, v147);
                    if l_Config_0.YIELD_ON_COLLIDER_GATHER then
                        task.wait();
                    end;
                end;
            end;
            return v145;
        end;
        local function v159(v150) --[[ Line: 604 ]] --[[ Name: SetupObject ]]
            -- upvalues: l_SB_VERBOSE_LOG_0 (ref), l_SB_INDENT_LOG_0 (ref), v149 (copy), l_Utilities_0 (ref), l_Runtime_0 (ref), l_Folder_0 (copy), l_SB_UNINDENT_LOG_0 (ref)
            if not v150:IsA("BasePart") then
                return;
            else
                l_SB_VERBOSE_LOG_0((("Setup Object: %*"):format(v150.Name)));
                l_SB_INDENT_LOG_0();
                local v151 = v149();
                local l_v150_Attribute_0 = v150:GetAttribute("ColliderKey");
                local v153 = nil;
                v153 = if l_v150_Attribute_0 then v151.Key[tostring(l_v150_Attribute_0)] or {} else v151.Raw or {};
                local v154 = {};
                for _, v156 in v153 do
                    table.insert(v154, {
                        l_Utilities_0.GetCollider(v156), 
                        v156
                    });
                end;
                local l_Actor_0 = Instance.new("Actor");
                local v158 = l_Runtime_0:Clone();
                v158.Parent = l_Actor_0;
                v158.Enabled = true;
                l_Actor_0.Parent = l_Folder_0;
                task.wait();
                l_Actor_0:SendMessage("Setup", v150, v154, script);
                l_SB_VERBOSE_LOG_0("Runtime Started");
                l_SB_UNINDENT_LOG_0();
                return;
            end;
        end;
        l_CollectionService_0:GetInstanceAddedSignal("SmartBone"):Connect(v159);
        for _, v161 in l_CollectionService_0:GetTagged("SmartBone") do
            v159(v161);
        end;
        if l_Config_0.DEBUG_OVERLAY_ENABLED then
            v10 = l_CeiveImOverlay_0.new();
            local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "SmartBoneDebugOverlay";
            l_ScreenGui_0.IgnoreGuiInset = true;
            l_ScreenGui_0.ResetOnSpawn = false;
            l_ScreenGui_0.Parent = l_PlayerGui_0;
            v10.BackFrame.Parent = l_ScreenGui_0;
            l_RunService_0.RenderStepped:Connect(function() --[[ Line: 664 ]]
                -- upvalues: v10 (ref)
                v10:Render();
            end);
        end;
        return {
            Stop = function() --[[ Line: 670 ]] --[[ Name: Stop ]]
                -- upvalues: l_Config_0 (ref), l_Folder_0 (copy)
                if not l_Config_0.RESET_BONE_ON_DESTROY then
                    l_Folder_0:Destroy();
                    return;
                else
                    for _, v165 in l_Folder_0:GetChildren() do
                        v165:SendMessage("Destroy");
                    end;
                    return;
                end;
            end
        };
    end;
end;
return v24;