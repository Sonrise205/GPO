repeat
    task.wait();
until script.char.Value ~= nil;
local l_Value_0 = script.char.Value;
local v1 = l_Value_0:WaitForChild("Humanoid", 120);
local v2 = {};
local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(l_Value_0);
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Value_0.Name);
local l_floor_0 = math.floor;
local l_pow_0 = math.pow;
local l_ceil_0 = math.ceil;
local l_Teams_0 = game:GetService("Teams");
local l_Players_0 = game:GetService("Players");
local l_Players_1 = l_Teams_0:FindFirstChild("Players");
local l_Eliminated_0 = l_Teams_0:FindFirstChild("Eliminated");
local l_HealthBar_0 = script.Parent.HealthBar;
local l_StaminaBar_0 = script.Parent.StaminaBar;
local l_TextLabel_0 = script.Parent.Parent.TextLabel;
local function _(v15, v16) --[[ Line: 25 ]]
    -- upvalues: l_pow_0 (copy), l_floor_0 (copy), l_ceil_0 (copy)
    v16 = l_pow_0(10, v16 or 0);
    v15 = v15 * v16;
    return (if v15 >= 0 then l_floor_0(v15 + 0.5) else l_ceil_0(v15 - 0.5)) / v16;
end;
local function v28(v18, v19, v20) --[[ Line: 38 ]] --[[ Name: barchange ]]
    -- upvalues: l_Players_1 (copy), l_PlayerFromCharacter_0 (copy), l_floor_0 (copy), v2 (copy), l_pow_0 (copy), l_ceil_0 (copy)
    if l_Players_1 and l_PlayerFromCharacter_0 and l_PlayerFromCharacter_0.Team ~= l_Players_1 then
        warn("ret bec not alive!");
        return;
    else
        v19 = l_floor_0(v19);
        v20 = l_floor_0(v20);
        if v19 < 0 then
            v19 = 0;
        end;
        local v21 = v19 / v20;
        local l_Scale_0 = v18.bar.Size.X.Scale;
        if v2[v18.Name] == nil then
            v2[v18.Name] = 0;
        end;
        if v2[v18.Name] ~= v21 then
            local v23 = l_Scale_0 - v21;
            if v21 >= 1 then
                v21 = 1;
            end;
            v2[v18.Name] = v21;
            local l_v21_0 = v21;
            local v25 = l_pow_0(10, 3 or 0);
            l_v21_0 = l_v21_0 * v25;
            local v26 = (if l_v21_0 >= 0 then l_floor_0(l_v21_0 + 0.5) else l_ceil_0(l_v21_0 - 0.5)) / v25;
            v25 = v18.bar.Size.X.Scale;
            local v27 = l_pow_0(10, 3 or 0);
            v25 = v25 * v27;
            if v26 ~= (if v25 >= 0 then l_floor_0(v25 + 0.5) else l_ceil_0(v25 - 0.5)) / v27 then
                v18.bar:TweenSize(UDim2.new(v21, 0, 1, 0), "Out", "Quad", 0.25, true);
            end;
            if v23 > 0 then
                if v18.bar.Parent:FindFirstChild("a") then
                    v18.bar.Parent.a:Destroy();
                end;
                v26 = v18.bar:Clone();
                v26.Name = "a";
                v26.ZIndex = 2;
                v26.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                v26.Size = UDim2.new(v23, 0, 1, 0);
                v26.Position = UDim2.new(v21, 0, 0.5, 0);
                v26:ClearAllChildren();
                v26.Parent = v18.bar.Parent;
                l_v21_0 = v23 + 0.25;
                _G.tween(v26, {
                    l_v21_0, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.In, 
                    0, 
                    false, 
                    0
                }, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 0, 1, 0)
                });
                _G.destroy(v26, l_v21_0);
            end;
        end;
        return;
    end;
end;
local v29 = nil;
local v30 = nil;
local v31 = nil;
if v1 then
    v29 = v1:GetPropertyChangedSignal("Health"):Connect(function() --[[ Line: 98 ]]
        -- upvalues: v28 (copy), l_HealthBar_0 (copy), v1 (ref)
        v28(l_HealthBar_0, v1.Health, v1.MaxHealth);
    end);
    v30 = v1:GetPropertyChangedSignal("MaxHealth"):Connect(function() --[[ Line: 102 ]]
        -- upvalues: v28 (copy), l_HealthBar_0 (copy), v1 (ref)
        v28(l_HealthBar_0, v1.Health, v1.MaxHealth);
    end);
end;
if l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Stamina") then
    v31 = l_FirstChild_0.Stamina.Changed:Connect(function() --[[ Line: 108 ]]
        -- upvalues: v28 (copy), l_StaminaBar_0 (copy), l_FirstChild_0 (copy)
        v28(l_StaminaBar_0, l_FirstChild_0.Stamina.Value, l_FirstChild_0.Stamina.MaxValue);
    end);
end;
if v1 then
    v28(l_HealthBar_0, v1.Health, v1.MaxHealth);
end;
if l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Stamina") then
    v28(l_StaminaBar_0, l_FirstChild_0.Stamina.Value, l_FirstChild_0.Stamina.MaxValue);
end;
if l_PlayerFromCharacter_0 then
    local l_leaderstats_0 = l_PlayerFromCharacter_0:FindFirstChild("leaderstats");
    if l_leaderstats_0 then
        local l_Lives_0 = l_leaderstats_0:FindFirstChild("Lives");
        if l_Lives_0 then
            l_Lives_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 126 ]]
                -- upvalues: l_Lives_0 (copy), v28 (copy), l_HealthBar_0 (copy), v1 (ref), l_StaminaBar_0 (copy), l_FirstChild_0 (copy), l_TextLabel_0 (copy)
                if l_Lives_0.Value < 0 then
                    v28(l_HealthBar_0, 0, v1.MaxHealth);
                    v28(l_StaminaBar_0, 0, l_FirstChild_0.Stamina.MaxValue);
                    l_TextLabel_0.TextColor3 = l_HealthBar_0.BackgroundColor3;
                    l_HealthBar_0.bar.Visible = false;
                    l_StaminaBar_0.bar.Visible = false;
                    return;
                else
                    l_HealthBar_0.bar.Visible = true;
                    l_StaminaBar_0.bar.Visible = true;
                    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
                    return;
                end;
            end);
        end;
    end;
    l_PlayerFromCharacter_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 144 ]]
        -- upvalues: l_PlayerFromCharacter_0 (copy), l_Eliminated_0 (copy), v28 (copy), l_HealthBar_0 (copy), v1 (ref), l_StaminaBar_0 (copy), l_FirstChild_0 (copy), l_TextLabel_0 (copy)
        if l_PlayerFromCharacter_0.Team == l_Eliminated_0 then
            v28(l_HealthBar_0, 0, v1.MaxHealth);
            v28(l_StaminaBar_0, 0, l_FirstChild_0.Stamina.MaxValue);
            l_TextLabel_0.TextColor3 = l_HealthBar_0.BackgroundColor3;
            l_HealthBar_0.bar.Visible = false;
            l_StaminaBar_0.bar.Visible = false;
            return;
        else
            l_HealthBar_0.bar.Visible = true;
            l_StaminaBar_0.bar.Visible = true;
            l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
            return;
        end;
    end);
    l_PlayerFromCharacter_0.CharacterAdded:Connect(function(v34) --[[ Line: 160 ]]
        -- upvalues: v29 (ref), v30 (ref), v1 (ref), v28 (copy), l_HealthBar_0 (copy)
        if v29 then
            v29:Disconnect();
        end;
        if v30 then
            v30:Disconnect();
        end;
        v1 = v34:WaitForChild("Humanoid", 120);
        if not v1 then
            script.Parent.Parent:Destroy();
            return;
        else
            v29 = v1:GetPropertyChangedSignal("Health"):Connect(function() --[[ Line: 174 ]]
                -- upvalues: v28 (ref), l_HealthBar_0 (ref), v1 (ref)
                v28(l_HealthBar_0, v1.Health, v1.MaxHealth);
            end);
            v30 = v1:GetPropertyChangedSignal("MaxHealth"):Connect(function() --[[ Line: 178 ]]
                -- upvalues: v28 (ref), l_HealthBar_0 (ref), v1 (ref)
                v28(l_HealthBar_0, v1.Health, v1.MaxHealth);
            end);
            v28(l_HealthBar_0, v1.Health, v1.MaxHealth);
            return;
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function(v35) --[[ Line: 185 ]]
        -- upvalues: l_PlayerFromCharacter_0 (copy)
        if v35 == l_PlayerFromCharacter_0 then
            script.Parent.Parent:Destroy();
        end;
    end);
end;