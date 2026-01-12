local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v3 = 0;
    v1.WidgetConstructor("Root", {
        hasState = false, 
        hasChildren = true, 
        Args = {}, 
        Events = {}, 
        Generate = function(_) --[[ Line: 11 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "Iris_Root";
            local v6 = nil;
            if v1._config.UseScreenGUIs then
                v6 = Instance.new("ScreenGui");
                v6.ResetOnSpawn = false;
                v6.DisplayOrder = v1._config.DisplayOrderOffset;
                v6.IgnoreGuiInset = v1._config.IgnoreGuiInset;
            else
                v6 = Instance.new("Folder");
            end;
            v6.Name = "PseudoWindowScreenGui";
            v6.Parent = l_Folder_0;
            local v7 = nil;
            if v1._config.UseScreenGUIs then
                v7 = Instance.new("ScreenGui");
                v7.ResetOnSpawn = false;
                v7.DisplayOrder = v1._config.DisplayOrderOffset + 1024;
                v7.IgnoreGuiInset = v1._config.IgnoreGuiInset;
                local l_Frame_0 = Instance.new("Frame");
                l_Frame_0.Name = "TooltipContainer";
                l_Frame_0.AutomaticSize = Enum.AutomaticSize.XY;
                l_Frame_0.Size = UDim2.fromOffset(0, 0);
                l_Frame_0.BackgroundTransparency = 1;
                l_Frame_0.BorderSizePixel = 0;
                v2.UIListLayout(l_Frame_0, Enum.FillDirection.Vertical, UDim.new(0, v1._config.PopupBorderSize));
                l_Frame_0.Parent = v7;
                local l_Frame_1 = Instance.new("Frame");
                l_Frame_1.Name = "MenuBarContainer";
                l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
                l_Frame_1.Size = UDim2.fromScale(1, 0);
                l_Frame_1.BackgroundTransparency = 1;
                l_Frame_1.BorderSizePixel = 0;
                l_Frame_1.Parent = v7;
            else
                v7 = Instance.new("Folder");
            end;
            v7.Name = "PopupScreenGui";
            v7.Parent = l_Folder_0;
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "PseudoWindow";
            l_Frame_2.Size = UDim2.new(0, 0, 0, 0);
            l_Frame_2.Position = UDim2.fromOffset(0, 22);
            l_Frame_2.AutomaticSize = Enum.AutomaticSize.XY;
            l_Frame_2.BackgroundTransparency = v1._config.WindowBgTransparency;
            l_Frame_2.BackgroundColor3 = v1._config.WindowBgColor;
            l_Frame_2.BorderSizePixel = v1._config.WindowBorderSize;
            l_Frame_2.BorderColor3 = v1._config.BorderColor;
            l_Frame_2.Selectable = false;
            l_Frame_2.SelectionGroup = true;
            l_Frame_2.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
            l_Frame_2.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
            l_Frame_2.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
            l_Frame_2.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
            l_Frame_2.Visible = false;
            v2.UIPadding(l_Frame_2, v1._config.WindowPadding);
            v2.UIListLayout(l_Frame_2, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            l_Frame_2.Parent = v6;
            return l_Folder_0;
        end, 
        Update = function(v11) --[[ Line: 85 ]] --[[ Name: Update ]]
            -- upvalues: v3 (ref)
            if v3 > 0 then
                v11.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = true;
            end;
        end, 
        Discard = function(v12) --[[ Line: 93 ]] --[[ Name: Discard ]]
            -- upvalues: v3 (ref)
            v3 = 0;
            v12.Instance:Destroy();
        end, 
        ChildAdded = function(v13, v14) --[[ Line: 97 ]] --[[ Name: ChildAdded ]]
            -- upvalues: v3 (ref)
            local l_Instance_0 = v13.Instance;
            if v14.type == "Window" then
                return v13.Instance;
            elseif v14.type == "Tooltip" then
                return l_Instance_0.PopupScreenGui.TooltipContainer;
            elseif v14.type == "MenuBar" then
                return l_Instance_0.PopupScreenGui.MenuBarContainer;
            else
                local l_PseudoWindow_0 = l_Instance_0.PseudoWindowScreenGui.PseudoWindow;
                v3 = v3 + 1;
                l_PseudoWindow_0.Visible = true;
                return l_PseudoWindow_0;
            end;
        end, 
        ChildDiscarded = function(v17, v18) --[[ Line: 116 ]] --[[ Name: ChildDiscarded ]]
            -- upvalues: v3 (ref)
            if v18.type ~= "Window" and v18.type ~= "Tooltip" and v18.type ~= "MenuBar" then
                v3 = v3 - 1;
                if v3 == 0 then
                    v17.Instance.PseudoWindowScreenGui.PseudoWindow.Visible = false;
                end;
            end;
        end
    });
end;