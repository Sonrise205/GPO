local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Effects_0 = workspace.Effects;
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v11 = Random.new();
local v12 = require(l_ReplicatedStorage_0.Modules.ObjectCache);
local v15 = v12.new(script.Rock, 100, l_Effects_0, {
    ReturnFunction = function(v13) --[[ Line: 10 ]] --[[ Name: ReturnFunction ]]
        local l_Trail_0 = v13:FindFirstChild("Trail");
        if l_Trail_0 then
            l_Trail_0:Clear();
            l_Trail_0.Enabled = false;
        end;
    end
});
local v16 = v12.new(script.Dust, 50, l_Effects_0);
local v17 = RaycastParams.new();
v17.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
v17.FilterType = Enum.RaycastFilterType.Include;
local function v20(v18, v19) --[[ Line: 25 ]] --[[ Name: Raycast ]]
    -- upvalues: v17 (copy)
    return workspace:Raycast(v18, v19, v17);
end;
CreateRock = function(v21) --[[ Line: 29 ]] --[[ Name: CreateRock ]]
    -- upvalues: v15 (copy), v11 (copy), v17 (copy), v20 (copy), v16 (copy), l_TweenService_0 (copy)
    local l_Position_0 = v21.Position;
    local l_Velocity_0 = v21.Velocity;
    local v24 = v21.AngularVelocity or Vector3.new(math.random(-3, 3), math.random(-3, 3), math.random(-3, 3));
    local l_Color_0 = v21.Color;
    local l_Size_0 = v21.Size;
    local l_Material_0 = v21.Material;
    local v28 = v21.Duration or 3;
    local v29 = 4;
    local l_v15_Part_0 = v15:GetPart(CFrame.Angles(6.283185307179586 * math.random(), 6.283185307179586 * math.random(), 6.283185307179586 * math.random()) + l_Position_0);
    l_v15_Part_0.Transparency = 0;
    l_v15_Part_0.CanCollide = true;
    l_v15_Part_0.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
    l_v15_Part_0.AssemblyAngularVelocity = Vector3.new(0, 0, 0, 0);
    l_v15_Part_0.Material = l_Material_0;
    l_v15_Part_0.Size = l_Size_0;
    l_v15_Part_0.Massless = true;
    _G.matchMaterial(l_v15_Part_0, v21.HitPart);
    if l_v15_Part_0:FindFirstChild("Att1") then
        l_v15_Part_0.Att1.Position = Vector3.new(l_Size_0.Magnitude / 2, 0, 0);
        l_v15_Part_0.Att2.Position = -Vector3.new(l_Size_0.Magnitude / 2, 0, 0);
    end;
    local v31 = 15;
    l_v15_Part_0.Color = l_Color_0;
    l_v15_Part_0.Massless = true;
    l_v15_Part_0.CollisionGroup = "Players";
    local l_Trail_1 = l_v15_Part_0:FindFirstChild("Trail");
    if l_Trail_1 then
        l_Trail_1.Enabled = v21.TrailEnabled;
        l_Trail_1.Color = ColorSequence.new(l_Color_0);
    end;
    l_v15_Part_0.AssemblyLinearVelocity = l_Velocity_0;
    l_v15_Part_0.AssemblyAngularVelocity = v24;
    l_v15_Part_0.Anchored = false;
    if v21.customFunction then
        task.spawn(v21.customFunction, l_v15_Part_0);
    end;
    local v33 = os.clock();
    local v34 = nil;
    task.delay(0.1, function() --[[ Line: 91 ]]
        -- upvalues: v21 (copy), v34 (ref), l_v15_Part_0 (copy), v33 (ref), v29 (ref), v11 (ref), v31 (ref), v17 (ref), v20 (ref), v16 (ref), l_Trail_1 (copy), l_Velocity_0 (copy)
        if v21.Extra == nil then
            return;
        else
            v34 = l_v15_Part_0.Touched:Connect(function(_) --[[ Line: 95 ]]
                -- upvalues: v33 (ref), v29 (ref), l_v15_Part_0 (ref), v34 (ref), v11 (ref), v31 (ref), v17 (ref), v20 (ref), v16 (ref), l_Trail_1 (ref), v21 (ref), l_Velocity_0 (ref)
                if os.clock() - v33 < 0.1 then
                    return;
                else
                    v33 = os.clock();
                    v29 = v29 - 1;
                    if v29 <= 0 or l_v15_Part_0.Size.Magnitude <= 2 then
                        v34:Disconnect();
                        v34 = nil;
                        return;
                    else
                        l_v15_Part_0.AssemblyLinearVelocity = (l_v15_Part_0.AssemblyLinearVelocity + v11:NextUnitVector() * Vector3.new(1, 0, 1, 0)).Unit * l_v15_Part_0.AssemblyLinearVelocity.Magnitude;
                        v31 = v31 / 3;
                        l_v15_Part_0.CustomPhysicalProperties = PhysicalProperties.new(0.3, 0.1, 1, 1, v31);
                        local v36 = {};
                        local l_Position_1 = l_v15_Part_0.Position;
                        local v38 = l_v15_Part_0.CFrame.LookVector * (l_v15_Part_0.Size.Z + 1);
                        local v39 = workspace:Raycast(l_Position_1, v38, v17);
                        v38 = l_v15_Part_0.Position;
                        local v40 = l_v15_Part_0.CFrame.LookVector * -(l_v15_Part_0.Size.Z + 1);
                        l_Position_1 = workspace:Raycast(v38, v40, v17);
                        v40 = l_v15_Part_0.Position;
                        local v41 = l_v15_Part_0.CFrame.RightVector * (l_v15_Part_0.Size.X + 1);
                        v38 = workspace:Raycast(v40, v41, v17);
                        v41 = l_v15_Part_0.Position;
                        local v42 = l_v15_Part_0.CFrame.RightVector * -(l_v15_Part_0.Size.X + 1);
                        v40 = workspace:Raycast(v41, v42, v17);
                        v42 = l_v15_Part_0.Position;
                        local v43 = l_v15_Part_0.CFrame.UpVector * (l_v15_Part_0.Size.Y + 1);
                        v41 = workspace:Raycast(v42, v43, v17);
                        v6(v36, 1, v39, l_Position_1, v38, v40, v41, v20(l_v15_Part_0.Position, l_v15_Part_0.CFrame.UpVector * -(l_v15_Part_0.Size.Y + 1)));
                        for _, v45 in v36 do
                            if v45 then
                                v42 = v16:GetPart(CFrame.new(v45.Position, v45.Position + v45.Normal) * CFrame.Angles(1.5707963267948966, 0, 0));
                                v42.Transparency = 1;
                                v42.CanCollide = false;
                                v42.Anchored = true;
                                for _, v47 in v42:GetDescendants() do
                                    if v47:IsA("ParticleEmitter") then
                                        v47.Color = ColorSequence.new(v45.Instance.Color);
                                    end;
                                end;
                                v42:ScaleTo(l_v15_Part_0.Size.Magnitude);
                                l_v15_Part_0.Trail.Enabled = false;
                                _G.customEmit(v42);
                                task.delay(2, function() --[[ Line: 146 ]]
                                    -- upvalues: v42 (copy), l_Trail_1 (ref), v16 (ref)
                                    v42:ScaleTo(1);
                                    if l_Trail_1 then
                                        l_Trail_1.Enabled = false;
                                    end;
                                    v16:ReturnPart(v42);
                                end);
                                if v21.Extra then
                                    _G.PlayEffect("RockDebris", nil, {
                                        PartCount = 1, 
                                        RandomVelocityMagnitude = Vector2.new(-25, 25), 
                                        Position = v45.Position + Vector3.new(0, 1, 0, 0), 
                                        Direction = l_Velocity_0, 
                                        RaycastDirection = Vector3.new(0, -5, 0, 0), 
                                        Size = l_v15_Part_0.Size / 4
                                    }, true);
                                    return;
                                else
                                    break;
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
            end);
            return;
        end;
    end);
    task.delay(v28 * (math.random(90, 110) / 100), function() --[[ Line: 174 ]]
        -- upvalues: v34 (ref), l_Trail_1 (copy), l_TweenService_0 (ref), l_v15_Part_0 (copy), v15 (ref)
        if v34 then
            v34:Disconnect();
            v34 = nil;
        end;
        if l_Trail_1 then
            l_Trail_1.Enabled = false;
        end;
        l_TweenService_0:Create(l_v15_Part_0, TweenInfo.new(1), {
            Size = Vector3.new(0, 0, 0, 0)
        }):Play();
        task.wait(1);
        l_v15_Part_0.Anchored = true;
        if l_Trail_1 then
            l_Trail_1.Enabled = false;
        end;
        v15:ReturnPart(l_v15_Part_0);
    end);
end;
return {
    start = function(_, v49, v50) --[[ Line: 203 ]] --[[ Name: start ]]
        -- upvalues: v17 (copy), v11 (copy)
        if _G.checkRenderDistance(v49.Position) == false then
            return;
        else
            local v51 = v49.Position - v49.RaycastDirection.Unit;
            local v52 = v49.RaycastDirection or Vector3.new(0, -25, 0, 0);
            local v53 = workspace:Raycast(v51, v52, v17);
            if not v53 then
                return;
            elseif v53.Instance == nil then
                return;
            else
                v49.PartCount = _G.ScaleWithBaseFPS(v49.PartCount);
                for _ = 1, v49.PartCount do
                    local v55 = v11:NextNumber(-(v49.RandomVelocityMagnitude.X or 25), v49.RandomVelocityMagnitude.Y or 25);
                    CreateRock({
                        Velocity = v49.Direction + v11:NextUnitVector() * Vector3.new(v55, math.abs(v55), v55), 
                        Position = v49.Position, 
                        Duration = v49.Duration, 
                        Color = v49.Color or v53.Instance.Color, 
                        Material = v49.Material or v53.Material, 
                        Size = v49.Size * Vector3.new(v11:NextNumber(0.85, math.random(3) ~= 1 and 1.25 or 1.5), v11:NextNumber(0.85, math.random(3) ~= 1 and 1.25 or 1.5), v11:NextNumber(0.85, math.random(3) ~= 1 and 1.25 or 1.5)), 
                        customFunction = v49.customFunction, 
                        TrailEnabled = v49.TrailEnabled, 
                        HitPart = v53.Instance, 
                        Extra = v50
                    });
                end;
                return;
            end;
        end;
    end
};