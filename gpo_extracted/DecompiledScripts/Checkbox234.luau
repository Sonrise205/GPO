local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    v1.WidgetConstructor("Checkbox", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1
        }, 
        Events = {
            checked = {
                Init = function(_) --[[ Line: 12 ]]

                end, 
                Get = function(v4) --[[ Line: 13 ]]
                    -- upvalues: v1 (copy)
                    return v4.lastCheckedTick == v1._cycleTick;
                end
            }, 
            unchecked = {
                Init = function(_) --[[ Line: 18 ]]

                end, 
                Get = function(v6) --[[ Line: 19 ]]
                    -- upvalues: v1 (copy)
                    return v6.lastUncheckedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v7) --[[ Line: 23 ]]
                return v7.Instance;
            end)
        }, 
        Generate = function(v8) --[[ Line: 27 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "Iris_Checkbox";
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Size = UDim2.fromOffset(0, 0);
            l_TextButton_0.Text = "";
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextButton_0.ZIndex = v8.ZIndex;
            l_TextButton_0.AutoButtonColor = false;
            l_TextButton_0.LayoutOrder = v8.ZIndex;
            local v10 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "CheckboxBox";
            l_Frame_0.Size = UDim2.fromOffset(v10, v10);
            l_Frame_0.BackgroundColor3 = v1._config.FrameBgColor;
            l_Frame_0.BackgroundTransparency = v1._config.FrameBgTransparency;
            l_Frame_0.ZIndex = v8.ZIndex + 1;
            l_Frame_0.LayoutOrder = v8.ZIndex + 1;
            v2.applyFrameStyle(l_Frame_0, true);
            v2.applyInteractionHighlights(l_TextButton_0, l_Frame_0, {
                ButtonColor = v1._config.FrameBgColor, 
                ButtonTransparency = v1._config.FrameBgTransparency, 
                ButtonHoveredColor = v1._config.FrameBgHoveredColor, 
                ButtonHoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                ButtonActiveColor = v1._config.FrameBgActiveColor, 
                ButtonActiveTransparency = v1._config.FrameBgActiveTransparency
            });
            l_Frame_0.Parent = l_TextButton_0;
            local v12 = math.ceil(v10 * 0.1);
            local v13 = v10 - v12 * 2;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Checkmark";
            l_ImageLabel_0.Size = UDim2.fromOffset(v13, v13);
            l_ImageLabel_0.Position = UDim2.fromOffset(v12, v12);
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.ImageColor3 = v1._config.CheckMarkColor;
            l_ImageLabel_0.ImageTransparency = v1._config.CheckMarkTransparency;
            l_ImageLabel_0.ScaleType = Enum.ScaleType.Fit;
            l_ImageLabel_0.ZIndex = v8.ZIndex + 2;
            l_ImageLabel_0.LayoutOrder = v8.ZIndex + 2;
            l_ImageLabel_0.Parent = l_TextButton_0;
            l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 77 ]]
                -- upvalues: v8 (copy)
                local l_value_0 = v8.state.isChecked.value;
                v8.state.isChecked:set(not l_value_0);
            end);
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "TextLabel";
            v2.applyTextStyle(l_TextLabel_0);
            l_TextLabel_0.AnchorPoint = Vector2.new(0, 0.5);
            l_TextLabel_0.Position = UDim2.new(0, v10 + v1._config.ItemInnerSpacing.X, 0.5, 0);
            l_TextLabel_0.ZIndex = v8.ZIndex + 1;
            l_TextLabel_0.LayoutOrder = v8.ZIndex + 1;
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.BorderSizePixel = 0;
            l_TextLabel_0.Parent = l_TextButton_0;
            return l_TextButton_0;
        end, 
        Update = function(v17) --[[ Line: 96 ]] --[[ Name: Update ]]
            v17.Instance.TextLabel.Text = v17.arguments.Text or "Checkbox";
        end, 
        Discard = function(v18) --[[ Line: 100 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v18.Instance:Destroy();
            v2.discardState(v18);
        end, 
        GenerateState = function(v19) --[[ Line: 104 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v19.state.isChecked == nil then
                v19.state.isChecked = v1._widgetState(v19, "checked", false);
            end;
        end, 
        UpdateState = function(v20) --[[ Line: 109 ]] --[[ Name: UpdateState ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Checkmark_0 = v20.Instance.Checkmark;
            if v20.state.isChecked.value then
                l_Checkmark_0.Image = v2.ICONS.CHECK_MARK;
                v20.lastCheckedTick = v1._cycleTick + 1;
                return;
            else
                l_Checkmark_0.Image = "";
                v20.lastUncheckedTick = v1._cycleTick + 1;
                return;
            end;
        end
    });
end;