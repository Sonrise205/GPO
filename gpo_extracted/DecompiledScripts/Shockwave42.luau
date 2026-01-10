local l_TweenService_0 = game:GetService("TweenService");
local l_Effects_0 = workspace:WaitForChild("Effects");
local _ = workspace.CurrentCamera;
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
return function(v4) --[[ Line: 7 ]]
    -- upvalues: l_Fishman_0 (copy), l_Effects_0 (copy), l_TweenService_0 (copy)
    v4 = v4 or {};
    local v5 = (v4.CFrame or CFrame.new()) * (v4.AngleOffset or CFrame.new());
    if _G.checkRenderDistance(v5.p) == false then
        return;
    else
        local v6 = v4.Scale or 1;
        local v7 = v4.Duration or 1;
        local v8 = v4.Color or Color3.new(1, 1, 1);
        local v9 = v4.Offset or Vector3.new();
        local l_YInfluence_0 = v4.YInfluence;
        local v11 = l_Fishman_0.Assets.Ring:Clone();
        local l_Scale_0 = v11.Mesh.Scale;
        l_Scale_0 = Vector3.new(l_Scale_0.X, l_YInfluence_0 or l_Scale_0.Y, l_Scale_0.Z);
        v11.Mesh.Scale = Vector3.new();
        v11.Mesh.VertexColor = Vector3.new(v8.r, v8.g, v8.b) * 2;
        v11.CFrame = v5;
        v11.Parent = l_Effects_0;
        local v13 = TweenInfo.new(v7, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
        local v14 = TweenInfo.new(v7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v15 = TweenInfo.new(v7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        local v16 = l_TweenService_0:Create(v11.Mesh, v14, {
            Scale = l_Scale_0 * v6
        });
        local v17 = l_TweenService_0:Create(v11, v13, {
            Transparency = 1
        });
        local v18 = l_TweenService_0:Create(v11, v15, {
            CFrame = v5 * CFrame.new(v9)
        });
        v16.Completed:Connect(function() --[[ Line: 52 ]]
            -- upvalues: v11 (copy)
            v11:Destroy();
        end);
        v16:Play();
        v17:Play();
        v18:Play();
        return;
    end;
end;