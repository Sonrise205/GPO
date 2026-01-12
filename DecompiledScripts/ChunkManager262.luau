local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.WavePlane);
local v2 = script.Parent:GetAttribute("PlaneSize") or 100;
local v3 = script:GetAttribute("PlanesPerUpdate") or 1;
local v4 = script:GetAttribute("UpdateRate") or 0.02;
local v5 = nil;
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8, v9, v10) --[[ Line: 60 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v11 = setmetatable({
        _player = v7, 
        _resolution = v10, 
        currentChunkPosition = Vector3.new(0, 0, 0, 0), 
        gridSize = v8, 
        height = v9, 
        _planesList = {}, 
        _noBoneList = {}, 
        _activeThread = nil, 
        _lastUpdate = 0, 
        _couroutineId = 0
    }, v6);
    v11:InitializeGrid();
    v11:enableHeartbeat(true);
    return v11;
end;
v6.Destroy = function(v12) --[[ Line: 81 ]] --[[ Name: Destroy ]]
    v12:enableHeartbeat(false);
    v12._couroutineId = v12._couroutineId + 1;
    if v12._planesList then
        for v13, _ in pairs(v12._planesList) do
            v13:Destroy();
        end;
        v12._planesList = {};
    end;
    v12._activeThread = nil;
    v12._couroutineConnection = nil;
end;
v6.InitializeGrid = function(v15) --[[ Line: 103 ]] --[[ Name: InitializeGrid ]]
    -- upvalues: v2 (copy), v1 (copy), v5 (ref)
    v15.currentChunkPosition = v15:GetPlayerChunkPosition();
    local v16 = v15.gridSize // 2;
    local l_gridSize_0 = v15.gridSize;
    for v18 = -v16, v16 do
        for v19 = -v16, v16 do
            v15:CreatePlane((v15.currentChunkPosition * Vector3.new(1, 0, 1, 0) + Vector3.new(v18, 0, v19)) * v2 + Vector3.new(0, v15.height, 0));
        end;
    end;
    local v20 = v15.currentChunkPosition * v2;
    local l_NoBoneResolution_0 = v1.NoBoneResolution;
    local v22 = {
        {
            x = 0, 
            z = l_gridSize_0
        }, 
        {
            x = l_gridSize_0, 
            z = 0
        }, 
        {
            x = 0, 
            z = -l_gridSize_0
        }, 
        {
            x = -l_gridSize_0, 
            z = 0
        }
    };
    local v23 = {
        {
            x = l_gridSize_0, 
            z = l_gridSize_0
        }, 
        {
            x = l_gridSize_0, 
            z = -l_gridSize_0
        }, 
        {
            x = -l_gridSize_0, 
            z = -l_gridSize_0
        }, 
        {
            x = -l_gridSize_0, 
            z = l_gridSize_0
        }
    };
    for _, v25 in ipairs(v22) do
        local v26 = (v20 + Vector3.new(v25.x * v2, 0, v25.z * v2)) * Vector3.new(1, 0, 1, 0) + v15.height * Vector3.new(0, 1, 0, 0);
        local v27 = v1.new(l_NoBoneResolution_0);
        v27.wavePlane.Mesh.Scale = Vector3.new(l_gridSize_0, 1, l_gridSize_0);
        v27:MoveTo(v26);
        v15._noBoneList[v27] = v26;
    end;
    for _, v29 in ipairs(v23) do
        local v30 = (v20 + Vector3.new(v29.x * v2, 0, v29.z * v2)) * Vector3.new(1, 0, 1, 0) + v15.height * Vector3.new(0, 1, 0, 0);
        local v31 = v1.new(l_NoBoneResolution_0);
        v31.wavePlane.Mesh.Scale = Vector3.new(l_gridSize_0, 1, l_gridSize_0);
        v31:MoveTo(v30);
        v15._noBoneList[v31] = v30;
    end;
    if v5 then
        v5:PivotTo(CFrame.new(v15.currentChunkPosition * v2));
    end;
end;
v6.GetPlayerChunkPosition = function(v32) --[[ Line: 160 ]] --[[ Name: GetPlayerChunkPosition ]]
    -- upvalues: v2 (copy)
    local v33 = v32._player.Character and v32._player.Character:GetPivot().Position;
    if not v33 then
        return (Vector3.new(0, 0, 0, 0));
    else
        local v34 = (v33.X + v2 / 2) // v2;
        local v35 = (v33.Z + v2 / 2) // v2;
        return (Vector3.new(v34, v32.height, v35));
    end;
end;
v6.Update = function(v36) --[[ Line: 173 ]] --[[ Name: Update ]]
    -- upvalues: v5 (ref), v2 (copy)
    local l_currentChunkPosition_0 = v36.currentChunkPosition;
    v36.currentChunkPosition = v36:GetPlayerChunkPosition();
    if l_currentChunkPosition_0 ~= v36.currentChunkPosition then
        v36:UpdateNoBonePosition();
        v36:UpdateGrid();
        if v5 then
            v5:PivotTo(CFrame.new(v36.currentChunkPosition * v2));
        end;
    end;
end;
v6.UpdateNoBonePosition = function(v38) --[[ Line: 187 ]] --[[ Name: UpdateNoBonePosition ]]
    -- upvalues: v2 (copy)
    local l_gridSize_1 = v38.gridSize;
    local v40 = v38.currentChunkPosition * v2;
    local v41 = {
        {
            x = 0, 
            z = l_gridSize_1
        }, 
        {
            x = l_gridSize_1, 
            z = 0
        }, 
        {
            x = 0, 
            z = -l_gridSize_1
        }, 
        {
            x = -l_gridSize_1, 
            z = 0
        }
    };
    local v42 = {
        {
            x = l_gridSize_1, 
            z = l_gridSize_1
        }, 
        {
            x = l_gridSize_1, 
            z = -l_gridSize_1
        }, 
        {
            x = -l_gridSize_1, 
            z = -l_gridSize_1
        }, 
        {
            x = -l_gridSize_1, 
            z = l_gridSize_1
        }
    };
    local v43 = {};
    for v44, _ in pairs(v38._noBoneList) do
        table.insert(v43, v44);
    end;
    local v46 = 1;
    for _, v48 in ipairs(v41) do
        local v49 = (v40 + Vector3.new(v48.x * v2, 0, v48.z * v2)) * Vector3.new(1, 0, 1, 0) + v38.height * Vector3.new(0, 1, 0, 0);
        v43[v46]:MoveTo(v49);
        v46 = v46 + 1;
    end;
    for _, v51 in ipairs(v42) do
        local v52 = (v40 + Vector3.new(v51.x * v2, 0, v51.z * v2)) * Vector3.new(1, 0, 1, 0) + v38.height * Vector3.new(0, 1, 0, 0);
        v43[v46]:MoveTo(v52);
        v46 = v46 + 1;
    end;
end;
v6.CreatePlane = function(v53, v54, v55) --[[ Line: 234 ]] --[[ Name: CreatePlane ]]
    -- upvalues: v1 (copy)
    local v56 = v1.new(v55 or v53._resolution);
    v56:MoveTo(v54);
    v56:Activate();
    v53._planesList[v56] = v54;
end;
v6.UpdateGrid = function(v57) --[[ Line: 243 ]] --[[ Name: UpdateGrid ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_currentChunkPosition_1 = v57.currentChunkPosition;
    local v59 = v57.gridSize // 2;
    local v60 = v57.gridSize * v2;
    local v61 = v57.gridSize * v2;
    local v62 = (l_currentChunkPosition_1 - Vector3.new(1, 1, 1, 0) * v59) * v2;
    local v63 = (l_currentChunkPosition_1 + Vector3.new(1, 1, 1, 0) * v59) * v2;
    if v57._activeThread and coroutine.status(v57._activeThread) ~= "dead" then
        v57._couroutineId = v57._couroutineId + 1;
    end;
    v57._activeThread = coroutine.create(function() --[[ Line: 259 ]]
        -- upvalues: v57 (copy), v62 (copy), v63 (copy), v60 (copy), v61 (copy), v3 (ref)
        local v64 = 0;
        local l__couroutineId_0 = v57._couroutineId;
        for v66, v67 in pairs(v57._planesList) do
            if v57._couroutineId == l__couroutineId_0 then
                if v67.X < v62.X or v67.X > v63.X or v67.Z < v62.Z or v67.Z > v63.Z then
                    local v68 = v67.X - v62.X;
                    local v69 = v67.Z - v62.Z;
                    local v70 = v62.X + v68 % v60;
                    local v71 = v62.Z + v69 % v61;
                    local v72 = Vector3.new(v70, v57.height, v71);
                    v57._planesList[v66] = v72;
                    v66:MoveTo(v72);
                end;
                v64 = v64 + 1;
                if v3 > 0 and v3 <= v64 then
                    coroutine.yield();
                    v64 = 0;
                end;
            else
                break;
            end;
        end;
    end);
end;
v6.enableHeartbeat = function(v73, v74) --[[ Line: 290 ]] --[[ Name: enableHeartbeat ]]
    -- upvalues: l_RunService_0 (copy), v4 (copy)
    if v74 then
        if not v73._couroutineConnection then
            v73._couroutineConnection = l_RunService_0.Heartbeat:Connect(function(v75) --[[ Line: 293 ]]
                -- upvalues: v73 (copy), v4 (ref)
                local l_v73_0 = v73;
                l_v73_0._lastUpdate = l_v73_0._lastUpdate + v75;
                if v73._lastUpdate < v4 then
                    return;
                else
                    if v73._activeThread and coroutine.status(v73._activeThread) ~= "dead" then
                        v73._lastUpdate = 0;
                        coroutine.resume(v73._activeThread);
                    end;
                    return;
                end;
            end);
            return;
        end;
    elseif v73._couroutineConnection then
        v73._couroutineConnection:Disconnect();
        v73._couroutineConnection = nil;
    end;
end;
v6.enableTexturePreload = function(_, v78) --[[ Line: 310 ]] --[[ Name: enableTexturePreload ]]
    -- upvalues: v5 (ref)
    if v78 then
        if not v5 then
            v5 = script.PBRWaterPreLoad:Clone();
            v5.Parent = workspace;
            return;
        end;
    elseif v5 then
        v5:Destroy();
    end;
end;
return table.freeze(v6);