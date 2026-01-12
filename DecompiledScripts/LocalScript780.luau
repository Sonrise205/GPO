local _ = game:GetService("Players");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_setReplicationFocus_0 = game:GetService("ReplicatedStorage"):WaitForChild("setReplicationFocus");
local v4 = 0;
local v5 = false;
local v6 = true;
script.Parent.Blackout.Visible = true;
local v7 = nil;
local v8 = {};
local v9 = {};
local function _(v10, v11) --[[ Line: 15 ]]
    v11 = math.pow(10, v11 or 0);
    v10 = v10 * v11;
    return (if v10 >= 0 then math.floor(v10 + 0.5) else math.ceil(v10 - 0.5)) / v11;
end;
local function v23(v13, v14, v15) --[[ Line: 29 ]] --[[ Name: barchange ]]
    -- upvalues: v9 (copy)
    v14 = math.floor(v14);
    v15 = math.floor(v15);
    if v14 < 0 then
        v14 = 0;
    end;
    local v16 = v14 / v15;
    local l_Scale_0 = v13.bar.Size.X.Scale;
    if v9[v13.Name] == nil then
        v9[v13.Name] = 0;
    end;
    if v9[v13.Name] ~= v16 then
        local v18 = l_Scale_0 - v16;
        if v16 >= 1 then
            v16 = 1;
        end;
        v9[v13.Name] = v16;
        local l_v16_0 = v16;
        local v20 = math.pow(10, 3 or 0);
        l_v16_0 = l_v16_0 * v20;
        local v21 = (if l_v16_0 >= 0 then math.floor(l_v16_0 + 0.5) else math.ceil(l_v16_0 - 0.5)) / v20;
        v20 = v13.bar.Size.X.Scale;
        local v22 = math.pow(10, 3 or 0);
        v20 = v20 * v22;
        if v21 ~= (if v20 >= 0 then math.floor(v20 + 0.5) else math.ceil(v20 - 0.5)) / v22 then
            v13.bar:TweenSize(UDim2.new(v16, 0, 1, 0), "Out", "Quad", 0.25, true);
        end;
        if v18 > 0 then
            if v13.bar.Parent:FindFirstChild("a") then
                v13.bar.Parent.a:Destroy();
            end;
            v21 = v13.bar:Clone();
            v21.Name = "a";
            v21.ZIndex = 2;
            v21.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
            v21.Size = UDim2.new(v18, 0, 1, 0);
            v21.Position = UDim2.new(v16, 0, 0.5, 0);
            v21:ClearAllChildren();
            v21.Parent = v13.bar.Parent;
            l_v16_0 = v18 + 0.25;
            _G.tween(v21, {
                l_v16_0, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.In, 
                0, 
                false, 
                0
            }, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 1, 0)
            });
            _G.destroy(v21, l_v16_0);
        end;
    end;
end;
local function _() --[[ Line: 71 ]] --[[ Name: updateBars ]]
    -- upvalues: v8 (copy), v7 (ref), v23 (copy)
    pcall(function() --[[ Line: 72 ]]
        -- upvalues: v8 (ref), v7 (ref), v23 (ref)
        for v24 = 1, #v8 do
            if v8[v24] then
                v8[v24]:Disconnect();
                v8[v24] = nil;
            end;
        end;
        table.clear(v8);
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v7.Name);
        local v26 = v7.Character:WaitForChild("Humanoid", 3);
        v23(script.Parent.Frame.Health.Bars.HealthBar, v26.Health, v26.MaxHealth);
        v23(script.Parent.Frame.Health.Bars.HealthBar, v26.Health, v26.MaxHealth);
        v23(script.Parent.Frame.Health.Bars.StaminaBar, l_FirstChild_0.Stamina.Value, l_FirstChild_0.Stamina.MaxValue);
        local v27 = nil;
        local v28 = nil;
        local v29 = nil;
        v27 = v26:GetPropertyChangedSignal("Health"):Connect(function() --[[ Line: 88 ]]
            -- upvalues: v23 (ref), v26 (copy)
            v23(script.Parent.Frame.Health.Bars.HealthBar, v26.Health, v26.MaxHealth);
        end);
        v28 = v26:GetPropertyChangedSignal("MaxHealth"):Connect(function() --[[ Line: 92 ]]
            -- upvalues: v23 (ref), v26 (copy)
            v23(script.Parent.Frame.Health.Bars.HealthBar, v26.Health, v26.MaxHealth);
        end);
        v29 = l_FirstChild_0.Stamina.Changed:Connect(function() --[[ Line: 96 ]]
            -- upvalues: v23 (ref), l_FirstChild_0 (copy)
            v23(script.Parent.Frame.Health.Bars.StaminaBar, l_FirstChild_0.Stamina.Value, l_FirstChild_0.Stamina.MaxValue);
        end);
        table.insert(v8, v27);
        table.insert(v8, v28);
        table.insert(v8, v29);
    end);
end;
local l_Children_0 = game.SoundService:GetChildren();
for v32 = 1, #l_Children_0 do
    if l_Children_0[v32]:IsA("SoundGroup") then
        l_Children_0[v32].Volume = 0;
    end;
end;
local function v36(v33) --[[ Line: 113 ]] --[[ Name: selectOnList ]]
    local l_Children_1 = script.Parent.ScrollingFrame.ScrollingFrame:GetChildren();
    for v35 = 1, #l_Children_1 do
        if l_Children_1[v35]:IsA("TextButton") then
            if l_Children_1[v35].Name ~= v33 then
                l_Children_1[v35].TextColor3 = Color3.fromRGB(255, 255, 255);
            else
                l_Children_1[v35].TextColor3 = Color3.fromRGB(170, 255, 0);
            end;
        end;
    end;
end;
local function v45() --[[ Line: 126 ]] --[[ Name: getPossiblePlayers ]]
    -- upvalues: v6 (ref)
    local v37 = {};
    if game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") == nil then
        local l_Players_1 = game.Players:GetPlayers();
        for v39 = 1, #l_Players_1 do
            local l_leaderstats_0 = l_Players_1[v39]:FindFirstChild("leaderstats");
            if l_leaderstats_0 and l_leaderstats_0.Lives.Value >= 0 then
                table.insert(v37, l_Players_1[v39]);
            elseif l_leaderstats_0 == nil then
                table.insert(v37, l_Players_1[v39]);
            end;
        end;
    else
        local l_Players_2 = game.Players:GetPlayers();
        for v42 = 1, #l_Players_2 do
            if l_Players_2[v42].Team == game.Teams.Players and (game.Players.LocalPlayer.Party.Value == nil or v6 ~= true or game.Players.LocalPlayer.Party.Value == l_Players_2[v42].Party.Value) then
                table.insert(v37, l_Players_2[v42]);
            end;
        end;
    end;
    table.sort(v37, function(v43, v44) --[[ Line: 152 ]]
        return v43.Name < v44.Name;
    end);
    return v37;
end;
local function v59(v46) --[[ Line: 160 ]] --[[ Name: spectate ]]
    -- upvalues: v4 (ref), v45 (copy), l_setReplicationFocus_0 (copy), l_CurrentCamera_0 (copy), v36 (copy), v7 (ref), v8 (copy), v23 (copy)
    v4 = v4 + 1;
    local v47 = v45();
    local v48 = nil;
    local function v50(v49) --[[ Line: 169 ]] --[[ Name: spectatePlayer ]]
        -- upvalues: l_setReplicationFocus_0 (ref), l_CurrentCamera_0 (ref), v48 (ref)
        if v49 == nil then
            return;
        else
            _G.requestStream(game.ReplicatedStorage.getPlayerPosition:InvokeServer(v49), 1);
            l_setReplicationFocus_0:InvokeServer(v49);
            l_CurrentCamera_0.CameraSubject = v49.Character.Humanoid;
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart then
                if v49 ~= game.Players.LocalPlayer then
                    game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true;
                elseif game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") == nil then
                    game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false;
                end;
            end;
            v48 = v49.Name;
            return;
        end;
    end;
    if v46 == nil then
        for v51, v52 in v47 do
            if v51 == v4 then
                v50(v52);
            end;
        end;
    else
        v50(game.Players:FindFirstChild(v46));
        v48 = v46;
    end;
    if v4 >= #v47 then
        v4 = 0;
    end;
    if v48 ~= nil then
        v36(v48);
        script.Parent.Frame.TextLabel.Text = "SPECTATING " .. string.upper(v48) .. " [" .. game.Players:FindFirstChild(v48).UserId .. "]";
        v7 = game.Players:FindFirstChild(v48);
        if game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") ~= nil then
            script.Parent.Frame.DMG.Visible = true;
            if v7 and v7.Parent ~= nil then
                script.Parent.Frame.DMG.Text = v7.leaderstats.Damage.Value .. " DAMAGE TO OTHERS";
            end;
        else
            script.Parent.Frame.DMG.Visible = false;
        end;
        pcall(function() --[[ Line: 72 ]]
            -- upvalues: v8 (ref), v7 (ref), v23 (ref)
            for v53 = 1, #v8 do
                if v8[v53] then
                    v8[v53]:Disconnect();
                    v8[v53] = nil;
                end;
            end;
            table.clear(v8);
            local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v7.Name);
            local v55 = v7.Character:WaitForChild("Humanoid", 3);
            v23(script.Parent.Frame.Health.Bars.HealthBar, v55.Health, v55.MaxHealth);
            v23(script.Parent.Frame.Health.Bars.HealthBar, v55.Health, v55.MaxHealth);
            v23(script.Parent.Frame.Health.Bars.StaminaBar, l_FirstChild_1.Stamina.Value, l_FirstChild_1.Stamina.MaxValue);
            local v56 = nil;
            local v57 = nil;
            local v58 = nil;
            v56 = v55:GetPropertyChangedSignal("Health"):Connect(function() --[[ Line: 88 ]]
                -- upvalues: v23 (ref), v55 (copy)
                v23(script.Parent.Frame.Health.Bars.HealthBar, v55.Health, v55.MaxHealth);
            end);
            v57 = v55:GetPropertyChangedSignal("MaxHealth"):Connect(function() --[[ Line: 92 ]]
                -- upvalues: v23 (ref), v55 (copy)
                v23(script.Parent.Frame.Health.Bars.HealthBar, v55.Health, v55.MaxHealth);
            end);
            v58 = l_FirstChild_1.Stamina.Changed:Connect(function() --[[ Line: 96 ]]
                -- upvalues: v23 (ref), l_FirstChild_1 (copy)
                v23(script.Parent.Frame.Health.Bars.StaminaBar, l_FirstChild_1.Stamina.Value, l_FirstChild_1.Stamina.MaxValue);
            end);
            table.insert(v8, v56);
            table.insert(v8, v57);
            table.insert(v8, v58);
        end);
    end;
end;
local l_ScrollingFrame_0 = script.Parent.ScrollingFrame.ScrollingFrame;
task.spawn(function() --[[ Line: 222 ]]
    -- upvalues: v45 (copy), l_ScrollingFrame_0 (copy), v59 (copy)
    while true do
        local v61 = v45();
        local v62 = {};
        for v63 = 1, #v61 do
            if l_ScrollingFrame_0:FindFirstChild(v61[v63].Name) == nil then
                local v64 = script.playerName:Clone();
                v64.Name = v61[v63].Name;
                v64.Text = v61[v63].Name;
                v64.Parent = l_ScrollingFrame_0;
                v64.MouseButton1Click:Connect(function() --[[ Line: 234 ]]
                    -- upvalues: v59 (ref), v61 (copy), v63 (copy)
                    v59(v61[v63].Name);
                end);
            end;
            table.insert(v62, v61[v63].Name);
        end;
        table.sort(v62);
        local l_l_ScrollingFrame_0_Children_0 = l_ScrollingFrame_0:GetChildren();
        for v66 = 1, #l_l_ScrollingFrame_0_Children_0 do
            if l_l_ScrollingFrame_0_Children_0[v66]:IsA("TextButton") and table.find(v62, l_l_ScrollingFrame_0_Children_0[v66].Name) == nil then
                l_l_ScrollingFrame_0_Children_0[v66]:Destroy();
            end;
        end;
        task.wait(1);
    end;
end);
_G.tween(script.Parent.Blackout, {
    1, 
    Enum.EasingStyle.Quad, 
    Enum.EasingDirection.Out, 
    0, 
    false, 
    0
}, {
    BackgroundTransparency = 1
});
l_UserInputService_0.InputBegan:Connect(function(v67, v68) --[[ Line: 255 ]]
    -- upvalues: v5 (ref), v59 (copy)
    if v68 or v5 == true then
        return;
    else
        if (v67.UserInputType == Enum.UserInputType.MouseButton1 or v67.UserInputType == Enum.UserInputType.Touch) and workspace.CurrentCamera.CameraType == Enum.CameraType.Custom then
            v59();
        end;
        return;
    end;
end);
v59();
script.Parent.Frame.RETURN.MouseButton1Click:Connect(function() --[[ Line: 266 ]]
    -- upvalues: v5 (ref), l_CurrentCamera_0 (copy), l_setReplicationFocus_0 (copy)
    v5 = true;
    l_CurrentCamera_0.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
    game.ReplicatedStorage.Events.spectate:FireServer();
    game.ReplicatedStorage.matchEvents:FireServer("return");
    l_setReplicationFocus_0:InvokeServer(game.Players.LocalPlayer);
    script.Parent:Destroy();
end);
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
task.defer(function() --[[ Line: 278 ]]
    -- upvalues: l_ProximityPromptService_0 (copy)
    l_ProximityPromptService_0.Enabled = false;
end);
if game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") ~= nil then
    script.Parent.Frame.RETURN.Visible = true;
    script.Parent.Frame.RETURN.MouseButton1Click:Connect(function() --[[ Line: 288 ]]
        -- upvalues: v6 (ref)
        if v6 == false and game.Players.LocalPlayer.Party.Value ~= game.Players.LocalPlayer then
            game.ReplicatedStorage.matchEvents:FireServer("requestReturn");
            return;
        else
            script.Parent.Frame.TextLabel.Text = "RETURNING TO LOBBY...";
            script.Parent.Frame.TextLabel.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 170, 0));
            if v6 == true then
                game.ReplicatedStorage.matchEvents:FireServer("return");
                return;
            else
                game.ReplicatedStorage.matchEvents:FireServer("returnParty");
                return;
            end;
        end;
    end);
    task.spawn(function() --[[ Line: 303 ]]
        -- upvalues: v7 (ref), v59 (copy)
        while true do
            if v7 and v7.Parent ~= nil then
                script.Parent.Frame.DMG.Text = v7.leaderstats.Damage.Value .. " DAMAGE TO OTHERS";
                if v7.Team == game.Teams.Eliminated then
                    v59();
                end;
            end;
            task.wait();
        end;
    end);
    while true do
        local v70 = {};
        local l_Players_3 = game.Players:GetPlayers();
        for v72 = 1, #l_Players_3 do
            if l_Players_3[v72].Team == game.Teams.Players and (game.Players.LocalPlayer.Party.Value == nil or game.Players.LocalPlayer.Party.Value == l_Players_3[v72].Party.Value) then
                table.insert(v70, l_Players_3[v72]);
            end;
        end;
        if v7 ~= nil then
            local l_Character_0 = v7.Character;
            if l_Character_0 and l_Character_0.PrimaryPart ~= nil and game.Players.LocalPlayer.ReplicationFocus ~= l_Character_0.PrimaryPart then
                _G.requestStream(game.ReplicatedStorage.getPlayerPosition:InvokeServer(v7), 1);
            end;
            script.Parent.Frame.userName.Text = v7.Name;
        end;
        if not game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") or #v70 > 0 then
            l_ProximityPromptService_0.Enabled = false;
            task.wait();
        else
            break;
        end;
    end;
    script.Parent.Frame.TextLabel.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0));
    if game.Players.LocalPlayer.Party.Value ~= nil then
        v6 = false;
        if game.Players.LocalPlayer ~= game.Players.LocalPlayer.Party.Value then
            script.Parent.Frame.RETURN.Text = "ASK PARTY OWNER TO RETURN TO LOBBY!";
        else
            script.Parent.Frame.RETURN.Text = "RETURN TO LOBBY AS PARTY";
        end;
        script.Parent.Frame.TextLabel.Text = "YOUR ENTIRE SQUAD HAS BEEN ELIMINATED : (";
    else
        script.Parent.Frame.TextLabel.Text = "YOU HAVE BEEN ELIMINATED : (";
    end;
end;