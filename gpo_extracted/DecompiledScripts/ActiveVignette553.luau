local l_Physics_0 = require(script:WaitForChild("Physics"));
local function _() --[[ Line: 5 ]] --[[ Name: getHorizontalFov ]]
    local l_FieldOfView_0 = game.Workspace.CurrentCamera.FieldOfView;
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    local v3 = l_ViewportSize_0.X / l_ViewportSize_0.Y;
    return (math.deg(math.atan(math.tan(math.rad(l_FieldOfView_0) * 0.5) * v3) * 2));
end;
local function v19(v5) --[[ Line: 14 ]] --[[ Name: createViewModel ]]
    -- upvalues: l_Physics_0 (copy)
    local v6 = {};
    local l_FieldOfView_1 = game.Workspace.CurrentCamera.FieldOfView;
    local l_FieldOfView_2 = game.Workspace.CurrentCamera.FieldOfView;
    local l_ViewportSize_1 = game.Workspace.CurrentCamera.ViewportSize;
    local v10 = l_ViewportSize_1.X / l_ViewportSize_1.Y;
    local v11 = l_FieldOfView_1 + (math.deg(math.atan(math.tan(math.rad(l_FieldOfView_2) * 0.5) * v10) * 2) - l_FieldOfView_1) / 1.65;
    l_FieldOfView_2 = {
        topLeft = CFrame.new() * CFrame.Angles(math.rad(l_FieldOfView_1 / 2), math.rad(v11 / 2), 0) * CFrame.new(0, 0, -5), 
        topRight = CFrame.new() * CFrame.Angles(math.rad(l_FieldOfView_1 / 2), -math.rad(v11 / 2), 0) * CFrame.new(0, 0, -5), 
        bottomLeft = CFrame.new() * CFrame.Angles(-math.rad(l_FieldOfView_1 / 2), math.rad(v11 / 2), 0) * CFrame.new(0, 0, -5), 
        bottomRight = CFrame.new() * CFrame.Angles(-math.rad(l_FieldOfView_1 / 2), -math.rad(v11 / 2), 0) * CFrame.new(0, 0, -5)
    };
    l_ViewportSize_1 = (l_FieldOfView_2.topLeft.Position - l_FieldOfView_2.topRight.Position).magnitude;
    v10 = (l_FieldOfView_2.topLeft.Position - l_FieldOfView_2.bottomLeft.Position).magnitude;
    v6.sides = {
        Top = {
            Size = Vector3.new(0.2, 0.2, l_ViewportSize_1), 
            Corners = {
                "topLeft", 
                "topRight"
            }
        }, 
        Bottom = {
            Size = Vector3.new(0.2, 0.2, l_ViewportSize_1), 
            Corners = {
                "bottomRight", 
                "bottomLeft"
            }
        }, 
        Right = {
            Size = Vector3.new(0.2, 0.2, v10), 
            Corners = {
                "topRight", 
                "bottomRight"
            }
        }, 
        Left = {
            Size = Vector3.new(0.2, 0.2, v10), 
            Corners = {
                "topLeft", 
                "bottomLeft"
            }
        }
    };
    v6.sideInstances = {};
    v6.corePart = Instance.new("Part");
    v6.corePart.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
    v6.corePart.Transparency = 1;
    v6.corePart.CanCollide = false;
    v6.corePart.CanQuery = false;
    v6.corePart.Parent = game.Workspace.Effects;
    v6.Connection = game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 64 ]] --[[ Name: updateCorePart ]]
        -- upvalues: v6 (copy)
        v6.corePart.CFrame = game.Workspace.CurrentCamera.CFrame;
    end);
    for v12, v13 in next, v6.sides do
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Anchored = false;
        l_Part_0.Size = v13.Size;
        l_Part_0.Transparency = 1;
        l_Part_0.CanQuery = false;
        l_Part_0.Parent = game.Workspace.Effects;
        l_Part_0.CanCollide = false;
        local v15 = CFrame.new(l_FieldOfView_2[v13.Corners[1]].Position, l_FieldOfView_2[v13.Corners[2]].Position) * CFrame.new(0, 0, -v13.Size.Z / 2);
        local v16 = l_Physics_0.joint.new(l_Part_0, v6.corePart, CFrame.new(), v15);
        v6.sideInstances[v12] = {
            Object = l_Part_0, 
            Joint = v16
        };
        for _, v18 in v5 do
            v18:Clone().Parent = l_Part_0;
        end;
    end;
    return v6;
end;
local function v30(v20, v21) --[[ Line: 98 ]] --[[ Name: adjustViewModel ]]
    local l_FieldOfView_3 = game.Workspace.CurrentCamera.FieldOfView;
    local l_FieldOfView_4 = game.Workspace.CurrentCamera.FieldOfView;
    local l_ViewportSize_2 = game.Workspace.CurrentCamera.ViewportSize;
    local v25 = l_ViewportSize_2.X / l_ViewportSize_2.Y;
    local v26 = l_FieldOfView_3 + (math.deg(math.atan(math.tan(math.rad(l_FieldOfView_4) * 0.5) * v25) * 2) - l_FieldOfView_3) / 1.65;
    l_FieldOfView_4 = {
        topLeft = CFrame.new() * CFrame.Angles(math.rad(l_FieldOfView_3 / 2), math.rad(v26 / 2), 0) * CFrame.new(0, 0, -v21), 
        topRight = CFrame.new() * CFrame.Angles(math.rad(l_FieldOfView_3 / 2), -math.rad(v26 / 2), 0) * CFrame.new(0, 0, -v21), 
        bottomLeft = CFrame.new() * CFrame.Angles(-math.rad(l_FieldOfView_3 / 2), math.rad(v26 / 2), 0) * CFrame.new(0, 0, -v21), 
        bottomRight = CFrame.new() * CFrame.Angles(-math.rad(l_FieldOfView_3 / 2), -math.rad(v26 / 2), 0) * CFrame.new(0, 0, -v21)
    };
    l_ViewportSize_2 = (l_FieldOfView_4.topLeft.Position - l_FieldOfView_4.topRight.Position).magnitude;
    v25 = (l_FieldOfView_4.topLeft.Position - l_FieldOfView_4.bottomLeft.Position).magnitude;
    v20.sides.Top.Size = Vector3.new(0.2, 0.2, l_ViewportSize_2);
    v20.sides.Bottom.Size = Vector3.new(0.2, 0.2, l_ViewportSize_2);
    v20.sides.Right.Size = Vector3.new(0.2, 0.2, v25);
    v20.sides.Left.Size = Vector3.new(0.2, 0.2, v25);
    for v27, v28 in next, v20.sides do
        local v29 = CFrame.new(l_FieldOfView_4[v28.Corners[1]].Position, l_FieldOfView_4[v28.Corners[2]].Position) * CFrame.new(0, 0, -v28.Size.Z / 2);
        v20.sideInstances[v27].Object.Velocity = Vector3.new();
        v20.sideInstances[v27].Joint.C1 = v29;
    end;
end;
local v31 = {};
local v32 = {};
v32.new = function(v33) --[[ Line: 136 ]] --[[ Name: new ]]
    -- upvalues: v32 (copy)
    local v34 = setmetatable({}, {
        __index = v32
    });
    v34.viewmodel = v33;
    v34.effects = {};
    v34.enabled = true;
    v34.distance = 5;
    v34.updating = false;
    v34.updateConnections = {
        viewport = nil, 
        fov = nil
    };
    for _, v36 in next, v33.sideInstances do
        for _, v38 in (v36.Object:GetChildren()) do
            table.insert(v34.effects, v38);
        end;
    end;
    return v34;
end;
v32.Enabled = function(v39, v40) --[[ Line: 159 ]] --[[ Name: Enabled ]]
    v39.enabled = v40;
    for _, v42 in v39.effects do
        v42.Enabled = v39.enabled;
    end;
end;
v32.SetDistance = function(v43, v44) --[[ Line: 167 ]] --[[ Name: SetDistance ]]
    -- upvalues: v30 (copy)
    v30(v43.viewmodel, v44);
    v43.distance = v44;
end;
v32.UpdateEnabled = function(v45, v46) --[[ Line: 172 ]] --[[ Name: UpdateEnabled ]]
    -- upvalues: v30 (copy)
    v45.updating = v46;
    if v45.updating then
        v45.updateConnections.viewport = game.Workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(function() --[[ Line: 175 ]]
            -- upvalues: v30 (ref), v45 (copy)
            v30(v45.viewmodel, v45.distance);
        end);
        v45.updateConnections.fov = game.Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 179 ]]
            -- upvalues: v30 (ref), v45 (copy)
            v30(v45.viewmodel, v45.distance);
        end);
        return;
    else
        if v45.updateConnections.fov then
            v45.updateConnections.fov:Disconnect();
        end;
        if v45.upateConnections.viewport then
            v45.updateConnections.viewport:Disconnect();
        end;
        return;
    end;
end;
v32.Destroy = function(v47) --[[ Line: 192 ]] --[[ Name: Destroy ]]
    for _, v49 in next, v47.viewmodel.sideInstances do
        v49.Object:Destroy();
    end;
    v47.viewmodel.Connection:Disconnect();
    v47.viewmodel.corePart:Destroy();
end;
v31.CreateVignette = function(_, v51) --[[ Line: 200 ]] --[[ Name: CreateVignette ]]
    -- upvalues: v19 (copy), v32 (copy)
    assert(typeof(v51) == "table", "CreateVignette only accepts a table of 'ParticleEmitter' objects!");
    for _, v53 in v51 do
        assert(typeof(v53) == "Instance", "All objects provided must be an instance 'ParticleEmitter'! You provided a " .. typeof(v53));
        assert(v53:IsA("ParticleEmitter"), "All objects provided must be an instance 'ParticleEmitter'! You provided a " .. v53.ClassName);
    end;
    local v54 = v19(v51);
    return (v32.new(v54));
end;
return v31;