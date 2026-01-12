local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    v1.WidgetConstructor("Text", {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Wrapped = 2, 
            Color = 3, 
            RichText = 4
        }, 
        Events = {
            hovered = v2.EVENTS.hover(function(v3) --[[ Line: 14 ]]
                return v3.Instance;
            end)
        }, 
        Generate = function(v4) --[[ Line: 18 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy)
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "Iris_Text";
            l_TextLabel_0.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.BorderSizePixel = 0;
            l_TextLabel_0.ZIndex = v4.ZIndex;
            l_TextLabel_0.LayoutOrder = v4.ZIndex;
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_0);
            v2.UIPadding(l_TextLabel_0, Vector2.new(0, 2));
            return l_TextLabel_0;
        end, 
        Update = function(v6) --[[ Line: 33 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_Instance_0 = v6.Instance;
            if v6.arguments.Text == nil then
                error("Iris.Text Text Argument is required", 5);
            end;
            if v6.arguments.Wrapped then
                l_Instance_0.TextWrapped = true;
            else
                l_Instance_0.TextWrapped = false;
            end;
            if v6.arguments.Color then
                l_Instance_0.TextColor3 = v6.arguments.Color;
            else
                l_Instance_0.TextColor3 = v1._config.TextColor;
            end;
            if v6.arguments.RichText then
                l_Instance_0.RichText = true;
            else
                l_Instance_0.RichText = false;
            end;
            l_Instance_0.Text = v6.arguments.Text;
        end, 
        Discard = function(v8) --[[ Line: 56 ]] --[[ Name: Discard ]]
            v8.Instance:Destroy();
        end
    });
    v1.WidgetConstructor("SeparatorText", {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Text = 1
        }, 
        Events = {
            hovered = v2.EVENTS.hover(function(v9) --[[ Line: 68 ]]
                return v9.Instance;
            end)
        }, 
        Generate = function(v10) --[[ Line: 72 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_SeparatorText";
            l_Frame_0.Size = UDim2.fromScale(1, 0);
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.ZIndex = v10.ZIndex;
            l_Frame_0.LayoutOrder = v10.ZIndex;
            l_Frame_0.ClipsDescendants = true;
            v2.UIPadding(l_Frame_0, Vector2.new(0, v1._config.SeparatorTextPadding.Y));
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemSpacing.X));
            l_Frame_0.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center;
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Name = "TextLabel";
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.BorderSizePixel = 0;
            l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_1.ZIndex = v10.ZIndex + 1;
            l_TextLabel_1.LayoutOrder = v10.ZIndex + 1;
            v2.applyTextStyle(l_TextLabel_1);
            l_TextLabel_1.Parent = l_Frame_0;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "Left";
            l_Frame_1.AnchorPoint = Vector2.new(1, 0.5);
            l_Frame_1.BackgroundColor3 = v1._config.SeparatorColor;
            l_Frame_1.BackgroundTransparency = v1._config.SeparatorTransparency;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.Size = UDim2.fromOffset(v1._config.SeparatorTextPadding.X - v1._config.ItemSpacing.X, v1._config.SeparatorTextBorderSize);
            l_Frame_1.ZIndex = v10.ZIndex;
            l_Frame_1.LayoutOrder = v10.ZIndex;
            l_Frame_1.Parent = l_Frame_0;
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "Right";
            l_Frame_2.AnchorPoint = Vector2.new(1, 0.5);
            l_Frame_2.BackgroundColor3 = v1._config.SeparatorColor;
            l_Frame_2.BackgroundTransparency = v1._config.SeparatorTransparency;
            l_Frame_2.BorderSizePixel = 0;
            l_Frame_2.Size = UDim2.new(1, 0, 0, v1._config.SeparatorTextBorderSize);
            l_Frame_2.ZIndex = v10.ZIndex + 2;
            l_Frame_2.LayoutOrder = v10.ZIndex + 2;
            l_Frame_2.Parent = l_Frame_0;
            return l_Frame_0;
        end, 
        Update = function(v15) --[[ Line: 126 ]] --[[ Name: Update ]]
            local l_TextLabel_2 = v15.Instance.TextLabel;
            if v15.arguments.Text == nil then
                error("Iris.Text Text Argument is required", 5);
            end;
            l_TextLabel_2.Text = v15.arguments.Text;
        end, 
        Discard = function(v17) --[[ Line: 134 ]] --[[ Name: Discard ]]
            v17.Instance:Destroy();
        end
    });
end;