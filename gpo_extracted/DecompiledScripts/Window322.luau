local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local function v7() --[[ Line: 4 ]] --[[ Name: relocateTooltips ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v1._rootInstance == nil then
            return;
        else
            local l_PopupScreenGui_0 = v1._rootInstance:FindFirstChild("PopupScreenGui");
            if not l_PopupScreenGui_0 then
                return;
            else
                local l_TooltipContainer_0 = l_PopupScreenGui_0.TooltipContainer;
                local v5 = v2.getMouseLocation();
                local v6 = v2.findBestWindowPosForPopup(v5, l_TooltipContainer_0.AbsoluteSize, v1._config.DisplaySafeAreaPadding, l_PopupScreenGui_0.AbsoluteSize);
                l_TooltipContainer_0.Position = UDim2.fromOffset(v6.X, v6.Y);
                return;
            end;
        end;
    end;
    v2.UserInputService.InputChanged:Connect(v7);
    v1.WidgetConstructor("Tooltip", {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Text = 1
        }, 
        Events = {}, 
        Generate = function(v8) --[[ Line: 32 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            v8.parentWidget = v1._rootWidget;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_Tooltip";
            l_Frame_0.Size = UDim2.new(v1._config.ContentWidth, UDim.new(0, 0));
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.ZIndex = v8.ZIndex + 1;
            l_Frame_0.LayoutOrder = v8.ZIndex + 1;
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "TooltipText";
            l_TextLabel_0.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_0.BackgroundColor3 = v1._config.WindowBgColor;
            l_TextLabel_0.BackgroundTransparency = v1._config.WindowBgTransparency;
            l_TextLabel_0.BorderSizePixel = v1._config.PopupBorderSize;
            l_TextLabel_0.TextWrapped = true;
            l_TextLabel_0.ZIndex = v8.ZIndex + 1;
            l_TextLabel_0.LayoutOrder = v8.ZIndex + 1;
            v2.applyTextStyle(l_TextLabel_0);
            v2.UIStroke(l_TextLabel_0, v1._config.WindowBorderSize, v1._config.BorderActiveColor, v1._config.BorderActiveTransparency);
            v2.UIPadding(l_TextLabel_0, v1._config.WindowPadding);
            if v1._config.PopupRounding > 0 then
                v2.UICorner(l_TextLabel_0, v1._config.PopupRounding);
            end;
            l_TextLabel_0.Parent = l_Frame_0;
            return l_Frame_0;
        end, 
        Update = function(v11) --[[ Line: 66 ]] --[[ Name: Update ]]
            -- upvalues: v7 (copy)
            local l_TooltipText_0 = v11.Instance.TooltipText;
            if v11.arguments.Text == nil then
                error("Iris.Text Text Argument is required", 5);
            end;
            l_TooltipText_0.Text = v11.arguments.Text;
            v7();
        end, 
        Discard = function(v13) --[[ Line: 75 ]] --[[ Name: Discard ]]
            v13.Instance:Destroy();
        end
    });
    local v14 = 0;
    local v15 = nil;
    local v16 = false;
    local v17 = nil;
    local v18 = nil;
    local v19 = false;
    local v20 = false;
    local v21 = false;
    local l_Top_0 = Enum.TopBottom.Top;
    local l_Left_0 = Enum.LeftRight.Left;
    local v24 = nil;
    local v25 = nil;
    local v26 = false;
    local v27 = {};
    local function v33() --[[ Line: 99 ]] --[[ Name: quickSwapWindows ]]
        -- upvalues: v1 (copy), v27 (copy)
        if v1._config.UseScreenGUIs == false then
            return;
        else
            local v28 = 65535;
            local v29 = nil;
            for _, v31 in v27 do
                if v31.state.isOpened.value and not v31.arguments.NoNav and v31.Instance:IsA("ScreenGui") then
                    local l_DisplayOrder_0 = v31.Instance.DisplayOrder;
                    if l_DisplayOrder_0 < v28 then
                        v28 = l_DisplayOrder_0;
                        v29 = v31;
                    end;
                end;
            end;
            if v29.state.isUncollapsed.value == false then
                v29.state.isUncollapsed:set(true);
            end;
            v1.SetFocusedWindow(v29);
            return;
        end;
    end;
    local function v41(v34, v35) --[[ Line: 126 ]] --[[ Name: fitSizeToWindowBounds ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v36 = Vector2.new(v34.state.position.value.X, v34.state.position.value.Y);
        local v37 = (v1._config.TextSize + v1._config.FramePadding.Y * 2) * 2;
        local v38 = v2.getScreenSizeForWindow(v34);
        local v39 = Vector2.new(v1._config.WindowBorderSize + v1._config.DisplaySafeAreaPadding.X, v1._config.WindowBorderSize + v1._config.DisplaySafeAreaPadding.Y);
        local v40 = v38 - v36 - v39;
        return Vector2.new(math.clamp(v35.X, v37, (math.max(v40.X, v37))), (math.clamp(v35.Y, v37, (math.max(v40.Y, v37)))));
    end;
    local function v47(v42, v43) --[[ Line: 142 ]] --[[ Name: fitPositionToWindowBounds ]]
        -- upvalues: v2 (copy), v1 (copy)
        local l_Instance_0 = v42.Instance;
        local v45 = v2.getScreenSizeForWindow(v42);
        local v46 = Vector2.new(v1._config.WindowBorderSize + v1._config.DisplaySafeAreaPadding.X, v1._config.WindowBorderSize + v1._config.DisplaySafeAreaPadding.Y);
        return Vector2.new(math.clamp(v43.X, v46.X, (math.max(v46.X, v45.X - l_Instance_0.WindowButton.AbsoluteSize.X - v46.X))), (math.clamp(v43.Y, v46.Y, (math.max(v46.Y, v45.Y - l_Instance_0.WindowButton.AbsoluteSize.Y - v46.Y)))));
    end;
    v1.SetFocusedWindow = function(v48) --[[ Line: 164 ]]
        -- upvalues: v25 (ref), v26 (ref), v27 (copy), v1 (copy), v14 (ref), v2 (copy)
        if v25 == v48 then
            return;
        else
            if v26 and v25 ~= nil then
                if v27[v25.ID] then
                    local l_WindowButton_0 = v25.Instance.WindowButton;
                    local l_TitleBar_0 = l_WindowButton_0.TitleBar;
                    if v25.state.isUncollapsed.value then
                        l_TitleBar_0.BackgroundColor3 = v1._config.TitleBgColor;
                        l_TitleBar_0.BackgroundTransparency = v1._config.TitleBgTransparency;
                    else
                        l_TitleBar_0.BackgroundColor3 = v1._config.TitleBgCollapsedColor;
                        l_TitleBar_0.BackgroundTransparency = v1._config.TitleBgCollapsedTransparency;
                    end;
                    l_WindowButton_0.UIStroke.Color = v1._config.BorderColor;
                end;
                v26 = false;
                v25 = nil;
            end;
            if v48 ~= nil then
                v26 = true;
                v25 = v48;
                local l_Instance_1 = v48.Instance;
                local l_WindowButton_1 = l_Instance_1.WindowButton;
                local l_TitleBar_1 = l_WindowButton_1.TitleBar;
                l_TitleBar_1.BackgroundColor3 = v1._config.TitleBgActiveColor;
                l_TitleBar_1.BackgroundTransparency = v1._config.TitleBgActiveTransparency;
                l_WindowButton_1.UIStroke.Color = v1._config.BorderActiveColor;
                v14 = v14 + 1;
                if v48.usesScreenGUI then
                    l_Instance_1.DisplayOrder = v14 + v1._config.DisplayOrderOffset;
                end;
                if v48.state.isUncollapsed.value == false then
                    v48.state.isUncollapsed:set(true);
                end;
                if v2.GuiService.SelectedObject then
                    if l_TitleBar_1.Visible then
                        v2.GuiService:Select(l_TitleBar_1);
                        return;
                    else
                        v2.GuiService:Select(l_Instance_1.ChildContainer);
                    end;
                end;
            end;
            return;
        end;
    end;
    v2.UserInputService.InputBegan:Connect(function(v54, v55) --[[ Line: 221 ]]
        -- upvalues: v1 (copy), v2 (copy), v33 (copy), v20 (ref), v21 (ref), v26 (ref), v25 (ref), l_Top_0 (ref), l_Left_0 (ref), v19 (ref), v18 (ref)
        if not v55 and v54.UserInputType == Enum.UserInputType.MouseButton1 then
            v1.SetFocusedWindow(nil);
        end;
        if v54.KeyCode == Enum.KeyCode.Tab and (v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
            v33();
        end;
        if v54.UserInputType == Enum.UserInputType.MouseButton1 and v20 and not v21 and v26 and v25 then
            local v56 = v25.state.position.value + v25.state.size.value * 0.5;
            local v57 = v2.getMouseLocation() - v56;
            if math.abs(v57.X) * v25.state.size.value.Y >= math.abs(v57.Y) * v25.state.size.value.X then
                l_Top_0 = Enum.TopBottom.Center;
                l_Left_0 = if math.sign(v57.X) == -1 then Enum.LeftRight.Left else Enum.LeftRight.Right;
            else
                l_Left_0 = Enum.LeftRight.Center;
                l_Top_0 = if math.sign(v57.Y) == -1 then Enum.TopBottom.Top else Enum.TopBottom.Bottom;
            end;
            v19 = true;
            v18 = v25;
        end;
    end);
    v2.UserInputService.TouchTapInWorld:Connect(function(_, v59) --[[ Line: 252 ]]
        -- upvalues: v1 (copy)
        if not v59 then
            v1.SetFocusedWindow(nil);
        end;
    end);
    v2.UserInputService.InputChanged:Connect(function(v60) --[[ Line: 258 ]]
        -- upvalues: v16 (ref), v15 (ref), v2 (copy), v17 (ref), v47 (copy), v19 (ref), v18 (ref), v24 (ref), l_Left_0 (ref), l_Top_0 (ref), v41 (copy)
        if v16 and v15 then
            local v61 = nil;
            if v60.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v60.Position;
                v61 = Vector2.new(l_Position_0.X, l_Position_0.Y);
            else
                v61 = v2.getMouseLocation();
            end;
            local l_WindowButton_2 = v15.Instance.WindowButton;
            local v64 = v61 - v17;
            local v65 = v47(v15, v64);
            l_WindowButton_2.Position = UDim2.fromOffset(v65.X, v65.Y);
            v15.state.position.value = v65;
        end;
        if v19 and v18 and v18.arguments.NoResize ~= true then
            local l_WindowButton_3 = v18.Instance.WindowButton;
            local v67 = Vector2.new(l_WindowButton_3.Position.X.Offset, l_WindowButton_3.Position.Y.Offset);
            local v68 = Vector2.new(l_WindowButton_3.Size.X.Offset, l_WindowButton_3.Size.Y.Offset);
            local v69 = nil;
            v69 = if v60.UserInputType == Enum.UserInputType.Touch then v60.Delta else v2.getMouseLocation() - v24;
            local v70 = v67 + Vector2.new(if l_Left_0 == Enum.LeftRight.Left then v69.X else 0, if l_Top_0 == Enum.TopBottom.Top then v69.Y else 0);
            local v71 = v68 + Vector2.new(if l_Left_0 == Enum.LeftRight.Left then -v69.X else if l_Left_0 == Enum.LeftRight.Right then v69.X else 0, if l_Top_0 == Enum.TopBottom.Top then -v69.Y else if l_Top_0 == Enum.TopBottom.Bottom then v69.Y else 0);
            local v72 = v41(v18, v71);
            local v73 = v47(v18, v70);
            l_WindowButton_3.Size = UDim2.fromOffset(v72.X, v72.Y);
            v18.state.size.value = v72;
            l_WindowButton_3.Position = UDim2.fromOffset(v73.X, v73.Y);
            v18.state.position.value = v73;
        end;
        v24 = v2.getMouseLocation();
    end);
    v2.UserInputService.InputEnded:Connect(function(v74, _) --[[ Line: 319 ]]
        -- upvalues: v16 (ref), v15 (ref), v19 (ref), v18 (ref), v33 (copy)
        if (v74.UserInputType == Enum.UserInputType.MouseButton1 or v74.UserInputType == Enum.UserInputType.Touch) and v16 and v15 then
            local l_WindowButton_4 = v15.Instance.WindowButton;
            v16 = false;
            v15.state.position:set(Vector2.new(l_WindowButton_4.Position.X.Offset, l_WindowButton_4.Position.Y.Offset));
        end;
        if (v74.UserInputType == Enum.UserInputType.MouseButton1 or v74.UserInputType == Enum.UserInputType.Touch) and v19 and v18 then
            local l_Instance_2 = v18.Instance;
            v19 = false;
            v18.state.size:set(l_Instance_2.WindowButton.AbsoluteSize);
        end;
        if v74.KeyCode == Enum.KeyCode.ButtonX then
            v33();
        end;
    end);
    v1.WidgetConstructor("Window", {
        hasState = true, 
        hasChildren = true, 
        Args = {
            Title = 1, 
            NoTitleBar = 2, 
            NoBackground = 3, 
            NoCollapse = 4, 
            NoClose = 5, 
            NoMove = 6, 
            NoScrollbar = 7, 
            NoResize = 8, 
            NoNav = 9, 
            NoMenu = 10
        }, 
        Events = {
            closed = {
                Init = function(_) --[[ Line: 362 ]]

                end, 
                Get = function(v79) --[[ Line: 363 ]]
                    -- upvalues: v1 (copy)
                    return v79.lastClosedTick == v1._cycleTick;
                end
            }, 
            opened = {
                Init = function(_) --[[ Line: 368 ]]

                end, 
                Get = function(v81) --[[ Line: 369 ]]
                    -- upvalues: v1 (copy)
                    return v81.lastOpenedTick == v1._cycleTick;
                end
            }, 
            collapsed = {
                Init = function(_) --[[ Line: 374 ]]

                end, 
                Get = function(v83) --[[ Line: 375 ]]
                    -- upvalues: v1 (copy)
                    return v83.lastCollapsedTick == v1._cycleTick;
                end
            }, 
            uncollapsed = {
                Init = function(_) --[[ Line: 380 ]]

                end, 
                Get = function(v85) --[[ Line: 381 ]]
                    -- upvalues: v1 (copy)
                    return v85.lastUncollapsedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v86) --[[ Line: 385 ]]
                return v86.Instance.WindowButton;
            end)
        }, 
        Generate = function(v87) --[[ Line: 390 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v27 (copy), v2 (copy), v15 (ref), v16 (ref), v17 (ref), v26 (ref), v25 (ref), v19 (ref), l_Top_0 (ref), l_Left_0 (ref), v18 (ref), v20 (ref), v21 (ref)
            v87.parentWidget = v1._rootWidget;
            v87.usesScreenGUI = v1._config.UseScreenGUIs;
            v27[v87.ID] = v87;
            local v88 = nil;
            if v87.usesScreenGUI then
                v88 = Instance.new("ScreenGui");
                v88.ResetOnSpawn = false;
                v88.DisplayOrder = v1._config.DisplayOrderOffset;
                v88.IgnoreGuiInset = v1._config.IgnoreGuiInset;
            else
                v88 = Instance.new("Folder");
            end;
            v88.Name = "Iris_Window";
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "WindowButton";
            l_TextButton_0.Size = UDim2.fromOffset(0, 0);
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Text = "";
            l_TextButton_0.ClipsDescendants = false;
            l_TextButton_0.AutoButtonColor = false;
            l_TextButton_0.Selectable = false;
            l_TextButton_0.SelectionImageObject = v1.SelectionImageObject;
            l_TextButton_0.ZIndex = v87.ZIndex + 1;
            l_TextButton_0.LayoutOrder = v87.ZIndex + 1;
            l_TextButton_0.SelectionGroup = true;
            l_TextButton_0.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
            l_TextButton_0.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
            l_TextButton_0.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
            l_TextButton_0.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
            v2.UIStroke(l_TextButton_0, v1._config.WindowBorderSize, v1._config.BorderColor, v1._config.BorderTransparency);
            l_TextButton_0.Parent = v88;
            l_TextButton_0.InputBegan:Connect(function(v90) --[[ Line: 430 ]]
                -- upvalues: v87 (copy), v1 (ref), v15 (ref), v16 (ref), v17 (ref), v2 (ref)
                if v90.UserInputType == Enum.UserInputType.MouseMovement or v90.UserInputType == Enum.UserInputType.Keyboard then
                    return;
                else
                    if v87.state.isUncollapsed.value then
                        v1.SetFocusedWindow(v87);
                    end;
                    if not v87.arguments.NoMove and v90.UserInputType == Enum.UserInputType.MouseButton1 then
                        v15 = v87;
                        v16 = true;
                        v17 = v2.getMouseLocation() - v87.state.position.value;
                    end;
                    return;
                end;
            end);
            local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
            l_ScrollingFrame_0.Name = "ChildContainer";
            l_ScrollingFrame_0.Size = UDim2.fromScale(1, 1);
            l_ScrollingFrame_0.Position = UDim2.fromOffset(0, 0);
            l_ScrollingFrame_0.BackgroundColor3 = v1._config.WindowBgColor;
            l_ScrollingFrame_0.BackgroundTransparency = v1._config.WindowBgTransparency;
            l_ScrollingFrame_0.BorderSizePixel = 0;
            l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_ScrollingFrame_0.ScrollBarImageTransparency = v1._config.ScrollbarGrabTransparency;
            l_ScrollingFrame_0.ScrollBarImageColor3 = v1._config.ScrollbarGrabColor;
            l_ScrollingFrame_0.CanvasSize = UDim2.fromScale(0, 1);
            l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
            l_ScrollingFrame_0.ZIndex = v87.ZIndex + 3;
            l_ScrollingFrame_0.LayoutOrder = v87.ZIndex + 3;
            l_ScrollingFrame_0.ClipsDescendants = true;
            v2.UIPadding(l_ScrollingFrame_0, v1._config.WindowPadding);
            l_ScrollingFrame_0.Parent = l_TextButton_0;
            l_ScrollingFrame_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 466 ]]
                -- upvalues: v87 (copy), l_ScrollingFrame_0 (copy)
                v87.state.scrollDistance.value = l_ScrollingFrame_0.CanvasPosition.Y;
            end);
            l_ScrollingFrame_0.InputBegan:Connect(function(v92) --[[ Line: 471 ]]
                -- upvalues: v87 (copy), v1 (ref)
                if v92.UserInputType == Enum.UserInputType.MouseMovement or v92.UserInputType == Enum.UserInputType.Keyboard then
                    return;
                else
                    if v87.state.isUncollapsed.value then
                        v1.SetFocusedWindow(v87);
                    end;
                    return;
                end;
            end);
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "TerminatingFrame";
            l_Frame_1.Size = UDim2.fromOffset(0, v1._config.WindowPadding.Y + v1._config.FramePadding.Y);
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.LayoutOrder = 2147483632;
            v2.UIListLayout(l_ScrollingFrame_0, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y)).VerticalAlignment = Enum.VerticalAlignment.Top;
            l_Frame_1.Parent = l_ScrollingFrame_0;
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "TitleBar";
            l_Frame_2.Size = UDim2.fromScale(1, 0);
            l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_2.BorderSizePixel = 0;
            l_Frame_2.ZIndex = v87.ZIndex + 1;
            l_Frame_2.LayoutOrder = v87.ZIndex + 1;
            l_Frame_2.ClipsDescendants = true;
            l_Frame_2.Parent = l_TextButton_0;
            l_Frame_2.InputBegan:Connect(function(v95) --[[ Line: 504 ]]
                -- upvalues: v87 (copy), v15 (ref), v16 (ref), v17 (ref)
                if v95.UserInputType == Enum.UserInputType.Touch and not v87.arguments.NoMove then
                    v15 = v87;
                    v16 = true;
                    local l_Position_1 = v95.Position;
                    v17 = Vector2.new(l_Position_1.X, l_Position_1.Y) - v87.state.position.value;
                end;
            end);
            local v97 = v1._config.TextSize + (v1._config.FramePadding.Y - 1) * 2;
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "CollapseButton";
            l_TextButton_1.AnchorPoint = Vector2.new(0, 0.5);
            l_TextButton_1.Size = UDim2.fromOffset(v97, v97);
            l_TextButton_1.Position = UDim2.new(0, v1._config.FramePadding.X + 1, 0.5, 0);
            l_TextButton_1.AutomaticSize = Enum.AutomaticSize.None;
            l_TextButton_1.BackgroundTransparency = 1;
            l_TextButton_1.BorderSizePixel = 0;
            l_TextButton_1.AutoButtonColor = false;
            l_TextButton_1.Text = "";
            l_TextButton_1.ZIndex = v87.ZIndex + 4;
            v2.UICorner(l_TextButton_1);
            l_TextButton_1.Parent = l_Frame_2;
            l_TextButton_1.MouseButton1Click:Connect(function() --[[ Line: 533 ]]
                -- upvalues: v87 (copy)
                v87.state.isUncollapsed:set(not v87.state.isUncollapsed.value);
            end);
            v2.applyInteractionHighlights(l_TextButton_1, l_TextButton_1, {
                ButtonColor = v1._config.ButtonColor, 
                ButtonTransparency = 1, 
                ButtonHoveredColor = v1._config.ButtonHoveredColor, 
                ButtonHoveredTransparency = v1._config.ButtonHoveredTransparency, 
                ButtonActiveColor = v1._config.ButtonActiveColor, 
                ButtonActiveTransparency = v1._config.ButtonActiveTransparency
            });
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Arrow";
            l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_0.Size = UDim2.fromOffset(math.floor(v97 * 0.7), (math.floor(v97 * 0.7)));
            l_ImageLabel_0.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.Image = v2.ICONS.MULTIPLICATION_SIGN;
            l_ImageLabel_0.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_0.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_0.ZIndex = v87.ZIndex + 5;
            l_ImageLabel_0.Parent = l_TextButton_1;
            local l_TextButton_2 = Instance.new("TextButton");
            l_TextButton_2.Name = "CloseButton";
            l_TextButton_2.AnchorPoint = Vector2.new(1, 0.5);
            l_TextButton_2.Size = UDim2.fromOffset(v97, v97);
            l_TextButton_2.Position = UDim2.new(1, -(v1._config.FramePadding.X + 1), 0.5, 0);
            l_TextButton_2.AutomaticSize = Enum.AutomaticSize.None;
            l_TextButton_2.BackgroundTransparency = 1;
            l_TextButton_2.BorderSizePixel = 0;
            l_TextButton_2.Text = "";
            l_TextButton_2.ZIndex = v87.ZIndex + 4;
            l_TextButton_2.AutoButtonColor = false;
            v2.UICorner(l_TextButton_2);
            l_TextButton_2.MouseButton1Click:Connect(function() --[[ Line: 574 ]]
                -- upvalues: v87 (copy)
                v87.state.isOpened:set(false);
            end);
            v2.applyInteractionHighlights(l_TextButton_2, l_TextButton_2, {
                ButtonColor = v1._config.ButtonColor, 
                ButtonTransparency = 1, 
                ButtonHoveredColor = v1._config.ButtonHoveredColor, 
                ButtonHoveredTransparency = v1._config.ButtonHoveredTransparency, 
                ButtonActiveColor = v1._config.ButtonActiveColor, 
                ButtonActiveTransparency = v1._config.ButtonActiveTransparency
            });
            l_TextButton_2.Parent = l_Frame_2;
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "Icon";
            l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_1.Size = UDim2.fromOffset(math.floor(v97 * 0.7), (math.floor(v97 * 0.7)));
            l_ImageLabel_1.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.BorderSizePixel = 0;
            l_ImageLabel_1.Image = v2.ICONS.MULTIPLICATION_SIGN;
            l_ImageLabel_1.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_1.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_1.ZIndex = v87.ZIndex + 5;
            l_ImageLabel_1.Parent = l_TextButton_2;
            local v102 = nil;
            v102 = v1._config.WindowTitleAlign == Enum.LeftRight.Left and 0 or v1._config.WindowTitleAlign == Enum.LeftRight.Center and 0.5 or 1;
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Name = "Title";
            l_TextLabel_1.AnchorPoint = Vector2.new(v102, 0);
            l_TextLabel_1.Position = UDim2.fromScale(v102, 0);
            l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_1.BorderSizePixel = 0;
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.ZIndex = v87.ZIndex + 3;
            v2.applyTextStyle(l_TextLabel_1);
            v2.UIPadding(l_TextLabel_1, v1._config.FramePadding);
            l_TextLabel_1.Parent = l_Frame_2;
            local v104 = v1._config.TextSize + v1._config.FramePadding.X;
            local l_TextButton_3 = Instance.new("TextButton");
            l_TextButton_3.Name = "ResizeGrip";
            l_TextButton_3.AnchorPoint = Vector2.new(1, 1);
            l_TextButton_3.Size = UDim2.fromOffset(v104, v104);
            l_TextButton_3.Position = UDim2.fromScale(1, 1);
            l_TextButton_3.AutoButtonColor = false;
            l_TextButton_3.BorderSizePixel = 0;
            l_TextButton_3.BackgroundTransparency = 1;
            l_TextButton_3.Text = v2.ICONS.BOTTOM_RIGHT_CORNER;
            l_TextButton_3.TextSize = v104;
            l_TextButton_3.TextColor3 = v1._config.ButtonColor;
            l_TextButton_3.TextTransparency = v1._config.ButtonTransparency;
            l_TextButton_3.LineHeight = 1.1;
            l_TextButton_3.Selectable = false;
            l_TextButton_3.ZIndex = v87.ZIndex + 3;
            l_TextButton_3.Parent = l_TextButton_0;
            v2.applyTextInteractionHighlights(l_TextButton_3, l_TextButton_3, {
                ButtonColor = v1._config.ButtonColor, 
                ButtonTransparency = v1._config.ButtonTransparency, 
                ButtonHoveredColor = v1._config.ButtonHoveredColor, 
                ButtonHoveredTransparency = v1._config.ButtonHoveredTransparency, 
                ButtonActiveColor = v1._config.ButtonActiveColor, 
                ButtonActiveTransparency = v1._config.ButtonActiveTransparency
            });
            l_TextButton_3.MouseButton1Down:Connect(function() --[[ Line: 655 ]]
                -- upvalues: v26 (ref), v25 (ref), v87 (copy), v1 (ref), v19 (ref), l_Top_0 (ref), l_Left_0 (ref), v18 (ref)
                if not v26 or v25 ~= v87 then
                    v1.SetFocusedWindow(v87);
                end;
                v19 = true;
                l_Top_0 = Enum.TopBottom.Bottom;
                l_Left_0 = Enum.LeftRight.Right;
                v18 = v87;
            end);
            local l_TextButton_4 = Instance.new("TextButton");
            l_TextButton_4.Name = "ResizeBorder";
            l_TextButton_4.Size = UDim2.new(1, v1._config.WindowResizePadding.X * 2, 1, v1._config.WindowResizePadding.Y * 2);
            l_TextButton_4.Position = UDim2.fromOffset(-v1._config.WindowResizePadding.X, -v1._config.WindowResizePadding.Y);
            l_TextButton_4.BackgroundTransparency = 1;
            l_TextButton_4.BorderSizePixel = 0;
            l_TextButton_4.Text = "";
            l_TextButton_4.AutoButtonColor = false;
            l_TextButton_4.Active = true;
            l_TextButton_4.Selectable = false;
            l_TextButton_4.ZIndex = v87.ZIndex;
            l_TextButton_4.LayoutOrder = v87.ZIndex;
            l_TextButton_4.ClipsDescendants = false;
            l_TextButton_4.Parent = l_TextButton_0;
            l_TextButton_4.MouseEnter:Connect(function() --[[ Line: 681 ]]
                -- upvalues: v25 (ref), v87 (copy), v20 (ref)
                if v25 == v87 then
                    v20 = true;
                end;
            end);
            l_TextButton_4.MouseLeave:Connect(function() --[[ Line: 686 ]]
                -- upvalues: v25 (ref), v87 (copy), v20 (ref)
                if v25 == v87 then
                    v20 = false;
                end;
            end);
            l_TextButton_0.MouseEnter:Connect(function() --[[ Line: 692 ]]
                -- upvalues: v25 (ref), v87 (copy), v21 (ref)
                if v25 == v87 then
                    v21 = true;
                end;
            end);
            l_TextButton_0.MouseLeave:Connect(function() --[[ Line: 697 ]]
                -- upvalues: v25 (ref), v87 (copy), v21 (ref)
                if v25 == v87 then
                    v21 = false;
                end;
            end);
            return v88;
        end, 
        Update = function(v107) --[[ Line: 705 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_WindowButton_5 = v107.Instance.WindowButton;
            local l_TitleBar_2 = l_WindowButton_5.TitleBar;
            local l_Title_0 = l_TitleBar_2.Title;
            local l_MenuBar_0 = l_WindowButton_5:FindFirstChild("MenuBar");
            local l_ChildContainer_0 = l_WindowButton_5.ChildContainer;
            local l_ResizeGrip_0 = l_WindowButton_5.ResizeGrip;
            local v114 = 0;
            local v115 = 0;
            if v107.arguments.NoResize ~= true then
                l_ResizeGrip_0.Visible = true;
            else
                l_ResizeGrip_0.Visible = false;
            end;
            if v107.arguments.NoScrollbar then
                l_ChildContainer_0.ScrollBarThickness = 0;
            else
                l_ChildContainer_0.ScrollBarThickness = v1._config.ScrollbarSize;
            end;
            if v107.arguments.NoTitleBar then
                l_TitleBar_2.Visible = false;
            else
                l_TitleBar_2.Visible = true;
                local l_Y_0 = l_TitleBar_2.AbsoluteSize.Y;
                v114 = v114 + l_Y_0;
                v115 = v115 + l_Y_0;
            end;
            if l_MenuBar_0 then
                if v107.arguments.NoMenu then
                    l_MenuBar_0.Visible = false;
                else
                    l_MenuBar_0.Visible = true;
                    v114 = v114 + l_MenuBar_0.AbsoluteSize.Y;
                end;
                l_MenuBar_0.Position = UDim2.fromOffset(0, v115);
            end;
            if v107.arguments.NoBackground then
                l_ChildContainer_0.BackgroundTransparency = 1;
            else
                l_ChildContainer_0.BackgroundTransparency = v1._config.WindowBgTransparency;
            end;
            local v117 = v1._config.FramePadding.X + v1._config.TextSize + v1._config.FramePadding.X * 2;
            if v107.arguments.NoCollapse then
                l_TitleBar_2.CollapseButton.Visible = false;
                l_TitleBar_2.Title.UIPadding.PaddingLeft = UDim.new(0, v1._config.FramePadding.X);
            else
                l_TitleBar_2.CollapseButton.Visible = true;
                l_TitleBar_2.Title.UIPadding.PaddingLeft = UDim.new(0, v117);
            end;
            if v107.arguments.NoClose then
                l_TitleBar_2.CloseButton.Visible = false;
                l_TitleBar_2.Title.UIPadding.PaddingRight = UDim.new(0, v1._config.FramePadding.X);
            else
                l_TitleBar_2.CloseButton.Visible = true;
                l_TitleBar_2.Title.UIPadding.PaddingRight = UDim.new(0, v117);
            end;
            l_ChildContainer_0.Size = UDim2.new(1, 0, 1, -v114);
            l_ChildContainer_0.CanvasSize = UDim2.new(0, 0, 1, -v114);
            l_ChildContainer_0.Position = UDim2.fromOffset(0, v114);
            l_Title_0.Text = v107.arguments.Title or "";
        end, 
        Discard = function(v118) --[[ Line: 775 ]] --[[ Name: Discard ]]
            -- upvalues: v25 (ref), v26 (ref), v15 (ref), v16 (ref), v18 (ref), v19 (ref), v27 (copy), v2 (copy)
            if v25 == v118 then
                v25 = nil;
                v26 = false;
            end;
            if v15 == v118 then
                v15 = nil;
                v16 = false;
            end;
            if v18 == v118 then
                v18 = nil;
                v19 = false;
            end;
            v27[v118.ID] = nil;
            v118.Instance:Destroy();
            v2.discardState(v118);
        end, 
        ChildAdded = function(v119) --[[ Line: 792 ]] --[[ Name: ChildAdded ]]
            return v119.Instance.WindowButton.ChildContainer;
        end, 
        UpdateState = function(v120) --[[ Line: 797 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_value_0 = v120.state.size.value;
            local l_value_1 = v120.state.position.value;
            local l_value_2 = v120.state.isUncollapsed.value;
            local l_value_3 = v120.state.isOpened.value;
            local l_value_4 = v120.state.scrollDistance.value;
            local l_Instance_3 = v120.Instance;
            local l_WindowButton_6 = l_Instance_3.WindowButton;
            local l_TitleBar_3 = l_WindowButton_6.TitleBar;
            local l_ChildContainer_1 = l_WindowButton_6.ChildContainer;
            local l_ResizeGrip_1 = l_WindowButton_6.ResizeGrip;
            l_WindowButton_6.Size = UDim2.fromOffset(l_value_0.X, l_value_0.Y);
            l_WindowButton_6.Position = UDim2.fromOffset(l_value_1.X, l_value_1.Y);
            if l_value_3 then
                if v120.usesScreenGUI then
                    l_Instance_3.Enabled = true;
                    l_WindowButton_6.Visible = true;
                else
                    l_WindowButton_6.Visible = true;
                end;
                v120.lastOpenedTick = v1._cycleTick + 1;
            else
                if v120.usesScreenGUI then
                    l_Instance_3.Enabled = false;
                    l_WindowButton_6.Visible = false;
                else
                    l_WindowButton_6.Visible = false;
                end;
                v120.lastClosedTick = v1._cycleTick + 1;
            end;
            if l_value_2 then
                l_TitleBar_3.CollapseButton.Arrow.Image = v2.ICONS.DOWN_POINTING_TRIANGLE;
                l_ChildContainer_1.Visible = true;
                if v120.arguments.NoResize ~= true then
                    l_ResizeGrip_1.Visible = true;
                end;
                l_WindowButton_6.AutomaticSize = Enum.AutomaticSize.None;
                v120.lastUncollapsedTick = v1._cycleTick + 1;
            else
                local l_Y_1 = l_TitleBar_3.AbsoluteSize.Y;
                l_TitleBar_3.CollapseButton.Arrow.Image = v2.ICONS.RIGHT_POINTING_TRIANGLE;
                l_ChildContainer_1.Visible = false;
                l_ResizeGrip_1.Visible = false;
                l_WindowButton_6.Size = UDim2.fromOffset(l_value_0.X, l_Y_1);
                v120.lastCollapsedTick = v1._cycleTick + 1;
            end;
            if l_value_3 and l_value_2 then
                v1.SetFocusedWindow(v120);
            else
                l_TitleBar_3.BackgroundColor3 = v1._config.TitleBgCollapsedColor;
                l_TitleBar_3.BackgroundTransparency = v1._config.TitleBgCollapsedTransparency;
                l_WindowButton_6.UIStroke.Color = v1._config.BorderColor;
                v1.SetFocusedWindow(nil);
            end;
            if l_value_4 and l_value_4 ~= 0 then
                local v132 = #v1._postCycleCallbacks + 1;
                local v133 = v1._cycleTick + 1;
                v1._postCycleCallbacks[v132] = function() --[[ Line: 863 ]]
                    -- upvalues: v1 (ref), v133 (copy), l_ChildContainer_1 (copy), l_value_4 (copy), v132 (copy)
                    if v1._cycleTick == v133 then
                        l_ChildContainer_1.CanvasPosition = Vector2.new(0, l_value_4);
                        v1._postCycleCallbacks[v132] = nil;
                    end;
                end;
            end;
        end, 
        GenerateState = function(v134) --[[ Line: 871 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy), v26 (ref), v25 (ref), v47 (copy), v41 (copy)
            if v134.state.size == nil then
                v134.state.size = v1._widgetState(v134, "size", Vector2.new(400, 300));
            end;
            if v134.state.position == nil then
                v134.state.position = v1._widgetState(v134, "position", if v26 and v25 then v25.state.position.value + Vector2.new(15, 45) else Vector2.new(150, 250));
            end;
            v134.state.position.value = v47(v134, v134.state.position.value);
            v134.state.size.value = v41(v134, v134.state.size.value);
            if v134.state.isUncollapsed == nil then
                v134.state.isUncollapsed = v1._widgetState(v134, "isUncollapsed", true);
            end;
            if v134.state.isOpened == nil then
                v134.state.isOpened = v1._widgetState(v134, "isOpened", true);
            end;
            if v134.state.scrollDistance == nil then
                v134.state.scrollDistance = v1._widgetState(v134, "scrollDistance", 0);
            end;
        end
    });
end;