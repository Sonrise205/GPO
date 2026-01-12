local v0 = {
    TIME_VARIANCE = 0.07, 
    COMPARISON_CHECKS = 1, 
    JUMP_WHEN_STUCK = true
};
local l_game_Service_0 = game:FindService("PathfindingService");
local l_game_Service_1 = game:FindService("Players");
local function _(v3, v4) --[[ Line: 19 ]] --[[ Name: output ]]
    v3((v3 == error and "SimplePath Error: " or "SimplePath: ") .. v4);
end;
local v6 = {
    StatusType = {
        Idle = "Idle", 
        Active = "Active"
    }, 
    ErrorType = {
        LimitReached = "LimitReached", 
        TargetUnreachable = "TargetUnreachable", 
        ComputationError = "ComputationError", 
        AgentStuck = "AgentStuck"
    }
};
v6.__index = function(v7, v8) --[[ Line: 36 ]]
    -- upvalues: v6 (copy)
    if v8 == "Stopped" and not v7._humanoid then
        local l_error_0 = error;
        l_error_0((l_error_0 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to use Path.Stopped on a non-humanoid.");
    end;
    return v7._events[v8] and v7._events[v8].Event or v8 == "LastError" and v7._lastError or v8 == "Status" and v7._status or v6[v8];
end;
local l_Part_0 = Instance.new("Part");
l_Part_0.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.Material = Enum.Material.Neon;
l_Part_0.Shape = Enum.PartType.Ball;
local function _(v11, v12) --[[ Line: 54 ]] --[[ Name: declareError ]]
    v11._lastError = v12;
    v11._events.Error:Fire(v12);
end;
local function v19(v14) --[[ Line: 59 ]] --[[ Name: createVisualWaypoints ]]
    -- upvalues: l_Part_0 (copy)
    local v15 = {};
    for _, v17 in ipairs(v14) do
        local v18 = l_Part_0:Clone();
        v18.Position = v17.Position;
        v18.Color = v17 == v14[#v14] and Color3.fromRGB(0, 255, 0) or v17.Action == Enum.PathWaypointAction.Jump and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 139, 0);
        v18.Parent = workspace;
        table.insert(v15, v18);
    end;
    return v15;
end;
local _ = function(v20) --[[ Line: 74 ]] --[[ Name: destroyVisualWaypoints ]]
    if v20 then
        for _, v22 in ipairs(v20) do
            v22:Destroy();
        end;
    end;
end;
local function v26(v24) --[[ Line: 82 ]] --[[ Name: getNonHumanoidWaypoint ]]
    for v25 = 2, #v24._waypoints do
        if vector.magnitude(v24._waypoints[v25].Position - v24._waypoints[v25 - 1].Position) > 0.1 then
            return v25;
        end;
    end;
    return 2;
end;
local function v29(v27) --[[ Line: 91 ]] --[[ Name: setJumpState ]]
    if not v27._humanoid or v27._humanoid.Health <= 0 then
        return;
    else
        local l_State_0 = v27._humanoid:GetState();
        if l_State_0 ~= Enum.HumanoidStateType.Jumping and l_State_0 ~= Enum.HumanoidStateType.Freefall and l_State_0 ~= Enum.HumanoidStateType.Dead then
            v27._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        end;
        return;
    end;
end;
local function _(v30) --[[ Line: 101 ]] --[[ Name: move ]]
    -- upvalues: v29 (copy)
    if v30._waypoints[v30._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
        v29(v30);
    end;
    v30._humanoid:MoveTo(v30._waypoints[v30._currentWaypoint].Position);
end;
local function _(v32) --[[ Line: 108 ]] --[[ Name: disconnectMoveConnection ]]
    if v32._moveConnection then
        v32._moveConnection:Disconnect();
        v32._moveConnection = nil;
    end;
end;
local function _(v34) --[[ Line: 115 ]] --[[ Name: invokeWaypointReached ]]
    local v35 = v34._waypoints[v34._currentWaypoint - 1];
    local v36 = v34._waypoints[v34._currentWaypoint];
    v34._events.WaypointReached:Fire(v34._agent, v35, v36);
end;
local function v58(v38, v39) --[[ Line: 121 ]] --[[ Name: moveToFinished ]]
    -- upvalues: v29 (copy), v6 (copy)
    if not getmetatable(v38) then
        return;
    elseif not v38._humanoid then
        if v39 and v38._currentWaypoint + 1 <= #v38._waypoints then
            local v40 = v38._waypoints[v38._currentWaypoint - 1];
            local v41 = v38._waypoints[v38._currentWaypoint];
            v38._events.WaypointReached:Fire(v38._agent, v40, v41);
            v38._currentWaypoint = v38._currentWaypoint + 1;
            return;
        elseif v39 then
            local l__visualWaypoints_0 = v38._visualWaypoints;
            if l__visualWaypoints_0 then
                for _, v44 in ipairs(l__visualWaypoints_0) do
                    v44:Destroy();
                end;
            end;
            v38._visualWaypoints = nil;
            v38._target = nil;
            v38._events.Reached:Fire(v38._agent, v38._waypoints[v38._currentWaypoint]);
            return;
        else
            local l__visualWaypoints_1 = v38._visualWaypoints;
            if l__visualWaypoints_1 then
                for _, v47 in ipairs(l__visualWaypoints_1) do
                    v47:Destroy();
                end;
            end;
            v38._visualWaypoints = nil;
            v38._target = nil;
            local l_TargetUnreachable_0 = v38.ErrorType.TargetUnreachable;
            v38._lastError = l_TargetUnreachable_0;
            v38._events.Error:Fire(l_TargetUnreachable_0);
            return;
        end;
    elseif v39 and v38._currentWaypoint + 1 <= #v38._waypoints then
        if v38._currentWaypoint + 1 < #v38._waypoints then
            local v49 = v38._waypoints[v38._currentWaypoint - 1];
            local v50 = v38._waypoints[v38._currentWaypoint];
            v38._events.WaypointReached:Fire(v38._agent, v49, v50);
        end;
        v38._currentWaypoint = v38._currentWaypoint + 1;
        if v38._waypoints[v38._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
            v29(v38);
        end;
        v38._humanoid:MoveTo(v38._waypoints[v38._currentWaypoint].Position);
        return;
    elseif v39 then
        if v38._moveConnection then
            v38._moveConnection:Disconnect();
            v38._moveConnection = nil;
        end;
        v38._status = v6.StatusType.Idle;
        local l__visualWaypoints_2 = v38._visualWaypoints;
        if l__visualWaypoints_2 then
            for _, v53 in ipairs(l__visualWaypoints_2) do
                v53:Destroy();
            end;
        end;
        v38._visualWaypoints = nil;
        v38._events.Reached:Fire(v38._agent, v38._waypoints[v38._currentWaypoint]);
        return;
    else
        if v38._moveConnection then
            v38._moveConnection:Disconnect();
            v38._moveConnection = nil;
        end;
        v38._status = v6.StatusType.Idle;
        local l__visualWaypoints_3 = v38._visualWaypoints;
        if l__visualWaypoints_3 then
            for _, v56 in ipairs(l__visualWaypoints_3) do
                v56:Destroy();
            end;
        end;
        v38._visualWaypoints = nil;
        local l_TargetUnreachable_1 = v38.ErrorType.TargetUnreachable;
        v38._lastError = l_TargetUnreachable_1;
        v38._events.Error:Fire(l_TargetUnreachable_1);
        return;
    end;
end;
local function v61(v59) --[[ Line: 159 ]] --[[ Name: comparePosition ]]
    -- upvalues: v29 (copy)
    if v59._currentWaypoint == #v59._waypoints then
        return;
    elseif v59._agent.PrimaryPart == nil then
        return;
    else
        v59._position._count = vector.magnitude(v59._agent.PrimaryPart.Position - v59._position._last) <= 0.07 and v59._position._count + 1 or 0;
        v59._position._last = v59._agent.PrimaryPart.Position;
        if v59._position._count >= v59._settings.COMPARISON_CHECKS then
            if v59._settings.JUMP_WHEN_STUCK then
                v29(v59);
            end;
            local l_AgentStuck_0 = v59.ErrorType.AgentStuck;
            v59._lastError = l_AgentStuck_0;
            v59._events.Error:Fire(l_AgentStuck_0);
        end;
        return;
    end;
end;
v6.GetNearestCharacter = function(v62) --[[ Line: 175 ]] --[[ Name: GetNearestCharacter ]]
    -- upvalues: l_game_Service_1 (copy)
    local v63 = nil;
    local v64 = 1e999;
    for _, v66 in ipairs(l_game_Service_1:GetPlayers()) do
        local l_Character_0 = v66.Character;
        if l_Character_0 then
            local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
            if l_PrimaryPart_0 then
                local v69 = vector.magnitude(l_PrimaryPart_0.Position - v62);
                if v69 < v64 then
                    v63 = l_Character_0;
                    v64 = v69;
                end;
            end;
        end;
    end;
    return v63;
end;
v6.new = function(v70, v71, v72) --[[ Line: 195 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_game_Service_0 (copy), v6 (copy), v29 (copy)
    if not v70 or not v70:IsA("Model") or not v70.PrimaryPart then
        local l_error_1 = error;
        l_error_1((l_error_1 == error and "SimplePath Error: " or "SimplePath: ") .. "Pathfinding agent must be a valid Model Instance with a set PrimaryPart.");
    end;
    local v74 = setmetatable({
        _settings = v72 or v0, 
        _events = {
            Reached = Instance.new("BindableEvent"), 
            WaypointReached = Instance.new("BindableEvent"), 
            Blocked = Instance.new("BindableEvent"), 
            Error = Instance.new("BindableEvent"), 
            Stopped = Instance.new("BindableEvent")
        }, 
        _agent = v70, 
        _humanoid = v70:FindFirstChildOfClass("Humanoid"), 
        _path = l_game_Service_0:CreatePath(v71), 
        _status = "Idle", 
        _t = 0, 
        _position = {
            _last = Vector3.new(0, 0, 0, 0), 
            _count = 0
        }
    }, v6);
    local l_v70_FullName_0 = v70:GetFullName();
    v74._events.Reached.Name = l_v70_FullName_0 .. " ReachedEvent";
    v74._events.WaypointReached.Name = l_v70_FullName_0 .. " WaypointReachedEvent";
    v74._events.Stopped.Name = l_v70_FullName_0 .. " StoppedEvent";
    v74._events.Blocked.Name = l_v70_FullName_0 .. " BlockedEvent";
    v74._events.Error.Name = l_v70_FullName_0 .. " ErrorEvent";
    for v76, v77 in pairs(v0) do
        v74._settings[v76] = v74._settings[v76] == nil and v77 or v74._settings[v76];
    end;
    v74._blockedConnection = v74._path.Blocked:Connect(function(v78) --[[ Line: 233 ]]
        -- upvalues: v74 (copy), v29 (ref)
        local v79 = v74._currentWaypoint or 2;
        if v78 and v79 <= v78 and v78 <= v79 + 1 and v74._humanoid and v74._waypoints then
            v29(v74);
            v74._events.Blocked:Fire(v74._agent, v74._waypoints[v78]);
        end;
    end);
    if typeof(v70) == "Instance" then
        v74._destroyingConnection = v70.Destroying:Connect(function() --[[ Line: 242 ]]
            -- upvalues: v74 (copy)
            if v74._destroyingConnection then
                v74._destroyingConnection:Disconnect();
                v74._destroyingConnection = nil;
            end;
            v74:Destroy();
        end);
    end;
    return v74;
end;
v6.Destroy = function(v80) --[[ Line: 256 ]] --[[ Name: Destroy ]]
    if v80._moveConnection then
        v80._moveConnection:Disconnect();
        v80._moveConnection = nil;
    end;
    if v80._blockedConnection then
        v80._blockedConnection:Disconnect();
        v80._blockedConnection = nil;
    end;
    if v80._destroyingConnection then
        v80._destroyingConnection:Disconnect();
        v80._destroyingConnection = nil;
    end;
    for _, v82 in ipairs(v80._events) do
        v82:Destroy();
    end;
    table.clear(v80._events);
    if rawget(v80, "_visualWaypoints") then
        local l__visualWaypoints_4 = v80._visualWaypoints;
        if l__visualWaypoints_4 then
            for _, v85 in ipairs(l__visualWaypoints_4) do
                v85:Destroy();
            end;
        end;
        v80._visualWaypoints = nil;
    end;
    if v80._path then
        v80._path:Destroy();
    end;
    setmetatable(v80, nil);
    for v86, _ in pairs(v80) do
        v80[v86] = nil;
    end;
end;
v6.Stop = function(v88) --[[ Line: 291 ]] --[[ Name: Stop ]]
    -- upvalues: v6 (copy)
    if not v88._humanoid then
        local l_error_2 = error;
        l_error_2((l_error_2 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to call Path:Stop() on a non-humanoid.");
        return;
    elseif v88._status == v6.StatusType.Idle then
        local function v91(v90) --[[ Line: 297 ]]
            warn(debug.traceback(v90));
        end;
        v91((v91 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to run Path:Stop() in idle state");
        return;
    else
        if v88._moveConnection then
            v88._moveConnection:Disconnect();
            v88._moveConnection = nil;
        end;
        v88._status = v6.StatusType.Idle;
        local l__visualWaypoints_5 = v88._visualWaypoints;
        if l__visualWaypoints_5 then
            for _, v94 in ipairs(l__visualWaypoints_5) do
                v94:Destroy();
            end;
        end;
        v88._visualWaypoints = nil;
        v88._events.Stopped:Fire(v88._model);
        return;
    end;
end;
v6.Run = function(v95, v96) --[[ Line: 308 ]] --[[ Name: Run ]]
    -- upvalues: v58 (copy), v6 (copy), v61 (copy), v19 (copy), v26 (copy)
    if not v96 and not v95._humanoid and v95._target then
        v58(v95, true);
        return;
    elseif not v95._path then
        return;
    else
        if not v96 or typeof(v96) ~= "Vector3" and not v96:IsA("BasePart") then
            local l_error_3 = error;
            l_error_3((l_error_3 == error and "SimplePath Error: " or "SimplePath: ") .. "Pathfinding target must be a valid Vector3 or BasePart.");
        end;
        if os.clock() - v95._t <= v95._settings.TIME_VARIANCE and v95._humanoid then
            task.wait(os.clock() - v95._t);
            local l_LimitReached_0 = v95.ErrorType.LimitReached;
            v95._lastError = l_LimitReached_0;
            v95._events.Error:Fire(l_LimitReached_0);
            return false;
        else
            if v95._humanoid then
                v95._t = os.clock();
            end;
            local v99 = pcall(v95._path.ComputeAsync, v95._path, v95._agent.PrimaryPart.Position, typeof(v96) == "Vector3" and v96 or v96.Position);
            if not v95._path then
                return;
            elseif not v99 or v95._path.Status == Enum.PathStatus.NoPath or #v95._path:GetWaypoints() < 2 or v95._humanoid and v95._humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                local l__visualWaypoints_6 = v95._visualWaypoints;
                if l__visualWaypoints_6 then
                    for _, v102 in ipairs(l__visualWaypoints_6) do
                        v102:Destroy();
                    end;
                end;
                v95._visualWaypoints = nil;
                local l_ComputationError_0 = v95.ErrorType.ComputationError;
                v95._lastError = l_ComputationError_0;
                v95._events.Error:Fire(l_ComputationError_0);
                return false;
            elseif v95._agent.PrimaryPart == nil then
                local l__visualWaypoints_7 = v95._visualWaypoints;
                if l__visualWaypoints_7 then
                    for _, v106 in ipairs(l__visualWaypoints_7) do
                        v106:Destroy();
                    end;
                end;
                v95._visualWaypoints = nil;
                return false;
            else
                v95._status = v95._humanoid and v6.StatusType.Active or v6.StatusType.Idle;
                v95._target = v96;
                pcall(function() --[[ Line: 351 ]]
                    -- upvalues: v95 (copy)
                    v95._agent.PrimaryPart:SetNetworkOwner(nil);
                end);
                v95._waypoints = v95._path:GetWaypoints();
                v95._currentWaypoint = 2;
                if v95._humanoid then
                    v61(v95);
                end;
                local l__visualWaypoints_8 = v95._visualWaypoints;
                if l__visualWaypoints_8 then
                    for _, v109 in ipairs(l__visualWaypoints_8) do
                        v109:Destroy();
                    end;
                end;
                v95._visualWaypoints = v95.Visualize and v19(v95._waypoints);
                v95._moveConnection = v95._humanoid and (v95._moveConnection or v95._humanoid.MoveToFinished:Connect(function(...) --[[ Line: 365 ]]
                    -- upvalues: v58 (ref), v95 (copy)
                    v58(v95, ...);
                end));
                if v95._humanoid then
                    v95._humanoid:MoveTo(v95._waypoints[v95._currentWaypoint].Position);
                elseif #v95._waypoints == 2 then
                    v95._target = nil;
                    local l__visualWaypoints_9 = v95._visualWaypoints;
                    if l__visualWaypoints_9 then
                        for _, v112 in ipairs(l__visualWaypoints_9) do
                            v112:Destroy();
                        end;
                    end;
                    v95._visualWaypoints = nil;
                    v95._events.Reached:Fire(v95._agent, v95._waypoints[2]);
                else
                    v95._currentWaypoint = v26(v95);
                    v58(v95, true);
                end;
                return true;
            end;
        end;
    end;
end;
return v6;