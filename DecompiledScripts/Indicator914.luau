return function(v0, _) --[[ Line: 1 ]]
    local l_widget_0 = v0.widget;
    local v3 = v0:getInstance("Contents");
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Indicator";
    l_Frame_0.LayoutOrder = 9999999;
    l_Frame_0.ZIndex = 6;
    l_Frame_0.Size = UDim2.new(0, 42, 0, 42);
    l_Frame_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Position = UDim2.new(1, 0, 0.5, 0);
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.Parent = v3;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "IndicatorButton";
    l_Frame_1.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_1.Parent = l_Frame_0;
    local l_GuiService_0 = game:GetService("GuiService");
    local l_GamepadService_0 = game:GetService("GamepadService");
    local v8 = v0:getInstance("ClickRegion");
    local function v9() --[[ Line: 28 ]] --[[ Name: selectionChanged ]]
        -- upvalues: l_GuiService_0 (copy), v8 (copy), l_Frame_1 (copy)
        if l_GuiService_0.SelectedObject == v8 then
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.Position = UDim2.new(0.5, -2, 0.5, 0);
            l_Frame_1.Size = UDim2.fromScale(1.2, 1.2);
            return;
        else
            l_Frame_1.BackgroundTransparency = 0.75;
            l_Frame_1.Position = UDim2.new(0.5, 2, 0.5, 0);
            l_Frame_1.Size = UDim2.fromScale(1, 1);
            return;
        end;
    end;
    v0.janitor:add(l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v9));
    v9();
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.LayoutOrder = 2;
    l_ImageLabel_0.ZIndex = 15;
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Size = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/XboxController/DPadUp@2x.png";
    l_ImageLabel_0.Parent = l_Frame_1;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(1, 0);
    l_UICorner_0.Parent = l_Frame_1;
    local l_UserInputService_0 = game:GetService("UserInputService");
    local function v14(v13) --[[ Line: 58 ]] --[[ Name: setIndicatorVisible ]]
        -- upvalues: l_Frame_0 (copy), l_GamepadService_0 (copy), v0 (copy)
        if v13 == nil then
            v13 = l_Frame_0.Visible;
        end;
        if l_GamepadService_0.GamepadCursorEnabled then
            v13 = false;
        end;
        if v13 then
            v0:modifyTheme({
                "PaddingRight", 
                "Size", 
                UDim2.new(0, 0, 1, 0)
            }, "IndicatorPadding");
        elseif l_Frame_0.Visible then
            v0:removeModification("IndicatorPadding");
        end;
        v0:modifyTheme({
            "Indicator", 
            "Visible", 
            v13
        });
        v0.updateSize:Fire();
    end;
    v0.janitor:add(l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(v14));
    v0.indicatorSet:Connect(function(v15) --[[ Line: 74 ]]
        -- upvalues: l_ImageLabel_0 (copy), l_UserInputService_0 (copy), v14 (copy)
        local v16 = false;
        if v15 then
            l_ImageLabel_0.Image = l_UserInputService_0:GetImageForKeyCode(v15);
            v16 = true;
        end;
        v14(v16);
    end);
    l_widget_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 83 ]] --[[ Name: updateSize ]]
        -- upvalues: l_widget_0 (copy), l_Frame_0 (copy)
        local v17 = l_widget_0.AbsoluteSize.Y * 0.96;
        l_Frame_0.Size = UDim2.new(0, v17, 0, v17);
    end);
    local v18 = l_widget_0.AbsoluteSize.Y * 0.96;
    l_Frame_0.Size = UDim2.new(0, v18, 0, v18);
    return l_Frame_0;
end;