local v0 = {};
local v1 = {};
local v2 = {};
local v3 = nil;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v5 = {};
local v6 = {};
local v7 = require(script.Parent.Parent.Utility);
local v8 = false;
local v9 = false;
local v10 = nil;
v0.start = function(v11) --[[ Line: 25 ]] --[[ Name: start ]]
    -- upvalues: v10 (ref), v3 (ref), v1 (copy), v7 (copy), v0 (copy), v8 (ref), l_CurrentCamera_0 (copy)
    v10 = v11;
    v3 = v10.iconsDictionary;
    local v12 = nil;
    for _, v14 in pairs(v10.container) do
        if v12 == nil and v14.ScreenInsets == Enum.ScreenInsets.TopbarSafeInsets then
            v12 = v14;
        end;
        for _, v16 in pairs(v14.Holders:GetChildren()) do
            if v16:GetAttribute("IsAHolder") then
                v1[v16.Name] = v16;
            end;
        end;
    end;
    local v17 = false;
    local v19 = v7.createStagger(0.1, function(v18) --[[ Line: 43 ]]
        -- upvalues: v17 (ref), v0 (ref)
        if not v17 then
            return;
        else
            if not v18 then
                v0.updateAvailableIcons("Center");
            end;
            v0.updateBoundary("Left");
            v0.updateBoundary("Right");
            return;
        end;
    end);
    task.delay(0.5, function() --[[ Line: 53 ]]
        -- upvalues: v17 (ref), v19 (copy)
        v17 = true;
        v19();
    end);
    task.delay(2, function() --[[ Line: 57 ]]
        -- upvalues: v8 (ref), v19 (copy)
        v8 = true;
        v19();
    end);
    v10.iconAdded:Connect(v19);
    v10.iconRemoved:Connect(v19);
    v10.iconChanged:Connect(v19);
    l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 67 ]]
        -- upvalues: v19 (copy)
        v19(true);
    end);
    v12:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 70 ]]
        -- upvalues: v19 (copy)
        v19(true);
    end);
end;
v0.getWidth = function(v20, _) --[[ Line: 75 ]] --[[ Name: getWidth ]]
    local l_widget_0 = v20.widget;
    return l_widget_0:GetAttribute("TargetWidth") or l_widget_0.AbsoluteSize.X;
end;
v0.getAvailableIcons = function(v23) --[[ Line: 80 ]] --[[ Name: getAvailableIcons ]]
    -- upvalues: v2 (copy), v0 (copy)
    return v2[v23] or v0.updateAvailableIcons(v23);
end;
v0.updateAvailableIcons = function(v24) --[[ Line: 88 ]] --[[ Name: updateAvailableIcons ]]
    -- upvalues: v3 (ref), v6 (copy), v2 (copy)
    local v25 = 0;
    local v26 = {};
    for _, v28 in pairs(v3) do
        local l_parentIconUID_0 = v28.parentIconUID;
        local v30 = not l_parentIconUID_0 or v6[l_parentIconUID_0];
        local v31 = v6[v28.UID];
        if v30 and v28.alignment == v24 and not v31 and v28.isEnabled then
            table.insert(v26, v28);
            v25 = v25 + 1;
        end;
    end;
    if v25 <= 0 then
        return {};
    else
        table.sort(v26, function(v32, v33) --[[ Line: 110 ]]
            local l_LayoutOrder_0 = v32.widget.LayoutOrder;
            local l_LayoutOrder_1 = v33.widget.LayoutOrder;
            local l_parentIconUID_1 = v32.parentIconUID;
            local l_parentIconUID_2 = v33.parentIconUID;
            if l_parentIconUID_1 == l_parentIconUID_2 then
                if l_LayoutOrder_0 < l_LayoutOrder_1 then
                    return true;
                elseif l_LayoutOrder_1 < l_LayoutOrder_0 then
                    return false;
                else
                    return v32.widget.AbsolutePosition.X < v33.widget.AbsolutePosition.X;
                end;
            elseif l_parentIconUID_2 then
                return false;
            elseif l_parentIconUID_1 then
                return true;
            else
                return nil;
            end;
        end);
        v2[v24] = v26;
        return v26;
    end;
end;
v0.getRealXPositions = function(v38, v39) --[[ Line: 137 ]] --[[ Name: getRealXPositions ]]
    -- upvalues: v1 (copy), v7 (copy), v0 (copy)
    local v40 = v38 == "Left";
    local v41 = v1[v38];
    local l_X_0 = v41.AbsolutePosition.X;
    local l_X_1 = v41.AbsoluteSize.X;
    local l_Offset_0 = v41.UIListLayout.Padding.Offset;
    local v45 = v40 and l_X_0 or l_X_0 + l_X_1;
    local v46 = {};
    if v40 then
        v7.reverseTable(v39);
    end;
    for v47 = #v39, 1, -1 do
        local v48 = v39[v47];
        local v49 = v0.getWidth(v48);
        if not v40 then
            v45 = v45 - v49;
        end;
        v46[v48.UID] = v45;
        if v40 then
            v45 = v45 + v49;
        end;
        v45 = v45 + (v40 and l_Offset_0 or -l_Offset_0);
    end;
    return v46;
end;
v0.updateBoundary = function(v50) --[[ Line: 166 ]] --[[ Name: updateBoundary ]]
    -- upvalues: v1 (copy), v0 (copy), v5 (copy), v10 (ref), v6 (copy), v9 (ref), v8 (ref), v7 (copy)
    local v51 = v1[v50];
    local l_UIListLayout_0 = v51.UIListLayout;
    local l_X_2 = v51.AbsolutePosition.X;
    local l_X_3 = v51.AbsoluteSize.X;
    local l_Offset_1 = l_UIListLayout_0.Padding.Offset;
    local l_Offset_2 = l_UIListLayout_0.Padding.Offset;
    local v57 = v0.updateAvailableIcons(v50);
    local v58 = 0;
    local v59 = 0;
    for _, v61 in pairs(v57) do
        v58 = v58 + (v0.getWidth(v61) + l_Offset_2);
        v59 = v59 + 1;
    end;
    if v59 <= 0 then
        return;
    else
        local v62 = v50 == "Center";
        local v63 = v50 == "Left";
        local v64 = not v63;
        local v65 = v5[v50];
        if not v65 and not v62 and #v57 > 0 then
            local v66 = v63 and -9999999 or 9999999;
            v65 = v10.new();
            v65:setImage(6069276526, "Deselected");
            v65:setName("Overflow" .. v50);
            v65:setOrder(v66);
            v65:setAlignment(v50);
            v65:autoDeselect(false);
            v65.isAnOverflow = true;
            v65:select("OverflowStart", v65);
            v65:setEnabled(false);
            v5[v50] = v65;
            v6[v65.UID] = true;
            if not v10.closeableOverflowMenus then
                v65:getInstance("IconSpot").Visible = false;
            end;
        end;
        local v67 = v50 == "Left" and "Right" or "Left";
        local v68 = v0.updateAvailableIcons(v67);
        local v69 = v63 and v68[1] or v64 and v68[#v68];
        local v70 = v5[v67];
        local v71 = v63 and l_X_2 + l_X_3 or l_X_2;
        if v69 then
            local v72 = v0.getRealXPositions(v67, v68)[v69.UID];
            local v73 = v0.getWidth(v69);
            v71 = v63 and v72 - l_Offset_1 or v72 + v73 + l_Offset_1;
        end;
        local v74 = 0;
        local function v75() --[[ Line: 233 ]] --[[ Name: checkToShiftCentralIcon ]]
            -- upvalues: v0 (ref), v63 (copy), v9 (ref), v50 (copy), v57 (copy), v64 (copy), l_Offset_1 (copy), v8 (ref), v74 (ref), v75 (copy)
            local v76 = v0.getAvailableIcons("Center");
            local v77 = v76[v63 and 1 or #v76];
            local function _() --[[ Line: 237 ]] --[[ Name: secondaryCheck ]]
                -- upvalues: v9 (ref), v0 (ref), v50 (ref)
                if not v9 then
                    v9 = true;
                    task.delay(3, v0.updateBoundary, v50);
                end;
            end;
            if v77 and not v77.hasRelocatedInOverflow then
                local v79 = v63 and v57[#v57] or v64 and v57[1];
                local l_X_4 = v77.widget.AbsolutePosition.X;
                local l_X_5 = v79.widget.AbsolutePosition.X;
                local v82 = v0.getWidth(v79);
                local v83 = v63 and l_X_4 - l_Offset_1 or l_X_4 + v0.getWidth(v77) + l_Offset_1;
                local v84 = v63 and l_X_5 + v82 or l_X_5;
                local v85 = false;
                if v63 then
                    if v83 < v84 then
                        if not v8 then
                            if not v9 then
                                v9 = true;
                                task.delay(3, v0.updateBoundary, v50);
                            end;
                            return;
                        else
                            v77:align("Left");
                            v77.hasRelocatedInOverflow = true;
                            v85 = true;
                        end;
                    end;
                elseif v64 and v84 < v83 then
                    if not v8 or v84 < 0 then
                        if not v9 then
                            v9 = true;
                            task.delay(3, v0.updateBoundary, v50);
                        end;
                        return;
                    else
                        v77:align("Right");
                        v77.hasRelocatedInOverflow = true;
                        v85 = true;
                    end;
                end;
                if v85 then
                    v74 = v74 + 1;
                    if v74 <= 4 then
                        v0.updateAvailableIcons("Center");
                        v75();
                    end;
                end;
            end;
        end;
        v75();
        if v65 then
            local l_v71_0 = v71;
            local v87 = v65:getInstance("Menu");
            local v88 = l_X_2 + l_X_3;
            local l_l_X_3_0 = l_X_3;
            if v87 and v70 then
                local l_X_6 = v70.widget.AbsolutePosition.X;
                local v91 = v0.getWidth(v70);
                local v92 = v63 and l_X_6 - l_Offset_1 or l_X_6 + v91 + l_Offset_1;
                local v93 = v70:getInstance("Menu");
                local v94 = v87.AbsoluteCanvasSize.X >= v93.AbsoluteCanvasSize.X;
                local v95 = l_X_2 + l_X_3 / 2;
                l_v71_0 = v63 and v95 - l_Offset_1 / 2 or v95 + l_Offset_1 / 2;
                if v94 then
                    l_v71_0 = v92;
                end;
                l_l_X_3_0 = v63 and l_v71_0 - l_X_2 or v88 - l_v71_0;
            end;
            local v96 = v87 and v87:GetAttribute("MaxWidth");
            l_l_X_3_0 = v7.round(l_l_X_3_0);
            if v87 and v96 ~= l_l_X_3_0 then
                v87:SetAttribute("MaxWidth", l_l_X_3_0);
            end;
        end;
        local v97 = false;
        local v98 = v0.getRealXPositions(v50, v57);
        for v99 = #v57, 1, -1 do
            local v100 = v57[v99];
            local v101 = v0.getWidth(v100);
            local v102 = v98[v100.UID];
            if v63 and v71 <= v102 + v101 or v64 and v102 <= v71 then
                v97 = true;
            end;
        end;
        for v103 = #v57, 1, -1 do
            local v104 = v57[v103];
            if not v6[v104.UID] then
                if v97 and not v104.parentIconUID then
                    v104:joinMenu(v65);
                elseif not v97 and v104.parentIconUID then
                    v104:leave();
                end;
            end;
        end;
        if v65.isEnabled ~= v97 then
            v65:setEnabled(v97);
        end;
        if v65.isEnabled and not v65.overflowAlreadyOpened then
            v65.overflowAlreadyOpened = true;
            v65:select();
        end;
        return;
    end;
end;
return v0;