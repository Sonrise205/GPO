local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Parent.Features.Themes);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), l_TweenService_0 (copy), l_RunService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Dropdown";
    l_Frame_0.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 10);
    l_Frame_0.ZIndex = -2;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Parent = v3.widget;
    local l_GuiService_0 = game:GetService("GuiService");
    v3:setBehaviour("Dropdown", "BackgroundTransparency", function(v6) --[[ Line: 20 ]]
        -- upvalues: l_GuiService_0 (copy)
        local v7 = v6 * l_GuiService_0.PreferredTransparency;
        if v6 == 1 then
            return v6;
        else
            return v7;
        end;
    end);
    v3.janitor:add(l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 28 ]]
        -- upvalues: v3 (copy), l_Frame_0 (copy)
        v3:refreshAppearance(l_Frame_0, "BackgroundTransparency");
    end));
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Name = "DropdownCorner";
    l_UICorner_0.CornerRadius = UDim.new(0, 10);
    l_UICorner_0.Parent = l_Frame_0;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Name = "DropdownScroller";
    l_ScrollingFrame_0.AutomaticSize = Enum.AutomaticSize.X;
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.AnchorPoint = Vector2.new(0, 0);
    l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.ZIndex = -1;
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.None;
    l_ScrollingFrame_0.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right;
    l_ScrollingFrame_0.Active = false;
    l_ScrollingFrame_0.ScrollingEnabled = true;
    l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
    l_ScrollingFrame_0.ScrollBarThickness = 5;
    l_ScrollingFrame_0.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
    l_ScrollingFrame_0.ScrollBarImageTransparency = 0.8;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.Active = true;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "DropdownSpeed";
    l_NumberValue_0.Value = 0.07;
    l_NumberValue_0.Parent = l_Frame_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Name = "DropdownPadding";
    l_UIPadding_0.PaddingTop = UDim.new(0, 0);
    l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
    l_UIPadding_0.Parent = l_ScrollingFrame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Name = "DropdownList";
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Vertical;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_0.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    local l_dropdownJanitor_0 = v3.dropdownJanitor;
    local v14 = require(v3.iconModule);
    v3.dropdownChildAdded:Connect(function(v15) --[[ Line: 81 ]]
        local _, v17 = v15:modifyTheme({
            {
                "Widget", 
                "BorderSize", 
                0
            }, 
            {
                "IconCorners", 
                "CornerRadius", 
                UDim.new(0, 10)
            }, 
            {
                "Widget", 
                "MinimumWidth", 
                190
            }, 
            {
                "Widget", 
                "MinimumHeight", 
                58
            }, 
            {
                "IconLabel", 
                "TextSize", 
                20
            }, 
            {
                "IconOverlay", 
                "Size", 
                UDim2.new(1, 0, 1, 0)
            }, 
            {
                "PaddingLeft", 
                "Size", 
                UDim2.fromOffset(25, 0)
            }, 
            {
                "Notice", 
                "Position", 
                UDim2.new(1, -24, 0, 5)
            }, 
            {
                "ContentsList", 
                "HorizontalAlignment", 
                Enum.HorizontalAlignment.Left
            }, 
            {
                "Selection", 
                "Size", 
                UDim2.new(1, -0, 1, -0)
            }, 
            {
                "Selection", 
                "Position", 
                UDim2.new(0, 0, 0, 0)
            }
        });
        task.defer(function() --[[ Line: 96 ]]
            -- upvalues: v15 (copy), v17 (copy)
            v15.joinJanitor:add(function() --[[ Line: 97 ]]
                -- upvalues: v15 (ref), v17 (ref)
                v15:removeModification(v17);
            end);
        end);
    end);
    v3.dropdownSet:Connect(function(v18) --[[ Line: 103 ]]
        -- upvalues: v3 (copy), v14 (copy)
        for _, v20 in pairs(v3.dropdownIcons) do
            local v21 = v14.getIconByUID(v20);
            if v21 then
                v21:destroy();
            end;
        end;
        if type(v18) == "table" then
            for _, v23 in pairs(v18) do
                v23:joinDropdown(v3);
            end;
        end;
    end);
    local function v36() --[[ Line: 117 ]] --[[ Name: updateMaxIcons ]]
        -- upvalues: l_Frame_0 (copy), l_ScrollingFrame_0 (copy), l_UIPadding_0 (copy)
        local l_l_Frame_0_Attribute_0 = l_Frame_0:GetAttribute("MaxIcons");
        if not l_l_Frame_0_Attribute_0 then
            return 0;
        else
            local v25 = {};
            for _, v27 in pairs(l_ScrollingFrame_0:GetChildren()) do
                if v27:IsA("GuiObject") and v27.Visible then
                    table.insert(v25, v27);
                end;
            end;
            table.sort(v25, function(v28, v29) --[[ Line: 128 ]]
                return v28.AbsolutePosition.Y < v29.AbsolutePosition.Y;
            end);
            local v30 = 0;
            local v31 = math.ceil(l_l_Frame_0_Attribute_0);
            for v32 = 1, v31 do
                local v33 = v25[v32];
                if v33 then
                    local l_Y_0 = v33.AbsoluteSize.Y;
                    local v35 = false;
                    if v32 == v31 then
                        v35 = v31 ~= l_l_Frame_0_Attribute_0;
                    end;
                    if v35 then
                        l_Y_0 = l_Y_0 * (l_l_Frame_0_Attribute_0 - v31 + 1);
                    end;
                    v30 = v30 + l_Y_0;
                else
                    break;
                end;
            end;
            return v30 + (l_UIPadding_0.PaddingTop.Offset + l_UIPadding_0.PaddingBottom.Offset);
        end;
    end;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local function _() --[[ Line: 149 ]] --[[ Name: getTweenInfo ]]
        -- upvalues: v2 (ref), l_Frame_0 (copy), v39 (ref), v40 (ref), l_NumberValue_0 (copy)
        local v41 = v2.getInstanceValue(l_Frame_0, "MaxIcons") or 1;
        if v39 and v39 == v41 and v40 then
            return v40;
        else
            local v42 = TweenInfo.new(l_NumberValue_0.Value * v41, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v40 = v42;
            v39 = v41;
            return v42;
        end;
    end;
    local function v47() --[[ Line: 163 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v2 (ref), l_Frame_0 (copy), v39 (ref), v40 (ref), l_NumberValue_0 (copy), v37 (ref), v38 (ref), v3 (copy), v36 (copy), l_TweenService_0 (ref)
        local v44 = v2.getInstanceValue(l_Frame_0, "MaxIcons") or 1;
        local v45;
        if v39 and v39 == v44 and v40 then
            v45 = v40;
        else
            local v46 = TweenInfo.new(l_NumberValue_0.Value * v44, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v40 = v46;
            v39 = v44;
            v45 = v46;
        end;
        if v37 then
            v37:Cancel();
            v37 = nil;
        end;
        if v38 then
            v38:Cancel();
            v38 = nil;
        end;
        if v3.isSelected then
            v44 = v36();
            l_Frame_0.Visible = true;
            l_Frame_0.BackgroundTransparency = 0;
            l_Frame_0.Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, 0);
            v37 = l_TweenService_0:Create(l_Frame_0, v45, {
                Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, v44)
            });
            v37:Play();
            v37.Completed:Connect(function() --[[ Line: 184 ]]
                -- upvalues: v37 (ref)
                v37 = nil;
            end);
            return;
        else
            v44 = TweenInfo.new(0);
            v38 = l_TweenService_0:Create(l_Frame_0, v44, {
                Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, 0)
            });
            v38:Play();
            v38.Completed:Connect(function() --[[ Line: 191 ]]
                -- upvalues: v38 (ref)
                v38 = nil;
            end);
            return;
        end;
    end;
    l_dropdownJanitor_0:add(v3.toggled:Connect(v47));
    v47();
    local function v51() --[[ Line: 201 ]] --[[ Name: updateChildSize ]]
        -- upvalues: v2 (ref), l_Frame_0 (copy), v39 (ref), v40 (ref), l_NumberValue_0 (copy), v3 (copy), v37 (ref), v38 (ref), l_RunService_0 (ref), v36 (copy), l_TweenService_0 (ref)
        local v48 = v2.getInstanceValue(l_Frame_0, "MaxIcons") or 1;
        local v49;
        if v39 and v39 == v48 and v40 then
            v49 = v40;
        else
            local v50 = TweenInfo.new(l_NumberValue_0.Value * v48, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v40 = v50;
            v39 = v48;
            v49 = v50;
        end;
        if not v3.isSelected then
            return;
        else
            if v37 then
                v37:Cancel();
                v37 = nil;
            end;
            if v38 then
                v38:Cancel();
                v38 = nil;
            end;
            l_RunService_0.Heartbeat:Wait();
            v48 = v36();
            v37 = l_TweenService_0:Create(l_Frame_0, v49, {
                Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, v48)
            });
            v37:Play();
            v37.Completed:Connect(function() --[[ Line: 219 ]]
                -- upvalues: v37 (ref)
                v37 = nil;
            end);
            return;
        end;
    end;
    l_dropdownJanitor_0:add(v3.toggled:Connect(v47));
    local v52 = 0;
    local v53 = false;
    local function v54() --[[ Line: 232 ]] --[[ Name: updateMaxIconsListener ]]
        -- upvalues: v52 (ref), v53 (ref), v54 (copy), l_Frame_0 (copy), l_ScrollingFrame_0 (copy), v14 (copy), v3 (copy), l_UIPadding_0 (copy)
        v52 = v52 + 1;
        if v53 then
            return;
        else
            local l_v52_0 = v52;
            v53 = true;
            task.defer(function() --[[ Line: 237 ]]
                -- upvalues: v53 (ref), v52 (ref), l_v52_0 (copy), v54 (ref)
                v53 = false;
                if v52 ~= l_v52_0 then
                    v54();
                end;
            end);
            local l_l_Frame_0_Attribute_1 = l_Frame_0:GetAttribute("MaxIcons");
            if not l_l_Frame_0_Attribute_1 then
                return;
            else
                local v57 = {};
                for _, v59 in pairs(l_ScrollingFrame_0:GetChildren()) do
                    if v59:IsA("GuiObject") and v59.Visible then
                        table.insert(v57, {
                            v59, 
                            v59.AbsolutePosition.Y
                        });
                    end;
                end;
                table.sort(v57, function(v60, v61) --[[ Line: 252 ]]
                    return v60[2] < v61[2];
                end);
                local v62 = 0;
                local v63 = false;
                local v64 = math.ceil(l_l_Frame_0_Attribute_1);
                for v65 = 1, v64 do
                    local v66 = v57[v65];
                    if v66 then
                        local v67 = v66[1];
                        local l_Y_1 = v67.AbsoluteSize.Y;
                        local v69 = false;
                        if v65 == v64 then
                            v69 = v64 ~= l_l_Frame_0_Attribute_1;
                        end;
                        if v69 then
                            l_Y_1 = l_Y_1 * (l_l_Frame_0_Attribute_1 - v64 + 1);
                        end;
                        v62 = v62 + l_Y_1;
                        if not v69 then
                            local l_v67_Attribute_0 = v67:GetAttribute("WidgetUID");
                            local v71 = l_v67_Attribute_0 and v14.getIconByUID(l_v67_Attribute_0);
                            if v71 then
                                local v72 = nil;
                                if not v63 then
                                    v63 = true;
                                    v72 = v3:getInstance("ClickRegion");
                                end;
                                v71:getInstance("ClickRegion").NextSelectionUp = v72;
                            end;
                        end;
                    else
                        break;
                    end;
                end;
                v62 = v62 + (l_UIPadding_0.PaddingTop.Offset + l_UIPadding_0.PaddingBottom.Offset);
                l_ScrollingFrame_0.Size = UDim2.fromOffset(0, v62);
                return;
            end;
        end;
    end;
    l_dropdownJanitor_0:add(l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v54));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildAdded:Connect(v54));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildRemoved:Connect(v51));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildRemoved:Connect(v54));
    l_dropdownJanitor_0:add(l_Frame_0:GetAttributeChangedSignal("MaxIcons"):Connect(v54));
    l_dropdownJanitor_0:add(l_Frame_0:GetAttributeChangedSignal("MaxIcons"):Connect(v51));
    l_dropdownJanitor_0:add(v3.childThemeModified:Connect(v54));
    v54();
    local function _(v73) --[[ Line: 297 ]] --[[ Name: connectVisibilityListeners ]]
        -- upvalues: v51 (copy)
        if v73:IsA("GuiObject") then
            v73:GetPropertyChangedSignal("Visible"):Connect(v51);
            v73:GetPropertyChangedSignal("Size"):Connect(v51);
        end;
    end;
    for _, v76 in pairs(l_ScrollingFrame_0:GetChildren()) do
        if v76:IsA("GuiObject") then
            v76:GetPropertyChangedSignal("Visible"):Connect(v51);
            v76:GetPropertyChangedSignal("Size"):Connect(v51);
        end;
    end;
    l_ScrollingFrame_0.ChildAdded:Connect(function(v77) --[[ Line: 309 ]]
        -- upvalues: l_RunService_0 (ref), v51 (copy)
        l_RunService_0.Heartbeat:Wait();
        if v77:IsA("GuiObject") then
            v77:GetPropertyChangedSignal("Visible"):Connect(v51);
            v77:GetPropertyChangedSignal("Size"):Connect(v51);
        end;
        v51();
    end);
    l_Frame_0.Visible = false;
    return l_Frame_0;
end;