repeat
    task.wait();
until script.char.Value ~= nil;
local l_Value_0 = script.char.Value;
local v1 = l_Value_0:WaitForChild("Humanoid", 60);
local v2 = {};
local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(l_Value_0);
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Value_0.Name);
local function _(v5, v6) --[[ Line: 9 ]]
    v6 = math.pow(10, v6 or 0);
    v5 = v5 * v6;
    return (if v5 >= 0 then math.floor(v5 + 0.5) else math.ceil(v5 - 0.5)) / v6;
end;
local function v18(v8, v9, v10) --[[ Line: 23 ]] --[[ Name: barchange ]]
    -- upvalues: l_PlayerFromCharacter_0 (copy), v2 (copy)
    if l_PlayerFromCharacter_0 and l_PlayerFromCharacter_0.Team ~= game.Teams.Players then
        warn("ret bec not alive!");
        return;
    else
        v9 = math.floor(v9);
        v10 = math.floor(v10);
        if v9 < 0 then
            v9 = 0;
        end;
        local v11 = v9 / v10;
        local l_Scale_0 = v8.bar.Size.X.Scale;
        if v2[v8.Name] == nil then
            v2[v8.Name] = 0;
        end;
        if v2[v8.Name] ~= v11 then
            local v13 = l_Scale_0 - v11;
            if v11 >= 1 then
                v11 = 1;
            end;
            v2[v8.Name] = v11;
            local l_v11_0 = v11;
            local v15 = math.pow(10, 3 or 0);
            l_v11_0 = l_v11_0 * v15;
            local v16 = (if l_v11_0 >= 0 then math.floor(l_v11_0 + 0.5) else math.ceil(l_v11_0 - 0.5)) / v15;
            v15 = v8.bar.Size.X.Scale;
            local v17 = math.pow(10, 3 or 0);
            v15 = v15 * v17;
            if v16 ~= (if v15 >= 0 then math.floor(v15 + 0.5) else math.ceil(v15 - 0.5)) / v17 then
                v8.bar:TweenSize(UDim2.new(v11, 0, 1, 0), "Out", "Quad", 0.25, true);
            end;
            if v13 > 0 then
                if v8.bar.Parent:FindFirstChild("a") then
                    v8.bar.Parent.a:Destroy();
                end;
                v16 = v8.bar:Clone();
                v16.Name = "a";
                v16.ZIndex = 2;
                v16.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                v16.Size = UDim2.new(v13, 0, 1, 0);
                v16.Position = UDim2.new(v11, 0, 0.5, 0);
                v16:ClearAllChildren();
                v16.Parent = v8.bar.Parent;
                l_v11_0 = v13 + 0.25;
                _G.tween(v16, {
                    l_v11_0, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.In, 
                    0, 
                    false, 
                    0
                }, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 0, 1, 0)
                });
                _G.destroy(v16, l_v11_0);
            end;
        end;
        return;
    end;
end;
cnt = v1:GetPropertyChangedSignal("Health"):Connect(function() --[[ Line: 68 ]]
    -- upvalues: v18 (copy), v1 (ref)
    v18(script.Parent.HealthBar, v1.Health, v1.MaxHealth);
end);
cnt2 = v1:GetPropertyChangedSignal("MaxHealth"):Connect(function() --[[ Line: 72 ]]
    -- upvalues: v18 (copy), v1 (ref)
    v18(script.Parent.HealthBar, v1.Health, v1.MaxHealth);
end);
cnt3 = l_FirstChild_0.Stamina.Changed:Connect(function() --[[ Line: 76 ]]
    -- upvalues: v18 (copy), l_FirstChild_0 (copy)
    v18(script.Parent.StaminaBar, l_FirstChild_0.Stamina.Value, l_FirstChild_0.Stamina.MaxValue);
end);
local function _() --[[ Line: 80 ]] --[[ Name: updateLevel ]]
    -- upvalues: l_FirstChild_0 (copy), l_Value_0 (copy)
    script.Parent.Parent.TextLabel.Text = "<font color=\"rgb(247,202,24)\">" .. "[" .. l_FirstChild_0.Stats.Level.Value .. "]" .. "</font> " .. l_Value_0.Name;
end;
v18(script.Parent.HealthBar, v1.Health, v1.MaxHealth);
v18(script.Parent.StaminaBar, l_FirstChild_0.Stamina.Value, l_FirstChild_0.Stamina.MaxValue);
if l_PlayerFromCharacter_0 then
    l_PlayerFromCharacter_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 90 ]]
        -- upvalues: l_PlayerFromCharacter_0 (copy), v18 (copy), v1 (ref), l_FirstChild_0 (copy)
        if l_PlayerFromCharacter_0.Team == game.Teams.Eliminated then
            v18(script.Parent.HealthBar, 0, v1.MaxHealth);
            v18(script.Parent.StaminaBar, 0, l_FirstChild_0.Stamina.MaxValue);
            script.Parent.Parent.TextLabel.TextColor3 = script.Parent.HealthBar.BackgroundColor3;
            script.Parent.HealthBar.bar.Visible = false;
            script.Parent.StaminaBar.bar.Visible = false;
            return;
        else
            script.Parent.HealthBar.bar.Visible = true;
            script.Parent.StaminaBar.bar.Visible = true;
            script.Parent.Parent.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
            return;
        end;
    end);
    l_PlayerFromCharacter_0.CharacterAdded:Connect(function(v20) --[[ Line: 108 ]]
        -- upvalues: v1 (ref), v18 (copy)
        if cnt then
            cnt:Disconnect();
        end;
        if cnt2 then
            cnt2:Disconnect();
        end;
        v1 = v20:WaitForChild("Humanoid", 100000000000);
        cnt = v1:GetPropertyChangedSignal("Health"):Connect(function() --[[ Line: 116 ]]
            -- upvalues: v18 (ref), v1 (ref)
            v18(script.Parent.HealthBar, v1.Health, v1.MaxHealth);
        end);
        cnt2 = v1:GetPropertyChangedSignal("MaxHealth"):Connect(function() --[[ Line: 120 ]]
            -- upvalues: v18 (ref), v1 (ref)
            v18(script.Parent.HealthBar, v1.Health, v1.MaxHealth);
        end);
    end);
    game.Players.PlayerRemoving:Connect(function(v21) --[[ Line: 124 ]]
        -- upvalues: l_PlayerFromCharacter_0 (copy)
        if v21 == l_PlayerFromCharacter_0 then
            script.Parent.Parent:Destroy();
        end;
    end);
end;