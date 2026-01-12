local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
return {
    start = function(_, v3, v4, v5, v6, v7, v8) --[[ Line: 6 ]] --[[ Name: start ]]
        -- upvalues: l_RunService_0 (copy), l_TweenService_0 (copy)
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_UIIndicator_0 = game.Players.LocalPlayer.PlayerGui.UIIndicator;
        v5 = v5 or 10;
        v6 = v6 or 1;
        v4 = v4 or Color3.new(1, 1, 1);
        local v11 = script.Frame:Clone();
        v11.ImageColor3 = v4;
        v11.Parent = l_UIIndicator_0;
        local v12 = tick();
        local v13 = tick();
        if v8 then
            v5 = 10000;
        end;
        print("hello");
        local v14 = nil;
        v14 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 63 ]]
            -- upvalues: v13 (copy), v5 (ref), v8 (copy), v3 (copy), v14 (ref), v11 (copy), v12 (ref), l_TweenService_0 (ref), v6 (ref), v7 (copy), l_CurrentCamera_0 (copy)
            if tick() - v13 >= v5 or v8 and v8:GetAttribute("noteDone") or typeof(v3) == "Instance" and not v3.Parent then
                v14:Disconnect();
                v11:Destroy();
                return;
            else
                local v15 = typeof(v3) == "Instance" and v3.Position or v3;
                if tick() - v12 >= 1 then
                    v12 = tick();
                    l_TweenService_0:Create(v11, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(v6 * 0.2, 0, v6 * 0.2, 0), 
                        ImageTransparency = 1
                    }):Play();
                    v11.Size = UDim2.new();
                    v11.ImageTransparency = 0;
                    if v7 then
                        _G.PlaySound(CFrame.new(v15), script.NotificationTick);
                    end;
                end;
                local l_X_0 = l_CurrentCamera_0.ViewportSize.X;
                local l_Y_0 = l_CurrentCamera_0.ViewportSize.Y;
                local v18 = math.sqrt((l_X_0 / 2) ^ 2 + (l_Y_0 / 2) ^ 2);
                local l_CFrame_0 = l_CurrentCamera_0.CFrame;
                local v20, v21 = l_CurrentCamera_0:WorldToViewportPoint(v15);
                local v22 = math.clamp(v20.X, 0, l_X_0);
                local v23 = math.clamp(v20.Y, 0, l_Y_0);
                if v22 ~= v20.X or v23 ~= v20.Y or not v21 then
                    local v24 = l_CFrame_0:VectorToObjectSpace(v15 - l_CFrame_0.Position);
                    local l_Unit_0 = Vector2.new(v24.X, v24.Y).Unit;
                    local v26 = l_Unit_0 * v18;
                    local _ = math.atan2(l_Unit_0.X, l_Unit_0.Y);
                    local v28 = nil;
                    v28 = if math.abs(v26.Y) > l_Y_0 / 2 then l_Unit_0 * math.abs(l_Y_0 / 2 / l_Unit_0.Y) else l_Unit_0 * math.abs(l_X_0 / 2 / l_Unit_0.X);
                    v22 = l_X_0 / 2 + v28.X;
                    v23 = l_Y_0 / 2 - v28.Y;
                end;
                v11.Position = UDim2.fromOffset(v22, v23);
                return;
            end;
        end);
    end
};