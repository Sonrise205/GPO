local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Settings);
local v3 = require(script.Octree);
local v4 = v2.new(script, {
    WindDirection = Vector3.new(0.5, 0, 0.5, 0), 
    WindSpeed = 20, 
    WindPower = 0.5
});
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local l_BindableEvent_3 = Instance.new("BindableEvent");
local l_BindableEvent_4 = Instance.new("BindableEvent");
return {
    ObjectMetadata = {}, 
    Octree = v3.new(), 
    Handled = 0, 
    Active = 0, 
    LastUpdate = tick(), 
    ObjectShakeAdded = l_BindableEvent_0.Event, 
    ObjectShakeRemoved = l_BindableEvent_1.Event, 
    ObjectShakeUpdated = l_BindableEvent_2.Event, 
    Paused = l_BindableEvent_3.Event, 
    Resumed = l_BindableEvent_4.Event, 
    Connect = function(v10, v11, v12) --[[ Line: 59 ]] --[[ Name: Connect ]]
        local v13 = v10[v11];
        assert(typeof(v13) == "function", "Unknown function: " .. v11);
        return v12:Connect(function(...) --[[ Line: 63 ]]
            -- upvalues: v13 (copy), v10 (copy)
            return v13(v10, ...);
        end);
    end, 
    AddObjectShake = function(v14, v15, v16) --[[ Line: 68 ]] --[[ Name: AddObjectShake ]]
        -- upvalues: v2 (copy), v4 (copy), l_BindableEvent_0 (copy)
        if typeof(v15) ~= "Instance" then
            return;
        elseif not v15:IsA("BasePart") then
            return;
        else
            local l_ObjectMetadata_0 = v14.ObjectMetadata;
            if l_ObjectMetadata_0[v15] then
                return;
            else
                v14.Handled = v14.Handled + 1;
                l_ObjectMetadata_0[v15] = {
                    Node = v14.Octree:CreateNode(v15.Position, v15), 
                    Settings = v2.new(v15, v4), 
                    Seed = math.random(1000) * 0.1, 
                    Origin = v15.CFrame
                };
                v14:UpdateObjectSettings(v15, v16);
                l_BindableEvent_0:Fire(v15);
                return;
            end;
        end;
    end, 
    RemoveObjectShake = function(v18, v19) --[[ Line: 98 ]] --[[ Name: RemoveObjectShake ]]
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
                v21.Node:Destroy();
                if v19:IsA("BasePart") then
                    v19.CFrame = v21.Origin;
                end;
            end;
            l_BindableEvent_1:Fire(v19);
            return;
        end;
    end, 
    Update = function(v22) --[[ Line: 120 ]] --[[ Name: Update ]]
        local v23 = tick();
        local v24 = v23 - v22.LastUpdate;
        if v24 < 0.016666666666666666 then
            return;
        else
            v22.LastUpdate = v23;
            debug.profilebegin("WindShake");
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local v26 = l_CurrentCamera_0 and l_CurrentCamera_0.CFrame;
            debug.profilebegin("Octree Search");
            local v27 = v22.Octree:RadiusSearch(v26.Position + v26.LookVector * 115, 120);
            debug.profileend();
            local v28 = #v27;
            v22.Active = v28;
            if v28 < 1 then
                return;
            else
                local v29 = math.min(1, v24 * 8);
                local v30 = table.create(v28);
                local l_ObjectMetadata_2 = v22.ObjectMetadata;
                debug.profilebegin("Calc");
                for v32, v33 in v27 do
                    local v34 = l_ObjectMetadata_2[v33];
                    local v35 = v34.LastCompute or 0;
                    local l_Origin_0 = v34.Origin;
                    local v37 = v34.CFrame or l_Origin_0;
                    if v23 - v35 > 0.03333333333333333 then
                        local l_Settings_0 = v34.Settings;
                        local l_Seed_0 = v34.Seed;
                        local v40 = l_Settings_0.WindPower * 0.1;
                        local v41 = v23 * (l_Settings_0.WindSpeed * 0.08);
                        local v42 = math.noise(v41, 0, l_Seed_0) * v40;
                        local v43 = math.noise(v41, 0, -l_Seed_0) * v40;
                        local v44 = math.noise(v41, 0, l_Seed_0 + l_Seed_0) * v40;
                        local l_PivotOffset_0 = v33.PivotOffset;
                        v34.Target = (l_Origin_0 * l_PivotOffset_0 * CFrame.Angles(v42, v43, v44) + l_Settings_0.WindDirection * ((0.5 + math.noise(v41, l_Seed_0, l_Seed_0)) * v40)) * l_PivotOffset_0:Inverse();
                        v34.LastCompute = v23;
                    end;
                    v37 = v37:Lerp(v34.Target, v29);
                    v34.CFrame = v37;
                    v30[v32] = v37;
                end;
                debug.profileend();
                workspace:BulkMoveTo(v27, v30, Enum.BulkMoveMode.FireCFrameChanged);
                debug.profileend();
                return;
            end;
        end;
    end, 
    Pause = function(v46) --[[ Line: 187 ]] --[[ Name: Pause ]]
        -- upvalues: l_BindableEvent_3 (copy)
        if v46.UpdateConnection then
            v46.UpdateConnection:Disconnect();
            v46.UpdateConnection = nil;
        end;
        v46.Active = 0;
        v46.Running = false;
        l_BindableEvent_3:Fire();
    end, 
    Resume = function(v47) --[[ Line: 199 ]] --[[ Name: Resume ]]
        -- upvalues: l_RunService_0 (copy), l_BindableEvent_4 (copy)
        if v47.Running then
            return;
        else
            v47.Running = true;
            v47.UpdateConnection = v47:Connect("Update", l_RunService_0.Heartbeat);
            l_BindableEvent_4:Fire();
            return;
        end;
    end, 
    Init = function(v48) --[[ Line: 212 ]] --[[ Name: Init ]]
        -- upvalues: v4 (copy), l_CollectionService_0 (copy)
        if v48.Initialized then
            return;
        else
            v48.Initialized = true;
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
            v48:Cleanup();
            v48.AddedConnection = v48:Connect("AddObjectShake", (l_CollectionService_0:GetInstanceAddedSignal("WindShake")));
            v48.RemovedConnection = v48:Connect("RemoveObjectShake", (l_CollectionService_0:GetInstanceRemovedSignal("WindShake")));
            for _, v53 in pairs(l_CollectionService_0:GetTagged("WindShake")) do
                v48:AddObjectShake(v53);
            end;
            v48:Resume();
            return;
        end;
    end, 
    Cleanup = function(v54) --[[ Line: 254 ]] --[[ Name: Cleanup ]]
        if not v54.Initialized then
            return;
        else
            v54:Pause();
            if v54.AddedConnection then
                v54.AddedConnection:Disconnect();
                v54.AddedConnection = nil;
            end;
            if v54.RemovedConnection then
                v54.RemovedConnection:Disconnect();
                v54.RemovedConnection = nil;
            end;
            table.clear(v54.ObjectMetadata);
            v54.Octree:ClearNodes();
            v54.Handled = 0;
            v54.Active = 0;
            v54.Initialized = false;
            return;
        end;
    end, 
    UpdateObjectSettings = function(v55, v56, v57) --[[ Line: 279 ]] --[[ Name: UpdateObjectSettings ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if typeof(v56) ~= "Instance" then
            return;
        elseif typeof(v57) ~= "table" then
            return;
        elseif not v55.ObjectMetadata[v56] and v56 ~= script then
            return;
        else
            for v58, v59 in pairs(v57) do
                v56:SetAttribute(v58, v59);
            end;
            l_BindableEvent_2:Fire(v56);
            return;
        end;
    end, 
    UpdateAllObjectSettings = function(v60, v61) --[[ Line: 299 ]] --[[ Name: UpdateAllObjectSettings ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if typeof(v61) ~= "table" then
            return;
        else
            for v62, _ in pairs(v60.ObjectMetadata) do
                for v64, v65 in pairs(v61) do
                    v62:SetAttribute(v64, v65);
                end;
                l_BindableEvent_2:Fire(v62);
            end;
            return;
        end;
    end, 
    SetDefaultSettings = function(v66, v67) --[[ Line: 312 ]] --[[ Name: SetDefaultSettings ]]
        v66:UpdateObjectSettings(script, v67);
    end
};