local _ = game:GetService("RunService");
local l_Effects_0 = workspace:WaitForChild("Effects");
local l_Sphere_0 = game:GetService("ReplicatedStorage").Refrences:WaitForChild("Phoenix").Assets.Sphere;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_TweenService_0 = game:GetService("TweenService");
return function(v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 10 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_Sphere_0 (copy), l_Effects_0 (copy), l_TweenService_0 (copy)
    local v13 = v5 or CFrame.new();
    local v14 = v6 or Color3.new(1, 1, 1);
    local v15 = v7 or 10;
    local v16 = v8 or 6;
    local v17 = v9 or 1;
    local v18 = v10 or 1;
    local v19 = v11 or 0.5;
    local v20 = v12 or 0.5;
    local function _(v21, v22) --[[ Line: 20 ]] --[[ Name: CanRender ]]
        -- upvalues: l_CurrentCamera_0 (ref), v15 (copy)
        local v23 = v21 or Vector3.new();
        local v24 = v22 or 7;
        return (l_CurrentCamera_0.CFrame.p - v23).Magnitude < v24 * 5 + v15 * v24;
    end;
    local v26 = v13.p or Vector3.new();
    if not ((l_CurrentCamera_0.CFrame.p - v26).Magnitude < 35 + v15 * 7) then
        return;
    else
        for _ = 1, v16 do
            local v28 = l_Sphere_0:Clone();
            v28.Color = v14;
            local v29 = v13 * CFrame.new(math.random(-v15, v15), math.random(-v15, v15), math.random(-v15, v15));
            v28.CFrame = CFrame.new(v13.p, v29.p) * CFrame.Angles(1.5707963267948966, 0, 0);
            local v30 = math.random(v17, v18);
            local l_magnitude_0 = (v29.p - v13.p).magnitude;
            v28.Parent = l_Effects_0;
            local v32 = TweenInfo.new(v19, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            local v33 = l_TweenService_0:Create(v28, v32, {
                CFrame = CFrame.new(v29.p, v13.p) * CFrame.Angles(-1.5707963267948966, 0, 0), 
                Size = Vector3.new(0, 1, 0, 0)
            });
            local v34 = l_TweenService_0:Create(v28.Mesh, v32, {
                Scale = Vector3.new(v30, l_magnitude_0, v30), 
                Offset = Vector3.new(0, -l_magnitude_0 / 2, 0)
            });
            v34.Completed:Connect(function() --[[ Line: 50 ]]
                -- upvalues: v20 (copy), l_TweenService_0 (ref), v28 (copy), l_magnitude_0 (copy)
                local v35 = TweenInfo.new(v20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v36 = l_TweenService_0:Create(v28.Mesh, v35, {
                    Scale = Vector3.new(0, 0, 0, 0), 
                    Offset = Vector3.new(0, -l_magnitude_0, 0)
                });
                v36.Completed:Connect(function() --[[ Line: 56 ]]
                    -- upvalues: v28 (ref)
                    v28:Destroy();
                end);
                v36:Play();
            end);
            v33:Play();
            v34:Play();
            _G.destroy(v28, v19 + v20 + 0.5);
        end;
        return;
    end;
end;