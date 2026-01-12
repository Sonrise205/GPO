local l_TweenService_0 = game:GetService("TweenService");
local v1 = {};
local function v11(v2) --[[ Line: 4 ]] --[[ Name: createRock ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Position_0 = v2.Position;
    local l_Velocity_0 = v2.Velocity;
    local l_customModel_0 = v2.customModel;
    local l_AngularVelocity_0 = v2.AngularVelocity;
    local l_Size_0 = v2.Size;
    local l_Material_0 = v2.Material;
    local _ = v2.Color;
    local v10 = nil;
    v10 = if l_customModel_0 == nil then Instance.new("Part") else l_customModel_0:Clone();
    if v2.TargetPart == nil then
        v10.Material = l_Material_0;
        v10.Color = v2.Color;
    else
        _G.matchMaterial(v10, v2.TargetPart);
    end;
    v10.Size = l_Size_0;
    v10.CFrame = CFrame.new(l_Position_0) * CFrame.Angles(math.rad((math.random(0, 360))), math.rad((math.random(0, 360))), (math.rad((math.random(0, 360)))));
    v10.CollisionGroup = "Players";
    v10.Massless = true;
    v10.Parent = workspace.Effects;
    v10.AssemblyLinearVelocity = l_Velocity_0;
    v10.AssemblyAngularVelocity = l_AngularVelocity_0;
    task.delay(v2.Duration or math.random(200, 400) / 100, function() --[[ Line: 36 ]]
        -- upvalues: v10 (ref), l_TweenService_0 (ref)
        _G.particleEnabled(v10, false, nil, {
            PointLight = true
        });
        l_TweenService_0:Create(v10, TweenInfo.new(1), {
            Size = Vector3.new(0, 0, 0, 0)
        }):Play();
        _G.destroy(v10, 1);
    end);
    return v10;
end;
v1.start = function(_, ...) --[[ Line: 51 ]] --[[ Name: start ]]
    -- upvalues: v11 (copy)
    v11(...);
end;
return v1;