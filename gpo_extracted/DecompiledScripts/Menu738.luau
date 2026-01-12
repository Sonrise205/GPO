local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v3 = false;
    local v4 = nil;
    local v5 = {};
    local function v11(v6) --[[ Line: 8 ]] --[[ Name: EmptyMenuStack ]]
        -- upvalues: v5 (copy), v1 (copy), v3 (ref), v4 (ref)
        local v7 = #v5;
        local v8 = v6 and v6 + 1 or 1;
        for v9 = v7, v8, -1 do
            local v10 = v5[v9];
            v10.state.isOpened:set(false);
            v10.Instance.BackgroundColor3 = v1._config.HeaderColor;
            v10.Instance.BackgroundTransparency = 1;
            table.remove(v5, v9);
        end;
        if #v5 == 0 then
            v3 = false;
            v4 = nil;
        end;
    end;
    local function v23(v12) --[[ Line: 25 ]] --[[ Name: UpdateChildContainerTransform ]]
        -- upvalues: v1 (copy)
        local v13 = v12.parentWidget.type == "Menu";
        local l_Instance_0 = v12.Instance;
        local l_ChildContainer_0 = v12.ChildContainer;
        l_ChildContainer_0.Size = UDim2.fromOffset(math.max(l_ChildContainer_0.AbsoluteSize.X, l_Instance_0.AbsoluteSize.X), (math.max(l_ChildContainer_0.AbsoluteSize.Y, l_Instance_0.AbsoluteSize.Y)));
        if l_ChildContainer_0.Parent == nil then
            return;
        else
            local l_AbsolutePosition_0 = l_Instance_0.AbsolutePosition;
            local l_AbsoluteSize_0 = l_Instance_0.AbsoluteSize;
            local l_AbsoluteSize_1 = l_ChildContainer_0.AbsoluteSize;
            local l_PopupBorderSize_0 = v1._config.PopupBorderSize;
            local l_AbsoluteSize_2 = l_ChildContainer_0.Parent.AbsoluteSize;
            local v21 = l_AbsolutePosition_0.X + l_PopupBorderSize_0;
            local v22 = nil;
            if v12.parentWidget.type == "Menu" then
                v21 = if l_AbsolutePosition_0.X + l_AbsoluteSize_1.X > l_AbsoluteSize_2.X then l_AbsolutePosition_0.X - l_PopupBorderSize_0 - (v13 and l_AbsoluteSize_1.X or 0) else l_AbsolutePosition_0.X + l_PopupBorderSize_0 + (v13 and l_AbsoluteSize_0.X or 0);
            end;
            v22 = if l_AbsolutePosition_0.Y + l_AbsoluteSize_1.Y > l_AbsoluteSize_2.Y then l_AbsolutePosition_0.Y - l_PopupBorderSize_0 - l_AbsoluteSize_1.Y + (v13 and l_AbsoluteSize_0.Y or 0) else l_AbsolutePosition_0.Y + l_PopupBorderSize_0 + (v13 and 0 or l_AbsoluteSize_0.Y);
            l_ChildContainer_0.Position = UDim2.fromOffset(v21, v22);
            return;
        end;
    end;
    v2.UserInputService.InputBegan:Connect(function(v24) --[[ Line: 62 ]]
        -- upvalues: v3 (ref), v4 (ref), v2 (copy), v5 (copy), v11 (copy)
        if v24.UserInputType ~= Enum.UserInputType.MouseButton1 and v24.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return;
        elseif v3 == false then
            return;
        elseif v4 == nil then
            return;
        else
            local v25 = false;
            local v26 = v2.getMouseLocation();
            for _, v28 in v5 do
                for _, v30 in {
                    v28.ChildContainer, 
                    v28.Instance
                } do
                    local l_AbsolutePosition_1 = v30.AbsolutePosition;
                    local v32 = l_AbsolutePosition_1 + v30.AbsoluteSize;
                    if v2.isPosInsideRect(v26, l_AbsolutePosition_1, v32) then
                        v25 = true;
                        break;
                    end;
                end;
            end;
            if not v25 then
                v11();
            end;
            return;
        end;
    end);
    v1.WidgetConstructor("MenuBar", {
        hasState = false, 
        hasChildren = true, 
        Args = {}, 
        Events = {}, 
        Generate = function(v33) --[[ Line: 97 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "MenuBar";
            l_Frame_0.Size = UDim2.fromScale(1, 0);
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.BackgroundColor3 = v1._config.MenubarBgColor;
            l_Frame_0.BackgroundTransparency = v1._config.MenubarBgTransparency;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.ZIndex = v33.ZIndex;
            l_Frame_0.LayoutOrder = v33.ZIndex;
            l_Frame_0.ClipsDescendants = true;
            v2.UIPadding(l_Frame_0, Vector2.new(v1._config.ItemSpacing.X, 2));
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Horizontal, UDim.new()).VerticalAlignment = Enum.VerticalAlignment.Center;
            return l_Frame_0;
        end, 
        Update = function(v35) --[[ Line: 114 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_parentWidget_0 = v35.parentWidget;
            if l_parentWidget_0.type == "Window" then
                local v37 = l_parentWidget_0.Instance and l_parentWidget_0.Instance:FindFirstChild("WindowButton");
                if v37 then
                    v35.Instance.Parent = v37;
                    local v38 = #v1._postCycleCallbacks + 1;
                    local v39 = v1._cycleTick + 1;
                    v1._postCycleCallbacks[v38] = function() --[[ Line: 125 ]]
                        -- upvalues: v1 (ref), v39 (copy), l_parentWidget_0 (copy), v38 (copy)
                        if v1._cycleTick == v39 then
                            v1._widgets.Window.Update(l_parentWidget_0);
                            v1._postCycleCallbacks[v38] = nil;
                        end;
                    end;
                end;
                return;
            elseif l_parentWidget_0.type == "Root" then
                return;
            else
                error("The MenuBar was not created directly under a window or root.");
                return;
            end;
        end, 
        ChildAdded = function(v40) --[[ Line: 139 ]] --[[ Name: ChildAdded ]]
            return v40.Instance;
        end, 
        Discard = function(v41) --[[ Line: 142 ]] --[[ Name: Discard ]]
            -- upvalues: v1 (copy)
            local l_parentWidget_1 = v41.parentWidget;
            v41.Instance:Destroy();
            v1._widgets.Window.Update(l_parentWidget_1);
        end
    });
    v1.WidgetConstructor("Menu", {
        hasState = true, 
        hasChildren = true, 
        Args = {
            Text = 1
        }, 
        Events = {
            clicked = v2.EVENTS.click(function(v43) --[[ Line: 157 ]]
                return v43.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v44) --[[ Line: 160 ]]
                return v44.Instance;
            end), 
            opened = {
                Init = function(_) --[[ Line: 164 ]]

                end, 
                Get = function(v46) --[[ Line: 165 ]]
                    -- upvalues: v1 (copy)
                    return v46.lastOpenedTick == v1._cycleTick;
                end
            }, 
            closed = {
                Init = function(_) --[[ Line: 170 ]]

                end, 
                Get = function(v48) --[[ Line: 171 ]]
                    -- upvalues: v1 (copy)
                    return v48.lastClosedTick == v1._cycleTick;
                end
            }
        }, 
        Generate = function(v49) --[[ Line: 176 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy), v5 (copy), v3 (ref), v4 (ref), v11 (copy)
            local v50 = nil;
            v49.ButtonColors = {
                ButtonColor = v1._config.HeaderColor, 
                ButtonTransparency = 1, 
                ButtonHoveredColor = v1._config.HeaderHoveredColor, 
                ButtonHoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ButtonActiveColor = v1._config.HeaderHoveredColor, 
                ButtonActiveTransparency = v1._config.HeaderHoveredTransparency
            };
            if v49.parentWidget.type == "Menu" then
                v50 = Instance.new("TextButton");
                v50.Name = "Menu";
                v50.BackgroundColor3 = v1._config.HeaderColor;
                v50.BackgroundTransparency = 1;
                v50.BorderSizePixel = 0;
                v50.Size = UDim2.fromScale(1, 0);
                v50.Text = "";
                v50.AutomaticSize = Enum.AutomaticSize.Y;
                v50.ZIndex = v49.ZIndex;
                v50.LayoutOrder = v49.ZIndex;
                v50.AutoButtonColor = false;
                local v51 = v2.UIPadding(v50, v1._config.FramePadding);
                v51.PaddingTop = v51.PaddingTop - UDim.new(0, 1);
                v2.UIListLayout(v50, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
                local l_TextLabel_0 = Instance.new("TextLabel");
                l_TextLabel_0.Name = "TextLabel";
                l_TextLabel_0.AnchorPoint = Vector2.new(0, 0);
                l_TextLabel_0.BackgroundTransparency = 1;
                l_TextLabel_0.BorderSizePixel = 0;
                l_TextLabel_0.ZIndex = v49.ZIndex + 2;
                l_TextLabel_0.LayoutOrder = v49.ZIndex + 2;
                l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
                v2.applyTextStyle(l_TextLabel_0);
                l_TextLabel_0.Parent = v50;
                local v53 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                local v54 = v53 - math.round(v53 * 0.2) * 2;
                local l_ImageLabel_0 = Instance.new("ImageLabel");
                l_ImageLabel_0.Name = "Icon";
                l_ImageLabel_0.Size = UDim2.fromOffset(v54, v54);
                l_ImageLabel_0.BackgroundTransparency = 1;
                l_ImageLabel_0.BorderSizePixel = 0;
                l_ImageLabel_0.ImageColor3 = v1._config.TextColor;
                l_ImageLabel_0.ImageTransparency = v1._config.TextTransparency;
                l_ImageLabel_0.Image = v2.ICONS.RIGHT_POINTING_TRIANGLE;
                l_ImageLabel_0.ZIndex = v49.ZIndex + 3;
                l_ImageLabel_0.LayoutOrder = v49.ZIndex + 3;
                l_ImageLabel_0.Parent = v50;
            else
                v50 = Instance.new("TextButton");
                v50.Name = "Menu";
                v50.Size = UDim2.fromScale(0, 0);
                v50.AutomaticSize = Enum.AutomaticSize.XY;
                v50.BackgroundColor3 = v1._config.HeaderColor;
                v50.BackgroundTransparency = 1;
                v50.BorderSizePixel = 0;
                v50.Text = "";
                v50.LayoutOrder = v49.ZIndex;
                v50.ZIndex = v49.ZIndex;
                v50.AutoButtonColor = false;
                v50.ClipsDescendants = true;
                v2.applyTextStyle(v50);
                v2.UIPadding(v50, Vector2.new(v1._config.ItemSpacing.X, v1._config.FramePadding.Y));
            end;
            v2.applyInteractionHighlights(v50, v50, v49.ButtonColors);
            v50.MouseButton1Click:Connect(function() --[[ Line: 252 ]]
                -- upvalues: v5 (ref), v49 (copy), v3 (ref), v4 (ref)
                local v56 = #v5 > 1 or not v49.state.isOpened.value;
                v49.state.isOpened:set(v56);
                v3 = v56;
                v4 = v56 and v49 or nil;
                if #v5 <= 1 then
                    if v56 then
                        table.insert(v5, v49);
                        return;
                    else
                        table.remove(v5);
                    end;
                end;
            end);
            v50.MouseEnter:Connect(function() --[[ Line: 267 ]]
                -- upvalues: v3 (ref), v4 (ref), v49 (copy), v5 (ref), v11 (ref)
                if v3 and v4 and v4 ~= v49 then
                    local l_parentWidget_2 = v49.parentWidget;
                    local v58 = table.find(v5, l_parentWidget_2);
                    v11(v58);
                    v49.state.isOpened:set(true);
                    v4 = v49;
                    v3 = true;
                    table.insert(v5, v49);
                end;
            end);
            local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
            l_ScrollingFrame_0.Name = "ChildContainer";
            l_ScrollingFrame_0.BackgroundColor3 = v1._config.WindowBgColor;
            l_ScrollingFrame_0.BackgroundTransparency = v1._config.WindowBgTransparency;
            l_ScrollingFrame_0.BorderSizePixel = 0;
            l_ScrollingFrame_0.Size = UDim2.fromOffset(0, 0);
            l_ScrollingFrame_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_ScrollingFrame_0.ScrollBarImageTransparency = v1._config.ScrollbarGrabTransparency;
            l_ScrollingFrame_0.ScrollBarImageColor3 = v1._config.ScrollbarGrabColor;
            l_ScrollingFrame_0.ScrollBarThickness = v1._config.ScrollbarSize;
            l_ScrollingFrame_0.CanvasSize = UDim2.fromScale(0, 0);
            l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
            l_ScrollingFrame_0.ZIndex = v49.ZIndex + 6;
            l_ScrollingFrame_0.LayoutOrder = v49.ZIndex + 6;
            l_ScrollingFrame_0.ClipsDescendants = true;
            v2.UIListLayout(l_ScrollingFrame_0, Enum.FillDirection.Vertical, UDim.new(0, 1)).VerticalAlignment = Enum.VerticalAlignment.Top;
            l_ScrollingFrame_0.Parent = v1._rootInstance and v1._rootInstance:FindFirstChild("PopupScreenGui");
            v49.ChildContainer = l_ScrollingFrame_0;
            v2.UIStroke(l_ScrollingFrame_0, v1._config.WindowBorderSize, v1._config.BorderColor, v1._config.BorderTransparency);
            v2.UIPadding(l_ScrollingFrame_0, Vector2.new(2, v1._config.WindowPadding.Y - v1._config.ItemSpacing.Y));
            return v50;
        end, 
        Update = function(v60) --[[ Line: 316 ]] --[[ Name: Update ]]
            local l_Instance_1 = v60.Instance;
            local _ = nil;
            (if v60.parentWidget.type == "Menu" then l_Instance_1.TextLabel else l_Instance_1).Text = v60.arguments.Text or "Menu";
        end, 
        ChildAdded = function(v63, _) --[[ Line: 326 ]] --[[ Name: ChildAdded ]]
            -- upvalues: v23 (copy)
            v23(v63);
            return v63.ChildContainer;
        end, 
        ChildDiscarded = function(v65, _) --[[ Line: 330 ]] --[[ Name: ChildDiscarded ]]
            -- upvalues: v23 (copy)
            v23(v65);
        end, 
        GenerateState = function(v67) --[[ Line: 333 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v67.state.isOpened == nil then
                v67.state.isOpened = v1._widgetState(v67, "isOpened", false);
            end;
        end, 
        UpdateState = function(v68) --[[ Line: 338 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy), v23 (copy)
            local l_ChildContainer_1 = v68.ChildContainer;
            if v68.state.isOpened.value then
                v68.lastOpenedTick = v1._cycleTick + 1;
                v68.ButtonColors.ButtonTransparency = v1._config.HeaderTransparency;
                l_ChildContainer_1.Visible = true;
                v23(v68);
                return;
            else
                v68.lastClosedTick = v1._cycleTick + 1;
                v68.ButtonColors.ButtonTransparency = 1;
                l_ChildContainer_1.Visible = false;
                return;
            end;
        end, 
        Discard = function(v70) --[[ Line: 353 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v70.Instance:Destroy();
            v2.discardState(v70);
        end
    });
    v1.WidgetConstructor("MenuItem", {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            KeyCode = 2, 
            ModifierKey = 3
        }, 
        Events = {
            clicked = v2.EVENTS.click(function(v71) --[[ Line: 368 ]]
                return v71.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v72) --[[ Line: 371 ]]
                return v72.Instance;
            end)
        }, 
        Generate = function(v73) --[[ Line: 375 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy), v11 (copy), v3 (ref), v4 (ref), v5 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "MenuItem";
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Size = UDim2.fromScale(1, 0);
            l_TextButton_0.Text = "";
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_0.ZIndex = v73.ZIndex;
            l_TextButton_0.LayoutOrder = v73.ZIndex;
            l_TextButton_0.AutoButtonColor = false;
            local v75 = v2.UIPadding(l_TextButton_0, v1._config.FramePadding);
            v75.PaddingTop = v75.PaddingTop - UDim.new(0, 1);
            v2.UIListLayout(l_TextButton_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X));
            v2.applyInteractionHighlights(l_TextButton_0, l_TextButton_0, {
                ButtonColor = v1._config.HeaderColor, 
                ButtonTransparency = 1, 
                ButtonHoveredColor = v1._config.HeaderHoveredColor, 
                ButtonHoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ButtonActiveColor = v1._config.HeaderHoveredColor, 
                ButtonActiveTransparency = v1._config.HeaderHoveredTransparency
            });
            l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 400 ]]
                -- upvalues: v11 (ref)
                v11();
            end);
            l_TextButton_0.MouseEnter:Connect(function() --[[ Line: 404 ]]
                -- upvalues: v73 (copy), v3 (ref), v4 (ref), v5 (ref), v11 (ref)
                local l_parentWidget_3 = v73.parentWidget;
                if v3 and v4 and v4 ~= l_parentWidget_3 then
                    local v77 = table.find(v5, l_parentWidget_3);
                    v11(v77);
                    v4 = l_parentWidget_3;
                    v3 = true;
                end;
            end);
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Name = "TextLabel";
            l_TextLabel_1.AnchorPoint = Vector2.new(0, 0);
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.BorderSizePixel = 0;
            l_TextLabel_1.ZIndex = v73.ZIndex + 2;
            l_TextLabel_1.LayoutOrder = v73.ZIndex + 2;
            l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_1);
            l_TextLabel_1.Parent = l_TextButton_0;
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "Shortcut";
            l_TextLabel_2.AnchorPoint = Vector2.new(0, 0);
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.BorderSizePixel = 0;
            l_TextLabel_2.ZIndex = v73.ZIndex + 3;
            l_TextLabel_2.LayoutOrder = v73.ZIndex + 3;
            l_TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_2);
            l_TextLabel_2.Text = "";
            l_TextLabel_2.TextColor3 = v1._config.TextDisabledColor;
            l_TextLabel_2.TextTransparency = v1._config.TextDisabledTransparency;
            l_TextLabel_2.Parent = l_TextButton_0;
            return l_TextButton_0;
        end, 
        Update = function(v80) --[[ Line: 447 ]] --[[ Name: Update ]]
            local l_Instance_2 = v80.Instance;
            local l_TextLabel_3 = l_Instance_2.TextLabel;
            local l_Shortcut_0 = l_Instance_2.Shortcut;
            l_TextLabel_3.Text = v80.arguments.Text;
            if v80.arguments.KeyCode then
                l_Shortcut_0.Text = v80.arguments.ModifierKey.Name .. " + " .. v80.arguments.KeyCode.Name;
            end;
        end, 
        Discard = function(v84) --[[ Line: 457 ]] --[[ Name: Discard ]]
            v84.Instance:Destroy();
        end
    });
    v1.WidgetConstructor("MenuToggle", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            KeyCode = 2, 
            ModifierKey = 3
        }, 
        Events = {
            checked = {
                Init = function(_) --[[ Line: 472 ]]

                end, 
                Get = function(v86) --[[ Line: 473 ]]
                    -- upvalues: v1 (copy)
                    return v86.lastCheckedTick == v1._cycleTick;
                end
            }, 
            unchecked = {
                Init = function(_) --[[ Line: 478 ]]

                end, 
                Get = function(v88) --[[ Line: 479 ]]
                    -- upvalues: v1 (copy)
                    return v88.lastUncheckedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v89) --[[ Line: 483 ]]
                return v89.Instance;
            end)
        }, 
        Generate = function(v90) --[[ Line: 487 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy), v11 (copy), v3 (ref), v4 (ref), v5 (copy)
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "MenuItem";
            l_TextButton_1.BackgroundTransparency = 1;
            l_TextButton_1.BorderSizePixel = 0;
            l_TextButton_1.Size = UDim2.fromScale(1, 0);
            l_TextButton_1.Text = "";
            l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_1.ZIndex = v90.ZIndex;
            l_TextButton_1.LayoutOrder = v90.ZIndex;
            l_TextButton_1.AutoButtonColor = false;
            local v92 = v2.UIPadding(l_TextButton_1, v1._config.FramePadding);
            v92.PaddingTop = v92.PaddingTop - UDim.new(0, 1);
            v2.UIListLayout(l_TextButton_1, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            v2.applyInteractionHighlights(l_TextButton_1, l_TextButton_1, {
                ButtonColor = v1._config.HeaderColor, 
                ButtonTransparency = 1, 
                ButtonHoveredColor = v1._config.HeaderHoveredColor, 
                ButtonHoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ButtonActiveColor = v1._config.HeaderHoveredColor, 
                ButtonActiveTransparency = v1._config.HeaderHoveredTransparency
            });
            l_TextButton_1.MouseButton1Click:Connect(function() --[[ Line: 512 ]]
                -- upvalues: v90 (copy), v11 (ref)
                local l_value_0 = v90.state.isChecked.value;
                v90.state.isChecked:set(not l_value_0);
                v11();
            end);
            l_TextButton_1.MouseEnter:Connect(function() --[[ Line: 518 ]]
                -- upvalues: v90 (copy), v3 (ref), v4 (ref), v5 (ref), v11 (ref)
                local l_parentWidget_4 = v90.parentWidget;
                if v3 and v4 and v4 ~= l_parentWidget_4 then
                    local v95 = table.find(v5, l_parentWidget_4);
                    v11(v95);
                    v4 = l_parentWidget_4;
                    v3 = true;
                end;
            end);
            local l_TextLabel_4 = Instance.new("TextLabel");
            l_TextLabel_4.Name = "TextLabel";
            l_TextLabel_4.AnchorPoint = Vector2.new(0, 0);
            l_TextLabel_4.BackgroundTransparency = 1;
            l_TextLabel_4.BorderSizePixel = 0;
            l_TextLabel_4.ZIndex = v90.ZIndex + 2;
            l_TextLabel_4.LayoutOrder = v90.ZIndex + 2;
            l_TextLabel_4.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_4);
            l_TextLabel_4.Parent = l_TextButton_1;
            local l_TextLabel_5 = Instance.new("TextLabel");
            l_TextLabel_5.Name = "Shortcut";
            l_TextLabel_5.AnchorPoint = Vector2.new(0, 0);
            l_TextLabel_5.BackgroundTransparency = 1;
            l_TextLabel_5.BorderSizePixel = 0;
            l_TextLabel_5.ZIndex = v90.ZIndex + 3;
            l_TextLabel_5.LayoutOrder = v90.ZIndex + 3;
            l_TextLabel_5.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_5);
            l_TextLabel_5.Text = "";
            l_TextLabel_5.TextColor3 = v1._config.TextDisabledColor;
            l_TextLabel_5.TextTransparency = v1._config.TextDisabledTransparency;
            l_TextLabel_5.Parent = l_TextButton_1;
            local v98 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
            local v99 = v98 - math.round(v98 * 0.2) * 2;
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "Icon";
            l_ImageLabel_1.Size = UDim2.fromOffset(v99, v99);
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.BorderSizePixel = 0;
            l_ImageLabel_1.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_1.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_1.Image = v2.ICONS.CHECK_MARK;
            l_ImageLabel_1.ZIndex = v90.ZIndex + 4;
            l_ImageLabel_1.LayoutOrder = v90.ZIndex + 4;
            l_ImageLabel_1.Parent = l_TextButton_1;
            return l_TextButton_1;
        end, 
        GenerateState = function(v101) --[[ Line: 578 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v101.state.isChecked == nil then
                v101.state.isChecked = v1._widgetState(v101, "isChecked", false);
            end;
        end, 
        Update = function(v102) --[[ Line: 583 ]] --[[ Name: Update ]]
            local l_Instance_3 = v102.Instance;
            local l_TextLabel_6 = l_Instance_3.TextLabel;
            local l_Shortcut_1 = l_Instance_3.Shortcut;
            l_TextLabel_6.Text = v102.arguments.Text;
            if v102.arguments.KeyCode then
                l_Shortcut_1.Text = v102.arguments.ModifierKey.Name .. " + " .. v102.arguments.KeyCode.Name;
            end;
        end, 
        UpdateState = function(v106) --[[ Line: 593 ]] --[[ Name: UpdateState ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Icon_0 = v106.Instance.Icon;
            if v106.state.isChecked.value then
                l_Icon_0.Image = v2.ICONS.CHECK_MARK;
                v106.lastCheckedTick = v1._cycleTick + 1;
                return;
            else
                l_Icon_0.Image = "";
                v106.lastUncheckedTick = v1._cycleTick + 1;
                return;
            end;
        end, 
        Discard = function(v108) --[[ Line: 605 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v108.Instance:Destroy();
            v2.discardState(v108);
        end
    });
end;