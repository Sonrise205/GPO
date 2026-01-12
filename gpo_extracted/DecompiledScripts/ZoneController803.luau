local v0 = require(script.Parent.Janitor);
local v1 = require(script.Parent.Enum);
local _ = require(script.Parent.Signal);
local v3 = require(script.Tracker);
local v4 = require(script.CollectiveWorldModel);
local l_enums_0 = v1.enums;
local l_Players_0 = game:GetService("Players");
local v7 = {};
local v8 = 0;
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = 0;
local l_RunService_0 = game:GetService("RunService");
local l_Heartbeat_0 = l_RunService_0.Heartbeat;
local v18 = {};
local v19 = l_RunService_0:IsClient() and l_Players_0.LocalPlayer;
local v20 = {};
local v21 = {
    player = v3.new("player"), 
    item = v3.new("item")
};
v20.trackers = v21;
local _ = function(v22) --[[ Line: 31 ]] --[[ Name: dictLength ]]
    local v23 = 0;
    for _, _ in pairs(v22) do
        v23 = v23 + 1;
    end;
    return v23;
end;
local function _(v27, v28, v29) --[[ Line: 39 ]] --[[ Name: fillOccupants ]]
    local v30 = v27[v28];
    if not v30 then
        v30 = {};
        v27[v28] = v30;
    end;
    v30[v29] = v29:IsA("Player") and v29.Character or true;
end;
local v42 = {
    player = function(v32) --[[ Line: 50 ]]
        -- upvalues: v20 (copy), v7 (copy), v8 (ref)
        return v20._getZonesAndItems("player", v7, v8, true, v32);
    end, 
    localPlayer = function(v33) --[[ Line: 53 ]]
        -- upvalues: v19 (copy), v20 (copy), v21 (copy)
        local v34 = {};
        local l_Character_0 = v19.Character;
        if not l_Character_0 then
            return v34;
        else
            local v36 = v20.getTouchingZones(l_Character_0, true, v33, v21.player);
            for _, v38 in pairs(v36) do
                if v38.activeTriggers.localPlayer then
                    local l_v19_0 = v19;
                    local v40 = v34[v38];
                    if not v40 then
                        v40 = {};
                        v34[v38] = v40;
                    end;
                    v40[l_v19_0] = l_v19_0:IsA("Player") and l_v19_0.Character or true;
                end;
            end;
            return v34;
        end;
    end, 
    item = function(v41) --[[ Line: 67 ]]
        -- upvalues: v20 (copy), v7 (copy), v8 (ref)
        return v20._getZonesAndItems("item", v7, v8, true, v41);
    end
};
v20._registerZone = function(v43) --[[ Line: 75 ]] --[[ Name: _registerZone ]]
    -- upvalues: v10 (copy), v0 (copy), v20 (copy)
    v10[v43] = true;
    local v44 = v43.janitor:add(v0.new(), "destroy");
    v43._registeredJanitor = v44;
    v44:add(v43.updated:Connect(function() --[[ Line: 79 ]]
        -- upvalues: v20 (ref)
        v20._updateZoneDetails();
    end), "Disconnect");
    v20._updateZoneDetails();
end;
v20._deregisterZone = function(v45) --[[ Line: 85 ]] --[[ Name: _deregisterZone ]]
    -- upvalues: v10 (copy), v20 (copy)
    v10[v45] = nil;
    v45._registeredJanitor:destroy();
    v45._registeredJanitor = nil;
    v20._updateZoneDetails();
end;
v20._registerConnection = function(v46, v47) --[[ Line: 92 ]] --[[ Name: _registerConnection ]]
    -- upvalues: v15 (ref), v7 (copy), v20 (copy), v9 (copy), v42 (copy)
    local l_activeTriggers_0 = v46.activeTriggers;
    local v49 = 0;
    for _, _ in pairs(l_activeTriggers_0) do
        v49 = v49 + 1;
    end;
    local l_v49_0 = v49;
    v15 = v15 + 1;
    if l_v49_0 == 0 then
        v7[v46] = true;
        v20._updateZoneDetails();
    end;
    l_activeTriggers_0 = v9[v47];
    v9[v47] = l_activeTriggers_0 and l_activeTriggers_0 + 1 or 1;
    v46.activeTriggers[v47] = true;
    if v46.touchedConnectionActions[v47] then
        v46:_formTouchedConnection(v47);
    end;
    if v42[v47] then
        v20._formHeartbeat(v47);
    end;
end;
v20.updateDetection = function(v53) --[[ Line: 112 ]] --[[ Name: updateDetection ]]
    -- upvalues: v3 (copy), l_enums_0 (copy)
    local v54 = {
        enterDetection = "_currentEnterDetection", 
        exitDetection = "_currentExitDetection"
    };
    for v55, v56 in pairs(v54) do
        local v57 = v53[v55];
        local v58 = v3.getCombinedTotalVolumes();
        if v57 == l_enums_0.Detection.Automatic then
            v57 = if v58 > 729000 then l_enums_0.Detection.Centre else l_enums_0.Detection.WholeBody;
        end;
        v53[v56] = v57;
    end;
end;
v20._formHeartbeat = function(v59) --[[ Line: 131 ]] --[[ Name: _formHeartbeat ]]
    -- upvalues: v18 (copy), l_Heartbeat_0 (copy), v7 (copy), v20 (copy), v42 (copy), l_enums_0 (copy)
    if v18[v59] then
        return;
    else
        local v60 = 0;
        v18[v59] = l_Heartbeat_0:Connect(function() --[[ Line: 141 ]]
            -- upvalues: v60 (ref), v7 (ref), v59 (copy), v20 (ref), v42 (ref), l_enums_0 (ref)
            local v61 = tick();
            if v60 <= v61 then
                local v62 = nil;
                local v63 = nil;
                for v64, _ in pairs(v7) do
                    if v64.activeTriggers[v59] then
                        local l_accuracy_0 = v64.accuracy;
                        if v62 == nil or l_accuracy_0 < v62 then
                            v62 = l_accuracy_0;
                        end;
                        v20.updateDetection(v64);
                        local l__currentEnterDetection_0 = v64._currentEnterDetection;
                        if v63 == nil or l__currentEnterDetection_0 < v63 then
                            v63 = l__currentEnterDetection_0;
                        end;
                    end;
                end;
                local l_v62_0 = v62;
                local v69 = v42[v59](v63);
                local v70 = {};
                local v71 = {};
                for v72, v73 in pairs(v69) do
                    local v74 = v72.settingsGroupName and v20.getGroup(v72.settingsGroupName);
                    if v74 and v74.onlyEnterOnceExitedAll == true then
                        for v75, _ in pairs(v73) do
                            local v77 = v70[v72.settingsGroupName];
                            if not v77 then
                                v77 = {};
                                v70[v72.settingsGroupName] = v77;
                            end;
                            v77[v75] = v72;
                        end;
                        v71[v72] = v73;
                    end;
                end;
                for v78, v79 in pairs(v71) do
                    local v80 = v70[v78.settingsGroupName];
                    if v80 then
                        for v81, _ in pairs(v79) do
                            local v83 = v80[v81];
                            if v83 and v83 ~= v78 then
                                v79[v81] = nil;
                            end;
                        end;
                    end;
                end;
                local v84 = {
                    {}, 
                    {}
                };
                for v85, _ in pairs(v7) do
                    if v85.activeTriggers[v59] then
                        local l_accuracy_1 = v85.accuracy;
                        local v88 = v69[v85] or {};
                        local v89 = false;
                        for _, _ in pairs(v88) do
                            v89 = true;
                            break;
                        end;
                        if v89 and l_v62_0 < l_accuracy_1 then
                            l_v62_0 = l_accuracy_1;
                        end;
                        local v92 = v85:_updateOccupants(v59, v88);
                        v84[1][v85] = v92.exited;
                        v84[2][v85] = v92.entered;
                    end;
                end;
                local v93 = {
                    "Exited", 
                    "Entered"
                };
                for v94, v95 in pairs(v84) do
                    local v96 = v93[v94];
                    local v97 = v59 .. v96;
                    for v98, v99 in pairs(v95) do
                        local v100 = v98[v97];
                        if v100 then
                            for _, v102 in pairs(v99) do
                                v100:Fire(v102);
                            end;
                        end;
                    end;
                end;
                v60 = v61 + l_enums_0.Accuracy.getProperty(l_v62_0);
            end;
        end);
        return;
    end;
end;
v20._deregisterConnection = function(v103, v104) --[[ Line: 240 ]] --[[ Name: _deregisterConnection ]]
    -- upvalues: v15 (ref), v9 (copy), v18 (copy), v7 (copy), v20 (copy)
    v15 = v15 - 1;
    if v9[v104] == 1 then
        v9[v104] = nil;
        local v105 = v18[v104];
        if v105 then
            v18[v104] = nil;
            v105:Disconnect();
        end;
    else
        local l_v9_0 = v9;
        l_v9_0[v104] = l_v9_0[v104] - 1;
    end;
    v103.activeTriggers[v104] = nil;
    local l_activeTriggers_1 = v103.activeTriggers;
    local v108 = 0;
    for _, _ in pairs(l_activeTriggers_1) do
        v108 = v108 + 1;
    end;
    if v108 == 0 then
        v7[v103] = nil;
        v20._updateZoneDetails();
    end;
    if v103.touchedConnectionActions[v104] then
        v103:_disconnectTouchedConnection(v104);
    end;
end;
v20._updateZoneDetails = function() --[[ Line: 262 ]] --[[ Name: _updateZoneDetails ]]
    -- upvalues: v11 (ref), v12 (ref), v13 (ref), v14 (ref), v8 (ref), v10 (copy), v7 (copy)
    v11 = {};
    v12 = {};
    v13 = {};
    v14 = {};
    v8 = 0;
    for v111, _ in pairs(v10) do
        local v113 = v7[v111];
        if v113 then
            v8 = v8 + v111.volume;
        end;
        for _, v115 in pairs(v111.zoneParts) do
            if v113 then
                table.insert(v11, v115);
                v12[v115] = v111;
            end;
            table.insert(v13, v115);
            v14[v115] = v111;
        end;
    end;
end;
v20._getZonesAndItems = function(v116, v117, v118, v119, v120) --[[ Line: 284 ]] --[[ Name: _getZonesAndItems ]]
    -- upvalues: v21 (copy), v20 (copy), l_Players_0 (copy), v4 (copy)
    local l_v118_0 = v118;
    if not l_v118_0 then
        for v122, _ in pairs(v117) do
            l_v118_0 = l_v118_0 + v122.volume;
        end;
    end;
    local v124 = {};
    local v125 = v21[v116];
    if v125.totalVolume < l_v118_0 then
        for _, v127 in pairs(v125.items) do
            local v128 = v20.getTouchingZones(v127, v119, v120, v125);
            for _, v130 in pairs(v128) do
                if not v119 or v130.activeTriggers[v116] then
                    local l_v127_0 = v127;
                    if v116 == "player" then
                        l_v127_0 = l_Players_0:GetPlayerFromCharacter(v127);
                    end;
                    if l_v127_0 then
                        local l_l_v127_0_0 = l_v127_0;
                        local v133 = v124[v130];
                        if not v133 then
                            v133 = {};
                            v124[v130] = v133;
                        end;
                        v133[l_l_v127_0_0] = l_l_v127_0_0:IsA("Player") and l_l_v127_0_0.Character or true;
                    end;
                end;
            end;
        end;
        return v124;
    else
        for v134, _ in pairs(v117) do
            if not v119 or v134.activeTriggers[v116] then
                local l_v4_PartBoundsInBox_0 = v4:GetPartBoundsInBox(v134.region.CFrame, v134.region.Size, v125.whitelistParams);
                local v137 = {};
                for _, v139 in pairs(l_v4_PartBoundsInBox_0) do
                    local v140 = v125.partToItem[v139];
                    if not v137[v140] then
                        v137[v140] = true;
                    end;
                end;
                for v141, _ in pairs(v137) do
                    if v116 == "player" then
                        local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v141);
                        if v134:findPlayer(l_l_Players_0_PlayerFromCharacter_0) then
                            local v144 = v124[v134];
                            if not v144 then
                                v144 = {};
                                v124[v134] = v144;
                            end;
                            v144[l_l_Players_0_PlayerFromCharacter_0] = l_l_Players_0_PlayerFromCharacter_0:IsA("Player") and l_l_Players_0_PlayerFromCharacter_0.Character or true;
                        end;
                    elseif v134:findItem(v141) then
                        local v145 = v124[v134];
                        if not v145 then
                            v145 = {};
                            v124[v134] = v145;
                        end;
                        v145[v141] = v141:IsA("Player") and v141.Character or true;
                    end;
                end;
            end;
        end;
        return v124;
    end;
end;
v20.getZones = function() --[[ Line: 345 ]] --[[ Name: getZones ]]
    -- upvalues: v10 (copy)
    local v146 = {};
    for v147, _ in pairs(v10) do
        table.insert(v146, v147);
    end;
    return v146;
end;
v20.getTouchingZones = function(v149, v150, v151, v152) --[[ Line: 365 ]] --[[ Name: getTouchingZones ]]
    -- upvalues: l_enums_0 (copy), v3 (copy), v11 (ref), v13 (ref), v12 (ref), v14 (ref), v4 (copy)
    local v153 = nil;
    local v154 = nil;
    if v152 then
        v153 = v152.exitDetections[v149];
        v152.exitDetections[v149] = nil;
    end;
    v154 = v153 or v151;
    local v155 = nil;
    local v156 = nil;
    local v157 = v149:IsA("BasePart");
    local v158 = not v157;
    local v159 = {};
    if v157 then
        v155 = v149.Size;
        v156 = v149.CFrame;
        table.insert(v159, v149);
    elseif v154 == l_enums_0.Detection.WholeBody then
        local v160, v161 = v3.getCharacterSize(v149);
        v155 = v160;
        v156 = v161;
        v159 = v149:GetChildren();
    else
        local l_HumanoidRootPart_0 = v149:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            v155 = l_HumanoidRootPart_0.Size;
            v156 = l_HumanoidRootPart_0.CFrame;
            table.insert(v159, l_HumanoidRootPart_0);
        end;
    end;
    if not v155 or not v156 then
        return {};
    else
        local v163 = v150 and v11 or v13;
        local v164 = v150 and v12 or v14;
        local v165 = OverlapParams.new();
        v165.FilterType = Enum.RaycastFilterType.Include;
        v165.MaxParts = #v163;
        v165.FilterDescendantsInstances = v163;
        local v166 = {};
        local v167 = {};
        local l_v4_PartBoundsInBox_1 = v4:GetPartBoundsInBox(v156, v155, v165);
        local v169 = {};
        for _, v171 in pairs(l_v4_PartBoundsInBox_1) do
            local v172 = v164[v171];
            if v172 and v172.allZonePartsAreBlocks then
                v167[v172] = true;
                v166[v171] = v172;
            else
                table.insert(v169, v171);
            end;
        end;
        local v173 = #v169;
        local v174 = 0;
        if v173 > 0 then
            local v175 = OverlapParams.new();
            v175.FilterType = Enum.RaycastFilterType.Include;
            v175.MaxParts = v173;
            v175.FilterDescendantsInstances = v169;
            for _, v177 in pairs(v159) do
                local v178 = false;
                if v177:IsA("BasePart") and (not v158 or not v3.bodyPartsToIgnore[v177.Name]) then
                    local l_v4_PartsInPart_0 = v4:GetPartsInPart(v177, v175);
                    for _, v181 in pairs(l_v4_PartsInPart_0) do
                        if not v166[v181] then
                            local v182 = v164[v181];
                            if v182 then
                                v167[v182] = true;
                                v166[v181] = v182;
                                v174 = v174 + 1;
                            end;
                            if v174 == v173 then
                                v178 = true;
                                break;
                            end;
                        end;
                    end;
                    if v178 then
                        break;
                    end;
                end;
            end;
        end;
        local v183 = {};
        local v184 = nil;
        for v185, _ in pairs(v167) do
            if v184 == nil or v185._currentExitDetection < v184 then
                v184 = v185._currentExitDetection;
            end;
            table.insert(v183, v185);
        end;
        if v184 and v152 then
            v152.exitDetections[v149] = v184;
        end;
        return v183, v166;
    end;
end;
local v187 = {};
v20.setGroup = function(v188, v189) --[[ Line: 482 ]] --[[ Name: setGroup ]]
    -- upvalues: v187 (copy)
    local v190 = v187[v188];
    if not v190 then
        v190 = {};
        v187[v188] = v190;
    end;
    v190.onlyEnterOnceExitedAll = true;
    v190._name = v188;
    v190._memberZones = {};
    if typeof(v189) == "table" then
        for v191, v192 in pairs(v189) do
            v190[v191] = v192;
        end;
    end;
    return v190;
end;
v20.getGroup = function(v193) --[[ Line: 506 ]] --[[ Name: getGroup ]]
    -- upvalues: v187 (copy)
    return v187[v193];
end;
local v194 = nil;
local v195 = string.format("ZonePlus%sContainer", l_RunService_0:IsClient() and "Client" or "Server");
v20.getWorkspaceContainer = function() --[[ Line: 512 ]] --[[ Name: getWorkspaceContainer ]]
    -- upvalues: v194 (ref), v195 (copy)
    local v196 = v194 or workspace:FindFirstChild(v195);
    if not v196 then
        v196 = Instance.new("Folder");
        v196.Name = v195;
        v196.Parent = workspace;
        v194 = v196;
    end;
    return v196;
end;
return v20;