return function(v0, v1) --[[ Line: 1 ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Notice";
    l_Frame_0.ZIndex = 25;
    l_Frame_0.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundTransparency = 0.1;
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v0.widget;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(1, 0);
    l_UICorner_0.Parent = l_Frame_0;
    Instance.new("UIStroke").Parent = l_Frame_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "NoticeLabel";
    l_TextLabel_0.ZIndex = 26;
    l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.515, 0);
    l_TextLabel_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.FontSize = Enum.FontSize.Size14;
    l_TextLabel_0.TextColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.Text = "1";
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.TextWrap = true;
    l_TextLabel_0.Font = Enum.Font.Arial;
    l_TextLabel_0.Parent = l_Frame_0;
    local l_Parent_0 = script.Parent.Parent;
    local l_Packages_0 = l_Parent_0.Packages;
    local v7 = require(l_Packages_0.Janitor);
    local v8 = require(l_Packages_0.GoodSignal);
    local v9 = require(l_Parent_0.Utility);
    v0.noticeChanged:Connect(function(v10) --[[ Line: 43 ]]
        -- upvalues: l_TextLabel_0 (copy), v1 (copy), v0 (copy), v9 (copy), l_Frame_0 (copy)
        if not v10 then
            return;
        else
            local v11 = v10 > 99;
            l_TextLabel_0.Text = v11 and "99+" or v10;
            if v11 then
                l_TextLabel_0.TextSize = 11;
            end;
            local v12 = true;
            if v10 < 1 then
                v12 = false;
            end;
            local v13 = v1.getIconByUID(v0.parentIconUID);
            local v14 = true;
            if #v0.dropdownIcons <= 0 then
                v14 = #v0.menuIcons > 0;
            end;
            if v0.isSelected and v14 then
                v12 = false;
            elseif v13 and not v13.isSelected then
                v12 = false;
            end;
            v9.setVisible(l_Frame_0, v12, "NoticeHandler");
            return;
        end;
    end);
    v0.noticeStarted:Connect(function(v15, v16) --[[ Line: 71 ]]
        -- upvalues: v0 (copy), v1 (copy), v7 (copy), v8 (copy), v9 (copy)
        if not v15 then
            v15 = v0.deselected;
        end;
        local v17 = v1.getIconByUID(v0.parentIconUID);
        if v17 then
            v17:notify(v15);
        end;
        local v18 = v0.janitor:add(v7.new());
        local v19 = v18:add(v8.new());
        v18:add(v0.endNotices:Connect(function() --[[ Line: 83 ]]
            -- upvalues: v19 (copy)
            v19:Fire();
        end));
        v18:add(v15:Connect(function() --[[ Line: 86 ]]
            -- upvalues: v19 (copy)
            v19:Fire();
        end));
        v16 = v16 or v9.generateUID();
        v0.notices[v16] = {
            completeSignal = v19, 
            clearNoticeEvent = v15
        };
        local function _() --[[ Line: 94 ]] --[[ Name: updateNotice ]]
            -- upvalues: v0 (ref)
            v0.noticeChanged:Fire(v0.totalNotices);
        end;
        v0.notified:Fire(v16);
        local l_v0_0 = v0;
        l_v0_0.totalNotices = l_v0_0.totalNotices + 1;
        v0.noticeChanged:Fire(v0.totalNotices);
        v19:Once(function() --[[ Line: 100 ]]
            -- upvalues: v18 (copy), v0 (ref), v16 (ref)
            v18:destroy();
            local l_v0_1 = v0;
            l_v0_1.totalNotices = l_v0_1.totalNotices - 1;
            v0.notices[v16] = nil;
            v0.noticeChanged:Fire(v0.totalNotices);
        end);
    end);
    l_Frame_0:SetAttribute("ClipToJoinedParent", true);
    v0:clipOutside(l_Frame_0);
    return l_Frame_0;
end;