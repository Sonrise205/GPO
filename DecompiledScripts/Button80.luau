local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v12 = {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Text = 1
        }, 
        Events = {
            clicked = v2.EVENTS.click(function(v3) --[[ Line: 11 ]]
                return v3.Instance;
            end), 
            rightClicked = v2.EVENTS.rightClick(function(v4) --[[ Line: 14 ]]
                return v4.Instance;
            end), 
            doubleClicked = v2.EVENTS.doubleClick(function(v5) --[[ Line: 17 ]]
                return v5.Instance;
            end), 
            ctrlClicked = v2.EVENTS.ctrlClick(function(v6) --[[ Line: 20 ]]
                return v6.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v7) --[[ Line: 23 ]]
                return v7.Instance;
            end)
        }, 
        Generate = function(v8) --[[ Line: 27 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Size = UDim2.fromOffset(0, 0);
            l_TextButton_0.BackgroundColor3 = v1._config.ButtonColor;
            l_TextButton_0.BackgroundTransparency = v1._config.ButtonTransparency;
            l_TextButton_0.AutoButtonColor = false;
            v2.applyTextStyle(l_TextButton_0);
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyFrameStyle(l_TextButton_0);
            v2.applyInteractionHighlights(l_TextButton_0, l_TextButton_0, {
                ButtonColor = v1._config.ButtonColor, 
                ButtonTransparency = v1._config.ButtonTransparency, 
                ButtonHoveredColor = v1._config.ButtonHoveredColor, 
                ButtonHoveredTransparency = v1._config.ButtonHoveredTransparency, 
                ButtonActiveColor = v1._config.ButtonActiveColor, 
                ButtonActiveTransparency = v1._config.ButtonActiveTransparency
            });
            l_TextButton_0.ZIndex = v8.ZIndex;
            l_TextButton_0.LayoutOrder = v8.ZIndex;
            return l_TextButton_0;
        end, 
        Update = function(v10) --[[ Line: 53 ]] --[[ Name: Update ]]
            v10.Instance.Text = v10.arguments.Text or "Button";
        end, 
        Discard = function(v11) --[[ Line: 57 ]] --[[ Name: Discard ]]
            v11.Instance:Destroy();
        end
    };
    v2.abstractButton = v12;
    v1.WidgetConstructor("Button", v2.extend(v12, {
        Generate = function(v13) --[[ Line: 66 ]] --[[ Name: Generate ]]
            -- upvalues: v12 (copy)
            local v14 = v12.Generate(v13);
            v14.Name = "Iris_Button";
            return v14;
        end
    }));
    v1.WidgetConstructor("SmallButton", v2.extend(v12, {
        Generate = function(v15) --[[ Line: 78 ]] --[[ Name: Generate ]]
            -- upvalues: v12 (copy)
            local v16 = v12.Generate(v15);
            v16.Name = "Iris_SmallButton";
            local l_UIPadding_0 = v16.UIPadding;
            l_UIPadding_0.PaddingLeft = UDim.new(0, 2);
            l_UIPadding_0.PaddingRight = UDim.new(0, 2);
            l_UIPadding_0.PaddingTop = UDim.new(0, 0);
            l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
            return v16;
        end
    }));
end;