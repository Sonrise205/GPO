local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
    return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding");
end);
local v2 = l_status_0 and l_result_0;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 14 ]]
    return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2");
end);
local v5 = l_status_1 and l_result_1;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_PathfindingService_0 = game:GetService("PathfindingService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Debris");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Workspace_0 = game:GetService("Workspace");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v16 = l_FlagUtil_0.getUserFlag("UserRaycastUpdateAPI");
local v17 = l_FlagUtil_0.getUserFlag("UserPreferredInputPlayerScripts2");
local v18 = true;
local v19 = true;
local v20 = false;
local v21 = 1;
local v22 = 8;
local v23 = {
    [Enum.KeyCode.W] = true, 
    [Enum.KeyCode.A] = true, 
    [Enum.KeyCode.S] = true, 
    [Enum.KeyCode.D] = true, 
    [Enum.KeyCode.Up] = true, 
    [Enum.KeyCode.Down] = true
};
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ClickToMoveDisplay_0 = require(script.Parent:WaitForChild("ClickToMoveDisplay"));
local v26 = RaycastParams.new();
v26.FilterType = Enum.RaycastFilterType.Exclude;
local v27 = {};
if not v16 then
    local function v28(v29) --[[ Line: 66 ]] --[[ Name: FindCharacterAncestor ]]
        -- upvalues: v28 (copy)
        if v29 then
            local l_Humanoid_0 = v29:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_0 then
                return v29, l_Humanoid_0;
            else
                return v28(v29.Parent);
            end;
        else
            return;
        end;
    end;
    v27.FindCharacterAncestor = v28;
    local l_v28_0 = v28 --[[ copy: 28 -> 52 ]];
    local function v32(v33, v34, v35) --[[ Line: 78 ]] --[[ Name: Raycast ]]
        -- upvalues: l_Workspace_0 (copy), l_v28_0 (copy), v32 (copy)
        v35 = v35 or {};
        local l_l_Workspace_0_PartOnRayWithIgnoreList_0, v37, v38, v39 = l_Workspace_0:FindPartOnRayWithIgnoreList(v33, v35);
        if l_l_Workspace_0_PartOnRayWithIgnoreList_0 then
            if v34 and l_l_Workspace_0_PartOnRayWithIgnoreList_0.CanCollide == false then
                local v40;
                if l_l_Workspace_0_PartOnRayWithIgnoreList_0 then
                    local l_Humanoid_1 = l_l_Workspace_0_PartOnRayWithIgnoreList_0:FindFirstChildOfClass("Humanoid");
                    if l_Humanoid_1 then
                        local _ = l_l_Workspace_0_PartOnRayWithIgnoreList_0;
                        v40 = l_Humanoid_1;
                    else
                        local v43, v44 = l_v28_0(l_l_Workspace_0_PartOnRayWithIgnoreList_0.Parent);
                        local _ = v43;
                        v40 = v44;
                    end;
                else
                    local _ = nil;
                    v40 = nil;
                end;
                if v40 == nil then
                    table.insert(v35, l_l_Workspace_0_PartOnRayWithIgnoreList_0);
                    return v32(v33, v34, v35);
                end;
            end;
            return l_l_Workspace_0_PartOnRayWithIgnoreList_0, v37, v38, v39;
        else
            return nil, nil;
        end;
    end;
    v27.Raycast = v32;
end;
local v47 = {};
local function _(v48) --[[ Line: 100 ]] --[[ Name: findPlayerHumanoid ]]
    -- upvalues: v47 (copy)
    local v49 = v48 and v48.Character;
    if v49 then
        local v50 = v47[v48];
        if v50 and v50.Parent == v49 then
            return v50;
        else
            v47[v48] = nil;
            local l_Humanoid_2 = v49:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_2 then
                v47[v48] = l_Humanoid_2;
            end;
            return l_Humanoid_2;
        end;
    else
        return;
    end;
end;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local function _() --[[ Line: 124 ]] --[[ Name: GetCharacter ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0 and l_LocalPlayer_0.Character;
end;
local function v65(v58) --[[ Line: 128 ]] --[[ Name: UpdateIgnoreTag ]]
    -- upvalues: v54 (ref), v55 (ref), v56 (ref), v53 (ref), l_LocalPlayer_0 (copy), l_CollectionService_0 (copy)
    if v58 == v54 then
        return;
    else
        if v55 then
            v55:Disconnect();
            v55 = nil;
        end;
        if v56 then
            v56:Disconnect();
            v56 = nil;
        end;
        v54 = v58;
        v53 = {
            l_LocalPlayer_0 and l_LocalPlayer_0.Character
        };
        if v54 ~= nil then
            local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v54);
            for _, v61 in ipairs(l_l_CollectionService_0_Tagged_0) do
                table.insert(v53, v61);
            end;
            v55 = l_CollectionService_0:GetInstanceAddedSignal(v54):Connect(function(v62) --[[ Line: 148 ]]
                -- upvalues: v53 (ref)
                table.insert(v53, v62);
            end);
            v56 = l_CollectionService_0:GetInstanceRemovedSignal(v54):Connect(function(v63) --[[ Line: 152 ]]
                -- upvalues: v53 (ref)
                for v64 = 1, #v53 do
                    if v53[v64] == v63 then
                        v53[v64] = v53[#v53];
                        table.remove(v53);
                        return;
                    end;
                end;
            end);
        end;
        return;
    end;
end;
local function _() --[[ Line: 164 ]] --[[ Name: getIgnoreList ]]
    -- upvalues: v53 (ref), l_LocalPlayer_0 (copy)
    if v53 then
        return v53;
    else
        v53 = {};
        assert(v53, "");
        table.insert(v53, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
        return v53;
    end;
end;
local function _(v67, v68) --[[ Line: 174 ]] --[[ Name: minV ]]
    return (Vector3.new(math.min(v67.X, v68.X), math.min(v67.Y, v68.Y), (math.min(v67.Z, v68.Z))));
end;
local function _(v70, v71) --[[ Line: 177 ]] --[[ Name: maxV ]]
    return (Vector3.new(math.max(v70.X, v71.X), math.max(v70.Y, v71.Y), (math.max(v70.Z, v71.Z))));
end;
local function v87(v73) --[[ Line: 180 ]] --[[ Name: getCollidableExtentsSize ]]
    if v73 == nil or v73.PrimaryPart == nil then
        return;
    else
        assert(v73, "");
        assert(v73.PrimaryPart, "");
        local v74 = v73.PrimaryPart.CFrame:Inverse();
        local v75 = Vector3.new(1e999, 1e999, 1e999, 0);
        local v76 = Vector3.new(-1e999, -1e999, -1e999, 0);
        for _, v78 in pairs(v73:GetDescendants()) do
            if v78:IsA("BasePart") and v78.CanCollide then
                local v79 = v74 * v78.CFrame;
                local v80 = Vector3.new(v78.Size.X / 2, v78.Size.Y / 2, v78.Size.Z / 2);
                local v81 = {
                    Vector3.new(v80.X, v80.Y, v80.Z), 
                    Vector3.new(v80.X, v80.Y, -v80.Z), 
                    Vector3.new(v80.X, -v80.Y, v80.Z), 
                    Vector3.new(v80.X, -v80.Y, -v80.Z), 
                    Vector3.new(-v80.X, v80.Y, v80.Z), 
                    Vector3.new(-v80.X, v80.Y, -v80.Z), 
                    Vector3.new(-v80.X, -v80.Y, v80.Z), 
                    (Vector3.new(-v80.X, -v80.Y, -v80.Z))
                };
                for _, v83 in ipairs(v81) do
                    local v84 = v79 * v83;
                    local l_v75_0 = v75;
                    v75 = Vector3.new(math.min(l_v75_0.X, v84.X), math.min(l_v75_0.Y, v84.Y), (math.min(l_v75_0.Z, v84.Z)));
                    l_v75_0 = v76;
                    v76 = Vector3.new(math.max(l_v75_0.X, v84.X), math.max(l_v75_0.Y, v84.Y), (math.max(l_v75_0.Z, v84.Z)));
                end;
            end;
        end;
        local v86 = v76 - v75;
        if v86.X < 0 or v86.Y < 0 or v86.Z < 0 then
            return nil;
        else
            return v86;
        end;
    end;
end;
local function v151(v88, v89, v90) --[[ Line: 215 ]] --[[ Name: Pather ]]
    -- upvalues: v20 (ref), l_LocalPlayer_0 (copy), v47 (copy), v21 (ref), v2 (copy), v87 (copy), v5 (copy), l_PathfindingService_0 (copy), v18 (ref), l_ClickToMoveDisplay_0 (copy), v22 (ref), v16 (copy), v26 (copy), v53 (ref), l_Workspace_0 (copy)
    local v91 = {};
    local v92 = nil;
    local v93 = nil;
    if v90 ~= nil then
        v92 = v90;
        v93 = v90;
    else
        v92 = v20;
        v93 = true;
    end;
    v91.Cancelled = false;
    v91.Started = false;
    v91.Finished = Instance.new("BindableEvent");
    v91.PathFailed = Instance.new("BindableEvent");
    v91.PathComputing = false;
    v91.PathComputed = false;
    v91.OriginalTargetPoint = v88;
    v91.TargetPoint = v88;
    v91.TargetSurfaceNormal = v89;
    v91.DiedConn = nil;
    v91.SeatedConn = nil;
    v91.BlockedConn = nil;
    v91.TeleportedConn = nil;
    v91.CurrentPoint = 0;
    v91.HumanoidOffsetFromPath = Vector3.new(0, 0, 0, 0);
    v91.CurrentWaypointPosition = nil;
    v91.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0, 0);
    v91.CurrentWaypointPlaneDistance = 0;
    v91.CurrentWaypointNeedsJump = false;
    v91.CurrentHumanoidPosition = Vector3.new(0, 0, 0, 0);
    v91.CurrentHumanoidVelocity = 0;
    v91.NextActionMoveDirection = Vector3.new(0, 0, 0, 0);
    v91.NextActionJump = false;
    v91.Timeout = 0;
    local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
    local v95 = l_l_LocalPlayer_0_0 and l_l_LocalPlayer_0_0.Character;
    local v96;
    if v95 then
        local v97 = v47[l_l_LocalPlayer_0_0];
        if v97 and v97.Parent == v95 then
            v96 = v97;
        else
            v47[l_l_LocalPlayer_0_0] = nil;
            local l_Humanoid_3 = v95:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_3 then
                v47[l_l_LocalPlayer_0_0] = l_Humanoid_3;
            end;
            v96 = l_Humanoid_3;
        end;
    else
        v96 = nil;
    end;
    v91.Humanoid = v96;
    v91.OriginPoint = nil;
    v91.AgentCanFollowPath = false;
    v91.DirectPath = false;
    v91.DirectPathRiseFirst = false;
    v91.stopTraverseFunc = nil;
    v91.setPointFunc = nil;
    v91.pointList = nil;
    v96 = v91.Humanoid and v91.Humanoid.RootPart;
    if v96 then
        v91.OriginPoint = v96.CFrame.Position;
        l_l_LocalPlayer_0_0 = 2;
        v95 = 5;
        local v99 = true;
        local l_SeatPart_0 = v91.Humanoid.SeatPart;
        if l_SeatPart_0 and l_SeatPart_0:IsA("VehicleSeat") then
            local l_l_SeatPart_0_FirstAncestorOfClass_0 = l_SeatPart_0:FindFirstAncestorOfClass("Model");
            if l_l_SeatPart_0_FirstAncestorOfClass_0 then
                local l_PrimaryPart_0 = l_l_SeatPart_0_FirstAncestorOfClass_0.PrimaryPart;
                l_l_SeatPart_0_FirstAncestorOfClass_0.PrimaryPart = l_SeatPart_0;
                if v93 then
                    local l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0 = l_l_SeatPart_0_FirstAncestorOfClass_0:GetExtentsSize();
                    l_l_LocalPlayer_0_0 = v21 * 0.5 * math.sqrt(l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.X * l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.X + l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.Z * l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.Z);
                    v95 = v21 * l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.Y;
                    v99 = false;
                    v91.AgentCanFollowPath = true;
                    v91.DirectPath = v93;
                end;
                l_l_SeatPart_0_FirstAncestorOfClass_0.PrimaryPart = l_PrimaryPart_0;
            end;
        else
            local v104 = nil;
            if v2 then
                local v105 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
                if v105 ~= nil then
                    v104 = v87(v105);
                end;
            end;
            if v104 == nil then
                v104 = (l_LocalPlayer_0 and l_LocalPlayer_0.Character):GetExtentsSize();
            end;
            assert(v104, "");
            l_l_LocalPlayer_0_0 = v21 * 0.5 * math.sqrt(v104.X * v104.X + v104.Z * v104.Z);
            v95 = v21 * v104.Y;
            v99 = v91.Humanoid.JumpPower > 0;
            v91.AgentCanFollowPath = true;
            v91.DirectPath = v92;
            v91.DirectPathRiseFirst = v91.Humanoid.Sit;
        end;
        if v5 then
            v91.pathResult = l_PathfindingService_0:CreatePath({
                AgentRadius = l_l_LocalPlayer_0_0, 
                AgentHeight = v95, 
                AgentCanJump = v99, 
                AgentCanClimb = true
            });
        else
            v91.pathResult = l_PathfindingService_0:CreatePath({
                AgentRadius = l_l_LocalPlayer_0_0, 
                AgentHeight = v95, 
                AgentCanJump = v99
            });
        end;
    end;
    v91.Cleanup = function(_) --[[ Line: 333 ]] --[[ Name: Cleanup ]]
        -- upvalues: v91 (copy)
        if v91.stopTraverseFunc then
            v91.stopTraverseFunc();
            v91.stopTraverseFunc = nil;
        end;
        if v91.BlockedConn then
            v91.BlockedConn:Disconnect();
            v91.BlockedConn = nil;
        end;
        if v91.DiedConn then
            v91.DiedConn:Disconnect();
            v91.DiedConn = nil;
        end;
        if v91.SeatedConn then
            v91.SeatedConn:Disconnect();
            v91.SeatedConn = nil;
        end;
        if v91.TeleportedConn then
            v91.TeleportedConn:Disconnect();
            v91.TeleportedConn = nil;
        end;
        v91.Started = false;
    end;
    v91.Cancel = function(_) --[[ Line: 362 ]] --[[ Name: Cancel ]]
        -- upvalues: v91 (copy)
        v91.Cancelled = true;
        v91:Cleanup();
    end;
    v91.IsActive = function(_) --[[ Line: 367 ]] --[[ Name: IsActive ]]
        -- upvalues: v91 (copy)
        return v91.AgentCanFollowPath and v91.Started and not v91.Cancelled;
    end;
    v91.OnPathInterrupted = function(_) --[[ Line: 371 ]] --[[ Name: OnPathInterrupted ]]
        -- upvalues: v91 (copy)
        v91.Cancelled = true;
        v91:OnPointReached(false);
    end;
    v91.ComputePath = function(_) --[[ Line: 377 ]] --[[ Name: ComputePath ]]
        -- upvalues: v91 (copy)
        if v91.OriginPoint then
            if v91.PathComputed or v91.PathComputing then
                return;
            else
                v91.PathComputing = true;
                if v91.AgentCanFollowPath then
                    if v91.DirectPath then
                        v91.pointList = {
                            PathWaypoint.new(v91.OriginPoint, Enum.PathWaypointAction.Walk), 
                            PathWaypoint.new(v91.TargetPoint, v91.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk)
                        };
                        v91.PathComputed = true;
                    else
                        v91.pathResult:ComputeAsync(v91.OriginPoint, v91.TargetPoint);
                        v91.pointList = v91.pathResult:GetWaypoints();
                        v91.BlockedConn = v91.pathResult.Blocked:Connect(function(v111) --[[ Line: 391 ]]
                            -- upvalues: v91 (ref)
                            v91:OnPathBlocked(v111);
                        end);
                        v91.PathComputed = v91.pathResult.Status == Enum.PathStatus.Success;
                    end;
                end;
                v91.PathComputing = false;
            end;
        end;
    end;
    v91.IsValidPath = function(_) --[[ Line: 399 ]] --[[ Name: IsValidPath ]]
        -- upvalues: v91 (copy)
        v91:ComputePath();
        return v91.PathComputed and v91.AgentCanFollowPath;
    end;
    v91.Recomputing = false;
    v91.OnPathBlocked = function(_, v114) --[[ Line: 405 ]] --[[ Name: OnPathBlocked ]]
        -- upvalues: v91 (copy), v18 (ref), l_ClickToMoveDisplay_0 (ref)
        if v91.CurrentPoint > v114 or v91.Recomputing then
            return;
        else
            v91.Recomputing = true;
            if v91.stopTraverseFunc then
                v91.stopTraverseFunc();
                v91.stopTraverseFunc = nil;
            end;
            v91.OriginPoint = v91.Humanoid.RootPart.CFrame.p;
            v91.pathResult:ComputeAsync(v91.OriginPoint, v91.TargetPoint);
            v91.pointList = v91.pathResult:GetWaypoints();
            if #v91.pointList > 0 then
                v91.HumanoidOffsetFromPath = v91.pointList[1].Position - v91.OriginPoint;
            end;
            v91.PathComputed = v91.pathResult.Status == Enum.PathStatus.Success;
            if v18 then
                local l_v91_0 = v91;
                local l_v91_1 = v91;
                local v117, v118 = l_ClickToMoveDisplay_0.CreatePathDisplay(v91.pointList);
                l_v91_0.stopTraverseFunc = v117;
                l_v91_1.setPointFunc = v118;
            end;
            if v91.PathComputed then
                v91.CurrentPoint = 1;
                v91:OnPointReached(true);
            else
                v91.PathFailed:Fire();
                v91:Cleanup();
            end;
            v91.Recomputing = false;
            return;
        end;
    end;
    v91.OnRenderStepped = function(_, v120) --[[ Line: 441 ]] --[[ Name: OnRenderStepped ]]
        -- upvalues: v91 (copy), v22 (ref)
        if v91.Started and not v91.Cancelled then
            v91.Timeout = v91.Timeout + v120;
            if v91.Timeout > v22 then
                v91:OnPointReached(false);
                return;
            else
                v91.CurrentHumanoidPosition = v91.Humanoid.RootPart.Position + v91.HumanoidOffsetFromPath;
                v91.CurrentHumanoidVelocity = v91.Humanoid.RootPart.Velocity;
                while v91.Started and v91:IsCurrentWaypointReached() do
                    v91:OnPointReached(true);
                end;
                if v91.Started then
                    v91.NextActionMoveDirection = v91.CurrentWaypointPosition - v91.CurrentHumanoidPosition;
                    if v91.NextActionMoveDirection.Magnitude > 1.0E-6 then
                        v91.NextActionMoveDirection = v91.NextActionMoveDirection.Unit;
                    else
                        v91.NextActionMoveDirection = Vector3.new(0, 0, 0, 0);
                    end;
                    if v91.CurrentWaypointNeedsJump then
                        v91.NextActionJump = true;
                        v91.CurrentWaypointNeedsJump = false;
                        return;
                    else
                        v91.NextActionJump = false;
                    end;
                end;
            end;
        end;
    end;
    v91.IsCurrentWaypointReached = function(_) --[[ Line: 479 ]] --[[ Name: IsCurrentWaypointReached ]]
        -- upvalues: v91 (copy)
        local v122 = false;
        v122 = v91.CurrentWaypointPlaneNormal == Vector3.new(0, 0, 0, 0) or v91.CurrentWaypointPlaneNormal:Dot(v91.CurrentHumanoidPosition) - v91.CurrentWaypointPlaneDistance < math.max(1, 0.0625 * -v91.CurrentWaypointPlaneNormal:Dot(v91.CurrentHumanoidVelocity));
        if v122 then
            v91.CurrentWaypointPosition = nil;
            v91.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0, 0);
            v91.CurrentWaypointPlaneDistance = 0;
        end;
        return v122;
    end;
    v91.OnPointReached = function(_, v124) --[[ Line: 505 ]] --[[ Name: OnPointReached ]]
        -- upvalues: v91 (copy)
        if v124 and not v91.Cancelled then
            if v91.setPointFunc then
                v91.setPointFunc(v91.CurrentPoint);
            end;
            local v125 = v91.CurrentPoint + 1;
            if #v91.pointList < v125 then
                if v91.stopTraverseFunc then
                    v91.stopTraverseFunc();
                end;
                v91.Finished:Fire();
                v91:Cleanup();
                return;
            else
                local v126 = v91.pointList[v91.CurrentPoint];
                local v127 = v91.pointList[v125];
                local l_State_0 = v91.Humanoid:GetState();
                local v129 = true;
                if l_State_0 ~= Enum.HumanoidStateType.FallingDown then
                    v129 = true;
                    if l_State_0 ~= Enum.HumanoidStateType.Freefall then
                        v129 = l_State_0 == Enum.HumanoidStateType.Jumping;
                    end;
                end;
                if v129 then
                    local v130 = v127.Action == Enum.PathWaypointAction.Jump;
                    if not v130 and v91.CurrentPoint > 1 then
                        local v131 = v91.pointList[v91.CurrentPoint - 1];
                        local v132 = v126.Position - v131.Position;
                        local v133 = v127.Position - v126.Position;
                        v130 = Vector2.new(v132.x, v132.z).Unit:Dot(Vector2.new(v133.x, v133.z).Unit) < 0.996;
                    end;
                    if v130 then
                        v91.Humanoid.FreeFalling:Wait();
                        wait(0.1);
                    end;
                end;
                v91:MoveToNextWayPoint(v126, v127, v125);
                return;
            end;
        else
            v91.PathFailed:Fire();
            v91:Cleanup();
            return;
        end;
    end;
    v91.MoveToNextWayPoint = function(_, v135, v136, v137) --[[ Line: 568 ]] --[[ Name: MoveToNextWayPoint ]]
        -- upvalues: v91 (copy), v5 (ref)
        v91.CurrentWaypointPlaneNormal = v135.Position - v136.Position;
        if not v5 or v136.Label ~= "Climb" then
            v91.CurrentWaypointPlaneNormal = Vector3.new(v91.CurrentWaypointPlaneNormal.X, 0, v91.CurrentWaypointPlaneNormal.Z);
        end;
        if v91.CurrentWaypointPlaneNormal.Magnitude > 1.0E-6 then
            v91.CurrentWaypointPlaneNormal = v91.CurrentWaypointPlaneNormal.Unit;
            v91.CurrentWaypointPlaneDistance = v91.CurrentWaypointPlaneNormal:Dot(v136.Position);
        else
            v91.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0, 0);
            v91.CurrentWaypointPlaneDistance = 0;
        end;
        v91.CurrentWaypointNeedsJump = v136.Action == Enum.PathWaypointAction.Jump;
        v91.CurrentWaypointPosition = v136.Position;
        v91.CurrentPoint = v137;
        v91.Timeout = 0;
    end;
    v91.Start = function(_, v139) --[[ Line: 600 ]] --[[ Name: Start ]]
        -- upvalues: v91 (copy), l_ClickToMoveDisplay_0 (ref), v18 (ref)
        if not v91.AgentCanFollowPath then
            v91.PathFailed:Fire();
            return;
        elseif v91.Started then
            return;
        else
            v91.Started = true;
            l_ClickToMoveDisplay_0.CancelFailureAnimation();
            if v18 and (v139 == nil or v139) then
                local l_v91_2 = v91;
                local l_v91_3 = v91;
                local v142, v143 = l_ClickToMoveDisplay_0.CreatePathDisplay(v91.pointList, v91.OriginalTargetPoint);
                l_v91_2.stopTraverseFunc = v142;
                l_v91_3.setPointFunc = v143;
            end;
            if #v91.pointList > 0 then
                v91.HumanoidOffsetFromPath = Vector3.new(0, v91.pointList[1].Position.Y - v91.OriginPoint.Y, 0);
                v91.CurrentHumanoidPosition = v91.Humanoid.RootPart.Position + v91.HumanoidOffsetFromPath;
                v91.CurrentHumanoidVelocity = v91.Humanoid.RootPart.Velocity;
                v91.SeatedConn = v91.Humanoid.Seated:Connect(function(_, _) --[[ Line: 627 ]]
                    -- upvalues: v91 (ref)
                    v91:OnPathInterrupted();
                end);
                v91.DiedConn = v91.Humanoid.Died:Connect(function() --[[ Line: 628 ]]
                    -- upvalues: v91 (ref)
                    v91:OnPathInterrupted();
                end);
                v91.TeleportedConn = v91.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 629 ]]
                    -- upvalues: v91 (ref)
                    v91:OnPathInterrupted();
                end);
                v91.CurrentPoint = 1;
                v91:OnPointReached(true);
                return;
            else
                v91.PathFailed:Fire();
                if v91.stopTraverseFunc then
                    v91.stopTraverseFunc();
                end;
                return;
            end;
        end;
    end;
    l_l_LocalPlayer_0_0 = v91.TargetPoint + v91.TargetSurfaceNormal * 1.5;
    if v16 then
        v95 = v26;
        local v146;
        if v53 then
            v146 = v53;
        else
            v53 = {};
            assert(v53, "");
            table.insert(v53, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
            v146 = v53;
        end;
        v95.FilterDescendantsInstances = v146;
        v95 = l_Workspace_0:Raycast(l_l_LocalPlayer_0_0, Vector3.new(-0, -50, -0, -0), v26);
        if v95 then
            v91.TargetPoint = v95.Position;
        end;
    else
        v95 = Ray.new(l_l_LocalPlayer_0_0, (Vector3.new(0, -50, 0, 0)));
        local l_l_Workspace_0_0 = l_Workspace_0;
        local l_v95_0 = v95;
        local v149;
        if v53 then
            v149 = v53;
        else
            v53 = {};
            assert(v53, "");
            table.insert(v53, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
            v149 = v53;
        end;
        local v150;
        l_l_Workspace_0_0, v150 = l_l_Workspace_0_0:FindPartOnRayWithIgnoreList(l_v95_0, v149);
        if l_l_Workspace_0_0 then
            v91.TargetPoint = v150;
        end;
    end;
    v91:ComputePath();
    return v91;
end;
local function _() --[[ Line: 665 ]] --[[ Name: CheckAlive ]]
    -- upvalues: l_LocalPlayer_0 (copy), v47 (copy)
    local l_l_LocalPlayer_0_1 = l_LocalPlayer_0;
    local v153 = l_l_LocalPlayer_0_1 and l_l_LocalPlayer_0_1.Character;
    local v154;
    if v153 then
        local v155 = v47[l_l_LocalPlayer_0_1];
        if v155 and v155.Parent == v153 then
            v154 = v155;
        else
            v47[l_l_LocalPlayer_0_1] = nil;
            local l_Humanoid_4 = v153:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_4 then
                v47[l_l_LocalPlayer_0_1] = l_Humanoid_4;
            end;
            v154 = l_Humanoid_4;
        end;
    else
        v154 = nil;
    end;
    l_l_LocalPlayer_0_1 = false;
    if v154 ~= nil then
        l_l_LocalPlayer_0_1 = v154.Health > 0;
    end;
    return l_l_LocalPlayer_0_1;
end;
local function v161(v158) --[[ Line: 670 ]] --[[ Name: GetEquippedTool ]]
    if v158 ~= nil then
        for _, v160 in pairs(v158:GetChildren()) do
            if v160:IsA("Tool") then
                return v160;
            end;
        end;
    end;
end;
local v162 = nil;
local v163 = nil;
local v164 = nil;
local function _() --[[ Line: 685 ]] --[[ Name: CleanupPath ]]
    -- upvalues: v162 (ref), v163 (ref), v164 (ref)
    if v162 then
        v162:Cancel();
        v162 = nil;
    end;
    if v163 then
        v163:Disconnect();
        v163 = nil;
    end;
    if v164 then
        v164:Disconnect();
        v164 = nil;
    end;
end;
local function v172(v166, v167, v168, v169, v170) --[[ Line: 703 ]] --[[ Name: HandleMoveTo ]]
    -- upvalues: v162 (ref), v163 (ref), v164 (ref), v161 (copy), v19 (ref), l_ClickToMoveDisplay_0 (copy)
    if v162 then
        if v162 then
            v162:Cancel();
            v162 = nil;
        end;
        if v163 then
            v163:Disconnect();
            v163 = nil;
        end;
        if v164 then
            v164:Disconnect();
            v164 = nil;
        end;
    end;
    v162 = v166;
    v166:Start(v170);
    v163 = v166.Finished.Event:Connect(function() --[[ Line: 710 ]]
        -- upvalues: v162 (ref), v163 (ref), v164 (ref), v168 (copy), v161 (ref), v169 (copy)
        if v162 then
            v162:Cancel();
            v162 = nil;
        end;
        if v163 then
            v163:Disconnect();
            v163 = nil;
        end;
        if v164 then
            v164:Disconnect();
            v164 = nil;
        end;
        if v168 then
            local v171 = v161(v169);
            if v171 then
                v171:Activate();
            end;
        end;
    end);
    v164 = v166.PathFailed.Event:Connect(function() --[[ Line: 719 ]]
        -- upvalues: v162 (ref), v163 (ref), v164 (ref), v170 (copy), v19 (ref), l_ClickToMoveDisplay_0 (ref), v167 (copy)
        if v162 then
            v162:Cancel();
            v162 = nil;
        end;
        if v163 then
            v163:Disconnect();
            v163 = nil;
        end;
        if v164 then
            v164:Disconnect();
            v164 = nil;
        end;
        if v170 == nil or v170 then
            if v19 and not (v162 and v162:IsActive()) then
                l_ClickToMoveDisplay_0.PlayFailureAnimation();
            end;
            l_ClickToMoveDisplay_0.DisplayFailureWaypoint(v167);
        end;
    end);
end;
local function _(v173) --[[ Line: 731 ]] --[[ Name: ShowPathFailedFeedback ]]
    -- upvalues: v162 (ref), v19 (ref), l_ClickToMoveDisplay_0 (copy)
    if v162 and v162:IsActive() then
        v162:Cancel();
    end;
    if v19 then
        l_ClickToMoveDisplay_0.PlayFailureAnimation();
    end;
    l_ClickToMoveDisplay_0.DisplayFailureWaypoint(v173);
end;
OnTap = function(v175, v176, v177) --[[ Line: 741 ]] --[[ Name: OnTap ]]
    -- upvalues: l_Workspace_0 (copy), l_LocalPlayer_0 (copy), v47 (copy), v16 (copy), v53 (ref), v26 (copy), l_StarterGui_0 (copy), l_Players_0 (copy), v162 (ref), v163 (ref), v164 (ref), v151 (copy), v172 (copy), v19 (ref), l_ClickToMoveDisplay_0 (copy), v27 (copy), v161 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_l_LocalPlayer_0_2 = l_LocalPlayer_0;
    local v181 = l_l_LocalPlayer_0_2 and l_l_LocalPlayer_0_2.Character;
    local v182;
    if v181 then
        local v183 = v47[l_l_LocalPlayer_0_2];
        if v183 and v183.Parent == v181 then
            v182 = v183;
        else
            v47[l_l_LocalPlayer_0_2] = nil;
            local l_Humanoid_5 = v181:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_5 then
                v47[l_l_LocalPlayer_0_2] = l_Humanoid_5;
            end;
            v182 = l_Humanoid_5;
        end;
    else
        v182 = nil;
    end;
    local v185 = false;
    if v182 ~= nil then
        v185 = v182.Health > 0;
    end;
    if not v185 then
        return;
    else
        if #v175 == 1 or v176 then
            if l_CurrentCamera_0 then
                v185 = l_CurrentCamera_0:ScreenPointToRay(v175[1].X, v175[1].Y);
                if v16 then
                    v182 = nil;
                    l_l_LocalPlayer_0_2 = nil;
                    v181 = nil;
                    local v186;
                    if v53 then
                        v186 = v53;
                    else
                        v53 = {};
                        assert(v53, "");
                        table.insert(v53, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
                        v186 = v53;
                    end;
                    if not v186 then
                        v186 = {};
                    end;
                    repeat
                        local v187 = true;
                        v26.FilterDescendantsInstances = v186;
                        v181 = l_Workspace_0:Raycast(v185.Origin, v185.Direction * 1000, v26);
                        if v181 then
                            local l_Instance_0 = v181.Instance;
                            if not l_Instance_0.CanCollide then
                                repeat
                                    v182 = l_Instance_0:FindFirstChildOfClass("Humanoid");
                                    l_l_LocalPlayer_0_2 = l_Instance_0;
                                    l_Instance_0 = l_Instance_0.Parent;
                                until v182 or not l_Instance_0 or l_Instance_0 == l_Workspace_0;
                                if not v182 then
                                    l_l_LocalPlayer_0_2 = nil;
                                    v187 = false;
                                    table.insert(v186, l_Instance_0);
                                end;
                            end;
                        end;
                    until v187;
                    if v177 and v182 and l_StarterGui_0:GetCore("AvatarContextMenuEnabled") and l_Players_0:GetPlayerFromCharacter(v182.Parent) then
                        if v162 then
                            v162:Cancel();
                            v162 = nil;
                        end;
                        if v163 then
                            v163:Disconnect();
                            v163 = nil;
                        end;
                        if v164 then
                            v164:Disconnect();
                            v164 = nil;
                        end;
                        return;
                    elseif not v181 or not l_Character_0 then
                        return;
                    else
                        local l_Position_0 = v181.Position;
                        if v176 then
                            l_Position_0 = v176;
                            l_l_LocalPlayer_0_2 = nil;
                        end;
                        if v162 then
                            v162:Cancel();
                            v162 = nil;
                        end;
                        if v163 then
                            v163:Disconnect();
                            v163 = nil;
                        end;
                        if v164 then
                            v164:Disconnect();
                            v164 = nil;
                        end;
                        local v190 = v151(l_Position_0, v181.Normal);
                        if v190:IsValidPath() then
                            v172(v190, l_Position_0, l_l_LocalPlayer_0_2, l_Character_0);
                            return;
                        else
                            v190:Cleanup();
                            local l_l_Position_0_0 = l_Position_0;
                            if v162 and v162:IsActive() then
                                v162:Cancel();
                            end;
                            if v19 then
                                l_ClickToMoveDisplay_0.PlayFailureAnimation();
                            end;
                            l_ClickToMoveDisplay_0.DisplayFailureWaypoint(l_l_Position_0_0);
                            return;
                        end;
                    end;
                else
                    v182 = Ray.new(v185.Origin, v185.Direction * 1000);
                    l_l_LocalPlayer_0_2 = v27.Raycast;
                    v181 = v182;
                    local v192 = true;
                    local v193;
                    if v53 then
                        v193 = v53;
                    else
                        v53 = {};
                        assert(v53, "");
                        table.insert(v53, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
                        v193 = v53;
                    end;
                    l_l_LocalPlayer_0_2, v181, v192 = l_l_LocalPlayer_0_2(v181, v192, v193);
                    local v194;
                    v193, v194 = v27.FindCharacterAncestor(l_l_LocalPlayer_0_2);
                    if v177 and v194 and l_StarterGui_0:GetCore("AvatarContextMenuEnabled") and l_Players_0:GetPlayerFromCharacter(v194.Parent) then
                        if v162 then
                            v162:Cancel();
                            v162 = nil;
                        end;
                        if v163 then
                            v163:Disconnect();
                            v163 = nil;
                        end;
                        if v164 then
                            v164:Disconnect();
                            v164 = nil;
                        end;
                        return;
                    else
                        if v176 then
                            v181 = v176;
                            v193 = nil;
                        end;
                        if v181 and l_Character_0 then
                            if v162 then
                                v162:Cancel();
                                v162 = nil;
                            end;
                            if v163 then
                                v163:Disconnect();
                                v163 = nil;
                            end;
                            if v164 then
                                v164:Disconnect();
                                v164 = nil;
                            end;
                            local v195 = v151(v181, v192);
                            if v195:IsValidPath() then
                                v172(v195, v181, v193, l_Character_0);
                                return;
                            else
                                v195:Cleanup();
                                local l_v181_0 = v181;
                                if v162 and v162:IsActive() then
                                    v162:Cancel();
                                end;
                                if v19 then
                                    l_ClickToMoveDisplay_0.PlayFailureAnimation();
                                end;
                                l_ClickToMoveDisplay_0.DisplayFailureWaypoint(l_v181_0);
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        elseif #v175 >= 2 and l_CurrentCamera_0 then
            v185 = v161(l_Character_0);
            if v185 then
                v185:Activate();
            end;
        end;
        return;
    end;
end;
local function _(v197) --[[ Line: 851 ]] --[[ Name: DisconnectEvent ]]
    if v197 then
        v197:Disconnect();
    end;
end;
local l_Keyboard_0 = require(script.Parent:WaitForChild("Keyboard"));
local v200 = setmetatable({}, l_Keyboard_0);
v200.__index = v200;
v200.new = function(v201) --[[ Line: 862 ]] --[[ Name: new ]]
    -- upvalues: l_Keyboard_0 (copy), v200 (copy)
    local v202 = setmetatable(l_Keyboard_0.new(v201), v200);
    v202.fingerTouches = {};
    v202.numUnsunkTouches = 0;
    v202.mouse2DownTime = tick();
    v202.mouse2DownPos = Vector2.new();
    v202.mouse2UpTime = tick();
    v202.keyboardMoveVector = Vector3.new(0, 0, 0, 0);
    v202.tapConn = nil;
    v202.inputBeganConn = nil;
    v202.inputChangedConn = nil;
    v202.inputEndedConn = nil;
    v202.humanoidDiedConn = nil;
    v202.characterChildAddedConn = nil;
    v202.onCharacterAddedConn = nil;
    v202.characterChildRemovedConn = nil;
    v202.renderSteppedConn = nil;
    v202.menuOpenedConnection = nil;
    v202.preferredInputChangedConnection = nil;
    v202.running = false;
    v202.wasdEnabled = false;
    return v202;
end;
v200.DisconnectEvents = function(v203) --[[ Line: 893 ]] --[[ Name: DisconnectEvents ]]
    -- upvalues: v17 (copy)
    local l_tapConn_0 = v203.tapConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.inputBeganConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.inputChangedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.inputEndedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.humanoidDiedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.characterChildAddedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.onCharacterAddedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.renderSteppedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.characterChildRemovedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v203.menuOpenedConnection;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    if v17 then
        l_tapConn_0 = v203.preferredInputChangedConnection;
        if l_tapConn_0 then
            l_tapConn_0:Disconnect();
        end;
    end;
end;
v200.OnTouchBegan = function(v205, v206, v207) --[[ Line: 909 ]] --[[ Name: OnTouchBegan ]]
    if v205.fingerTouches[v206] == nil and not v207 then
        v205.numUnsunkTouches = v205.numUnsunkTouches + 1;
    end;
    v205.fingerTouches[v206] = v207;
end;
v200.OnTouchChanged = function(v208, v209, v210) --[[ Line: 916 ]] --[[ Name: OnTouchChanged ]]
    if v208.fingerTouches[v209] == nil then
        v208.fingerTouches[v209] = v210;
        if not v210 then
            v208.numUnsunkTouches = v208.numUnsunkTouches + 1;
        end;
    end;
end;
v200.OnTouchEnded = function(v211, v212, _) --[[ Line: 925 ]] --[[ Name: OnTouchEnded ]]
    if v211.fingerTouches[v212] ~= nil and v211.fingerTouches[v212] == false then
        v211.numUnsunkTouches = v211.numUnsunkTouches - 1;
    end;
    v211.fingerTouches[v212] = nil;
end;
v200.OnPreferredInputChanged = function(_) --[[ Line: 932 ]] --[[ Name: OnPreferredInputChanged ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserInputService_0 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Character_1 then
        local v216 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
        for _, v218 in pairs(l_Character_1:GetChildren()) do
            if v218:IsA("Tool") then
                v218.ManualActivationOnly = v216;
            end;
        end;
    end;
end;
v200.OnCharacterAdded = function(v219, v220) --[[ Line: 944 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_UserInputService_0 (copy), v23 (copy), v162 (ref), v163 (ref), v164 (ref), l_ClickToMoveDisplay_0 (copy), l_GuiService_0 (copy), v17 (copy)
    v219:DisconnectEvents();
    v219.inputBeganConn = l_UserInputService_0.InputBegan:Connect(function(v221, v222) --[[ Line: 947 ]]
        -- upvalues: v219 (copy), v23 (ref), v162 (ref), v163 (ref), v164 (ref), l_ClickToMoveDisplay_0 (ref)
        if v221.UserInputType == Enum.UserInputType.Touch then
            v219:OnTouchBegan(v221, v222);
        end;
        if v219.wasdEnabled and v222 == false and v221.UserInputType == Enum.UserInputType.Keyboard and v23[v221.KeyCode] then
            if v162 then
                v162:Cancel();
                v162 = nil;
            end;
            if v163 then
                v163:Disconnect();
                v163 = nil;
            end;
            if v164 then
                v164:Disconnect();
                v164 = nil;
            end;
            l_ClickToMoveDisplay_0.CancelFailureAnimation();
        end;
        if v221.UserInputType == Enum.UserInputType.MouseButton2 then
            v219.mouse2DownTime = tick();
            v219.mouse2DownPos = v221.Position;
        end;
    end);
    v219.inputChangedConn = l_UserInputService_0.InputChanged:Connect(function(v223, v224) --[[ Line: 964 ]]
        -- upvalues: v219 (copy)
        if v223.UserInputType == Enum.UserInputType.Touch then
            v219:OnTouchChanged(v223, v224);
        end;
    end);
    v219.inputEndedConn = l_UserInputService_0.InputEnded:Connect(function(v225, v226) --[[ Line: 970 ]]
        -- upvalues: v219 (copy), v162 (ref)
        if v225.UserInputType == Enum.UserInputType.Touch then
            v219:OnTouchEnded(v225, v226);
        end;
        if v225.UserInputType == Enum.UserInputType.MouseButton2 then
            v219.mouse2UpTime = tick();
            local l_Position_1 = v225.Position;
            local v228 = v162 or v219.keyboardMoveVector.Magnitude <= 0;
            if v219.mouse2UpTime - v219.mouse2DownTime < 0.25 and (l_Position_1 - v219.mouse2DownPos).magnitude < 5 and v228 then
                OnTap({
                    l_Position_1
                });
            end;
        end;
    end);
    v219.tapConn = l_UserInputService_0.TouchTap:Connect(function(v229, v230) --[[ Line: 987 ]]
        if not v230 then
            OnTap(v229, nil, true);
        end;
    end);
    v219.menuOpenedConnection = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 993 ]]
        -- upvalues: v162 (ref), v163 (ref), v164 (ref)
        if v162 then
            v162:Cancel();
            v162 = nil;
        end;
        if v163 then
            v163:Disconnect();
            v163 = nil;
        end;
        if v164 then
            v164:Disconnect();
            v164 = nil;
        end;
    end);
    local function v234(v231) --[[ Line: 997 ]] --[[ Name: OnCharacterChildAdded ]]
        -- upvalues: v17 (ref), l_UserInputService_0 (ref), v219 (copy)
        local _ = nil;
        if (if v17 then l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch else l_UserInputService_0.TouchEnabled) and v231:IsA("Tool") then
            v231.ManualActivationOnly = true;
        end;
        if v231:IsA("Humanoid") then
            local l_humanoidDiedConn_0 = v219.humanoidDiedConn;
            if l_humanoidDiedConn_0 then
                l_humanoidDiedConn_0:Disconnect();
            end;
            v219.humanoidDiedConn = v231.Died:Connect(function() --[[ Line: 1011 ]]

            end);
        end;
    end;
    v219.characterChildAddedConn = v220.ChildAdded:Connect(function(v235) --[[ Line: 1019 ]]
        -- upvalues: v234 (copy)
        v234(v235);
    end);
    v219.characterChildRemovedConn = v220.ChildRemoved:Connect(function(v236) --[[ Line: 1022 ]]
        -- upvalues: v17 (ref), l_UserInputService_0 (ref)
        local _ = nil;
        if (if v17 then l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch else l_UserInputService_0.TouchEnabled) and v236:IsA("Tool") then
            v236.ManualActivationOnly = false;
        end;
    end);
    for _, v239 in pairs(v220:GetChildren()) do
        v234(v239);
    end;
    if v17 then
        v219.preferredInputChangedConnection = l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1040 ]]
            -- upvalues: v219 (copy)
            v219:OnPreferredInputChanged();
        end);
    end;
end;
v200.Start = function(v240) --[[ Line: 1046 ]] --[[ Name: Start ]]
    v240:Enable(true);
end;
v200.Stop = function(v241) --[[ Line: 1050 ]] --[[ Name: Stop ]]
    v241:Enable(false);
end;
v200.CleanupPath = function(_) --[[ Line: 1054 ]] --[[ Name: CleanupPath ]]
    -- upvalues: v162 (ref), v163 (ref), v164 (ref)
    if v162 then
        v162:Cancel();
        v162 = nil;
    end;
    if v163 then
        v163:Disconnect();
        v163 = nil;
    end;
    if v164 then
        v164:Disconnect();
        v164 = nil;
    end;
end;
v200.Enable = function(v243, v244, v245, v246) --[[ Line: 1058 ]] --[[ Name: Enable ]]
    -- upvalues: l_LocalPlayer_0 (copy), v162 (ref), v163 (ref), v164 (ref), v17 (copy), l_UserInputService_0 (copy), l_Keyboard_0 (copy)
    if v244 then
        if not v243.running then
            if l_LocalPlayer_0.Character then
                v243:OnCharacterAdded(l_LocalPlayer_0.Character);
            end;
            v243.onCharacterAddedConn = l_LocalPlayer_0.CharacterAdded:Connect(function(v247) --[[ Line: 1064 ]]
                -- upvalues: v243 (copy)
                v243:OnCharacterAdded(v247);
            end);
            v243.running = true;
        end;
        v243.touchJumpController = v246;
        if v243.touchJumpController then
            v243.touchJumpController:Enable(v243.jumpEnabled);
        end;
    else
        if v243.running then
            v243:DisconnectEvents();
            if v162 then
                v162:Cancel();
                v162 = nil;
            end;
            if v163 then
                v163:Disconnect();
                v163 = nil;
            end;
            if v164 then
                v164:Disconnect();
                v164 = nil;
            end;
            local _ = nil;
            if if v17 then l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch else l_UserInputService_0.TouchEnabled then
                local l_Character_2 = l_LocalPlayer_0.Character;
                if l_Character_2 then
                    for _, v251 in pairs(l_Character_2:GetChildren()) do
                        if v251:IsA("Tool") then
                            v251.ManualActivationOnly = false;
                        end;
                    end;
                end;
            end;
            v243.running = false;
        end;
        if v243.touchJumpController and not v243.jumpEnabled then
            v243.touchJumpController:Enable(true);
        end;
        v243.touchJumpController = nil;
    end;
    l_Keyboard_0.Enable(v243, v244);
    v243.wasdEnabled = v244 and v245 or false;
    v243.enabled = v244;
end;
v200.OnRenderStepped = function(v252, v253) --[[ Line: 1109 ]] --[[ Name: OnRenderStepped ]]
    -- upvalues: v162 (ref)
    v252.isJumping = false;
    if v162 then
        v162:OnRenderStepped(v253);
        if v162 then
            v252.moveVector = v162.NextActionMoveDirection;
            v252.moveVectorIsCameraRelative = false;
            if v162.NextActionJump then
                v252.isJumping = true;
            end;
        else
            v252.moveVector = v252.keyboardMoveVector;
            v252.moveVectorIsCameraRelative = true;
        end;
    else
        v252.moveVector = v252.keyboardMoveVector;
        v252.moveVectorIsCameraRelative = true;
    end;
    if v252.jumpRequested then
        v252.isJumping = true;
    end;
end;
v200.UpdateMovement = function(v254, v255) --[[ Line: 1144 ]] --[[ Name: UpdateMovement ]]
    if v255 == Enum.UserInputState.Cancel then
        v254.keyboardMoveVector = Vector3.new(0, 0, 0, 0);
        return;
    else
        if v254.wasdEnabled then
            v254.keyboardMoveVector = Vector3.new(v254.leftValue + v254.rightValue, 0, v254.forwardValue + v254.backwardValue);
        end;
        return;
    end;
end;
v200.UpdateJump = function(_) --[[ Line: 1153 ]] --[[ Name: UpdateJump ]]

end;
v200.SetShowPath = function(_, v258) --[[ Line: 1158 ]] --[[ Name: SetShowPath ]]
    -- upvalues: v18 (ref)
    v18 = v258;
end;
v200.GetShowPath = function(_) --[[ Line: 1162 ]] --[[ Name: GetShowPath ]]
    -- upvalues: v18 (ref)
    return v18;
end;
v200.SetWaypointTexture = function(_, v261) --[[ Line: 1166 ]] --[[ Name: SetWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetWaypointTexture(v261);
end;
v200.GetWaypointTexture = function(_) --[[ Line: 1170 ]] --[[ Name: GetWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetWaypointTexture();
end;
v200.SetWaypointRadius = function(_, v264) --[[ Line: 1174 ]] --[[ Name: SetWaypointRadius ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetWaypointRadius(v264);
end;
v200.GetWaypointRadius = function(_) --[[ Line: 1178 ]] --[[ Name: GetWaypointRadius ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetWaypointRadius();
end;
v200.SetEndWaypointTexture = function(_, v267) --[[ Line: 1182 ]] --[[ Name: SetEndWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetEndWaypointTexture(v267);
end;
v200.GetEndWaypointTexture = function(_) --[[ Line: 1186 ]] --[[ Name: GetEndWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetEndWaypointTexture();
end;
v200.SetWaypointsAlwaysOnTop = function(_, v270) --[[ Line: 1190 ]] --[[ Name: SetWaypointsAlwaysOnTop ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetWaypointsAlwaysOnTop(v270);
end;
v200.GetWaypointsAlwaysOnTop = function(_) --[[ Line: 1194 ]] --[[ Name: GetWaypointsAlwaysOnTop ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetWaypointsAlwaysOnTop();
end;
v200.SetFailureAnimationEnabled = function(_, v273) --[[ Line: 1198 ]] --[[ Name: SetFailureAnimationEnabled ]]
    -- upvalues: v19 (ref)
    v19 = v273;
end;
v200.GetFailureAnimationEnabled = function(_) --[[ Line: 1202 ]] --[[ Name: GetFailureAnimationEnabled ]]
    -- upvalues: v19 (ref)
    return v19;
end;
v200.SetIgnoredPartsTag = function(_, v276) --[[ Line: 1206 ]] --[[ Name: SetIgnoredPartsTag ]]
    -- upvalues: v65 (copy)
    v65(v276);
end;
v200.GetIgnoredPartsTag = function(_) --[[ Line: 1210 ]] --[[ Name: GetIgnoredPartsTag ]]
    -- upvalues: v54 (ref)
    return v54;
end;
v200.SetUseDirectPath = function(_, v279) --[[ Line: 1214 ]] --[[ Name: SetUseDirectPath ]]
    -- upvalues: v20 (ref)
    v20 = v279;
end;
v200.GetUseDirectPath = function(_) --[[ Line: 1218 ]] --[[ Name: GetUseDirectPath ]]
    -- upvalues: v20 (ref)
    return v20;
end;
v200.SetAgentSizeIncreaseFactor = function(_, v282) --[[ Line: 1222 ]] --[[ Name: SetAgentSizeIncreaseFactor ]]
    -- upvalues: v21 (ref)
    v21 = v282 / 100 + 1;
end;
v200.GetAgentSizeIncreaseFactor = function(_) --[[ Line: 1226 ]] --[[ Name: GetAgentSizeIncreaseFactor ]]
    -- upvalues: v21 (ref)
    return (v21 - 1) * 100;
end;
v200.SetUnreachableWaypointTimeout = function(_, v285) --[[ Line: 1230 ]] --[[ Name: SetUnreachableWaypointTimeout ]]
    -- upvalues: v22 (ref)
    v22 = v285;
end;
v200.GetUnreachableWaypointTimeout = function(_) --[[ Line: 1234 ]] --[[ Name: GetUnreachableWaypointTimeout ]]
    -- upvalues: v22 (ref)
    return v22;
end;
v200.SetUserJumpEnabled = function(v287, v288) --[[ Line: 1238 ]] --[[ Name: SetUserJumpEnabled ]]
    v287.jumpEnabled = v288;
    if v287.touchJumpController then
        v287.touchJumpController:Enable(v288);
    end;
end;
v200.GetUserJumpEnabled = function(v289) --[[ Line: 1245 ]] --[[ Name: GetUserJumpEnabled ]]
    return v289.jumpEnabled;
end;
v200.MoveTo = function(_, v291, v292, v293) --[[ Line: 1249 ]] --[[ Name: MoveTo ]]
    -- upvalues: l_LocalPlayer_0 (copy), v151 (copy), v172 (copy)
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Character_3 == nil then
        return false;
    else
        local v295 = v151(v291, Vector3.new(0, 1, 0, 0), v293);
        if v295 and v295:IsValidPath() then
            v172(v295, v291, nil, l_Character_3, v292);
            return true;
        else
            return false;
        end;
    end;
end;
return v200;