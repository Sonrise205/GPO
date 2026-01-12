local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local _ = {};
local l_Progress_0 = script.Parent:WaitForChild("Progress");
local l_Left_0 = l_Progress_0:WaitForChild("Left");
local l_Right_0 = l_Progress_0:WaitForChild("Right");
local l_UIGradient_0 = l_Left_0:WaitForChild("Bar"):WaitForChild("UIGradient");
local l_UIGradient_1 = l_Right_0:WaitForChild("Bar"):WaitForChild("UIGradient");
l_UIGradient_0.Color = script.UIGradient.Color;
l_UIGradient_1.Color = script.UIGradient.Color;
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
local function v16(v11, v12) --[[ Line: 19 ]] --[[ Name: barchange ]]
    -- upvalues: l_UIGradient_0 (copy), l_UIGradient_1 (copy)
    v11 = math.floor(v11);
    v12 = math.floor(v12);
    if v11 < 0 then
        v11 = 0;
    end;
    local v13 = v11 / v12;
    local _ = math.clamp(v13 * 100 * 3.6, 0, 360);
    local v15 = math.clamp(v13 * 360, 0, 360);
    l_UIGradient_0.Rotation = math.clamp(v15, 180, 360);
    l_UIGradient_1.Rotation = math.clamp(v15, 0, 180);
    l_UIGradient_0.Offset = Vector2.new(0.01, 0);
    l_UIGradient_1.Offset = Vector2.new(-0.01, 0);
end;
local l_Value_0 = script.tool.Value;
local v18 = 0;
local v19 = false;
local v20 = false;
local l_Name_0 = l_Value_0.Name;
local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("damageName");
local v23 = l_Value_0:GetAttribute("modePercent") or 1;
local l_TouchGui_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("TouchGui");
local function _(v25) --[[ Line: 68 ]] --[[ Name: EnableGui ]]
    if script.Parent ~= nil then
        script.Parent.Enabled = v25;
    end;
end;
while script.Parent ~= nil do
    local v27 = 0;
    if l_Character_0:GetAttribute(l_l_Value_0_Attribute_0) then
        v27 = math.ceil((l_Character_0:GetAttribute(l_l_Value_0_Attribute_0)));
    end;
    v18 = require(game.ReplicatedStorage.Modules.Skills.Modes:FindFirstChild(_G.modeBarModuleNames(l_Name_0)))(l_LocalPlayer_0);
    if v18 * v23 <= v27 and v19 == false then
        v19 = true;
        script.enough:Play();
        local v28 = script.ColorCorrection:Clone();
        v28.Parent = workspace.CurrentCamera;
        _G.tween(v28, {
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
        _G.destroy(v28, 2);
    elseif v27 < v18 * (v23 * 0.8) then
        v19 = false;
    end;
    if v18 * v23 <= v27 and v20 == false then
        v20 = true;
    elseif v27 < v18 * v23 then
        v20 = false;
    end;
    v16(v27, v18);
    if l_Character_0:FindFirstChild(l_Name_0) == nil then
        if script.Parent ~= nil then
            script.Parent.Enabled = false;
        end;
        if l_LocalPlayer_0.Backpack:FindFirstChild(l_Name_0) == nil then
            script.Parent:Destroy();
        end;
    elseif l_TouchGui_0.Enabled == true then
        if script.Parent ~= nil then
            script.Parent.Enabled = true;
        end;
        script.Parent.Enabled = true;
    end;
    if l_TouchGui_0.Enabled == false and script.Parent ~= nil then
        script.Parent.Enabled = false;
    end;
    task.wait();
end;