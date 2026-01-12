--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TestService");
local _ = game:GetService("StarterPlayer").StarterPlayerScripts;
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local v6 = require(l_Modules_0.OceanModule);
local v7 = require(script.Parent.Parallel);
local l_VertexGrid_0 = v6.VertexGrid;
local l_PlaneSize_0 = v6.PlaneSize;
local l_NumPlaneRows_0 = v6.NumPlaneRows;
local l_SeaLevel_0 = v6.SeaLevel;
local l_PlaneParams_0 = v6.PlaneParams;
local v13 = l_PlaneSize_0 * 0.5;
local l_Planes_0 = l_PlaneParams_0.Planes;
local v15 = Vector2.new(9000000000, 9000000000);
local v16 = -v13;
local v17 = table.create(4000);
local v18 = {};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local function _(v20, v21) --[[ Line: 31 ]] --[[ Name: WithinPlane ]]
    -- upvalues: v16 (copy), v13 (copy)
    local v22 = v21:ToObjectSpace(v20);
    local v23 = false;
    if v22.X > v16 then
        v23 = false;
        if v22.X < v13 then
            v23 = false;
            if v22.Z > v16 then
                v23 = v22.Z < v13;
            end;
        end;
    end;
    return v23;
end;
local function _(v25, v26) --[[ Line: 37 ]] --[[ Name: CeilToMult ]]
    return math.ceil(v25 / v26) * v26;
end;
local v28 = l_NumPlaneRows_0 * 0.5;
local v29 = {};
local v30 = 0.016;
local function v32() --[[ Line: 46 ]] --[[ Name: UpdateRenderSpeed ]]
    -- upvalues: v30 (ref)
    local l_Value_0 = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value;
    if l_Value_0 == 0 then
        v30 = 0.033;
        return;
    elseif l_Value_0 < 5 then
        v30 = 0.05;
        return;
    else
        v30 = 0.016;
        return;
    end;
end;
l_GameSettings_0:GetPropertyChangedSignal("SavedQualityLevel"):Connect(v32);
local l_Value_1 = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value;
v30 = l_Value_1 == 0 and 0.033 or l_Value_1 < 5 and 0.05 or 0.016;
local l_WaveAc_0 = v6.WaveAc;
l_Value_1 = v6.WaveBc;
local v35 = true;
local v36 = require(script.BulkWorker);
local v37 = require(script.Worker);
local l_OceanGrid_0 = v6.OceanGrid;
local v39 = 0;
local v40 = 0;
local v41 = Vector3.new(8999999488, 8999999488, 8999999488, 0);
local v42 = {};
repeat
    task.wait();
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character;
l_RunService_0.Heartbeat:Connect(function() --[[ Line: 76 ]]
    -- upvalues: v6 (copy), l_WaveAc_0 (copy), l_Value_1 (copy), l_CurrentCamera_0 (copy), l_PlaneSize_0 (copy), v13 (copy), v15 (ref), v39 (ref), v30 (ref), v28 (copy), l_SeaLevel_0 (copy), l_Planes_0 (copy), v16 (copy), v29 (copy), l_VertexGrid_0 (copy), v17 (copy), v35 (ref), v7 (copy), v36 (copy), l_OceanGrid_0 (copy), v40 (ref), v41 (ref), v42 (ref), v18 (copy), v37 (copy)
    if v6.NoRender then
        return;
    else
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        v6.ctA = l_WaveAc_0 * l_workspace_ServerTimeNow_0;
        v6.ctB = l_Value_1 * l_workspace_ServerTimeNow_0;
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local l_X_0 = l_CFrame_0.X;
        local l_Z_0 = l_CFrame_0.Z;
        local l_new_0 = Vector2.new;
        local l_l_PlaneSize_0_0 = l_PlaneSize_0;
        local v49 = math.ceil(l_X_0 / l_l_PlaneSize_0_0) * l_l_PlaneSize_0_0 - v13;
        local l_l_PlaneSize_0_1 = l_PlaneSize_0;
        l_new_0 = l_new_0(v49, math.ceil(l_Z_0 / l_l_PlaneSize_0_1) * l_l_PlaneSize_0_1 - v13);
        v49 = l_new_0 ~= v15;
        if not v49 then
            if os.clock() - v39 < v30 then
                return;
            else
                v39 = os.clock();
            end;
        else
            v39 = os.clock();
        end;
        if v49 then
            debug.profilebegin("Ocean:GridUpdate");
            local v51 = {};
            l_l_PlaneSize_0_0 = {};
            for v52 = -v28, v28 do
                for v53 = -v28, v28 do
                    local v54 = l_X_0 + v52 * l_PlaneSize_0;
                    local l_l_PlaneSize_0_2 = l_PlaneSize_0;
                    local v56 = math.ceil(v54 / l_l_PlaneSize_0_2) * l_l_PlaneSize_0_2 - v13;
                    l_l_PlaneSize_0_2 = l_Z_0 + v53 * l_PlaneSize_0;
                    local l_l_PlaneSize_0_3 = l_PlaneSize_0;
                    local v58 = math.ceil(l_l_PlaneSize_0_2 / l_l_PlaneSize_0_3) * l_l_PlaneSize_0_3 - v13;
                    v54 = CFrame.new(v56, l_SeaLevel_0, v58);
                    l_l_PlaneSize_0_2 = false;
                    for _, v60 in ipairs(l_Planes_0) do
                        local v61 = v60.CFrame:ToObjectSpace(v54);
                        local v62 = false;
                        if v61.X > v16 then
                            v62 = false;
                            if v61.X < v13 then
                                v62 = false;
                                if v61.Z > v16 then
                                    v62 = v61.Z < v13;
                                end;
                            end;
                        end;
                        if v62 then
                            l_l_PlaneSize_0_0[v60] = true;
                            l_l_PlaneSize_0_2 = true;
                            break;
                        end;
                    end;
                    if not l_l_PlaneSize_0_2 then
                        table.insert(v51, v54);
                    end;
                end;
            end;
            for _, v64 in ipairs(l_Planes_0) do
                if not l_l_PlaneSize_0_0[v64] then
                    local v65 = table.remove(v51);
                    if v65 then
                        v29[v64.Object] = v65;
                        v64.CFrame = v65;
                        v64.InverseCFrame = v65:Inverse();
                        local l_X_1 = v65.X;
                        local l_Z_1 = v65.Z;
                        v64.X = l_X_1;
                        v64.Z = l_Z_1;
                    else
                        break;
                    end;
                end;
                local l_X_2 = v64.X;
                local l_Z_2 = v64.Z;
                for _, v71 in ipairs(v64.Vertices) do
                    local v72 = l_X_2 + v71[6];
                    local v73 = l_Z_2 + v71[7];
                    l_VertexGrid_0:MoveNode(v71, v72, v73);
                    v71[1] = v72;
                    v71[2] = v73;
                end;
                for _, v75 in ipairs(v64.EdgeVertices) do
                    v75[1] = l_X_2 + v75[4];
                    v75[2] = l_Z_2 + v75[5];
                end;
            end;
            for v76, v77 in next, v29 do
                v76.CFrame = v77;
            end;
            table.clear(v29);
            v15 = l_new_0;
            debug.profileend();
        end;
        table.clear(v17);
        local l_v17_0 = v17;
        l_l_PlaneSize_0_0 = false;
        if v49 or not v35 then
            v35 = true;
            l_l_PlaneSize_0_0 = true;
            for _, v80 in ipairs(l_Planes_0) do
                task.spawn(v7.runParallel, v36, l_v17_0, v80, l_workspace_ServerTimeNow_0, v6, l_OceanGrid_0);
            end;
        else
            l_l_PlaneSize_0_1 = (l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -395)).Position;
            if os.clock() - v40 >= 0.25 or (l_l_PlaneSize_0_1 - v41).Magnitude >= 50 then
                v42 = v6.VertexGrid:RadiusSearch(l_l_PlaneSize_0_1.X, l_l_PlaneSize_0_1.Z, 400);
                v40 = os.clock();
                v41 = l_l_PlaneSize_0_1;
            end;
            local v81 = #v42;
            if v81 > 0 then
                local v82 = math.clamp(math.ceil(v81 / 30), 1, 8);
                local v83 = math.ceil(v81 / v82);
                for v84 = 1, v82 do
                    if not v18[v84] then
                        v18[v84] = table.create(v83);
                    end;
                    table.clear(v18[v84]);
                end;
                for v85, v86 in ipairs(v42) do
                    table.insert(v18[(v85 - 1) % v82 + 1], v86);
                end;
                local v87 = 0;
                for v88 = 1, v82 do
                    local v89 = v18[v88];
                    if #v89 > 0 then
                        task.spawn(v7.runParallel, v37, l_v17_0, v89, l_workspace_ServerTimeNow_0, v30, v6, v87);
                        v87 = v87 + #v89;
                    end;
                end;
            end;
        end;
        v7.waitForThreads();
        debug.profilebegin("Ocean:ApplyBones");
        for _, v91 in ipairs(l_v17_0) do
            local v92 = v91[1];
            v92.WorldPosition = v91[2];
            if l_l_PlaneSize_0_0 and v91[3] ~= nil then
                local l_v92_Attribute_0 = v92:GetAttribute("noRender");
                if v91[3] == false and l_v92_Attribute_0 ~= true then
                    v92:SetAttribute("noRender", true);
                elseif v91[3] == true and l_v92_Attribute_0 ~= nil then
                    v92:SetAttribute("noRender", nil);
                end;
            end;
        end;
        debug.profileend();
        return;
    end;
end);
script.Parent.Parent.OceanReady:Fire();