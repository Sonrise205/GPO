local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local v3 = require(l_Modules_0.OceanModule);
local v4 = require(l_Modules_0.DataStructures.CuboidGrid);
local v5 = require(l_Modules_0.DataStructures.Cuboid);
local v6 = v4.new(150);
local _ = l_ReplicatedStorage_0.Assets.StreamingObjects;
local function _(v8) --[[ Line: 15 ]] --[[ Name: AddNoWaterRegion ]]
    -- upvalues: v6 (copy), v5 (copy)
    local l_CFrame_0 = v8.CFrame;
    local l_Scale_0 = v8:FindFirstChild("Scale");
    local v11 = v8.Size * (l_Scale_0 and l_Scale_0.Scale or 1) * 0.5;
    local v12 = Vector3.new(v11.X, v11.Y, v11.Z);
    local v13 = l_CFrame_0 * v12;
    local v14 = l_CFrame_0 * -v12;
    v6:FillCuboid(v5.new(v13, v14), "NoWaterRegion");
end;
local v16 = nil;
local l_OceanMeshes_0 = v3.OceanMeshes;
local function _(v18) --[[ Line: 41 ]] --[[ Name: ToggleOcean ]]
    -- upvalues: v16 (ref), v3 (copy), l_OceanMeshes_0 (copy)
    if v16 ~= v18 then
        v16 = v18;
        v3.NoRender = not v18;
        l_OceanMeshes_0.Parent = v18 and workspace.Ocean or nil;
    end;
end;
local l_CurrentCamera_0 = workspace.CurrentCamera;
l_RunService_0.Heartbeat:Connect(function() --[[ Line: 51 ]]
    -- upvalues: l_CurrentCamera_0 (copy), v3 (copy), v16 (ref), l_OceanMeshes_0 (copy), v6 (copy)
    debug.profilebegin("OceanRender");
    local l_CFrame_1 = l_CurrentCamera_0.CFrame;
    if v3.NoOceanRegion then
        if v16 ~= false then
            v16 = false;
            v3.NoRender = true;
            l_OceanMeshes_0.Parent = nil;
        end;
    else
        local v22 = v6:GetPointData(l_CFrame_1.X, l_CFrame_1.Y, l_CFrame_1.Z) == nil;
        if v16 ~= v22 then
            v16 = v22;
            v3.NoRender = not v22;
            l_OceanMeshes_0.Parent = v22 and workspace.Ocean or nil;
        end;
    end;
    debug.profileend();
end);