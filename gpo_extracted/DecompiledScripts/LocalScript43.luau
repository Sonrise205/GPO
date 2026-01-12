local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local v3 = {};
local function _(v4, v5) --[[ Line: 6 ]]
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
local l_Value_0 = script.tool.Value;
local v19 = 0;
local v20 = false;
local v21 = false;
local l_Name_0 = l_Value_0.Name;
local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("damageName");
local v24 = l_Value_0:GetAttribute("modePercent") or 1;
while script.Parent ~= nil do
    local v25 = 0;
    if l_Character_0:GetAttribute(l_l_Value_0_Attribute_0) then
        v25 = math.ceil((l_Character_0:GetAttribute(l_l_Value_0_Attribute_0)));
    end;
    v19 = require(game.ReplicatedStorage.Modules.Skills.Modes:FindFirstChild(_G.modeBarModuleNames(l_Name_0)))(l_LocalPlayer_0);
    if v19 <= v25 then
        script.Parent.TextLabel.Text = "MAXED";
    else
        script.Parent.TextLabel.Text = math.floor(v25 / v19 * 100) .. "%";
    end;
    if v19 * v24 <= v25 and v20 == false then
        v20 = true;
        script.enough:Play();
        local v26 = script.ColorCorrection:Clone();
        v26.Parent = workspace.CurrentCamera;
        _G.tween(v26, {
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
        _G.destroy(v26, 2);
    elseif v25 < v19 * (v24 * 0.8) then
        v20 = false;
    end;
    if v19 * v24 <= v25 and v21 == false then
        v21 = true;
    elseif v25 < v19 * v24 then
        v21 = false;
    end;
    v17(script.Parent, v25, v19);
    if l_Character_0:FindFirstChild(l_Name_0) == nil then
        script.Parent.Visible = false;
        if l_LocalPlayer_0.Backpack:FindFirstChild(l_Name_0) == nil then
            script.Parent.Parent:Destroy();
        end;
    else
        script.Parent.Visible = true;
    end;
    task.wait();
end;