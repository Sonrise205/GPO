local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("LowLevel");
local v1 = require(game.ReplicatedStorage.Modules.LowLevel);
local l_LowLevel_0 = require(game.ReplicatedStorage.Modules.Leveling).LowLevel;
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local v4 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Raycast);
local v6 = require(game.ReplicatedStorage.Modules.Trove);
local v7 = require(game.ReplicatedStorage.Modules.StreamingObjectsModule);
local v8 = require(l_ReplicatedStorage_0.Modules.FastSignal);
local v9 = {};
local function v22(v10) --[[ Line: 15 ]] --[[ Name: getTargetByPart ]]
    -- upvalues: v9 (copy)
    if v10 == nil then
        return nil;
    elseif v9[v10] then
        return v9[v10];
    else
        local v11 = nil;
        local l_Children_0 = workspace.PlayerCharacters:GetChildren();
        for v13 = 1, #l_Children_0 do
            if v10:IsDescendantOf(l_Children_0[v13]) then
                v11 = l_Children_0[v13];
                break;
            end;
        end;
        if v11 == nil then
            local l_Children_1 = workspace.NPCs:GetChildren();
            for v15 = 1, #l_Children_1 do
                if v10:IsDescendantOf(l_Children_1[v15]) then
                    v11 = l_Children_1[v15];
                    break;
                end;
            end;
        end;
        if v11 == nil then
            local l_Children_2 = workspace.Ships:GetChildren();
            for v17 = 1, #l_Children_2 do
                if v10:IsDescendantOf(l_Children_2[v17]) then
                    v11 = l_Children_2[v17];
                    break;
                end;
            end;
        end;
        if v11 == nil then
            local l_Children_3 = workspace.Env:GetChildren();
            for v19 = 1, #l_Children_3 do
                if l_Children_3[v19]:FindFirstChild("barrelHP") and v10:IsDescendantOf(l_Children_3[v19]) then
                    v11 = l_Children_3[v19];
                    break;
                end;
            end;
        end;
        if v11 == nil then
            for _, v21 in pairs(game:GetService("CollectionService"):GetTagged("CustomHP")) do
                if v10:IsDescendantOf(v21) then
                    v11 = v21;
                    break;
                end;
            end;
        end;
        if v11 then
            v9[v10] = v11;
            task.delay(5, function() --[[ Line: 73 ]]
                -- upvalues: v9 (ref), v10 (copy)
                if v9[v10] then
                    v9[v10] = nil;
                end;
            end);
        end;
        return v11;
    end;
end;
local v23 = game["Run Service"]:IsServer();
return function() --[[ Line: 84 ]]
    -- upvalues: v23 (copy), l_LowLevel_0 (copy), v1 (copy), v7 (copy), v22 (copy), v4 (copy), v6 (copy), v8 (copy)
    _G.fw = function(v24) --[[ Line: 85 ]]
        task.wait(v24);
    end;
    _G.customPrestigePrefix = {
        ["Cupid's Bow"] = {
            "Blessed"
        }, 
        ["Mega-Pow"] = {
            "Anomalized"
        }, 
        ["World Ender"] = {
            "Hollow's", 
            "Prestige"
        }, 
        ["Candy Cane"] = {
            "Iceborn", 
            "Prestige"
        }
    };
    if v23 == true then
        local l_DataStoreService_0 = game:GetService("DataStoreService");
        local v26 = 0;
        local v27 = false;
        local l_l_DataStoreService_0_0 = l_DataStoreService_0 --[[ copy: 0 -> 15 ]];
        do
            local l_v26_0, l_v27_0 = v26, v27;
            _G.dataAPISuccess = function(v31, v32) --[[ Line: 103 ]]
                -- upvalues: l_l_DataStoreService_0_0 (copy), l_v26_0 (ref), l_v27_0 (ref)
                local l_l_l_DataStoreService_0_0_DataStore_0 = l_l_DataStoreService_0_0:GetDataStore("TestStore" .. math.random(1, 1000));
                if tick() - l_v26_0 <= 3 and v32 == nil then
                    return l_v27_0;
                else
                    local l_status_0, _ = pcall(function() --[[ Line: 109 ]]
                        -- upvalues: l_l_l_DataStoreService_0_0_DataStore_0 (copy)
                        return l_l_l_DataStoreService_0_0_DataStore_0:SetAsync("TestKey", math.random(1, 1000));
                    end);
                    l_v27_0 = l_status_0;
                    l_v26_0 = tick();
                    if l_status_0 == false and v31 then
                        game.ReplicatedStorage.Events.note:FireClient(v31, "<Color=Red>ROBLOX DATASTORE API IS DOWN, TRY LATER!");
                    end;
                    return l_status_0;
                end;
            end;
        end;
    end;
    workspace:WaitForChild("Islands");
    workspace:WaitForChild("Env");
    workspace:WaitForChild("Ships");
    game.ReplicatedStorage:WaitForChild("Modules");
    local v36 = RaycastParams.new();
    v36.FilterType = Enum.RaycastFilterType.Include;
    v36.FilterDescendantsInstances = {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships
    };
    v36.IgnoreWater = true;
    _G.RayParams = v36;
    _G.RaycastParams = _G.RayParams;
    _G.Ess = require(game.ReplicatedStorage.Modules.Essentials);
    _G.m1HitDelay = 0;
    if v23 == false then
        task.spawn(function() --[[ Line: 138 ]]
            _G.arena = game.ReplicatedStorage:WaitForChild("returnIsArena"):InvokeServer();
            warn("CLIENT ARENA IS:", _G.arena);
        end);
    end;
    _G.notAllowed = {
        ETPose = true, 
        Drink = true, 
        Cannonball = true, 
        Tool = true
    };
    _G.bannedItems = {
        ["Mysterious Book"] = true, 
        ["Cyborg Gear"] = true, 
        ["Music Snail"] = true, 
        ["Book of Nitoryu"] = true, 
        ["Kraken Blade"] = true, 
        AnonAE3X = true, 
        xVoidStar = true, 
        xFedora = true, 
        ["Black Cape"] = true, 
        ["Scorched Heart"] = true, 
        ["Admiral Cape"] = true, 
        ["Fruit Bag"] = true, 
        Ace = true, 
        ["Prestige Dark Blade"] = true
    };
    _G.filterColor = function(v37, v38) --[[ Line: 146 ]]
        if v37 ~= nil and v37:IsA("Player") and v37.UserId == 86413514 then
            return Color3.fromRGB(0, 0, 0);
        else
            return v38;
        end;
    end;
    _G.dashPercentAmmount = 0.005;
    _G.maxBounty = 2000000;
    _G.matchMaterial = function(v39, v40) --[[ Line: 158 ]]
        v39.Material = v40.Material;
        v39.MaterialVariant = v40.MaterialVariant;
        v39.Color = v40.Color;
    end;
    _G.requestStream = function(v41, v42, v43) --[[ Line: 164 ]]
        if v41 == nil then
            if game["Run Service"]:IsClient() == true then
                v41 = game.Players.LocalPlayer;
            else
                return;
            end;
        elseif v41 ~= nil and typeof(v41) ~= "Instance" then
            if game["Run Service"]:IsClient() == true then
                v42 = v41;
                v41 = game.Players.LocalPlayer;
            else
                return;
            end;
        end;
        if workspace.StreamingEnabled == false then
            return;
        else
            v41:RequestStreamAroundAsync(v42, v43);
            return;
        end;
    end;
    local v44 = 1;
    if game["Run Service"]:IsClient() then
        local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
        local l_l_UserGameSettings_0_0 = l_UserGameSettings_0 --[[ copy: 2 -> 14 ]];
        local function v48() --[[ Line: 190 ]] --[[ Name: updateGraphicSettings ]]
            -- upvalues: l_l_UserGameSettings_0_0 (copy), v44 (ref)
            local l_Value_0 = l_l_UserGameSettings_0_0.SavedQualityLevel.Value;
            if l_l_UserGameSettings_0_0.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
                v44 = 0.5;
                return;
            else
                v44 = l_Value_0 / 10;
                return;
            end;
        end;
        l_UserGameSettings_0:GetPropertyChangedSignal("SavedQualityLevel"):Connect(v48);
        local l_Value_1 = l_UserGameSettings_0.SavedQualityLevel.Value;
        v44 = l_UserGameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.Automatic and 0.5 or l_Value_1 / 10;
        _G.HasBaseItem = function(v50, v51) --[[ Line: 202 ]]
            local v52 = require(game.ReplicatedStorage.Modules.ToolDesc);
            local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v50.Name);
            local v54 = game:GetService("HttpService"):JSONDecode(l_FirstChild_0:WaitForChild("Inventory", 10):WaitForChild("Inventory", 10).Value);
            local v55 = false;
            for v56, _ in v54 do
                if v52[v56] and v52[v56].BaseItem == v51 then
                    return true;
                end;
            end;
            return v55;
        end;
    end;
    _G.inCombat = function(v58) --[[ Line: 218 ]]
        return v58:FindFirstChild("inCombat") ~= nil;
    end;
    _G.fruitsInStorage = function(v59, v60) --[[ Line: 222 ]]
        if v60 == "Dark Root" then
            return {};
        else
            local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v59.Name);
            local v62 = _G.HasItem(v59, "Prestige Fruitbag");
            if _G.HasItem(v59, "Fruit Bag") == false and l_FirstChild_1.Gamepasses.FruitBag.Value == false and v62 == false then
                local v63 = require(game.ReplicatedStorage.Modules.ToolDesc);
                local v64 = game:GetService("HttpService"):JSONDecode(l_FirstChild_1:WaitForChild("Inventory", 10):WaitForChild("Inventory", 10).Value);
                local v65 = 0;
                local v66 = nil;
                for v67, v68 in v64 do
                    if v63 and v63[v67] and v67 ~= "Dark Root" and v63[v67].Type == "Fruit" then
                        v65 = v65 + v68;
                        v66 = v67;
                    end;
                end;
                return {
                    v66
                };
            else
                return {};
            end;
        end;
    end;
    local v69 = nil;
    if v23 == false then
        task.spawn(function() --[[ Line: 250 ]]
            -- upvalues: v69 (ref)
            v69 = game.ReplicatedStorage:WaitForChild("Stats" .. game.Players.LocalPlayer.Name);
        end);
    end;
    _G.customEmit = function(v70, v71, v72) --[[ Line: 255 ]]
        -- upvalues: v23 (ref), v69 (ref), v44 (ref)
        if v70 == nil then
            return;
        elseif game["Run Service"]:IsServer() == true then
            local v73 = CFrame.new();
            if (v70.Parent:IsA("BasePart") or v70.Parent:IsA("Model")) and v70.Parent:IsA("Terrain") == false then
                v73 = if v70.Parent:IsA("Model") then v70.Parent:GetModelCFrame() else v70.Parent.CFrame;
            elseif v70:IsA("Attachment") then
                v73 = v70.WorldCFrame;
            elseif v70.Parent:IsA("Attachment") then
                v73 = v70.Parent.WorldCFrame;
            elseif v70:IsA("BasePart") then
                v73 = v70.CFrame;
            end;
            _G.PlayEffect("CustomEmit", nil, v70, v71, v72);
            return;
        else
            local v74 = 1;
            if v23 == false and v69 then
                v74 = v69.Settings.ParticleEmitRate.Value;
            end;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 284 ]]
                -- upvalues: v44 (ref), v74 (ref), v71 (copy), v70 (copy)
                local v75 = v44 * v74;
                local function v82(v76) --[[ Line: 287 ]] --[[ Name: emitParticle ]]
                    -- upvalues: v71 (ref), v75 (copy)
                    local v77 = v76:GetAttribute("EmitDelay") or 0;
                    local v78 = v76:GetAttribute("EmitDuration") or 0;
                    task.delay(v77, function() --[[ Line: 291 ]]
                        -- upvalues: v71 (ref), v76 (copy), v78 (copy), v75 (ref)
                        if v71 == nil then
                            local l_v76_Attribute_0 = v76:GetAttribute("EmitCount");
                            if (l_v76_Attribute_0 == nil or l_v76_Attribute_0 == 0) and v78 == 0 then
                                return;
                            elseif typeof(l_v76_Attribute_0) ~= "number" and v78 == 0 then
                                return;
                            elseif l_v76_Attribute_0 then
                                local v80 = (l_v76_Attribute_0 or 5) * v75;
                                if v80 < 1 then
                                    v80 = 1;
                                end;
                                v76:Emit(v80);
                            end;
                        else
                            local v81 = v76.Rate * v75;
                            if v81 < 1 then
                                v81 = 1;
                            end;
                            v76:Emit(v81);
                        end;
                        if v78 and v78 ~= 0 then
                            v76.Enabled = true;
                            task.delay(v78, function() --[[ Line: 323 ]]
                                -- upvalues: v76 (ref)
                                v76.Enabled = false;
                            end);
                        end;
                    end);
                end;
                if typeof(v70) ~= "Instance" then
                    return;
                elseif v70 and v70:IsA("ParticleEmitter") then
                    v82(v70);
                    return;
                else
                    for _, v84 in ipairs(v70:QueryDescendants("ParticleEmitter")) do
                        v82(v84);
                    end;
                    return;
                end;
            end);
            if not l_status_1 then
                warn("ERROR:", l_result_1);
            end;
            return;
        end;
    end;
    if game["Run Service"]:IsClient() then
        local function _(v87, v88, v89) --[[ Line: 349 ]] --[[ Name: lerp ]]
            return v87 + (v88 - v87) * v89;
        end;
        _G.shakenear = function(v91, v92, v93, v94, v95, v96) --[[ Line: 352 ]]
            task.spawn(function() --[[ Line: 353 ]]
                -- upvalues: v96 (ref), v91 (copy), v92 (copy), v94 (copy), v95 (copy), v93 (copy)
                if v96 == nil then
                    v96 = {};
                end;
                local l_Character_0 = game.Players.LocalPlayer.Character;
                if l_Character_0 and l_Character_0:FindFirstChild("HumanoidRootPart") and v96[l_Character_0] == nil then
                    local l_magnitude_0 = (v91 - l_Character_0.HumanoidRootPart.Position).magnitude;
                    if l_magnitude_0 <= v92 then
                        local l_v92_0 = v92;
                        local v100 = l_magnitude_0 / v92;
                        local v101 = l_magnitude_0 + (l_v92_0 - l_magnitude_0) * v100;
                        v101 = v94;
                        l_v92_0 = 1;
                        l_v92_0 = 1 - math.abs((l_magnitude_0 - v92) / v92);
                        v100 = v95 * math.clamp(l_v92_0, 0, 1);
                        if v100 < v95 then
                            v100 = v95;
                        end;
                        if v95 < v100 then
                            v100 = v95 + v100;
                        end;
                        _G.camshake(v93, v94, v95);
                    end;
                end;
            end);
        end;
        _G.MouseOld = require(script.Mouse);
    end;
    _G.weakTable = function(v102) --[[ Line: 381 ]]
        return (setmetatable(v102, {
            __mode = "v"
        }));
    end;
    _G.allowMelee = {
        Melee = true, 
        Rokushiki = true, 
        Electro = true, 
        ["Mera-Mera"] = true, 
        ["Bari-Bari"] = true, 
        ["Pika-Pika"] = true, 
        ["Paw-Paw"] = true, 
        ["Suke-Suke"] = true, 
        ["Magu-Magu"] = true, 
        ["Hie-Hie"] = true, 
        ["Bomb-Bomb"] = true, 
        ["Goro-Goro"] = true, 
        ["Zushi-Zushi"] = true, 
        ["VTori-Tori"] = true, 
        ["Mero-Mero"] = true, 
        ["Gura-Gura"] = true, 
        ["Spin-Spin"] = true, 
        ["Gomu-Gomu"] = true
    };
    _G.raycastWithLand = function(v103, v104) --[[ Line: 387 ]]
        local v105 = Ray.new(v103, v104);
        local v106, v107, v108 = _G.raycastWhitelist(v105, {
            workspace.Islands, 
            workspace.Ships, 
            workspace.Env, 
            workspace.FruitFloors
        });
        return v106, v107, v108;
    end;
    _G.getAccessorys = function(v109) --[[ Line: 393 ]]
        if v109 then
            local v110 = {};
            local l_Children_4 = workspace.Effects.PlayerHats:GetChildren();
            for v112 = 1, #l_Children_4 do
                if l_Children_4[v112].Name:sub(1, (string.len(v109.Name))) == v109.Name then
                    local l_Descendants_0 = l_Children_4[v112]:GetDescendants();
                    for v114 = 1, #l_Descendants_0 do
                        table.insert(v110, l_Descendants_0[v114]);
                    end;
                end;
            end;
            if v109 then
                local l_v109_Children_0 = v109:GetChildren();
                for v116 = 1, #l_v109_Children_0 do
                    if l_v109_Children_0[v116]:GetAttribute("busoModel") ~= nil then
                        local l_Descendants_1 = l_v109_Children_0[v116]:GetDescendants();
                        for v118 = 1, #l_Descendants_1 do
                            table.insert(v110, l_Descendants_1[v118]);
                        end;
                    end;
                end;
            end;
            return v110;
        else
            return {};
        end;
    end;
    _G.PlaySound = function(v119, v120, v121, _) --[[ Line: 425 ]]
        if v119 == nil then
            return;
        elseif typeof(v119) == "Instance" and not v119.Parent then
            return;
        elseif not v120 then
            return;
        else
            if v121 and v121.RandomSound then
                local l_v120_Children_0 = v120:GetChildren();
                if #l_v120_Children_0 <= 0 then
                    return;
                else
                    v120 = l_v120_Children_0[math.random(1, #l_v120_Children_0)];
                end;
            end;
            local v124 = v120.TimeLength + 5;
            local v125 = v120:Clone();
            if v121 then
                for v126, v127 in v121 do
                    pcall(function() --[[ Line: 453 ]]
                        -- upvalues: v125 (copy), v126 (copy), v127 (copy)
                        if v125[v126] then
                            v125[v126] = v127;
                        end;
                    end);
                end;
                if v121.RandomPitch ~= nil then
                    v125.Pitch = math.random(90, 110) / 100;
                end;
            end;
            v125.PlayOnRemove = false;
            local v128 = nil;
            if typeof(v119) == "Instance" and not v119:IsA("Attachment") or typeof(v119) == "CFrame" then
                v128 = Instance.new("Attachment");
                local v129 = nil;
                if typeof(v119) == "Instance" then
                    if v119:IsA("BasePart") then
                        v129 = v119.CFrame;
                    elseif v119:IsA("Model") then
                        v129 = v119:GetPivot();
                    end;
                else
                    v129 = v119;
                end;
                if v128:IsA("Attachment") then
                    v128.WorldCFrame = v129;
                else
                    v128.CFrame = v129;
                end;
                v125.Parent = v128;
                if v119 and typeof(v119) == "Instance" then
                    v128.Parent = workspace.Terrain;
                else
                    v128.Parent = workspace.Terrain;
                end;
                _G.destroy(v128, v124);
                _G.destroy(v125, v124);
            elseif typeof(v119) == "Instance" and v119:IsA("Attachment") then
                v125.Parent = v119;
                _G.destroy(v125, v124);
            end;
            v125.PlayOnRemove = false;
            v125:Play();
            return v125;
        end;
    end;
    local v130 = {};
    _G.getTargets = function(v131, v132, v133, v134, v135, v136) --[[ Line: 523 ]]
        -- upvalues: v130 (copy), l_LowLevel_0 (ref), v1 (ref)
        if v131 == nil then
            return {};
        else
            local v137 = tick();
            local v138 = tostring(v132) .. tostring(v133) .. tostring(v134) .. tostring(v135) .. tostring(v136);
            if v130[v131] and v130[v131][v138] and v137 - v130[v131][v138].timestamp < 0.5 then
                return v130[v131][v138].targets;
            else
                local v139 = {};
                local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(v131);
                local function _(v141) --[[ Line: 540 ]] --[[ Name: insertModel ]]
                    -- upvalues: v139 (copy)
                    local v142 = v141:QueryDescendants("BasePart");
                    for v143 = 1, #v142 do
                        table.insert(v139, v142[v143]);
                    end;
                end;
                if v131 == nil then
                    v131 = workspace.Holder;
                end;
                if v131.Parent == workspace.Effects then
                    return {};
                else
                    local l_playerOwner_0 = v131:FindFirstChild("playerOwner");
                    if l_playerOwner_0 then
                        v131 = l_playerOwner_0.Value.Character;
                        l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(v131);
                    end;
                    local function v154(v146) --[[ Line: 568 ]] --[[ Name: processNPCs ]]
                        -- upvalues: v131 (ref), l_PlayerFromCharacter_0 (ref), l_playerOwner_0 (copy), v134 (copy), v139 (copy)
                        for v147 = 1, #v146 do
                            local v148 = v146[v147];
                            if v148:FindFirstChildWhichIsA("ForceField") == nil and v148:FindFirstChild("HumanoidRootPart") and v148:FindFirstChildWhichIsA("Humanoid") and v148 ~= v131 and (not v148:GetAttribute("dmgWhitelist") or not l_PlayerFromCharacter_0 or l_PlayerFromCharacter_0:GetAttribute("safePlayer") ~= nil) then
                                if v148:FindFirstChild("playerOwner") then
                                    local l_Value_2 = v148:FindFirstChild("playerOwner").Value;
                                    if l_Value_2 and l_PlayerFromCharacter_0 and l_PlayerFromCharacter_0:FindFirstChild("Party") and l_Value_2:FindFirstChild("Party") and (l_Value_2.Party.Value and l_PlayerFromCharacter_0.Party.Value == l_Value_2.Party.Value or l_PlayerFromCharacter_0 == l_Value_2) or l_Value_2 and l_Value_2 == game.Players:GetPlayerFromCharacter(v148) or l_Value_2 and l_playerOwner_0 and l_Value_2 == l_playerOwner_0.Value then
                                        continue;
                                    end;
                                elseif l_playerOwner_0 and l_playerOwner_0.Value == game.Players:GetPlayerFromCharacter(v148) then
                                    continue;
                                end;
                                if not v148:FindFirstChild("Info") or not v148.Info:FindFirstChild("Hostile") or v148.Info.Hostile.Value ~= false then
                                    if v148:FindFirstChild("SeaNPC") == nil then
                                        if v148:GetAttribute("modelHitbox") then
                                            if v134 then
                                                table.insert(v139, v148);
                                            else
                                                local v150 = v148:QueryDescendants("BasePart");
                                                for v151 = 1, #v150 do
                                                    table.insert(v139, v150[v151]);
                                                end;
                                                table.insert(v139, v148.HumanoidRootPart);
                                            end;
                                        elseif v134 then
                                            table.insert(v139, v148);
                                        else
                                            table.insert(v139, v148.HumanoidRootPart);
                                        end;
                                    else
                                        local v152 = v148:QueryDescendants("BasePart");
                                        for v153 = 1, #v152 do
                                            table.insert(v139, v152[v153]);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v131 and (v131.Parent ~= workspace.NPCs or l_playerOwner_0) and v131.Parent ~= workspace.Ships.NPC then
                        v154(workspace.NPCs:GetChildren());
                    else
                        local l_Children_5 = workspace.NPCs:GetChildren();
                        for v156 = 1, #l_Children_5 do
                            local v157 = l_Children_5[v156];
                            if v157:FindFirstChildWhichIsA("ForceField") == nil and v157:FindFirstChild("HumanoidRootPart") and v157:FindFirstChildWhichIsA("Humanoid") and v157:FindFirstChild("playerOwner") and (not v157:GetAttribute("dmgWhitelist") or not l_PlayerFromCharacter_0 or l_PlayerFromCharacter_0:GetAttribute("safePlayer") ~= nil) then
                                if v157:GetAttribute("modelHitbox") then
                                    if v134 then
                                        table.insert(v139, v157);
                                    else
                                        local v158 = v157:QueryDescendants("BasePart");
                                        for v159 = 1, #v158 do
                                            table.insert(v139, v158[v159]);
                                        end;
                                        table.insert(v139, v157.HumanoidRootPart);
                                    end;
                                elseif v134 then
                                    table.insert(v139, v157);
                                else
                                    table.insert(v139, v157.HumanoidRootPart);
                                end;
                            end;
                        end;
                    end;
                    local v160 = nil;
                    if v131 then
                        v160 = game.ReplicatedStorage:FindFirstChild("Stats" .. v131.Name);
                    end;
                    if v160 == nil or v160 and v160.Stats.Level.Value >= l_LowLevel_0 then
                        local v161 = true;
                        if l_PlayerFromCharacter_0 and l_PlayerFromCharacter_0:GetAttribute("safePlayer") then
                            v161 = false;
                        end;
                        if v161 then
                            local l_Children_6 = workspace.PlayerCharacters:GetChildren();
                            if v135 then
                                local l_Children_7 = workspace.Ragdolls:GetChildren();
                                for v164 = 1, #l_Children_7 do
                                    table.insert(l_Children_6, l_Children_7[v164]);
                                end;
                            end;
                            for v165 = 1, #l_Children_6 do
                                local _, l_result_2 = pcall(function() --[[ Line: 667 ]]
                                    -- upvalues: l_Children_6 (copy), v165 (copy), v131 (ref), l_playerOwner_0 (copy), l_PlayerFromCharacter_0 (ref), v1 (ref), v133 (copy), v160 (ref), v134 (copy), v139 (copy)
                                    local v166 = l_Children_6[v165];
                                    if v166 ~= v131 and v166.Name ~= v131.Name and v166:FindFirstChild("iFrame") == nil and v166:FindFirstChild("HumanoidRootPart") and v166:FindFirstChildWhichIsA("Humanoid") and v166:FindFirstChildWhichIsA("Humanoid").Health > 0 and v166:FindFirstChildWhichIsA("ForceField") == nil then
                                        local v167 = true;
                                        if l_playerOwner_0 and l_playerOwner_0.Value == game.Players:GetPlayerFromCharacter(v166) then
                                            v167 = false;
                                        end;
                                        if l_PlayerFromCharacter_0 and v167 then
                                            local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. v166.Name);
                                            local l_PlayerFromCharacter_1 = game.Players:GetPlayerFromCharacter(v166);
                                            if l_PlayerFromCharacter_1 == nil and game.Players:FindFirstChild(v166.Name) then
                                                l_PlayerFromCharacter_1 = game.Players:FindFirstChild(v166.Name);
                                            end;
                                            if v1(l_PlayerFromCharacter_0, v166, true) == false or l_PlayerFromCharacter_1 == nil then
                                                local v170 = true;
                                                if l_PlayerFromCharacter_1 and v133 == nil and l_PlayerFromCharacter_0.Team == game.Teams.Marine and l_PlayerFromCharacter_1.Team == game.Teams.Marine and (l_PlayerFromCharacter_0.CrewPVP.Value == false or l_PlayerFromCharacter_1.CrewPVP.Value == false) then
                                                    v170 = false;
                                                end;
                                                if l_PlayerFromCharacter_1 and l_PlayerFromCharacter_0.Party.Value and v133 == nil and l_PlayerFromCharacter_1:FindFirstChild("Party") and l_PlayerFromCharacter_1.Party.Value == l_PlayerFromCharacter_0.Party.Value then
                                                    v170 = false;
                                                end;
                                                if l_PlayerFromCharacter_1 and v133 == nil and l_FirstChild_2.Stats.Crew.Value == v160.Stats.Crew.Value and l_FirstChild_2.Stats.Crew.Value ~= "" and (l_PlayerFromCharacter_0.CrewPVP.Value == false or l_PlayerFromCharacter_1.CrewPVP.Value == false) then
                                                    v170 = false;
                                                end;
                                                if (v131:FindFirstChild("SafeFF") or v166:FindFirstChild("SafeFF")) and v166:FindFirstChild("dummyNPC") == nil and v133 == nil then
                                                    v170 = false;
                                                end;
                                                if v166:GetAttribute("playerName") and v166:GetAttribute("playerName") == v131.Name then
                                                    v170 = false;
                                                end;
                                                if v170 == true then
                                                    if v166:GetAttribute("modelHitbox") then
                                                        if v134 then
                                                            table.insert(v139, v166);
                                                            return;
                                                        else
                                                            local v171 = v166:QueryDescendants("BasePart");
                                                            for v172 = 1, #v171 do
                                                                table.insert(v139, v171[v172]);
                                                            end;
                                                            table.insert(v139, v166.HumanoidRootPart);
                                                            return;
                                                        end;
                                                    elseif v134 then
                                                        table.insert(v139, v166);
                                                        return;
                                                    else
                                                        table.insert(v139, v166.HumanoidRootPart);
                                                        return;
                                                    end;
                                                end;
                                            end;
                                        elseif v167 == true then
                                            if v166:GetAttribute("modelHitbox") then
                                                if v134 then
                                                    table.insert(v139, v166);
                                                    return;
                                                else
                                                    local v173 = v166:QueryDescendants("BasePart");
                                                    for v174 = 1, #v173 do
                                                        table.insert(v139, v173[v174]);
                                                    end;
                                                    table.insert(v139, v166.HumanoidRootPart);
                                                    return;
                                                end;
                                            elseif v134 then
                                                table.insert(v139, v166);
                                                return;
                                            else
                                                table.insert(v139, v166.HumanoidRootPart);
                                            end;
                                        end;
                                    end;
                                end);
                                if l_result_2 then
                                    warn("error", l_result_2);
                                end;
                            end;
                        end;
                    end;
                    if v132 then
                        local l_Children_8 = workspace.Ships:GetChildren();
                        for v178 = 1, #l_Children_8 do
                            if l_Children_8[v178] ~= v131 and l_Children_8[v178]:FindFirstChild("HumanoidRootPart") then
                                table.insert(v139, l_Children_8[v178].HumanoidRootPart);
                            end;
                        end;
                        if v131 and v131.Parent ~= workspace.NPCs and v131.Parent ~= workspace.Ships.NPC then
                            local l_Children_9 = workspace.Ships.NPC:GetChildren();
                            for v180 = 1, #l_Children_9 do
                                if l_Children_9[v180] ~= v131 and l_Children_9[v180]:FindFirstChild("HumanoidRootPart") then
                                    table.insert(v139, l_Children_9[v180].HumanoidRootPart);
                                end;
                            end;
                        end;
                    end;
                    if v136 then
                        local l_Children_10 = workspace.Env:GetChildren();
                        for v182 = 1, #l_Children_10 do
                            if l_Children_10[v182]:FindFirstChild("barrelHP") and l_Children_10[v182]:GetAttribute("iFrame") == nil then
                                table.insert(v139, l_Children_10[v182]);
                            end;
                        end;
                        for _, v184 in pairs(game:GetService("CollectionService"):GetTagged("CustomHP")) do
                            if v184:GetAttribute("iFrame") == nil then
                                table.insert(v139, v184);
                            end;
                        end;
                    end;
                    local l_Holder_0 = workspace:FindFirstChild("Holder");
                    if l_Holder_0 then
                        table.insert(v139, l_Holder_0.PrimaryPart);
                    end;
                    if not v130[v131] then
                        v130[v131] = {};
                    end;
                    v130[v131][v138] = {
                        timestamp = v137, 
                        targets = v139
                    };
                    task.delay(0.5, function() --[[ Line: 787 ]]
                        -- upvalues: v130 (ref), v131 (ref)
                        v130[v131] = nil;
                    end);
                    return v139;
                end;
            end;
        end;
    end;
    _G.checkUlt = function(v186) --[[ Line: 793 ]]
        if game.ReplicatedStorage.reservedCode.Value == "arena" then
            local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v186.Name);
            local _ = v186.UltsUsed.Value;
            local _ = v186.leaderstats.Damage.Value;
            if _G.checkUltDamage(v186) <= v186.leaderstats.UltBar.Value then
                return true;
            else
                if game["Run Service"]:IsServer() == false then
                    script.UltNotReady:Play();
                    _G.displayMessage("<Color=Red>Your ultimate bar needs to be full!");
                end;
                return false;
            end;
        else
            return true;
        end;
    end;
    _G.isSameParty = function(v190, v191) --[[ Line: 814 ]]
        if v190:IsA("Model") then
            local l_PlayerFromCharacter_2 = game.Players:GetPlayerFromCharacter(v190);
            if l_PlayerFromCharacter_2 then
                return _G.isSameParty(l_PlayerFromCharacter_2, v191);
            else
                return false;
            end;
        elseif v190:IsA("Player") then
            if v190:FindFirstChild("Party") then
                if v190.Party.Value ~= nil and v190.Party.Value == v191.Party.Value then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    _G.checkUltDamage = function(v193) --[[ Line: 837 ]]
        if game.ReplicatedStorage.reservedCode.Value == "arena" then
            local l_FirstChild_4 = game.ReplicatedStorage:FindFirstChild("Stats" .. v193.Name);
            local _ = v193.UltsUsed.Value;
            local _ = v193.leaderstats.Damage.Value;
            return math.clamp(1000 - l_FirstChild_4.Stats.Defense.Value, 0, 10000) + 1200;
        else
            return;
        end;
    end;
    _G.getRayFloor = function(v197, v198, v199, v200) --[[ Line: 847 ]]
        v198 = v198 + 1;
        if v199 == nil then
            v199 = {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            };
        end;
        local v201 = Ray.new(v197.p + Vector3.new(0, 1, 0, 0), CFrame.new(v197.p).UpVector * -v198);
        local v202, v203, v204 = _G.raycastWhitelist(v201, v199, v200);
        return v202, v203, v204;
    end;
    _G.getRayWall = function(v205, v206, v207) --[[ Line: 858 ]]
        if v207 == nil then
            v207 = {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            };
        end;
        local l_Magnitude_0 = (v205.Position - v206.Position).Magnitude;
        local v209 = Ray.new(v205.p, (v205.Position - v206.Position).Unit * -l_Magnitude_0);
        local v210, v211, v212 = _G.raycastWhitelist(v209, v207);
        return v210, v211, v212;
    end;
    _G.particleEnabled = function(v213, v214, v215, v216) --[[ Line: 887 ]]
        if not v216 then
            v216 = {};
        end;
        local v217 = {};
        for v218 in pairs(v216) do
            table.insert(v217, "[ClassName=\"" .. v218 .. "\"]");
        end;
        if v215 then
            table.insert(v217, "Trail");
            table.insert(v217, "Beam");
        end;
        local v219 = v213:QueryDescendants("ParticleEmitter" .. (#v217 > 0 and "," .. table.concat(v217, ",") or ""));
        for _, v221 in ipairs(v219) do
            v221.Enabled = v214;
        end;
    end;
    _G.clampCF = function(v222, v223, v224) --[[ Line: 905 ]]
        local l_magnitude_1 = (v223.p - v222.PrimaryPart.Position).magnitude;
        if v224 == nil then
            v224 = 15;
        end;
        if v224 < l_magnitude_1 then
            v223 = v222.PrimaryPart.CFrame;
        end;
        return v223;
    end;
    _G.scaleParticle = function(v226, v227, v228) --[[ Line: 916 ]]
        local v229 = v227 or 1;
        local v230 = nil;
        v230 = if v228 ~= nil then v226:QueryDescendants("ParticleEmitter") else v226:QueryDescendants(">ParticleEmitter");
        for _, v232 in v230 do
            local v233 = {};
            for _, v235 in v232.Size.Keypoints do
                local v236 = v235.Value * v229;
                table.insert(v233, (NumberSequenceKeypoint.new(v235.Time, v236)));
            end;
            v232.Drag = v232.Drag / v229;
            v232.Size = NumberSequence.new(v233);
            v232.Speed = NumberRange.new(v232.Speed.Min * v229, v232.Speed.Max * v229);
        end;
    end;
    _G.scaleModel = function(v237, v238) --[[ Line: 949 ]]
        local l_PrimaryPart_0 = v237.PrimaryPart;
        local v240 = nil;
        v240 = if l_PrimaryPart_0 == nil then v237:GetModelCFrame() else l_PrimaryPart_0.CFrame;
        for _, v242 in (v237:QueryDescendants(">BasePart")) do
            v242.Size = v242.Size * v238;
            if v242 ~= l_PrimaryPart_0 then
                v242.CFrame = v240 + v240:inverse() * v242.Position * v238;
            end;
        end;
        return v237;
    end;
    local _ = {};
    _G.streamObject = function(v244, v245) --[[ Line: 977 ]]
        -- upvalues: v7 (ref)
        return v7:convertArgs(v244, v245);
    end;
    _G.awaitObject = function(v246) --[[ Line: 981 ]]
        -- upvalues: v7 (ref)
        return v7:resolveArgs(v246);
    end;
    _G.streamArgs = function(...) --[[ Line: 1037 ]]
        local v247 = {
            ...
        };
        local v248 = false;
        local function v249(v250) --[[ Line: 1067 ]] --[[ Name: streamInfo ]]
            -- upvalues: v248 (ref), v249 (copy)
            for v251, v252 in pairs(v250) do
                local v253 = typeof(v252);
                if v253 == "Instance" and v252:IsA("Player") == false then
                    if v252:IsA("ObjectValue") and v252:GetAttribute("StreamedObject") ~= nil then
                        local v254 = _G.awaitObject(v252);
                        if v254 == "INVALID" then
                            v248 = true;
                            return v250;
                        else
                            v250[v251] = v254;
                        end;
                    end;
                elseif v253 == "table" then
                    v250[v251] = v249(v252);
                end;
                if v252 == "fakeNil" then
                    v250[v251] = nil;
                end;
            end;
            return v250;
        end;
        v247 = v249(v247);
        if v248 == true then
            return "INVALID";
        else
            return v247;
        end;
    end;
    _G.getTargetByPart = v22;
    _G.getTargetsInRegion = function(v255, v256, v257, v258, v259) --[[ Line: 1163 ]]
        -- upvalues: v4 (ref)
        local l_v257_0 = v257;
        local l_v256_0 = v256;
        if typeof(v257) == "Vector3" then
            v256 = l_v257_0;
            v257 = l_v256_0;
        end;
        local v262 = v4.new(v257, v256);
        if v258 ~= nil then
            v262 = v4.Ball(v257, v256);
        end;
        local l_v262_PartsInRegion3WithWhiteList_0 = v262:FindPartsInRegion3WithWhiteList(_G.getTargets(v255, v259, nil, true), 50000);
        local v264 = {};
        local v265 = {};
        for v266 = 1, #l_v262_PartsInRegion3WithWhiteList_0 do
            local v267 = _G.getTargetByPart(l_v262_PartsInRegion3WithWhiteList_0[v266]);
            if not table.find(v264, v267) and v267 then
                if v267 ~= v255 and v267 and v267:FindFirstChild("HumanoidRootPart") then
                    table.insert(v264, v267);
                elseif v267 and table.find(v264, v267) == nil then
                    table.insert(v264, v267);
                else
                    warn("couldnt find real target for " .. l_v262_PartsInRegion3WithWhiteList_0[v266]:GetFullName());
                end;
            end;
        end;
        for v268 = 1, #v264 do
            local v269 = v264[v268];
            if v269 and v269:FindFirstChild("HumanoidRootPart") then
                table.insert(v265, v269.HumanoidRootPart);
            else
                warn("couldnt find target for " .. v269:GetFullName());
            end;
        end;
        return v265;
    end;
    _G.getTargetNearMouse = function(v270) --[[ Line: 1208 ]]
        -- upvalues: v22 (ref)
        local l_Character_1 = game.Players.LocalPlayer.Character;
        local v272 = 150;
        if v270 then
            v272 = v270;
        end;
        local v273 = nil;
        local v274 = _G.getTargets(l_Character_1);
        local l_MouseCF_0 = _G.MouseCF;
        local _, v277 = _G.raycast:cast(l_Character_1.PrimaryPart.Position, (l_Character_1.PrimaryPart.Position - l_MouseCF_0.Position).unit * (l_Character_1.PrimaryPart.Position - l_MouseCF_0.Position).magnitude, {
            workspace.Islands, 
            workspace.Ships, 
            workspace.Env
        });
        local _ = CFrame.new(v277);
        local v279 = false;
        if _G.MouseTarget ~= nil then
            for _, v281 in v274 do
                if _G.MouseTarget:IsDescendantOf(v281.Parent) then
                    v279 = true;
                    local v282 = v22(v281);
                    if v282 and v282.PrimaryPart then
                        return v282.PrimaryPart;
                    end;
                end;
            end;
        end;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        for _, v285 in v274 do
            local v286, v287 = l_CurrentCamera_0:WorldToScreenPoint(v285.Position);
            if v287 then
                local l_Magnitude_1 = (Vector2.new(v286.X, v286.Y) - game:GetService("UserInputService"):GetMouseLocation()).Magnitude;
                local l_Position_0 = l_Character_1.PrimaryPart.Position;
                local v290 = Ray.new(l_Position_0, (l_Position_0 - v285.Position).unit * -(l_Position_0 - v285.Position).magnitude);
                local v291, _, _ = _G.raycastWhitelist(v290, {
                    workspace.Islands, 
                    workspace.Ships, 
                    workspace.Env
                });
                if l_Magnitude_1 < v272 and v291 == nil then
                    v272 = l_Magnitude_1;
                    v273 = v285;
                end;
            end;
        end;
        if v273 then
            local v294 = v22(v273);
            if v294 and v294.PrimaryPart then
                return v294.PrimaryPart;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
    _G.Emit = function(v295, v296, v297, v298) --[[ Line: 1273 ]]
        -- upvalues: v23 (ref), v69 (ref)
        if game["Run Service"]:IsServer() == true then
            _G.PlayEffect("Emit", nil, v295, v296, v297, v298);
            return;
        else
            if typeof(v295) ~= "table" and typeof(v295) == "Instance" then
                v295 = v295:GetChildren();
            end;
            if v295 == nil then
                return;
            else
                local v299 = 1;
                if v23 == false and v69 then
                    v299 = v69.Settings.ParticleEmitRate.Value;
                end;
                local function v309(v300, v301) --[[ Line: 1287 ]] --[[ Name: EmitDiv ]]
                    -- upvalues: v299 (ref)
                    local l_v300_Attribute_0 = v300:GetAttribute("EmitCount");
                    local l_v300_Attribute_1 = v300:GetAttribute("EmitDelay");
                    local v304 = (not not v301 or l_v300_Attribute_0) and v301 or v300:GetAttribute("EmitCount") or 10;
                    if l_v300_Attribute_0 and l_v300_Attribute_0 <= 0 and (l_v300_Attribute_1 == nil or l_v300_Attribute_1 and l_v300_Attribute_1 <= 0) then
                        return;
                    else
                        local v305 = l_v300_Attribute_1 or 0;
                        task.delay(v305, function() --[[ Line: 1295 ]]
                            -- upvalues: v304 (copy), v300 (copy), v299 (ref)
                            local l_SavedQualityLevel_0 = UserSettings().GameSettings.SavedQualityLevel;
                            if l_SavedQualityLevel_0 == Enum.SavedQualitySetting.Automatic then
                                local v307 = v304 ~= 1 and 0.5 or 1;
                                if v300 ~= nil then
                                    v300:Emit((math.max(math.ceil(v304 * v307) * v299, 1)));
                                    return;
                                end;
                            else
                                local v308 = if v304 ~= 1 then l_SavedQualityLevel_0.Value / 10 else 1;
                                if v300 ~= nil then
                                    v300:Emit((math.max(math.ceil(v304 * v308) * v299, 1)));
                                end;
                            end;
                        end);
                        return;
                    end;
                end;
                if v296 then
                    for _, v311 in pairs(v295) do
                        if v311:IsA("ParticleEmitter") then
                            local l_v311_Attribute_0 = v311:GetAttribute("EmitDelay");
                            if l_v311_Attribute_0 then
                                task.delay(l_v311_Attribute_0, function() --[[ Line: 1320 ]]
                                    -- upvalues: v309 (copy), v311 (copy)
                                    v309(v311, v311:GetAttribute("EmitCount"));
                                end);
                            else
                                v309(v311, v311:GetAttribute("EmitCount"));
                            end;
                        end;
                    end;
                else
                    for _, v314 in pairs(v295) do
                        if v314:IsA("ParticleEmitter") then
                            if not v314.Enabled then
                                v309(v314, v314:GetAttribute("EmitCount"));
                            elseif v314.Enabled then

                            end;
                            v314.Enabled = not v314.Enabled;
                            if v297 then
                                task.delay(v297, function() --[[ Line: 1340 ]]
                                    -- upvalues: v314 (copy)
                                    v314.Enabled = not v314.Enabled;
                                end);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    _G.flipbook = function(v315, v316, v317, v318) --[[ Line: 1349 ]]
        local l_SpecialMesh_0 = v315:FindFirstChildOfClass("SpecialMesh");
        if l_SpecialMesh_0 and v316 then
            task.spawn(function() --[[ Line: 1352 ]]
                -- upvalues: v316 (copy), v315 (copy), l_SpecialMesh_0 (copy), v317 (copy), v318 (copy)
                local l_Character_2 = game.Players.LocalPlayer.Character;
                if workspace.Effects.Decals:FindFirstChild(v316[1]) == nil and l_Character_2 ~= nil and l_Character_2:FindFirstChild("Head") then
                    local v321 = script.DecalHolder:Clone();
                    v321.Name = v316[1];
                    v321.CFrame = CFrame.new(v315.Position.X, -500, v315.Position.Z);
                    v321.Parent = workspace.Effects.Decals;
                    for v322 = 1, #v316 do
                        Instance.new("Decal", v321).Texture = v316[v322];
                    end;
                    v321.Anchored = true;
                end;
                for v323 = 1, #v316 do
                    l_SpecialMesh_0.TextureId = v316[v323];
                    task.wait(1 / v317);
                end;
                if v318 == true then
                    l_SpecialMesh_0.Parent:Destroy();
                end;
            end);
        end;
    end;
    _G.recolorParticles = function(v324, v325, v326) --[[ Line: 1377 ]]
        if v325 == nil then
            return;
        else
            for _, v328 in v324:GetDescendants() do
                if (v328:IsA("ParticleEmitter") or v328:IsA("BasePart") or v328:IsA("PointLight") or v328:IsA("Trail") or v328:IsA("Decal") or v328:IsA("Beam")) and (v326 == nil and v328:GetAttribute("recolorable") ~= nil or v326 and v328:GetAttribute(v326) ~= nil) then
                    if v328:IsA("Trail") or v328:IsA("ParticleEmitter") or v328:IsA("Beam") then
                        if typeof(v325) ~= "ColorSequence" then
                            v328.Color = ColorSequence.new(v325);
                        else
                            v328.Color = v325;
                        end;
                    elseif v328:IsA("Decal") then
                        v328.Color3 = v325;
                    else
                        v328.Color = v325;
                    end;
                end;
            end;
            return;
        end;
    end;
    _G.removeGroundParticles = function(v329, v330) --[[ Line: 1401 ]]
        v330 = v330 or "UseGroundColor";
        for _, v332 in v329:GetDescendants() do
            if v332:IsA("ParticleEmitter") and v332:GetAttribute(v330) then
                v332:Destroy();
            end;
        end;
    end;
    _G.transInfo = {};
    _G.transTrash = {};
    local function _(v333, v334) --[[ Line: 1414 ]] --[[ Name: transModel ]]
        local l_v333_Descendants_0 = v333:GetDescendants();
        for v336 = 1, #l_v333_Descendants_0 do
            if (l_v333_Descendants_0[v336]:IsA("BasePart") or l_v333_Descendants_0[v336]:IsA("Decal")) and l_v333_Descendants_0[v336]:GetAttribute("toriPart") == nil then
                if v334 == nil then
                    if l_v333_Descendants_0[v336].Transparency ~= 1 then
                        _G.transInfo[l_v333_Descendants_0[v336]] = l_v333_Descendants_0[v336].Transparency;
                        l_v333_Descendants_0[v336].Transparency = 1;
                    end;
                elseif _G.transInfo[l_v333_Descendants_0[v336]] then
                    l_v333_Descendants_0[v336].Transparency = _G.transInfo[l_v333_Descendants_0[v336]];
                    _G.transInfo[l_v333_Descendants_0[v336]] = nil;
                end;
            end;
        end;
    end;
    task.spawn(function() --[[ Line: 1434 ]]
        while true do
            task.wait(5);
            for v338, v339 in pairs(_G.transTrash) do
                if v338 == nil or v338 and v338.Parent == nil then
                    if v339 then
                        v339:Destroy();
                    end;
                    if v338 then
                        v338:Destroy();
                    end;
                    _G.transTrash[v338] = nil;
                    warn("cleaned trash for ", v338);
                end;
            end;
            for v340, _ in pairs(_G.transInfo) do
                if v340 == nil or v340 and v340.Parent == nil then
                    if v340 then
                        v340:Destroy();
                    end;
                    _G.transInfo[v340] = nil;
                    warn("cleaned trans info for ", v340);
                end;
            end;
        end;
    end);
    _G.transparentCharacter = function(v342, v343, v344, _, v346, v347) --[[ Line: 1463 ]]
        -- upvalues: v23 (ref), v6 (ref)
        local l_v342_Descendants_0 = v342:GetDescendants();
        table.insert(l_v342_Descendants_0, v342);
        local v349 = _G.getAccessorys(v342);
        for v350 = 1, #v349 do
            table.insert(l_v342_Descendants_0, v349[v350]);
        end;
        if v346 == nil then
            v346 = {};
        end;
        if v347 == nil then
            v347 = {};
        end;
        local v351 = _G.transTrash[v342];
        local function v354(v352) --[[ Line: 1481 ]] --[[ Name: checkAllowed ]]
            -- upvalues: v347 (ref), v346 (ref)
            if #v347 > 0 then
                for v353 = 1, #v347 do
                    if v352:HasTag(v347[v353]) then
                        return false;
                    end;
                end;
            end;
            if v352:FindFirstAncestorWhichIsA("Tool") then
                return false;
            else
                return (not not v352:IsA("BasePart") or v352:IsA("Decal") or v352:IsA("ParticleEmitter") or v352:IsA("Beam") or v352:IsA("Trail") or v352:IsA("PointLight")) and v352:GetAttribute("toriPart") == nil and v352:GetAttribute("alwaysVisible") == nil and table.find(v346, v352.ClassName) == nil;
            end;
        end;
        local v355 = "_Client";
        if v23 == true then
            v355 = "_Server";
        end;
        local v356 = "transparentCharacterHidden" .. v355;
        local function v370(v357, v358) --[[ Line: 1502 ]] --[[ Name: applyTransparency ]]
            -- upvalues: v354 (copy), v356 (copy), v351 (ref)
            if v354(v357) == true then
                local v359 = v357:IsA("ParticleEmitter") or v357:IsA("Beam") or v357:IsA("Trail");
                local v360 = v357:IsA("PointLight");
                local v361 = false;
                local v362 = v357:GetAttribute(v356) ~= nil;
                if (v357:IsA("BasePart") or v357:IsA("Decal")) and v357.Transparency ~= 1 then
                    v361 = true;
                end;
                if v359 == true and v357.Transparency ~= NumberSequence.new(1) then
                    v361 = true;
                end;
                if v360 and v357.Enabled == true then
                    v361 = true;
                end;
                if v361 == true and v362 == false then
                    local function v363() --[[ Line: 1522 ]] --[[ Name: updateTransparency ]]
                        -- upvalues: v351 (ref), v357 (copy), v360 (copy), v359 (copy)
                        if v351.Clearing == true then
                            return;
                        elseif _G.transInfo[v357] == nil then
                            return;
                        elseif v360 then
                            v357.Enabled = false;
                            return;
                        elseif v359 == false then
                            v357.Transparency = 1;
                            return;
                        else
                            v357.Transparency = NumberSequence.new(1);
                            return;
                        end;
                    end;
                    local v364 = "Transparency";
                    if v360 == true then
                        v364 = "Enabled";
                    end;
                    local v365 = false;
                    if _G.transInfo[v357] == nil then
                        v365 = true;
                        _G.transInfo[v357] = {
                            Value = v357[v364], 
                            Count = 0
                        };
                        v351.AttachedParts[v357] = true;
                        v357:SetAttribute(v356, true);
                        local v366 = v351:Add(function() --[[ Line: 1556 ]]
                            -- upvalues: v365 (ref), v357 (copy), v351 (ref)
                            if v365 == false then
                                return;
                            elseif _G.transInfo[v357] and _G.transInfo[v357].Count > 0 then
                                return;
                            else
                                v351.AttachedParts[v357] = nil;
                                _G.transInfo[v357] = nil;
                                return;
                            end;
                        end);
                        local l_v366_0 = v366 --[[ copy: 9 -> 10 ]];
                        v351:Add(v357.Destroying:Connect(function() --[[ Line: 1570 ]]
                            -- upvalues: v357 (copy), v351 (ref), l_v366_0 (copy)
                            if _G.transInfo[v357] then
                                _G.transInfo[v357] = nil;
                            end;
                            v351:Remove(l_v366_0);
                        end));
                    end;
                    local v368 = _G.transInfo[v357];
                    v368.Count = v368.Count + 1;
                    if v351.Clearing ~= true and _G.transInfo[v357] ~= nil then
                        if v360 then
                            v357.Enabled = false;
                        elseif v359 == false then
                            v357.Transparency = 1;
                        else
                            v357.Transparency = NumberSequence.new(1);
                        end;
                    end;
                    if v360 == false then
                        v351:Connect(v357:GetPropertyChangedSignal("Transparency"), v363);
                    else
                        v351:Connect(v357:GetPropertyChangedSignal("Enabled"), v363);
                    end;
                    return;
                elseif v362 == true and v358 == nil and _G.transInfo[v357] then
                    local v369 = _G.transInfo[v357];
                    v369.Count = v369.Count + 1;
                end;
            end;
        end;
        if v343 == nil and _G.transTrash[v342] == nil then
            v351 = v6.new();
            _G.transTrash[v342] = v351;
            v351.AttachedParts = {};
            v351:AttachToInstance(v342);
            v351:Add(function() --[[ Line: 1600 ]]
                -- upvalues: v342 (copy), v356 (copy), v351 (ref)
                _G.transTrash[v342] = nil;
                local v371 = {};
                for v372, _ in pairs(_G.transInfo) do
                    if v372:IsDescendantOf(v342) then
                        table.insert(v371, v372);
                    end;
                end;
                for _, v375 in ipairs(v371) do
                    _G.transInfo[v375] = nil;
                    v375:SetAttribute(v356, nil);
                    v375:SetAttribute(v356 .. "Count", nil);
                end;
                for v376, _ in pairs(v351.AttachedParts) do
                    if v376 then
                        _G.transInfo[v376] = nil;
                    end;
                end;
                table.clear(v351.AttachedParts);
            end);
            local l_ChildAdded_0 = v342.ChildAdded;
            v351:Add(l_ChildAdded_0:Connect(function(v379) --[[ Line: 1625 ]]
                -- upvalues: v370 (copy)
                if v379:IsA("Model") and v379:IsA("Tool") == false then
                    local l_v379_Descendants_0 = v379:GetDescendants();
                    for v381 = 1, #l_v379_Descendants_0 do
                        v370(l_v379_Descendants_0[v381], true);
                    end;
                end;
            end));
        end;
        local v382 = false;
        for v383 = 1, #l_v342_Descendants_0 do
            if v354(l_v342_Descendants_0[v383]) == true then
                local v384 = true;
                if v344 ~= nil and l_v342_Descendants_0[v383]:IsDescendantOf(v344) == true then
                    v384 = false;
                end;
                if v343 == nil and v384 == true then
                    v370(l_v342_Descendants_0[v383]);
                elseif _G.transInfo[l_v342_Descendants_0[v383]] then
                    local v385 = _G.transInfo[l_v342_Descendants_0[v383]];
                    v385.Count = v385.Count - 1;
                    if v343 == "forceShow" then
                        _G.transInfo[l_v342_Descendants_0[v383]].Count = 0;
                    end;
                    if _G.transInfo[l_v342_Descendants_0[v383]].Count <= 0 then
                        v385 = _G.transInfo[l_v342_Descendants_0[v383]].Value;
                        if l_v342_Descendants_0[v383].Parent == v342 and v382 == false then
                            v382 = true;
                            if _G.transTrash[v342] then
                                _G.transTrash[v342].Clearing = true;
                            end;
                        end;
                        _G.transInfo[l_v342_Descendants_0[v383]] = nil;
                        if v351 then
                            v351.AttachedParts[l_v342_Descendants_0[v383]] = nil;
                        end;
                        task.defer(function() --[[ Line: 1668 ]]
                            -- upvalues: l_v342_Descendants_0 (copy), v383 (copy), v385 (copy), v356 (copy)
                            if l_v342_Descendants_0[v383] and l_v342_Descendants_0[v383].Parent then
                                if l_v342_Descendants_0[v383]:IsA("PointLight") == false then
                                    l_v342_Descendants_0[v383].Transparency = v385;
                                else
                                    l_v342_Descendants_0[v383].Enabled = true;
                                end;
                                l_v342_Descendants_0[v383]:SetAttribute(v356, nil);
                                l_v342_Descendants_0[v383]:SetAttribute(v356 .. "Count", nil);
                            end;
                        end);
                    end;
                end;
                if _G.transInfo[l_v342_Descendants_0[v383]] then
                    l_v342_Descendants_0[v383]:SetAttribute(v356 .. "Count", _G.transInfo[l_v342_Descendants_0[v383]].Count);
                else
                    l_v342_Descendants_0[v383]:SetAttribute(v356 .. "Count", nil);
                end;
            end;
        end;
        if v382 == false and v351 and next(v351.AttachedParts) == nil and v343 ~= nil then
            v382 = true;
        end;
        if v382 == true and _G.transTrash[v342] then
            _G.transTrash[v342]:Destroy();
            _G.transTrash[v342] = nil;
        end;
    end;
    _G.bodyGetSection = function(v386, v387) --[[ Line: 1705 ]]
        local v388 = {};
        local _ = {
            "ParticleEmitter"
        };
        local l_v386_Descendants_0 = v386:GetDescendants();
        for v391 = 1, #l_v386_Descendants_0 do
            if (l_v386_Descendants_0[v391]:IsA("Motor6D") or l_v386_Descendants_0[v391]:IsA("Weld") or l_v386_Descendants_0[v391]:IsA("WeldConstraint")) and l_v386_Descendants_0[v391].Part0 == v387 then
                table.insert(v388, l_v386_Descendants_0[v391].Part1);
            end;
        end;
        local v392 = {};
        for v393 = 1, #v388 do
            local l_Parent_0 = v388[v393].Parent;
            if l_Parent_0 and l_Parent_0:IsA("Model") and l_Parent_0 ~= v386 then
                for _, v396 in pairs(l_Parent_0:GetDescendants()) do
                    if v396:IsA("BasePart") then
                        table.insert(v392, v396);
                    end;
                end;
            end;
        end;
        table.insert(v392, v387);
        return v392;
    end;
    _G.bodyTransSection = function(v397, v398, v399) --[[ Line: 1735 ]]
        local v400 = {};
        local v401 = {
            "ParticleEmitter"
        };
        local l_v397_Descendants_0 = v397:GetDescendants();
        for v403 = 1, #l_v397_Descendants_0 do
            if (l_v397_Descendants_0[v403]:IsA("Motor6D") or l_v397_Descendants_0[v403]:IsA("Weld") or l_v397_Descendants_0[v403]:IsA("WeldConstraint")) and l_v397_Descendants_0[v403].Part0 == v398 then
                table.insert(v400, l_v397_Descendants_0[v403].Part1);
            end;
        end;
        for v404 = 1, #v400 do
            local l_Parent_1 = v400[v404].Parent;
            if l_Parent_1 and l_Parent_1:IsA("Model") and l_Parent_1 ~= v397 then
                _G.transparentCharacter(l_Parent_1, v399, nil, nil, v401);
            end;
        end;
        if v399 == nil then
            _G.transparentCharacter(v398, nil, nil, nil, v401);
            return;
        else
            if v399 ~= nil and _G.transInfo[v398] ~= nil then
                _G.transparentCharacter(v398, true, nil, nil, v401);
            end;
            return;
        end;
    end;
    _G.Apply = require(game.ReplicatedStorage.Modules.ApplyRig);
    _G.modeBarModuleNames = function(v406) --[[ Line: 1772 ]]
        return string.split(v406, "-")[1];
    end;
    _G.setCollisionGroup = function(v407, v408) --[[ Line: 1777 ]]
        v407.CollisionGroup = v408;
    end;
    _G.getBone = function(v409, v410) --[[ Line: 1781 ]]
        return v409:FindFirstChild(v410, true);
    end;
    _G.showPlayersModel = function(v411, v412) --[[ Line: 1793 ]]
        if v412 == true then
            v411.ModelStreamingMode = Enum.ModelStreamingMode.Persistent;
            return;
        else
            v411.ModelStreamingMode = Enum.ModelStreamingMode.Default;
            return;
        end;
    end;
    _G.getTrueCD = function(v413) --[[ Line: 1802 ]]
        local v414 = {
            "BuddhaMode", 
            "PteraMode", 
            "ToriFullForm", 
            "VenomDemon"
        };
        local v415 = {
            BuddhaMode = 1, 
            PteraMode = 0.37, 
            ToriFullForm = 0.37, 
            VenomDemon = 1.1, 
            BlackLeg = 0.29, 
            FishmanKarate = 0.29, 
            DragonClaw = 0.29, 
            ["Iron Fist"] = 0.3, 
            ["Abyssal Karate"] = 0.29, 
            VenomDemonModel = 1.1, 
            ["MochiV2-MochiV2"] = 0.26, 
            DragonHybird = 0.325
        };
        if table.find(v414, v413) then
            return v415[v413];
        else
            local v416 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
            local v417 = 0.25;
            if v416[v413] then
                v417 = v416[v413].cooldown;
            end;
            if v415[v413] then
                v417 = v415[v413];
            end;
            return v417;
        end;
    end;
    _G.getHitBox = function(v418, v419) --[[ Line: 1844 ]]
        local l_FirstChild_5 = game.ReplicatedStorage:FindFirstChild("Stats" .. v418.Name);
        local l_PlayerFromCharacter_3 = game.Players:GetPlayerFromCharacter(v418);
        local v422 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
        local l_Tool_0 = v418:FindFirstChildWhichIsA("Tool");
        local l_v418_Attribute_0 = v418:GetAttribute("customM1");
        local v425 = Vector3.new(6, 10, 8, 0);
        local v426 = CFrame.new(0, 0, -1);
        local v427 = 0.25;
        local v428 = l_Tool_0 and l_Tool_0.Name or "";
        local v429 = false;
        if l_Tool_0 and v422[v428] then
            v429 = true;
        end;
        if l_Tool_0 and l_Tool_0:FindFirstChild("weaponOverride") then
            v428 = l_Tool_0:FindFirstChild("weaponOverride").Value;
        end;
        if l_v418_Attribute_0 == nil and l_FirstChild_5 and l_Tool_0 and not v422[v428] and l_FirstChild_5.Stats.FightingStyle.Value ~= "" and game.ReplicatedStorage.CombatAnimations:FindFirstChild(l_FirstChild_5.Stats.FightingStyle.Value) and l_Tool_0:GetAttributes().MeleeTool ~= nil then
            l_Tool_0 = l_PlayerFromCharacter_3.Backpack:FindFirstChild(l_FirstChild_5.Stats.FightingStyle.Value) or l_Tool_0;
            v428 = l_Tool_0.Name;
        end;
        if v419 and v429 == false then
            v428 = v419;
        end;
        v427 = _G.getTrueCD(l_v418_Attribute_0 == nil and v428 or l_v418_Attribute_0);
        if (l_v418_Attribute_0 == nil or v429 == true) and v422[v428] then
            v425 = v422[v428].Range;
            v426 = v422[v428].Offset;
            v427 = v422[v428].cooldown;
        end;
        if l_Tool_0 then
            if l_Tool_0.Name == "BlackLeg" then
                v425 = Vector3.new(6, 10, 8, 0);
                v426 = CFrame.new(0, 0, -1.5);
            elseif l_Tool_0.Name == "FishmanKarate" then
                v425 = Vector3.new(6, 10, 8, 0);
                v426 = CFrame.new(0, 0, -1.5);
            elseif l_Tool_0.Name == "DragonClaw" then
                v425 = Vector3.new(6, 10, 8, 0);
                v426 = CFrame.new(0, 0, -1.5);
            elseif l_Tool_0.Name == "Iron Fist" then
                v425 = Vector3.new(6, 10, 8, 0);
                v426 = CFrame.new(0, 0, -1.5);
            elseif l_Tool_0.Name == "Abyssal Karate" then
                v425 = Vector3.new(6, 10, 8, 0);
                v426 = CFrame.new(0, 0, -1.5);
            elseif l_Tool_0:GetAttributes().MeleeTool ~= nil then
                v425 = Vector3.new(6, 10, 8, 0);
                v426 = CFrame.new(0, 0, -1);
            end;
        end;
        if v422[v428] == nil then
            if l_v418_Attribute_0 then
                v425 = Vector3.new(0.25, 0.25, 0.25, 0);
            end;
            if l_v418_Attribute_0 == "DragonHybird" then
                v425 = Vector3.new(10, 10, 10, 0);
                v426 = CFrame.new(0, 0, -3);
            end;
        end;
        return Vector3.new(v425.X, 11, v425.Z), v426, v427, l_v418_Attribute_0;
    end;
    _G.isInsideBrick = function(v430, v431, v432) --[[ Line: 1951 ]]
        local v433 = v431:PointToObjectSpace(v430);
        local v434 = false;
        if math.abs(v433.X) <= v432.X / 2 then
            v434 = false;
            if math.abs(v433.Y) <= v432.Y / 2 then
                v434 = math.abs(v433.Z) <= v432.Z / 2;
            end;
        end;
        return v434;
    end;
    _G.getTargetsWithENV = function(v435) --[[ Line: 1958 ]]
        local v436 = {
            workspace.Env, 
            workspace.Ships, 
            workspace.Islands
        };
        for _, v438 in pairs(_G.getTargets(v435, nil, nil, true)) do
            table.insert(v436, v438);
        end;
        return v436;
    end;
    _G.SulongFurColors = {
        Color3.fromRGB(171, 137, 171), 
        Color3.fromRGB(168, 168, 168), 
        Color3.fromRGB(117, 176, 176), 
        Color3.fromRGB(138, 163, 166)
    };
    _G.getHumanoid = function(v439, v440) --[[ Line: 1973 ]]
        if typeof(v439) ~= "Instance" then
            return nil;
        elseif v439 == nil then
            return nil;
        else
            local l_v439_FirstAncestorWhichIsA_0 = v439:FindFirstAncestorWhichIsA("Model");
            if v440 then
                if v440:IsA("Player") and l_v439_FirstAncestorWhichIsA_0 == v440.Character then
                    return;
                elseif v440 == l_v439_FirstAncestorWhichIsA_0 then
                    return;
                end;
            end;
            if l_v439_FirstAncestorWhichIsA_0 then
                return l_v439_FirstAncestorWhichIsA_0:FindFirstChildWhichIsA("Humanoid");
            else
                return;
            end;
        end;
    end;
    _G.layoutMulti = {
        Common = 0, 
        Uncommon = -500, 
        Rare = -600, 
        Epic = -700, 
        Legendary = -800, 
        Mythical = -900, 
        Collectable = -1000
    };
    _G.hairTransparency = function(v442, v443) --[[ Line: 2009 ]]
        if v442:FindFirstChild("Hairs") == nil then
            return;
        else
            local l_Children_11 = v442.Hairs:GetChildren();
            for v445 = 1, #l_Children_11 do
                l_Children_11[v445].Transparency = v443;
            end;
            return;
        end;
    end;
    _G.checkPartIsBarrierFruit = function(v446) --[[ Line: 2019 ]]
        if v446 == nil then
            return false;
        else
            return v446.CollisionGroup:match("Barrier") ~= nil;
        end;
    end;
    _G.getMasteryInfo = function(v447, v448) --[[ Line: 2028 ]]
        local l_FirstChild_6 = game.ReplicatedStorage:FindFirstChild("Stats" .. v447.Name);
        if l_FirstChild_6 then
            local v450 = game:GetService("HttpService"):JSONDecode(l_FirstChild_6.MasteryPercentages.AllMasterys.Value);
            if v450[v448] then
                return v450[v448].Progress, v450[v448].Max;
            end;
        end;
        return nil;
    end;
    _G.promptQuestion = function(v451, v452, v453, v454, v455) --[[ Line: 2040 ]]
        -- upvalues: v23 (ref)
        if v454 and v451.PlayerGui:FindFirstChild(v454) then
            return;
        else
            local v456 = nil;
            _G.bindableExcu(function() --[[ Line: 2055 ]]
                -- upvalues: v456 (ref), v452 (copy), v454 (copy), v23 (ref), v455 (copy), v453 (copy), v451 (copy)
                v456 = script.ConfirmationPrompt:Clone();
                v456.Main.TextLabel.Text = v452;
                if v454 then
                    v456.Name = v454;
                end;
                v456:SetAttribute("isServer", v23);
                if v455 == true then
                    v456.ResetOnSpawn = false;
                end;
                local l_OptionsFrame_0 = v456.Main.OptionsFrame;
                local v458 = l_OptionsFrame_0.Accept:Clone();
                local v459 = false;
                for v460, v461 in pairs(v453) do
                    if typeof(v461) == "table" and v461.Function ~= nil then
                        if v459 == false then
                            v459 = true;
                            local l_l_OptionsFrame_0_Children_0 = l_OptionsFrame_0:GetChildren();
                            for v463 = 1, #l_l_OptionsFrame_0_Children_0 do
                                if l_l_OptionsFrame_0_Children_0[v463]:IsA("ImageButton") then
                                    l_l_OptionsFrame_0_Children_0[v463]:Destroy();
                                end;
                            end;
                        end;
                        local v464 = v458:Clone();
                        v464.ImageColor3 = v461.Color or Color3.fromRGB(255, 255, 255);
                        v464.Text.Text = v460;
                        v464.Name = v460;
                        v464:SetAttribute("buttonValue", v460);
                        v464.Parent = l_OptionsFrame_0;
                    end;
                end;
                v456.Parent = v451.PlayerGui;
                local v465 = nil;
                local function _(v466) --[[ Line: 2094 ]] --[[ Name: fireFunction ]]
                    -- upvalues: v453 (ref)
                    if v466 == "true" then
                        v466 = true;
                    elseif v466 == "false" then
                        v466 = false;
                    end;
                    if v453[v466] then
                        if typeof(v453[v466]) == "table" and v453[v466].Function ~= nil then
                            v453[v466].Function();
                            return;
                        else
                            v453[v466]();
                        end;
                    end;
                end;
                v465 = if v23 == true then v456.RemoteEvent.OnServerEvent:Connect(function(v468, v469) --[[ Line: 2111 ]]
                    -- upvalues: v451 (ref), v465 (ref), v453 (ref), v456 (ref)
                    if v468 ~= v451 then
                        return;
                    else
                        v465:Disconnect();
                        v465 = nil;
                        local _, l_result_3 = pcall(function() --[[ Line: 2117 ]]
                            -- upvalues: v469 (copy), v453 (ref)
                            local l_v469_0 = v469;
                            if l_v469_0 == "true" then
                                l_v469_0 = true;
                            elseif l_v469_0 == "false" then
                                l_v469_0 = false;
                            end;
                            if v453[l_v469_0] then
                                if typeof(v453[l_v469_0]) == "table" and v453[l_v469_0].Function ~= nil then
                                    v453[l_v469_0].Function();
                                    return;
                                else
                                    v453[l_v469_0]();
                                end;
                            end;
                        end);
                        if l_result_3 then
                            warn("ERROR:", l_result_3);
                        end;
                        if v456 then
                            v456:Destroy();
                        end;
                        return;
                    end;
                end) else v456.clientEvent.Event:Connect(function(v473) --[[ Line: 2128 ]]
                    -- upvalues: v465 (ref), v453 (ref), v456 (ref)
                    v465:Disconnect();
                    v465 = nil;
                    local _, l_result_4 = pcall(function() --[[ Line: 2131 ]]
                        -- upvalues: v473 (copy), v453 (ref)
                        local l_v473_0 = v473;
                        if l_v473_0 == "true" then
                            l_v473_0 = true;
                        elseif l_v473_0 == "false" then
                            l_v473_0 = false;
                        end;
                        if v453[l_v473_0] then
                            if typeof(v453[l_v473_0]) == "table" and v453[l_v473_0].Function ~= nil then
                                v453[l_v473_0].Function();
                                return;
                            else
                                v453[l_v473_0]();
                            end;
                        end;
                    end);
                    if l_result_4 then
                        warn("ERROR:", l_result_4);
                    end;
                    if v456 then
                        v456:Destroy();
                    end;
                end);
                v456.Client.Enabled = true;
            end);
            return v456;
        end;
    end;
    _G.promptQuestionSlider = function(v477, v478) --[[ Line: 2149 ]]
        -- upvalues: v8 (ref), v23 (ref)
        local l_staysForever_0 = v478.staysForever;
        local l_uiName_0 = v478.uiName;
        if l_uiName_0 and v477.PlayerGui:FindFirstChild(l_uiName_0) then
            return;
        elseif v478.Start ~= nil and v478.End ~= nil and v478.Start >= v478.End then
            return;
        else
            local v481 = nil;
            local v482 = Instance.new("BindableEvent", script);
            local v483 = v8.new();
            v482.Event:Connect(function() --[[ Line: 2165 ]]
                -- upvalues: v481 (ref), l_uiName_0 (copy), v23 (ref), l_staysForever_0 (copy), v478 (copy), v477 (copy), v483 (copy), v482 (copy)
                v481 = script.PromptNumberSlider:Clone();
                if l_uiName_0 then
                    v481.Name = l_uiName_0;
                end;
                v481:SetAttribute("isServer", v23);
                if l_staysForever_0 == true then
                    v481.ResetOnSpawn = false;
                end;
                local l_Slider_0 = v481.Main.Slider;
                l_Slider_0:SetAttribute("Start", v478.Start);
                l_Slider_0:SetAttribute("End", v478.End);
                l_Slider_0:SetAttribute("DisplayText", v478.DisplayText);
                if v478.Increment then
                    l_Slider_0:SetAttribute("Increment", v478.Increment);
                end;
                if v478.AcceptText then
                    v481.Main.OptionsFrame.Accept.Text.Text = v478.AcceptText;
                end;
                if v478.DeclineText then
                    v481.Main.OptionsFrame.Decline.Text.Text = v478.DeclineText;
                end;
                v481.Parent = v477.PlayerGui;
                local v485 = nil;
                local function _(v486) --[[ Line: 2197 ]] --[[ Name: fireFunction ]]
                    -- upvalues: v478 (ref)
                    local l_finishFunction_0 = v478.finishFunction;
                    if v486 ~= v486 then
                        return;
                    else
                        v486 = math.floor(v486);
                        warn("client finished", v486);
                        l_finishFunction_0(v486);
                        return;
                    end;
                end;
                v485 = if v23 == true then v481.RemoteEvent.OnServerEvent:Connect(function(v489, v490) --[[ Line: 2209 ]]
                    -- upvalues: v477 (ref), v485 (ref), v478 (ref), v483 (ref), v481 (ref)
                    if v489 ~= v477 then
                        return;
                    else
                        v485:Disconnect();
                        v485 = nil;
                        if typeof(v490) == "number" then
                            local l_v490_0 = v490;
                            local l_finishFunction_1 = v478.finishFunction;
                            if l_v490_0 == l_v490_0 then
                                l_v490_0 = math.floor(l_v490_0);
                                warn("client finished", l_v490_0);
                                l_finishFunction_1(l_v490_0);
                            end;
                        end;
                        v483:Fire();
                        if v481 then
                            v481:Destroy();
                        end;
                        return;
                    end;
                end) else v481.clientEvent.Event:Connect(function(v493) --[[ Line: 2225 ]]
                    -- upvalues: v485 (ref), v478 (ref), v483 (ref), v481 (ref)
                    v485:Disconnect();
                    v485 = nil;
                    if typeof(v493) == "number" then
                        local l_v493_0 = v493;
                        local l_finishFunction_2 = v478.finishFunction;
                        if l_v493_0 == l_v493_0 then
                            l_v493_0 = math.floor(l_v493_0);
                            warn("client finished", l_v493_0);
                            l_finishFunction_2(l_v493_0);
                        end;
                    end;
                    v483:Fire();
                    if v481 then
                        v481:Destroy();
                    end;
                end);
                v481.Client.Enabled = true;
                v482:Destroy();
            end);
            v482:Fire();
            v483:Wait();
            v483:DisconnectAll();
            return;
        end;
    end;
    _G.FightingStylesV2 = {
        ["Moonlit Electro"] = true, 
        ["Abyssal Karate"] = true, 
        Kamishiki = true
    };
    _G.getCurrentActiveV2 = function(v496) --[[ Line: 2254 ]]
        return game.ReplicatedStorage:FindFirstChild("Stats" .. v496.Name).Settings.CurrentV2.Value;
    end;
    _G.playerFruitPassiveEnabled = function(v497) --[[ Line: 2259 ]]
        local l_FirstChild_7 = game.ReplicatedStorage:FindFirstChild("Stats" .. v497.Name);
        local v499 = l_FirstChild_7.Stats.DF.Value:match("V2") ~= nil;
        local v500 = _G.FightingStylesV2[l_FirstChild_7.Stats.FightingStyle.Value] ~= nil;
        if v500 == true and v499 == false then
            return false;
        elseif v499 == true and v500 == false then
            return true;
        elseif v499 == true and v500 == true then
            if _G.getCurrentActiveV2(v497) == "Fighting Style" then
                return false;
            else
                return true;
            end;
        elseif v500 == false and v499 == false then
            return true;
        else
            return;
        end;
    end;
    _G.getFirstPart = function(v501) --[[ Line: 2285 ]]
        local v502 = string.split(v501, "-");
        return string.gsub(v502[1], "V2", "");
    end;
    local _ = {
        "Kamishiki", 
        "Abyssal Karate", 
        "Moonlit Electro"
    };
    _G.isFruitSupressed = function(v504) --[[ Line: 2292 ]]
        local l_FirstChild_8 = game.ReplicatedStorage:FindFirstChild("Stats" .. v504.Name);
        if l_FirstChild_8 == nil then
            return false;
        else
            local v506 = l_FirstChild_8.Stats.DF.Value:match("V2") ~= nil;
            local v507 = _G.FightingStylesV2[l_FirstChild_8.Stats.FightingStyle.Value] ~= nil;
            if l_FirstChild_8.Settings.CurrentV2.Value == "Fighting Style" and v507 == true then
                return true;
            elseif v506 == false and l_FirstChild_8.Stats.DF.Value ~= "" and _G.FightingStylesV2[l_FirstChild_8.Stats.FightingStyle.Value] then
                return true;
            else
                return false;
            end;
        end;
    end;
    _G.isFightingStyleSupressed = function(v508) --[[ Line: 2312 ]]
        local l_FirstChild_9 = game.ReplicatedStorage:FindFirstChild("Stats" .. v508.Name);
        if l_FirstChild_9 == nil then
            return false;
        else
            local v510 = l_FirstChild_9.Stats.DF.Value:match("V2") ~= nil;
            local v511 = _G.FightingStylesV2[l_FirstChild_9.Stats.FightingStyle.Value] ~= nil;
            if l_FirstChild_9.Settings.CurrentV2.Value == "Fruit" and v510 == true then
                return true;
            elseif v511 == false and v510 == true then
                return true;
            else
                return false;
            end;
        end;
    end;
    local function _(v512, v513) --[[ Line: 2333 ]] --[[ Name: FindStatObject ]]
        return game.ReplicatedStorage:FindFirstChild("Stats" .. v512.Name).Stats:FindFirstChild(v513);
    end;
    local function _(v515, v516) --[[ Line: 2339 ]] --[[ Name: FindSkillObject ]]
        return game.ReplicatedStorage:FindFirstChild("Stats" .. v515.Name):FindFirstChild("Skills"):FindFirstChild(v516);
    end;
    local function v526(v518, v519, v520, v521) --[[ Line: 2344 ]] --[[ Name: IsSkillRequirementMet ]]
        local l_FirstChild_10 = game.ReplicatedStorage:FindFirstChild("Stats" .. v518.Name).Stats:FindFirstChild(v519);
        if l_FirstChild_10 then
            if (l_FirstChild_10:IsA("NumberValue") or l_FirstChild_10:IsA("IntValue")) and l_FirstChild_10.Value < v520 then
                return false;
            elseif l_FirstChild_10:IsA("StringValue") then
                if typeof(v520) == "table" then
                    for v523 = 1, #v520 do
                        if v520[v523] == l_FirstChild_10.Value then
                            return true;
                        end;
                    end;
                end;
                if l_FirstChild_10.Value ~= v520 then
                    return false;
                end;
            end;
        elseif v519:match("/SKILL/") and v521 == nil then
            local v524 = string.gsub(v519, "/SKILL/", "");
            local l_FirstChild_11 = game.ReplicatedStorage:FindFirstChild("Stats" .. v518.Name):FindFirstChild("Skills"):FindFirstChild(v524);
            if l_FirstChild_11 and l_FirstChild_11.Value < v520 then
                return false;
            elseif l_FirstChild_11 == nil then
                return false;
            end;
        end;
        return true;
    end;
    local function v534(v527, v528, v529) --[[ Line: 2380 ]] --[[ Name: SkillRequirementsMet ]]
        -- upvalues: v526 (copy)
        if v528 == nil then
            return true;
        else
            local v530 = true;
            local v531 = nil;
            for v532, v533 in v528 do
                v530 = v526(v527, v532, v533, v529);
                v531 = v533;
                if v530 == false then
                    break;
                end;
            end;
            return v530, v531;
        end;
    end;
    _G.ScaleWithHPChar = function(v535, v536) --[[ Line: 2396 ]]
        return v536 * (v535.Humanoid.Health / v535.Humanoid.MaxHealth);
    end;
    _G.SkillRequirementsMet = v534;
    _G.emitHitVfx = function(v537, v538, v539, v540) --[[ Line: 2403 ]]
        local v541 = nil;
        if v540 and typeof(v540) == "table" then
            v541 = v540.Tag;
            v540 = v540.Color;
        end;
        local v542 = v537:Clone();
        v542.CFrame = v538 * CFrame.Angles(math.rad((math.random(0, 360))), math.rad((math.random(0, 360))), (math.rad((math.random(0, 360)))));
        if v539 then
            _G.scaleParticle(v542, v539, true);
        end;
        if v540 then
            _G.recolorParticles(v542, v540, v541);
        end;
        local l_PointLight_0 = v542:FindFirstChildWhichIsA("PointLight");
        v542.Parent = workspace.Effects;
        if l_PointLight_0 then
            _G.tween(l_PointLight_0, {
                0.25, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Range = l_PointLight_0.Range * 3, 
                Brightness = 0
            });
        end;
        _G.customEmit(v542);
        _G.destroy(v542, 5);
        return v542;
    end;
    _G.customEmitCFrame = function(v544, v545) --[[ Line: 2429 ]]
        local v546 = nil;
        local _ = v545.Color;
        local l_Scale_0 = v545.Scale;
        local l_CFrame_0 = v545.CFrame;
        local l_Color_1 = v545.Color;
        if l_Color_1 and typeof(l_Color_1) == "table" then
            v546 = l_Color_1.Tag;
            l_Color_1 = l_Color_1.Color;
        end;
        local v551 = v544:Clone();
        v551.CFrame = l_CFrame_0;
        if l_Scale_0 then
            _G.scaleParticle(v551, l_Scale_0, true);
        end;
        if l_Color_1 then
            _G.recolorParticles(v551, l_Color_1, v546);
        end;
        local l_PointLight_1 = v551:FindFirstChildWhichIsA("PointLight");
        v551.Parent = workspace.Effects;
        if l_PointLight_1 then
            _G.tween(l_PointLight_1, {
                0.25, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Range = l_PointLight_1.Range * 3, 
                Brightness = 0
            });
        end;
        _G.customEmit(v551);
        _G.destroy(v551, 5);
        return v551;
    end;
    _G.vfxToFloor = function(v553, v554) --[[ Line: 2461 ]]
        local l_StartCFrame_0 = v554.StartCFrame;
        local v556 = v554.Depth or 6;
        local v557 = v554.Offset or CFrame.Angles(-1.5709708597200962, 0, 0);
        local l_v553_0 = v553;
        if v554.Clone then
            l_v553_0 = l_v553_0:Clone();
        end;
        local v559, v560, v561 = _G.getRayFloor(l_StartCFrame_0, v556);
        if v559 then
            local v562 = CFrame.new(v560, v560 + v561) * v557 * CFrame.new(0, 0.1, 0);
            _G.recolorParticles(l_v553_0, v559.Color);
            if l_v553_0:IsA("BasePart") then
                l_v553_0.CFrame = v562;
            elseif l_v553_0:IsA("Attachment") then
                l_v553_0.WorldCFrame = v562;
            end;
            if v554.Clone ~= nil then
                l_v553_0.Parent = workspace.Effects;
                _G.customEmit(l_v553_0);
                _G.destroy(l_v553_0, 6);
            end;
            return l_v553_0;
        else
            if v554.Clone then
                l_v553_0:Destroy();
            else
                l_v553_0:ClearAllChildren();
            end;
            return nil;
        end;
    end;
    _G.castingSkill = function(v563, v564, v565) --[[ Line: 2501 ]]
        local v566 = false;
        local v567 = tick();
        while true do
            if _G.check:inspect(v563) == false then
                v566 = true;
                break;
            else
                task.wait();
                if v564 <= tick() - v567 then
                    break;
                end;
            end;
        end;
        if v565 == true then
            task.wait(v564 - (tick() - v567));
        end;
        if v566 == true then
            return false;
        else
            return true;
        end;
    end;
    _G.removeParticles = function(v568, v569) --[[ Line: 2521 ]]
        if v569 == nil then
            v569 = "recolorable";
        end;
        local l_v568_Descendants_0 = v568:GetDescendants();
        for v571 = 1, #l_v568_Descendants_0 do
            if l_v568_Descendants_0[v571]:GetAttribute(v569) ~= nil then
                l_v568_Descendants_0[v571].Transparency = NumberSequence.new(1);
            end;
        end;
    end;
    local v572 = {};
    local v573 = nil;
    _G.preloadFolderName = function(v574) --[[ Line: 2537 ]]
        -- upvalues: v572 (copy), v573 (ref)
        if _G.effectsFolder == nil then
            repeat
                task.wait();
            until _G.effectsFolder;
        end;
        if v572[v574] then
            return;
        else
            local l_clientEffectsFolder_0 = _G.clientEffectsFolder;
            if v573 == nil then
                local v576 = {};
                local l_l_clientEffectsFolder_0_Descendants_0 = l_clientEffectsFolder_0:GetDescendants();
                for v578 = 1, #l_l_clientEffectsFolder_0_Descendants_0 do
                    if l_l_clientEffectsFolder_0_Descendants_0[v578]:IsA("Folder") and l_l_clientEffectsFolder_0_Descendants_0[v578].Parent:IsA("Folder") then
                        table.insert(v576, l_l_clientEffectsFolder_0_Descendants_0[v578]);
                    end;
                end;
                v573 = v576;
            end;
            v572[v574] = true;
            if v573 then
                local function v591(v579, v580) --[[ Line: 2565 ]] --[[ Name: getSimilarityScore ]]
                    if v579 == v580 then
                        return 10;
                    else
                        local v581 = string.gsub(v579:lower(), "[%s%p]", "");
                        local v582 = string.gsub(v580:lower(), "[%s%p]", "");
                        local v583 = #v581;
                        local v584 = #v582;
                        local v585 = {};
                        for v586 = 0, v583 do
                            v585[v586] = {};
                            for v587 = 0, v584 do
                                v585[v586][v587] = 0;
                            end;
                        end;
                        for v588 = 1, v583 do
                            for v589 = 1, v584 do
                                if v581:sub(v588, v588) == v582:sub(v589, v589) then
                                    v585[v588][v589] = v585[v588 - 1][v589 - 1] + 1;
                                else
                                    v585[v588][v589] = math.max(v585[v588 - 1][v589], v585[v588][v589 - 1]);
                                end;
                            end;
                        end;
                        local v590 = v585[v583][v584];
                        return (math.max(v590 / v583, v590 / v584));
                    end;
                end;
                local v592 = nil;
                local v593 = 0;
                for v594 = 1, #v573 do
                    local v595 = v591(v574, v573[v594].Name);
                    if v593 < v595 then
                        v593 = v595;
                        v592 = v573[v594];
                    end;
                end;
                do
                    local l_v592_0 = v592;
                    if l_v592_0 and v593 >= 0.5 then
                        task.spawn(function() --[[ Line: 2613 ]]
                            -- upvalues: l_v592_0 (ref)
                            warn("PRELOADING", l_v592_0:GetFullName());
                            game:GetService("ContentProvider"):PreloadAsync(l_v592_0:GetDescendants());
                        end);
                    end;
                end;
            end;
            return;
        end;
    end;
    local v597 = Instance.new("BindableEvent", script);
    v597.Event:Connect(function(v598) --[[ Line: 2624 ]]
        v598();
    end);
    _G.bindableExcu = function(v599) --[[ Line: 2628 ]]
        -- upvalues: v597 (copy)
        v597:Fire(v599);
    end;
    _G.canTargetCFrame = function(v600) --[[ Line: 2632 ]]
        local v601 = true;
        if v600:FindFirstChild("SeaNPC") then
            v601 = false;
        end;
        if v601 == true and v600:FindFirstChild("hyperArmor") then
            v601 = false;
        end;
        if v601 == true and v600:FindFirstChild("AntiAir") then
            v601 = false;
        end;
        if v601 == true and (v600:FindFirstChild("motionLess") or v600:GetAttribute("motionLess")) then
            v601 = false;
        end;
        return v601;
    end;
    _G.ToolDesc = require(game.ReplicatedStorage.Modules.ToolDesc);
end;