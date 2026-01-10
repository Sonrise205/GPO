--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Modules.OceanModule);
local _ = l_ReplicatedStorage_0.Assets.ClientFX:WaitForChild("Wave4", 3);
local v4 = l_ReplicatedStorage_0.Assets.ClientFX:WaitForChild("FarPlane", 3);
local l_PlaneSize_0 = v2.PlaneSize;
local l_NumPlaneRows_0 = v2.NumPlaneRows;
local l_SeaLevel_0 = v2.SeaLevel;
local v8 = l_PlaneSize_0 * 0.5;
local v27 = (function() --[[ Line: 17 ]] --[[ Name: InitFarPlanes ]]
    -- upvalues: l_NumPlaneRows_0 (copy), l_PlaneSize_0 (copy), v4 (copy), v2 (copy), l_SeaLevel_0 (copy)
    local v9 = Vector3.new(l_NumPlaneRows_0 * l_PlaneSize_0 + l_PlaneSize_0, 0, l_NumPlaneRows_0 * l_PlaneSize_0 + l_PlaneSize_0);
    local v10 = v4:Clone();
    v10.Size = v9;
    local v11 = {};
    local v12 = {};
    local function _(v13) --[[ Line: 45 ]] --[[ Name: Add ]]
        -- upvalues: v10 (copy), v2 (ref), v11 (copy), v9 (copy), v12 (copy)
        local v14 = v10:Clone();
        v14.Parent = v2.OceanMeshes.farPlaneMeshs;
        v11[v9 * v13] = v14;
        table.insert(v12, v14);
    end;
    for v16 = -1, 1, 2 do
        local v17 = Vector3.new(v16, 1, 0);
        local v18 = v10:Clone();
        v18.Parent = v2.OceanMeshes.farPlaneMeshs;
        v11[v9 * v17] = v18;
        table.insert(v12, v18);
        v17 = Vector3.new(-1, 1, v16);
        v18 = v10:Clone();
        v18.Parent = v2.OceanMeshes.farPlaneMeshs;
        v11[v9 * v17] = v18;
        table.insert(v12, v18);
        v17 = Vector3.new(0, 1, v16);
        v18 = v10:Clone();
        v18.Parent = v2.OceanMeshes.farPlaneMeshs;
        v11[v9 * v17] = v18;
        table.insert(v12, v18);
        v17 = Vector3.new(1, 1, v16);
        v18 = v10:Clone();
        v18.Parent = v2.OceanMeshes.farPlaneMeshs;
        v11[v9 * v17] = v18;
        table.insert(v12, v18);
    end;
    local function v21() --[[ Line: 60 ]] --[[ Name: updateTransparency ]]
        -- upvalues: v12 (copy)
        local l_Attribute_0 = workspace.Terrain:GetAttribute("OceanTransparency");
        for v20 = 1, #v12 do
            v12[v20].Transparency = l_Attribute_0;
        end;
    end;
    local l_Attribute_1 = workspace.Terrain:GetAttribute("OceanTransparency");
    for v23 = 1, #v12 do
        v12[v23].Transparency = l_Attribute_1;
    end;
    workspace.Terrain:GetAttributeChangedSignal("OceanTransparency"):Connect(v21);
    return function(v24) --[[ Line: 71 ]]
        -- upvalues: l_SeaLevel_0 (ref), v11 (copy), v12 (copy)
        v24 = CFrame.new(v24.X, l_SeaLevel_0, v24.Y);
        local v25 = {};
        for v26 in next, v11 do
            table.insert(v25, v24 + v26);
        end;
        workspace:BulkMoveTo(v12, v25, Enum.BulkMoveMode.FireCFrameChanged);
    end;
end)();
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v29 = CFrame.Angles(0, 1.5707963267948966, 0);
local v30 = l_CurrentCamera_0.CFrame * v29;
local l_X_0 = v30.X;
local l_Z_0 = v30.Z;
local v33 = Vector2.new(9000000000, 9000000000);
local function _(v34, v35) --[[ Line: 91 ]] --[[ Name: CeilToMult ]]
    return math.ceil(v34 / v35) * v35;
end;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 95 ]]
    -- upvalues: v2 (copy), l_CurrentCamera_0 (copy), v30 (ref), v29 (copy), l_X_0 (ref), l_Z_0 (ref), l_PlaneSize_0 (copy), v8 (copy), v33 (ref), v27 (copy)
    debug.profilebegin("Far Ocean update [Client]");
    if v2.NoRender then
        debug.profileend();
        return;
    else
        v30 = l_CurrentCamera_0.CFrame * v29;
        local l_X_1 = v30.X;
        local l_Z_1 = v30.Z;
        l_X_0 = l_X_1;
        l_Z_0 = l_Z_1;
        l_X_1 = Vector2.new;
        local l_l_X_0_0 = l_X_0;
        local l_l_PlaneSize_0_0 = l_PlaneSize_0;
        l_Z_1 = math.ceil(l_l_X_0_0 / l_l_PlaneSize_0_0) * l_l_PlaneSize_0_0 - v8;
        l_l_PlaneSize_0_0 = l_Z_0;
        local l_l_PlaneSize_0_1 = l_PlaneSize_0;
        l_X_1 = l_X_1(l_Z_1, math.ceil(l_l_PlaneSize_0_0 / l_l_PlaneSize_0_1) * l_l_PlaneSize_0_1 - v8);
        if l_X_1 ~= v33 then
            v33 = l_X_1;
            v27(l_X_1);
        end;
        debug.profileend();
        return;
    end;
end);