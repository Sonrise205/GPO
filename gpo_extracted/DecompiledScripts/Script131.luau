local l_Humanoid_0 = script.char.Value.Humanoid;
if not l_Humanoid_0:IsA("Humanoid") then
    return;
else
    local v1 = false;
    if game.ReplicatedStorage:FindFirstChild("tradingHUB") then
        v1 = true;
        return;
    else
        local l_BackgroundColor3_0 = script.Parent.BackgroundColor3;
        local _ = script.Parent.Parent.Parent;
        local function v6(_) --[[ Line: 15 ]] --[[ Name: change ]]
            -- upvalues: l_Humanoid_0 (copy), l_BackgroundColor3_0 (copy)
            local v5 = l_Humanoid_0.Health / l_Humanoid_0.MaxHealth;
            script.Parent.BackgroundColor3 = Color3.fromRGB(255, 255, 255):Lerp(l_BackgroundColor3_0, v5);
            script.Parent:TweenSize(UDim2.new(v5, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            if l_Humanoid_0.Health <= 0 then
                script.Parent.Parent.Parent:Destroy();
            end;
        end;
        v6();
        l_Humanoid_0.HealthChanged:Connect(v6);
        return;
    end;
end;