local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService").Heartbeat;
local v2 = require(script.Parent.Parent.Parent.Signal);
local v3 = require(script.Parent.Parent.Janitor);
local v4 = {};
v4.__index = v4;
local v5 = {};
v4.trackers = v5;
v4.itemAdded = v2.new();
v4.itemRemoved = v2.new();
v4.bodyPartsToIgnore = {
    UpperTorso = true, 
    LowerTorso = true, 
    Torso = true, 
    LeftHand = true, 
    RightHand = true, 
    LeftFoot = true, 
    RightFoot = true
};
v4.getCombinedTotalVolumes = function() --[[ Line: 24 ]] --[[ Name: getCombinedTotalVolumes ]]
    -- upvalues: v5 (copy)
    local v6 = 0;
    for v7, _ in pairs(v5) do
        v6 = v6 + v7.totalVolume;
    end;
    return v6;
end;
v4.getCharacterSize = function(v9) --[[ Line: 32 ]] --[[ Name: getCharacterSize ]]
    local v10 = v9 and v9:FindFirstChild("Head");
    local v11 = v9 and v9:FindFirstChild("HumanoidRootPart");
    if not v11 or not v10 then
        return nil;
    else
        if not v10:IsA("BasePart") then
            v10 = v11;
        end;
        local l_Y_0 = v10.Size.Y;
        local l_Size_0 = v11.Size;
        return l_Size_0 * Vector3.new(2, 2, 1, 0) + Vector3.new(0, l_Y_0, 0), v11.CFrame * CFrame.new(0, l_Y_0 / 2 - l_Size_0.Y / 2, 0);
    end;
end;
v4.new = function(v14) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v3 (copy), l_Players_0 (copy), v5 (copy)
    local v15 = {};
    setmetatable(v15, v4);
    v15.name = v14;
    v15.totalVolume = 0;
    v15.parts = {};
    v15.partToItem = {};
    v15.items = {};
    v15.whitelistParams = nil;
    v15.characters = {};
    v15.baseParts = {};
    v15.exitDetections = {};
    v15.janitor = v3.new();
    if v14 == "player" then
        local function v20() --[[ Line: 62 ]] --[[ Name: updatePlayerCharacters ]]
            -- upvalues: l_Players_0 (ref), v15 (copy)
            local v16 = {};
            for _, v18 in pairs(l_Players_0:GetPlayers()) do
                local l_Character_0 = v18.Character;
                if l_Character_0 then
                    v16[l_Character_0] = true;
                end;
            end;
            v15.characters = v16;
        end;
        local function v28(v21) --[[ Line: 73 ]] --[[ Name: playerAdded ]]
            -- upvalues: v20 (copy), v15 (copy)
            local function v26(v22) --[[ Line: 74 ]] --[[ Name: charAdded ]]
                -- upvalues: v20 (ref), v15 (ref)
                local v23 = v22:WaitForChild("Humanoid", 3);
                if v23 then
                    v20();
                    v15:update();
                    for _, v25 in pairs(v23:GetChildren()) do
                        if v25:IsA("NumberValue") then
                            v25.Changed:Connect(function() --[[ Line: 81 ]]
                                -- upvalues: v15 (ref)
                                v15:update();
                            end);
                        end;
                    end;
                end;
            end;
            if v21.Character then
                v26(v21.Character);
            end;
            v21.CharacterAdded:Connect(v26);
            v21.CharacterRemoving:Connect(function(v27) --[[ Line: 92 ]]
                -- upvalues: v15 (ref)
                v15.exitDetections[v27] = nil;
            end);
        end;
        l_Players_0.PlayerAdded:Connect(v28);
        for _, v30 in pairs(l_Players_0:GetPlayers()) do
            v28(v30);
        end;
        l_Players_0.PlayerRemoving:Connect(function(_) --[[ Line: 102 ]]
            -- upvalues: v20 (copy), v15 (copy)
            v20();
            v15:update();
        end);
    elseif v14 == "item" then
        local function _(v32, v33) --[[ Line: 109 ]] --[[ Name: updateItem ]]
            -- upvalues: v15 (copy)
            if v32.isCharacter then
                v15.characters[v32.item] = v33;
            elseif v32.isBasePart then
                v15.baseParts[v32.item] = v33;
            end;
            v15:update();
        end;
        v4.itemAdded:Connect(function(v35) --[[ Line: 117 ]]
            -- upvalues: v15 (copy)
            if v35.isCharacter then
                v15.characters[v35.item] = true;
            elseif v35.isBasePart then
                v15.baseParts[v35.item] = true;
            end;
            v15:update();
        end);
        v4.itemRemoved:Connect(function(v36) --[[ Line: 120 ]]
            -- upvalues: v15 (copy)
            v15.exitDetections[v36.item] = nil;
            if v36.isCharacter then
                v15.characters[v36.item] = nil;
            elseif v36.isBasePart then
                v15.baseParts[v36.item] = nil;
            end;
            v15:update();
        end);
    end;
    v5[v15] = true;
    task.defer(v15.update, v15);
    return v15;
end;
v4._preventMultiFrameUpdates = function(v37, v38, ...) --[[ Line: 131 ]] --[[ Name: _preventMultiFrameUpdates ]]
    v37._preventMultiDetails = v37._preventMultiDetails or {};
    local v39 = v37._preventMultiDetails[v38];
    if not v39 then
        v39 = {
            calling = false, 
            callsThisFrame = 0, 
            updatedThisFrame = false
        };
        v37._preventMultiDetails[v38] = v39;
    end;
    v39.callsThisFrame = v39.callsThisFrame + 1;
    if v39.callsThisFrame == 1 then
        local v40 = table.pack(...);
        task.defer(function() --[[ Line: 148 ]]
            -- upvalues: v39 (ref), v37 (copy), v38 (copy), v40 (copy)
            local l_callsThisFrame_0 = v39.callsThisFrame;
            v39.callsThisFrame = 0;
            if l_callsThisFrame_0 > 1 then
                v37[v38](v37, unpack(v40));
            end;
        end);
        return false;
    else
        return true;
    end;
end;
v4.update = function(v42) --[[ Line: 160 ]] --[[ Name: update ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v42:_preventMultiFrameUpdates("update") then
        return;
    else
        v42.totalVolume = 0;
        v42.parts = {};
        v42.partToItem = {};
        v42.items = {};
        for v43, _ in pairs(v42.characters) do
            local v45 = v4.getCharacterSize(v43);
            if v45 then
                local v46 = v45.X * v45.Y * v45.Z;
                v42.totalVolume = v42.totalVolume + v46;
                local v47 = v42.janitor:add(v3.new(), "destroy", "trackCharacterParts-" .. v42.name);
                do
                    local l_v47_0 = v47;
                    local function _(v49) --[[ Line: 181 ]] --[[ Name: updateTrackerOnParentChanged ]]
                        -- upvalues: l_v47_0 (ref), v42 (copy)
                        l_v47_0:add(v49.AncestryChanged:Connect(function() --[[ Line: 182 ]]
                            -- upvalues: v49 (copy), l_v47_0 (ref), v42 (ref)
                            if not v49:IsDescendantOf(game) and v49.Parent == nil and l_v47_0 ~= nil then
                                l_v47_0:destroy();
                                l_v47_0 = nil;
                                v42:update();
                            end;
                        end), "Disconnect");
                    end;
                    for _, v52 in pairs(v43:GetChildren()) do
                        if v52:IsA("BasePart") and not v4.bodyPartsToIgnore[v52.Name] then
                            v42.partToItem[v52] = v43;
                            table.insert(v42.parts, v52);
                            local v53 = v52.AncestryChanged:Connect(function() --[[ Line: 182 ]]
                                -- upvalues: v52 (copy), l_v47_0 (ref), v42 (copy)
                                if not v52:IsDescendantOf(game) and v52.Parent == nil and l_v47_0 ~= nil then
                                    l_v47_0:destroy();
                                    l_v47_0 = nil;
                                    v42:update();
                                end;
                            end);
                            l_v47_0:add(v53, "Disconnect");
                        end;
                    end;
                    local v54 = v43.AncestryChanged:Connect(function() --[[ Line: 182 ]]
                        -- upvalues: v43 (copy), l_v47_0 (ref), v42 (copy)
                        if not v43:IsDescendantOf(game) and v43.Parent == nil and l_v47_0 ~= nil then
                            l_v47_0:destroy();
                            l_v47_0 = nil;
                            v42:update();
                        end;
                    end);
                    l_v47_0:add(v54, "Disconnect");
                    table.insert(v42.items, v43);
                end;
            end;
        end;
        for v55, _ in pairs(v42.baseParts) do
            local l_Size_1 = v55.Size;
            local v58 = l_Size_1.X * l_Size_1.Y * l_Size_1.Z;
            v42.totalVolume = v42.totalVolume + v58;
            v42.partToItem[v55] = v55;
            table.insert(v42.parts, v55);
            table.insert(v42.items, v55);
        end;
        v42.whitelistParams = OverlapParams.new();
        v42.whitelistParams.FilterType = Enum.RaycastFilterType.Include;
        v42.whitelistParams.MaxParts = #v42.parts;
        v42.whitelistParams.FilterDescendantsInstances = v42.parts;
        return;
    end;
end;
return v4;