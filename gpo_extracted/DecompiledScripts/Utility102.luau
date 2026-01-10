local v0 = {};
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
v0.createStagger = function(v2, v3, v4) --[[ Line: 13 ]] --[[ Name: createStagger ]]
    local v5 = false;
    local v6 = false;
    if not v2 or v2 == 0 then
        v2 = 0.01;
    end;
    local function v7(...) --[[ Line: 29 ]] --[[ Name: staggeredCallback ]]
        -- upvalues: v5 (ref), v6 (ref), v4 (copy), v2 (ref), v3 (copy), v7 (copy)
        if v5 then
            v6 = true;
            return;
        else
            local v8 = table.pack(...);
            v5 = true;
            v6 = false;
            task.spawn(function() --[[ Line: 37 ]]
                -- upvalues: v4 (ref), v2 (ref), v3 (ref), v8 (copy)
                if v4 then
                    task.wait(v2);
                end;
                v3(table.unpack(v8));
            end);
            task.delay(v2, function() --[[ Line: 43 ]]
                -- upvalues: v5 (ref), v6 (ref), v7 (ref), v8 (copy)
                v5 = false;
                if v6 then
                    v7(table.unpack(v8));
                end;
            end);
            return;
        end;
    end;
    return v7;
end;
v0.round = function(v9) --[[ Line: 55 ]] --[[ Name: round ]]
    return (math.floor(v9 + 0.5));
end;
v0.reverseTable = function(v10) --[[ Line: 60 ]] --[[ Name: reverseTable ]]
    for v11 = 1, math.floor(#v10 / 2) do
        local v12 = #v10 - v11 + 1;
        local v13 = v10[v12];
        local v14 = v10[v11];
        v10[v11] = v13;
        v10[v12] = v14;
    end;
end;
v0.copyTable = function(v15) --[[ Line: 67 ]] --[[ Name: copyTable ]]
    -- upvalues: v0 (copy)
    assert(type(v15) == "table", "First argument must be a table");
    local v16 = table.create(#v15);
    for v17, v18 in pairs(v15) do
        if type(v18) == "table" then
            v16[v17] = v0.copyTable(v18);
        else
            v16[v17] = v18;
        end;
    end;
    return v16;
end;
local v19 = {
    "a", 
    "b", 
    "c", 
    "d", 
    "e", 
    "f", 
    "g", 
    "h", 
    "i", 
    "j", 
    "k", 
    "l", 
    "m", 
    "n", 
    "o", 
    "p", 
    "q", 
    "r", 
    "s", 
    "t", 
    "u", 
    "v", 
    "w", 
    "x", 
    "y", 
    "z", 
    "A", 
    "B", 
    "C", 
    "D", 
    "E", 
    "F", 
    "G", 
    "H", 
    "I", 
    "J", 
    "K", 
    "L", 
    "M", 
    "N", 
    "O", 
    "P", 
    "Q", 
    "R", 
    "S", 
    "T", 
    "U", 
    "V", 
    "W", 
    "X", 
    "Y", 
    "Z", 
    "1", 
    "2", 
    "3", 
    "4", 
    "5", 
    "6", 
    "7", 
    "8", 
    "9", 
    "0", 
    "<", 
    ">", 
    "?", 
    "@", 
    "{", 
    "}", 
    "[", 
    "]", 
    "!", 
    "(", 
    ")", 
    "=", 
    "+", 
    "~", 
    "#"
};
v0.generateUID = function(v20) --[[ Line: 82 ]] --[[ Name: generateUID ]]
    -- upvalues: v19 (copy)
    v20 = v20 or 8;
    local v21 = "";
    local l_v19_0 = v19;
    local v23 = #l_v19_0;
    for _ = 1, v20 do
        v21 = v21 .. l_v19_0[math.random(1, v23)];
    end;
    return v21;
end;
local v25 = {};
v0.setVisible = function(v26, v27, v28) --[[ Line: 95 ]] --[[ Name: setVisible ]]
    -- upvalues: v25 (copy)
    local v29 = v25[v26];
    if not v29 then
        v29 = {};
        v25[v26] = v29;
        v26.Destroying:Once(function() --[[ Line: 104 ]]
            -- upvalues: v25 (ref), v26 (copy)
            v25[v26] = nil;
        end);
    end;
    if not v27 then
        v29[v28] = true;
    else
        v29[v28] = nil;
    end;
    local l_v27_0 = v27;
    if v27 then
        for _, _ in pairs(v29) do
            l_v27_0 = false;
            break;
        end;
    end;
    v26.Visible = l_v27_0;
end;
v0.formatStateName = function(v33) --[[ Line: 123 ]] --[[ Name: formatStateName ]]
    return string.upper((string.sub(v33, 1, 1))) .. string.lower((string.sub(v33, 2)));
end;
v0.localPlayerRespawned = function(v34) --[[ Line: 127 ]] --[[ Name: localPlayerRespawned ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    l_LocalPlayer_0.CharacterRemoving:Connect(v34);
end;
v0.getClippedContainer = function(v35) --[[ Line: 137 ]] --[[ Name: getClippedContainer ]]
    local l_ClippedContainer_0 = v35:FindFirstChild("ClippedContainer");
    if not l_ClippedContainer_0 then
        l_ClippedContainer_0 = Instance.new("Folder");
        l_ClippedContainer_0.Name = "ClippedContainer";
        l_ClippedContainer_0.Parent = v35;
    end;
    return l_ClippedContainer_0;
end;
local v37 = require(script.Parent.Packages.Janitor);
local l_GuiService_0 = game:GetService("GuiService");
v0.clipOutside = function(v39, v40) --[[ Line: 151 ]] --[[ Name: clipOutside ]]
    -- upvalues: v37 (copy), v0 (copy), l_GuiService_0 (copy)
    local v41 = v39.janitor:add(v37.new());
    v40.Destroying:Once(function() --[[ Line: 153 ]]
        -- upvalues: v41 (copy)
        v41:Destroy();
    end);
    v39.janitor:add(v40);
    local l_Parent_0 = v40.Parent;
    local v43 = v41:add(Instance.new("Frame"));
    v43:SetAttribute("IsAClippedClone", true);
    v43.Name = v40.Name;
    v43.AnchorPoint = v40.AnchorPoint;
    v43.Size = v40.Size;
    v43.Position = v40.Position;
    v43.BackgroundTransparency = 1;
    v43.LayoutOrder = v40.LayoutOrder;
    v43.Parent = l_Parent_0;
    local l_ObjectValue_0 = Instance.new("ObjectValue");
    l_ObjectValue_0.Name = "OriginalInstance";
    l_ObjectValue_0.Value = v40;
    l_ObjectValue_0.Parent = v43;
    local v45 = l_ObjectValue_0:Clone();
    v40:SetAttribute("HasAClippedClone", true);
    v45.Name = "ClippedClone";
    v45.Value = v43;
    v45.Parent = v40;
    local v46 = nil;
    local v47 = require(v39.iconModule);
    local l_container_0 = v47.container;
    local function v50() --[[ Line: 183 ]] --[[ Name: updateScreenGui ]]
        -- upvalues: l_Parent_0 (copy), v46 (ref), l_container_0 (copy), v40 (copy), v0 (ref)
        local l_l_Parent_0_FirstAncestorWhichIsA_0 = l_Parent_0:FindFirstAncestorWhichIsA("ScreenGui");
        v46 = if string.match(l_l_Parent_0_FirstAncestorWhichIsA_0.Name, "Clipped") then l_l_Parent_0_FirstAncestorWhichIsA_0 else l_container_0[l_l_Parent_0_FirstAncestorWhichIsA_0.Name .. "Clipped"];
        v40.AnchorPoint = Vector2.new(0, 0);
        v40.Parent = v0.getClippedContainer(v46);
    end;
    v41:add(v39.alignmentChanged:Connect(v50));
    v50();
    for _, v52 in pairs(v40:GetChildren()) do
        if v52:IsA("UIAspectRatioConstraint") then
            v52:Clone().Parent = v43;
        end;
    end;
    local l_widget_0 = v39.widget;
    local v54 = false;
    local l_v40_Attribute_0 = v40:GetAttribute("IgnoreVisibilityUpdater");
    local function v57() --[[ Line: 205 ]] --[[ Name: updateVisibility ]]
        -- upvalues: l_v40_Attribute_0 (copy), l_widget_0 (copy), v54 (ref), v0 (ref), v40 (copy)
        if l_v40_Attribute_0 then
            return;
        else
            local l_Visible_0 = l_widget_0.Visible;
            if v54 then
                l_Visible_0 = false;
            end;
            v0.setVisible(v40, l_Visible_0, "ClipHandler");
            return;
        end;
    end;
    v41:add(l_widget_0:GetPropertyChangedSignal("Visible"):Connect(v57));
    local v58 = nil;
    local function v59() --[[ Line: 218 ]] --[[ Name: checkIfOutsideParentXBounds ]]
        -- upvalues: v39 (copy), v40 (copy), v47 (copy), v54 (ref), l_v40_Attribute_0 (copy), l_widget_0 (copy), v0 (ref), v58 (ref), v59 (copy), v41 (copy)
        task.defer(function() --[[ Line: 220 ]]
            -- upvalues: v39 (ref), v40 (ref), v47 (ref), v54 (ref), l_v40_Attribute_0 (ref), l_widget_0 (ref), v0 (ref), v58 (ref), v59 (ref), v41 (ref)
            local v60 = nil;
            local l_UID_0 = v39.UID;
            local l_l_UID_0_0 = l_UID_0;
            if v40:GetAttribute("ClipToJoinedParent") then
                for _ = 1, 10 do
                    local v64 = v47.getIconByUID(l_l_UID_0_0);
                    if v64 then
                        local l_joinedFrame_0 = v64.joinedFrame;
                        l_l_UID_0_0 = v64.parentIconUID;
                        if l_joinedFrame_0 then
                            v60 = l_joinedFrame_0;
                            if v60 and v60.Name == "DropdownScroller" then
                                break;
                            end;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                end;
            end;
            if not v60 then
                v54 = false;
                if l_v40_Attribute_0 then
                    return;
                else
                    local l_Visible_1 = l_widget_0.Visible;
                    if v54 then
                        l_Visible_1 = false;
                    end;
                    v0.setVisible(v40, l_Visible_1, "ClipHandler");
                    return;
                end;
            else
                local l_AbsolutePosition_0 = v40.AbsolutePosition;
                local v68 = v40.AbsoluteSize / 2;
                local l_AbsolutePosition_1 = v60.AbsolutePosition;
                local l_AbsoluteSize_0 = v60.AbsoluteSize;
                local v71 = l_AbsolutePosition_0 + v68;
                local v72 = v71.X < l_AbsolutePosition_1.X;
                local v73 = v71.X > l_AbsolutePosition_1.X + l_AbsoluteSize_0.X;
                local v74 = v71.Y < l_AbsolutePosition_1.Y;
                local v75 = v71.Y > l_AbsolutePosition_1.Y + l_AbsoluteSize_0.Y;
                local v76 = v72 or v73 or v74 or v75;
                if v76 ~= v54 then
                    v54 = v76;
                    if not l_v40_Attribute_0 then
                        local l_Visible_2 = l_widget_0.Visible;
                        if v54 then
                            l_Visible_2 = false;
                        end;
                        v0.setVisible(v40, l_Visible_2, "ClipHandler");
                    end;
                end;
                if v60:IsA("ScrollingFrame") and v58 ~= v60 then
                    v58 = v60;
                    local v78 = v60:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 265 ]]
                        -- upvalues: v59 (ref)
                        v59();
                    end);
                    v41:add(v78, "Disconnect", "TrackUtilityScroller-" .. l_UID_0);
                end;
                return;
            end;
        end);
    end;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v80 = v40:GetAttribute("AdditionalOffsetX") or 0;
    local function v114(v81) --[[ Line: 275 ]] --[[ Name: trackProperty ]]
        -- upvalues: v43 (copy), l_CurrentCamera_0 (copy), v40 (copy), l_GuiService_0 (ref), v46 (ref), v47 (copy), v80 (copy), v39 (copy), v54 (ref), l_v40_Attribute_0 (copy), l_widget_0 (copy), v0 (ref), v58 (ref), v59 (copy), v41 (copy)
        local v82 = "Absolute" .. v81;
        local function v111() --[[ Line: 277 ]] --[[ Name: updateProperty ]]
            -- upvalues: v43 (ref), v82 (copy), v81 (copy), l_CurrentCamera_0 (ref), v40 (ref), l_GuiService_0 (ref), v46 (ref), v47 (ref), v80 (ref), v39 (ref), v54 (ref), l_v40_Attribute_0 (ref), l_widget_0 (ref), v0 (ref), v58 (ref), v59 (ref), v41 (ref)
            local v83 = v43[v82];
            local v84 = UDim2.fromOffset(v83.X, v83.Y);
            if v81 == "Position" then
                local v85 = l_CurrentCamera_0.ViewportSize.X - v40.AbsoluteSize.X - 4;
                local l_Offset_0 = v84.X.Offset;
                if l_Offset_0 < 4 then
                    l_Offset_0 = 4;
                elseif v85 < l_Offset_0 then
                    l_Offset_0 = v85;
                end;
                v84 = UDim2.fromOffset(l_Offset_0, v84.Y.Offset);
                local l_TopbarInset_0 = l_GuiService_0.TopbarInset;
                local l_X_0 = workspace.CurrentCamera.ViewportSize.X;
                local l_X_1 = v46.AbsoluteSize.X;
                local l_X_2 = v46.AbsolutePosition.X;
                local v91 = (if v47.isOldTopbar then l_X_2 else l_X_0 - l_X_1 - 0) - v80;
                v84 = v84 + UDim2.fromOffset(-v91, l_TopbarInset_0.Height);
                task.defer(function() --[[ Line: 220 ]]
                    -- upvalues: v39 (ref), v40 (ref), v47 (ref), v54 (ref), l_v40_Attribute_0 (ref), l_widget_0 (ref), v0 (ref), v58 (ref), v59 (ref), v41 (ref)
                    local v92 = nil;
                    local l_UID_1 = v39.UID;
                    local l_l_UID_1_0 = l_UID_1;
                    if v40:GetAttribute("ClipToJoinedParent") then
                        for _ = 1, 10 do
                            local v96 = v47.getIconByUID(l_l_UID_1_0);
                            if v96 then
                                local l_joinedFrame_1 = v96.joinedFrame;
                                l_l_UID_1_0 = v96.parentIconUID;
                                if l_joinedFrame_1 then
                                    v92 = l_joinedFrame_1;
                                    if v92 and v92.Name == "DropdownScroller" then
                                        break;
                                    end;
                                else
                                    break;
                                end;
                            else
                                break;
                            end;
                        end;
                    end;
                    if not v92 then
                        v54 = false;
                        if l_v40_Attribute_0 then
                            return;
                        else
                            local l_Visible_3 = l_widget_0.Visible;
                            if v54 then
                                l_Visible_3 = false;
                            end;
                            v0.setVisible(v40, l_Visible_3, "ClipHandler");
                            return;
                        end;
                    else
                        local l_AbsolutePosition_2 = v40.AbsolutePosition;
                        local v100 = v40.AbsoluteSize / 2;
                        local l_AbsolutePosition_3 = v92.AbsolutePosition;
                        local l_AbsoluteSize_1 = v92.AbsoluteSize;
                        local v103 = l_AbsolutePosition_2 + v100;
                        local v104 = v103.X < l_AbsolutePosition_3.X;
                        local v105 = v103.X > l_AbsolutePosition_3.X + l_AbsoluteSize_1.X;
                        local v106 = v103.Y < l_AbsolutePosition_3.Y;
                        local v107 = v103.Y > l_AbsolutePosition_3.Y + l_AbsoluteSize_1.Y;
                        local v108 = v104 or v105 or v106 or v107;
                        if v108 ~= v54 then
                            v54 = v108;
                            if not l_v40_Attribute_0 then
                                local l_Visible_4 = l_widget_0.Visible;
                                if v54 then
                                    l_Visible_4 = false;
                                end;
                                v0.setVisible(v40, l_Visible_4, "ClipHandler");
                            end;
                        end;
                        if v92:IsA("ScrollingFrame") and v58 ~= v92 then
                            v58 = v92;
                            local v110 = v92:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 265 ]]
                                -- upvalues: v59 (ref)
                                v59();
                            end);
                            v41:add(v110, "Disconnect", "TrackUtilityScroller-" .. l_UID_1);
                        end;
                        return;
                    end;
                end);
            end;
            v40[v81] = v84;
        end;
        local v112 = v0.createStagger(0.01, v111);
        v41:add(v43:GetPropertyChangedSignal(v82):Connect(v112));
        v41:add(v43:GetAttributeChangedSignal("ForceUpdate"):Connect(function() --[[ Line: 317 ]]
            -- upvalues: v112 (copy)
            v112();
        end));
        local v113 = v0.createStagger(0.5, v111, true);
        v41:add(v43:GetPropertyChangedSignal(v82):Connect(v113));
        if v81 == "Position" then
            v41:add(v46:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 336 ]]
                -- upvalues: v112 (copy)
                v112();
            end));
        end;
    end;
    task.delay(0.1, v59);
    task.defer(function() --[[ Line: 220 ]]
        -- upvalues: v39 (copy), v40 (copy), v47 (copy), v54 (ref), l_v40_Attribute_0 (copy), l_widget_0 (copy), v0 (ref), v58 (ref), v59 (copy), v41 (copy)
        local v115 = nil;
        local l_UID_2 = v39.UID;
        local l_l_UID_2_0 = l_UID_2;
        if v40:GetAttribute("ClipToJoinedParent") then
            for _ = 1, 10 do
                local v119 = v47.getIconByUID(l_l_UID_2_0);
                if v119 then
                    local l_joinedFrame_2 = v119.joinedFrame;
                    l_l_UID_2_0 = v119.parentIconUID;
                    if l_joinedFrame_2 then
                        v115 = l_joinedFrame_2;
                        if v115 and v115.Name == "DropdownScroller" then
                            break;
                        end;
                    else
                        break;
                    end;
                else
                    break;
                end;
            end;
        end;
        if not v115 then
            v54 = false;
            if l_v40_Attribute_0 then
                return;
            else
                local l_Visible_5 = l_widget_0.Visible;
                if v54 then
                    l_Visible_5 = false;
                end;
                v0.setVisible(v40, l_Visible_5, "ClipHandler");
                return;
            end;
        else
            local l_AbsolutePosition_4 = v40.AbsolutePosition;
            local v123 = v40.AbsoluteSize / 2;
            local l_AbsolutePosition_5 = v115.AbsolutePosition;
            local l_AbsoluteSize_2 = v115.AbsoluteSize;
            local v126 = l_AbsolutePosition_4 + v123;
            local v127 = v126.X < l_AbsolutePosition_5.X;
            local v128 = v126.X > l_AbsolutePosition_5.X + l_AbsoluteSize_2.X;
            local v129 = v126.Y < l_AbsolutePosition_5.Y;
            local v130 = v126.Y > l_AbsolutePosition_5.Y + l_AbsoluteSize_2.Y;
            local v131 = v127 or v128 or v129 or v130;
            if v131 ~= v54 then
                v54 = v131;
                if not l_v40_Attribute_0 then
                    local l_Visible_6 = l_widget_0.Visible;
                    if v54 then
                        l_Visible_6 = false;
                    end;
                    v0.setVisible(v40, l_Visible_6, "ClipHandler");
                end;
            end;
            if v115:IsA("ScrollingFrame") and v58 ~= v115 then
                v58 = v115;
                local v133 = v115:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 265 ]]
                    -- upvalues: v59 (ref)
                    v59();
                end);
                v41:add(v133, "Disconnect", "TrackUtilityScroller-" .. l_UID_2);
            end;
            return;
        end;
    end);
    if not l_v40_Attribute_0 then
        local l_Visible_7 = l_widget_0.Visible;
        if v54 then
            l_Visible_7 = false;
        end;
        v0.setVisible(v40, l_Visible_7, "ClipHandler");
    end;
    v114("Position");
    v41:add(v40:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 348 ]]

    end));
    if v40:GetAttribute("TrackCloneSize") then
        v114("Size");
    else
        v41:add(v40:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 358 ]]
            -- upvalues: v40 (copy), v43 (copy)
            local l_AbsoluteSize_3 = v40.AbsoluteSize;
            v43.Size = UDim2.fromOffset(l_AbsoluteSize_3.X, l_AbsoluteSize_3.Y);
        end));
    end;
    return v43;
end;
v0.joinFeature = function(v136, v137, v138, v139) --[[ Line: 367 ]] --[[ Name: joinFeature ]]
    local l_joinJanitor_0 = v136.joinJanitor;
    l_joinJanitor_0:clean();
    if not v139 then
        v136:leave();
        return;
    else
        v136.parentIconUID = v137.UID;
        v136.joinedFrame = v139;
        l_joinJanitor_0:add(v137.alignmentChanged:Connect(function() --[[ Line: 378 ]] --[[ Name: updateAlignent ]]
            -- upvalues: v137 (copy), v136 (copy)
            local l_alignment_0 = v137.alignment;
            if l_alignment_0 == "Center" then
                l_alignment_0 = "Left";
            end;
            v136:setAlignment(l_alignment_0, true);
        end));
        local l_alignment_1 = v137.alignment;
        if l_alignment_1 == "Center" then
            l_alignment_1 = "Left";
        end;
        v136:setAlignment(l_alignment_1, true);
        v136:modifyTheme({
            "IconButton", 
            "BackgroundTransparency", 
            1
        }, "JoinModification");
        v136:modifyTheme({
            "ClickRegion", 
            "Active", 
            false
        }, "JoinModification");
        if v137.childModifications then
            task.defer(function() --[[ Line: 393 ]]
                -- upvalues: v136 (copy), v137 (copy)
                v136:modifyTheme(v137.childModifications, v137.childModificationsUID);
            end);
        end;
        l_alignment_1 = v136:getInstance("ClickRegion");
        local function v143() --[[ Line: 399 ]] --[[ Name: makeSelectable ]]
            -- upvalues: l_alignment_1 (copy), v137 (copy)
            if l_alignment_1 then
                l_alignment_1.Selectable = v137.isSelected;
            end;
        end;
        l_joinJanitor_0:add(v137.toggled:Connect(v143));
        task.defer(v143);
        l_joinJanitor_0:add(function() --[[ Line: 406 ]]
            -- upvalues: l_alignment_1 (copy)
            if l_alignment_1 then
                l_alignment_1.Selectable = true;
            end;
        end);
        local l_UID_3 = v136.UID;
        table.insert(v138, l_UID_3);
        v137:autoDeselect(false);
        v137.childIconsDict[l_UID_3] = true;
        if not v137.isEnabled then
            v137:setEnabled(true);
        end;
        v136.joinedParent:Fire(v137);
        l_joinJanitor_0:add(function() --[[ Line: 426 ]]
            -- upvalues: v136 (copy), v138 (copy), l_UID_3 (copy), v137 (copy)
            if not v136.joinedFrame then
                return;
            else
                for v145, v146 in pairs(v138) do
                    if v146 == l_UID_3 then
                        table.remove(v138, v145);
                        break;
                    end;
                end;
                local v147 = require(v136.iconModule).getIconByUID(v136.parentIconUID);
                if not v147 then
                    return;
                else
                    v136:setAlignment(v136.originalAlignment);
                    v136.parentIconUID = false;
                    v136.joinedFrame = false;
                    v136:removeModification("JoinModification");
                    local v148 = true;
                    local l_childIconsDict_0 = v147.childIconsDict;
                    l_childIconsDict_0[l_UID_3] = nil;
                    for _, _ in pairs(l_childIconsDict_0) do
                        v148 = false;
                        break;
                    end;
                    if v148 and not v147.isAnOverflow then
                        v147:setEnabled(false);
                    end;
                    local l_alignment_2 = v137.alignment;
                    if l_alignment_2 == "Center" then
                        l_alignment_2 = "Left";
                    end;
                    v136:setAlignment(l_alignment_2, true);
                    return;
                end;
            end;
        end);
        return;
    end;
end;
return v0;