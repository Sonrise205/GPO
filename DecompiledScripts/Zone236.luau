local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_ZoneController_0 = script.ZoneController;
local l_Tracker_0 = l_ZoneController_0.Tracker;
local l_CollectiveWorldModel_0 = l_ZoneController_0.CollectiveWorldModel;
local v7 = require(script.Enum);
local v8 = require(script.Janitor);
local v9 = require(script.Parent.Signal);
local v10 = require(l_ZoneController_0);
local v11 = require(script.ZonePlusReference);
local l_enums_0 = v7.enums;
local l_Heartbeat_0 = l_RunService_0.Heartbeat;
local v14 = l_RunService_0:IsClient() and l_Players_0.LocalPlayer;
local v15 = v11.getObject();
local v16 = l_RunService_0:IsClient() and "Client" or "Server";
if v15 and v15:FindFirstChild(v16) then
    return require(v15.Value);
else
    v11.addToReplicatedStorage();
    local v17 = {};
    v17.__index = v17;
    v17.enum = l_enums_0;
    v17.new = function(v18) --[[ Line: 37 ]] --[[ Name: new ]]
        -- upvalues: v17 (copy), l_enums_0 (copy), v8 (copy), l_HttpService_0 (copy), v10 (copy), v9 (copy), v14 (copy)
        local v19 = setmetatable({}, v17);
        local v20 = typeof(v18);
        if v20 ~= "table" and v20 ~= "Instance" then
            error("The zone container must be a model, folder, basepart or table!");
        end;
        v19.accuracy = l_enums_0.Accuracy.High;
        v19.autoUpdate = true;
        v19.respectUpdateQueue = true;
        local v21 = v8.new();
        v19.janitor = v21;
        v19._updateConnections = v21:add(v8.new(), "destroy");
        v19.container = v18;
        v19.zoneParts = {};
        v19.overlapParams = {};
        v19.region = nil;
        v19.volume = nil;
        v19.boundMin = nil;
        v19.boundMax = nil;
        v19.recommendedMaxParts = nil;
        v19.zoneId = l_HttpService_0:GenerateGUID();
        v19.activeTriggers = {};
        v19.occupants = {};
        v19.trackingTouchedTriggers = {};
        v19.enterDetection = l_enums_0.Detection.Centre;
        v19.exitDetection = l_enums_0.Detection.Centre;
        v19._currentEnterDetection = nil;
        v19._currentExitDetection = nil;
        v19.totalPartVolume = 0;
        v19.allZonePartsAreBlocks = true;
        v19.trackedItems = {};
        v19.settingsGroupName = nil;
        v19.worldModel = workspace;
        v19.onItemDetails = {};
        v19.itemsToUntrack = {};
        v10.updateDetection(v19);
        v19.updated = v21:add(v9.new(), "destroy");
        local v22 = {
            "player", 
            "part", 
            "localPlayer", 
            "item"
        };
        local v23 = {
            "entered", 
            "exited"
        };
        for _, v25 in pairs(v22) do
            local v26 = 0;
            local v27 = 0;
            do
                local l_v26_0, l_v27_0 = v26, v27;
                for _, v31 in pairs(v23) do
                    local v32 = v21:add(v9.new(true), "destroy");
                    local v33 = v31:sub(1, 1):upper() .. v31:sub(2);
                    v19[v25 .. v33] = v32;
                    v32.connectionsChanged:Connect(function(v34) --[[ Line: 108 ]]
                        -- upvalues: v25 (copy), v14 (ref), v33 (copy), l_v27_0 (ref), l_v26_0 (ref), v10 (ref), v19 (copy)
                        if v25 == "localPlayer" and not v14 and v34 == 1 then
                            error(("Can only connect to 'localPlayer%s' on the client!"):format(v33));
                        end;
                        l_v27_0 = l_v26_0;
                        l_v26_0 = l_v26_0 + v34;
                        if l_v27_0 == 0 and l_v26_0 > 0 then
                            v10._registerConnection(v19, v25, v33);
                            return;
                        else
                            if l_v27_0 > 0 and l_v26_0 == 0 then
                                v10._deregisterConnection(v19, v25);
                            end;
                            return;
                        end;
                    end);
                end;
            end;
        end;
        v17.touchedConnectionActions = {};
        for _, v36 in pairs(v22) do
            local v37 = v19[("_%sTouchedZone"):format(v36)];
            if v37 then
                v19.trackingTouchedTriggers[v36] = {};
                v17.touchedConnectionActions[v36] = function(v38) --[[ Line: 132 ]]
                    -- upvalues: v37 (copy), v19 (copy)
                    v37(v19, v38);
                end;
            end;
        end;
        v19:_update();
        v10._registerZone(v19);
        v21:add(function() --[[ Line: 143 ]]
            -- upvalues: v10 (ref), v19 (copy)
            v10._deregisterZone(v19);
        end, true);
        return v19;
    end;
    v17.fromRegion = function(v39, v40) --[[ Line: 150 ]] --[[ Name: fromRegion ]]
        -- upvalues: v17 (copy)
        local l_Model_0 = Instance.new("Model");
        local function v42(v43, v44) --[[ Line: 153 ]] --[[ Name: createCube ]]
            -- upvalues: v42 (copy), l_Model_0 (copy)
            if v44.X > 2024 or v44.Y > 2024 or v44.Z > 2024 then
                local v45 = v44 * 0.25;
                local v46 = v44 * 0.5;
                v42(v43 * CFrame.new(-v45.X, -v45.Y, -v45.Z), v46);
                v42(v43 * CFrame.new(-v45.X, -v45.Y, v45.Z), v46);
                v42(v43 * CFrame.new(-v45.X, v45.Y, -v45.Z), v46);
                v42(v43 * CFrame.new(-v45.X, v45.Y, v45.Z), v46);
                v42(v43 * CFrame.new(v45.X, -v45.Y, -v45.Z), v46);
                v42(v43 * CFrame.new(v45.X, -v45.Y, v45.Z), v46);
                v42(v43 * CFrame.new(v45.X, v45.Y, -v45.Z), v46);
                v42(v43 * CFrame.new(v45.X, v45.Y, v45.Z), v46);
                return;
            else
                local l_Part_0 = Instance.new("Part");
                l_Part_0.CFrame = v43;
                l_Part_0.Size = v44;
                l_Part_0.Anchored = true;
                l_Part_0.Parent = l_Model_0;
                return;
            end;
        end;
        v42(v39, v40);
        local v48 = v17.new(l_Model_0);
        v48:relocate();
        return v48;
    end;
    v17._calculateRegion = function(_, v50, v51) --[[ Line: 180 ]] --[[ Name: _calculateRegion ]]
        local v52 = {
            Min = {}, 
            Max = {}
        };
        for v53, v54 in pairs(v52) do
            v54.Values = {};
            v54.parseCheck = function(v55, v56) --[[ Line: 184 ]] --[[ Name: parseCheck ]]
                -- upvalues: v53 (copy)
                if v53 == "Min" then
                    return v55 <= v56;
                elseif v53 == "Max" then
                    return v56 <= v55;
                else
                    return;
                end;
            end;
            v54.parse = function(v57, v58) --[[ Line: 191 ]] --[[ Name: parse ]]
                for v59, v60 in pairs(v58) do
                    local v61 = v57.Values[v59] or v60;
                    if v57.parseCheck(v60, v61) then
                        v57.Values[v59] = v60;
                    end;
                end;
            end;
        end;
        for _, v63 in pairs(v50) do
            local v64 = v63.Size * 0.5;
            local v65 = {
                v63.CFrame * CFrame.new(-v64.X, -v64.Y, -v64.Z), 
                v63.CFrame * CFrame.new(-v64.X, -v64.Y, v64.Z), 
                v63.CFrame * CFrame.new(-v64.X, v64.Y, -v64.Z), 
                v63.CFrame * CFrame.new(-v64.X, v64.Y, v64.Z), 
                v63.CFrame * CFrame.new(v64.X, -v64.Y, -v64.Z), 
                v63.CFrame * CFrame.new(v64.X, -v64.Y, v64.Z), 
                v63.CFrame * CFrame.new(v64.X, v64.Y, -v64.Z), 
                v63.CFrame * CFrame.new(v64.X, v64.Y, v64.Z)
            };
            for _, v67 in pairs(v65) do
                local l_v67_Components_0, v69, v70 = v67:GetComponents();
                local v71 = {
                    l_v67_Components_0, 
                    v69, 
                    v70
                };
                v52.Min:parse(v71);
                v52.Max:parse(v71);
            end;
        end;
        local v72 = {};
        local v73 = {};
        local function _(v74) --[[ Line: 223 ]] --[[ Name: roundToFour ]]
            return math.floor((v74 + 2) / 4) * 4;
        end;
        for v76, v77 in pairs(v52) do
            for _, v79 in pairs(v77.Values) do
                local v80 = v76 == "Min" and v72 or v73;
                local l_v79_0 = v79;
                if not v51 then
                    l_v79_0 = math.floor((v79 + (v76 == "Min" and -2 or 2) + 2) / 4) * 4;
                end;
                table.insert(v80, l_v79_0);
            end;
        end;
        local v82 = Vector3.new(unpack(v72));
        local v83 = Vector3.new(unpack(v73));
        return Region3.new(v82, v83), v82, v83;
    end;
    v17._displayBounds = function(v84) --[[ Line: 246 ]] --[[ Name: _displayBounds ]]
        if not v84.displayBoundParts then
            v84.displayBoundParts = true;
            local v85 = {
                BoundMin = v84.boundMin, 
                BoundMax = v84.boundMax
            };
            for v86, v87 in pairs(v85) do
                local l_Part_1 = Instance.new("Part");
                l_Part_1.Anchored = true;
                l_Part_1.CanCollide = false;
                l_Part_1.Transparency = 0.5;
                l_Part_1.Size = Vector3.new(1, 1, 1, 0);
                l_Part_1.Color = Color3.fromRGB(255, 0, 0);
                l_Part_1.CFrame = CFrame.new(v87);
                l_Part_1.Name = v86;
                l_Part_1.Parent = workspace;
                v84.janitor:add(l_Part_1, "Destroy");
            end;
        end;
    end;
    v17._update = function(v89) --[[ Line: 265 ]] --[[ Name: _update ]]
        -- upvalues: l_RunService_0 (copy)
        local l_container_0 = v89.container;
        local v91 = {};
        local v92 = 0;
        v89._updateConnections:clean();
        local v93 = typeof(l_container_0);
        local v94 = {};
        if v93 == "table" then
            for _, v96 in pairs(l_container_0) do
                if v96:IsA("BasePart") then
                    table.insert(v91, v96);
                end;
            end;
        elseif v93 == "Instance" then
            if l_container_0:IsA("BasePart") then
                table.insert(v91, l_container_0);
            else
                table.insert(v94, l_container_0);
                for _, v98 in pairs(l_container_0:GetDescendants()) do
                    if v98:IsA("BasePart") then
                        table.insert(v91, v98);
                    else
                        table.insert(v94, v98);
                    end;
                end;
            end;
        end;
        v89.zoneParts = v91;
        v89.overlapParams = {};
        local v99 = true;
        for _, v101 in pairs(v91) do
            local _, l_result_0 = pcall(function() --[[ Line: 299 ]]
                -- upvalues: v101 (copy)
                return v101.Shape.Name;
            end);
            if l_result_0 ~= "Block" then
                v99 = false;
            end;
        end;
        v89.allZonePartsAreBlocks = v99;
        local v104 = OverlapParams.new();
        v104.FilterType = Enum.RaycastFilterType.Include;
        v104.MaxParts = #v91;
        v104.FilterDescendantsInstances = v91;
        v89.overlapParams.zonePartsWhitelist = v104;
        local v105 = OverlapParams.new();
        v105.FilterType = Enum.RaycastFilterType.Exclude;
        v105.FilterDescendantsInstances = v91;
        v89.overlapParams.zonePartsIgnorelist = v105;
        local function v110() --[[ Line: 319 ]] --[[ Name: update ]]
            -- upvalues: v89 (copy), v92 (ref), l_RunService_0 (ref)
            if v89.autoUpdate then
                local v106 = tick();
                if v89.respectUpdateQueue then
                    v92 = v92 + 1;
                    v106 = v106 + 0.1;
                end;
                local v107 = nil;
                do
                    local l_v106_0, l_v107_0 = v106, v107;
                    l_v107_0 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 327 ]]
                        -- upvalues: l_v106_0 (ref), l_v107_0 (ref), v89 (ref), v92 (ref)
                        if tick() >= l_v106_0 then
                            l_v107_0:Disconnect();
                            if v89.respectUpdateQueue then
                                v92 = v92 - 1;
                            end;
                            if v92 == 0 and v89.zoneId then
                                v89:_update();
                            end;
                        end;
                    end);
                end;
            end;
        end;
        local v111 = {
            "Size", 
            "Position"
        };
        local function _(v112) --[[ Line: 341 ]] --[[ Name: verifyDefaultCollision ]]
            if v112.CollisionGroupId ~= 0 then
                error("Zone parts must belong to the 'Default' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.");
            end;
        end;
        for _, v115 in pairs(v91) do
            for _, v117 in pairs(v111) do
                v89._updateConnections:add(v115:GetPropertyChangedSignal(v117):Connect(v110), "Disconnect");
            end;
            if v115.CollisionGroupId ~= 0 then
                error("Zone parts must belong to the 'Default' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.");
            end;
            v89._updateConnections:add(v115:GetPropertyChangedSignal("CollisionGroupId"):Connect(function() --[[ Line: 351 ]]
                -- upvalues: v115 (copy)
                if v115.CollisionGroupId ~= 0 then
                    error("Zone parts must belong to the 'Default' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.");
                end;
            end), "Disconnect");
        end;
        local v118 = {
            "ChildAdded", 
            "ChildRemoved"
        };
        for _, _ in pairs(v94) do
            for _, v122 in pairs(v118) do
                v89._updateConnections:add(v89.container[v122]:Connect(function(v123) --[[ Line: 358 ]]
                    -- upvalues: v89 (copy), v92 (ref), l_RunService_0 (ref)
                    if v123:IsA("BasePart") and v89.autoUpdate then
                        local v124 = tick();
                        if v89.respectUpdateQueue then
                            v92 = v92 + 1;
                            v124 = v124 + 0.1;
                        end;
                        local v125 = nil;
                        do
                            local l_v124_0, l_v125_0 = v124, v125;
                            l_v125_0 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 327 ]]
                                -- upvalues: l_v124_0 (ref), l_v125_0 (ref), v89 (ref), v92 (ref)
                                if tick() >= l_v124_0 then
                                    l_v125_0:Disconnect();
                                    if v89.respectUpdateQueue then
                                        v92 = v92 - 1;
                                    end;
                                    if v92 == 0 and v89.zoneId then
                                        v89:_update();
                                    end;
                                end;
                            end);
                        end;
                    end;
                end), "Disconnect");
            end;
        end;
        local v128, v129, v130 = v89:_calculateRegion(v91);
        local v131, _, _ = v89:_calculateRegion(v91, true);
        v89.region = v128;
        v89.exactRegion = v131;
        v89.boundMin = v129;
        v89.boundMax = v130;
        local l_Size_0 = v128.Size;
        v89.volume = l_Size_0.X * l_Size_0.Y * l_Size_0.Z;
        v89:_updateTouchedConnections();
        v89.updated:Fire();
    end;
    v17._updateOccupants = function(v135, v136, v137) --[[ Line: 379 ]] --[[ Name: _updateOccupants ]]
        local v138 = v135.occupants[v136];
        if not v138 then
            v138 = {};
            v135.occupants[v136] = v138;
        end;
        local v139 = {};
        for v140, v141 in pairs(v138) do
            local v142 = v137[v140];
            if v142 == nil or v142 ~= v141 then
                v138[v140] = nil;
                if not v139.exited then
                    v139.exited = {};
                end;
                table.insert(v139.exited, v140);
            end;
        end;
        for v143, _ in pairs(v137) do
            if v138[v143] == nil then
                v138[v143] = not v143:IsA("Player") or v143.Character or true;
                if not v139.entered then
                    v139.entered = {};
                end;
                table.insert(v139.entered, v143);
            end;
        end;
        return v139;
    end;
    v17._formTouchedConnection = function(v145, v146) --[[ Line: 409 ]] --[[ Name: _formTouchedConnection ]]
        -- upvalues: v8 (copy)
        local v147 = "_touchedJanitor" .. v146;
        local v148 = v145[v147];
        if v148 then
            v148:clean();
        else
            v145[v147] = v145.janitor:add(v8.new(), "destroy");
        end;
        v145:_updateTouchedConnection(v146);
    end;
    v17._updateTouchedConnection = function(v149, v150) --[[ Line: 421 ]] --[[ Name: _updateTouchedConnection ]]
        local v151 = v149["_touchedJanitor" .. v150];
        if not v151 then
            return;
        else
            for _, v153 in pairs(v149.zoneParts) do
                v151:add(v153.Touched:Connect(v149.touchedConnectionActions[v150], v149), "Disconnect");
            end;
            return;
        end;
    end;
    v17._updateTouchedConnections = function(v154) --[[ Line: 430 ]] --[[ Name: _updateTouchedConnections ]]
        for v155, _ in pairs(v154.touchedConnectionActions) do
            local v157 = v154["_touchedJanitor" .. v155];
            if v157 then
                v157:cleanup();
                v154:_updateTouchedConnection(v155);
            end;
        end;
    end;
    v17._disconnectTouchedConnection = function(v158, v159) --[[ Line: 441 ]] --[[ Name: _disconnectTouchedConnection ]]
        local v160 = "_touchedJanitor" .. v159;
        local v161 = v158[v160];
        if v161 then
            v161:cleanup();
            v158[v160] = nil;
        end;
    end;
    local function _(v162, v163) --[[ Line: 450 ]] --[[ Name: round ]]
        return math.round(v162 * 10 ^ v163) * 10 ^ (-v163);
    end;
    v17._partTouchedZone = function(v165, v166) --[[ Line: 453 ]] --[[ Name: _partTouchedZone ]]
        -- upvalues: v8 (copy), l_Heartbeat_0 (copy), l_enums_0 (copy)
        local l_part_0 = v165.trackingTouchedTriggers.part;
        if l_part_0[v166] then
            return;
        else
            local v168 = 0;
            local v169 = false;
            local l_Position_0 = v166.Position;
            local v171 = tick();
            local v172 = v165.janitor:add(v8.new(), "destroy");
            l_part_0[v166] = v172;
            local v173 = {
                Seat = true, 
                VehicleSeat = true
            };
            local v174 = {
                HumanoidRootPart = true
            };
            if not v173[v166.ClassName] and v174[v166.Name] then
                v166.CanTouch = false;
            end;
            local v175 = math.round(v166.Size.X * v166.Size.Y * v166.Size.Z * 100000) * 1.0E-5;
            v165.totalPartVolume = v165.totalPartVolume + v175;
            v172:add(l_Heartbeat_0:Connect(function() --[[ Line: 471 ]]
                -- upvalues: v168 (ref), l_enums_0 (ref), v165 (copy), v166 (copy), v169 (ref), l_Position_0 (ref), v171 (ref), v172 (copy)
                local v176 = tick();
                if v168 <= v176 then
                    local v177 = l_enums_0.Accuracy.getProperty(v165.accuracy);
                    v168 = v176 + v177;
                    local v178 = v165:findPoint(v166.CFrame) or v165:findPart(v166);
                    if not v169 then
                        if v178 then
                            v169 = true;
                            v165.partEntered:Fire(v166);
                            return;
                        elseif (v166.Position - l_Position_0).Magnitude > 1.5 and v177 <= v176 - v171 then
                            v172:cleanup();
                            return;
                        end;
                    elseif not v178 then
                        v169 = false;
                        l_Position_0 = v166.Position;
                        v171 = tick();
                        v165.partExited:Fire(v166);
                    end;
                end;
            end), "Disconnect");
            v172:add(function() --[[ Line: 502 ]]
                -- upvalues: l_part_0 (copy), v166 (copy), v165 (copy), v175 (copy)
                l_part_0[v166] = nil;
                v166.CanTouch = true;
                v165.totalPartVolume = math.round((v165.totalPartVolume - v175) * 100000) * 1.0E-5;
            end, true);
            return;
        end;
    end;
    local v182 = {
        Ball = function(v179) --[[ Line: 510 ]]
            return "GetPartBoundsInRadius", {
                v179.Position, 
                v179.Size.X
            };
        end, 
        Block = function(v180) --[[ Line: 513 ]]
            return "GetPartBoundsInBox", {
                v180.CFrame, 
                v180.Size
            };
        end, 
        Other = function(v181) --[[ Line: 516 ]]
            return "GetPartsInPart", {
                v181
            };
        end
    };
    v17._getRegionConstructor = function(v183, v184, v185) --[[ Line: 520 ]] --[[ Name: _getRegionConstructor ]]
        -- upvalues: v182 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 521 ]]
            -- upvalues: v184 (copy)
            return v184.Shape.Name;
        end);
        local v188 = nil;
        local v189 = nil;
        if l_status_1 and v183.allZonePartsAreBlocks then
            local v190 = v182[l_result_1];
            if v190 then
                local v191, v192 = v190(v184);
                v188 = v191;
                v189 = v192;
            end;
        end;
        if not v188 then
            local v193, v194 = v182.Other(v184);
            v188 = v193;
            v189 = v194;
        end;
        if v185 then
            table.insert(v189, v185);
        end;
        return v188, v189;
    end;
    v17.findLocalPlayer = function(v195) --[[ Line: 541 ]] --[[ Name: findLocalPlayer ]]
        -- upvalues: v14 (copy)
        if not v14 then
            error("Can only call 'findLocalPlayer' on the client!");
        end;
        return v195:findPlayer(v14);
    end;
    v17._find = function(v196, v197, v198) --[[ Line: 548 ]] --[[ Name: _find ]]
        -- upvalues: v10 (copy)
        v10.updateDetection(v196);
        local v199 = v10.trackers[v197];
        local v200 = v10.getTouchingZones(v198, false, v196._currentEnterDetection, v199);
        for _, v202 in pairs(v200) do
            if v202 == v196 then
                return true;
            end;
        end;
        return false;
    end;
    v17.findPlayer = function(v203, v204) --[[ Line: 560 ]] --[[ Name: findPlayer ]]
        local l_Character_0 = v204.Character;
        if not (l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid")) then
            return false;
        else
            return v203:_find("player", v204.Character);
        end;
    end;
    v17.findItem = function(v206, v207) --[[ Line: 569 ]] --[[ Name: findItem ]]
        return v206:_find("item", v207);
    end;
    v17.findPart = function(v208, v209) --[[ Line: 573 ]] --[[ Name: findPart ]]
        local v210, v211 = v208:_getRegionConstructor(v209, v208.overlapParams.zonePartsWhitelist);
        local v212 = v208.worldModel[v210](v208.worldModel, unpack(v211));
        if #v212 > 0 then
            return true, v212;
        else
            return false;
        end;
    end;
    v17.getCheckerPart = function(v213) --[[ Line: 583 ]] --[[ Name: getCheckerPart ]]
        -- upvalues: v10 (copy)
        local l_checkerPart_0 = v213.checkerPart;
        if not l_checkerPart_0 then
            l_checkerPart_0 = v213.janitor:add(Instance.new("Part"), "Destroy");
            l_checkerPart_0.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
            l_checkerPart_0.Name = "ZonePlusCheckerPart";
            l_checkerPart_0.Anchored = true;
            l_checkerPart_0.Transparency = 1;
            l_checkerPart_0.CanCollide = false;
            v213.checkerPart = l_checkerPart_0;
        end;
        local l_worldModel_0 = v213.worldModel;
        if l_worldModel_0 == workspace then
            l_worldModel_0 = v10.getWorkspaceContainer();
        end;
        if l_checkerPart_0.Parent ~= l_worldModel_0 then
            l_checkerPart_0.Parent = l_worldModel_0;
        end;
        return l_checkerPart_0;
    end;
    v17.findPoint = function(v216, v217) --[[ Line: 604 ]] --[[ Name: findPoint ]]
        local l_v217_0 = v217;
        if typeof(v217) == "Vector3" then
            l_v217_0 = CFrame.new(v217);
        end;
        local v219 = v216:getCheckerPart();
        v219.CFrame = l_v217_0;
        local v220, v221 = v216:_getRegionConstructor(v219, v216.overlapParams.zonePartsWhitelist);
        local v222 = v216.worldModel[v220](v216.worldModel, unpack(v221));
        if #v222 > 0 then
            return true, v222;
        else
            return false;
        end;
    end;
    v17._getAll = function(v223, v224) --[[ Line: 621 ]] --[[ Name: _getAll ]]
        -- upvalues: v10 (copy)
        v10.updateDetection(v223);
        local v225 = {};
        local v226 = v10._getZonesAndItems(v224, {
            self = true
        }, v223.volume, false, v223._currentEnterDetection)[v223];
        if v226 then
            for v227, _ in pairs(v226) do
                table.insert(v225, v227);
            end;
        end;
        return v225;
    end;
    v17.getPlayers = function(v229) --[[ Line: 634 ]] --[[ Name: getPlayers ]]
        return v229:_getAll("player");
    end;
    v17.getItems = function(v230) --[[ Line: 638 ]] --[[ Name: getItems ]]
        return v230:_getAll("item");
    end;
    v17.getParts = function(v231) --[[ Line: 642 ]] --[[ Name: getParts ]]
        local v232 = {};
        if v231.activeTriggers.part then
            local l_part_1 = v231.trackingTouchedTriggers.part;
            for v234, _ in pairs(l_part_1) do
                table.insert(v232, v234);
            end;
            return v232;
        else
            local l_PartBoundsInBox_0 = v231.worldModel:GetPartBoundsInBox(v231.region.CFrame, v231.region.Size, v231.overlapParams.zonePartsIgnorelist);
            for _, v238 in pairs(l_PartBoundsInBox_0) do
                if v231:findPart(v238) then
                    table.insert(v232, v238);
                end;
            end;
            return v232;
        end;
    end;
    v17.getRandomPoint = function(v239) --[[ Line: 663 ]] --[[ Name: getRandomPoint ]]
        local l_exactRegion_0 = v239.exactRegion;
        local l_Size_1 = l_exactRegion_0.Size;
        local l_CFrame_0 = l_exactRegion_0.CFrame;
        local v243 = Random.new();
        local v244 = nil;
        local v245 = nil;
        local v246 = nil;
        local v247 = nil;
        repeat
            v244 = l_CFrame_0 * CFrame.new(v243:NextNumber(-l_Size_1.X / 2, l_Size_1.X / 2), v243:NextNumber(-l_Size_1.Y / 2, l_Size_1.Y / 2), v243:NextNumber(-l_Size_1.Z / 2, l_Size_1.Z / 2));
            local v248, v249 = v239:findPoint(v244);
            v245 = v248;
            v246 = v249;
            if v245 then
                v247 = true;
            end;
        until v247;
        return v244.Position, v246;
    end;
    v17.setAccuracy = function(v250, v251) --[[ Line: 682 ]] --[[ Name: setAccuracy ]]
        -- upvalues: l_enums_0 (copy)
        local v252 = tonumber(v251);
        if not v252 then
            v252 = l_enums_0.Accuracy[v251];
            if not v252 then
                error(("'%s' is an invalid enumName!"):format(v251));
            end;
        elseif not l_enums_0.Accuracy.getName(v252) then
            error(("%s is an invalid enumId!"):format(v252));
        end;
        v250.accuracy = v252;
    end;
    v17.setDetection = function(v253, v254) --[[ Line: 698 ]] --[[ Name: setDetection ]]
        -- upvalues: l_enums_0 (copy)
        local v255 = tonumber(v254);
        if not v255 then
            v255 = l_enums_0.Detection[v254];
            if not v255 then
                error(("'%s' is an invalid enumName!"):format(v254));
            end;
        elseif not l_enums_0.Detection.getName(v255) then
            error(("%s is an invalid enumId!"):format(v255));
        end;
        v253.enterDetection = v255;
        v253.exitDetection = v255;
    end;
    v17.trackItem = function(v256, v257) --[[ Line: 715 ]] --[[ Name: trackItem ]]
        -- upvalues: v8 (copy), l_Tracker_0 (copy)
        local v258 = v257:IsA("BasePart");
        local v259 = false;
        if not v258 then
            v259 = v257:FindFirstChildOfClass("Humanoid") and v257:FindFirstChild("HumanoidRootPart");
        end;
        assert(v258 or v259, "Only BaseParts or Characters/NPCs can be tracked!");
        if v256.trackedItems[v257] then
            return;
        else
            if v256.itemsToUntrack[v257] then
                v256.itemsToUntrack[v257] = nil;
            end;
            local v260 = v256.janitor:add(v8.new(), "destroy");
            local v261 = {
                janitor = v260, 
                item = v257, 
                isBasePart = v258, 
                isCharacter = v259
            };
            v256.trackedItems[v257] = v261;
            v260:add(v257.AncestryChanged:Connect(function() --[[ Line: 740 ]]
                -- upvalues: v257 (copy), v256 (copy)
                if not v257:IsDescendantOf(game) then
                    v256:untrackItem(v257);
                end;
            end), "Disconnect");
            require(l_Tracker_0).itemAdded:Fire(v261);
            return;
        end;
    end;
    v17.untrackItem = function(v262, v263) --[[ Line: 750 ]] --[[ Name: untrackItem ]]
        -- upvalues: l_Tracker_0 (copy)
        local v264 = v262.trackedItems[v263];
        if v264 then
            v264.janitor:destroy();
        end;
        v262.trackedItems[v263] = nil;
        require(l_Tracker_0).itemRemoved:Fire(v264);
    end;
    v17.bindToGroup = function(v265, v266) --[[ Line: 761 ]] --[[ Name: bindToGroup ]]
        -- upvalues: v10 (copy)
        v265:unbindFromGroup();
        (v10.getGroup(v266) or v10.setGroup(v266))._memberZones[v265.zoneId] = v265;
        v265.settingsGroupName = v266;
    end;
    v17.unbindFromGroup = function(v267) --[[ Line: 768 ]] --[[ Name: unbindFromGroup ]]
        -- upvalues: v10 (copy)
        if v267.settingsGroupName then
            local v268 = v10.getGroup(v267.settingsGroupName);
            if v268 then
                v268._memberZones[v267.zoneId] = nil;
            end;
            v267.settingsGroupName = nil;
        end;
    end;
    v17.relocate = function(v269) --[[ Line: 778 ]] --[[ Name: relocate ]]
        -- upvalues: l_CollectiveWorldModel_0 (copy)
        if v269.hasRelocated then
            return;
        else
            local v270 = require(l_CollectiveWorldModel_0).setupWorldModel(v269);
            v269.worldModel = v270;
            v269.hasRelocated = true;
            local l_container_1 = v269.container;
            if typeof(l_container_1) == "table" then
                l_container_1 = Instance.new("Folder");
                for _, v273 in pairs(v269.zoneParts) do
                    v273.Parent = l_container_1;
                end;
            end;
            v269.relocationContainer = v269.janitor:add(l_container_1, "Destroy", "RelocationContainer");
            l_container_1.Parent = v270;
            return;
        end;
    end;
    v17._onItemCallback = function(v274, v275, v276, v277, v278) --[[ Line: 799 ]] --[[ Name: _onItemCallback ]]
        local v279 = v274.onItemDetails[v277];
        if not v279 then
            v279 = {};
            v274.onItemDetails[v277] = v279;
        end;
        if #v279 == 0 then
            v274.itemsToUntrack[v277] = true;
        end;
        table.insert(v279, v277);
        v274:trackItem(v277);
        local function _() --[[ Line: 811 ]] --[[ Name: triggerCallback ]]
            -- upvalues: v278 (copy), v274 (copy), v277 (copy)
            v278();
            if v274.itemsToUntrack[v277] then
                v274.itemsToUntrack[v277] = nil;
                v274:untrackItem(v277);
            end;
        end;
        if v274:findItem(v277) == v276 then
            v278();
            if v274.itemsToUntrack[v277] then
                v274.itemsToUntrack[v277] = nil;
                v274:untrackItem(v277);
                return;
            end;
        else
            local v281 = nil;
            do
                local l_v281_0 = v281;
                l_v281_0 = v274[v275]:Connect(function(v283) --[[ Line: 824 ]]
                    -- upvalues: l_v281_0 (ref), v277 (copy), v278 (copy), v274 (copy)
                    if l_v281_0 and v283 == v277 then
                        l_v281_0:Disconnect();
                        l_v281_0 = nil;
                        v278();
                        if v274.itemsToUntrack[v277] then
                            v274.itemsToUntrack[v277] = nil;
                            v274:untrackItem(v277);
                        end;
                    end;
                end);
            end;
        end;
    end;
    v17.onItemEnter = function(v284, ...) --[[ Line: 834 ]] --[[ Name: onItemEnter ]]
        v284:_onItemCallback("itemEntered", true, ...);
    end;
    v17.onItemExit = function(v285, ...) --[[ Line: 838 ]] --[[ Name: onItemExit ]]
        v285:_onItemCallback("itemExited", false, ...);
    end;
    v17.destroy = function(v286) --[[ Line: 842 ]] --[[ Name: destroy ]]
        v286:unbindFromGroup();
        v286.janitor:destroy();
    end;
    v17.Destroy = v17.destroy;
    return v17;
end;