local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    v1.WidgetConstructor("RadioButton", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Index = 2
        }, 
        Events = {
            selected = {
                Init = function(_) --[[ Line: 13 ]]

                end, 
                Get = function(v4) --[[ Line: 14 ]]
                    -- upvalues: v1 (copy)
                    return v4.lastSelectedTick == v1._cycleTick;
                end
            }, 
            unselected = {
                Init = function(_) --[[ Line: 19 ]]

                end, 
                Get = function(v6) --[[ Line: 20 ]]
                    -- upvalues: v1 (copy)
                    return v6.lastUnselectedTick == v1._cycleTick;
                end
            }, 
            active = {
                Init = function(_) --[[ Line: 25 ]]

                end, 
                Get = function(v8) --[[ Line: 26 ]]
                    return v8.state.index.value == v8.arguments.Index;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v9) --[[ Line: 30 ]]
                return v9.Instance;
            end)
        }, 
        Generate = function(v10) --[[ Line: 34 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "Iris_RadioButton";
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Size = UDim2.fromOffset(0, 0);
            l_TextButton_0.Text = "";
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextButton_0.ZIndex = v10.ZIndex;
            l_TextButton_0.AutoButtonColor = false;
            l_TextButton_0.LayoutOrder = v10.ZIndex;
            local v12 = v1._config.TextSize + 2 * (v1._config.FramePadding.Y - 1);
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Button";
            l_Frame_0.Size = UDim2.fromOffset(v12, v12);
            l_Frame_0.ZIndex = v10.ZIndex + 1;
            l_Frame_0.LayoutOrder = v10.ZIndex + 1;
            l_Frame_0.Parent = l_TextButton_0;
            l_Frame_0.BackgroundColor3 = v1._config.FrameBgColor;
            l_Frame_0.BackgroundTransparency = v1._config.FrameBgTransparency;
            v2.UICorner(l_Frame_0);
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "Circle";
            l_Frame_1.Position = UDim2.fromOffset(v1._config.FramePadding.Y, v1._config.FramePadding.Y);
            l_Frame_1.Size = UDim2.fromOffset(v1._config.TextSize - 2, v1._config.TextSize - 2);
            l_Frame_1.ZIndex = v10.ZIndex + 1;
            l_Frame_1.LayoutOrder = v10.ZIndex + 1;
            l_Frame_1.Parent = l_Frame_0;
            l_Frame_1.BackgroundColor3 = v1._config.CheckMarkColor;
            l_Frame_1.BackgroundTransparency = v1._config.CheckMarkTransparency;
            v2.UICorner(l_Frame_1);
            v2.applyInteractionHighlights(l_TextButton_0, l_Frame_0, {
                ButtonColor = v1._config.FrameBgColor, 
                ButtonTransparency = v1._config.FrameBgTransparency, 
                ButtonHoveredColor = v1._config.FrameBgHoveredColor, 
                ButtonHoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                ButtonActiveColor = v1._config.FrameBgActiveColor, 
                ButtonActiveTransparency = v1._config.FrameBgActiveTransparency
            });
            l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 78 ]]
                -- upvalues: v10 (copy)
                v10.state.index:set(v10.arguments.Index);
            end);
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "TextLabel";
            v2.applyTextStyle(l_TextLabel_0);
            l_TextLabel_0.Position = UDim2.new(0, v12 + v1._config.ItemInnerSpacing.X, 0.5, 0);
            l_TextLabel_0.ZIndex = v10.ZIndex + 1;
            l_TextLabel_0.LayoutOrder = v10.ZIndex + 1;
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_0.AnchorPoint = Vector2.new(0, 0.5);
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.BorderSizePixel = 0;
            l_TextLabel_0.Parent = l_TextButton_0;
            return l_TextButton_0;
        end, 
        Update = function(v16) --[[ Line: 96 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            v16.Instance.TextLabel.Text = v16.arguments.Text or "Radio Button";
            if v16.state then
                v1._widgets[v16.type].UpdateState(v16);
            end;
        end, 
        Discard = function(v17) --[[ Line: 105 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v17.Instance:Destroy();
            v2.discardState(v17);
        end, 
        GenerateState = function(v18) --[[ Line: 109 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v18.state.index == nil then
                v18.state.index = v1._widgetState(v18, "index", v18.arguments.Value);
            end;
        end, 
        UpdateState = function(v19) --[[ Line: 114 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy)
            local l_Circle_0 = v19.Instance.Button.Circle;
            if v19.state.index.value == v19.arguments.Index then
                l_Circle_0.BackgroundTransparency = v1._config.CheckMarkTransparency;
                v19.lastSelectedTick = v1._cycleTick + 1;
                return;
            else
                l_Circle_0.BackgroundTransparency = 1;
                v19.lastUnselectedTick = v1._cycleTick + 1;
                return;
            end;
        end
    });
end;