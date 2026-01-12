local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
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
        local _ = l_Scale_0 - v10;
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
    end;
end;
local v18 = 0;
local v19 = false;
local v20 = false;
while script.Parent do
    local v21 = 0;
    if l_Character_0:GetAttribute("gomuDamage") then
        v21 = math.ceil((l_Character_0:GetAttribute("gomuDamage")));
    end;
    v18 = require(game.ReplicatedStorage.Modules.Skills.Modes["Gomu-Gomu"])(l_LocalPlayer_0);
    if v18 <= v21 then
        script.Parent.TextLabel.Text = "MAXED";
    else
        script.Parent.TextLabel.Text = v21 .. "/" .. v18;
    end;
    if v18 <= v21 and v19 == false then
        v19 = true;
        script.enough:Play();
        local v22 = script.ColorCorrection:Clone();
        v22.Parent = workspace.CurrentCamera;
        _G.tween(v22, {
            2, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            TintColor = Color3.fromRGB(255, 255, 255), 
            Contrast = 0
        });
        _G.destroy(v22, 2);
    elseif v21 < 150 then
        v19 = false;
    end;
    if v18 / 4 <= v21 and v20 == false then
        v20 = true;
        script.enough:Play();
    elseif v21 < v18 / 4 then
        v20 = false;
    end;
    v17(script.Parent, v21, v18);
    if l_Character_0:FindFirstChild("Gomu-Gomu") == nil then
        script.Parent.Visible = false;
        if l_LocalPlayer_0.Backpack:FindFirstChild("Gomu-Gomu") == nil then
            script.Parent.Parent:Destroy();
        end;
    else
        script.Parent.Visible = true;
    end;
    task.wait();
end;