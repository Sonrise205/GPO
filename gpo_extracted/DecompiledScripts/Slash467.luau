local l_TweenService_0 = game:GetService("TweenService");
local l_Effects_0 = workspace:WaitForChild("Effects");
local _ = workspace.CurrentCamera;
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
return function(v4) --[[ Line: 7 ]]
    -- upvalues: l_Fishman_0 (copy), l_Effects_0 (copy), l_TweenService_0 (copy)
    v4 = v4 or {};
    local v5 = v4.CFrame or CFrame.new();
    local v6 = v4.AngleOffset or CFrame.Angles(0, 0, 0);
    v5 = v5 * v6;
    local v7 = v4.Scale or 1;
    if _G.checkRenderDistance(v5.p) == false then
        return;
    else
        local v8 = v4.Duration or 1;
        local v9 = v4.Color or Color3.new(1, 1, 1);
        local v10 = v4.Offset or Vector3.new();
        local l_YInfluence_0 = v4.YInfluence;
        local v12 = l_Fishman_0.Assets.Wind:Clone();
        local l_Size_0 = v12.Size;
        l_Size_0 = Vector3.new(l_Size_0.X, l_YInfluence_0 or l_Size_0.Y, l_Size_0.Z);
        v12.Size = Vector3.new();
        v12.Color = Color3.new(v9.r, v9.g, v9.b);
        v12.CFrame = v5;
        v12.Parent = l_Effects_0;
        local _ = TweenInfo.new(v8, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
        local _ = TweenInfo.new(v8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v16 = TweenInfo.new(v8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        local v17 = l_TweenService_0:Create(v12, v16, {
            Size = l_Size_0 * v7, 
            Transparency = 1, 
            Color = Color3.new(1, 1, 1), 
            CFrame = v5 * CFrame.new(v10) * CFrame.Angles(0, 3.141592653589793, 0) * v6
        });
        v17.Completed:Connect(function() --[[ Line: 46 ]]
            -- upvalues: v12 (copy)
            v12:Destroy();
        end);
        v17:Play();
        return;
    end;
end;