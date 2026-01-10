local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v3 = {};
    table.insert(v1._postCycleCallbacks, function() --[[ Line: 7 ]]
        -- upvalues: v3 (copy)
        for _, v5 in v3 do
            v5.RowColumnIndex = 0;
        end;
    end);
    v1.WidgetConstructor("Table", {
        hasState = false, 
        hasChildren = true, 
        Args = {
            NumColumns = 1, 
            RowBg = 2, 
            BordersOuter = 3, 
            BordersInner = 4
        }, 
        Events = {
            hovered = v2.EVENTS.hover(function(v6) --[[ Line: 23 ]]
                return v6.Instance;
            end)
        }, 
        Generate = function(v7) --[[ Line: 27 ]] --[[ Name: Generate ]]
            -- upvalues: v3 (copy), v1 (copy), v2 (copy)
            v3[v7.ID] = v7;
            v7.InitialNumColumns = -1;
            v7.RowColumnIndex = 0;
            v7.ColumnInstances = {};
            v7.CellInstances = {};
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_Table";
            l_Frame_0.Size = UDim2.new(v1._config.ItemWidth, UDim.new(0, 0));
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.ZIndex = v7.ZIndex + 1024;
            l_Frame_0.LayoutOrder = v7.ZIndex;
            l_Frame_0.ClipsDescendants = true;
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Horizontal, UDim.new(0, 0));
            v2.UIStroke(l_Frame_0, 1, v1._config.TableBorderStrongColor, v1._config.TableBorderStrongTransparency);
            return l_Frame_0;
        end, 
        Update = function(v9) --[[ Line: 51 ]] --[[ Name: Update ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Instance_0 = v9.Instance;
            if v9.arguments.BordersOuter == false then
                l_Instance_0.UIStroke.Thickness = 0;
            else
                l_Instance_0.UIStroke.Thickness = 1;
            end;
            if v9.InitialNumColumns == -1 then
                if v9.arguments.NumColumns == nil then
                    error("Iris.Table NumColumns argument is required", 5);
                end;
                v9.InitialNumColumns = v9.arguments.NumColumns;
                for v11 = 1, v9.InitialNumColumns do
                    local v12 = v9.ZIndex + 1 + v11;
                    local l_Frame_1 = Instance.new("Frame");
                    l_Frame_1.Name = ("Column_%*"):format(v11);
                    l_Frame_1.Size = UDim2.new(1 / v9.InitialNumColumns, 0, 0, 0);
                    l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
                    l_Frame_1.BackgroundTransparency = 1;
                    l_Frame_1.BorderSizePixel = 0;
                    l_Frame_1.ZIndex = v12;
                    l_Frame_1.LayoutOrder = v12;
                    l_Frame_1.ClipsDescendants = true;
                    v2.UIListLayout(l_Frame_1, Enum.FillDirection.Vertical, UDim.new(0, 0));
                    v9.ColumnInstances[v11] = l_Frame_1;
                    l_Frame_1.Parent = l_Instance_0;
                end;
            elseif v9.arguments.NumColumns ~= v9.InitialNumColumns then
                error("Iris.Table NumColumns Argument must be static");
            end;
            if v9.arguments.RowBg == false then
                for _, v15 in v9.CellInstances do
                    v15.BackgroundTransparency = 1;
                end;
            else
                for v16, v17 in v9.CellInstances do
                    v17.BackgroundTransparency = if math.ceil(v16 / v9.InitialNumColumns) % 2 == 0 then v1._config.TableRowBgAltTransparency else v1._config.TableRowBgTransparency;
                end;
            end;
            if v9.arguments.BordersInner == false then
                for _, v19 in v9.CellInstances do
                    v19.UIStroke.Thickness = 0;
                end;
                return;
            else
                for _, v21 in v9.CellInstances do
                    v21.UIStroke.Thickness = 0.5;
                end;
                return;
            end;
        end, 
        Discard = function(v22) --[[ Line: 113 ]] --[[ Name: Discard ]]
            -- upvalues: v3 (copy)
            v3[v22.ID] = nil;
            v22.Instance:Destroy();
        end, 
        ChildAdded = function(v23) --[[ Line: 117 ]] --[[ Name: ChildAdded ]]
            -- upvalues: v2 (copy), v1 (copy)
            if v23.RowColumnIndex == 0 then
                v23.RowColumnIndex = 1;
            end;
            local v24 = v23.CellInstances[v23.RowColumnIndex];
            if v24 then
                return v24;
            else
                local v25 = v23.ColumnInstances[(v23.RowColumnIndex - 1) % v23.InitialNumColumns + 1];
                local v26 = v25.ZIndex + v23.RowColumnIndex;
                local l_Frame_2 = Instance.new("Frame");
                l_Frame_2.Name = ("Cell_%*"):format(v23.RowColumnIndex);
                l_Frame_2.Size = UDim2.new(1, 0, 0, 0);
                l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
                l_Frame_2.BackgroundTransparency = 1;
                l_Frame_2.BorderSizePixel = 0;
                l_Frame_2.ZIndex = v26;
                l_Frame_2.LayoutOrder = v26;
                l_Frame_2.ClipsDescendants = true;
                v2.UIPadding(l_Frame_2, v1._config.CellPadding);
                v2.UIListLayout(l_Frame_2, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
                if v23.arguments.BordersInner == false then
                    v2.UIStroke(l_Frame_2, 0, v1._config.TableBorderLightColor, v1._config.TableBorderLightTransparency);
                else
                    v2.UIStroke(l_Frame_2, 0.5, v1._config.TableBorderLightColor, v1._config.TableBorderLightTransparency);
                end;
                if v23.arguments.RowBg ~= false then
                    local v28 = math.ceil(v23.RowColumnIndex / v23.InitialNumColumns);
                    local v29 = if v28 % 2 == 0 then v1._config.TableRowBgAltColor else v1._config.TableRowBgColor;
                    local v30 = if v28 % 2 == 0 then v1._config.TableRowBgAltTransparency else v1._config.TableRowBgTransparency;
                    l_Frame_2.BackgroundColor3 = v29;
                    l_Frame_2.BackgroundTransparency = v30;
                end;
                v23.CellInstances[v23.RowColumnIndex] = l_Frame_2;
                l_Frame_2.Parent = v25;
                return l_Frame_2;
            end;
        end
    });
end;