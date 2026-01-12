local v0 = Color3.fromRGB(39, 41, 48);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v2 = v1:getInstance("ClickRegion");
    local l_CanvasGroup_0 = Instance.new("CanvasGroup");
    l_CanvasGroup_0.Name = "Caption";
    l_CanvasGroup_0.AnchorPoint = Vector2.new(0.5, 0);
    l_CanvasGroup_0.BackgroundTransparency = 1;
    l_CanvasGroup_0.BorderSizePixel = 0;
    l_CanvasGroup_0.GroupTransparency = 1;
    l_CanvasGroup_0.Position = UDim2.fromOffset(0, 0);
    l_CanvasGroup_0.Visible = true;
    l_CanvasGroup_0.ZIndex = 30;
    l_CanvasGroup_0.Parent = v2;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Box";
    l_Frame_0.AutomaticSize = Enum.AutomaticSize.XY;
    l_Frame_0.BackgroundColor3 = v0;
    l_Frame_0.Position = UDim2.fromOffset(4, 7);
    l_Frame_0.ZIndex = 12;
    l_Frame_0.Parent = l_CanvasGroup_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Header";
    l_TextLabel_0.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    l_TextLabel_0.Text = "Caption";
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextSize = 15;
    l_TextLabel_0.TextTruncate = Enum.TextTruncate.None;
    l_TextLabel_0.TextWrapped = false;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.LayoutOrder = 1;
    l_TextLabel_0.Size = UDim2.fromOffset(0, 16);
    l_TextLabel_0.ZIndex = 18;
    l_TextLabel_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Name = "Layout";
    l_UIListLayout_0.Padding = UDim.new(0, 8);
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.Parent = l_Frame_0;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Name = "CaptionCorner";
    l_UICorner_0.Parent = l_Frame_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Name = "Padding";
    l_UIPadding_0.PaddingBottom = UDim.new(0, 12);
    l_UIPadding_0.PaddingLeft = UDim.new(0, 12);
    l_UIPadding_0.PaddingRight = UDim.new(0, 12);
    l_UIPadding_0.PaddingTop = UDim.new(0, 12);
    l_UIPadding_0.Parent = l_Frame_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "Hotkeys";
    l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.LayoutOrder = 3;
    l_Frame_1.Size = UDim2.fromScale(1, 0);
    l_Frame_1.Visible = false;
    l_Frame_1.Parent = l_Frame_0;
    local l_UIListLayout_1 = Instance.new("UIListLayout");
    l_UIListLayout_1.Name = "Layout1";
    l_UIListLayout_1.Padding = UDim.new(0, 6);
    l_UIListLayout_1.FillDirection = Enum.FillDirection.Vertical;
    l_UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_1.HorizontalFlex = Enum.UIFlexAlignment.None;
    l_UIListLayout_1.ItemLineAlignment = Enum.ItemLineAlignment.Automatic;
    l_UIListLayout_1.VerticalFlex = Enum.UIFlexAlignment.None;
    l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_1.Parent = l_Frame_1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "Key1";
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/key_single.png";
    l_ImageLabel_0.ImageTransparency = 0.7;
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = Rect.new(5, 5, 23, 24);
    l_ImageLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.LayoutOrder = 1;
    l_ImageLabel_0.Size = UDim2.fromOffset(0, 30);
    l_ImageLabel_0.ZIndex = 15;
    l_ImageLabel_0.Parent = l_Frame_1;
    local l_UIPadding_1 = Instance.new("UIPadding");
    l_UIPadding_1.Name = "Inset";
    l_UIPadding_1.PaddingLeft = UDim.new(0, 8);
    l_UIPadding_1.PaddingRight = UDim.new(0, 8);
    l_UIPadding_1.Parent = l_ImageLabel_0;
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.AutoLocalize = false;
    l_TextLabel_1.Name = "LabelContent";
    l_TextLabel_1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    l_TextLabel_1.Text = "";
    l_TextLabel_1.TextColor3 = Color3.fromRGB(189, 190, 190);
    l_TextLabel_1.TextSize = 15;
    l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.Position = UDim2.fromOffset(0, -1);
    l_TextLabel_1.Size = UDim2.fromScale(1, 1);
    l_TextLabel_1.ZIndex = 16;
    l_TextLabel_1.Parent = l_ImageLabel_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "Caret";
    l_ImageLabel_1.Image = "rbxassetid://101906294438076";
    l_ImageLabel_1.ImageColor3 = v0;
    l_ImageLabel_1.AnchorPoint = Vector2.new(0, 0.5);
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Position = UDim2.new(0, 0, 0, 4);
    l_ImageLabel_1.Size = UDim2.fromOffset(16, 8);
    l_ImageLabel_1.ZIndex = 12;
    l_ImageLabel_1.Parent = l_CanvasGroup_0;
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Visible = true;
    l_ImageLabel_2.Name = "DropShadow";
    l_ImageLabel_2.Image = "rbxassetid://124920646932671";
    l_ImageLabel_2.ImageColor3 = Color3.fromRGB(0, 0, 0);
    l_ImageLabel_2.ImageTransparency = 0.45;
    l_ImageLabel_2.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_2.SliceCenter = Rect.new(12, 12, 13, 13);
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.Position = UDim2.fromOffset(0, 5);
    l_ImageLabel_2.Size = UDim2.new(1, 0, 0, 48);
    l_ImageLabel_2.Parent = l_CanvasGroup_0;
    l_Frame_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 145 ]]
        -- upvalues: l_ImageLabel_2 (copy), l_Frame_0 (copy)
        l_ImageLabel_2.Size = UDim2.new(1, 0, 0, l_Frame_0.AbsoluteSize.Y + 8);
    end);
    local l_captionJanitor_0 = v1.captionJanitor;
    local _, v18 = v1:clipOutside(l_CanvasGroup_0);
    v18.AutomaticSize = Enum.AutomaticSize.None;
    l_captionJanitor_0:add(l_CanvasGroup_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 155 ]] --[[ Name: matchSize ]]
        -- upvalues: l_CanvasGroup_0 (copy), v18 (copy)
        local l_AbsoluteSize_0 = l_CanvasGroup_0.AbsoluteSize;
        v18.Size = UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
    end));
    local l_AbsoluteSize_1 = l_CanvasGroup_0.AbsoluteSize;
    v18.Size = UDim2.fromOffset(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y);
    l_AbsoluteSize_1 = false;
    local l_Header_0 = l_CanvasGroup_0.Box.Header;
    local l_UserInputService_0 = game:GetService("UserInputService");
    local function v27(v23) --[[ Line: 168 ]] --[[ Name: updateHotkey ]]
        -- upvalues: l_UserInputService_0 (copy), l_CanvasGroup_0 (copy), v1 (copy), l_Header_0 (copy), l_TextLabel_1 (copy), l_Frame_1 (copy)
        local l_KeyboardEnabled_0 = l_UserInputService_0.KeyboardEnabled;
        local v25 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
        local v26 = v25 == "_hotkey_";
        if not l_KeyboardEnabled_0 and v26 then
            v1:setCaption();
            return;
        else
            l_Header_0.Text = v25;
            l_Header_0.Visible = not v26;
            if v23 then
                l_TextLabel_1.Text = v23.Name;
                l_Frame_1.Visible = true;
            end;
            if not l_KeyboardEnabled_0 then
                l_Frame_1.Visible = false;
            end;
            return;
        end;
    end;
    l_CanvasGroup_0:GetAttributeChangedSignal("CaptionText"):Connect(v27);
    local l_Quad_0 = Enum.EasingStyle.Quad;
    local v29 = TweenInfo.new(0.2, l_Quad_0, Enum.EasingDirection.In);
    local v30 = TweenInfo.new(0.2, l_Quad_0, Enum.EasingDirection.Out);
    local l_TweenService_0 = game:GetService("TweenService");
    local l_RunService_0 = game:GetService("RunService");
    local function _(v33) --[[ Line: 194 ]] --[[ Name: getCaptionPosition ]]
        -- upvalues: l_AbsoluteSize_1 (ref)
        local v34 = (if v33 ~= nil then v33 else l_AbsoluteSize_1) and 10 or 2;
        return UDim2.new(0.5, 0, 1, v34);
    end;
    local function v50(v36) --[[ Line: 201 ]] --[[ Name: updatePosition ]]
        -- upvalues: l_AbsoluteSize_1 (ref), l_ImageLabel_1 (copy), l_CanvasGroup_0 (copy), v2 (copy), v18 (copy), v29 (copy), v30 (copy), l_TweenService_0 (copy), l_RunService_0 (copy)
        if not l_AbsoluteSize_1 then
            return;
        else
            local v37 = if v36 ~= nil then v36 else l_AbsoluteSize_1;
            local v38 = not v37;
            local v39 = (if v38 ~= nil then v38 else l_AbsoluteSize_1) and 10 or 2;
            local v40 = UDim2.new(0.5, 0, 1, v39);
            v39 = (if v37 ~= nil then v37 else l_AbsoluteSize_1) and 10 or 2;
            v38 = UDim2.new(0.5, 0, 1, v39);
            if v37 then
                local l_Offset_0 = l_ImageLabel_1.Position.Y.Offset;
                l_ImageLabel_1.Position = UDim2.fromOffset(0, l_Offset_0);
                l_CanvasGroup_0.AutomaticSize = Enum.AutomaticSize.XY;
                l_CanvasGroup_0.Size = UDim2.fromOffset(32, 53);
            else
                local l_AbsoluteSize_2 = l_CanvasGroup_0.AbsoluteSize;
                l_CanvasGroup_0.AutomaticSize = Enum.AutomaticSize.Y;
                l_CanvasGroup_0.Size = UDim2.fromOffset(l_AbsoluteSize_2.X, l_AbsoluteSize_2.Y);
            end;
            local v43 = nil;
            v39 = function() --[[ Line: 230 ]] --[[ Name: updateCaret ]]
                -- upvalues: v2 (ref), l_CanvasGroup_0 (ref), l_ImageLabel_1 (ref), v43 (ref)
                local v44 = v2.AbsolutePosition.X - l_CanvasGroup_0.AbsolutePosition.X + v2.AbsoluteSize.X / 2 - l_ImageLabel_1.AbsoluteSize.X / 2;
                local l_Offset_1 = l_ImageLabel_1.Position.Y.Offset;
                local v46 = UDim2.fromOffset(v44, l_Offset_1);
                if v43 ~= v44 then
                    v43 = v44;
                    l_ImageLabel_1.Position = UDim2.fromOffset(0, l_Offset_1);
                    task.wait();
                end;
                l_ImageLabel_1.Position = v46;
            end;
            v18.Position = v40;
            v39();
            local v47 = v37 and v29 or v30;
            local v48 = l_TweenService_0:Create(v18, v47, {
                Position = v38
            });
            local v49 = l_RunService_0.Heartbeat:Connect(v39);
            v48:Play();
            v48.Completed:Once(function() --[[ Line: 253 ]]
                -- upvalues: v49 (copy)
                v49:Disconnect();
            end);
            return;
        end;
    end;
    l_captionJanitor_0:add(v2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 258 ]]
        -- upvalues: v50 (copy)
        v50();
    end));
    v50(false);
    l_captionJanitor_0:add(v1.toggleKeyAdded:Connect(v27));
    for v51, _ in pairs(v1.bindedToggleKeys) do
        local l_KeyboardEnabled_1 = l_UserInputService_0.KeyboardEnabled;
        local v54 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
        local v55 = v54 == "_hotkey_";
        if not l_KeyboardEnabled_1 and v55 then
            v1:setCaption();
            break;
        else
            l_Header_0.Text = v54;
            l_Header_0.Visible = not v55;
            if v51 then
                l_TextLabel_1.Text = v51.Name;
                l_Frame_1.Visible = true;
            end;
            if not l_KeyboardEnabled_1 then
                l_Frame_1.Visible = false;
                break;
            else
                break;
            end;
        end;
    end;
    l_captionJanitor_0:add(v1.fakeToggleKeyChanged:Connect(v27));
    local l_fakeToggleKey_0 = v1.fakeToggleKey;
    if l_fakeToggleKey_0 then
        local l_KeyboardEnabled_2 = l_UserInputService_0.KeyboardEnabled;
        local v58 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
        local v59 = v58 == "_hotkey_";
        if not l_KeyboardEnabled_2 and v59 then
            v1:setCaption();
        else
            l_Header_0.Text = v58;
            l_Header_0.Visible = not v59;
            if l_fakeToggleKey_0 then
                l_TextLabel_1.Text = l_fakeToggleKey_0.Name;
                l_Frame_1.Visible = true;
            end;
            if not l_KeyboardEnabled_2 then
                l_Frame_1.Visible = false;
            end;
        end;
    end;
    local function v67(v60) --[[ Line: 274 ]] --[[ Name: setCaptionEnabled ]]
        -- upvalues: l_AbsoluteSize_1 (ref), v1 (copy), v29 (copy), v30 (copy), l_TweenService_0 (copy), l_CanvasGroup_0 (copy), v18 (copy), v50 (copy), l_UserInputService_0 (copy), l_Header_0 (copy), l_Frame_1 (copy)
        if l_AbsoluteSize_1 == v60 then
            return;
        else
            local l_joinedFrame_0 = v1.joinedFrame;
            if l_joinedFrame_0 and string.match(l_joinedFrame_0.Name, "Dropdown") then
                v60 = false;
            end;
            l_AbsoluteSize_1 = v60;
            local v62 = v60 and 0 or 1;
            local v63 = v60 and v29 or v30;
            l_TweenService_0:Create(l_CanvasGroup_0, v63, {
                GroupTransparency = v62
            }):Play();
            if v60 then
                v18:SetAttribute("ForceUpdate", true);
            end;
            v50();
            local l_KeyboardEnabled_3 = l_UserInputService_0.KeyboardEnabled;
            local v65 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
            local v66 = v65 == "_hotkey_";
            if not l_KeyboardEnabled_3 and v66 then
                v1:setCaption();
                return;
            else
                l_Header_0.Text = v65;
                l_Header_0.Visible = not v66;
                if not l_KeyboardEnabled_3 then
                    l_Frame_1.Visible = false;
                end;
                return;
            end;
        end;
    end;
    local v68 = require(v1.iconModule);
    l_captionJanitor_0:add(v1.stateChanged:Connect(function(v69) --[[ Line: 299 ]]
        -- upvalues: v68 (copy), v1 (copy), v67 (copy)
        if v69 == "Viewing" then
            local l_captionLastClosedClock_0 = v68.captionLastClosedClock;
            local v71 = (l_captionLastClosedClock_0 and os.clock() - l_captionLastClosedClock_0 or 999) < 0.3 and 0 or 0.5;
            task.delay(v71, function() --[[ Line: 304 ]]
                -- upvalues: v1 (ref), v67 (ref)
                if v1.activeState == "Viewing" then
                    v67(true);
                end;
            end);
            return;
        else
            v68.captionLastClosedClock = os.clock();
            v67(false);
            return;
        end;
    end));
    return l_CanvasGroup_0;
end;