local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Settings);
local v3 = require(script.VectorMap);
local v4 = {
    WindDirection = Vector3.new(0.5, 0, 0.5, 0), 
    WindSpeed = 20, 
    WindPower = 0.5
};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local l_BindableEvent_3 = Instance.new("BindableEvent");
local l_BindableEvent_4 = Instance.new("BindableEvent");
return {
    RenderDistance = 130, 
    MaxRefreshRate = 0.03333333333333333, 
    SharedSettings = v2.new(script), 
    ObjectMetadata = {}, 
    VectorMap = v3.new(), 
    Handled = 0, 
    Active = 0, 
    _partList = table.create(500), 
    _cframeList = table.create(500), 
    ObjectShakeAdded = l_BindableEvent_0.Event, 
    ObjectShakeRemoved = l_BindableEvent_1.Event, 
    ObjectShakeUpdated = l_BindableEvent_2.Event, 
    Paused = l_BindableEvent_3.Event, 
    Resumed = l_BindableEvent_4.Event, 
    Connect = function(v10, v11, v12) --[[ Line: 62 ]] --[[ Name: Connect ]]
        local v13 = v10[v11];
        assert(typeof(v13) == "function", "Unknown function: " .. v11);
        return v12:Connect(function(...) --[[ Line: 66 ]]
            -- upvalues: v13 (copy), v10 (copy)
            return v13(v10, ...);
        end);
    end, 
    AddObjectShake = function(v14, v15, v16) --[[ Line: 71 ]] --[[ Name: AddObjectShake ]]
        -- upvalues: v2 (copy), l_BindableEvent_0 (copy)
        if typeof(v15) ~= "Instance" then
            return;
        elseif not v15:IsA("BasePart") and not v15:IsA("Bone") then
            return;
        else
            local l_ObjectMetadata_0 = v14.ObjectMetadata;
            if l_ObjectMetadata_0[v15] then
                return;
            else
                v14.Handled = v14.Handled + 1;
                l_ObjectMetadata_0[v15] = {
                    ChunkKey = v14.VectorMap:AddObject(if v15:IsA("Bone") then v15.WorldPosition else v15.Position, v15), 
                    Settings = v2.new(v15), 
                    Seed = math.random(5000) * 0.32, 
                    Origin = if v15:IsA("Bone") then v15.WorldCFrame else v15.CFrame, 
                    LastUpdate = os.clock()
                };
                if v16 then
                    v14:UpdateObjectSettings(v15, v16);
                end;
                l_BindableEvent_0:Fire(v15);
                return;
            end;
        end;
    end, 
    RemoveObjectShake = function(v18, v19) --[[ Line: 107 ]] --[[ Name: RemoveObjectShake ]]
        -- upvalues: l_BindableEvent_1 (copy)
        if typeof(v19) ~= "Instance" then
            return;
        else
            local l_ObjectMetadata_1 = v18.ObjectMetadata;
            local v21 = l_ObjectMetadata_1[v19];
            if v21 then
                v18.Handled = v18.Handled - 1;
                l_ObjectMetadata_1[v19] = nil;
                v21.Settings:Destroy();
                v18.VectorMap:RemoveObject(v21.ChunkKey, v19);
                if v19:IsA("BasePart") then
                    v19.CFrame = v21.Origin;
                elseif v19:IsA("Bone") then
                    v19.WorldCFrame = v21.Origin;
                end;
            end;
            l_BindableEvent_1:Fire(v19);
            return;
        end;
    end, 
    Update = function(v22, v23) --[[ Line: 131 ]] --[[ Name: Update ]]
        debug.profilebegin("WindShake");
        local v24 = 0;
        debug.profilebegin("Update");
        local v25 = os.clock();
        local v26 = v23 * 3;
        local v27 = math.min(1, v23 * 5);
        local v28 = 0;
        local l__partList_0 = v22._partList;
        local l__cframeList_0 = v22._cframeList;
        table.clear(l__partList_0);
        table.clear(l__cframeList_0);
        local l_ObjectMetadata_2 = v22.ObjectMetadata;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
        local l_RenderDistance_0 = v22.RenderDistance;
        local l_MaxRefreshRate_0 = v22.MaxRefreshRate;
        local l_SharedSettings_0 = v22.SharedSettings;
        local l_WindPower_0 = l_SharedSettings_0.WindPower;
        local l_WindSpeed_0 = l_SharedSettings_0.WindSpeed;
        local l_WindDirection_0 = l_SharedSettings_0.WindDirection;
        v22.VectorMap:ForEachObjectInView(l_CurrentCamera_0, l_RenderDistance_0, function(v40, v41) --[[ Line: 161 ]]
            -- upvalues: l_ObjectMetadata_2 (copy), l_Position_0 (copy), l_RenderDistance_0 (copy), v26 (copy), l_MaxRefreshRate_0 (copy), v25 (copy), v24 (ref), l_WindDirection_0 (copy), l_WindPower_0 (copy), l_WindSpeed_0 (copy), v27 (copy), v28 (ref), l__partList_0 (copy), l__cframeList_0 (copy)
            local v42 = l_ObjectMetadata_2[v41];
            local v43 = v42.LastUpdate or 0;
            local v44 = v40 == "Bone";
            local v45 = if v44 then v41.WorldCFrame else v41.CFrame;
            local v46 = (l_Position_0 - v45.Position).Magnitude / l_RenderDistance_0;
            local v47 = v46 * v46;
            local v48 = 1 / math.random(60, 120);
            if v26 * v47 + l_MaxRefreshRate_0 >= v25 - v43 + v48 then
                return;
            else
                v42.LastUpdate = v25;
                v24 = v24 + 1;
                local l_Settings_0 = v42.Settings;
                local v50 = l_Settings_0.WindDirection or l_WindDirection_0;
                if v50.Magnitude < 1.0E-5 then
                    return;
                else
                    local v51 = (l_Settings_0.WindPower or l_WindPower_0) * 0.2;
                    if v51 < 1.0E-5 then
                        return;
                    else
                        local v52 = v25 * ((l_Settings_0.WindSpeed or l_WindSpeed_0) * 0.08);
                        if v52 < 1.0E-5 then
                            return;
                        else
                            local l_Seed_0 = v42.Seed;
                            local v54 = (math.noise(v52, 0, l_Seed_0) + 0.4) * v51;
                            local v55 = math.clamp(v27 + v47, 0.1, 0.5);
                            local v56 = v51 / 3;
                            local v57 = v42.Origin * (l_Settings_0.PivotOffset or CFrame.identity);
                            local v58 = v57:VectorToObjectSpace(v50);
                            if v44 then
                                v41.Transform = v41.Transform:Lerp(CFrame.fromAxisAngle(v58:Cross((Vector3.new(0, 1, 0, 0))), -v54) * CFrame.Angles(math.noise(l_Seed_0, 0, v52) * v56, math.noise(l_Seed_0, v52, 0) * v56, math.noise(v52, l_Seed_0, 0) * v56) + v58 * v54 * v51, v55);
                                return;
                            else
                                v28 = v28 + 1;
                                l__partList_0[v28] = v41;
                                l__cframeList_0[v28] = v45:Lerp(v57 * CFrame.fromAxisAngle(v58:Cross((Vector3.new(0, 1, 0, 0))), -v54) * CFrame.Angles(math.noise(l_Seed_0, 0, v52) * v56, math.noise(l_Seed_0, v52, 0) * v56, math.noise(v52, l_Seed_0, 0) * v56) * (l_Settings_0.PivotOffsetInverse or CFrame.identity) + v50 * v54 * (v51 * 2), v55);
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end);
        v22.Active = v24;
        debug.profileend();
        workspace:BulkMoveTo(l__partList_0, l__cframeList_0, Enum.BulkMoveMode.FireCFrameChanged);
        debug.profileend();
    end, 
    Pause = function(v59) --[[ Line: 247 ]] --[[ Name: Pause ]]
        -- upvalues: l_BindableEvent_3 (copy)
        if v59.UpdateConnection then
            v59.UpdateConnection:Disconnect();
            v59.UpdateConnection = nil;
        end;
        v59.Active = 0;
        v59.Running = false;
        l_BindableEvent_3:Fire();
    end, 
    Resume = function(v60) --[[ Line: 259 ]] --[[ Name: Resume ]]
        -- upvalues: l_RunService_0 (copy), l_BindableEvent_4 (copy)
        if v60.Running then
            return;
        else
            v60.Running = true;
            v60.UpdateConnection = v60:Connect("Update", l_RunService_0.Heartbeat);
            l_BindableEvent_4:Fire();
            return;
        end;
    end, 
    Init = function(v61, v62) --[[ Line: 272 ]] --[[ Name: Init ]]
        -- upvalues: v4 (copy), l_CollectionService_0 (copy)
        if v61.Initialized then
            return;
        else
            local l_script_Attribute_0 = script:GetAttribute("WindPower");
            local l_script_Attribute_1 = script:GetAttribute("WindSpeed");
            local l_script_Attribute_2 = script:GetAttribute("WindDirection");
            if typeof(l_script_Attribute_0) ~= "number" then
                script:SetAttribute("WindPower", v4.WindPower);
            end;
            if typeof(l_script_Attribute_1) ~= "number" then
                script:SetAttribute("WindSpeed", v4.WindSpeed);
            end;
            if typeof(l_script_Attribute_2) ~= "Vector3" then
                script:SetAttribute("WindDirection", v4.WindDirection);
            end;
            v61:Cleanup();
            v61.Initialized = true;
            v61.AddedConnection = v61:Connect("AddObjectShake", (l_CollectionService_0:GetInstanceAddedSignal("WindShake")));
            v61.RemovedConnection = v61:Connect("RemoveObjectShake", (l_CollectionService_0:GetInstanceRemovedSignal("WindShake")));
            for _, v67 in l_CollectionService_0:GetTagged("WindShake") do
                v61:AddObjectShake(v67);
            end;
            if v62 and v62.MatchWorkspaceWind then
                v61:MatchWorkspaceWind();
                v61.WorkspaceWindConnection = workspace:GetPropertyChangedSignal("GlobalWind"):Connect(function() --[[ Line: 312 ]]
                    -- upvalues: v61 (copy)
                    v61:MatchWorkspaceWind();
                end);
            end;
            v61:Resume();
            return;
        end;
    end, 
    Cleanup = function(v68) --[[ Line: 321 ]] --[[ Name: Cleanup ]]
        if not v68.Initialized then
            return;
        else
            v68:Pause();
            if v68.AddedConnection then
                v68.AddedConnection:Disconnect();
                v68.AddedConnection = nil;
            end;
            if v68.RemovedConnection then
                v68.RemovedConnection:Disconnect();
                v68.RemovedConnection = nil;
            end;
            if v68.WorkspaceWindConnection then
                v68.WorkspaceWindConnection:Disconnect();
                v68.WorkspaceWindConnection = nil;
            end;
            table.clear(v68.ObjectMetadata);
            v68.VectorMap:ClearAll();
            v68.Handled = 0;
            v68.Active = 0;
            v68.Initialized = false;
            return;
        end;
    end, 
    UpdateObjectSettings = function(v69, v70, v71) --[[ Line: 351 ]] --[[ Name: UpdateObjectSettings ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if typeof(v70) ~= "Instance" then
            return;
        elseif typeof(v71) ~= "table" then
            return;
        elseif not v69.ObjectMetadata[v70] and v70 ~= script then
            return;
        else
            for v72, v73 in v71 do
                v70:SetAttribute(v72, v73);
            end;
            l_BindableEvent_2:Fire(v70);
            return;
        end;
    end, 
    UpdateAllObjectSettings = function(v74, v75) --[[ Line: 371 ]] --[[ Name: UpdateAllObjectSettings ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if typeof(v75) ~= "table" then
            return;
        else
            for v76, _ in v74.ObjectMetadata do
                for v78, v79 in v75 do
                    v76:SetAttribute(v78, v79);
                end;
                l_BindableEvent_2:Fire(v76);
            end;
            return;
        end;
    end, 
    SetDefaultSettings = function(v80, v81) --[[ Line: 384 ]] --[[ Name: SetDefaultSettings ]]
        v80:UpdateObjectSettings(script, v81);
    end, 
    MatchWorkspaceWind = function(v82) --[[ Line: 388 ]] --[[ Name: MatchWorkspaceWind ]]
        local l_GlobalWind_0 = workspace.GlobalWind;
        local l_Unit_0 = l_GlobalWind_0.Unit;
        local v85 = 0;
        local v86 = 0;
        local l_Magnitude_0 = l_GlobalWind_0.Magnitude;
        if l_Magnitude_0 > 0 then
            v86 = if l_Magnitude_0 > 1 then math.log10(l_Magnitude_0) + 0.2 else 0.3;
            v85 = if l_Magnitude_0 < 100 then l_Magnitude_0 * 1.2 + 5 else 125;
        end;
        v82:SetDefaultSettings({
            WindDirection = l_Unit_0, 
            WindSpeed = v85, 
            WindPower = v86
        });
    end
};