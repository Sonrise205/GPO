local l_Parent_0 = script.Parent;
local l_OptionsFrame_0 = l_Parent_0:WaitForChild("Main"):WaitForChild("OptionsFrame");
local l_RemoteEvent_0 = l_Parent_0:WaitForChild("RemoteEvent");
local l_l_Parent_0_Attribute_0 = l_Parent_0:GetAttribute("isServer");
_G.hideUI(true);
local l_l_OptionsFrame_0_Children_0 = l_OptionsFrame_0:GetChildren();
for v5 = 1, #l_l_OptionsFrame_0_Children_0 do
    if l_l_OptionsFrame_0_Children_0[v5]:IsA("ImageButton") then
        l_l_OptionsFrame_0_Children_0[v5].MouseButton1Click:Connect(function() --[[ Line: 11 ]]
            -- upvalues: l_l_Parent_0_Attribute_0 (copy), l_RemoteEvent_0 (copy), l_l_OptionsFrame_0_Children_0 (copy), v5 (copy), l_Parent_0 (copy)
            if l_l_Parent_0_Attribute_0 == true then
                l_RemoteEvent_0:FireServer(l_l_OptionsFrame_0_Children_0[v5]:GetAttribute("buttonValue"));
            else
                script.Parent.clientEvent:Fire(l_l_OptionsFrame_0_Children_0[v5]:GetAttribute("buttonValue"));
            end;
            _G.hideUI(false);
            l_Parent_0:Destroy();
        end);
    end;
end;
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