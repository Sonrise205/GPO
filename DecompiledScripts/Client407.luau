local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Modules.MEnterLeave);
local l_Parent_0 = script.Parent;
local l_Main_0 = l_Parent_0:WaitForChild("Main");
local l_Main2_0 = l_Parent_0:WaitForChild("Main2");
local l_OptionsFrame_0 = l_Main_0:WaitForChild("OptionsFrame");
local l_RemoteEvent_0 = l_Parent_0:WaitForChild("RemoteEvent");
local l_l_Parent_0_Attribute_0 = l_Parent_0:GetAttribute("isServer");
_G.hideUI(true);
local l_l_OptionsFrame_0_Children_0 = l_OptionsFrame_0:GetChildren();
for v10 = 1, #l_l_OptionsFrame_0_Children_0 do
    if l_l_OptionsFrame_0_Children_0[v10]:IsA("ImageButton") then
        l_l_OptionsFrame_0_Children_0[v10].MouseButton1Click:Connect(function() --[[ Line: 19 ]]
            -- upvalues: l_l_Parent_0_Attribute_0 (copy), l_RemoteEvent_0 (copy), l_l_OptionsFrame_0_Children_0 (copy), v10 (copy), l_Parent_0 (copy)
            if l_l_Parent_0_Attribute_0 == true then
                l_RemoteEvent_0:FireServer(l_l_OptionsFrame_0_Children_0[v10]:GetAttribute("buttonValue"));
            else
                script.Parent.clientEvent:Fire(l_l_OptionsFrame_0_Children_0[v10]:GetAttribute("buttonValue"));
            end;
            _G.hideUI(false);
            l_Parent_0:Destroy();
        end);
    end;
end;
local function v19() --[[ Line: 31 ]] --[[ Name: updateBackground ]]
    -- upvalues: l_OptionsFrame_0 (copy), l_Main_0 (copy), l_GuiService_0 (copy), l_Main2_0 (copy)
    local l_AbsoluteContentSize_0 = l_OptionsFrame_0.UIListLayout.AbsoluteContentSize;
    local l_AbsolutePosition_0 = l_Main_0.AbsolutePosition;
    local l_AbsoluteSize_0 = l_Main_0.AbsoluteSize;
    local l_l_GuiService_0_GuiInset_0, v15 = l_GuiService_0:GetGuiInset();
    local v16 = l_AbsolutePosition_0 + (l_l_GuiService_0_GuiInset_0 - v15) + l_AbsoluteSize_0 / 2;
    local v17 = math.max(l_AbsoluteSize_0.Y, l_AbsoluteContentSize_0.Y + l_AbsoluteSize_0.Y - l_OptionsFrame_0.AbsoluteSize.Y);
    local v18 = (v17 - l_AbsoluteSize_0.Y) / 2;
    l_Main2_0.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, v17);
    l_Main2_0.Position = UDim2.new(0, v16.X, 0, v16.Y + v18);
end;
v19();
script.Roblox_UI_Indicator:Play();
_G.tween(l_Main2_0.UIStroke, {
    0.4, 
    Enum.EasingStyle.Sine, 
    Enum.EasingDirection.Out, 
    -1, 
    true, 
    0
}, {
    Thickness = 0
});
l_Parent_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v19);