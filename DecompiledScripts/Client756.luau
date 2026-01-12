local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players").LocalPlayer;
local l_Parent_0 = script.Parent;
local v3 = require(l_ReplicatedStorage_0.Modules.Client.Slider);
local l_Main_0 = l_Parent_0:WaitForChild("Main");
local l_OptionsFrame_0 = l_Main_0:WaitForChild("OptionsFrame");
local l_RemoteEvent_0 = l_Parent_0:WaitForChild("RemoteEvent");
local l_l_Parent_0_Attribute_0 = l_Parent_0:GetAttribute("isServer");
local l_clientEvent_0 = l_Parent_0:WaitForChild("clientEvent");
_G.hideUI(true);
script.Roblox_UI_Indicator:Play();
_G.tween(script.Parent.Main.UIStroke, {
    0.4, 
    Enum.EasingStyle.Sine, 
    Enum.EasingDirection.Out, 
    -1, 
    true, 
    0
}, {
    Thickness = 0
});
local l_Slider_0 = l_Main_0:WaitForChild("Slider");
local l_Bar_0 = l_Slider_0:WaitForChild("Bar");
local l_UIGradient_0 = l_Bar_0:WaitForChild("UIGradient");
local l_Value_0 = l_Slider_0:WaitForChild("Value");
local v13 = Color3.fromRGB(179, 179, 179);
local v14 = Color3.fromRGB(100, 100, 100);
local v15 = v3.new(l_Bar_0, {
    Start = l_Slider_0:GetAttribute("Start"), 
    End = l_Slider_0:GetAttribute("End"), 
    Increment = l_Slider_0:GetAttribute("Increment") or 1, 
    Default = 0
}, TweenInfo.new(0, Enum.EasingStyle.Linear), "X", 0.25);
v15:Track();
local l_l_Slider_0_Attribute_0 = l_Slider_0:GetAttribute("DisplayText");
local function v17() --[[ Line: 46 ]] --[[ Name: UpdateBarGradient ]]
    -- upvalues: l_Value_0 (copy), v15 (copy), l_l_Slider_0_Attribute_0 (copy), l_UIGradient_0 (copy), v13 (copy), v14 (copy)
    l_Value_0.Text = v15:GetValue() .. " " .. l_l_Slider_0_Attribute_0;
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v13), 
        ColorSequenceKeypoint.new(math.clamp(v15._percent + 0.001, 0.001, 0.998), v13), 
        ColorSequenceKeypoint.new(math.clamp(v15._percent + 0.002, 0.002, 0.999), v14), 
        ColorSequenceKeypoint.new(1, v14)
    });
end;
v15.Changed:Connect(function(_) --[[ Line: 56 ]]
    -- upvalues: v17 (copy)
    v17();
end);
v15.Released:Connect(function(_) --[[ Line: 61 ]]
    -- upvalues: v17 (copy)
    v17();
end);
v15.OnClick:Connect(function(_) --[[ Line: 66 ]]
    -- upvalues: v17 (copy)
    v17();
end);
v15:OverrideValue(l_Slider_0:GetAttribute("Start"));
local l_l_OptionsFrame_0_Children_0 = l_OptionsFrame_0:GetChildren();
for v22 = 1, #l_l_OptionsFrame_0_Children_0 do
    if l_l_OptionsFrame_0_Children_0[v22]:IsA("ImageButton") then
        local l_Name_0 = l_l_OptionsFrame_0_Children_0[v22].Name;
        l_l_OptionsFrame_0_Children_0[v22].MouseButton1Click:Connect(function() --[[ Line: 77 ]]
            -- upvalues: l_l_Parent_0_Attribute_0 (copy), l_Name_0 (copy), l_RemoteEvent_0 (copy), v15 (copy), l_clientEvent_0 (copy), l_Parent_0 (copy)
            if l_l_Parent_0_Attribute_0 == true then
                if l_Name_0 == "Accept" then
                    l_RemoteEvent_0:FireServer(v15:GetValue());
                else
                    l_RemoteEvent_0:FireServer(false);
                end;
            elseif l_Name_0 == "Accept" then
                l_clientEvent_0:Fire(v15:GetValue());
            else
                l_clientEvent_0:Fire(false);
            end;
            _G.hideUI(false);
            l_Parent_0:Destroy();
        end);
    end;
end;