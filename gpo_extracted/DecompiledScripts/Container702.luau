local v0 = false;
local v1 = 0;
return function(v2) --[[ Line: 3 ]]
    -- upvalues: v0 (ref), v1 (ref)
    local l_GuiService_0 = game:GetService("GuiService");
    local l_Players_0 = game:GetService("Players");
    local l_UserInputService_0 = game:GetService("UserInputService");
    local v6 = {};
    local v7 = require(script.Parent.Parent.Packages.GoodSignal).new();
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    local v9 = 0;
    local v10 = 0;
    local v11 = 0;
    local v12 = 0;
    local v13 = false;
    local v14 = false;
    local function v15(v16) --[[ Line: 20 ]] --[[ Name: checkInset ]]
        -- upvalues: l_GuiService_0 (copy), v13 (ref), v14 (ref), l_UserInputService_0 (copy), v2 (copy), v12 (ref), v15 (copy), l_Players_0 (copy), v0 (ref), l_l_GuiService_0_GuiInset_0 (ref), v9 (ref), v10 (ref), v11 (ref), v7 (copy), v1 (ref)
        local l_Height_0 = l_GuiService_0.TopbarInset.Height;
        local v18 = l_Height_0 <= 36;
        v13 = l_GuiService_0:IsTenFootInterface();
        v14 = l_UserInputService_0.VREnabled;
        v2.isOldTopbar = v18;
        v12 = v12 + 1;
        if l_Height_0 == 0 and v16 == nil then
            task.defer(function() --[[ Line: 33 ]]
                -- upvalues: v15 (ref)
                task.wait(8);
                v15("ForceConvertToOld");
            end);
        elseif v12 == 1 then
            task.delay(5, function() --[[ Line: 38 ]]
                -- upvalues: l_Players_0 (ref), v12 (ref), v15 (ref)
                l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
                if v12 == 1 then
                    v15();
                end;
            end);
        end;
        if v2.isOldTopbar and not v13 and not v14 and v0 == false and (l_Height_0 ~= 0 or v16 == "ForceConvertToOld") then
            v0 = true;
            task.defer(function() --[[ Line: 50 ]]
                -- upvalues: v2 (ref), l_GuiService_0 (ref)
                local l_Themes_0 = script.Parent.Parent.Features.Themes;
                local v20 = require(l_Themes_0.Classic);
                v2.modifyBaseTheme(v20);
                local function v21() --[[ Line: 57 ]] --[[ Name: decideToHideTopbar ]]
                    -- upvalues: l_GuiService_0 (ref), v2 (ref)
                    if l_GuiService_0.MenuIsOpen then
                        v2.setTopbarEnabled(false, true);
                        return;
                    else
                        v2.setTopbarEnabled();
                        return;
                    end;
                end;
                l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v21);
                if l_GuiService_0.MenuIsOpen then
                    v2.setTopbarEnabled(false, true);
                    return;
                else
                    v2.setTopbarEnabled();
                    return;
                end;
            end);
        end;
        l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
        v9 = v18 and 12 or l_l_GuiService_0_GuiInset_0.Y - 50;
        v10 = v18 and 2 or 0;
        v11 = -2;
        if v13 then
            v9 = 10;
            v10 = 0;
        end;
        if l_GuiService_0.TopbarInset.Height == 0 and not v0 then
            v10 = v10 + 13;
            v11 = 50;
        end;
        v7:Fire(l_l_GuiService_0_GuiInset_0);
        local l_Y_0 = l_l_GuiService_0_GuiInset_0.Y;
        if l_Y_0 ~= v1 then
            v1 = l_Y_0;
            task.defer(function() --[[ Line: 88 ]]
                -- upvalues: v2 (ref), l_Y_0 (copy)
                v2.insetHeightChanged:Fire(l_Y_0);
            end);
        end;
    end;
    l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(v15);
    v15("FirstTime");
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    v7:Connect(function() --[[ Line: 98 ]]
        -- upvalues: l_ScreenGui_0 (copy), v9 (ref)
        l_ScreenGui_0:SetAttribute("StartInset", v9);
    end);
    l_ScreenGui_0.Name = "TopbarStandard";
    l_ScreenGui_0.Enabled = true;
    l_ScreenGui_0.DisplayOrder = v2.baseDisplayOrder;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets;
    v6[l_ScreenGui_0.Name] = l_ScreenGui_0;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 109 ]]
        -- upvalues: l_ScreenGui_0 (copy), v2 (copy)
        l_ScreenGui_0.DisplayOrder = v2.baseDisplayOrder;
    end);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Holders";
    l_Frame_0.BackgroundTransparency = 1;
    v7:Connect(function() --[[ Line: 116 ]]
        -- upvalues: v14 (ref), v13 (ref), v11 (ref), l_Frame_0 (copy), v10 (ref)
        local v25 = v14 and 36 or 56;
        local v26 = if v13 then UDim2.new(1, 0, 0, v25) else UDim2.new(1, 0, 1, v11);
        l_Frame_0.Position = UDim2.new(0, 0, 0, v10);
        l_Frame_0.Size = v26;
    end);
    l_Frame_0.Visible = true;
    l_Frame_0.ZIndex = 1;
    l_Frame_0.Parent = l_ScreenGui_0;
    local v27 = l_ScreenGui_0:Clone();
    local l_Holders_0 = v27.Holders;
    local function v29() --[[ Line: 128 ]] --[[ Name: updateCenteredHoldersHeight ]]
        -- upvalues: l_Holders_0 (copy), l_GuiService_0 (copy), v11 (ref)
        l_Holders_0.Size = UDim2.new(1, 0, 0, l_GuiService_0.TopbarInset.Height + v11);
    end;
    v27.Name = "TopbarCentered";
    v27.DisplayOrder = v2.baseDisplayOrder;
    v27.ScreenInsets = Enum.ScreenInsets.None;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 134 ]]
        -- upvalues: v27 (copy), v2 (copy)
        v27.DisplayOrder = v2.baseDisplayOrder;
    end);
    v6[v27.Name] = v27;
    v7:Connect(v29);
    l_Holders_0.Size = UDim2.new(1, 0, 0, l_GuiService_0.TopbarInset.Height + v11);
    local v30 = l_ScreenGui_0:Clone();
    v30.Name = v30.Name .. "Clipped";
    v30.DisplayOrder = v2.baseDisplayOrder + 1;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 145 ]]
        -- upvalues: v30 (copy), v2 (copy)
        v30.DisplayOrder = v2.baseDisplayOrder + 1;
    end);
    v6[v30.Name] = v30;
    local v31 = v27:Clone();
    v31.Name = v31.Name .. "Clipped";
    v31.DisplayOrder = v2.baseDisplayOrder + 1;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 153 ]]
        -- upvalues: v31 (copy), v2 (copy)
        v31.DisplayOrder = v2.baseDisplayOrder + 1;
    end);
    v6[v31.Name] = v31;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0:SetAttribute("IsAHolder", true);
    l_ScrollingFrame_0.Name = "Left";
    v7:Connect(function() --[[ Line: 162 ]]
        -- upvalues: l_ScrollingFrame_0 (copy), v9 (ref)
        l_ScrollingFrame_0.Position = UDim2.fromOffset(v9, 0);
    end);
    l_ScrollingFrame_0.Size = UDim2.new(1, -24, 1, 0);
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.ZIndex = 1;
    l_ScrollingFrame_0.Active = false;
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.HorizontalScrollBarInset = Enum.ScrollBarInset.None;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 1, -1);
    l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.X;
    l_ScrollingFrame_0.ScrollingDirection = Enum.ScrollingDirection.X;
    l_ScrollingFrame_0.ScrollBarThickness = 0;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.ScrollingEnabled = false;
    l_ScrollingFrame_0.ElasticBehavior = Enum.ElasticBehavior.Never;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    v7:Connect(function() --[[ Line: 183 ]]
        -- upvalues: l_UIListLayout_0 (copy), v9 (ref)
        l_UIListLayout_0.Padding = UDim.new(0, v9);
    end);
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Bottom;
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Left;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    local v34 = l_ScrollingFrame_0:Clone();
    v7:Connect(function() --[[ Line: 193 ]]
        -- upvalues: v34 (copy), v9 (ref)
        v34.UIListLayout.Padding = UDim.new(0, v9);
    end);
    v34.ScrollingEnabled = false;
    v34.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    v34.Name = "Center";
    v34.Parent = l_Holders_0;
    local v35 = l_ScrollingFrame_0:Clone();
    v7:Connect(function() --[[ Line: 202 ]]
        -- upvalues: v35 (copy), v9 (ref)
        v35.UIListLayout.Padding = UDim.new(0, v9);
    end);
    v35.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right;
    v35.Name = "Right";
    v35.AnchorPoint = Vector2.new(1, 0);
    v35.Position = UDim2.new(1, -12, 0, 0);
    v35.Parent = l_Frame_0;
    v7:Fire(l_l_GuiService_0_GuiInset_0);
    return v6;
end;