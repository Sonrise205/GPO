return function(_) --[[ Line: 1 ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "SelectionContainer";
    l_Frame_0.Visible = false;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "Selection";
    l_Frame_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.Parent = l_Frame_0;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Name = "UIStroke";
    l_UIStroke_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
    l_UIStroke_0.Color = Color3.fromRGB(255, 255, 255);
    l_UIStroke_0.Thickness = 3;
    l_UIStroke_0.Parent = l_Frame_1;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Name = "SelectionGradient";
    l_UIGradient_0.Parent = l_UIStroke_0;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0:SetAttribute("Collective", "IconCorners");
    l_UICorner_0.Name = "UICorner";
    l_UICorner_0.CornerRadius = UDim.new(1, 0);
    l_UICorner_0.Parent = l_Frame_1;
    local l_RunService_0 = game:GetService("RunService");
    local l_GuiService_0 = game:GetService("GuiService");
    local v8 = 1;
    l_Frame_1:GetAttributeChangedSignal("RotationSpeed"):Connect(function() --[[ Line: 37 ]]
        -- upvalues: v8 (ref), l_Frame_1 (copy)
        v8 = l_Frame_1:GetAttribute("RotationSpeed");
    end);
    l_RunService_0.Heartbeat:Connect(function() --[[ Line: 40 ]]
        -- upvalues: l_GuiService_0 (copy), l_UIGradient_0 (copy), v8 (ref)
        if not l_GuiService_0.SelectedObject then
            return;
        else
            l_UIGradient_0.Rotation = os.clock() * v8 * 100 % 360;
            return;
        end;
    end);
    return l_Frame_0;
end;