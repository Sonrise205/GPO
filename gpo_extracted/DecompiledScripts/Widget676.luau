return function(v0, v1) --[[ Line: 6 ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0:SetAttribute("WidgetUID", v0.UID);
    l_Frame_0.Name = "Widget";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Visible = true;
    l_Frame_0.ZIndex = 20;
    l_Frame_0.Active = false;
    l_Frame_0.ClipsDescendants = true;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "IconButton";
    l_Frame_1.Visible = true;
    l_Frame_1.ZIndex = 2;
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.Parent = l_Frame_0;
    l_Frame_1.ClipsDescendants = true;
    l_Frame_1.Active = false;
    v0.deselected:Connect(function() --[[ Line: 25 ]]
        -- upvalues: l_Frame_1 (copy), v0 (copy)
        l_Frame_1.ClipsDescendants = true;
        task.delay(0.2, function() --[[ Line: 27 ]]
            -- upvalues: v0 (ref), l_Frame_1 (ref)
            if v0.isSelected then
                l_Frame_1.ClipsDescendants = false;
            end;
        end);
    end);
    local l_GuiService_0 = game:GetService("GuiService");
    v0:setBehaviour("IconButton", "BackgroundTransparency", function(v5) --[[ Line: 36 ]]
        -- upvalues: l_GuiService_0 (copy)
        local v6 = v5 * l_GuiService_0.PreferredTransparency;
        if v5 == 1 then
            return v5;
        else
            return v6;
        end;
    end);
    v0.janitor:add(l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 44 ]]
        -- upvalues: v0 (copy), l_Frame_1 (copy)
        v0:refreshAppearance(l_Frame_1, "BackgroundTransparency");
    end));
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0:SetAttribute("Collective", "IconCorners");
    l_UICorner_0.Name = "UICorner";
    l_UICorner_0.Parent = l_Frame_1;
    local v8 = require(script.Parent.Menu)(v0);
    local l_MenuUIListLayout_0 = v8.MenuUIListLayout;
    local l_MenuGap_0 = v8.MenuGap;
    v8.Parent = l_Frame_1;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "IconSpot";
    l_Frame_2.BackgroundColor3 = Color3.fromRGB(225, 225, 225);
    l_Frame_2.BackgroundTransparency = 0.9;
    l_Frame_2.Visible = true;
    l_Frame_2.AnchorPoint = Vector2.new(0, 0.5);
    l_Frame_2.ZIndex = 5;
    l_Frame_2.Parent = v8;
    l_UICorner_0:Clone().Parent = l_Frame_2;
    local v12 = l_Frame_2:Clone();
    v12.UICorner.Name = "OverlayUICorner";
    v12.Name = "IconOverlay";
    v12.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    v12.ZIndex = l_Frame_2.ZIndex + 1;
    v12.Size = UDim2.new(1, 0, 1, 0);
    v12.Position = UDim2.new(0, 0, 0, 0);
    v12.AnchorPoint = Vector2.new(0, 0);
    v12.Visible = false;
    v12.Parent = l_Frame_2;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0:SetAttribute("CorrespondingIconUID", v0.UID);
    l_TextButton_0.Name = "ClickRegion";
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Visible = true;
    l_TextButton_0.Text = "";
    l_TextButton_0.ZIndex = 20;
    l_TextButton_0.Selectable = true;
    l_TextButton_0.SelectionGroup = true;
    l_TextButton_0.Parent = l_Frame_2;
    require(script.Parent.Parent.Features.Gamepad).registerButton(l_TextButton_0);
    l_UICorner_0:Clone().Parent = l_TextButton_0;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "Contents";
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.Size = UDim2.fromScale(1, 1);
    l_Frame_3.Parent = l_Frame_2;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Name = "ContentsList";
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly;
    l_UIListLayout_0.Padding = UDim.new(0, 3);
    l_UIListLayout_0.Parent = l_Frame_3;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Name = "PaddingLeft";
    l_Frame_4.LayoutOrder = 1;
    l_Frame_4.ZIndex = 5;
    l_Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.BorderSizePixel = 0;
    l_Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_4.Parent = l_Frame_3;
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Name = "PaddingCenter";
    l_Frame_5.LayoutOrder = 3;
    l_Frame_5.ZIndex = 5;
    l_Frame_5.Size = UDim2.new(0, 0, 1, 0);
    l_Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_5.BackgroundTransparency = 1;
    l_Frame_5.BorderSizePixel = 0;
    l_Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_5.Parent = l_Frame_3;
    local l_Frame_6 = Instance.new("Frame");
    l_Frame_6.Name = "PaddingRight";
    l_Frame_6.LayoutOrder = 5;
    l_Frame_6.ZIndex = 5;
    l_Frame_6.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_6.BackgroundTransparency = 1;
    l_Frame_6.BorderSizePixel = 0;
    l_Frame_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_6.Parent = l_Frame_3;
    local l_Frame_7 = Instance.new("Frame");
    l_Frame_7.Name = "IconLabelContainer";
    l_Frame_7.LayoutOrder = 4;
    l_Frame_7.ZIndex = 3;
    l_Frame_7.AnchorPoint = Vector2.new(0, 0.5);
    l_Frame_7.Size = UDim2.new(0, 0, 0.5, 0);
    l_Frame_7.BackgroundTransparency = 1;
    l_Frame_7.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_7.Parent = l_Frame_3;
    local l_TextLabel_0 = Instance.new("TextLabel");
    local v21 = workspace.CurrentCamera.ViewportSize.X + 200;
    l_TextLabel_0.Name = "IconLabel";
    l_TextLabel_0.LayoutOrder = 4;
    l_TextLabel_0.ZIndex = 15;
    l_TextLabel_0.AnchorPoint = Vector2.new(0, 0);
    l_TextLabel_0.Size = UDim2.new(0, v21, 1, 0);
    l_TextLabel_0.ClipsDescendants = false;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Position = UDim2.fromScale(0, 0);
    l_TextLabel_0.RichText = true;
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.Text = "";
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.TextWrap = true;
    l_TextLabel_0.TextScaled = false;
    l_TextLabel_0.Active = false;
    l_TextLabel_0.AutoLocalize = true;
    l_TextLabel_0.Parent = l_Frame_7;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "IconImage";
    l_ImageLabel_0.LayoutOrder = 2;
    l_ImageLabel_0.ZIndex = 15;
    l_ImageLabel_0.AnchorPoint = Vector2.new(0, 0.5);
    l_ImageLabel_0.Size = UDim2.new(0, 0, 0.5, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Position = UDim2.new(0, 11, 0.5, 0);
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Stretch;
    l_ImageLabel_0.Active = false;
    l_ImageLabel_0.Parent = l_Frame_3;
    local v23 = l_UICorner_0:Clone();
    v23:SetAttribute("Collective", nil);
    v23.CornerRadius = UDim.new(0, 0);
    v23.Name = "IconImageCorner";
    v23.Parent = l_ImageLabel_0;
    local l_TweenService_0 = game:GetService("TweenService");
    local v25 = 0;
    local function v63(_) --[[ Line: 195 ]] --[[ Name: handleLabelAndImageChangesUnstaggered ]]
        -- upvalues: v0 (copy), l_TextLabel_0 (copy), l_ImageLabel_0 (copy), l_Frame_7 (copy), l_Frame_4 (copy), l_Frame_5 (copy), l_Frame_6 (copy), l_Frame_1 (copy), l_UIListLayout_0 (copy), l_Frame_3 (copy), l_Frame_0 (copy), v21 (copy), v8 (copy), l_Frame_2 (copy), l_MenuUIListLayout_0 (copy), l_MenuGap_0 (copy), l_TweenService_0 (copy), l_TextButton_0 (copy), v25 (ref), v1 (copy)
        task.defer(function() --[[ Line: 202 ]]
            -- upvalues: v0 (ref), l_TextLabel_0 (ref), l_ImageLabel_0 (ref), l_Frame_7 (ref), l_Frame_4 (ref), l_Frame_5 (ref), l_Frame_6 (ref), l_Frame_1 (ref), l_UIListLayout_0 (ref), l_Frame_3 (ref), l_Frame_0 (ref), v21 (ref), v8 (ref), l_Frame_2 (ref), l_MenuUIListLayout_0 (ref), l_MenuGap_0 (ref), l_TweenService_0 (ref), l_TextButton_0 (ref), v25 (ref), v1 (ref)
            local l_indicator_0 = v0.indicator;
            local v28 = l_indicator_0 and l_indicator_0.Visible;
            local v29 = v28 or l_TextLabel_0.Text ~= "";
            local v30 = false;
            if l_ImageLabel_0.Image ~= "" then
                v30 = l_ImageLabel_0.Image ~= nil;
            end;
            local l_Center_0 = Enum.HorizontalAlignment.Center;
            local v32 = UDim2.fromScale(1, 1);
            if v30 and not v29 then
                l_Frame_7.Visible = false;
                l_ImageLabel_0.Visible = true;
                l_Frame_4.Visible = false;
                l_Frame_5.Visible = false;
                l_Frame_6.Visible = false;
            elseif not v30 and v29 then
                l_Frame_7.Visible = true;
                l_ImageLabel_0.Visible = false;
                l_Frame_4.Visible = true;
                l_Frame_5.Visible = false;
                l_Frame_6.Visible = true;
            elseif v30 and v29 then
                l_Frame_7.Visible = true;
                l_ImageLabel_0.Visible = true;
                l_Frame_4.Visible = true;
                l_Frame_5.Visible = not v28;
                l_Frame_6.Visible = not v28;
                l_Center_0 = Enum.HorizontalAlignment.Left;
            end;
            l_Frame_1.Size = v32;
            local function _(v33) --[[ Line: 232 ]] --[[ Name: getItemWidth ]]
                return v33:GetAttribute("TargetWidth") or v33.AbsoluteSize.X;
            end;
            local l_Offset_0 = l_UIListLayout_0.Padding.Offset;
            local l_l_Offset_0_0 = l_Offset_0;
            local l_X_0 = l_TextLabel_0.TextBounds.X;
            l_Frame_7.Size = UDim2.new(0, l_X_0, l_TextLabel_0.Size.Y.Scale, 0);
            for _, v39 in pairs(l_Frame_3:GetChildren()) do
                if v39:IsA("GuiObject") and v39.Visible == true then
                    l_l_Offset_0_0 = l_l_Offset_0_0 + ((v39:GetAttribute("TargetWidth") or v39.AbsoluteSize.X) + l_Offset_0);
                end;
            end;
            local l_l_Frame_0_Attribute_0 = l_Frame_0:GetAttribute("MinimumWidth");
            local l_l_Frame_0_Attribute_1 = l_Frame_0:GetAttribute("MinimumHeight");
            local l_l_Frame_0_Attribute_2 = l_Frame_0:GetAttribute("BorderSize");
            local v43 = math.clamp(l_l_Offset_0_0, l_l_Frame_0_Attribute_0, v21);
            local l_menuIcons_0 = v0.menuIcons;
            local v45 = 0;
            local v46 = #l_menuIcons_0 > 0 and v0.isSelected;
            if v46 then
                for _, v48 in pairs(v8:GetChildren()) do
                    if v48 ~= l_Frame_2 and v48:IsA("GuiObject") and v48.Visible then
                        v45 = v45 + ((v48:GetAttribute("TargetWidth") or v48.AbsoluteSize.X) + l_MenuUIListLayout_0.Padding.Offset);
                    end;
                end;
                if not l_Frame_2.Visible then
                    local l_l_Frame_2_0 = l_Frame_2;
                    v43 = v43 - ((l_l_Frame_2_0:GetAttribute("TargetWidth") or l_l_Frame_2_0.AbsoluteSize.X) + l_MenuUIListLayout_0.Padding.Offset * 2 + l_l_Frame_0_Attribute_2);
                end;
                v45 = v45 - l_l_Frame_0_Attribute_2 * 0.5;
                v43 = v43 + (v45 - l_l_Frame_0_Attribute_2 * 0.75);
            end;
            l_MenuGap_0.Visible = v46 and l_Frame_2.Visible;
            local l_l_Frame_0_Attribute_3 = l_Frame_0:GetAttribute("DesiredWidth");
            if l_l_Frame_0_Attribute_3 and v43 < l_l_Frame_0_Attribute_3 then
                v43 = l_l_Frame_0_Attribute_3;
            end;
            v0.updateMenu:Fire();
            local v51 = math.max(v43 - v45, l_l_Frame_0_Attribute_0) - l_l_Frame_0_Attribute_2 * 2;
            local l_v8_Attribute_0 = v8:GetAttribute("MenuWidth");
            local v53 = l_v8_Attribute_0 and l_v8_Attribute_0 + v51 + l_MenuUIListLayout_0.Padding.Offset + 10;
            if v53 then
                local l_v8_Attribute_1 = v8:GetAttribute("MaxWidth");
                if l_v8_Attribute_1 then
                    v53 = math.max(l_v8_Attribute_1, l_l_Frame_0_Attribute_0);
                end;
                v8:SetAttribute("MenuCanvasWidth", v43);
                if v53 < v43 then
                    v43 = v53;
                end;
            end;
            local l_Quint_0 = Enum.EasingStyle.Quint;
            local l_Out_0 = Enum.EasingDirection.Out;
            local l_l_Frame_2_1 = l_Frame_2;
            local v58 = math.max(v51, l_l_Frame_2_1:GetAttribute("TargetWidth") or l_l_Frame_2_1.AbsoluteSize.X, l_Frame_2.AbsoluteSize.X);
            local l_l_Frame_0_0 = l_Frame_0;
            local v60 = math.max(v43, l_l_Frame_0_0:GetAttribute("TargetWidth") or l_l_Frame_0_0.AbsoluteSize.X, l_Frame_0.AbsoluteSize.X);
            local v61 = TweenInfo.new(v58 / 750, l_Quint_0, l_Out_0);
            l_l_Frame_2_1 = TweenInfo.new(v60 / 750, l_Quint_0, l_Out_0);
            l_TweenService_0:Create(l_Frame_2, v61, {
                Position = UDim2.new(0, l_l_Frame_0_Attribute_2, 0.5, 0), 
                Size = UDim2.new(0, v51, 1, -l_l_Frame_0_Attribute_2 * 2)
            }):Play();
            l_TweenService_0:Create(l_TextButton_0, v61, {
                Size = UDim2.new(0, v51, 1, 0)
            }):Play();
            l_l_Frame_0_0 = UDim2.fromOffset(v43, l_l_Frame_0_Attribute_1);
            if l_Frame_0.Size.Y.Offset ~= l_l_Frame_0_Attribute_1 then
                l_Frame_0.Size = l_l_Frame_0_0;
            end;
            l_Frame_0:SetAttribute("TargetWidth", l_l_Frame_0_0.X.Offset);
            l_TweenService_0:Create(l_Frame_0, l_l_Frame_2_1, {
                Size = l_l_Frame_0_0
            }):Play();
            v25 = v25 + 1;
            for v62 = 1, l_l_Frame_2_1.Time * 100 do
                task.delay(v62 / 100, function() --[[ Line: 314 ]]
                    -- upvalues: v1 (ref), v0 (ref)
                    v1.iconChanged:Fire(v0);
                end);
            end;
            task.delay(l_l_Frame_2_1.Time - 0.2, function() --[[ Line: 318 ]]
                -- upvalues: v25 (ref), v0 (ref)
                v25 = v25 - 1;
                task.defer(function() --[[ Line: 320 ]]
                    -- upvalues: v25 (ref), v0 (ref)
                    if v25 == 0 then
                        v0.resizingComplete:Fire();
                    end;
                end);
            end);
            v0:updateParent();
        end);
    end;
    local v64 = require(script.Parent.Parent.Utility).createStagger(0.01, v63);
    local v65 = true;
    v0:setBehaviour("IconLabel", "Text", v64);
    v0:setBehaviour("IconLabel", "FontFace", function(v66) --[[ Line: 333 ]]
        -- upvalues: l_TextLabel_0 (copy), v64 (copy), v65 (ref)
        if l_TextLabel_0.FontFace == v66 then
            return;
        else
            task.spawn(function() --[[ Line: 338 ]]
                -- upvalues: v64 (ref), v65 (ref)
                v64();
                if v65 then
                    v65 = false;
                    for _ = 1, 10 do
                        task.wait(1);
                        v64();
                    end;
                end;
            end);
            return;
        end;
    end);
    local function v71() --[[ Line: 360 ]] --[[ Name: updateBorderSize ]]
        -- upvalues: l_Frame_0 (copy), v0 (copy), l_Frame_2 (copy), v8 (copy), l_MenuGap_0 (copy), l_MenuUIListLayout_0 (copy), v64 (copy)
        task.defer(function() --[[ Line: 361 ]]
            -- upvalues: l_Frame_0 (ref), v0 (ref), l_Frame_2 (ref), v8 (ref), l_MenuGap_0 (ref), l_MenuUIListLayout_0 (ref), v64 (ref)
            local l_l_Frame_0_Attribute_4 = l_Frame_0:GetAttribute("BorderSize");
            local l_alignment_0 = v0.alignment;
            local v70 = l_Frame_2.Visible == false and 0 or l_alignment_0 == "Right" and -l_l_Frame_0_Attribute_4 or l_l_Frame_0_Attribute_4;
            v8.Position = UDim2.new(0, v70, 0, 0);
            l_MenuGap_0.Size = UDim2.fromOffset(l_l_Frame_0_Attribute_4, 0);
            l_MenuUIListLayout_0.Padding = UDim.new(0, 0);
            v64();
        end);
    end;
    v0:setBehaviour("Widget", "BorderSize", v71);
    v0:setBehaviour("IconSpot", "Visible", v71);
    v0.startMenuUpdate:Connect(v64);
    v0.updateSize:Connect(v64);
    v0:setBehaviour("ContentsList", "HorizontalAlignment", v64);
    v0:setBehaviour("Widget", "Visible", v64);
    v0:setBehaviour("Widget", "DesiredWidth", v64);
    v0:setBehaviour("Widget", "MinimumWidth", v64);
    v0:setBehaviour("Widget", "MinimumHeight", v64);
    v0:setBehaviour("Indicator", "Visible", v64);
    v0:setBehaviour("IconImageRatio", "AspectRatio", v64);
    v0:setBehaviour("IconImage", "Image", function(v72) --[[ Line: 382 ]]
        -- upvalues: l_ImageLabel_0 (copy), v64 (copy)
        local v73 = tonumber(v72) and "http://www.roblox.com/asset/?id=" .. v72 or v72 or "";
        if l_ImageLabel_0.Image ~= v73 then
            v64();
        end;
        return v73;
    end);
    v0.alignmentChanged:Connect(function(v74) --[[ Line: 389 ]]
        -- upvalues: l_MenuUIListLayout_0 (copy), l_Frame_0 (copy), v0 (copy), l_Frame_2 (copy), v8 (copy), l_MenuGap_0 (copy), v64 (copy)
        if v74 == "Center" then
            v74 = "Left";
        end;
        l_MenuUIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment[v74];
        task.defer(function() --[[ Line: 361 ]]
            -- upvalues: l_Frame_0 (ref), v0 (ref), l_Frame_2 (ref), v8 (ref), l_MenuGap_0 (ref), l_MenuUIListLayout_0 (ref), v64 (ref)
            local l_l_Frame_0_Attribute_5 = l_Frame_0:GetAttribute("BorderSize");
            local l_alignment_1 = v0.alignment;
            local v77 = l_Frame_2.Visible == false and 0 or l_alignment_1 == "Right" and -l_l_Frame_0_Attribute_5 or l_l_Frame_0_Attribute_5;
            v8.Position = UDim2.new(0, v77, 0, 0);
            l_MenuGap_0.Size = UDim2.fromOffset(l_l_Frame_0_Attribute_5, 0);
            l_MenuUIListLayout_0.Padding = UDim.new(0, 0);
            v64();
        end);
    end);
    local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
    local l_LocaleId_0 = l_LocalPlayer_0.LocaleId;
    v0.janitor:add(l_LocalPlayer_0:GetPropertyChangedSignal("LocaleId"):Connect(function() --[[ Line: 401 ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_LocaleId_0 (ref), v0 (copy)
        task.delay(0.2, function() --[[ Line: 402 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_LocaleId_0 (ref), v0 (ref)
            local l_LocaleId_1 = l_LocalPlayer_0.LocaleId;
            if l_LocaleId_1 ~= l_LocaleId_0 then
                l_LocaleId_0 = l_LocaleId_1;
                v0:refresh();
                task.wait(0.5);
                v0:refresh();
            end;
        end);
    end));
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "IconImageScale";
    l_NumberValue_0.Parent = l_ImageLabel_0;
    l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 416 ]]
        -- upvalues: l_ImageLabel_0 (copy), l_NumberValue_0 (copy)
        l_ImageLabel_0.Size = UDim2.new(l_NumberValue_0.Value, 0, l_NumberValue_0.Value, 0);
    end);
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.Name = "IconImageRatio";
    l_UIAspectRatioConstraint_0.AspectType = Enum.AspectType.FitWithinMaxSize;
    l_UIAspectRatioConstraint_0.DominantAxis = Enum.DominantAxis.Height;
    l_UIAspectRatioConstraint_0.Parent = l_ImageLabel_0;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Name = "IconGradient";
    l_UIGradient_0.Enabled = true;
    l_UIGradient_0.Parent = l_Frame_1;
    local l_UIGradient_1 = Instance.new("UIGradient");
    l_UIGradient_1.Name = "IconSpotGradient";
    l_UIGradient_1.Enabled = true;
    l_UIGradient_1.Parent = l_Frame_2;
    return l_Frame_0;
end;