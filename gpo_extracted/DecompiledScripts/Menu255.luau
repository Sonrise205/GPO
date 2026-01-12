return function(v0) --[[ Line: 1 ]]
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Name = "Menu";
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.ZIndex = 1;
    l_ScrollingFrame_0.Size = UDim2.fromScale(1, 1);
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.TopImage = "";
    l_ScrollingFrame_0.BottomImage = "";
    l_ScrollingFrame_0.HorizontalScrollBarInset = Enum.ScrollBarInset.Always;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 1, -1);
    l_ScrollingFrame_0.ScrollingEnabled = true;
    l_ScrollingFrame_0.ScrollingDirection = Enum.ScrollingDirection.X;
    l_ScrollingFrame_0.ZIndex = 20;
    l_ScrollingFrame_0.ScrollBarThickness = 3;
    l_ScrollingFrame_0.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
    l_ScrollingFrame_0.ScrollBarImageTransparency = 0.8;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Selectable = false;
    local v2 = require(v0.iconModule);
    local v3 = v2.container.TopbarStandard:FindFirstChild("UIListLayout", true):Clone();
    v3.Name = "MenuUIListLayout";
    v3.VerticalAlignment = Enum.VerticalAlignment.Center;
    v3.Parent = l_ScrollingFrame_0;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "MenuGap";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Visible = false;
    l_Frame_0.AnchorPoint = Vector2.new(0, 0.5);
    l_Frame_0.ZIndex = 5;
    l_Frame_0.Parent = l_ScrollingFrame_0;
    local v5 = false;
    local v6 = require(script.Parent.Parent.Features.Themes);
    local function v36() --[[ Line: 39 ]] --[[ Name: totalChildrenChanged ]]
        -- upvalues: v0 (copy), v5 (ref), l_ScrollingFrame_0 (copy), v6 (copy), v3 (copy)
        local l_menuJanitor_0 = v0.menuJanitor;
        local v8 = #v0.menuIcons;
        if v5 then
            if v8 <= 0 then
                l_menuJanitor_0:clean();
                v5 = false;
            end;
            return;
        else
            v5 = true;
            l_menuJanitor_0:add(v0.toggled:Connect(function() --[[ Line: 53 ]]
                -- upvalues: v0 (ref)
                if #v0.menuIcons > 0 then
                    v0.updateSize:Fire();
                end;
            end));
            local _, v10 = v0:modifyTheme({
                {
                    "Menu", 
                    "Active", 
                    true
                }
            });
            task.defer(function() --[[ Line: 63 ]]
                -- upvalues: l_menuJanitor_0 (copy), v0 (ref), v10 (copy)
                l_menuJanitor_0:add(function() --[[ Line: 64 ]]
                    -- upvalues: v0 (ref), v10 (ref)
                    v0:removeModification(v10);
                end);
            end);
            local l_X_0 = l_ScrollingFrame_0.AbsoluteCanvasSize.X;
            local function v14() --[[ Line: 73 ]] --[[ Name: rightAlignCanvas ]]
                -- upvalues: v0 (ref), l_ScrollingFrame_0 (ref), l_X_0 (ref)
                if v0.alignment == "Right" then
                    local l_X_1 = l_ScrollingFrame_0.AbsoluteCanvasSize.X;
                    local v13 = l_X_0 - l_X_1;
                    l_X_0 = l_X_1;
                    l_ScrollingFrame_0.CanvasPosition = Vector2.new(l_ScrollingFrame_0.CanvasPosition.X - v13, 0);
                end;
            end;
            l_menuJanitor_0:add(v0.selected:Connect(v14));
            l_menuJanitor_0:add(l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v14));
            local v15 = v0:getStateGroup();
            if v6.getThemeValue(v15, "IconImage", "Image", "Deselected") == v6.getThemeValue(v15, "IconImage", "Image", "Selected") then
                local v16 = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Light, Enum.FontStyle.Normal);
                v0:removeModificationWith("IconLabel", "Text", "Viewing");
                v0:removeModificationWith("IconLabel", "Image", "Viewing");
                v0:modifyTheme({
                    {
                        "IconLabel", 
                        "FontFace", 
                        v16, 
                        "Selected"
                    }, 
                    {
                        "IconLabel", 
                        "Text", 
                        "X", 
                        "Selected"
                    }, 
                    {
                        "IconLabel", 
                        "TextSize", 
                        20, 
                        "Selected"
                    }, 
                    {
                        "IconLabel", 
                        "TextStrokeTransparency", 
                        0.8, 
                        "Selected"
                    }, 
                    {
                        "IconImage", 
                        "Image", 
                        "", 
                        "Selected"
                    }
                });
            end;
            local v17 = v0:getInstance("MenuGap");
            local function v21() --[[ Line: 104 ]] --[[ Name: updateAlignent ]]
                -- upvalues: v0 (ref), v17 (copy)
                local l_alignment_0 = v0.alignment;
                local v19 = -99999;
                local v20 = -99998;
                if l_alignment_0 == "Right" then
                    v19 = 99999;
                    v20 = 99998;
                end;
                v0:modifyTheme({
                    "IconSpot", 
                    "LayoutOrder", 
                    v19
                });
                v17.LayoutOrder = v20;
            end;
            l_menuJanitor_0:add(v0.alignmentChanged:Connect(v21));
            local l_alignment_1 = v0.alignment;
            local v23 = -99999;
            local v24 = -99998;
            if l_alignment_1 == "Right" then
                v23 = 99999;
                v24 = 99998;
            end;
            v0:modifyTheme({
                "IconSpot", 
                "LayoutOrder", 
                v23
            });
            v17.LayoutOrder = v24;
            l_ScrollingFrame_0:GetAttributeChangedSignal("MenuCanvasWidth"):Connect(function() --[[ Line: 120 ]]
                -- upvalues: l_ScrollingFrame_0 (ref)
                local l_l_ScrollingFrame_0_Attribute_0 = l_ScrollingFrame_0:GetAttribute("MenuCanvasWidth");
                local l_Y_0 = l_ScrollingFrame_0.CanvasSize.Y;
                l_ScrollingFrame_0.CanvasSize = UDim2.new(0, l_l_ScrollingFrame_0_Attribute_0, l_Y_0.Scale, l_Y_0.Offset);
            end);
            l_menuJanitor_0:add(v0.updateMenu:Connect(function() --[[ Line: 125 ]]
                -- upvalues: l_ScrollingFrame_0 (ref), v3 (ref)
                local l_l_ScrollingFrame_0_Attribute_1 = l_ScrollingFrame_0:GetAttribute("MaxIcons");
                if not l_l_ScrollingFrame_0_Attribute_1 then
                    return;
                else
                    local v28 = {};
                    for _, v30 in pairs(l_ScrollingFrame_0:GetChildren()) do
                        if v30:GetAttribute("WidgetUID") and v30.Visible then
                            table.insert(v28, {
                                v30, 
                                v30.AbsolutePosition.X
                            });
                        end;
                    end;
                    table.sort(v28, function(v31, v32) --[[ Line: 137 ]]
                        return v31[2] < v32[2];
                    end);
                    local v33 = 0;
                    for v34 = 1, l_l_ScrollingFrame_0_Attribute_1 do
                        local v35 = v28[v34];
                        if v35 then
                            v33 = v33 + (v35[1].AbsoluteSize.X + v3.Padding.Offset);
                        else
                            break;
                        end;
                    end;
                    l_ScrollingFrame_0:SetAttribute("MenuWidth", v33);
                    return;
                end;
            end));
            l_alignment_1 = function() --[[ Line: 152 ]] --[[ Name: startMenuUpdate ]]
                -- upvalues: v0 (ref)
                task.delay(0.1, function() --[[ Line: 153 ]]
                    -- upvalues: v0 (ref)
                    v0.startMenuUpdate:Fire();
                end);
            end;
            l_menuJanitor_0:add(l_ScrollingFrame_0.ChildAdded:Connect(l_alignment_1));
            l_menuJanitor_0:add(l_ScrollingFrame_0.ChildRemoved:Connect(l_alignment_1));
            l_menuJanitor_0:add(l_ScrollingFrame_0:GetAttributeChangedSignal("MaxIcons"):Connect(l_alignment_1));
            l_menuJanitor_0:add(l_ScrollingFrame_0:GetAttributeChangedSignal("MaxWidth"):Connect(l_alignment_1));
            task.delay(0.1, function() --[[ Line: 153 ]]
                -- upvalues: v0 (ref)
                v0.startMenuUpdate:Fire();
            end);
            return;
        end;
    end;
    v0.menuChildAdded:Connect(v36);
    v0.menuSet:Connect(function(v37) --[[ Line: 165 ]]
        -- upvalues: v0 (copy), v2 (copy)
        for _, v39 in pairs(v0.menuIcons) do
            v2.getIconByUID(v39):destroy();
        end;
        if type(v37) == "table" then
            for _, v41 in pairs(v37) do
                v41:joinMenu(v0);
            end;
        end;
    end);
    return l_ScrollingFrame_0;
end;