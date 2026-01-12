local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Debris_0 = game:GetService("Debris");
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy), l_Debris_0 (copy)
    local v6 = v3:Clone();
    v6.Parent = workspace.Effects;
    v5 = v5 or v6.CFrame;
    for _, v8 in v6:GetDescendants() do
        if v8:IsA("Beam") then
            v8.Enabled = true;
            local v9 = {
                Width0 = v8.Width0, 
                Width1 = v8.Width1, 
                TextureSpeed = v8.TextureSpeed, 
                Brightness = v8.Brightness, 
                LightEmission = v8.LightEmission
            };
            local v10 = l_TweenService_0:Create(v8, TweenInfo.new(v4.Duration, Enum.EasingStyle[v4.Easing], Enum.EasingDirection[v4.EasingDirection]), v4.Properties);
            v10:Play();
            v10.Completed:Once(function() --[[ Line: 33 ]]
                -- upvalues: v8 (copy), v9 (copy)
                v8.Enabled = false;
                for v11, v12 in v9 do
                    v8[v11] = v12;
                end;
            end);
        end;
    end;
    l_TweenService_0:Create(v6, TweenInfo.new(v4.Duration, Enum.EasingStyle[v4.Easing], Enum.EasingDirection[v4.EasingDirection]), {
        Position = (v5 * v4.Offset).Position
    }):Play();
    local v13 = 0;
    local v14 = nil;
    v14 = l_RunService_0.Heartbeat:Connect(function(v15) --[[ Line: 53 ]]
        -- upvalues: v6 (copy), v4 (copy), v13 (ref), v14 (ref)
        local l_v6_0 = v6;
        l_v6_0.CFrame = l_v6_0.CFrame * CFrame.Angles(0, 0, (math.rad(v4.RotationSpeed * v15)));
        v13 = v13 + v15;
        if v13 > 5 and v14 then
            v14:Disconnect();
        end;
    end);
    l_Debris_0:AddItem(v6, 5);
    return v6;
end;