local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local v3 = {};
local function _(v4, v5) --[[ Line: 5 ]]
    v5 = math.pow(10, v5 or 0);
    v4 = v4 * v5;
    return (if v4 >= 0 then math.floor(v4 + 0.5) else math.ceil(v4 - 0.5)) / v5;
end;
local function v17(v7, v8, v9) --[[ Line: 19 ]] --[[ Name: barchange ]]
    -- upvalues: v3 (copy)
    v8 = math.floor(v8);
    v9 = math.floor(v9);
    if v8 < 0 then
        v8 = 0;
    end;
    local v10 = v8 / v9;
    local l_Scale_0 = v7.bar.Size.X.Scale;
    if v3[v7.Name] == nil then
        v3[v7.Name] = 0;
    end;
    if v3[v7.Name] ~= v10 then
        local v12 = l_Scale_0 - v10;
        if v10 >= 1 then
            v10 = 1;
        end;
        v3[v7.Name] = v10;
        local l_v10_0 = v10;
        local v14 = math.pow(10, 3 or 0);
        l_v10_0 = l_v10_0 * v14;
        local v15 = (if l_v10_0 >= 0 then math.floor(l_v10_0 + 0.5) else math.ceil(l_v10_0 - 0.5)) / v14;
        v14 = v7.bar.Size.X.Scale;
        local v16 = math.pow(10, 3 or 0);
        v14 = v14 * v16;
        if v15 ~= (if v14 >= 0 then math.floor(v14 + 0.5) else math.ceil(v14 - 0.5)) / v16 then
            v7.bar:TweenSize(UDim2.new(v10, 0, 1, 0), "Out", "Quad", 0.25, true);
        end;
        if v12 > 0 then
            if v7.bar.Parent:FindFirstChild("a") then
                v7.bar.Parent.a:Destroy();
            end;
            v15 = v7.bar:Clone();
            v15.Name = "a";
            v15.ZIndex = 2;
            v15.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
            v15.Size = UDim2.new(v12, 0, 1, 0);
            v15.Position = UDim2.new(v10, 0, 0, 0);
            v15:ClearAllChildren();
            v15.Parent = v7.bar.Parent;
            l_v10_0 = v12 + 0.25;
            _G.tween(v15, {
                l_v10_0, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.In, 
                0, 
                false, 
                0
            }, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 1, 0)
            });
            _G.destroy(v15, l_v10_0);
        end;
    end;
end;
local v18 = 0;
_G.rocketDMGRed = function(v19) --[[ Line: 60 ]]
    -- upvalues: v18 (ref)
    local l_Parent_0 = script.Parent;
    local v21 = l_Parent_0.bar:Clone();
    v21.Name = "a";
    v21.Parent = l_Parent_0.bar.Parent;
    v21.ZIndex = 2;
    v21.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    local v22 = 1 - v19 / v18;
    v21.Size = UDim2.new(1 - v22, 0, 1, 0);
    v21.Position = UDim2.new(0, 0, 0, 0);
    v21:ClearAllChildren();
    local v23 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
    local v24 = {
        BackgroundTransparency = 1
    };
    game:GetService("TweenService"):Create(v21, v23, v24):Play();
    script.RocketBladeNotFull:Play();
end;
local v25 = false;
local v26 = false;
while true do
    local v27 = 0;
    if l_Character_0:GetAttribute("rocketBladeDamage") then
        v27 = math.ceil((l_Character_0:GetAttribute("rocketBladeDamage")));
    end;
    v18 = math.ceil(150 + l_FirstChild_0.Stats.Defense.Value * 0.75 + l_FirstChild_0.Stats.GunMastery.Value * 1.25);
    if v18 <= v27 then
        script.Parent.TextLabel.Text = "MAXED";
    else
        script.Parent.TextLabel.Text = v27 .. "/" .. v18;
    end;
    if v27 >= 150 and v25 == false then
        v25 = true;
        script.enough:Play();
        local v28 = script.ColorCorrection:Clone();
        v28.Parent = workspace.CurrentCamera;
        _G.tween(v28, {
            1, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            TintColor = Color3.fromRGB(255, 255, 255), 
            Contrast = 0
        });
        _G.destroy(v28, 1);
    elseif v27 < 150 then
        v25 = false;
    end;
    if v18 <= v27 and v26 == false then
        v26 = true;
        script.maxcharged:Play();
    elseif v27 < v18 then
        v26 = false;
    end;
    v17(script.Parent, v27, v18);
    if l_Character_0:FindFirstChild("Inferno Rocket Blade") == nil then
        script.Parent.Visible = false;
        if l_LocalPlayer_0.Backpack:FindFirstChild("Inferno Rocket Blade") == nil then
            script.Parent.Parent:Destroy();
        end;
    else
        script.Parent.Visible = true;
    end;
    task.wait();
end;