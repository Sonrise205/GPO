local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local function _(v3) --[[ Line: 4 ]] --[[ Name: onSelectionChange ]]
        if type(v3.state.index.value) == "boolean" then
            v3.state.index:set(not v3.state.index.value);
            return;
        else
            v3.state.index:set(v3.arguments.Index);
            return;
        end;
    end;
    v1.WidgetConstructor("Selectable", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Index = 2, 
            NoClick = 3
        }, 
        Events = {
            selected = {
                Init = function(_) --[[ Line: 22 ]]

                end, 
                Get = function(v6) --[[ Line: 23 ]]
                    -- upvalues: v1 (copy)
                    return v6.lastSelectedTick == v1._cycleTick;
                end
            }, 
            unselected = {
                Init = function(_) --[[ Line: 28 ]]

                end, 
                Get = function(v8) --[[ Line: 29 ]]
                    -- upvalues: v1 (copy)
                    return v8.lastUnselectedTick == v1._cycleTick;
                end
            }, 
            active = {
                Init = function(_) --[[ Line: 34 ]]

                end, 
                Get = function(v10) --[[ Line: 35 ]]
                    return v10.state.index.value == v10.arguments.Index;
                end
            }, 
            clicked = v2.EVENTS.click(function(v11) --[[ Line: 39 ]]
                return v11.Instance.SelectableButton;
            end), 
            rightClicked = v2.EVENTS.rightClick(function(v12) --[[ Line: 43 ]]
                return v12.Instance.SelectableButton;
            end), 
            doubleClicked = v2.EVENTS.doubleClick(function(v13) --[[ Line: 47 ]]
                return v13.Instance.SelectableButton;
            end), 
            ctrlClicked = v2.EVENTS.ctrlClick(function(v14) --[[ Line: 51 ]]
                return v14.Instance.SelectableButton;
            end), 
            hovered = v2.EVENTS.hover(function(v15) --[[ Line: 55 ]]
                return v15.Instance.SelectableButton;
            end)
        }, 
        Generate = function(v16) --[[ Line: 60 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_Selectable";
            l_Frame_0.Size = UDim2.new(v1._config.ItemWidth, UDim.new(0, v1._config.TextSize));
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.None;
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.ZIndex = v16.ZIndex;
            l_Frame_0.LayoutOrder = v16.ZIndex;
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "SelectableButton";
            l_TextButton_0.Size = UDim2.new(1, 0, 1, v1._config.ItemSpacing.Y - 1);
            l_TextButton_0.Position = UDim2.fromOffset(0, -bit32.rshift(v1._config.ItemSpacing.Y, 1));
            l_TextButton_0.BackgroundColor3 = v1._config.HeaderColor;
            l_TextButton_0.ZIndex = v16.ZIndex + 1;
            l_TextButton_0.LayoutOrder = v16.ZIndex + 1;
            v2.applyFrameStyle(l_TextButton_0);
            v2.applyTextStyle(l_TextButton_0);
            v16.ButtonColors = {
                ButtonColor = v1._config.HeaderColor, 
                ButtonTransparency = 1, 
                ButtonHoveredColor = v1._config.HeaderHoveredColor, 
                ButtonHoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ButtonActiveColor = v1._config.HeaderActiveColor, 
                ButtonActiveTransparency = v1._config.HeaderActiveTransparency
            };
            v2.applyInteractionHighlights(l_TextButton_0, l_TextButton_0, v16.ButtonColors);
            l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 92 ]]
                -- upvalues: v16 (copy)
                if v16.arguments.NoClick ~= true then
                    local l_v16_0 = v16;
                    if type(l_v16_0.state.index.value) == "boolean" then
                        l_v16_0.state.index:set(not l_v16_0.state.index.value);
                        return;
                    else
                        l_v16_0.state.index:set(l_v16_0.arguments.Index);
                    end;
                end;
            end);
            l_TextButton_0.Parent = l_Frame_0;
            return l_Frame_0;
        end, 
        Update = function(v20) --[[ Line: 102 ]] --[[ Name: Update ]]
            v20.Instance.SelectableButton.Text = v20.arguments.Text or "Selectable";
        end, 
        Discard = function(v21) --[[ Line: 107 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v21.Instance:Destroy();
            v2.discardState(v21);
        end, 
        GenerateState = function(v22) --[[ Line: 111 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v22.state.index == nil then
                if v22.arguments.Index ~= nil then
                    error("a shared state index is required for Selectables with an Index argument", 5);
                end;
                v22.state.index = v1._widgetState(v22, "index", false);
            end;
        end, 
        UpdateState = function(v23) --[[ Line: 119 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy)
            local l_SelectableButton_0 = v23.Instance.SelectableButton;
            if v23.state.index.value == (v23.arguments.Index or true) then
                v23.ButtonColors.ButtonTransparency = v1._config.HeaderTransparency;
                l_SelectableButton_0.BackgroundTransparency = v1._config.HeaderTransparency;
                v23.lastSelectedTick = v1._cycleTick + 1;
                return;
            else
                v23.ButtonColors.ButtonTransparency = 1;
                l_SelectableButton_0.BackgroundTransparency = 1;
                v23.lastUnselectedTick = v1._cycleTick + 1;
                return;
            end;
        end
    });
    local v25 = false;
    local v26 = -1;
    local v27 = nil;
    local function v37(v28) --[[ Line: 138 ]] --[[ Name: UpdateChildContainerTransform ]]
        -- upvalues: v1 (copy)
        local l_PreviewContainer_0 = v28.Instance.PreviewContainer;
        local l_PreviewLabel_0 = l_PreviewContainer_0.PreviewLabel;
        local l_ChildContainer_0 = v28.ChildContainer;
        local v32 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
        local l_PopupBorderSize_0 = v1._config.PopupBorderSize;
        local v34 = v32 * math.min(v28.ComboChildrenHeight, 8) - l_PopupBorderSize_0 * 2 + 3 * v1._config.FramePadding.Y;
        local v35 = UDim.new(0, l_PreviewContainer_0.AbsoluteSize.X - l_PopupBorderSize_0 * 2);
        l_ChildContainer_0.Size = UDim2.new(v35, UDim.new(0, v34));
        local l_AbsoluteSize_0 = l_ChildContainer_0.Parent.AbsoluteSize;
        if l_PreviewLabel_0.AbsolutePosition.Y + v32 + v34 > l_AbsoluteSize_0.Y then
            l_ChildContainer_0.Position = UDim2.new(0, l_PreviewLabel_0.AbsolutePosition.X + l_PopupBorderSize_0, 0, l_PreviewLabel_0.AbsolutePosition.Y - l_PopupBorderSize_0 - v34);
            return;
        else
            l_ChildContainer_0.Position = UDim2.new(0, l_PreviewLabel_0.AbsolutePosition.X + l_PopupBorderSize_0, 0, l_PreviewLabel_0.AbsolutePosition.Y + v32 + l_PopupBorderSize_0);
            return;
        end;
    end;
    v2.UserInputService.InputBegan:Connect(function(v38) --[[ Line: 161 ]]
        -- upvalues: v25 (ref), v26 (ref), v1 (copy), v2 (copy), v27 (ref)
        if v38.UserInputType ~= Enum.UserInputType.MouseButton1 and v38.UserInputType ~= Enum.UserInputType.MouseButton2 and v38.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v25 == false then
            return;
        elseif v26 == v1._cycleTick then
            return;
        else
            local v39 = v2.getMouseLocation();
            local l_ChildContainer_1 = v27.ChildContainer;
            local v41 = l_ChildContainer_1.AbsolutePosition - Vector2.new(0, v27.LabelHeight);
            local v42 = l_ChildContainer_1.AbsolutePosition + l_ChildContainer_1.AbsoluteSize;
            if not v2.isPosInsideRect(v39, v41, v42) then
                v27.state.isOpened:set(false);
            end;
            return;
        end;
    end);
    v1.WidgetConstructor("Combo", {
        hasState = true, 
        hasChildren = true, 
        Args = {
            Text = 1, 
            NoButton = 2, 
            NoPreview = 3
        }, 
        Events = {
            opened = {
                Init = function(_) --[[ Line: 190 ]]

                end, 
                Get = function(v44) --[[ Line: 191 ]]
                    -- upvalues: v1 (copy)
                    return v44.lastOpenedTick == v1._cycleTick;
                end
            }, 
            closed = {
                Init = function(_) --[[ Line: 196 ]]

                end, 
                Get = function(v46) --[[ Line: 197 ]]
                    -- upvalues: v1 (copy)
                    return v46.lastClosedTick == v1._cycleTick;
                end
            }, 
            clicked = v2.EVENTS.click(function(v47) --[[ Line: 201 ]]
                return v47.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v48) --[[ Line: 204 ]]
                return v48.Instance;
            end)
        }, 
        Generate = function(v49) --[[ Line: 208 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy), v25 (ref), v27 (ref)
            local v50 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
            v49.ComboChildrenHeight = 0;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "Iris_Combo";
            l_Frame_1.Size = UDim2.fromScale(1, 0);
            l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.ZIndex = v49.ZIndex;
            l_Frame_1.LayoutOrder = v49.ZIndex;
            v2.UIListLayout(l_Frame_1, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.Y + 1));
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "PreviewContainer";
            l_TextButton_1.Size = UDim2.new(v1._config.ContentWidth, UDim.new(0, 0));
            l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_1.BackgroundTransparency = 1;
            l_TextButton_1.Text = "";
            l_TextButton_1.ZIndex = v49.ZIndex + 2;
            l_TextButton_1.LayoutOrder = v49.ZIndex + 2;
            l_TextButton_1.AutoButtonColor = false;
            v2.applyFrameStyle(l_TextButton_1, true, true);
            v2.UIListLayout(l_TextButton_1, Enum.FillDirection.Horizontal, UDim.new(0, 0));
            l_TextButton_1.Parent = l_Frame_1;
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "PreviewLabel";
            l_TextLabel_0.Size = UDim2.new(1, 0, 0, 0);
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextLabel_0.BackgroundColor3 = v1._config.FrameBgColor;
            l_TextLabel_0.BackgroundTransparency = v1._config.FrameBgTransparency;
            l_TextLabel_0.BorderSizePixel = 0;
            l_TextLabel_0.ZIndex = v49.ZIndex + 3;
            l_TextLabel_0.LayoutOrder = v49.ZIndex + 3;
            v2.applyTextStyle(l_TextLabel_0);
            v2.UIPadding(l_TextLabel_0, v1._config.FramePadding);
            l_TextLabel_0.Parent = l_TextButton_1;
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Name = "DropdownButton";
            l_TextLabel_1.Size = UDim2.new(0, v50, 0, v50);
            l_TextLabel_1.BorderSizePixel = 0;
            l_TextLabel_1.BackgroundColor3 = v1._config.ButtonColor;
            l_TextLabel_1.BackgroundTransparency = v1._config.ButtonTransparency;
            l_TextLabel_1.Text = "";
            l_TextLabel_1.ZIndex = v49.ZIndex + 4;
            l_TextLabel_1.LayoutOrder = v49.ZIndex + 4;
            local v55 = math.round(v50 * 0.2);
            local v56 = v50 - v55 * 2;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Dropdown";
            l_ImageLabel_0.Size = UDim2.fromOffset(v56, v56);
            l_ImageLabel_0.Position = UDim2.fromOffset(v55, v55);
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_0.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_0.ZIndex = v49.ZIndex + 5;
            l_ImageLabel_0.LayoutOrder = v49.ZIndex + 5;
            l_ImageLabel_0.Parent = l_TextLabel_1;
            l_TextLabel_1.Parent = l_TextButton_1;
            v2.applyInteractionHighlightsWithMultiHighlightee(l_TextButton_1, {
                {
                    l_TextLabel_0, 
                    {
                        ButtonColor = v1._config.FrameBgColor, 
                        ButtonTransparency = v1._config.FrameBgTransparency, 
                        ButtonHoveredColor = v1._config.FrameBgHoveredColor, 
                        ButtonHoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                        ButtonActiveColor = v1._config.FrameBgActiveColor, 
                        ButtonActiveTransparency = v1._config.FrameBgActiveTransparency
                    }
                }, 
                {
                    l_TextLabel_1, 
                    {
                        ButtonColor = v1._config.ButtonColor, 
                        ButtonTransparency = v1._config.ButtonTransparency, 
                        ButtonHoveredColor = v1._config.ButtonHoveredColor, 
                        ButtonHoveredTransparency = v1._config.ButtonHoveredTransparency, 
                        ButtonActiveColor = v1._config.ButtonHoveredColor, 
                        ButtonActiveTransparency = v1._config.ButtonHoveredColor
                    }
                }
            });
            l_TextButton_1.InputBegan:Connect(function(v58) --[[ Line: 308 ]]
                -- upvalues: v25 (ref), v27 (ref), v49 (copy)
                if v25 and v27 ~= v49 then
                    return;
                else
                    if v58.UserInputType == Enum.UserInputType.MouseButton1 or v58.UserInputType == Enum.UserInputType.Touch then
                        v49.state.isOpened:set(not v49.state.isOpened.value);
                    end;
                    return;
                end;
            end);
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "TextLabel";
            l_TextLabel_2.Size = UDim2.fromOffset(0, v50);
            l_TextLabel_2.AutomaticSize = Enum.AutomaticSize.X;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.BorderSizePixel = 0;
            l_TextLabel_2.ZIndex = v49.ZIndex + 5;
            l_TextLabel_2.LayoutOrder = v49.ZIndex + 5;
            v2.applyTextStyle(l_TextLabel_2);
            l_TextLabel_2.Parent = l_Frame_1;
            local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
            l_ScrollingFrame_0.Name = "ChildContainer";
            l_ScrollingFrame_0.BackgroundColor3 = v1._config.WindowBgColor;
            l_ScrollingFrame_0.BackgroundTransparency = v1._config.WindowBgTransparency;
            l_ScrollingFrame_0.BorderSizePixel = 0;
            l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_ScrollingFrame_0.ScrollBarImageTransparency = v1._config.ScrollbarGrabTransparency;
            l_ScrollingFrame_0.ScrollBarImageColor3 = v1._config.ScrollbarGrabColor;
            l_ScrollingFrame_0.ScrollBarThickness = v1._config.ScrollbarSize;
            l_ScrollingFrame_0.CanvasSize = UDim2.fromScale(0, 0);
            l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
            l_ScrollingFrame_0.ZIndex = v49.ZIndex + 6;
            l_ScrollingFrame_0.LayoutOrder = v49.ZIndex + 6;
            l_ScrollingFrame_0.ClipsDescendants = true;
            v2.UIStroke(l_ScrollingFrame_0, v1._config.WindowBorderSize, v1._config.BorderColor, v1._config.BorderTransparency);
            v2.UIPadding(l_ScrollingFrame_0, Vector2.new(2, 2 * v1._config.FramePadding.Y));
            v2.UIListLayout(l_ScrollingFrame_0, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y)).VerticalAlignment = Enum.VerticalAlignment.Top;
            l_ScrollingFrame_0.Parent = v1._rootInstance and v1._rootInstance:WaitForChild("PopupScreenGui");
            v49.ChildContainer = l_ScrollingFrame_0;
            return l_Frame_1;
        end, 
        Update = function(v61) --[[ Line: 365 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_Instance_0 = v61.Instance;
            local l_PreviewContainer_1 = l_Instance_0.PreviewContainer;
            local l_PreviewLabel_1 = l_PreviewContainer_1.PreviewLabel;
            local l_DropdownButton_0 = l_PreviewContainer_1.DropdownButton;
            l_Instance_0.TextLabel.Text = v61.arguments.Text or "Combo";
            if v61.arguments.NoButton then
                l_DropdownButton_0.Visible = false;
                l_PreviewLabel_1.Size = UDim2.new(1, 0, 0, 0);
            else
                l_DropdownButton_0.Visible = true;
                local v66 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                l_PreviewLabel_1.Size = UDim2.new(1, -v66, 0, 0);
            end;
            if v61.arguments.NoPreview then
                l_PreviewLabel_1.Visible = false;
                l_PreviewContainer_1.Size = UDim2.new(0, 0, 0, 0);
                l_PreviewContainer_1.AutomaticSize = Enum.AutomaticSize.X;
                return;
            else
                l_PreviewLabel_1.Visible = true;
                l_PreviewContainer_1.Size = UDim2.new(v1._config.ContentWidth, UDim.new(0, 0));
                l_PreviewContainer_1.AutomaticSize = Enum.AutomaticSize.Y;
                return;
            end;
        end, 
        ChildAdded = function(v67, v68) --[[ Line: 393 ]] --[[ Name: ChildAdded ]]
            -- upvalues: v37 (copy)
            if v68.type ~= "Selectable" then
                v67.ComboChildrenHeight = v67.ComboChildrenHeight + 10;
            else
                v67.ComboChildrenHeight = v67.ComboChildrenHeight + 1;
            end;
            v37(v67);
            return v67.ChildContainer;
        end, 
        ChildDiscarded = function(v69, v70) --[[ Line: 403 ]] --[[ Name: ChildDiscarded ]]
            if v70.type ~= "Selectable" then
                v69.ComboChildrenHeight = v69.ComboChildrenHeight - 10;
                return;
            else
                v69.ComboChildrenHeight = v69.ComboChildrenHeight - 1;
                return;
            end;
        end, 
        GenerateState = function(v71) --[[ Line: 410 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v71.state.index == nil then
                v71.state.index = v1._widgetState(v71, "index", "No Selection");
            end;
            v71.state.index:onChange(function() --[[ Line: 414 ]]
                -- upvalues: v71 (copy)
                if v71.state.isOpened.value then
                    v71.state.isOpened:set(false);
                end;
            end);
            if v71.state.isOpened == nil then
                v71.state.isOpened = v1._widgetState(v71, "isOpened", false);
            end;
        end, 
        UpdateState = function(v72) --[[ Line: 423 ]] --[[ Name: UpdateState ]]
            -- upvalues: v25 (ref), v27 (ref), v26 (ref), v1 (copy), v2 (copy), v37 (copy)
            local l_PreviewContainer_2 = v72.Instance.PreviewContainer;
            local l_PreviewLabel_2 = l_PreviewContainer_2.PreviewLabel;
            local l_Dropdown_0 = l_PreviewContainer_2.DropdownButton.Dropdown;
            local l_ChildContainer_2 = v72.ChildContainer;
            if v72.state.isOpened.value then
                v25 = true;
                v27 = v72;
                v26 = v1._cycleTick;
                v72.lastOpenedTick = v1._cycleTick + 1;
                l_Dropdown_0.Image = v2.ICONS.RIGHT_POINTING_TRIANGLE;
                l_ChildContainer_2.Visible = true;
                v37(v72);
            else
                if v25 then
                    v25 = false;
                    v27 = nil;
                    v72.lastClosedTick = v1._cycleTick + 1;
                end;
                l_Dropdown_0.Image = v2.ICONS.DOWN_POINTING_TRIANGLE;
                l_ChildContainer_2.Visible = false;
            end;
            local l_value_0 = v72.state.index.value;
            l_PreviewLabel_2.Text = if typeof(l_value_0) == "EnumItem" then l_value_0.Name else tostring(l_value_0);
        end, 
        Discard = function(v78) --[[ Line: 455 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v78.Instance:Destroy();
            v2.discardState(v78);
        end
    });
end;