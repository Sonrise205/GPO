local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    v1.WidgetConstructor("Separator", {
        hasState = false, 
        hasChildren = false, 
        Args = {}, 
        Events = {}, 
        Generate = function(v3) --[[ Line: 9 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_Separator";
            l_Frame_0.BackgroundColor3 = v1._config.SeparatorColor;
            l_Frame_0.BackgroundTransparency = v1._config.SeparatorTransparency;
            l_Frame_0.BorderSizePixel = 0;
            if v3.parentWidget.type == "SameLine" then
                l_Frame_0.Size = UDim2.new(0, 1, 1, 0);
            else
                l_Frame_0.Size = UDim2.new(1, 0, 0, 1);
            end;
            l_Frame_0.ZIndex = v3.ZIndex;
            l_Frame_0.LayoutOrder = v3.ZIndex;
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Vertical, UDim.new(0, 0));
            return l_Frame_0;
        end, 
        Update = function(_) --[[ Line: 28 ]] --[[ Name: Update ]]

        end, 
        Discard = function(v6) --[[ Line: 29 ]] --[[ Name: Discard ]]
            v6.Instance:Destroy();
        end
    });
    v1.WidgetConstructor("Indent", {
        hasState = false, 
        hasChildren = true, 
        Args = {
            Width = 1
        }, 
        Events = {}, 
        Generate = function(v7) --[[ Line: 41 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "Iris_Indent";
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.Size = UDim2.fromScale(1, 0);
            l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_1.ZIndex = v7.ZIndex;
            l_Frame_1.LayoutOrder = v7.ZIndex;
            v2.UIListLayout(l_Frame_1, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            v2.UIPadding(l_Frame_1, Vector2.new(0, 0));
            return l_Frame_1;
        end, 
        Update = function(v9) --[[ Line: 56 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_Instance_0 = v9.Instance;
            local v11 = nil;
            v11 = if v9.arguments.Width then v9.arguments.Width else v1._config.IndentSpacing;
            l_Instance_0.UIPadding.PaddingLeft = UDim.new(0, v11);
        end, 
        Discard = function(v12) --[[ Line: 67 ]] --[[ Name: Discard ]]
            v12.Instance:Destroy();
        end, 
        ChildAdded = function(v13, _) --[[ Line: 70 ]] --[[ Name: ChildAdded ]]
            return v13.Instance;
        end
    });
    v1.WidgetConstructor("SameLine", {
        hasState = false, 
        hasChildren = true, 
        Args = {
            Width = 1, 
            VerticalAlignment = 2
        }, 
        Events = {}, 
        Generate = function(v15) --[[ Line: 83 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy)
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "Iris_SameLine";
            l_Frame_2.BackgroundTransparency = 1;
            l_Frame_2.BorderSizePixel = 0;
            l_Frame_2.Size = UDim2.fromScale(1, 0);
            l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_2.ZIndex = v15.ZIndex;
            l_Frame_2.LayoutOrder = v15.ZIndex;
            v2.UIListLayout(l_Frame_2, Enum.FillDirection.Horizontal, UDim.new(0, 0));
            return l_Frame_2;
        end, 
        Update = function(v17) --[[ Line: 97 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_UIListLayout_0 = v17.Instance.UIListLayout;
            local v19 = nil;
            v19 = if v17.arguments.Width then v17.arguments.Width else v1._config.ItemSpacing.X;
            l_UIListLayout_0.Padding = UDim.new(0, v19);
            if v17.arguments.VerticalAlignment then
                l_UIListLayout_0.VerticalAlignment = v17.arguments.VerticalAlignment;
                return;
            else
                l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
                return;
            end;
        end, 
        Discard = function(v20) --[[ Line: 113 ]] --[[ Name: Discard ]]
            v20.Instance:Destroy();
        end, 
        ChildAdded = function(v21, _) --[[ Line: 116 ]] --[[ Name: ChildAdded ]]
            return v21.Instance;
        end
    });
    v1.WidgetConstructor("Group", {
        hasState = false, 
        hasChildren = true, 
        Args = {}, 
        Events = {}, 
        Generate = function(v23) --[[ Line: 126 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Frame_3 = Instance.new("Frame");
            l_Frame_3.Name = "Iris_Group";
            l_Frame_3.BackgroundTransparency = 1;
            l_Frame_3.BorderSizePixel = 0;
            l_Frame_3.Size = UDim2.fromOffset(0, 0);
            l_Frame_3.AutomaticSize = Enum.AutomaticSize.XY;
            l_Frame_3.ZIndex = v23.ZIndex;
            l_Frame_3.LayoutOrder = v23.ZIndex;
            l_Frame_3.ClipsDescendants = true;
            v2.UIListLayout(l_Frame_3, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.X));
            return l_Frame_3;
        end, 
        Update = function(_) --[[ Line: 141 ]] --[[ Name: Update ]]

        end, 
        Discard = function(v26) --[[ Line: 142 ]] --[[ Name: Discard ]]
            v26.Instance:Destroy();
        end, 
        ChildAdded = function(v27, _) --[[ Line: 145 ]] --[[ Name: ChildAdded ]]
            return v27.Instance;
        end
    });
end;