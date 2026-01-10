local v0 = {};
local _ = game:GetService("PhysicsService");
v0.start = function(_, v3) --[[ Line: 5 ]] --[[ Name: start ]]
    local l_rep_0 = v3.rep;
    local l_max_0 = v3.max;
    local l_min_0 = v3.min;
    local l_cf_0 = v3.cf;
    local l_vel_0 = v3.vel;
    local l_color_0 = v3.color;
    local l_material_0 = v3.material;
    local l_normal_0 = v3.normal;
    if l_normal_0 == nil then
        l_normal_0 = l_cf_0;
    end;
    if l_cf_0 and _G.checkRenderDistance(l_cf_0.p) == false then
        return;
    else
        local v12, _, v14 = unpack(l_vel_0);
        for _ = 1, l_rep_0 do
            local v16 = script["Rock" .. math.random(1, 3)]:Clone();
            local v17 = math.random(l_min_0 * 100, l_max_0 * 100) / 100;
            l_cf_0 = CFrame.new(l_cf_0.Position);
            v16.CFrame = l_cf_0 * CFrame.new(0, v17 * 2, 0) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
            v16.Massless = true;
            if l_normal_0 then
                v16.CFrame = CFrame.new(l_cf_0.p, l_cf_0.p + l_normal_0) * CFrame.new(0, v17 * 2, 0);
            end;
            v16.Velocity = v16.CFrame.lookVector * 100 + Vector3.new(math.random(-v12, v12), 0, math.random(-v14, v14));
            v16.RotVelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5));
            v16.Size = Vector3.new(v17, v17, v17);
            if l_color_0 then
                v16.Color = l_color_0;
            end;
            if l_material_0 then
                v16.Material = l_material_0;
            end;
            local v18 = script.treesmoke:Clone();
            v18.Parent = v16;
            v18.Size = NumberSequence.new(v16.Size.Magnitude / 2);
            v18.Color = ColorSequence.new(v16.Color);
            v16.Parent = workspace.Effects;
            _G.destroy(v16, 30);
            _G.setCollisionGroup(v16, "Ragdolls");
            task.spawn(function() --[[ Line: 52 ]]
                -- upvalues: v16 (copy), v18 (copy)
                task.wait(0.1);
                local v19 = nil;
                v19 = v16.Touched:Connect(function(v20) --[[ Line: 55 ]]
                    -- upvalues: v18 (ref), v16 (ref), v19 (ref)
                    if v20:IsDescendantOf(workspace.Effects) == false and v20:IsDescendantOf(workspace.PlayerCharacters) == false and v20:IsDescendantOf(workspace.CurrentCamera) == false then
                        v18:Emit(25);
                        v16.CastShadow = false;
                        v16.Anchored = true;
                        v19:disconnect();
                        v19 = nil;
                        v16.Transparency = 1;
                        _G.destroy(v16, 4);
                    end;
                end);
            end);
        end;
        return;
    end;
end;
return v0;