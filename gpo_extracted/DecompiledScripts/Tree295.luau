local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v16 = {
        hasState = true, 
        hasChildren = true, 
        Events = {
            collasped = {
                Init = function(_) --[[ Line: 9 ]]

                end, 
                Get = function(v4) --[[ Line: 10 ]]
                    -- upvalues: v1 (copy)
                    return v4.lastCollapsedTick == v1._cycleTick;
                end
            }, 
            uncollapsed = {
                Init = function(_) --[[ Line: 15 ]]

                end, 
                Get = function(v6) --[[ Line: 16 ]]
                    -- upvalues: v1 (copy)
                    return v6.lastUncollapsedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v7) --[[ Line: 20 ]]
                return v7.Instance;
            end)
        }, 
        Discard = function(v8) --[[ Line: 24 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v8.Instance:Destroy();
            v2.discardState(v8);
        end, 
        ChildAdded = function(v9) --[[ Line: 28 ]] --[[ Name: ChildAdded ]]
            local l_ChildContainer_0 = v9.Instance.ChildContainer;
            l_ChildContainer_0.Visible = v9.state.isUncollapsed.value;
            return l_ChildContainer_0;
        end, 
        UpdateState = function(v11) --[[ Line: 36 ]] --[[ Name: UpdateState ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_value_0 = v11.state.isUncollapsed.value;
            local l_Instance_0 = v11.Instance;
            local l_ChildContainer_1 = l_Instance_0.ChildContainer;
            l_Instance_0.Header.Button.Arrow.Image = l_value_0 and v2.ICONS.DOWN_POINTING_TRIANGLE or v2.ICONS.RIGHT_POINTING_TRIANGLE;
            if l_value_0 then
                v11.lastUncollapsedTick = v1._cycleTick + 1;
            else
                v11.lastCollapsedTick = v1._cycleTick + 1;
            end;
            l_ChildContainer_1.Visible = l_value_0;
        end, 
        GenerateState = function(v15) --[[ Line: 53 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v15.state.isUncollapsed == nil then
                v15.state.isUncollapsed = v1._widgetState(v15, "isUncollapsed", false);
            end;
        end
    };
    v1.WidgetConstructor("Tree", v2.extend(v16, {
        Args = {
            Text = 1, 
            SpanAvailWidth = 2, 
            NoIndent = 3
        }, 
        Generate = function(v17) --[[ Line: 68 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_Tree";
            l_Frame_0.Size = UDim2.new(v1._config.ItemWidth, UDim.new(0, 0));
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.ZIndex = v17.ZIndex;
            l_Frame_0.LayoutOrder = v17.ZIndex;
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Vertical, UDim.new(0, 0));
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "ChildContainer";
            l_Frame_1.Size = UDim2.fromScale(1, 0);
            l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.ZIndex = v17.ZIndex + 1;
            l_Frame_1.LayoutOrder = v17.ZIndex + 1;
            l_Frame_1.Visible = false;
            v2.UIListLayout(l_Frame_1, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            v2.UIPadding(l_Frame_1, Vector2.new(0, 0)).PaddingTop = UDim.new(0, v1._config.ItemSpacing.Y);
            l_Frame_1.Parent = l_Frame_0;
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "Header";
            l_Frame_2.Size = UDim2.fromScale(1, 0);
            l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_2.BackgroundTransparency = 1;
            l_Frame_2.BorderSizePixel = 0;
            l_Frame_2.ZIndex = v17.ZIndex;
            l_Frame_2.LayoutOrder = v17.ZIndex;
            l_Frame_2.Parent = l_Frame_0;
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "Button";
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Text = "";
            l_TextButton_0.ZIndex = v17.ZIndex;
            l_TextButton_0.LayoutOrder = v17.ZIndex;
            l_TextButton_0.AutoButtonColor = false;
            v2.applyInteractionHighlights(l_TextButton_0, l_Frame_2, {
                ButtonColor = Color3.fromRGB(0, 0, 0), 
                ButtonTransparency = 1, 
                ButtonHoveredColor = v1._config.HeaderHoveredColor, 
                ButtonHoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ButtonActiveColor = v1._config.HeaderActiveColor, 
                ButtonActiveTransparency = v1._config.HeaderActiveTransparency
            });
            v2.UIPadding(l_TextButton_0, Vector2.zero).PaddingLeft = UDim.new(0, v1._config.FramePadding.X);
            v2.UIListLayout(l_TextButton_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.FramePadding.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            l_TextButton_0.Parent = l_Frame_2;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Arrow";
            l_ImageLabel_0.Size = UDim2.fromOffset(v1._config.TextSize, (math.floor(v1._config.TextSize * 0.7)));
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_0.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_0.ScaleType = Enum.ScaleType.Fit;
            l_ImageLabel_0.ZIndex = v17.ZIndex;
            l_ImageLabel_0.LayoutOrder = v17.ZIndex;
            l_ImageLabel_0.Parent = l_TextButton_0;
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "TextLabel";
            l_TextLabel_0.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.BorderSizePixel = 0;
            l_TextLabel_0.ZIndex = v17.ZIndex;
            l_TextLabel_0.LayoutOrder = v17.ZIndex;
            v2.UIPadding(l_TextLabel_0, Vector2.new(0, 0)).PaddingRight = UDim.new(0, 21);
            v2.applyTextStyle(l_TextLabel_0);
            l_TextLabel_0.Parent = l_TextButton_0;
            l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 160 ]]
                -- upvalues: v17 (copy)
                v17.state.isUncollapsed:set(not v17.state.isUncollapsed.value);
            end);
            return l_Frame_0;
        end, 
        Update = function(v24) --[[ Line: 166 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_Instance_1 = v24.Instance;
            local l_Button_0 = l_Instance_1.Header.Button;
            local l_TextLabel_1 = l_Button_0.TextLabel;
            local l_UIPadding_0 = l_Instance_1.ChildContainer.UIPadding;
            l_TextLabel_1.Text = v24.arguments.Text or "Tree";
            if v24.arguments.SpanAvailWidth then
                l_Button_0.AutomaticSize = Enum.AutomaticSize.Y;
                l_Button_0.Size = UDim2.fromScale(1, 0);
            else
                l_Button_0.AutomaticSize = Enum.AutomaticSize.XY;
                l_Button_0.Size = UDim2.fromScale(0, 0);
            end;
            if v24.arguments.NoIndent then
                l_UIPadding_0.PaddingLeft = UDim.new(0, 0);
                return;
            else
                l_UIPadding_0.PaddingLeft = UDim.new(0, v1._config.IndentSpacing);
                return;
            end;
        end
    }));
    v1.WidgetConstructor("CollapsingHeader", v2.extend(v16, {
        Args = {
            Text = 1
        }, 
        Generate = function(v29) --[[ Line: 198 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_3 = Instance.new("Frame");
            l_Frame_3.Name = "Iris_CollapsingHeader";
            l_Frame_3.Size = UDim2.new(v1._config.ItemWidth, UDim.new(0, 0));
            l_Frame_3.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_3.BackgroundTransparency = 1;
            l_Frame_3.BorderSizePixel = 0;
            l_Frame_3.ZIndex = v29.ZIndex;
            l_Frame_3.LayoutOrder = v29.ZIndex;
            v2.UIListLayout(l_Frame_3, Enum.FillDirection.Vertical, UDim.new(0, 0));
            local l_Frame_4 = Instance.new("Frame");
            l_Frame_4.Name = "ChildContainer";
            l_Frame_4.Size = UDim2.fromScale(1, 0);
            l_Frame_4.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_4.BackgroundTransparency = 1;
            l_Frame_4.BorderSizePixel = 0;
            l_Frame_4.ZIndex = v29.ZIndex + 1;
            l_Frame_4.LayoutOrder = v29.ZIndex + 1;
            l_Frame_4.Visible = false;
            v2.UIListLayout(l_Frame_4, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            v2.UIPadding(l_Frame_4, Vector2.new(0, 0)).PaddingTop = UDim.new(0, v1._config.ItemSpacing.Y);
            l_Frame_4.Parent = l_Frame_3;
            local l_Frame_5 = Instance.new("Frame");
            l_Frame_5.Name = "Header";
            l_Frame_5.Size = UDim2.fromScale(1, 0);
            l_Frame_5.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_5.BackgroundTransparency = 1;
            l_Frame_5.BorderSizePixel = 0;
            l_Frame_5.ZIndex = v29.ZIndex;
            l_Frame_5.LayoutOrder = v29.ZIndex;
            l_Frame_5.Parent = l_Frame_3;
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "Button";
            l_TextButton_1.Size = UDim2.new(1, 2 * v1._config.FramePadding.X, 0, 0);
            l_TextButton_1.Position = UDim2.fromOffset(-4, 0);
            l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_1.BackgroundColor3 = v1._config.HeaderColor;
            l_TextButton_1.BackgroundTransparency = v1._config.HeaderTransparency;
            l_TextButton_1.BorderSizePixel = 0;
            l_TextButton_1.Text = "";
            l_TextButton_1.ZIndex = v29.ZIndex;
            l_TextButton_1.LayoutOrder = v29.ZIndex;
            l_TextButton_1.AutoButtonColor = false;
            l_TextButton_1.ClipsDescendants = true;
            v2.UIPadding(l_TextButton_1, Vector2.new(2 * v1._config.FramePadding.X, v1._config.FramePadding.Y));
            v2.applyFrameStyle(l_TextButton_1, true, true);
            v2.UIListLayout(l_TextButton_1, Enum.FillDirection.Horizontal, UDim.new(0, 2 * v1._config.FramePadding.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            v2.applyInteractionHighlights(l_TextButton_1, l_TextButton_1, {
                ButtonColor = v1._config.HeaderColor, 
                ButtonTransparency = v1._config.HeaderTransparency, 
                ButtonHoveredColor = v1._config.HeaderHoveredColor, 
                ButtonHoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ButtonActiveColor = v1._config.HeaderActiveColor, 
                ButtonActiveTransparency = v1._config.HeaderActiveTransparency
            });
            l_TextButton_1.Parent = l_Frame_5;
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "Arrow";
            l_ImageLabel_1.Size = UDim2.fromOffset(v1._config.TextSize, (math.ceil(v1._config.TextSize * 0.8)));
            l_ImageLabel_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.BorderSizePixel = 0;
            l_ImageLabel_1.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_1.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_1.ScaleType = Enum.ScaleType.Fit;
            l_ImageLabel_1.ZIndex = v29.ZIndex;
            l_ImageLabel_1.LayoutOrder = v29.ZIndex;
            l_ImageLabel_1.Parent = l_TextButton_1;
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "TextLabel";
            l_TextLabel_2.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.BorderSizePixel = 0;
            l_TextLabel_2.ZIndex = v29.ZIndex;
            l_TextLabel_2.LayoutOrder = v29.ZIndex;
            v2.UIPadding(l_TextLabel_2, Vector2.new(0, 0)).PaddingRight = UDim.new(0, 21);
            v2.applyTextStyle(l_TextLabel_2);
            l_TextLabel_2.Parent = l_TextButton_1;
            l_TextButton_1.MouseButton1Click:Connect(function() --[[ Line: 296 ]]
                -- upvalues: v29 (copy)
                v29.state.isUncollapsed:set(not v29.state.isUncollapsed.value);
            end);
            return l_Frame_3;
        end, 
        Update = function(v36) --[[ Line: 302 ]] --[[ Name: Update ]]
            v36.Instance.Header.Button.TextLabel.Text = v36.arguments.Text or "Collapsing Header";
        end
    }));
end;