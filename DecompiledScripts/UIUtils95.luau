local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("Shared");
local l_SoundUtils_0 = require(l_Shared_0:WaitForChild("SoundUtils"));
local l_DebrisService_0 = require(l_Shared_0:WaitForChild("DebrisService"));
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "ButtonEffects";
l_ScreenGui_0.DisplayOrder = 10000000;
l_ScreenGui_0.IgnoreGuiInset = true;
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.AutoLocalize = false;
l_ScreenGui_0.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
l_ScreenGui_0:SetAttribute("unhideable", true);
l_ScreenGui_0.Parent = l_PlayerGui_0;
local v12 = {
    ButtonEffect = function() --[[ Line: 27 ]] --[[ Name: ButtonEffect ]]

    end, 
    ButtonClick = function() --[[ Line: 53 ]] --[[ Name: ButtonClick ]]
        -- upvalues: l_UserInputService_0 (copy), l_ScreenGui_0 (copy), l_SoundUtils_0 (copy), l_TweenService_0 (copy), l_DebrisService_0 (copy)
        local v9 = math.random(10, 50) / 1000;
        local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
        local v11 = script.Circle:Clone();
        v11.Position = UDim2.new(0, l_l_UserInputService_0_MouseLocation_0.X, 0, l_l_UserInputService_0_MouseLocation_0.Y);
        v11.Active = false;
        v11.Parent = l_ScreenGui_0;
        l_SoundUtils_0.PlaySound("UiTap5", {
            SoundCategory = "UI", 
            RandomPitch = true
        });
        l_TweenService_0:Create(v11, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
            ImageTransparency = 1, 
            Size = UDim2.new(v9, 15, v9, 15)
        }):Play();
        l_DebrisService_0:AddItem(v11, 0.25);
    end
};
local v13 = {
    "ContextActionGui", 
    "TouchControls", 
    "TouchUI", 
    "TouchGui"
};
local function _(v14) --[[ Line: 82 ]] --[[ Name: scan ]]
    -- upvalues: v13 (copy), v12 (copy)
    if table.find(v13, v14.Name) then
        return;
    else
        local l_v14_Descendants_0 = v14:GetDescendants();
        table.insert(l_v14_Descendants_0, v14);
        for v16 = 1, #l_v14_Descendants_0 do
            if l_v14_Descendants_0[v16]:IsA("GuiButton") and l_v14_Descendants_0[v16]:GetAttribute("clickEffect") == nil then
                l_v14_Descendants_0[v16]:SetAttribute("clickEffect", true);
                l_v14_Descendants_0[v16].MouseButton1Click:Connect(function() --[[ Line: 92 ]]
                    -- upvalues: v12 (ref)
                    v12.ButtonClick();
                end);
            end;
        end;
        return;
    end;
end;
l_UserInputService_0.InputBegan:Connect(function(v18, _) --[[ Line: 109 ]]
    -- upvalues: l_PlayerGui_0 (copy), v13 (copy), v12 (copy)
    if v18.UserInputType == Enum.UserInputType.Touch or v18.UserInputType == Enum.UserInputType.MouseButton1 then
        local l_l_PlayerGui_0_GuiObjectsAtPosition_0 = l_PlayerGui_0:GetGuiObjectsAtPosition(v18.Position.X, v18.Position.Y);
        if l_l_PlayerGui_0_GuiObjectsAtPosition_0 and #l_l_PlayerGui_0_GuiObjectsAtPosition_0 > 0 then
            for v21 = 1, #l_l_PlayerGui_0_GuiObjectsAtPosition_0 do
                if l_l_PlayerGui_0_GuiObjectsAtPosition_0[v21]:IsA("GuiButton") and l_l_PlayerGui_0_GuiObjectsAtPosition_0[v21].Interactable == true and l_l_PlayerGui_0_GuiObjectsAtPosition_0[v21].Size ~= UDim2.new(0, 0, 0, 0) then
                    local l_FirstAncestorWhichIsA_0 = l_l_PlayerGui_0_GuiObjectsAtPosition_0[v21]:FindFirstAncestorWhichIsA("ScreenGui");
                    if l_FirstAncestorWhichIsA_0 and table.find(v13, l_FirstAncestorWhichIsA_0.Name) == nil then
                        v12.ButtonClick();
                        return;
                    end;
                end;
            end;
        end;
    end;
end);
return v12;